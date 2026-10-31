-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Spell descriptions (retail) and buff/debuff descriptions (all clients). The client renders a
-- template ($s1, $d, ${...}, $?a123[..][..], ...) into the tooltip text. The live English line is
-- matched against the English template of the spell; the values it shows are put into the Russian
-- template of the same spell.

local MAX_VARIANTS = 64
local MAX_DEPTH = 3
local MAX_CAPTURES = 32

-- Units of a rendered duration ($d), as in the client's SPELL_DURATION_* strings
local DURATION_UNITS = {
    sec = "сек", min = "мин", hr = "ч", hrs = "ч", hour = "ч", hours = "ч", day = "д", days = "д",
}

local cache = {}

-- Classic keeps buff and debuff templates apart from the spell rows (Database/Spells/aura_*.lua)
local function GetField(lang, id, field)
    local entry = Matreshka_GetEntry("spell", lang, id)
    local value = entry and entry[field]

    if value == nil and field == "aura" and Matreshka_SpellAura and Matreshka_SpellAura[lang] then
        value = Matreshka_SpellAura[lang][tonumber(id)]
    end

    return value ~= "" and value or nil
end

-- $@spelldesc / $@spellaura / $@spelltooltip / $@spellname of another spell, in the same language.
-- Unprefixed values of an embedded description belong to that spell, so they get its id.
local function ExpandReferences(text, lang, depth)
    if depth > MAX_DEPTH then
        return text
    end

    return (text:gsub("%$@(%a+)(%d+)", function(kind, id)
        local spellID = tonumber(id)

        if kind == "spellname" then
            return GetField(lang, spellID, "name")
        end

        local field = (kind == "spellaura" and "aura") or ((kind == "spelldesc" or kind == "spelltooltip") and "template")
        local nested = field and GetField(lang, spellID, field)

        if not nested then
            return nil
        end

        nested = nested:gsub("%$(%a)", function(letter)
            if not letter:find("[lLgG]") then
                return "$" .. id .. letter
            end
        end)

        return ExpandReferences(nested, lang, depth + 1)
    end))
end

local function FindClosing(text, open, openChar, closeChar)
    local depth = 0

    for i = open, #text do
        local char = text:sub(i, i)

        if char == openChar then
            depth = depth + 1
        elseif char == closeChar then
            depth = depth - 1

            if depth == 0 then
                return i
            end
        end
    end
end

-- Node list: { text = "..." } | { key = "s1" } (a rendered value) | { forms = {...}, plural = true }
-- | { forms = {...}, gender = true } | { branches = { nodes, nodes, ... } } (a $? condition)
local function Parse(text)
    local nodes, buffer, i, length = {}, {}, 1, #text

    local function Flush()
        if #buffer > 0 then
            nodes[#nodes + 1] = { text = table.concat(buffer) }
            buffer = {}
        end
    end

    while i <= length do
        local char = text:sub(i, i)
        local nextChar = text:sub(i + 1, i + 1)

        if char ~= "$" then
            buffer[#buffer + 1] = char
            i = i + 1
        elseif nextChar == "?" then
            Flush()
            local branches, j = {}, i + 1

            while true do
                local open = text:find("[", j, true)
                local close = open and FindClosing(text, open, "[", "]")

                if not close then
                    return nil
                end

                branches[#branches + 1] = Parse(text:sub(open + 1, close - 1))
                j = close + 1

                if text:sub(j, j) == "[" then
                    local elseClose = FindClosing(text, j, "[", "]")

                    if not elseClose then
                        return nil
                    end

                    branches[#branches + 1] = Parse(text:sub(j + 1, elseClose - 1))
                    j = elseClose + 1
                    break
                elseif text:sub(j, j) ~= "?" then
                    branches[#branches + 1] = {}
                    break
                end
            end

            for b = 1, #branches do
                if not branches[b] then
                    return nil
                end
            end

            nodes[#nodes + 1] = { branches = branches }
            i = j
        elseif nextChar == "{" then
            Flush()
            local close = FindClosing(text, i + 1, "{", "}")

            if not close then
                return nil
            end

            local precision = text:match("^%.%d", close + 1) and 2 or 0
            nodes[#nodes + 1] = { key = text:sub(i + 1, close + precision) }
            i = close + precision + 1
        elseif nextChar == "<" then
            Flush()
            local close = text:find(">", i, true)

            if not close then
                return nil
            end

            nodes[#nodes + 1] = { key = text:sub(i + 1, close) }
            i = close + 1
        elseif nextChar == "l" or nextChar == "L" or nextChar == "g" or nextChar == "G" then
            Flush()
            local close = text:find(";", i, true)

            if not close then
                return nil
            end

            local forms = {}

            for form in text:sub(i + 2, close - 1):gmatch("[^:]+") do
                forms[#forms + 1] = form
            end

            nodes[#nodes + 1] = { forms = forms, gender = nextChar:lower() == "g", plural = nextChar:lower() == "l" }
            i = close + 1
        else
            local token = text:match("^%$[/%*][%d%.]+;%d*%a+%d*", i) or text:match("^%$@%a+%d*", i)
                or text:match("^%$%d*%a+%d*", i)

            if token then
                Flush()
                nodes[#nodes + 1] = { key = token:sub(2) }
                i = i + #token
            else
                buffer[#buffer + 1] = char
                i = i + 1
            end
        end
    end

    Flush()
    return nodes
end

local function Append(target, source, from, to)
    for k = from or 1, to or #source do
        target[#target + 1] = source[k]
    end

    return target
end

-- Every combination of condition branches, as a flat node sequence plus the branch choices in order
local function Variants(nodes, sequence, path, results)
    for k = 1, #nodes do
        local node = nodes[k]

        if node.branches then
            for b = 1, #node.branches do
                if #results >= MAX_VARIANTS then
                    return
                end

                local rest = Append(Append({}, node.branches[b]), nodes, k + 1)
                local newPath = Append({}, path)
                newPath[#newPath + 1] = b
                Variants(rest, Append(Append({}, sequence), nodes, 1, k - 1), newPath, results)
            end

            return
        end
    end

    results[#results + 1] = { sequence = Append(Append({}, sequence), nodes), path = path }
end

-- The same branch choices applied to the Russian template
local function Choose(nodes, path, position, out)
    for k = 1, #nodes do
        local node = nodes[k]

        if node.branches then
            position = position + 1
            local branch = node.branches[path[position] or 0]

            if not branch then
                return nil
            end

            position = Choose(branch, path, position, out)

            if not position then
                return nil
            end
        else
            out[#out + 1] = node
        end
    end

    return position
end

local function Normalize(text)
    text = text:gsub("|[cC]%x%x%x%x%x%x%x%x", ""):gsub("|[rR]", "")
    return (text:gsub("%s+", " "):gsub("^ ", ""):gsub(" $", ""))
end

local function Escape(text)
    return (text:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0"))
end

local function BuildPattern(sequence)
    local literal, parts, captures = {}, { "^" }, {}

    local function FlushLiteral()
        if #literal > 0 then
            parts[#parts + 1] = Escape(Normalize(table.concat(literal)))
            literal = {}
        end
    end

    for _, node in ipairs(sequence) do
        if node.text then
            literal[#literal + 1] = node.text
        elseif node.forms then
            -- English plural or gender word: one word, not kept (Russian picks its own form)
            FlushLiteral()
            parts[#parts + 1] = " ?%S+ ?"
        else
            FlushLiteral()

            -- A value next to a literal keeps the space between them optional for the trimmed literal
            parts[#parts + 1] = " ?(.-) ?"
            captures[#captures + 1] = node
        end
    end

    FlushLiteral()
    parts[#parts + 1] = "$"

    if #captures > MAX_CAPTURES then
        return nil
    end

    return table.concat(parts), captures
end

local function RussianPlural(number, forms)
    local value = tonumber((number:gsub(",", "")))

    if not value then
        return forms[#forms]
    end

    local index

    if value % 1 ~= 0 then
        index = 2
    else
        local mod10, mod100 = value % 10, value % 100
        index = (mod10 == 1 and mod100 ~= 11) and 1 or ((mod10 >= 2 and mod10 <= 4 and (mod100 < 12 or mod100 > 14)) and 2 or 3)
    end

    return forms[math.min(index, #forms)]
end

-- Also used for the plural codes of interface strings
Matreshka_PluralForm = RussianPlural

local function ConvertValue(key, value)
    if key:match("^%d*[dD]%d*$") then
        return (value:gsub("%a+", function(word)
            return DURATION_UNITS[word:lower()]
        end))
    end

    return value
end

-- The English template may glue letters onto a mark ("$ds." for "$d" in Russian): the English mark
-- that starts with the Russian one and goes on only with letters stands in for it
local function FindValue(values, key)
    local value = values[key]

    if value then
        return value
    end

    for englishKey, englishValue in pairs(values) do
        if #englishKey > #key and englishKey:sub(1, #key) == key and englishKey:sub(#key + 1):find("^%a+$") then
            return englishValue
        end
    end
end

local function Render(nodes, values)
    local out = {}

    for _, node in ipairs(nodes) do
        if node.text then
            out[#out + 1] = node.text
        elseif node.key then
            local value = FindValue(values, node.key)

            if not value then
                return nil
            end

            out[#out + 1] = ConvertValue(node.key, value)
        elseif node.gender then
            out[#out + 1] = node.forms[(UnitSex("player") == 3 and 2 or 1)] or node.forms[1] or ""
        elseif node.plural then
            local number = table.concat(out):match("([%d][%d%.,]*)[^%d]*$")
            out[#out + 1] = RussianPlural(number or "", node.forms)
        end
    end

    return table.concat(out)
end

local function Prepare(spellID, field)
    local cacheKey = field .. ":" .. spellID
    local prepared = cache[cacheKey]

    if prepared ~= nil then
        return prepared
    end

    local lang = MatreshkaOptions and MatreshkaOptions["SELECTED_LANGUAGE"]
    local english = GetField("en", spellID, field)
    local translated = lang and GetField(lang, spellID, field)
    prepared = false

    if english and translated then
        local englishNodes = Parse(ExpandReferences(english, "en", 1))
        local translatedNodes = Parse(ExpandReferences(translated, lang, 1))

        if englishNodes and translatedNodes then
            local variants = {}
            Variants(englishNodes, {}, {}, variants)

            for _, variant in ipairs(variants) do
                variant.pattern, variant.captures = BuildPattern(variant.sequence)
            end

            prepared = { variants = variants, translated = translatedNodes }
        end
    end

    cache[cacheKey] = prepared
    return prepared
end

-- Russian text for one live English description line of a spell, or nil when it does not match.
-- field: "template" (the spell description) or "aura" (the buff/debuff description).
function Matreshka_TranslateSpellText(spellID, field, liveText)
    if not (spellID and liveText and liveText ~= "") then
        return nil
    end

    local prepared = Prepare(spellID, field)

    if not prepared then
        return nil
    end

    local live = Normalize(liveText)

    for _, variant in ipairs(prepared.variants) do
        if variant.pattern then
            local found = { live:match(variant.pattern) }

            if found[1] ~= nil then
                local values = {}

                for k, node in ipairs(variant.captures) do
                    if node.key and values[node.key] == nil then
                        values[node.key] = found[k]
                    end
                end

                local chosen = {}
                local used = Choose(prepared.translated, variant.path, 0, chosen)

                if used == #variant.path then
                    local result = Render(chosen, values)

                    if result then
                        return result
                    end
                end
            end
        end
    end

    return nil
end

-- Clears parsed templates after a language switch
function Matreshka_ResetSpellText()
    cache = {}
end
