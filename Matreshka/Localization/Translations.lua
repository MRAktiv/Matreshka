-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Matreshka localization.
-- Strings authored for this addon. The active translation language drives the quest-window
-- headers (objectives / rewards); the options panel always uses Russian, with English kept
-- as a safety fallback. Only the keys the addon actually reads are defined here — no ballast.

local L = {
    ru = {
        objectives = "Цели задания",
        rewards = "Награды",
        options = {
            generalOptionsTitle = "Общие настройки",
            languageDropdownLabel = "Язык перевода:",
            translationOptionsTitle = "Что переводить",
            itemText = "Предметы",
            spellText = "Заклинания",
            npcText = "Существа и NPC",
            questText = "Задания",
            onlyNameText = "только название",
            showIdsText = "Показывать ID (для отчётов об ошибках)",
            languages = {
                ru = "Русский",
                en = "Английский",
                cn = "Китайский (упрощённый)",
                tw = "Китайский (традиционный)",
            },
        },
    },
    en = {
        objectives = "Quest Objectives",
        rewards = "Rewards",
        options = {
            generalOptionsTitle = "General settings",
            languageDropdownLabel = "Translation language:",
            translationOptionsTitle = "What to translate",
            itemText = "Items",
            spellText = "Spells",
            npcText = "Creatures and NPCs",
            questText = "Quests",
            onlyNameText = "name only",
            showIdsText = "Show IDs (for error reports)",
            languages = {
                ru = "Russian",
                en = "English",
                cn = "Chinese (Simplified)",
                tw = "Chinese (Traditional)",
            },
        },
    },
    cn = {
        objectives = "任务目标",
        rewards = "奖励",
    },
    tw = {
        objectives = "任務目標",
        rewards = "獎勵",
    },
}

_G["MatreshkaTranslations"] = L
