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
        description = "Описание",
        rewardsChoose = "Вы сможете выбрать одну из этих наград:",
        rewardsReceive = "Вы получите:",
        options = {
            generalOptionsTitle = "Общие настройки",
            languageDropdownLabel = "Язык перевода:",
            translationOptionsTitle = "Что переводить",
            itemText = "Предметы",
            spellText = "Заклинания",
            npcText = "Существа и NPC",
            questText = "Задания",
            gossipText = "Диалоги NPC",
            npcChatText = "Реплики NPC в чате",
            mailText = "Письма",
            onlyNameText = "только название",
            showIdsText = "Показывать ID (для отчётов об ошибках)",
            clearMissingTitle = "Очистка собранной базы текста для перевода",
            clearMissingButton = "Очистить базу",
            clearMissingConfirmText = "Перед очисткой не забудьте отправить файл с непереведённым текстом разработчику.",
            clearMissingCountText = "Собрано сейчас: %d %s",
            clearMissingCountForms = { "строка", "строки", "строк" },
            clearMissingConfirmButton = "Очистить",
            clearMissingCancelButton = "Отмена",
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
        description = "Description",
        rewardsChoose = "You will be able to choose one of these rewards:",
        rewardsReceive = "You will receive:",
        options = {
            generalOptionsTitle = "General settings",
            languageDropdownLabel = "Translation language:",
            translationOptionsTitle = "What to translate",
            itemText = "Items",
            spellText = "Spells",
            npcText = "Creatures and NPCs",
            questText = "Quests",
            gossipText = "NPC dialogue",
            npcChatText = "NPC chat lines",
            mailText = "Mail letters",
            onlyNameText = "name only",
            showIdsText = "Show IDs (for error reports)",
            clearMissingTitle = "Clear the collected untranslated text database",
            clearMissingButton = "Clear database",
            clearMissingConfirmText = "Before clearing, don't forget to send the untranslated text file to the developer.",
            clearMissingCountText = "Currently collected: %d %s",
            clearMissingCountForms = { "line", "lines", "lines" },
            clearMissingConfirmButton = "Clear",
            clearMissingCancelButton = "Cancel",
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
        -- TODO: not verified, left in English (see report) — do not guess characters
        description = "Description",
        rewardsChoose = "You will be able to choose one of these rewards:",
        rewardsReceive = "You will receive:",
        options = {
            -- TODO: not verified, left in English (see report) — do not guess characters
            clearMissingTitle = "Clear the collected untranslated text database",
            clearMissingButton = "Clear database",
            clearMissingConfirmText = "Before clearing, don't forget to send the untranslated text file to the developer.",
            clearMissingCountText = "Currently collected: %d %s",
            clearMissingCountForms = { "line", "lines", "lines" },
            clearMissingConfirmButton = "Clear",
            clearMissingCancelButton = "Cancel",
        },
    },
    tw = {
        objectives = "任務目標",
        rewards = "獎勵",
        -- TODO: not verified, left in English (see report) — do not guess characters
        description = "Description",
        rewardsChoose = "You will be able to choose one of these rewards:",
        rewardsReceive = "You will receive:",
        options = {
            -- TODO: not verified, left in English (see report) — do not guess characters
            clearMissingTitle = "Clear the collected untranslated text database",
            clearMissingButton = "Clear database",
            clearMissingConfirmText = "Before clearing, don't forget to send the untranslated text file to the developer.",
            clearMissingCountText = "Currently collected: %d %s",
            clearMissingCountForms = { "line", "lines", "lines" },
            clearMissingConfirmButton = "Clear",
            clearMissingCancelButton = "Cancel",
        },
    },
}

_G["MatreshkaTranslations"] = L
