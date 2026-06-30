-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Matreshka data access.
-- Storage is positional to save memory (see Database/<Type>/<lang>.lua, generated):
--   Matreshka_DB["item:ru"][id] = { name, additional_info }
-- Per-entry hash keys are dropped from storage; this module maps the positional
-- row back to a named-field table on demand, so the rest of the addon keeps using
-- readable field names. Only the languages the addon actually needs are loaded:
-- ru + en ship in this addon; cn + tw live in the LoadOnDemand addon Matreshka_Options.

Matreshka_DB = Matreshka_DB or {}

local SCHEMA = {
    item  = { "name", "additional_info" },
    spell = { "name", "additional_info" },
    npc   = { "name", "subname" },
    quest = { "title", "objective", "description", "progress", "completion", "rewards" },
}

-- Named-field copy of one entry, or nil if absent.
function Matreshka_GetEntry(entityType, lang, id)
    local bucket = Matreshka_DB[entityType .. ":" .. lang]
    if not bucket then return nil end
    local row = bucket[tonumber(id)]
    if not row then return nil end

    local order = SCHEMA[entityType]
    local entry = {}
    for i = 1, #order do
        entry[order[i]] = row[i]
    end
    return entry
end

-- Raw positional bucket { [id] = {field1, field2, ...} }, used by the
-- spell-name fallback index. Returns nil when that language is not loaded.
function Matreshka_GetBucket(entityType, lang)
    return Matreshka_DB[entityType .. ":" .. lang]
end
