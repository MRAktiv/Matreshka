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

-- Retail client: no Blizzard globals are written there (chat runs on secret values and breaks on taint)
local IS_RETAIL = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE

-- Retail hands out secret values in restricted states; their text cannot be read
local function IsReadable(value)
    return not (issecretvalue and issecretvalue(value))
end

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

-- Category switch from the options; the master toggle (/matreshka off, key binding) turns all of them off
local function IsTranslationOn(optionKey)
    return MatreshkaOptions and MatreshkaOptions["TRANSLATIONS_ENABLED"] ~= false and MatreshkaOptions[optionKey]
end

-- Window labels swapped for a translation, with the client text they replaced, so switching a
-- category off puts the client text back without /reload. Kept here, not on Blizzard frames.
local replacedTexts = {}

local function ReplaceText(widget, translated, optionKey, afterRestore)
    local current = widget:GetText()

    if current == translated then
        return
    end

    replacedTexts[widget] = { original = current, translated = translated, optionKey = optionKey, afterRestore = afterRestore }
    widget:SetText(translated)
end

-- Text the client has rewritten since is left alone
local function RestoreSwitchedOffTexts()
    for widget, entry in pairs(replacedTexts) do
        if not IsTranslationOn(entry.optionKey) then
            if widget:GetText() == entry.translated then
                widget:SetText(entry.original)

                if entry.afterRestore then
                    entry.afterRestore(widget, entry.original)
                end
            end

            replacedTexts[widget] = nil
        end
    end
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
    local text = fontString and fontString:GetText()
    return IsReadable(text) and text or nil
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

-- Retail ships no English names: the name line the client shows is paired with the translation
local function AddLiveNamePair(map, tooltip, englishEntry, translatedEntry)
    if IS_RETAIL and translatedEntry and translatedEntry.name and not (englishEntry and englishEntry.name) then
        local liveName = GetTooltipLeftText(tooltip, 1)

        if liveName and liveName ~= "" then
            AddPair(map, liveName, StripColorMarkers(translatedEntry.name))
        end
    end
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
            local translated = IsReadable(originalText) and LookupTranslation(map, originalText)

            if translated then
                leftFontString:SetText(PreserveInlineColor(originalText, translated))
            end
        end

        local rightFontString = _G[tooltipName .. "TextRight" .. i]

        if rightFontString then
            local originalText = rightFontString:GetText()
            local translated = IsReadable(originalText) and LookupTranslation(map, originalText)

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

-- Description lines rendered from the spell's own template (Core/SpellText.lua): spell
-- descriptions in retail, buff and debuff descriptions on every client
local function AddTemplateLines(map, tooltip, spellID, field)
    if not (Matreshka_TranslateSpellText and spellID and (IS_RETAIL or field == "aura")) then
        return
    end

    for i = 2, tooltip:NumLines() do
        local text = GetTooltipLeftText(tooltip, i)

        if text and text ~= "" and not map.exact[NormalizeForLookup(text)] then
            local translated = Matreshka_TranslateSpellText(spellID, field, text)

            if translated then
                AddPair(map, text, translated)
            end
        end
    end
end

-- Retail: an item's "Use:" / "Equip:" / "Chance on hit:" line is the trigger plus the description of
-- the effect spell; the trigger word comes from the client strings of the interface database
local ITEM_TRIGGERS = { "ITEM_SPELL_TRIGGER_ONUSE", "ITEM_SPELL_TRIGGER_ONEQUIP", "ITEM_SPELL_TRIGGER_ONPROC" }

local function TranslateItemEffect(spells, body)
    for id in spells:gmatch("%d+") do
        local translated = Matreshka_TranslateSpellText(tonumber(id), "template", body)

        if translated then
            return translated
        end
    end
end

local function AddItemEffectLines(map, tooltip, translatedEntry)
    local spells = translatedEntry.spells

    if not (IS_RETAIL and Matreshka_TranslateSpellText and spells and spells ~= "") then
        return
    end

    local interface = Matreshka_Interface and Matreshka_Interface[MatreshkaOptions["SELECTED_LANGUAGE"]]
    local strings = interface and interface.strings or {}

    for i = 2, tooltip:NumLines() do
        local text = GetTooltipLeftText(tooltip, i)
        local plain = text and NormalizeForLookup(text)

        for _, name in ipairs(ITEM_TRIGGERS) do
            local trigger = _G[name]

            if plain and type(trigger) == "string" and plain:sub(1, #trigger + 1) == trigger .. " " then
                local body = plain:sub(#trigger + 2)
                local translated = TranslateItemEffect(spells, body)

                -- The client may add the cooldown in brackets after the description
                local tail = not translated and body:match("%s*%b()$")

                if tail then
                    translated = TranslateItemEffect(spells, body:sub(1, #body - #tail))
                    translated = translated and (translated .. tail)
                end

                if translated then
                    AddPair(map, text, (strings[name] or trigger) .. " " .. translated)
                end

                break
            end
        end
    end
end

local function HandleItemTooltip(tooltip)
    if not IsTranslationOn("ITEM_TRANSLATIONS") then
        return
    end

    local itemName, itemLink = tooltip:GetItem()

    if not (IsReadable(itemLink) and IsReadable(itemName)) or not itemLink then
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
    AddLiveNamePair(map, tooltip, englishEntry, translatedEntry)
    AddItemSuffixTranslations(map, tooltip, englishEntry, translatedEntry)

    if not ShowOnlyTitleTranslation("item") then
        AddItemEffectLines(map, tooltip, translatedEntry)
    end

    TranslateAndRecord(tooltip, cacheKey, map)
end

local function HandleSpellTooltip(tooltip)
    if not IsTranslationOn("SPELL_TRANSLATIONS") then
        return
    end

    local _, spellID = tooltip:GetSpell()

    if not IsReadable(spellID) then
        return
    end

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
        local map = BuildEntityMap(englishEntry, translatedEntry, ShowOnlyTitleTranslation("spell"))
        AddLiveNamePair(map, tooltip, englishEntry, translatedEntry)

        if not ShowOnlyTitleTranslation("spell") then
            AddTemplateLines(map, tooltip, spellID, "template")
        end

        TranslateAndRecord(tooltip, cacheKey, map)
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
    if not IsTranslationOn("NPC_TRANSLATIONS") then
        return
    end

    local _, unit = tooltip:GetUnit()
    local unitGUID = unit and UnitGUID(unit)

    -- Checked before any test on the value: a secret one may not even be compared
    if not IsReadable(unitGUID) then
        return
    end

    unitGUID = unitGUID or UnitGUID("mouseover")

    if not IsReadable(unitGUID) or not unitGUID then
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
    local map = BuildEntityMap(englishEntry, translatedEntry, ShowOnlyTitleTranslation("npc"))
    AddLiveNamePair(map, tooltip, englishEntry, translatedEntry)

    TranslateAndRecord(tooltip, cacheKey, map)
end

-- Buff and debuff tooltips: name plus the aura's own description template; the spell id comes
-- from the tooltip data (retail) or from the aura the tooltip was set to (classic)
local function HandleAuraTooltip(tooltip, data)
    if not IsTranslationOn("SPELL_TRANSLATIONS") then
        return
    end

    local spellID = data and data.id

    if not IsReadable(spellID) or not spellID then
        return
    end

    if MatreshkaOptions["SHOW_IDS"] then
        tooltip.matreshkaIdText = "Spell ID: " .. spellID
    end

    local translatedEntry = GetEffectiveEntry("spell", spellID)

    if not translatedEntry then
        RecordMissing("spell", spellID, GetTooltipLeftText(tooltip, 1))
        return
    end

    local englishEntry = Matreshka_GetEntry("spell", "en", spellID)
    local map = BuildEntityMap(englishEntry, translatedEntry, true)
    AddLiveNamePair(map, tooltip, englishEntry, translatedEntry)

    if not ShowOnlyTitleTranslation("spell") then
        AddTemplateLines(map, tooltip, spellID, "aura")
    end

    TranslateAndRecord(tooltip, "aura:" .. spellID, map)
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

local CYRILLIC_UPPER = {}

do
    local lower, upper = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя", "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
    local upperChars = {}

    for char in upper:gmatch("[\192-\223][\128-\191]") do
        upperChars[#upperChars + 1] = char
    end

    local index = 0

    for char in lower:gmatch("[\192-\223][\128-\191]") do
        index = index + 1
        CYRILLIC_UPPER[char] = upperChars[index]
    end
end

-- Retail texts carry Blizzard's declension codes |3-N($r) / |3-N($c) and plain $r / $c. The forms
-- come from the client's ruRU declension table (DatabaseRetail/Tokens); like the official client,
-- the word is lowercase and gets a capital only at the start of a sentence.
local function ApplyTokenForms(text, female)
    local tokens = Matreshka_Tokens and Matreshka_Tokens[MatreshkaOptions["SELECTED_LANGUAGE"]]

    if not tokens then
        return text
    end

    local _, classToken = UnitClass("player")
    local _, raceToken = UnitRace("player")
    local entries = { r = tokens.race[raceToken], c = tokens.class[classToken] }

    local function Form(token, case)
        local entry = entries[token:lower()]

        if not entry then
            return nil
        end

        local cases = female and entry.femaleCases or entry.maleCases
        local word = case and case ~= 6 and cases[case] or (female and entry.female or entry.male)

        return "\1" .. word .. "\2"
    end

    text = text:gsub("|3%-(%d+)%((.-)%)", function(case, inner)
        local token = inner:match("^%$([RrCc])$")
        return token and Form(token, tonumber(case)) or inner
    end)
    text = text:gsub("%$([RrCc])", function(token)
        return Form(token)
    end)

    return (text:gsub("()\1(.-)\2", function(position, word)
        local before = text:sub(1, position - 1):gsub("[\1\2]", ""):gsub("[%s\"'%(<%*]+$", "")

        if before == "" or before:sub(-1):find("[%.!%?\n]") then
            local first, rest = word:match("^([\192-\223][\128-\191])(.*)$")
            return first and CYRILLIC_UPPER[first] and (CYRILLIC_UPPER[first] .. rest) or word
        end

        return word
    end))
end

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

    text = ApplyTokenForms(text, female)

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
    if not IsTranslationOn("QUEST_TRANSLATIONS") then
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

if not IS_RETAIL then
    HookQuestGiverText("GetTitleText", "title")
    HookQuestGiverText("GetQuestText", "description")
    HookQuestGiverText("GetObjectiveText", "objective")
    HookQuestGiverText("GetProgressText", "progress")
    HookQuestGiverText("GetRewardText", "completion")
end

if GetQuestLogQuestText and not IS_RETAIL then
    local originalGetQuestLogQuestText = GetQuestLogQuestText

    GetQuestLogQuestText = function(...)
        local description, objective = originalGetQuestLogQuestText(...)

        if IsTranslationOn("QUEST_TRANSLATIONS") then
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
        if not IsTranslationOn("QUEST_TRANSLATIONS")
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
        if not IsTranslationOn("QUEST_TRANSLATIONS") then
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
        if not IsTranslationOn("QUEST_TRANSLATIONS") then
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

-- Retail draws the quest-giver window and the map's quest log through QuestInfo_Display. The
-- translation goes onto its text widgets after Blizzard fills them; the client API stays untouched.
local function GetDisplayedQuestID()
    if IS_RETAIL and QuestInfoFrame and QuestInfoFrame.questLog and C_QuestLog and C_QuestLog.GetSelectedQuest then
        return C_QuestLog.GetSelectedQuest()
    end

    return GetQuestID and GetQuestID()
end

local function SetQuestWidgetText(widget, text)
    if widget and text and text ~= "" then
        widget:SetText(ApplyPlayerTokens(text))
    end
end

if IS_RETAIL and QuestInfo_Display then
    hooksecurefunc("QuestInfo_Display", function()
        if not IsTranslationOn("QUEST_TRANSLATIONS") then
            return
        end

        local questID = GetDisplayedQuestID()
        local questData = GetDataByID("quest", questID)

        if not questData then
            return
        end

        -- The title carries quest-type icons around the name; only the name is swapped
        local title = QuestInfoTitleHeader and QuestInfoTitleHeader:GetText()
        local englishTitle = QuestInfoFrame.questLog and C_QuestLog.GetTitleForQuestID(questID) or GetTitleText()
        local first, last

        if title and englishTitle and englishTitle ~= "" then
            first, last = title:find(englishTitle, 1, true)
        end

        if first and questData.title and questData.title ~= "" then
            QuestInfoTitleHeader:SetText(title:sub(1, first - 1) .. ApplyPlayerTokens(questData.title) .. title:sub(last + 1))
        end

        SetQuestWidgetText(QuestInfoDescriptionText, questData.description)
        SetQuestWidgetText(QuestInfoObjectivesText, questData.objective)
        SetQuestWidgetText(QuestInfoRewardText, questData.completion)
    end)
end

if IS_RETAIL and QuestFrameProgressPanel_OnShow then
    hooksecurefunc("QuestFrameProgressPanel_OnShow", function()
        if not IsTranslationOn("QUEST_TRANSLATIONS") then
            return
        end

        local questData = GetDataByID("quest", GetQuestID())

        if questData then
            SetQuestWidgetText(QuestProgressTitleText, questData.title)
            SetQuestWidgetText(QuestProgressText, questData.progress)
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

        local questID = GetDisplayedQuestID()

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

-- Retail dropped the OnTooltipSet* scripts; its data post-calls fire for every tooltip on each
-- rebuild, so the cached map is dropped first and only named tooltips (TextLeftN lines) are handled
local function OnTooltipData(handler)
    return function(tooltip, data)
        if tooltip and tooltip.GetName and tooltip:GetName() then
            tooltip.matreshkaCacheKey = nil
            handler(tooltip, data)
        end
    end
end

-- Classic clients build buff and debuff tooltips natively, without tooltip data and without a Lua
-- Show: the aura comes from the arguments of the call that set the tooltip, and Show then runs
-- the other Show hooks (interface strings such as "54 minutes remaining", the ID line)
local AURA_TOOLTIP_SETTERS = {
    SetUnitAura = "GetAuraDataByIndex",
    SetUnitBuff = "GetBuffDataByIndex",
    SetUnitDebuff = "GetDebuffDataByIndex",
    SetUnitAuraByAuraInstanceID = "GetAuraDataByAuraInstanceID",
    SetUnitBuffByAuraInstanceID = "GetAuraDataByAuraInstanceID",
    SetUnitDebuffByAuraInstanceID = "GetAuraDataByAuraInstanceID",
}

-- Register scripts to frames
if IS_RETAIL then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipData(HandleItemTooltip))
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Spell, OnTooltipData(HandleSpellTooltip))
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, OnTooltipData(HandleUnitTooltip))
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.UnitAura, OnTooltipData(HandleAuraTooltip))
else
    GameTooltip:HookScript("OnTooltipSetItem", HandleItemTooltip)
    GameTooltip:HookScript("OnTooltipSetSpell", HandleSpellTooltip)
    GameTooltip:HookScript("OnTooltipSetUnit", HandleUnitTooltip)

    for method, getter in pairs(AURA_TOOLTIP_SETTERS) do
        local lookup = C_UnitAuras and C_UnitAuras[getter]

        if GameTooltip[method] and lookup then
            hooksecurefunc(GameTooltip, method, function(tooltip, unit, key, filter)
                local aura

                if getter == "GetAuraDataByAuraInstanceID" then
                    aura = lookup(unit, key)
                else
                    aura = lookup(unit, key, filter)
                end

                HandleAuraTooltip(tooltip, aura and { id = aura.spellId })
                tooltip:Show()
            end)
        end
    end
end

GameTooltip:HookScript("OnTooltipCleared", ResetTooltipState)
GameTooltip:HookScript("OnUpdate", OnTooltipUpdate)
hooksecurefunc(GameTooltip, "Show", AppendBottomLines)

-- The item comparison tooltips ("Currently Equipped" side panels) are separate frames, so they
-- need the same item translation hooks. They only ever show items.
for _, frameName in ipairs({ "ShoppingTooltip1", "ShoppingTooltip2", "ShoppingTooltip3",
                             "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2" }) do
    local shopping = _G[frameName]

    if shopping and shopping.HookScript then
        if not IS_RETAIL then
            shopping:HookScript("OnTooltipSetItem", HandleItemTooltip)
        end

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
    if not IsTranslationOn("SPELL_TRANSLATIONS") then
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

-- Retail keys keep $R / $C where the client put the player's race and class; a missed line is
-- tried once more with those English words folded back into the marks
local function CaseInsensitive(word)
    return (word:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0"):gsub("%a", function(char)
        return "[" .. char:upper() .. char:lower() .. "]"
    end))
end

local function FoldRaceClass(key)
    local folded = key
    local raceName = UnitRace and UnitRace("player")
    local className = UnitClass and UnitClass("player")

    if raceName and raceName ~= "" then
        folded = folded:gsub("%f[%a]" .. CaseInsensitive(raceName) .. "%f[%A]", "$R")
    end

    if className and className ~= "" then
        folded = folded:gsub("%f[%a]" .. CaseInsensitive(className) .. "%f[%A]", "$C")
    end

    return folded ~= key and folded or nil
end

local function LookupFolded(bucket, key)
    local folded = IS_RETAIL and bucket and FoldRaceClass(key)
    return folded and bucket[folded] or nil
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

    return bucket[key] or (chatBucket and chatBucket[key]) or LookupFolded(chatBucket, key), key
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
    if not IsTranslationOn("GOSSIP_TRANSLATIONS") then
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

    return bucket[key] or LookupFolded(bucket, key), key
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
    if not IsTranslationOn("NPC_CHAT_TRANSLATIONS") then
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
    if IS_RETAIL or not IsTranslationOn("NPC_CHAT_TRANSLATIONS") then
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
    if IS_RETAIL or not (MatreshkaOptions and MatreshkaOptions["TRANSLATIONS_ENABLED"] ~= false
        and MatreshkaOptions["SELECTED_LANGUAGE"] == "ru") then
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
    if not IsTranslationOn("MAIL_TRANSLATIONS") then
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

    -- Retail ships no English item names; the client finds the id of a known item by its name
    if IS_RETAIL then
        local itemID = C_Item and C_Item.GetItemInfoInstant and C_Item.GetItemInfoInstant(englishName)
        local entry = itemID and GetEffectiveEntry("item", itemID)

        return entry and entry.name and NormalizeForLookup(entry.name) or nil
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
    if not IsTranslationOn("BOOK_TRANSLATIONS") then
        return
    end

    if event == "ITEM_TEXT_BEGIN" then
        local title = GetTranslatedItemName(ItemTextGetItem())

        if title and ItemTextTitleText then
            ItemTextTitleText:SetText(title)
        elseif title and ItemTextFrame.SetTitle then
            ItemTextFrame:SetTitle(title)
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

    if ItemTextScrollFrameScrollBar then
        ItemTextScrollFrameScrollBar:SetValue(0)
    elseif ItemTextScrollFrame.ScrollBar and ItemTextScrollFrame.ScrollBar.ScrollToBegin then
        ItemTextScrollFrame.ScrollBar:ScrollToBegin()
    end
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
    local strings = IsTranslationOn("MAIL_TRANSLATIONS") and GetAuctionMailStrings()

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
    local strings = IsTranslationOn("MAIL_TRANSLATIONS") and GetAuctionMailStrings()
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
    if not IsTranslationOn("MAIL_TRANSLATIONS") then
        return nil
    end

    local translations = MatreshkaTranslations and MatreshkaTranslations[MatreshkaOptions["SELECTED_LANGUAGE"]]

    return translations and translations.mailFrame
end

local function SwapMailText(widget, globalNames, strings, afterRestore)
    if not (widget and widget.GetText) then
        return false
    end

    local text = widget:GetText()

    for _, globalName in ipairs(type(globalNames) == "table" and globalNames or { globalNames }) do
        if text ~= nil and text == _G[globalName] and strings[globalName] then
            ReplaceText(widget, strings[globalName], "MAIL_TRANSLATIONS", afterRestore)
            return true
        end
    end

    return false
end

local function ResizeMailTab(tab)
    if PanelTemplates_TabResize then
        PanelTemplates_TabResize(tab, 0)
    end
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

        if SwapMailText(tab, globalName, strings, ResizeMailTab) then
            ResizeMailTab(tab)
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

-- Game interface: tooltips, window tabs, reputation, the social window, the Esc menu and dropdown
-- menus. The Russian side is the official ruRU client string stored under the same GlobalStrings
-- name (Database/Interface); the English side is read from the running client, so only text equal
-- to the client's own string is replaced. Faction names are looked up by faction ID.
local interfaceExact, interfaceFormats

local function GetInterfaceData()
    local languageCode = MatreshkaOptions and MatreshkaOptions["SELECTED_LANGUAGE"]

    return Matreshka_Interface and languageCode and Matreshka_Interface[languageCode]
end

-- Lua pattern for text built from a client format string; each conversion becomes a capture.
local function FormatToPattern(englishFormat)
    local parts, position = {}, 1

    while true do
        local first, last = englishFormat:find("%%[%d%.%-%+# ]*[sdfiguxXc%%]", position)

        if not first then
            break
        end

        parts[#parts + 1] = escapeMagic(englishFormat:sub(position, first - 1))
        parts[#parts + 1] = englishFormat:sub(last, last) == "%" and "%%" or "(.-)"
        position = last + 1
    end

    parts[#parts + 1] = escapeMagic(englishFormat:sub(position))

    return "^" .. table.concat(parts) .. "$"
end

-- Retail formats also carry %c (the sign before a stat) and plural codes |4Day:Days;. A plural code
-- gives one English text per form; each is turned into a pattern with the conversion letters in
-- order, the literal tail after the last conversion and the amount of literal text (specificity).
local CONVERSION = "%%[%d%.%-%+# ]*[sdfiguxXc%%]"

local function ExpandPluralForms(english)
    local first, last, forms = english:find("|4([^;]*);")

    if not first then
        return { english }
    end

    local texts = {}

    for form in forms:gmatch("[^:]+") do
        for _, rest in ipairs(ExpandPluralForms(english:sub(last + 1))) do
            texts[#texts + 1] = english:sub(1, first - 1) .. form .. rest
        end
    end

    return texts
end

local function RetailFormatToPattern(english)
    local parts, kinds, position, literal = { "^" }, {}, 1, 0

    while true do
        local first, last = english:find(CONVERSION, position)

        if not first then
            break
        end

        parts[#parts + 1] = escapeMagic(english:sub(position, first - 1))
        literal = literal + (first - position)
        local kind = english:sub(last, last)

        if kind == "%" then
            parts[#parts + 1] = "%%"
        else
            parts[#parts + 1] = kind == "c" and "(.)" or "(.-)"
            kinds[#kinds + 1] = kind
        end

        position = last + 1
    end

    parts[#parts + 1] = escapeMagic(english:sub(position))
    literal = literal + (#english - position + 1)
    parts[#parts + 1] = "$"

    return table.concat(parts), kinds, english:sub(position), literal
end

-- Russian plural codes |4одна:две:пять; after formatting, by the number in front of them
local function ResolvePlurals(text)
    if not Matreshka_PluralForm then
        return text
    end

    return (text:gsub("(%d[%d%.,]*)(%s*)|4([^;]*);", function(number, space, forms)
        local list = {}

        for form in forms:gmatch("[^:]+") do
            list[#list + 1] = form
        end

        return number .. space .. (Matreshka_PluralForm(number, list) or "")
    end))
end

-- One pattern per plural form of a client format
local function AddFormatForms(english, translated)
    for _, form in ipairs(ExpandPluralForms(english)) do
        local pattern, kinds, tail, literal = RetailFormatToPattern(form)

        if #kinds == 0 then
            local resolved = ResolvePlurals(translated)

            if not resolved:find("|4", 1, true) then
                interfaceExact[form] = resolved
            end
        else
            interfaceFormats[#interfaceFormats + 1] = {
                prefix = form:match("^[^%%]*"),
                suffix = tail ~= "" and tail or nil,
                pattern = pattern,
                kinds = kinds,
                literal = literal,
                translated = translated,
            }
        end
    end
end

local function BuildInterfaceLookup()
    interfaceExact, interfaceFormats = {}, {}

    local data = GetInterfaceData()

    if not data then
        return
    end

    for name, translated in pairs(data.strings) do
        local english = _G[name]

        if type(english) == "string" and english ~= "" and english ~= translated then
            if IS_RETAIL and (english:gsub("%%%%", ""):find("%%[%d%.%-%+# ]*[sdfiguxXc]") or english:find("|4", 1, true)) then
                AddFormatForms(english, translated)
            elseif english:gsub("%%%%", ""):find("%%[%d%.%-%+# ]*[sdfiguxXc]") then
                interfaceFormats[#interfaceFormats + 1] = {
                    prefix = english:match("^[^%%]*"),
                    pattern = FormatToPattern(english),
                    translated = translated,
                }

                -- Font strings keep the plural code unresolved, tooltip lines built by the client
                -- (buff time left) come with it resolved: both are matched
                if english:find("|4", 1, true) then
                    AddFormatForms(english, translated)
                end
            else
                interfaceExact[english] = translated
            end
        end
    end

    -- Retail: the most specific format is tried first, so a short one cannot take a longer line
    if IS_RETAIL then
        table.sort(interfaceFormats, function(a, b)
            return (a.literal or 0) > (b.literal or 0)
        end)
    end

    -- Retail item types (Sword, Plate, ...) are not client globals, so they ship as plain pairs
    for english, translated in pairs(data.exact or {}) do
        if interfaceExact[english] == nil then
            interfaceExact[english] = translated
        end
    end
end

-- "Title |cffffd200(Key)|r": the key binding suffix MicroButtonTooltipText adds to a title
local KEY_BINDING_SUFFIX = "^(.-)( |c%x%x%x%x%x%x%x%x%(.+%)|r)$"

local function TranslateInterfaceText(text)
    if type(text) ~= "string" or text == "" then
        return nil
    end

    if not interfaceExact then
        BuildInterfaceLookup()
    end

    local translated = interfaceExact[text]

    if translated then
        return translated
    end

    local base, keySuffix = text:match(KEY_BINDING_SUFFIX)

    if base and interfaceExact[base] then
        return interfaceExact[base] .. keySuffix
    end

    -- A whole label in one color ("|cff808080Not Bound|r" on an empty key binding)
    local colorOpen, colored = text:match("^(|c%x%x%x%x%x%x%x%x)(.-)|r$")

    if colored and interfaceExact[colored] then
        return colorOpen .. interfaceExact[colored] .. "|r"
    end

    for _, entry in ipairs(interfaceFormats) do
        if text:sub(1, #entry.prefix) == entry.prefix
            and (not entry.suffix or text:sub(-#entry.suffix) == entry.suffix) then
            local values = { text:match(entry.pattern) }

            if values[1] then
                for i, value in ipairs(values) do
                    values[i] = interfaceExact[value] or value

                    -- %c takes the character code (the sign of a stat line)
                    if entry.kinds and entry.kinds[i] == "c" then
                        values[i] = value:byte()
                    end
                end

                local ok, result = pcall(format, entry.translated, unpack(values))

                -- Russian plural codes are resolved here: the client would pick by English rules
                if ok then
                    return ResolvePlurals(result)
                end
            end
        end
    end

    return nil
end

local interfaceTooltipBusy = false

local function TranslateInterfaceTooltip(tooltip)
    if interfaceTooltipBusy or not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    local tooltipName = tooltip:GetName()
    local changed = false

    for i = 1, tooltip:NumLines() do
        local line = _G[tooltipName .. "TextLeft" .. i]
        local text = line and line:GetText()
        local translated = IsReadable(text) and TranslateInterfaceText(text)

        if translated then
            line:SetText(translated)
            changed = true
        end

        -- Retail item tooltips put the type (Sword, Plate) and the speed in the right column
        local right = IS_RETAIL and _G[tooltipName .. "TextRight" .. i]
        local rightText = right and right:GetText()
        local rightTranslated = right and IsReadable(rightText) and TranslateInterfaceText(rightText)

        if rightTranslated then
            right:SetText(rightTranslated)
            changed = true
        end
    end

    if changed then
        interfaceTooltipBusy = true
        tooltip:Show()
        interfaceTooltipBusy = false
    end
end

hooksecurefunc(GameTooltip, "Show", TranslateInterfaceTooltip)

-- Every font string of a frame and its children whose text is a known client string
local function TranslateStaticTexts(frame)
    if not frame or frame:IsForbidden() then
        return
    end

    for _, region in ipairs({ frame:GetRegions() }) do
        if region:GetObjectType() == "FontString" then
            local translated = TranslateInterfaceText(region:GetText())

            if translated then
                ReplaceText(region, translated, "INTERFACE_TRANSLATIONS")
            end
        end
    end

    for _, child in ipairs({ frame:GetChildren() }) do
        TranslateStaticTexts(child)
    end
end

-- minWidth/maxWidth as in the tab template's own resize call
local function TranslateTabs(tabPrefix, count, minWidth, maxWidth)
    local function Resize(tab)
        if PanelTemplates_TabResize then
            PanelTemplates_TabResize(tab, 0, nil, minWidth, maxWidth)
        end
    end

    for i = 1, count do
        local tab = _G[tabPrefix .. i]
        local translated = tab and TranslateInterfaceText(tab:GetText())

        if translated then
            ReplaceText(tab, translated, "INTERFACE_TRANSLATIONS", Resize)
            Resize(tab)
        end
    end
end

-- CharacterFrameTabButtonTemplate (character and social window tabs) resizes with these limits on show
local function TranslateTemplateTabs(tabPrefix, count, parent)
    TranslateTabs(tabPrefix, count, 36, parent and parent.maxTabWidth or 88)
end

local function TranslateCharacterTabs()
    if IsTranslationOn("INTERFACE_TRANSLATIONS") then
        TranslateTemplateTabs("CharacterFrameTab", 5, CharacterFrame)
    end
end

-- Rows are rebuilt the way ReputationFrame_Update fills them; names come by faction ID.
local function TranslateReputationFrame()
    local data = GetInterfaceData()

    if not (data and IsTranslationOn("INTERFACE_TRANSLATIONS")) then
        return
    end

    local offset = FauxScrollFrame_GetOffset(ReputationListScrollFrame)
    local numFactions = GetNumFactions()

    for i = 1, NUM_FACTIONS_DISPLAYED do
        local factionIndex = offset + i

        if factionIndex > numFactions then
            break
        end

        local name, _, standingID, _, _, _, _, _, isHeader, _, _, isWatched, _, factionID = GetFactionInfo(factionIndex)
        local faction = factionID and data.factions[factionID]
        local translatedName = faction and faction[1] or TranslateInterfaceText(name)

        if isHeader then
            local header = _G["ReputationHeader" .. i]

            if translatedName and header and header.Text then
                ReplaceText(header.Text, translatedName, "INTERFACE_TRANSLATIONS")
            end
        else
            local bar = _G["ReputationBar" .. i]
            local nameText = _G["ReputationBar" .. i .. "FactionName"]
            local standingText = _G["ReputationBar" .. i .. "FactionStanding"]
            local standing = data.strings["FACTION_STANDING_LABEL" .. standingID]

            if translatedName and nameText then
                local check = _G["ReputationBar" .. i .. "Check"]

                -- The watched checkmark sits right after the name, as ReputationFrame_Update places it
                local function PlaceCheck()
                    if isWatched and check then
                        check:SetPoint("LEFT", nameText, "LEFT", nameText:GetStringWidth(), 0)
                    end
                end

                ReplaceText(nameText, translatedName, "INTERFACE_TRANSLATIONS", PlaceCheck)
                PlaceCheck()
            end

            -- The bar's OnLeave puts standingText back on the label
            if standing and standingText then
                ReplaceText(standingText, standing, "INTERFACE_TRANSLATIONS", function(_, original)
                    bar.standingText = original
                end)
                bar.standingText = standing
            end

            if factionIndex == GetSelectedFaction() and ReputationDetailFrame and ReputationDetailFrame:IsShown() then
                if translatedName then
                    ReplaceText(ReputationDetailFactionName, translatedName, "INTERFACE_TRANSLATIONS")
                end

                if faction and faction[2] ~= "" then
                    ReplaceText(ReputationDetailFactionDescription, faction[2], "INTERFACE_TRANSLATIONS")
                end
            end
        end
    end
end

local function TranslateReputationTexts()
    if IsTranslationOn("INTERFACE_TRANSLATIONS") then
        TranslateStaticTexts(ReputationFrame)
        TranslateStaticTexts(ReputationDetailFrame)
    end
end

local function TranslateSocialWindow()
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    TranslateTemplateTabs("FriendsFrameTab", 4, FriendsFrame)
    TranslateTabs("FriendsTabHeaderTab", 2)
    TranslateStaticTexts(FriendsFrame)
    TranslateStaticTexts(RaidFrame)
end

local function TranslateGameMenu(menu)
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    for button in menu.buttonPool:EnumerateActive() do
        local translated = TranslateInterfaceText(button:GetText())

        if translated then
            button:SetText(translated)
        end
    end

    local header = menu.Header
    local translated = header and header.Text and TranslateInterfaceText(header.Text:GetText())

    if translated then
        header:Setup(translated)
    end
end

-- Dropdown menus: an extra initializer per element swaps the label before the menu measures its
-- width. Blizzard runs initializers through secureexecuterange, so menu actions stay untainted.
local INTERFACE_MENU_TAGS = {
    "MENU_FCF_TAB", "MENU_CHAT_SHORTCUTS",
    "MENU_UNIT_SELF", "MENU_UNIT_PET", "MENU_UNIT_OTHERPET", "MENU_UNIT_PARTY", "MENU_UNIT_PLAYER",
    "MENU_UNIT_ENEMY_PLAYER", "MENU_UNIT_RAID_PLAYER", "MENU_UNIT_RAID", "MENU_UNIT_FRIEND",
    "MENU_UNIT_FRIEND_OFFLINE", "MENU_UNIT_BN_FRIEND", "MENU_UNIT_BN_FRIEND_OFFLINE", "MENU_UNIT_GUILD",
    "MENU_UNIT_GUILD_OFFLINE", "MENU_UNIT_CHAT_ROSTER", "MENU_UNIT_TARGET", "MENU_UNIT_FOCUS", "MENU_UNIT_BOSS",
    "MENU_UNIT_ARENAENEMY", "MENU_UNIT_TEAM", "MENU_UNIT_VEHICLE", "MENU_UNIT_RAID_TARGET_ICON",
    "MENU_UNIT_WORLD_STATE_SCORE", "MENU_UNIT_RECENT_ALLY", "MENU_UNIT_RECENT_ALLY_OFFLINE",
}

local function TranslateMenuElement(frame)
    local fontString = frame.fontString
    local translated = fontString and TranslateInterfaceText(fontString:GetText())

    if translated then
        fontString:SetTextToFit(translated)
    end
end

local function AddMenuTranslation(description)
    for _, element in description:EnumerateElementDescriptions() do
        element:AddInitializer(TranslateMenuElement)
        AddMenuTranslation(element)
    end
end

local function TranslateMenu(_, rootDescription)
    if IsTranslationOn("INTERFACE_TRANSLATIONS") then
        AddMenuTranslation(rootDescription)
    end
end

-- Retail reputation: the list is a ScrollBox of faction data rebuilt on every Update. Names go into
-- that data by faction ID and the provider is set again, so the rows are laid out in Russian.
local function TranslateStandingText(bar)
    local text = bar.BarText and bar.BarText:GetText()
    local translated = IsTranslationOn("INTERFACE_TRANSLATIONS") and IsReadable(text) and TranslateInterfaceText(text)

    if translated then
        bar.BarText:SetText(translated)
    end
end

local function TranslateRetailReputationRow(row)
    local bar = row.Content and row.Content.ReputationBar

    if bar and bar.TryShowReputationStandingText then
        if not bar.matreshkaHooked then
            bar.matreshkaHooked = true
            hooksecurefunc(bar, "TryShowReputationStandingText", TranslateStandingText)
        end

        TranslateStandingText(bar)
    end
end

local function TranslateRetailReputation(frame)
    local data = GetInterfaceData()
    local scrollBox = frame.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()

    if frame.matreshkaTranslating or not (data and IsTranslationOn("INTERFACE_TRANSLATIONS") and provider and provider.ForEach) then
        return
    end

    local changed = false

    provider:ForEach(function(element)
        local faction = element.factionID and data.factions[element.factionID]

        if faction and faction[1] and element.name ~= faction[1] then
            element.name = faction[1]
            changed = true
        end
    end)

    if changed then
        frame.matreshkaTranslating = true
        scrollBox:SetDataProvider(provider, ScrollBoxConstants.RetainScrollPosition)
        frame.matreshkaTranslating = false
    end

    if scrollBox.ForEachFrame then
        scrollBox:ForEachFrame(TranslateRetailReputationRow)
    end
end

local function TranslateRetailReputationDetail(detail)
    local data = GetInterfaceData()

    if not (data and IsTranslationOn("INTERFACE_TRANSLATIONS")) then
        return
    end

    local factionData = C_Reputation.GetFactionDataByIndex(C_Reputation.GetSelectedFaction())
    local faction = factionData and data.factions[factionData.factionID]

    if faction then
        ReplaceText(detail.Title, faction[1], "INTERFACE_TRANSLATIONS")

        if faction[2] ~= "" and detail.ScrollingDescription then
            detail.ScrollingDescription:SetText(faction[2])
        end
    end

    TranslateStaticTexts(detail)
end

-- Retail spellbook (Blizzard_PlayerSpells): each entry draws its name in UpdateVisuals
local function TranslateSpellBookItem(item)
    local info = item.spellBookItemInfo
    local spellID = info and (info.spellID or info.actionID)
    local entry = IsTranslationOn("SPELL_TRANSLATIONS") and spellID and GetEffectiveEntry("spell", spellID)

    if entry and entry.name and entry.name ~= "" and item.Name then
        item.Name:SetText((entry.name:gsub("%[q%d?%]", "")))
    end

    local subName = item.SubName and item.SubName:GetText()
    local translated = IsTranslationOn("INTERFACE_TRANSLATIONS") and IsReadable(subName) and TranslateInterfaceText(subName)

    if translated then
        item.SubName:SetText(translated)
    end
end

-- One label or button: a pair from the window's own table first (skills, rank texts), then the
-- client strings
local function TranslateWidget(widget, windowPairs)
    local text = widget and widget:GetText()
    local translated = text and (windowPairs and windowPairs[text] or TranslateInterfaceText(text))

    if translated then
        ReplaceText(widget, translated, "INTERFACE_TRANSLATIONS")
    end
end

local function GetWindowPairs(name)
    local data = GetInterfaceData()
    return data and data[name]
end

-- Gossip window: the Goodbye button under the dialogue
local function TranslateGossipButtons()
    local panel = GossipFrame and GossipFrame.GreetingPanel

    if panel and IsTranslationOn("INTERFACE_TRANSLATIONS") then
        TranslateWidget(panel.GoodbyeButton)
    end
end

-- Skill window (Skills tab of the character frame): skill lines, category headers and the selected
-- skill's description come from the client's skill tables
local function TranslateSkillFrame()
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    local skills = GetWindowPairs("skills")

    for i = 1, SKILLS_TO_DISPLAY or 12 do
        TranslateWidget(_G["SkillTypeLabel" .. i], skills)
        TranslateWidget(_G["SkillRankFrame" .. i .. "SkillName"], skills)
    end

    TranslateWidget(SkillDetailStatusBarSkillName, skills)
    TranslateWidget(SkillFrameCollapseAllButton)
    TranslateWidget(SkillFrameCancelButton)

    -- The detail line is the client format SKILL_DESCRIPTION around the skill's own description
    local selected = GetSelectedSkill and GetSelectedSkill()
    local description = selected and selected > 0 and select(13, GetSkillLineInfo(selected))
    local translated = description and skills and skills[description]

    if translated and SkillDetailDescriptionText then
        ReplaceText(SkillDetailDescriptionText, format(SKILL_DESCRIPTION, "", translated), "INTERFACE_TRANSLATIONS")
    end
end

-- Spellbook (Vanilla and TBC layout): title, page number, the ranks checkbox and the rank line under
-- each spell. The client sets the rank once the spell data has loaded, so the open book is also
-- checked on a timer.
local function TranslateSpellbookTexts()
    if not (IsTranslationOn("INTERFACE_TRANSLATIONS") and SpellBookFrame:IsShown()) then
        return
    end

    local subtexts = GetWindowPairs("subtexts")

    TranslateWidget(SpellBookTitleText)
    TranslateWidget(SpellBookPageText)
    TranslateWidget(ShowAllSpellRanksCheckboxText)

    for i = 1, SPELLS_PER_PAGE or 12 do
        local button = _G["SpellButton" .. i]
        TranslateWidget(button and (button.SpellSubName or _G["SpellButton" .. i .. "SubSpellName"]), subtexts)
    end
end

-- Macro window (Blizzard_MacroUI, on demand): title, labels, buttons, tabs and the character counter.
-- Macro names and bodies are the player's own text and are left alone.
local MACRO_WIDGETS = { "MacroFrameEnterMacroText", "MacroEditButton", "MacroCancelButton", "MacroSaveButton",
    "MacroDeleteButton", "MacroNewButton", "MacroExitButton", "MacroFrameCharLimitText" }

-- Space kept between the second tab and the frame's right edge: its right cap reaches past the tab
local MACRO_TAB_EDGE = 12

-- As the tab template resizes itself on show; the Russian titles are wider, so the second tab is
-- then narrowed to the room left in the frame and its title truncated
local function ResizeMacroTabs()
    if not PanelTemplates_TabResize then
        return
    end

    for i = 1, 2 do
        PanelTemplates_TabResize(_G["MacroFrameTab" .. i], MacroFrame.tabPadding, nil, MacroFrame.minTabWidth, MacroFrame.maxTabWidth)
    end

    local frameRight, firstLeft = MacroFrame:GetRight(), MacroFrameTab1:GetLeft()
    local room = frameRight and firstLeft and frameRight - firstLeft - MacroFrameTab1:GetWidth() - MACRO_TAB_EDGE

    if room and MacroFrameTab2:GetWidth() > room then
        PanelTemplates_TabResize(MacroFrameTab2, nil, room)
    end
end

local function TranslateMacroCounter()
    if IsTranslationOn("INTERFACE_TRANSLATIONS") then
        TranslateWidget(MacroFrameCharLimitText)
    end
end

local function TranslateMacroFrame()
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    -- The title is an unnamed font string of the frame, next to the selected macro's name
    for _, region in ipairs({ MacroFrame:GetRegions() }) do
        if region:GetObjectType() == "FontString" and region:GetText() == CREATE_MACROS then
            TranslateWidget(region)
        end
    end

    for _, name in ipairs(MACRO_WIDGETS) do
        TranslateWidget(_G[name])
    end

    for i = 1, 2 do
        local tab = _G["MacroFrameTab" .. i]
        local translated = tab and TranslateInterfaceText(tab:GetText())

        if translated then
            ReplaceText(tab, translated, "INTERFACE_TRANSLATIONS", ResizeMacroTabs)
        end
    end

    ResizeMacroTabs()
end

-- The tab template resizes itself on every show, after the window's own OnShow
local function RefitMacroTabs()
    if IsTranslationOn("INTERFACE_TRANSLATIONS") then
        ResizeMacroTabs()
    end
end

-- Tooltips the client sets without a Lua Show (the truncated macro tab, the repair button)
local function TranslateOwnedTooltip()
    TranslateInterfaceTooltip(GameTooltip)
end

-- Merchant window: page buttons and number, repair label, tabs and the buyback title. Item names
-- and the merchant's own name are left alone.
local function TranslateMerchantFrame()
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    TranslateWidget(MerchantPageText)
    TranslateWidget(MerchantRepairText)

    for _, button in ipairs({ MerchantPrevPageButton, MerchantNextPageButton }) do
        for _, region in ipairs({ button:GetRegions() }) do
            if region:GetObjectType() == "FontString" then
                TranslateWidget(region)
            end
        end
    end

    if MerchantNameText:GetText() == MERCHANT_BUYBACK then
        TranslateWidget(MerchantNameText)
    end

    TranslateTemplateTabs("MerchantFrameTab", 2, MerchantFrame)
end

-- Chat channel window (Blizzard_Channels, on demand). Channel and category names come from the
-- window's own table: here "Trade" is the trade channel and "Custom" a channel category.
local function TranslateChannelName(name)
    local channels = GetWindowPairs("channels")

    if not (channels and name and name ~= "") then
        return nil
    end

    local base, zone = name:match("^(.-) %- (.+)$")

    return channels[name] or (base and channels[base] and channels[base] .. ": " .. zone) or TranslateInterfaceText(name)
end

-- "5. General " in the list: only the name part changes, number, member count and color stay
local function TranslateChannelList(list)
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    for _, button in ipairs(list.buttons or {}) do
        local name = button.GetChannelName and button:GetChannelName()
        local text = button.Text and button.Text:GetText()
        local translated = text and TranslateChannelName(name)
        local first, last

        if translated then
            first, last = text:find(name, 1, true)
        end

        if first then
            ReplaceText(button.Text, text:sub(1, first - 1) .. translated .. text:sub(last + 1), "INTERFACE_TRANSLATIONS")
        end
    end
end

local function TranslateChannelRoster(roster)
    local text = IsTranslationOn("INTERFACE_TRANSLATIONS") and roster.ChannelName and roster.ChannelName:GetText()
    local translated = text and TranslateChannelName(text)

    if translated then
        ReplaceText(roster.ChannelName, translated, "INTERFACE_TRANSLATIONS")
    end
end

local function TranslateChannelFrame()
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    TranslateWidget(ChannelFrame.TitleText)
    TranslateWidget(ChannelFrame.NewButton)
    TranslateWidget(ChannelFrame.SettingsButton)
    TranslateChannelList(ChannelFrame.ChannelList)
    TranslateChannelRoster(ChannelFrame.ChannelRoster)
end

-- Timers under the player's buff and debuff icons ("54 m"): the client's one-letter abbreviation is
-- rebuilt with the Russian one after each timer update
local durationFormats

local function GetDurationFormats()
    if not durationFormats then
        durationFormats = {}

        for name, translated in pairs(GetWindowPairs("durations") or {}) do
            local prefix, suffix

            if type(_G[name]) == "string" then
                prefix, suffix = _G[name]:match("^(.-)%%d(.*)$")
            end

            if prefix then
                durationFormats[#durationFormats + 1] = { "^" .. escapeMagic(prefix) .. "(%d+)" .. escapeMagic(suffix) .. "$", translated }
            end
        end
    end

    return durationFormats
end

local function TranslateAuraDuration(button)
    local text = IsTranslationOn("INTERFACE_TRANSLATIONS") and button.Duration and button.Duration:GetText()

    if not text or text == "" then
        return
    end

    for _, entry in ipairs(GetDurationFormats()) do
        local number = text:match(entry[1])

        if number then
            button.Duration:SetText(format(entry[2], tonumber(number)))
            return
        end
    end
end

-- Options window (Blizzard_Settings): the category list and the settings list are ScrollBoxes, each
-- row is translated after its own initializer. Blizzard runs these callbacks through
-- secureexecuterange, so the panel's code stays untainted. Dropdowns get the element initializer of
-- the dropdown menus above when their menu is built, and their shown choice after each update.
local settingsOwner = {}
local hookedDropdowns = setmetatable({}, { __mode = "k" })

local function TranslateDropdownMenu(_, description)
    if description and IsTranslationOn("INTERFACE_TRANSLATIONS") then
        AddMenuTranslation(description)
    end
end

local function TranslateDropdownText(dropdown)
    if IsTranslationOn("INTERFACE_TRANSLATIONS") then
        TranslateStaticTexts(dropdown)
    end
end

local function HookDropdowns(frame)
    if frame:IsForbidden() then
        return
    end

    if frame.RegisterMenu and frame.UpdateToMenuSelections and not hookedDropdowns[frame] then
        hookedDropdowns[frame] = true
        hooksecurefunc(frame, "RegisterMenu", TranslateDropdownMenu)
        hooksecurefunc(frame, "UpdateToMenuSelections", TranslateDropdownText)
    end

    for _, child in ipairs({ frame:GetChildren() }) do
        HookDropdowns(child)
    end
end

local function TranslateSettingsRow(_, frame)
    if IsTranslationOn("INTERFACE_TRANSLATIONS") then
        TranslateStaticTexts(frame)
    end

    HookDropdowns(frame)
end

-- The Game and AddOns tabs take their width from the text once, when loaded
local function ResizeSettingsTab(tab)
    tab:SetWidth(tab.Text:GetStringWidth() + 40)
end

local function TranslateSettingsPanel()
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    for _, tab in ipairs({ SettingsPanel.GameTab, SettingsPanel.AddOnsTab }) do
        local translated = tab and tab.Text and TranslateInterfaceText(tab.Text:GetText())

        if translated then
            ReplaceText(tab.Text, translated, "INTERFACE_TRANSLATIONS", function() ResizeSettingsTab(tab) end)
            ResizeSettingsTab(tab)
        end
    end

    TranslateStaticTexts(SettingsPanel)
end

local function TranslateSettingsHeader()
    if IsTranslationOn("INTERFACE_TRANSLATIONS") then
        TranslateStaticTexts(SettingsPanel.Container.SettingsList.Header)
    end
end

-- Auction house (Blizzard_AuctionUI, on demand): the three Blizzard panels and their tabs. Tabs and
-- frames other addons add to the window are left alone, so are item and player names in the lists.
local AUCTION_ROWS = { BrowseButton = "NUM_BROWSE_TO_DISPLAY", BidButton = "NUM_BIDS_TO_DISPLAY",
    AuctionsButton = "NUM_AUCTIONS_TO_DISPLAY" }

local auctionOwnNames = {}

local function TranslateAuctionTexts(frame, categories)
    if frame:IsForbidden() then
        return
    end

    for _, region in ipairs({ frame:GetRegions() }) do
        if region:GetObjectType() == "FontString" and not auctionOwnNames[region] then
            TranslateWidget(region, categories)
        end
    end

    for _, child in ipairs({ frame:GetChildren() }) do
        TranslateAuctionTexts(child, categories)
    end
end

local function TranslateAuctionPanel(panel)
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    TranslateAuctionTexts(panel, GetWindowPairs("auctionCategories"))

    -- Put together by the client from two strings
    local optional = BUYOUT_PRICE and OPTIONAL and BUYOUT_PRICE .. " |cff808080(" .. OPTIONAL .. ")|r"
    local price, note = TranslateInterfaceText(BUYOUT_PRICE), TranslateInterfaceText(OPTIONAL)

    if AuctionsBuyoutText and optional and AuctionsBuyoutText:GetText() == optional and price and note then
        ReplaceText(AuctionsBuyoutText, price .. " |cff808080(" .. note .. ")|r", "INTERFACE_TRANSLATIONS")
    end
end

local function TranslateAuctionFrame()
    if not IsTranslationOn("INTERFACE_TRANSLATIONS") then
        return
    end

    TranslateTemplateTabs("AuctionFrameTab", 3, AuctionFrame)

    for _, panel in ipairs({ AuctionFrameBrowse, AuctionFrameBid, AuctionFrameAuctions }) do
        TranslateAuctionPanel(panel)
    end
end

-- The search button rewrites "Searching for items" every frame while a search runs
local function TranslateAuctionSearching()
    if BrowseNoResultsText:GetText() == SEARCHING_FOR_ITEMS and IsTranslationOn("INTERFACE_TRANSLATIONS") then
        TranslateWidget(BrowseNoResultsText)
    end
end

local interfaceHooked = {}

-- Classic windows; several of them load on demand, so each is hooked once it exists
local function InstallClassicWindowHooks()
    if not interfaceHooked.gossip and GossipFrame and GossipFrame.HookScript then
        interfaceHooked.gossip = true
        GossipFrame:HookScript("OnShow", TranslateGossipButtons)
    end

    if not interfaceHooked.skills and SkillFrame and type(SkillFrame_UpdateSkills) == "function" then
        interfaceHooked.skills = true
        hooksecurefunc("SkillFrame_UpdateSkills", TranslateSkillFrame)
    end

    if not interfaceHooked.spellbookTexts and SpellBookFrame and SpellBookFrame.HookScript and SpellButton1 then
        interfaceHooked.spellbookTexts = true

        for i = 1, SPELLS_PER_PAGE or 12 do
            local button = _G["SpellButton" .. i]

            if button and type(button.UpdateButton) == "function" then
                hooksecurefunc(button, "UpdateButton", TranslateSpellbookTexts)
            end
        end

        if type(SpellBookFrame.UpdatePages) == "function" then
            hooksecurefunc(SpellBookFrame, "UpdatePages", TranslateSpellbookTexts)
        end

        local sinceRefresh = 0
        SpellBookFrame:HookScript("OnShow", TranslateSpellbookTexts)
        SpellBookFrame:HookScript("OnUpdate", function(_, elapsed)
            sinceRefresh = sinceRefresh + (elapsed or 0)

            if sinceRefresh >= 0.1 then
                sinceRefresh = 0
                TranslateSpellbookTexts()
            end
        end)
    end

    if not interfaceHooked.macros and MacroFrame and MacroFrameText then
        interfaceHooked.macros = true
        MacroFrame:HookScript("OnShow", TranslateMacroFrame)
        MacroFrameText:HookScript("OnTextChanged", TranslateMacroCounter)
        MacroFrameTab2:HookScript("OnShow", RefitMacroTabs)
        MacroFrameTab2:HookScript("OnEnter", TranslateOwnedTooltip)

        if MacroFrame:IsShown() then
            TranslateMacroFrame()
        end
    end

    if not interfaceHooked.merchant and MerchantFrame and type(MerchantFrame_Update) == "function" then
        interfaceHooked.merchant = true
        hooksecurefunc("MerchantFrame_Update", TranslateMerchantFrame)

        if MerchantRepairItemButton then
            MerchantRepairItemButton:HookScript("OnEnter", TranslateOwnedTooltip)
        end
    end

    if not interfaceHooked.auction and AuctionFrame and AuctionFrameBrowse and AuctionFrameBid and AuctionFrameAuctions
        and type(AuctionFrameBrowse_Update) == "function" then
        interfaceHooked.auction = true

        -- Item and player names in the lists; time left in the lists shows its tooltip without a Lua Show
        for prefix, countName in pairs(AUCTION_ROWS) do
            for i = 1, _G[countName] or 0 do
                for _, suffix in ipairs({ "Name", "HighBidderName" }) do
                    local region = _G[prefix .. i .. suffix]

                    if region then
                        auctionOwnNames[region] = true
                    end
                end

                local closingTime = _G[prefix .. i .. "ClosingTime"]

                if closingTime then
                    closingTime:HookScript("OnEnter", TranslateOwnedTooltip)
                end
            end
        end

        if AuctionsItemButtonName then
            auctionOwnNames[AuctionsItemButtonName] = true
        end

        for _, name in ipairs({ "ShowOnPlayerCheckButton", "AuctionsItemButton" }) do
            if _G[name] then
                _G[name]:HookScript("OnEnter", TranslateOwnedTooltip)
            end
        end

        AuctionFrame:HookScript("OnShow", TranslateAuctionFrame)

        for _, panel in ipairs({ AuctionFrameBrowse, AuctionFrameBid, AuctionFrameAuctions }) do
            panel:HookScript("OnShow", TranslateAuctionPanel)
        end

        local updates = {
            { AuctionFrameBrowse, "AuctionFrameBrowse_Update" },
            { AuctionFrameBrowse, "AuctionFrameFilters_Update" },
            { AuctionFrameBid, "AuctionFrameBid_Update" },
            { AuctionFrameAuctions, "AuctionFrameAuctions_Update" },
        }

        for _, entry in ipairs(updates) do
            local panel, update = entry[1], entry[2]

            if type(_G[update]) == "function" then
                hooksecurefunc(update, function() TranslateAuctionPanel(panel) end)
            end
        end

        if BrowseSearchButton and BrowseNoResultsText then
            BrowseSearchButton:HookScript("OnUpdate", TranslateAuctionSearching)
        end

        HookDropdowns(AuctionFrameBrowse)

        if AuctionFrame:IsShown() then
            TranslateAuctionFrame()
        end
    end

    if not interfaceHooked.channels and ChannelFrame and ChannelFrame.ChannelList and ChannelFrame.ChannelRoster then
        interfaceHooked.channels = true
        ChannelFrame:HookScript("OnShow", TranslateChannelFrame)
        hooksecurefunc(ChannelFrame.ChannelList, "Update", TranslateChannelList)
        hooksecurefunc(ChannelFrame.ChannelList, "SetSelectedChannel", TranslateChannelList)
        hooksecurefunc(ChannelFrame.ChannelRoster, "UpdateFromOpaqueChannel", TranslateChannelRoster)

        if ChannelFrame:IsShown() then
            TranslateChannelFrame()
        end
    end

    if not interfaceHooked.auraTimers and BuffFrame and BuffFrame.auraFrames then
        interfaceHooked.auraTimers = true
        local buttons = {}

        for _, container in ipairs({ BuffFrame, DebuffFrame }) do
            for _, button in ipairs(container.auraFrames or {}) do
                buttons[#buttons + 1] = button
            end
        end

        if DeadlyDebuffFrame and DeadlyDebuffFrame.Debuff then
            buttons[#buttons + 1] = DeadlyDebuffFrame.Debuff
        end

        for _, button in ipairs(buttons) do
            if type(button.UpdateDuration) == "function" then
                hooksecurefunc(button, "UpdateDuration", TranslateAuraDuration)
            end
        end
    end

    if not interfaceHooked.settings and SettingsPanel and SettingsPanel.Container and ScrollUtil
        and ScrollUtil.AddInitializedFrameCallback then
        interfaceHooked.settings = true
        ScrollUtil.AddInitializedFrameCallback(SettingsPanel.Container.SettingsList.ScrollBox, TranslateSettingsRow, settingsOwner)
        ScrollUtil.AddInitializedFrameCallback(SettingsPanel.CategoryList.ScrollBox, TranslateSettingsRow, settingsOwner)
        SettingsPanel:HookScript("OnShow", TranslateSettingsPanel)
        hooksecurefunc(SettingsPanel, "DisplayCategory", TranslateSettingsHeader)

        if SettingsTooltip then
            hooksecurefunc(SettingsTooltip, "Show", TranslateInterfaceTooltip)
        end
    end
end

local function InstallInterfaceHooks()
    if not interfaceHooked.menus and Menu and Menu.ModifyMenu then
        interfaceHooked.menus = true

        for _, tag in ipairs(INTERFACE_MENU_TAGS) do
            Menu.ModifyMenu(tag, TranslateMenu)
        end
    end

    if not interfaceHooked.gameMenu and GameMenuFrame and GameMenuFrame.InitButtons then
        interfaceHooked.gameMenu = true
        hooksecurefunc(GameMenuFrame, "InitButtons", TranslateGameMenu)
    end

    if not interfaceHooked.character and CharacterFrame then
        interfaceHooked.character = true
        CharacterFrame:HookScript("OnShow", TranslateCharacterTabs)
    end

    if not interfaceHooked.reputation and ReputationFrame and type(ReputationFrame_Update) == "function" then
        interfaceHooked.reputation = true
        hooksecurefunc("ReputationFrame_Update", TranslateReputationFrame)
        ReputationFrame:HookScript("OnShow", TranslateReputationTexts)

        if ReputationDetailFrame then
            ReputationDetailFrame:HookScript("OnShow", TranslateReputationTexts)
        end
    end

    if not interfaceHooked.social and FriendsFrame and type(FriendsFrame_Update) == "function" then
        interfaceHooked.social = true
        FriendsFrame:HookScript("OnShow", TranslateSocialWindow)
        hooksecurefunc("FriendsFrame_Update", TranslateSocialWindow)

        if type(GuildStatus_Update) == "function" then
            hooksecurefunc("GuildStatus_Update", TranslateSocialWindow)
        end
    end

    if not IS_RETAIL then
        InstallClassicWindowHooks()
        return
    end

    if not interfaceHooked.retailReputation and ReputationFrame and ReputationFrame.Update and ReputationFrame.ScrollBox then
        interfaceHooked.retailReputation = true
        hooksecurefunc(ReputationFrame, "Update", TranslateRetailReputation)
        ReputationFrame:HookScript("OnShow", TranslateReputationTexts)

        if ReputationFrame.ReputationDetailFrame and ReputationFrame.ReputationDetailFrame.Refresh then
            hooksecurefunc(ReputationFrame.ReputationDetailFrame, "Refresh", TranslateRetailReputationDetail)
        end
    end

    -- The spellbook loads on demand; entries created after the hook carry it
    if not interfaceHooked.spellBook and SpellBookItemMixin and SpellBookItemMixin.UpdateVisuals then
        interfaceHooked.spellBook = true
        hooksecurefunc(SpellBookItemMixin, "UpdateVisuals", TranslateSpellBookItem)

        if SpellBookItemMixin.UpdateSubName then
            hooksecurefunc(SpellBookItemMixin, "UpdateSubName", TranslateSpellBookItem)
        end
    end

    -- Guild and communities window (Blizzard_Communities, on demand)
    if not interfaceHooked.communities and CommunitiesFrame then
        interfaceHooked.communities = true
        CommunitiesFrame:HookScript("OnShow", function(frame)
            if IsTranslationOn("INTERFACE_TRANSLATIONS") then
                TranslateStaticTexts(frame)
            end
        end)
    end
end

InstallInterfaceHooks()

local interfaceInstaller = CreateFrame("Frame")
interfaceInstaller:RegisterEvent("ADDON_LOADED")
interfaceInstaller:RegisterEvent("PLAYER_LOGIN")
interfaceInstaller:SetScript("OnEvent", InstallInterfaceHooks)

-- Called by the master switch and the category checkboxes: open windows get the client text back
-- for switched-off categories and are translated at once for switched-on ones.
function Matreshka_RefreshTranslations()
    RestoreSwitchedOffTexts()

    if interfaceHooked.character and CharacterFrame:IsShown() then
        TranslateCharacterTabs()
    end

    if interfaceHooked.reputation and ReputationFrame:IsShown() then
        TranslateReputationTexts()
        TranslateReputationFrame()
    end

    if interfaceHooked.social and FriendsFrame:IsShown() then
        TranslateSocialWindow()
    end

    if mailFrameHooked and MailFrame:IsShown() then
        ApplyMailFrameStrings()
    end

    if interfaceHooked.gossip and GossipFrame:IsShown() then
        TranslateGossipButtons()
    end

    if interfaceHooked.skills and SkillFrame:IsShown() then
        TranslateSkillFrame()
    end

    if interfaceHooked.spellbookTexts then
        TranslateSpellbookTexts()
    end

    if interfaceHooked.macros and MacroFrame:IsShown() then
        TranslateMacroFrame()
    end

    if interfaceHooked.merchant and MerchantFrame:IsShown() then
        TranslateMerchantFrame()
    end

    if interfaceHooked.auction and AuctionFrame:IsShown() then
        TranslateAuctionFrame()
    end

    if interfaceHooked.channels and ChannelFrame:IsShown() then
        TranslateChannelFrame()
    end

    if interfaceHooked.settings and SettingsPanel:IsShown() then
        TranslateSettingsPanel()
    end
end
