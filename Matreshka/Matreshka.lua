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

-- A tooltip line coloured inline by another addon (e.g. the item-comparison delta
-- "|cff00ff00+10 Stamina|r") carries its colour in the text, not on the FontString. Replacing that
-- text with a plain translation drops the colour and the line turns white. Re-wrap the translation
-- in the original leading |c..|r escape so the green/red gain-loss colour survives.
local function PreserveInlineColor(originalText, translatedText)
    if not originalText or translatedText:find("|c", 1, true) then
        return translatedText
    end

    local colorCode = originalText:match("^(|c%x%x%x%x%x%x%x%x)")

    if colorCode and originalText:find("|r", 1, true) then
        return colorCode .. translatedText .. "|r"
    end

    return translatedText
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
            local originalText = leftFontString:GetText()
            local translated = LookupTranslation(map, originalText)

            if translated then
                leftFontString:SetText(PreserveInlineColor(originalText, translated))
            end
        end

        local rightFontString = _G[tooltipName .. "TextRight" .. i]

        if rightFontString then
            local originalText = rightFontString:GetText()
            local translated = LookupTranslation(map, originalText)

            if translated then
                rightFontString:SetText(PreserveInlineColor(originalText, translated))
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
-- very bottom of the tooltip. Called after Show, which the client calls once every addon's
-- synchronous OnTooltipSetItem additions are in, keeping our lines last; OnUpdate is the fallback.
-- Appending in the same frame matters for tooltips the client rebuilds every frame (mail
-- attachments): a next-frame append made their height jump back and forth.
local function AppendBottomLines(tooltip)
    if tooltip.matreshkaBottomAdded or not (tooltip.matreshkaIdText or tooltip.matreshkaAuctionName) then
        return
    end

    tooltip.matreshkaBottomAdded = true

    if tooltip.matreshkaIdText then
        tooltip:AddLine(tooltip.matreshkaIdText, 0.6, 0.6, 0.6)
    end

    if tooltip.matreshkaAuctionName then
        tooltip:AddLine("Auction name: " .. tooltip.matreshkaAuctionName, 0.6, 0.6, 0.6)
    end

    tooltip.matreshkaLineCount = tooltip:NumLines()
    tooltip:Show()
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

-- Player-specific quest tokens. The datamined source renders WoW's $N/$C/$R and gender tokens as
-- readable brackets, and the translation localized them: <имя> (name), <класс> (class), <раса>
-- (race), and gender pairs <муж/жен>. WoW does not expand these in addon-supplied text, so the
-- live character's values are substituted here. Class and race stay in nominative case.
local QUEST_TOKEN_CLASS = {
    WARRIOR = "воин", PALADIN = "паладин", HUNTER = "охотник", ROGUE = "разбойник",
    PRIEST = "жрец", SHAMAN = "шаман", MAGE = "маг", WARLOCK = "чернокнижник", DRUID = "друид",
}

local QUEST_TOKEN_RACE = {
    Human = "человек", Dwarf = "дворф", NightElf = "ночной эльф", Gnome = "гном",
    Draenei = "дреней", Orc = "орк", Scourge = "нежить", Tauren = "таурен",
    Troll = "тролль", BloodElf = "эльф крови",
}

local function ApplyPlayerTokens(text)
    if not text or not text:find("[<%$]") then
        return text
    end

    local female = UnitSex("player") == 3

    -- Gender pairs: localized <masc/fem> and the native $Gmasc:fem; form.
    text = text:gsub("<([^<>/]-)/([^<>]-)>", function(masc, fem)
        return ((female and fem or masc):gsub(":%a$", ""))
    end)
    text = text:gsub("%$[Gg](.-):(.-);", function(masc, fem)
        return female and fem or masc
    end)

    local name = UnitName("player") or ""
    local className, classToken = UnitClass("player")
    local raceName, raceToken = UnitRace("player")
    local class = QUEST_TOKEN_CLASS[classToken] or className or ""
    local race = QUEST_TOKEN_RACE[raceToken] or raceName or ""

    text = text:gsub("<имя>", name):gsub("<name>", name):gsub("%$[Nn]", name)
    text = text:gsub("<класс>", class):gsub("<class>", class):gsub("%$[Cc]", class)
    text = text:gsub("<раса>", race):gsub("<race>", race):gsub("%$[Rr]", race)

    return text
end

-- Quest translation: substitute the native quest frame text with the translation in place
local function GetReplacementForCurrentQuestGiver(field)
    if not MatreshkaOptions
        or not MatreshkaOptions["QUEST_TRANSLATIONS"] then
        return nil
    end

    local questData = GetDataByID("quest", GetQuestID())

    if questData and questData[field] and questData[field] ~= "" then
        return ApplyPlayerTokens(questData[field])
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
                        description = ApplyPlayerTokens(questData.description)
                    end

                    if questData.objective and questData.objective ~= "" then
                        objective = ApplyPlayerTokens(questData.objective)
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
                QuestLogQuestTitle:SetText(ApplyPlayerTokens(questData.title))
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
            local rewardsIntro = questData and questData.rewards and ApplyPlayerTokens(questData.rewards):match("[^\r\n]+")

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

-- Quest Log (journal) detail pane: unlike QuestFrame, it does not route through QuestInfo_Display —
-- it has its own header widgets (QuestLogDescriptionTitle / QuestLogRewardTitleText /
-- QuestLogItemChooseText / QuestLogItemReceiveText), refreshed by QuestLog_UpdateQuestDetails.
if QuestLog_UpdateQuestDetails then
    hooksecurefunc("QuestLog_UpdateQuestDetails", function()
        if not MatreshkaOptions
            or not MatreshkaOptions["QUEST_TRANSLATIONS"] then
            return
        end

        local languageCode = MatreshkaOptions["SELECTED_LANGUAGE"]
        local translations = MatreshkaTranslations and MatreshkaTranslations[languageCode]

        if not translations then
            return
        end

        if QuestLogDescriptionTitle and translations.description then
            QuestLogDescriptionTitle:SetText(translations.description)
        end

        if QuestLogRewardTitleText and translations.rewards then
            QuestLogRewardTitleText:SetText(translations.rewards)
        end

        local selectedQuestIndex = GetQuestLogSelection()
        local questData = selectedQuestIndex and selectedQuestIndex > 0
            and GetDataByID("quest", select(8, GetQuestLogTitle(selectedQuestIndex)))
        local rewardsIntro = questData and questData.rewards and ApplyPlayerTokens(questData.rewards):match("[^\r\n]+")

        local chooseText = QuestLogItemChooseText
        local receiveText = QuestLogItemReceiveText

        if rewardsIntro then
            if chooseText and chooseText:IsShown() then
                chooseText:SetText(rewardsIntro)
            end

            if receiveText and receiveText:IsShown() then
                receiveText:SetText(rewardsIntro)
            end
        else
            if chooseText and chooseText:IsShown() and translations.rewardsChoose then
                chooseText:SetText(translations.rewardsChoose)
            end

            if receiveText and receiveText:IsShown() and translations.rewardsReceive then
                receiveText:SetText(translations.rewardsReceive)
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
hooksecurefunc(GameTooltip, "Show", AppendBottomLines)

-- The item comparison tooltips ("Currently Equipped" side panels) are separate frames, so they
-- need the same item translation hooks. They only ever show items.
for _, frameName in ipairs({ "ShoppingTooltip1", "ShoppingTooltip2", "ShoppingTooltip3",
                             "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2" }) do
    local shopping = _G[frameName]

    if shopping and shopping.HookScript then
        shopping:HookScript("OnTooltipSetItem", HandleItemTooltip)
        shopping:HookScript("OnTooltipCleared", ResetTooltipState)
        shopping:HookScript("OnUpdate", OnTooltipUpdate)
        hooksecurefunc(shopping, "Show", AppendBottomLines)
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

-- Gossip (NPC dialogue). Gossip greeting bodies and their clickable options are server-driven in
-- TBC: the client holds no ID for them at runtime, only the rendered English text. So they are
-- translated by matching that text (whitespace-collapsed, case kept) against a flat English ->
-- translated map built offline from the /mtscan corpus. Body and options are replaced in place.
local function NormalizeGossip(text)
    local normalized = NormalizeForLookup(text)

    if not normalized or normalized == "" then
        return nil
    end

    -- Match regardless of how paragraph breaks or indentation were captured.
    normalized = normalized:gsub("%s+", " ")

    -- The server substitutes $N with the player's name before sending; fold it back to a token so
    -- one entry serves every character and the scan corpus is not polluted per-player.
    local playerName = UnitName and UnitName("player")

    if playerName and #playerName >= 3 then
        normalized = normalized:gsub(escapeMagic(playerName), "$N")
    end

    return normalized
end

local function LookupGossip(liveText)
    local languageCode = MatreshkaOptions and MatreshkaOptions["SELECTED_LANGUAGE"]
    local bucket = Matreshka_Gossip and languageCode and Matreshka_Gossip[languageCode]

    if not bucket then
        return nil, nil
    end

    local key = NormalizeGossip(liveText)

    if not key then
        return nil, nil
    end

    -- Many gossip texts are broadcast texts too, so the official chat map covers what the gossip map lacks.
    local chatBucket = Matreshka_Chat and Matreshka_Chat[languageCode]

    return bucket[key] or (chatBucket and chatBucket[key]), key
end

local function RecordMissingGossip(key)
    if not key or not (MatreshkaOptions and MatreshkaOptions["SCAN_MISSING"]) then
        return
    end

    MatreshkaMissing = MatreshkaMissing or {}
    local bucket = "gossip:" .. (MatreshkaOptions["SELECTED_LANGUAGE"] or "ru")
    MatreshkaMissing[bucket] = MatreshkaMissing[bucket] or {}
    MatreshkaMissing[bucket][key] = true
end

-- This client renders gossip through a ScrollBox: GossipFrame:Update() calls C_GossipInfo.GetText()
-- / GetOptions() and feeds a DataProvider whose elements the ScrollBox lays out (greeting body via
-- GossipGreetingTextMixin, options via GossipOptionButtonMixin). We translate the element data in
-- place, then re-set the provider so the ScrollBox recomputes row heights against the Russian text
-- (setting the FontString alone would clip, since its row extent was measured from the English).
local GOSSIP_TYPE_OPTION = GOSSIP_BUTTON_TYPE_OPTION or 3

local function TranslateGossipElement(element)
    if not element then
        return false
    end

    -- Greeting body: element.text is what the ScrollBox measures and shows.
    if element.greetingTextFrame and element.text then
        local translated, key = LookupGossip(element.text)

        if translated then
            element.text = ApplyPlayerTokens(translated)
            return true
        end

        RecordMissingGossip(key)
    -- Clickable gossip option (quest-title buttons are skipped — quests translate elsewhere).
    elseif element.info and element.info.name and element.buttonType == GOSSIP_TYPE_OPTION then
        local translated, key = LookupGossip(element.info.name)

        if translated then
            element.info.name = ApplyPlayerTokens(translated)
            return true
        end

        RecordMissingGossip(key)
    end

    return false
end

local function TranslateGossipFrame(frame)
    if not (MatreshkaOptions and MatreshkaOptions["GOSSIP_TRANSLATIONS"]) then
        return
    end

    if frame.matreshkaTranslating then
        return
    end

    local panel = frame and frame.GreetingPanel
    local scrollBox = panel and panel.ScrollBox
    local dataProvider = scrollBox and scrollBox.GetDataProvider and scrollBox:GetDataProvider()

    if not (dataProvider and dataProvider.ForEach) then
        return
    end

    local changed = false

    dataProvider:ForEach(function(element)
        if TranslateGossipElement(element) then
            changed = true
        end
    end)

    if changed then
        -- Re-lay out with recomputed extents. Guarded against re-entry; SetDataProvider does not
        -- call Update, so the hook cannot recurse.
        frame.matreshkaTranslating = true
        scrollBox:SetDataProvider(dataProvider, ScrollBoxConstants and ScrollBoxConstants.RetainScrollPosition)
        frame.matreshkaTranslating = false
    end
end

-- GossipFrame lives in Blizzard_UIPanels_Game; hook its Update once it exists (it may load on
-- demand, so also retry on ADDON_LOADED / PLAYER_LOGIN). Update runs after every gossip refresh,
-- including option clicks that open another page.
local function InstallGossipHook()
    if GossipFrame and type(GossipFrame.Update) == "function" and not GossipFrame.matreshkaHooked then
        GossipFrame.matreshkaHooked = true
        hooksecurefunc(GossipFrame, "Update", TranslateGossipFrame)
    end
end

InstallGossipHook()

if not (GossipFrame and GossipFrame.matreshkaHooked) then
    local gossipInstaller = CreateFrame("Frame")
    gossipInstaller:RegisterEvent("ADDON_LOADED")
    gossipInstaller:RegisterEvent("PLAYER_LOGIN")
    gossipInstaller:SetScript("OnEvent", InstallGossipHook)
end

-- NPC chat (monster / boss lines). NPC and boss dialogue printed to the chat window is static
-- Blizzard content, not player speech, and arrives on its own set of events. It is translated by
-- matching the English line against a flat map (same normalization and $N folding as gossip) and
-- swapping it via a chat message filter. Only these NPC/boss events are filtered — players' own
-- whispers, party and raid messages are never inspected, so live chat is untouched.
local NPC_CHAT_EVENTS = {
    "CHAT_MSG_MONSTER_SAY",
    "CHAT_MSG_MONSTER_YELL",
    "CHAT_MSG_MONSTER_WHISPER",
    "CHAT_MSG_MONSTER_EMOTE",
    "CHAT_MSG_RAID_BOSS_EMOTE",
    "CHAT_MSG_RAID_BOSS_WHISPER",
}

local function LookupChat(liveText)
    local languageCode = MatreshkaOptions and MatreshkaOptions["SELECTED_LANGUAGE"]
    local bucket = Matreshka_Chat and languageCode and Matreshka_Chat[languageCode]

    if not bucket then
        return nil, nil
    end

    local key = NormalizeGossip(liveText)

    if not key then
        return nil, nil
    end

    return bucket[key], key
end

local function RecordMissingChat(key)
    if not key or not (MatreshkaOptions and MatreshkaOptions["SCAN_MISSING"]) then
        return
    end

    MatreshkaMissing = MatreshkaMissing or {}
    local bucket = "npcchat:" .. (MatreshkaOptions["SELECTED_LANGUAGE"] or "ru")
    MatreshkaMissing[bucket] = MatreshkaMissing[bucket] or {}
    MatreshkaMissing[bucket][key] = true
end

-- Chat filter: swap a known NPC/boss line for its translation, leaving the remaining arguments
-- (author, channel, ...) untouched. Returning false keeps the message; the extra return values
-- replace the message text.
local function TranslateChatMessage(self, event, msg, ...)
    if not (MatreshkaOptions and MatreshkaOptions["NPC_CHAT_TRANSLATIONS"]) then
        return false
    end

    local translated, key = LookupChat(msg)

    if translated then
        return false, ApplyPlayerTokens(translated), ...
    end

    RecordMissingChat(key)
    return false
end

if ChatFrame_AddMessageEventFilter then
    for _, event in ipairs(NPC_CHAT_EVENTS) do
        ChatFrame_AddMessageEventFilter(event, TranslateChatMessage)
    end
end

-- The speech verb around an NPC line ("X says:/yells:/whispers:") is built by the chat engine from
-- a global string, not from the line text, so it is localized by swapping those globals. Only the
-- MONSTER_* / RAID_BOSS_* variants are touched — player speech uses different globals and stays put.
-- Applied at login when chat translation is on; toggling the option takes effect after /reload, like
-- the language switch. Options are restored from SavedVariables only by PLAYER_LOGIN, hence the event.
local function ApplyChatVerbs()
    if not (MatreshkaOptions and MatreshkaOptions["NPC_CHAT_TRANSLATIONS"]) then
        return
    end

    CHAT_MONSTER_SAY_GET = "%s говорит: "
    CHAT_MONSTER_YELL_GET = "%s кричит: "
    CHAT_MONSTER_WHISPER_GET = "%s шепчет: "
    CHAT_RAID_BOSS_WHISPER_GET = "%s шепчет: "
end

local chatVerbFrame = CreateFrame("Frame")
chatVerbFrame:RegisterEvent("PLAYER_LOGIN")
chatVerbFrame:SetScript("OnEvent", ApplyChatVerbs)

-- Friend online/offline notices are built from client global strings, like the chat verbs above.
-- Swap them for Blizzard's official Russian wording so those system lines read in Russian too.
local function ApplySystemStrings()
    if not (MatreshkaOptions and MatreshkaOptions["SELECTED_LANGUAGE"] == "ru") then
        return
    end

    ERR_FRIEND_ONLINE_SS = "|Hplayer:%s|h[%s]|h теперь в сети."
    ERR_FRIEND_OFFLINE_S = "%s теперь не в сети."
end

local systemStringsFrame = CreateFrame("Frame")
systemStringsFrame:RegisterEvent("PLAYER_LOGIN")
systemStringsFrame:SetScript("OnEvent", ApplySystemStrings)

-- Mail letters. The body shown in the open-mail window is static NPC-authored text (server-sent,
-- no client id and no official ruRU), matched against a flat map with the same normalization as
-- gossip. The body widget is a SimpleHTML frame and has no GetText, so the post-hook re-reads the
-- English source through GetInboxText — the same call OpenMail_Update makes on every refresh.
local function LookupMail(liveText)
    local languageCode = MatreshkaOptions and MatreshkaOptions["SELECTED_LANGUAGE"]
    local bucket = Matreshka_Mail and languageCode and Matreshka_Mail[languageCode]

    if not bucket then
        return nil, nil
    end

    local key = NormalizeGossip(liveText)

    if not key then
        return nil, nil
    end

    return bucket[key], key
end

local function RecordMissingMail(key)
    if not key or not (MatreshkaOptions and MatreshkaOptions["SCAN_MISSING"]) then
        return
    end

    MatreshkaMissing = MatreshkaMissing or {}
    local bucket = "mail:" .. (MatreshkaOptions["SELECTED_LANGUAGE"] or "ru")
    MatreshkaMissing[bucket] = MatreshkaMissing[bucket] or {}
    MatreshkaMissing[bucket][key] = true
end

local function TranslateOpenMail()
    if not (MatreshkaOptions and MatreshkaOptions["MAIL_TRANSLATIONS"]) then
        return
    end

    local body = _G["OpenMailBodyText"]
    local mailID = InboxFrame and InboxFrame.openMailID

    if not body or not mailID then
        return
    end

    local text = GetInboxText(mailID)

    if not text or text == "" then
        return
    end

    local translated, key = LookupMail(text)

    if translated then
        body:SetText(ApplyPlayerTokens(translated), true)
    else
        RecordMissingMail(key)
    end
end

local mailHooked = false

local function InstallMailHook()
    if not mailHooked and type(OpenMail_Update) == "function" then
        mailHooked = true
        hooksecurefunc("OpenMail_Update", TranslateOpenMail)
    end
end

InstallMailHook()

if not mailHooked then
    local mailInstaller = CreateFrame("Frame")
    mailInstaller:RegisterEvent("ADDON_LOADED")
    mailInstaller:RegisterEvent("PLAYER_LOGIN")
    mailInstaller:SetScript("OnEvent", InstallMailHook)
end

-- Books, notes and plaques (ItemTextFrame). Page text is server-sent with no client id, so it is
-- matched as text like gossip. The page widget is a SimpleHTML frame: the post-hook re-reads the
-- English page through ItemTextGetText and rebuilds the text the way ItemTextFrame_OnEvent does.
local function LookupBook(liveText)
    local languageCode = MatreshkaOptions and MatreshkaOptions["SELECTED_LANGUAGE"]
    local bucket = Matreshka_Books and languageCode and Matreshka_Books[languageCode]

    if not bucket then
        return nil, nil
    end

    local key = NormalizeGossip(liveText)

    if not key then
        return nil, nil
    end

    return bucket[key], key
end

local function RecordMissingBook(key)
    if not key or not (MatreshkaOptions and MatreshkaOptions["SCAN_MISSING"]) then
        return
    end

    MatreshkaMissing = MatreshkaMissing or {}
    local bucket = "book:" .. (MatreshkaOptions["SELECTED_LANGUAGE"] or "ru")
    MatreshkaMissing[bucket] = MatreshkaMissing[bucket] or {}
    MatreshkaMissing[bucket][key] = true
end

-- Lazy index: english item name -> translated name, for the frame title (it shows the item name).
local itemTitleIndex = nil
local itemTitleIndexLanguage = nil

local function GetTranslatedItemName(englishName)
    if not englishName or englishName == "" then
        return nil
    end

    local languageCode = MatreshkaOptions["SELECTED_LANGUAGE"]

    if itemTitleIndex == nil or itemTitleIndexLanguage ~= languageCode then
        itemTitleIndex = {}
        itemTitleIndexLanguage = languageCode

        local englishData = Matreshka_GetBucket("item", "en")
        local translatedData = Matreshka_GetBucket("item", languageCode)

        if englishData and translatedData then
            for id, englishRow in pairs(englishData) do
                local translatedRow = translatedData[id]

                if englishRow[1] and translatedRow and translatedRow[1] then
                    itemTitleIndex[NormalizeForLookup(englishRow[1])] = NormalizeForLookup(translatedRow[1])
                end
            end
        end
    end

    return itemTitleIndex[NormalizeForLookup(englishName)]
end

local function TranslateItemText(self, event)
    if not (MatreshkaOptions and MatreshkaOptions["BOOK_TRANSLATIONS"]) then
        return
    end

    if event == "ITEM_TEXT_BEGIN" then
        local title = GetTranslatedItemName(ItemTextGetItem())

        if title then
            ItemTextTitleText:SetText(title)
        end

        return
    end

    if event ~= "ITEM_TEXT_READY" then
        return
    end

    local text = ItemTextGetText()

    if not text or text == "" then
        return
    end

    local translated, key = LookupBook(text)

    if not translated then
        RecordMissingBook(key)
        return
    end

    -- HTML pages carry no player tokens, and the <masc/fem> pattern would eat their <BR/> tags.
    if not translated:find("^%s*<[Hh][Tt][Mm][Ll]>") then
        translated = ApplyPlayerTokens(translated)
    end

    local creator = ItemTextGetCreator()

    if creator then
        ItemTextPageText:SetText("\n" .. translated .. "\n\n" .. ITEM_TEXT_FROM .. "\n" .. creator .. "\n")
    else
        ItemTextPageText:SetText("\n" .. translated)
    end

    -- The page length changed, so redo the scroll-child sizing from ItemTextFrame_OnEvent.
    local scrollChild = ItemTextScrollFrame:GetScrollChild()
    scrollChild:SetHeight(1)
    ItemTextScrollFrame:UpdateScrollChildRect()

    if floor(ItemTextScrollFrame:GetVerticalScrollRange()) > 0 then
        scrollChild:SetHeight(ItemTextScrollFrame:GetHeight() + ItemTextScrollFrame:GetVerticalScrollRange() + 30)
    end

    ItemTextScrollFrameScrollBar:SetValue(0)
end

local function InstallItemTextHook()
    if ItemTextFrame and not ItemTextFrame.matreshkaHooked then
        ItemTextFrame.matreshkaHooked = true
        ItemTextFrame:HookScript("OnEvent", TranslateItemText)
    end
end

InstallItemTextHook()

if not (ItemTextFrame and ItemTextFrame.matreshkaHooked) then
    local itemTextInstaller = CreateFrame("Frame")
    itemTextInstaller:RegisterEvent("ADDON_LOADED")
    itemTextInstaller:RegisterEvent("PLAYER_LOGIN")
    itemTextInstaller:SetScript("OnEvent", InstallItemTextHook)
end

-- Auction house mail. Sender, subject and invoice lines are client strings (English on this client), so
-- after Blizzard fills the inbox list and the open-mail frame they are swapped for the official
-- translation from Translations.lua; the invoice lines are rebuilt from GetInboxInvoiceInfo the same
-- way OpenMail_Update builds them. Item names come from the item database.
local function GetAuctionMailStrings()
    local languageCode = MatreshkaOptions and MatreshkaOptions["SELECTED_LANGUAGE"]
    local translations = MatreshkaTranslations and languageCode and MatreshkaTranslations[languageCode]

    return translations and translations.auctionMail
end

-- Captured "%s" part of a text built from an English client format, or nil when it does not match.
local function MatchClientFormat(text, englishFormat)
    if type(text) ~= "string" or type(englishFormat) ~= "string" then
        return nil
    end

    return text:match("^" .. escapeMagic(englishFormat):gsub("%%%%s", "(.+)") .. "$")
end

local function TranslateAuctionItemName(itemText)
    local translated = GetTranslatedItemName(itemText)

    if translated then
        return translated
    end

    local name, count = itemText:match("^(.+) %((%d+)%)$")
    translated = name and GetTranslatedItemName(name)

    if translated then
        return translated .. " (" .. count .. ")"
    end

    return itemText
end

local function TranslateAuctionSubject(subject, strings)
    for globalName, translatedFormat in pairs(strings.subjects) do
        local item = MatchClientFormat(subject, _G[globalName])

        if item then
            return format(translatedFormat, TranslateAuctionItemName(item))
        end
    end

    return nil
end

local function TranslateAuctionSender(sender, strings)
    return type(sender) == "string" and strings.senders[(sender:gsub("%s+", " "))] or nil
end

local function TranslateInboxList()
    local strings = MatreshkaOptions and MatreshkaOptions["MAIL_TRANSLATIONS"] and GetAuctionMailStrings()

    if not strings then
        return
    end

    for i = 1, INBOXITEMS_TO_DISPLAY or 7 do
        local senderText = _G["MailItem" .. i .. "Sender"]
        local subjectText = _G["MailItem" .. i .. "Subject"]
        local sender = senderText and TranslateAuctionSender(senderText:GetText(), strings)
        local subject = subjectText and TranslateAuctionSubject(subjectText:GetText(), strings)

        if sender then
            senderText:SetText(sender)
        end

        if subject then
            subjectText:SetText(subject)
        end
    end
end

local function TranslateAuctionInvoice(mailID, strings)
    local invoiceType, itemName, playerName, bid, buyout, _, _, _, _, _, count, commerceAuction = GetInboxInvoiceInfo(mailID)

    if invoiceType and playerName == nil
        and (commerceAuction or (IsUsingLegacyAuctionClient and not IsUsingLegacyAuctionClient())) then
        playerName = invoiceType == "buyer" and strings.multipleSellers or strings.multipleBuyers
    end

    if not (invoiceType and playerName and itemName) then
        return
    end

    local item = GetTranslatedItemName(itemName) or itemName

    if count and count > 1 then
        item = item .. " (" .. count .. ")"
    end

    local buyMode = "(" .. (bid == buyout and strings.buyout or strings.highBidder) .. ")"

    if invoiceType == "buyer" then
        OpenMailInvoiceItemLabel:SetText(strings.itemPurchased .. " " .. item .. "  " .. buyMode)
        OpenMailInvoicePurchaser:SetText(strings.soldBy .. " " .. playerName)
        OpenMailInvoiceAmountReceived:SetText(strings.amountPaid)
    elseif invoiceType == "seller" then
        OpenMailInvoiceItemLabel:SetText(strings.itemSold .. " " .. item)
        OpenMailInvoicePurchaser:SetText(strings.purchasedBy .. " " .. playerName)
        OpenMailInvoiceAmountReceived:SetText(strings.amountReceived)
        OpenMailInvoiceBuyMode:SetText(buyMode)
    elseif invoiceType == "seller_temp_invoice" then
        OpenMailInvoiceItemLabel:SetText(strings.itemSold .. " " .. item .. "  " .. buyMode)
        OpenMailInvoicePurchaser:SetText(strings.purchasedBy .. " " .. playerName)
        OpenMailInvoiceAmountReceived:SetText(strings.pendingFunds)

        local delay = MatchClientFormat(OpenMailInvoiceMoneyDelay:GetText(), AUCTION_INVOICE_FUNDS_DELAY)

        if delay then
            OpenMailInvoiceMoneyDelay:SetText(format(strings.fundsDelay, delay))
        end
    end

    OpenMailInvoiceSalePrice:SetText(strings.salePrice)
    OpenMailInvoiceDeposit:SetText(strings.deposit)
    OpenMailInvoiceHouseCut:SetText(strings.houseCut)
    OpenMailInvoiceNotYetSent:SetText(strings.fundsNotYetSent)
end

local function TranslateAuctionOpenMail()
    local strings = MatreshkaOptions and MatreshkaOptions["MAIL_TRANSLATIONS"] and GetAuctionMailStrings()
    local mailID = InboxFrame and InboxFrame.openMailID

    if not (strings and mailID) then
        return
    end

    local senderName = OpenMailSender and OpenMailSender.Name
    local sender = senderName and TranslateAuctionSender(senderName:GetText(), strings)
    local subject = OpenMailSubject and TranslateAuctionSubject(OpenMailSubject:GetText(), strings)

    if sender then
        senderName:SetText(sender)
    end

    if subject then
        OpenMailSubject:SetText(subject)
    end

    if select(5, GetInboxText(mailID)) then
        TranslateAuctionInvoice(mailID, strings)
    end
end

local auctionMailHooked = false

local function InstallAuctionMailHook()
    if not auctionMailHooked and type(OpenMail_Update) == "function" and type(InboxFrame_Update) == "function" then
        auctionMailHooked = true
        hooksecurefunc("InboxFrame_Update", TranslateInboxList)
        hooksecurefunc("OpenMail_Update", TranslateAuctionOpenMail)
    end
end

InstallAuctionMailHook()

if not auctionMailHooked then
    local auctionMailInstaller = CreateFrame("Frame")
    auctionMailInstaller:RegisterEvent("ADDON_LOADED")
    auctionMailInstaller:RegisterEvent("PLAYER_LOGIN")
    auctionMailInstaller:SetScript("OnEvent", InstallAuctionMailHook)
end

-- Mail window labels. They are client strings set from XML or by MailFrame.lua; each one is swapped
-- only while it still holds the English client string, so the swap is safe to repeat after every
-- Blizzard refresh. Unnamed labels are found among their parent's regions.
local MAIL_LABELS = {
    InboxTitleText = "INBOX",
    SendMailTitleText = "SENDMAIL",
    OpenMailTitleText = "OPENMAIL",
    OpenMailSenderLabel = "FROM",
    OpenMailSubjectLabel = "MAIL_SUBJECT_LABEL",
    OpenMailAttachmentText = { "TAKE_ATTACHMENTS", "NO_ATTACHMENTS" },
    OpenMailReplyButton = "REPLY_MESSAGE",
    OpenMailDeleteButton = { "DELETE", "MAIL_RETURN" },
    OpenMailCancelButton = "CLOSE",
    OpenMailReportSpamButton = "REPORT_SPAM",
    OpenAllMail = { "OPEN_ALL_MAIL_BUTTON", "OPEN_ALL_MAIL_BUTTON_OPENING" },
    InboxTooMuchMailText = "INBOX_TOO_MUCH_MAIL",
    SendMailMoneyText = { "SEND_MONEY", "AMOUNT_TO_SEND", "COD_AMOUNT" },
    SendMailSendMoneyButtonText = "SEND_MONEY",
    SendMailCODButtonText = "COD",
    SendMailMailButton = "SEND_LABEL",
    SendMailCancelButton = "CANCEL",
}

local MAIL_REGION_LABELS = {
    InboxPrevPageButton = "PREV",
    InboxNextPageButton = "NEXT",
    SendMailNameEditBox = "MAIL_TO_LABEL",
    SendMailSubjectEditBox = "MAIL_SUBJECT_LABEL",
    SendMailCostMoneyFrame = "SEND_MAIL_COST",
}

local MAIL_TABS = { MailFrameTab1 = "INBOX", MailFrameTab2 = "SENDMAIL" }

local function GetMailFrameStrings()
    if not (MatreshkaOptions and MatreshkaOptions["MAIL_TRANSLATIONS"]) then
        return nil
    end

    local translations = MatreshkaTranslations and MatreshkaTranslations[MatreshkaOptions["SELECTED_LANGUAGE"]]

    return translations and translations.mailFrame
end

local function SwapMailText(widget, globalNames, strings)
    if not (widget and widget.GetText) then
        return false
    end

    local text = widget:GetText()

    for _, globalName in ipairs(type(globalNames) == "table" and globalNames or { globalNames }) do
        if text ~= nil and text == _G[globalName] and strings[globalName] then
            widget:SetText(strings[globalName])
            return true
        end
    end

    return false
end

local function ApplyMailFrameStrings()
    local strings = GetMailFrameStrings()

    if not strings then
        return
    end

    for widgetName, globalNames in pairs(MAIL_LABELS) do
        SwapMailText(_G[widgetName], globalNames, strings)
    end

    for frameName, globalName in pairs(MAIL_REGION_LABELS) do
        local frame = _G[frameName]

        if frame and frame.GetRegions then
            for _, region in ipairs({ frame:GetRegions() }) do
                SwapMailText(region, globalName, strings)
            end
        end
    end

    for tabName, globalName in pairs(MAIL_TABS) do
        local tab = _G[tabName]

        if SwapMailText(tab, globalName, strings) and PanelTemplates_TabResize then
            PanelTemplates_TabResize(tab, 0)
        end
    end
end

-- Days left is rebuilt the way InboxFrame_Update formats it; under a day it stays the client's own text.
local function TranslateInboxExpireTimes()
    local strings = GetMailFrameStrings()

    if not strings then
        return
    end

    local perPage = INBOXITEMS_TO_DISPLAY or 7
    local firstIndex = ((InboxFrame and InboxFrame.pageNum or 1) - 1) * perPage
    local numItems = GetInboxNumItems() or 0

    for i = 1, perPage do
        local expireTime = _G["MailItem" .. i .. "ExpireTime"]
        local index = firstIndex + i

        if expireTime and index <= numItems then
            local daysLeft = select(7, GetInboxHeaderInfo(index))

            if daysLeft and daysLeft >= 1 then
                expireTime:SetText(GREEN_FONT_COLOR_CODE .. format(strings.DAYS_ABBR, floor(daysLeft)) .. " " .. FONT_COLOR_CODE_CLOSE)
            end

            if expireTime.tooltip == TIME_UNTIL_DELETED then
                expireTime.tooltip = strings.TIME_UNTIL_DELETED
            elseif expireTime.tooltip == TIME_UNTIL_RETURNED then
                expireTime.tooltip = strings.TIME_UNTIL_RETURNED
            end
        end
    end
end

local mailFrameHooked = false

local function InstallMailFrameHook()
    if mailFrameHooked or not (MailFrame and type(InboxFrame_Update) == "function"
        and type(OpenMail_Update) == "function" and type(SendMailRadioButton_OnClick) == "function") then
        return
    end

    mailFrameHooked = true
    MailFrame:HookScript("OnShow", ApplyMailFrameStrings)
    hooksecurefunc("InboxFrame_Update", ApplyMailFrameStrings)
    hooksecurefunc("InboxFrame_Update", TranslateInboxExpireTimes)
    hooksecurefunc("OpenMail_Update", ApplyMailFrameStrings)
    hooksecurefunc("SendMailRadioButton_OnClick", ApplyMailFrameStrings)

    if OpenAllMail and OpenAllMail.StartOpening and OpenAllMail.StopOpening then
        hooksecurefunc(OpenAllMail, "StartOpening", ApplyMailFrameStrings)
        hooksecurefunc(OpenAllMail, "StopOpening", ApplyMailFrameStrings)
    end
end

InstallMailFrameHook()

if not mailFrameHooked then
    local mailFrameInstaller = CreateFrame("Frame")
    mailFrameInstaller:RegisterEvent("ADDON_LOADED")
    mailFrameInstaller:RegisterEvent("PLAYER_LOGIN")
    mailFrameInstaller:SetScript("OnEvent", InstallMailFrameHook)
end
