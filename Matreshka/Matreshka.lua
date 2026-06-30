-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

local textColorCodes = {
    ["[q]"] = "|cFFFFD100",
    ["[q0]"] = "|cFF9D9D9D",
    ["[q2]"] = "|cFF00FF00",
    ["[q3]"] = "|cFF0070DD",
    ["[q4]"] = "|cFFA335EE",
    ["[q5]"] = "|cFFFF8000"
}

-- Helper functions
-- Escape every Lua pattern metacharacter so arbitrary text matches literally.
local function escapeMagic(s)
    return (s:gsub("(%W)", "%%%1"))
end

-- Extract the numeric item id from an item hyperlink (".../Hitem:1234:...").
local function GetItemIDFromLink(itemLink)
    return tonumber(itemLink:match("item:(%d+)"))
end

local function GetDataByID(entityType, dataId)
    local languageCode = MatreshkaOptions["SELECTED_LANGUAGE"]
    return Matreshka_GetEntry(entityType, languageCode, dataId)
end

-- Apply a user override (in-game edit) on top of the base database for one entity
local function GetEffectiveEntry(userType, id)
    local languageCode = MatreshkaOptions["SELECTED_LANGUAGE"]
    local userData = MatreshkaUserData
    local override = userData and userData[userType] and userData[userType][languageCode]
        and userData[userType][languageCode][tonumber(id)]

    if override then
        return override
    end

    return GetDataByID(userType, id)
end

-- Called by the editor after a save/reset so the next tooltip rebuilds with the new text
function Matreshka_InvalidateTooltipCache()
    if GameTooltip then
        GameTooltip.matreshkaCacheKey = nil
        GameTooltip.matreshkaMap = nil
        GameTooltip.matreshkaLineCount = nil
    end
end

-- Item, spell and unit functions
local function ShowOnlyTitleTranslation(type)
    return MatreshkaOptions[type:upper() .. "_TRANSLATIONS_ONLY_DISPLAY_NAME"]
end

-- Translate the native GameTooltip in place by matching its lines against our database (single window, no English duplicate)
local function StripColorMarkers(line)
    for pattern in pairs(textColorCodes) do
        line = line:gsub(escapeMagic(pattern), "")
    end

    return line
end

-- Normalize a line for matching: drop |c..|r colors, [qX] markers and surrounding whitespace
local function NormalizeForLookup(text)
    if not text then
        return nil
    end

    text = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
    text = StripColorMarkers(text)
    text = text:gsub("^%s+", ""):gsub("%s+$", "")

    return text
end

-- Ordered numeric tokens (including decimals) of a line
local function ExtractNumbers(text)
    local numbers = {}

    for number in text:gmatch("%d[%d%.]*") do
        table.insert(numbers, number)
    end

    return numbers
end

-- Looser match key: ignores number and whitespace differences between the translation
-- database and the live client (e.g. "243.6" vs "243", "Liver , Mild" vs "Liver, Mild")
local function FuzzyKey(text)
    if not text then
        return nil
    end

    -- The database stores spell scaling as a literal formula in square brackets
    -- ("[0.00743 * ... ]"), but the live client renders that slot as a plain number.
    -- Collapse the formula to a single numeric token so the lines still match.
    text = text:gsub("%b[]", " 0 ")

    return text:gsub("%d[%d%.]*", "#"):gsub("%s+", ""):lower()
end

-- Put the numbers the live client actually shows back into the translated line
-- (spell descriptions scale with stats, so the database value can be stale)
local function ApplyLiveNumbers(translatedText, liveNumbers)
    if #liveNumbers == 0 or #ExtractNumbers(translatedText) ~= #liveNumbers then
        return translatedText
    end

    local index = 0

    return (translatedText:gsub("%d[%d%.]*", function()
        index = index + 1
        return liveNumbers[index]
    end))
end

-- Drop a trailing "(...)" group, e.g. the database bundles "(2 Min Cooldown)" onto the
-- "Use:" line but the live client shows it separately or not at all
local function StripTrailingParen(text)
    return (text:gsub("%s*%b()%s*$", ""))
end

local function GetTooltipLeftText(tooltip, lineIndex)
    local fontString = _G[tooltip:GetName() .. "TextLeft" .. lineIndex]
    return fontString and fontString:GetText()
end

-- Lazy index: normalized english spell name -> list of spell ids (used for talents, whose spell
-- id is not resolvable). A name is shared across ranks AND across same-named talents of other
-- classes, so all ids are kept and later merged.
local spellNameIndex = nil
local spellNameIndexLanguage = nil

local function GetSpellIdsByName(spellName)
    if not spellName or spellName == "" then
        return nil
    end

    local languageCode = MatreshkaOptions["SELECTED_LANGUAGE"]

    if spellNameIndex == nil or spellNameIndexLanguage ~= languageCode then
        spellNameIndex = {}
        spellNameIndexLanguage = languageCode

        local englishData = Matreshka_GetBucket("spell", "en")
        local translatedData = Matreshka_GetBucket("spell", languageCode)

        if englishData and translatedData then
            for id, englishRow in pairs(englishData) do
                if englishRow[1] and translatedData[id] then
                    local key = NormalizeForLookup(englishRow[1])
                    local list = spellNameIndex[key]

                    if not list then
                        list = {}
                        spellNameIndex[key] = list
                    end

                    list[#list + 1] = id
                end
            end
        end
    end

    return spellNameIndex[NormalizeForLookup(spellName)]
end

-- Register one english -> translated pair under both the exact and the fuzzy key
local function AddPair(map, englishText, translatedText)
    local normalized = NormalizeForLookup(englishText)
    map.exact[normalized] = translatedText
    map.fuzzy[FuzzyKey(normalized)] = translatedText

    -- Also index the line without its trailing "(...)" so a live line that lacks the
    -- bundled suffix (e.g. cooldown) still matches; only add when something remains
    local withoutParen = StripTrailingParen(normalized)

    if withoutParen ~= normalized and withoutParen ~= "" then
        local fuzzyKey = FuzzyKey(withoutParen)

        if map.fuzzy[fuzzyKey] == nil then
            map.fuzzy[fuzzyKey] = StripTrailingParen(translatedText)
        end
    end
end

-- Add english-line -> translated-line pairs into the lookup (handles "{left} {right}" two-column lines)
local function AddLinesToMap(map, englishText, translatedText)
    if not englishText or not translatedText then
        return
    end

    local englishLines = {}
    local translatedLines = {}

    for line in englishText:gmatch("[^\r\n]+") do
        table.insert(englishLines, line)
    end

    for line in translatedText:gmatch("[^\r\n]+") do
        table.insert(translatedLines, line)
    end

    for i = 1, math.min(#englishLines, #translatedLines) do
        local enLeft, enRight = englishLines[i]:match("{(.-)}%s-{(.-)}")
        local trLeft, trRight = translatedLines[i]:match("{(.-)}%s-{(.-)}")

        if enLeft and enRight and trLeft and trRight then
            AddPair(map, enLeft, StripColorMarkers(trLeft))
            AddPair(map, enRight, StripColorMarkers(trRight))
        else
            AddPair(map, englishLines[i], StripColorMarkers(translatedLines[i]))
        end
    end
end

-- Build the english -> translated lookup for one entity (or add into an existing map)
local function BuildEntityMap(englishEntry, translatedEntry, nameOnly, map)
    map = map or { exact = {}, fuzzy = {} }

    if englishEntry and translatedEntry then
        if englishEntry.name and translatedEntry.name then
            AddPair(map, englishEntry.name, StripColorMarkers(translatedEntry.name))
        end

        if not nameOnly then
            AddLinesToMap(map, englishEntry.additional_info, translatedEntry.additional_info)

            if englishEntry.subname and translatedEntry.subname then
                AddPair(map, englishEntry.subname, StripColorMarkers(translatedEntry.subname))
            end
        end
    end

    return map
end

-- For the name fallback (talents and unresolvable spells): one english name can map to several
-- entries — different ranks, and even same-named talents of other classes with a wholly different
-- description. Merge them all into one lookup so the description the live tooltip actually shows is
-- matched, whichever variant it is.
local function BuildSpellNameMap(spellName, nameOnly)
    local ids = GetSpellIdsByName(spellName)

    if not ids then
        return nil
    end

    local map = { exact = {}, fuzzy = {} }

    for i = 1, #ids do
        local id = ids[i]
        BuildEntityMap(Matreshka_GetEntry("spell", "en", id), GetEffectiveEntry("spell", id), nameOnly, map)
    end

    return map
end

-- Find the translation for one live tooltip line: exact match first, then a
-- number/whitespace-tolerant fuzzy match that re-applies the live numbers
local function LookupTranslation(map, liveText)
    if not liveText then
        return nil
    end

    local normalized = NormalizeForLookup(liveText)
    local exact = map.exact[normalized]

    if exact then
        return exact
    end

    local liveFuzzy = FuzzyKey(normalized)
    local fuzzy = map.fuzzy[liveFuzzy]

    if fuzzy then
        return ApplyLiveNumbers(fuzzy, ExtractNumbers(normalized))
    end

    -- Shared-prefix fallback: a long description line where the live client and the database agree
    -- on a substantial leading run but diverge somewhere (a dynamic word like a bound city, a
    -- trailing "Lasts X", or a differently rendered value). The map holds only THIS entity's own
    -- lines, and only its description is long enough to clear the threshold, so a hit can neither
    -- cross-match another entity nor pick the wrong line within this one.
    if liveFuzzy and #liveFuzzy >= 25 then
        for key, value in pairs(map.fuzzy) do
            if #key >= 25 then
                local limit = math.min(#key, #liveFuzzy)
                local shared = 0

                while shared < limit and key:byte(shared + 1) == liveFuzzy:byte(shared + 1) do
                    shared = shared + 1
                end

                if shared >= 25 then
                    return ApplyLiveNumbers(value, ExtractNumbers(normalized))
                end
            end
        end
    end

    return nil
end

-- Walk the native tooltip lines and translate only those whose text we recognize (leaves everything else untouched)
local function TranslateTooltipInPlace(tooltip, map)
    if not next(map.exact) and not next(map.fuzzy) then
        return
    end

    local tooltipName = tooltip:GetName()
    local numLines = tooltip:NumLines()

    for i = 1, numLines do
        local leftFontString = _G[tooltipName .. "TextLeft" .. i]

        if leftFontString then
            local translated = LookupTranslation(map, leftFontString:GetText())

            if translated then
                leftFontString:SetText(translated)
            end
        end

        local rightFontString = _G[tooltipName .. "TextRight" .. i]

        if rightFontString then
            local translated = LookupTranslation(map, rightFontString:GetText())

            if translated then
                rightFontString:SetText(translated)
                rightFontString:Show()
            end
        end
    end

    tooltip:Show()
end

-- Translate and remember the entity map + line count, so OnUpdate can re-translate when the
-- client (or any addon) adds lines AFTER this pass — e.g. recipe reagents resolve asynchronously
local function TranslateAndRecord(tooltip, cacheKey, map)
    tooltip.matreshkaCacheKey = cacheKey
    tooltip.matreshkaMap = map
    TranslateTooltipInPlace(tooltip, map)
    tooltip.matreshkaLineCount = tooltip:NumLines()
end

-- Append our extra lines (entity ID for bug reports, and/or the original item name) once, at the
-- very bottom of the tooltip. Called from OnUpdate so it runs after every addon's synchronous
-- OnTooltipSetItem additions, keeping our lines last.
local function AppendBottomLines(tooltip)
    if tooltip.matreshkaBottomAdded then
        return
    end

    tooltip.matreshkaBottomAdded = true
    local added = false

    if tooltip.matreshkaIdText then
        tooltip:AddLine(tooltip.matreshkaIdText, 0.6, 0.6, 0.6)
        added = true
    end

    if tooltip.matreshkaAuctionName then
        tooltip:AddLine("Auction name: " .. tooltip.matreshkaAuctionName, 0.6, 0.6, 0.6)
        added = true
    end

    if added then
        tooltip.matreshkaLineCount = tooltip:NumLines()
        tooltip:Show()
    end
end

-- Missing-translation collector: when scanning is on, remember every entity that has no
-- translation for the current language, so the gaps can be exported (/mtmissing) and filled
-- from the official source. Stored in the MatreshkaMissing saved variable.
local function RecordMissing(entityType, id, englishName)
    if not id or not (MatreshkaOptions and MatreshkaOptions["SCAN_MISSING"]) then
        return
    end

    MatreshkaMissing = MatreshkaMissing or {}
    local bucket = entityType .. ":" .. (MatreshkaOptions["SELECTED_LANGUAGE"] or "ru")
    MatreshkaMissing[bucket] = MatreshkaMissing[bucket] or {}

    if englishName and englishName ~= "" then
        MatreshkaMissing[bucket][tostring(id)] = englishName
    elseif MatreshkaMissing[bucket][tostring(id)] == nil then
        MatreshkaMissing[bucket][tostring(id)] = true
    end
end

-- Random-suffix green items ("... of the X"): the base item is in the database, but the client
-- builds the displayed name and the bonus stat lines from a random suffix the database does not
-- carry. These tables translate the suffix word in the name and the "+N <stat>" lines.
local SUFFIX_NAMES = {
    ["of the Eagle"]   = "Орла",
    ["of the Bear"]    = "Медведя",
    ["of the Gorilla"] = "Гориллы",
    ["of the Tiger"]   = "Тигра",
    ["of the Monkey"]  = "Обезьяны",
    ["of the Falcon"]  = "Сокола",
    ["of the Wolf"]    = "Волка",
    ["of the Boar"]    = "Вепря",
    ["of the Whale"]   = "Кита",
    ["of the Owl"]     = "Совы",
    ["of the Bandit"]  = "Бандита",
    ["of Strength"]    = "Силы",
    ["of Agility"]     = "Ловкости",
    ["of Stamina"]     = "Выносливости",
    ["of Intellect"]   = "Интеллекта",
    ["of Spirit"]      = "Духа",
    ["of Power"]       = "Мощи",
    ["of Defense"]     = "Защиты",
}

local SUFFIX_STATS = {
    ["Strength"]  = "силе",
    ["Agility"]   = "ловкости",
    ["Stamina"]   = "выносливости",
    ["Intellect"] = "интеллекту",
    ["Spirit"]    = "духу",
}

-- Add random-suffix translations into an item's map: the bonus stat lines (always) and, when the
-- live name is the base name plus a known suffix, the full translated name.
local function AddItemSuffixTranslations(map, tooltip, englishEntry, translatedEntry)
    for statEn, statRu in pairs(SUFFIX_STATS) do
        AddPair(map, "+1 " .. statEn, "+1 к " .. statRu)
    end

    if not (englishEntry and englishEntry.name and translatedEntry and translatedEntry.name) then
        return
    end

    local liveName = GetTooltipLeftText(tooltip, 1)

    if not liveName then
        return
    end

    local liveNorm = NormalizeForLookup(liveName)
    local baseEn = NormalizeForLookup(englishEntry.name)

    if baseEn and baseEn ~= "" and #liveNorm > #baseEn and liveNorm:sub(1, #baseEn) == baseEn then
        local suffix = liveNorm:sub(#baseEn + 1):gsub("^%s+", "")
        local suffixRu = SUFFIX_NAMES[suffix]

        if suffixRu then
            AddPair(map, liveName, StripColorMarkers(translatedEntry.name) .. " " .. suffixRu)
        end
    end
end

local function HandleItemTooltip(tooltip)
    if not MatreshkaOptions or not MatreshkaOptions["ITEM_TRANSLATIONS"] then
        return
    end

    local itemName, itemLink = tooltip:GetItem()

    if not itemLink then
        return
    end

    local itemID = GetItemIDFromLink(itemLink)

    if not itemID then
        return
    end

    -- ID for bug reports: recorded before the translation check so it shows on untranslated items too
    if MatreshkaOptions["SHOW_IDS"] then
        tooltip.matreshkaIdText = "Item ID: " .. itemID
    end

    local cacheKey = "item:" .. itemID

    if tooltip.matreshkaCacheKey == cacheKey then
        return
    end

    local translatedEntry = GetEffectiveEntry("item", itemID)

    if not translatedEntry then
        RecordMissing("item", itemID, itemName)
        return
    end

    local englishEntry = Matreshka_GetEntry("item", "en", itemID)

    -- The auction house and search boxes query by the client's native (enUS) item name, but we
    -- replace the name with the translation. Remember the original; the actual line is appended
    -- from OnUpdate (next frame) so it lands below the lines other addons add synchronously while
    -- the tooltip is being built (e.g. vendor/auction prices, bag counts).
    if itemName and itemName ~= "" and tooltip == GameTooltip then
        tooltip.matreshkaAuctionName = itemName
    end

    local map = BuildEntityMap(englishEntry, translatedEntry, ShowOnlyTitleTranslation("item"))
    AddItemSuffixTranslations(map, tooltip, englishEntry, translatedEntry)
    TranslateAndRecord(tooltip, cacheKey, map)
end

local function HandleSpellTooltip(tooltip)
    if not MatreshkaOptions or not MatreshkaOptions["SPELL_TRANSLATIONS"] then
        return
    end

    local _, spellID = tooltip:GetSpell()

    if MatreshkaOptions["SHOW_IDS"] and spellID then
        tooltip.matreshkaIdText = "Spell ID: " .. spellID
    end

    -- Normal spells resolve by id directly.
    local translatedEntry = spellID and GetEffectiveEntry("spell", spellID)

    if translatedEntry then
        local cacheKey = "spell:" .. spellID

        if tooltip.matreshkaCacheKey == cacheKey then
            return
        end

        local englishEntry = Matreshka_GetEntry("spell", "en", spellID)
        TranslateAndRecord(tooltip, cacheKey, BuildEntityMap(englishEntry, translatedEntry, ShowOnlyTitleTranslation("spell")))
        return
    end

    -- Talents (and spells whose id is not resolvable) translate by name. One name can cover several
    -- ranks and even same-named talents of other classes, so all variants are merged into one map
    -- and the live description matches its own.
    local nameLine = GetTooltipLeftText(tooltip, 1)
    local nameKey = nameLine and NormalizeForLookup(nameLine)

    if nameKey and nameKey ~= "" then
        local cacheKey = "spellname:" .. nameKey

        if tooltip.matreshkaCacheKey == cacheKey then
            return
        end

        local map = BuildSpellNameMap(nameLine, ShowOnlyTitleTranslation("spell"))

        if map and (next(map.exact) or next(map.fuzzy)) then
            TranslateAndRecord(tooltip, cacheKey, map)
            return
        end
    end

    RecordMissing("spell", spellID, nameLine)
end

local function HandleUnitTooltip(tooltip)
    if not MatreshkaOptions or not MatreshkaOptions["NPC_TRANSLATIONS"] then
        return
    end

    local _, unit = tooltip:GetUnit()
    local unitGUID = (unit and UnitGUID(unit)) or UnitGUID("mouseover")

    if not unitGUID then
        return
    end

    local unitType, _, _, _, _, npcID = strsplit("-", unitGUID)

    if unitType ~= "Creature" or not npcID then
        return
    end

    if MatreshkaOptions["SHOW_IDS"] then
        tooltip.matreshkaIdText = "NPC ID: " .. npcID
    end

    local cacheKey = "npc:" .. npcID

    if tooltip.matreshkaCacheKey == cacheKey then
        return
    end

    local translatedEntry = GetEffectiveEntry("npc", npcID)

    if not translatedEntry then
        RecordMissing("npc", npcID, GetTooltipLeftText(tooltip, 1))
        return
    end

    local englishEntry = Matreshka_GetEntry("npc", "en", npcID)

    TranslateAndRecord(tooltip, cacheKey, BuildEntityMap(englishEntry, translatedEntry, ShowOnlyTitleTranslation("npc")))
end

-- Quest translation: substitute the native quest frame text with the translation in place
local function GetReplacementForCurrentQuestGiver(field)
    if not MatreshkaOptions
        or not MatreshkaOptions["QUEST_TRANSLATIONS"] then
        return nil
    end

    local questData = GetDataByID("quest", GetQuestID())

    if questData and questData[field] and questData[field] ~= "" then
        return questData[field]
    end

    return nil
end

local function HookQuestGiverText(globalFunctionName, field)
    local originalFunction = _G[globalFunctionName]

    if not originalFunction then
        return
    end

    _G[globalFunctionName] = function(...)
        return GetReplacementForCurrentQuestGiver(field) or originalFunction(...)
    end
end

HookQuestGiverText("GetTitleText", "title")
HookQuestGiverText("GetQuestText", "description")
HookQuestGiverText("GetObjectiveText", "objective")
HookQuestGiverText("GetProgressText", "progress")
HookQuestGiverText("GetRewardText", "completion")

if GetQuestLogQuestText then
    local originalGetQuestLogQuestText = GetQuestLogQuestText

    GetQuestLogQuestText = function(...)
        local description, objective = originalGetQuestLogQuestText(...)

        if MatreshkaOptions
            and MatreshkaOptions["QUEST_TRANSLATIONS"] then
            local selectedQuestIndex = GetQuestLogSelection()

            if selectedQuestIndex and selectedQuestIndex > 0 then
                local questData = GetDataByID("quest", select(8, GetQuestLogTitle(selectedQuestIndex)))

                if questData then
                    if questData.description and questData.description ~= "" then
                        description = questData.description
                    end

                    if questData.objective and questData.objective ~= "" then
                        objective = questData.objective
                    end
                end
            end
        end

        return description, objective
    end
end

if QuestLog_Update then
    hooksecurefunc("QuestLog_Update", function()
        if not MatreshkaOptions
            or not MatreshkaOptions["QUEST_TRANSLATIONS"]
            or not QuestLogQuestTitle then
            return
        end

        local selectedQuestIndex = GetQuestLogSelection()

        if selectedQuestIndex and selectedQuestIndex > 0 then
            local questData = GetDataByID("quest", select(8, GetQuestLogTitle(selectedQuestIndex)))

            if questData and questData.title and questData.title ~= "" then
                QuestLogQuestTitle:SetText(questData.title)
            end
        end
    end)
end

if QuestInfo_Display then
    hooksecurefunc("QuestInfo_Display", function()
        if not MatreshkaOptions
            or not MatreshkaOptions["QUEST_TRANSLATIONS"] then
            return
        end

        local languageCode = MatreshkaOptions["SELECTED_LANGUAGE"]
        local translations = MatreshkaTranslations and MatreshkaTranslations[languageCode]

        if not translations then
            return
        end

        if QuestInfoObjectivesHeader and translations.objectives then
            QuestInfoObjectivesHeader:SetText(translations.objectives)
        end

        local rewardsFrame = QuestInfoRewardsFrame

        if rewardsFrame then
            local rewardsHeader = rewardsFrame.Header or _G["QuestInfoRewardsFrameHeaderText"]

            if rewardsHeader and translations.rewards then
                rewardsHeader:SetText(translations.rewards)
            end

            local questData = GetDataByID("quest", GetQuestID())
            local rewardsIntro = questData and questData.rewards and questData.rewards:match("[^\r\n]+")

            if rewardsIntro then
                local chooseText = rewardsFrame.ItemChooseText or _G["QuestInfoRewardsFrameItemChooseText"]
                local receiveText = rewardsFrame.ItemReceiveText or _G["QuestInfoRewardsFrameItemReceiveText"]

                if chooseText and chooseText:IsShown() then
                    chooseText:SetText(rewardsIntro)
                end

                if receiveText and receiveText:IsShown() then
                    receiveText:SetText(rewardsIntro)
                end
            end
        end
    end)
end

-- Quest ID for bug reports: append "(ID: N)" to the quest title in the quest log detail pane and
-- the quest-giver dialog. Independent of translation mode and of whether the quest is translated.
if QuestInfo_Display then
    hooksecurefunc("QuestInfo_Display", function()
        if not MatreshkaOptions or not MatreshkaOptions["SHOW_IDS"] or not QuestInfoTitleHeader then
            return
        end

        local questID = GetQuestID and GetQuestID()

        if (not questID or questID == 0) and GetQuestLogSelection then
            local selectedQuestIndex = GetQuestLogSelection()

            if selectedQuestIndex and selectedQuestIndex > 0 then
                questID = select(8, GetQuestLogTitle(selectedQuestIndex))
            end
        end

        if not questID or questID == 0 then
            return
        end

        local current = QuestInfoTitleHeader:GetText() or ""

        if not current:find("(ID: " .. questID .. ")", 1, true) then
            QuestInfoTitleHeader:SetText(current .. "  |cFF999999(ID: " .. questID .. ")|r")
        end
    end)
end

local function ResetTooltipState(self)
    self.matreshkaCacheKey = nil
    self.matreshkaMap = nil
    self.matreshkaLineCount = nil
    self.matreshkaAuctionName = nil
    self.matreshkaIdText = nil
    self.matreshkaBottomAdded = nil
end

-- Re-translate when the client (or any addon) adds lines after our pass. Keyed on line count
-- so it only fires on a real change (no flicker, no per-addon special-casing). This is what
-- catches recipe reagents and any other asynchronously/late-rendered tooltip lines.
local function OnTooltipUpdate(self)
    if self.matreshkaMap and self:NumLines() ~= self.matreshkaLineCount then
        TranslateTooltipInPlace(self, self.matreshkaMap)
        self.matreshkaLineCount = self:NumLines()
    end

    AppendBottomLines(self)
end

-- Register scripts to frames
GameTooltip:HookScript("OnTooltipSetItem", HandleItemTooltip)
GameTooltip:HookScript("OnTooltipSetSpell", HandleSpellTooltip)
GameTooltip:HookScript("OnTooltipSetUnit", HandleUnitTooltip)
GameTooltip:HookScript("OnTooltipCleared", ResetTooltipState)
GameTooltip:HookScript("OnUpdate", OnTooltipUpdate)

-- The item comparison tooltips ("Currently Equipped" side panels) are separate frames, so they
-- need the same item translation hooks. They only ever show items.
for _, frameName in ipairs({ "ShoppingTooltip1", "ShoppingTooltip2", "ShoppingTooltip3",
                             "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2" }) do
    local shopping = _G[frameName]

    if shopping and shopping.HookScript then
        shopping:HookScript("OnTooltipSetItem", HandleItemTooltip)
        shopping:HookScript("OnTooltipCleared", ResetTooltipState)
        shopping:HookScript("OnUpdate", OnTooltipUpdate)
    end
end

if GameTooltip.SetTalent then
    hooksecurefunc(GameTooltip, "SetTalent", HandleSpellTooltip)
end

-- Translate the spell names shown in the spellbook window itself (the engine otherwise only
-- touches tooltips). The client redraws each button on its own (e.g. the ~1s cooldown tick),
-- restoring the English name, so the translation is re-applied per button. Fully guarded: on a
-- different client layout this simply does nothing instead of erroring.
local function TranslateSpellbookButton(button)
    if not (MatreshkaOptions and MatreshkaOptions["SPELL_TRANSLATIONS"]) then
        return
    end

    if not (button and button.IsShown and button:IsShown()) then
        return
    end

    if not (SpellBookFrame and SpellBookFrame.bookType and SpellBook_GetSpellBookSlot and GetSpellBookItemInfo) then
        return
    end

    local name = button:GetName()
    local nameText = button.SpellName or (name and _G[name .. "SpellName"])

    if not nameText then
        return
    end

    local slot = SpellBook_GetSpellBookSlot(button)

    if not slot then
        return
    end

    local _, spellID = GetSpellBookItemInfo(slot, SpellBookFrame.bookType)
    local entry = spellID and GetEffectiveEntry("spell", spellID)

    if entry and entry.name and entry.name ~= "" then
        nameText:SetText((entry.name:gsub("%[q%d?%]", "")))
    end
end

local function TranslateSpellbookNow()
    for i = 1, (SPELLS_PER_PAGE or 12) do
        TranslateSpellbookButton(_G["SpellButton" .. i])
    end
end

-- Primary: re-apply right after each button's own redraw (flicker-free). Secondary: a throttled
-- pass while the book is open, in case a redraw path is not the hooked one.
local function HookSpellbookButtons()
    for i = 1, (SPELLS_PER_PAGE or 12) do
        local button = _G["SpellButton" .. i]

        if button and not button.matreshkaHooked and type(button.UpdateButton) == "function" then
            button.matreshkaHooked = true
            hooksecurefunc(button, "UpdateButton", TranslateSpellbookButton)
        end
    end

    TranslateSpellbookNow()
end

if SpellBookFrame then
    HookSpellbookButtons()
    SpellBookFrame:HookScript("OnShow", HookSpellbookButtons)

    local sinceRefresh = 0
    SpellBookFrame:HookScript("OnUpdate", function(_, elapsed)
        sinceRefresh = sinceRefresh + (elapsed or 0)

        if sinceRefresh >= 0.1 then
            sinceRefresh = 0
            TranslateSpellbookNow()
        end
    end)
end
