-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

local addonName = ...
local optionsFrame = CreateFrame("Frame")
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")
local defaultOptions = nil
local optionsTranslations = nil
local settingsCategory = nil
local showIdsCheckbox = nil

-- cn/tw translation data ships in the LoadOnDemand addon Matreshka_Options, so it stays
-- out of memory until actually selected. ru + en are always loaded with the core addon.
local function EnsureLanguageDataLoaded(lang)
    if lang ~= "cn" and lang ~= "tw" then return end
    -- Already have this language's data in memory? Nothing to do.
    if Matreshka_DB and Matreshka_DB["item:" .. lang] then return end

    local isLoaded = IsAddOnLoaded or (C_AddOns and C_AddOns.IsAddOnLoaded)
    local loadAddon = LoadAddOn or (C_AddOns and C_AddOns.LoadAddOn)
    if not loadAddon then return end

    -- Each file in the pack is guarded by SELECTED_LANGUAGE, so the pack only ever brings in the
    -- language that was selected when it first loaded. If it is already loaded for a different one,
    -- the newly chosen language's data can only be picked up on the next /reload.
    if isLoaded and isLoaded("Matreshka_Options") then
        -- Пак уже загружен под другой язык; новый применится после нажатия кнопки RELOAD в опциях
        return
    end

    loadAddon("Matreshka_Options")
end

-- Language picker dropdown
local function CreateOptionDropdown(parent, relativeFrame, offsetX, offsetY, label, defaultValueLabel, optionKey, selectedKey, translationKey)
    local dropdownLabel = parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    dropdownLabel:SetText(label)
    dropdownLabel:SetPoint("TOPLEFT", relativeFrame, "TOPLEFT", offsetX, offsetY - 10)

    local dropdown = LibDD:Create_UIDropDownMenu(nil, parent)
    dropdown:SetPoint("TOPLEFT", dropdownLabel, "BOTTOMLEFT", -20, -4)

    local selectedOptionLabel = defaultValueLabel

    LibDD:UIDropDownMenu_Initialize(dropdown, function(self, level, menuList)
        local info = LibDD:UIDropDownMenu_CreateInfo()

        local function OnDropdownValueChanged(self, arg1, arg2, checked)
            MatreshkaOptions[selectedKey] = arg1
            if selectedKey == "SELECTED_LANGUAGE" then
                EnsureLanguageDataLoaded(arg1)
            end
            UIDropDownMenu_SetText(dropdown, arg2)
        end

        for index, value in ipairs(MatreshkaOptions[optionKey]) do
            info.text = optionsTranslations[translationKey][value.value]
            info.value = value.value
            info.arg1 = info.value
            info.arg2 = info.text
            info.checked = MatreshkaOptions[selectedKey] == value.value
            info.func = OnDropdownValueChanged
            info.minWidth = 150

            if info.checked then
                selectedOptionLabel = optionsTranslations[translationKey][value.value]
            end

            LibDD:UIDropDownMenu_AddButton(info)
        end
    end)

    LibDD:UIDropDownMenu_SetWidth(dropdown, 150)
    UIDropDownMenu_SetText(dropdown, selectedOptionLabel)
    UIDropDownMenu_SetAnchor(dropdown, 0, 0, "TOPLEFT", dropdown)
    return dropdown
end

-- One on/off option as a labelled checkbox, bound to a boolean key in MatreshkaOptions.
local function CreateOptionCheckbox(parent, name, labelText, optionKey, onToggle)
    local checkbox = CreateFrame("CheckButton", name, parent, "UICheckButtonTemplate")
    checkbox:SetChecked(MatreshkaOptions[optionKey] and true or false)

    local label = _G[name .. "Text"] or checkbox.Text or checkbox.text
    if label then
        label:SetText(labelText)
    end

    checkbox:SetScript("OnClick", function(self)
        local value = self:GetChecked() and true or false
        MatreshkaOptions[optionKey] = value
        if onToggle then onToggle(value) end
    end)

    return checkbox
end

local function getDefaultOptions(optionsTranslations)
    return {
        QUEST_TRANSLATIONS = true,
        CUSTOM_FONT_ENABLED = true,
        ITEM_TRANSLATIONS = true,
        ITEM_TRANSLATIONS_ONLY_DISPLAY_NAME = false,
        SPELL_TRANSLATIONS = true,
        SPELL_TRANSLATIONS_ONLY_DISPLAY_NAME = false,
        NPC_TRANSLATIONS = true,
        NPC_TRANSLATIONS_ONLY_DISPLAY_NAME = false,
        GOSSIP_TRANSLATIONS = true,
        NPC_CHAT_TRANSLATIONS = true,
        SHOW_IDS = false,
        SCAN_MISSING = false,
        SELECTED_LANGUAGE = 'ru',
        AVAILABLE_LANGUAGES = {
            {value = 'ru', text = optionsTranslations["languages"]["ru"]},
            {value = 'cn', text = optionsTranslations["languages"]["cn"]},
            {value = 'tw', text = optionsTranslations["languages"]["tw"]}
        },
   }
end

local function InitializeOptions()
    local optionsPanel = CreateFrame("Frame", "MatreshkaOptionsPanel", UIParent)
    optionsPanel.name = "Matreshka"

    -- Vars
    local titleOffsetY = -22
    local subTitleOffsetY = -30
    local fieldOffsetX = 25

    -- Options panel title
    local panelTitle = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightLarge")
    panelTitle:SetPoint("TOPLEFT", optionsPanel, 6, titleOffsetY)
    panelTitle:SetText("Matreshka")
    panelTitle:SetTextColor(1, 1, 1)
    panelTitle:SetFont("Fonts\\FRIZQT__.TTF", 20)

    local panelTitleUnderline = optionsPanel:CreateTexture(nil, "ARTWORK")
    panelTitleUnderline:SetColorTexture(1, 1, 1, 0.3)
    panelTitleUnderline:SetPoint("TOPLEFT", panelTitle, "BOTTOMLEFT", 0, -9)
    panelTitleUnderline:SetPoint("TOPRIGHT", optionsPanel, "TOPRIGHT", -16, -31)

    -- Логотип Matreshka в правом верхнем углу панели (свой файл можно положить вместо Icons\matreshka.png)
    local panelLogo = optionsPanel:CreateTexture(nil, "OVERLAY")
    panelLogo:SetTexture("Interface\\AddOns\\Matreshka\\Icons\\matreshka.png")
    panelLogo:SetSize(52, 52)
    panelLogo:SetPoint("TOPRIGHT", optionsPanel, "TOPRIGHT", -16, -10)

    local optionsContainer = CreateFrame("Frame", nil, optionsPanel)
    optionsContainer:SetPoint("TOPLEFT", panelTitleUnderline, 0, -10)
    optionsContainer:SetPoint("BOTTOMRIGHT", optionsPanel, "BOTTOMRIGHT", -16, 16)

    -- General settings
    local generalOptionsTitle = optionsContainer:CreateFontString("ARTWORK", nil, "GameFontHighlightLarge")
    generalOptionsTitle:SetPoint("TOPLEFT", 8, titleOffsetY)
    generalOptionsTitle:SetText(optionsTranslations["generalOptionsTitle"])
    generalOptionsTitle:SetTextColor(1, 1, 1)

    local languageDropdown = CreateOptionDropdown(
        optionsContainer,
        generalOptionsTitle,
        fieldOffsetX,
        subTitleOffsetY,
        optionsTranslations["languageDropdownLabel"],
        optionsTranslations["languages"]["ru"],
        "AVAILABLE_LANGUAGES",
        "SELECTED_LANGUAGE",
        "languages"
    )

    -- Кнопка RELOAD справа от выбора языка: смена не-русского языка применяется после перезагрузки UI
    local reloadButton = CreateFrame("Button", nil, optionsContainer, "UIPanelButtonTemplate")
    reloadButton:SetSize(120, 24)
    reloadButton:SetPoint("LEFT", languageDropdown, "RIGHT", 12, 2)
    reloadButton:SetText("RELOAD")
    reloadButton:SetScript("OnClick", function() ReloadUI() end)

    local reloadHint = optionsContainer:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    reloadHint:SetPoint("BOTTOMLEFT", reloadButton, "TOPLEFT", 0, 6)
    reloadHint:SetWidth(260)
    reloadHint:SetJustifyH("LEFT")
    reloadHint:SetText("После смены языка нужно перезапустить игру (кнопка RELOAD)")

    -- "Что переводить": независимые тумблеры по категориям. У предметов/заклинаний/NPC
    -- есть под-опция "только название" (переводить лишь имя, не описание).
    local translationTitle = optionsContainer:CreateFontString("ARTWORK", nil, "GameFontHighlightLarge")
    translationTitle:SetPoint("TOPLEFT", languageDropdown, "BOTTOMLEFT", 20, -22)
    translationTitle:SetText(optionsTranslations["translationOptionsTitle"])
    translationTitle:SetTextColor(1, 1, 1)

    local itemCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaItemCheckbox",
        optionsTranslations["itemText"], "ITEM_TRANSLATIONS")
    itemCheckbox:SetPoint("TOPLEFT", translationTitle, "BOTTOMLEFT", 0, -6)

    local itemOnlyNameCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaItemOnlyNameCheckbox",
        optionsTranslations["onlyNameText"], "ITEM_TRANSLATIONS_ONLY_DISPLAY_NAME")
    itemOnlyNameCheckbox:SetPoint("TOPLEFT", itemCheckbox, "BOTTOMLEFT", 22, 2)

    local spellCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaSpellCheckbox",
        optionsTranslations["spellText"], "SPELL_TRANSLATIONS")
    spellCheckbox:SetPoint("TOPLEFT", itemOnlyNameCheckbox, "BOTTOMLEFT", -22, 2)

    local spellOnlyNameCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaSpellOnlyNameCheckbox",
        optionsTranslations["onlyNameText"], "SPELL_TRANSLATIONS_ONLY_DISPLAY_NAME")
    spellOnlyNameCheckbox:SetPoint("TOPLEFT", spellCheckbox, "BOTTOMLEFT", 22, 2)

    local npcCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaNpcCheckbox",
        optionsTranslations["npcText"], "NPC_TRANSLATIONS")
    npcCheckbox:SetPoint("TOPLEFT", spellOnlyNameCheckbox, "BOTTOMLEFT", -22, 2)

    local npcOnlyNameCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaNpcOnlyNameCheckbox",
        optionsTranslations["onlyNameText"], "NPC_TRANSLATIONS_ONLY_DISPLAY_NAME")
    npcOnlyNameCheckbox:SetPoint("TOPLEFT", npcCheckbox, "BOTTOMLEFT", 22, 2)

    local questCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaQuestCheckbox",
        optionsTranslations["questText"], "QUEST_TRANSLATIONS")
    questCheckbox:SetPoint("TOPLEFT", npcOnlyNameCheckbox, "BOTTOMLEFT", -22, 2)

    local gossipCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaGossipCheckbox",
        optionsTranslations["gossipText"], "GOSSIP_TRANSLATIONS")
    gossipCheckbox:SetPoint("TOPLEFT", questCheckbox, "BOTTOMLEFT", 0, 2)

    local npcChatCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaNpcChatCheckbox",
        optionsTranslations["npcChatText"], "NPC_CHAT_TRANSLATIONS")
    npcChatCheckbox:SetPoint("TOPLEFT", gossipCheckbox, "BOTTOMLEFT", 0, 2)

    -- Чекбокс показа ID (предметы/квесты/заклинания/NPC) — чтобы игрок мог прислать номер при ошибке перевода
    showIdsCheckbox = CreateOptionCheckbox(optionsContainer, "MatreshkaShowIDsCheckbox",
        optionsTranslations["showIdsText"], "SHOW_IDS")
    showIdsCheckbox:SetPoint("TOPLEFT", npcChatCheckbox, "BOTTOMLEFT", 0, -10)

    -- Кнопка открытия окна экспорта правок перевода (окно живёт в MatreshkaEditorFrame.lua)
    local exportButton = CreateFrame("Button", nil, optionsContainer, "UIPanelButtonTemplate")
    exportButton:SetSize(200, 26)
    exportButton:SetPoint("TOPLEFT", showIdsCheckbox, "BOTTOMLEFT", 0, -14)
    exportButton:SetText("Экспорт правок перевода")
    exportButton:SetScript("OnClick", function()
        if Matreshka_ShowExport then
            Matreshka_ShowExport()
        end
    end)

    -- Предпочитаем современный Settings API: он даёт категорию с ID, по которому
    -- слэш-команда открывает настройки СРАЗУ на странице мода (устаревший
    -- InterfaceOptionsFrame_OpenToCategory на этом клиенте лишь открывает меню, не выделяя категорию)
    if Settings and Settings.RegisterCanvasLayoutCategory then
        settingsCategory = Settings.RegisterCanvasLayoutCategory(optionsPanel, optionsPanel.name)
        Settings.RegisterAddOnCategory(settingsCategory)
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(optionsPanel)
    end
end

local function addonLoaded(self, event, addonLoadedName)
    if addonLoadedName == addonName then
        local menuLocale = "ru"
        optionsTranslations = (_G["MatreshkaTranslations"][menuLocale] or _G["MatreshkaTranslations"]["en"])["options"]

        defaultOptions = getDefaultOptions(optionsTranslations)
        MatreshkaOptions = MatreshkaOptions or defaultOptions
        MatreshkaUserData = MatreshkaUserData or {}

        for key, value in pairs(defaultOptions) do
            if MatreshkaOptions[key] == nil then
                MatreshkaOptions[key] = value
            elseif type(value) == "table" and key == "AVAILABLE_LANGUAGES" then
                MatreshkaOptions[key] = value
            end
        end

        -- Restore the LoadOnDemand language data if a previous session left cn/tw selected
        EnsureLanguageDataLoaded(MatreshkaOptions["SELECTED_LANGUAGE"])

        InitializeOptions()
    end
end

optionsFrame:RegisterEvent("ADDON_LOADED")
optionsFrame:SetScript("OnEvent", addonLoaded)

-- Чат-команды для быстрого открытия настроек мода: /matreshka и /mtlang
SLASH_MATRESHKA1 = "/matreshka"
SLASH_MATRESHKA2 = "/mtlang"
SlashCmdList["MATRESHKA"] = function()
    if settingsCategory and Settings and Settings.OpenToCategory then
        -- Современный клиент: открываем сразу на странице мода по ID категории
        Settings.OpenToCategory(settingsCategory:GetID())
    elseif InterfaceOptionsFrame_OpenToCategory and MatreshkaOptionsPanel then
        -- Старый клиент: первый вызов не всегда выделяет категорию — вызываем дважды
        InterfaceOptionsFrame_OpenToCategory(MatreshkaOptionsPanel)
        InterfaceOptionsFrame_OpenToCategory(MatreshkaOptionsPanel)
    end
end

-- Быстрый тумблер показа ID (предметы/квесты/заклинания/NPC), дублирует чекбокс в опциях
SLASH_MATRESHKA_ID1 = "/mtid"
SlashCmdList["MATRESHKA_ID"] = function()
    MatreshkaOptions = MatreshkaOptions or {}
    MatreshkaOptions["SHOW_IDS"] = not MatreshkaOptions["SHOW_IDS"]

    if showIdsCheckbox then
        showIdsCheckbox:SetChecked(MatreshkaOptions["SHOW_IDS"])
    end

    if MatreshkaOptions["SHOW_IDS"] then
        print("|cFFFFD100Matreshka|r: показ ID включён.")
    else
        print("|cFFFFD100Matreshka|r: показ ID выключен.")
    end
end

-- Сбор пропусков перевода: включает запись объектов, которым нет перевода
SLASH_MATRESHKA_SCAN1 = "/mtscan"
SlashCmdList["MATRESHKA_SCAN"] = function()
    MatreshkaOptions = MatreshkaOptions or {}
    MatreshkaOptions["SCAN_MISSING"] = not MatreshkaOptions["SCAN_MISSING"]

    if MatreshkaOptions["SCAN_MISSING"] then
        print("|cFFFFD100Matreshka|r: сбор пропусков ВКЛЮЧЁН. Открой книгу заклинаний и все ветки талантов, наводись на предметы/NPC, поговори с NPC (диалоги). Потом набери /mtmissing.")
    else
        print("|cFFFFD100Matreshka|r: сбор пропусков выключен.")
    end
end

-- Отчёт по собранным пропускам (и очистка по /mtmissing clear)
SLASH_MATRESHKA_MISSING1 = "/mtmissing"
SlashCmdList["MATRESHKA_MISSING"] = function(arg)
    if arg == "clear" then
        MatreshkaMissing = {}
        print("|cFFFFD100Matreshka|r: список пропусков очищен.")
        return
    end

    if not MatreshkaMissing or not next(MatreshkaMissing) then
        print("|cFFFFD100Matreshka|r: пропусков не собрано. Включи /mtscan и поиграй.")
        return
    end

    print("|cFFFFD100Matreshka|r: собрано пропусков перевода:")
    for bucket, ids in pairs(MatreshkaMissing) do
        local count = 0
        for _ in pairs(ids) do count = count + 1 end
        print("  " .. bucket .. ": " .. count)
    end
    print("Список сохранён в SavedVariables\\Matreshka.lua (таблица MatreshkaMissing) — пришли этот файл.")
end
