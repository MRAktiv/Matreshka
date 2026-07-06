-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Приветственное окно: показывается один раз при первом входе с аддоном (флаг WELCOME_SHOWN в
-- SavedVariables). Рассказывает, что переводит мод, и содержит два раскрывающихся раздела —
-- «Вопросы» и «Как помочь?». Повторно открыть: /mtwelcome (сброс для теста: /mtwelcome reset).

local DISCORD_URL = "https://discord.gg/7TTZDAQfc"
local LOGO = "Interface\\AddOns\\Matreshka\\Icons\\matreshka.png"
local FONT = "Interface\\AddOns\\Matreshka\\Fonts\\FrizQuadrataCTT.ttf"

local INK      = { 0.13, 0.08, 0.02 }
local INK_SOFT = { 0.30, 0.19, 0.06 }
local BROWN    = { 0.42, 0.18, 0.03 }
local LABEL    = { 0.48, 0.32, 0.10 }

-- FontString с явным размером (целые пиксели → чёткий текст, без размытия шаблонного шрифта).
local function FS(parent, size, color, width, justify)
    local fs = parent:CreateFontString(nil, "OVERLAY")
    fs:SetFont(FONT, size, "")
    if color then fs:SetTextColor(color[1], color[2], color[3]) end
    if width then fs:SetWidth(width) end
    fs:SetJustifyH(justify or "LEFT")
    fs:SetJustifyV("TOP")
    fs:SetSpacing(2)
    return fs
end

local welcomeFrame

local function CreateWelcomeFrame()
    if welcomeFrame then return welcomeFrame end

    local f = CreateFrame("Frame", "MatreshkaWelcomeFrame", UIParent, "BackdropTemplate")
    f:SetSize(444, 524)
    f:SetPoint("CENTER")
    f:SetFrameStrata("DIALOG")
    f:SetToplevel(true)
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:SetMovable(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)

    -- Только золотая рамка; фон рисуем сами (штатный UI-DialogBox-Background в этом клиенте
    -- тёмный и полупрозрачный — тёмный текст на нём не читается).
    f:SetBackdrop({
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 },
    })

    -- Светлый пергамент: сплошная тёплая подложка + текстура пергамента ПЛИТКОЙ (в родном
    -- разрешении, без растяжения — иначе фон размывается и текст «плывёт»).
    local bgFill = f:CreateTexture(nil, "BACKGROUND", nil, -8)
    bgFill:SetColorTexture(0.86, 0.76, 0.55, 1)
    bgFill:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -13)
    bgFill:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -13, 12)

    local bgParch = f:CreateTexture(nil, "BACKGROUND", nil, -7)
    bgParch:SetTexture("Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Parchment-Horizontal", "REPEAT", "REPEAT")
    bgParch:SetHorizTile(true)
    bgParch:SetVertTile(true)
    bgParch:SetAlpha(0.6)
    bgParch:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -13)
    bgParch:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -13, 12)

    -- Логотип-матрёшка в левом верхнем углу (свой круглый медальон с прозрачным фоном)
    local portrait = f:CreateTexture(nil, "ARTWORK")
    portrait:SetSize(60, 60)
    portrait:SetPoint("TOPLEFT", f, "TOPLEFT", 8, 8)
    portrait:SetTexture(LOGO)

    local title = FS(f, 20, BROWN, nil, "CENTER")
    title:SetPoint("TOP", f, "TOP", 0, -18)
    title:SetText("Matreshka")

    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -6, -6)

    -- Вступление
    local welcome = FS(f, 17, BROWN, 396, "LEFT")
    welcome:SetPoint("TOPLEFT", f, "TOPLEFT", 24, -50)
    welcome:SetText("Добро пожаловать!")

    local lead = FS(f, 14, INK, 396, "LEFT")
    lead:SetPoint("TOPLEFT", welcome, "BOTTOMLEFT", 0, -8)
    lead:SetText("Matreshka переводит World of Warcraft на русский прямо в игре — менять язык клиента не нужно.")

    local catsLabel = FS(f, 11, LABEL, 396, "LEFT")
    catsLabel:SetPoint("TOPLEFT", lead, "BOTTOMLEFT", 0, -11)
    catsLabel:SetText("ЧТО ПЕРЕВОДИТСЯ")

    local cats = FS(f, 14, INK_SOFT, 396, "LEFT")
    cats:SetPoint("TOPLEFT", catsLabel, "BOTTOMLEFT", 0, -5)
    cats:SetText("Предметы • Заклинания и таланты • Задания • Существа и NPC • Диалоги NPC")

    local hint = FS(f, 14, INK, 396, "LEFT")
    hint:SetPoint("TOPLEFT", cats, "BOTTOMLEFT", 0, -11)
    hint:SetText("Наведи курсор на предмет или заклинание, открой задание или заговори с NPC — текст будет на русском.")

    local divider = f:CreateTexture(nil, "ARTWORK")
    divider:SetColorTexture(0.35, 0.24, 0.10, 0.5)
    divider:SetHeight(1)
    divider:SetPoint("TOPLEFT", hint, "BOTTOMLEFT", 0, -12)
    divider:SetPoint("RIGHT", f, "RIGHT", -24, 0)

    -- Раскрывающиеся разделы
    local questionsBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    questionsBtn:SetSize(192, 26)
    questionsBtn:SetPoint("TOPLEFT", divider, "BOTTOMLEFT", 0, -12)
    questionsBtn:SetText("Вопросы")

    local helpBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    helpBtn:SetSize(192, 26)
    helpBtn:SetPoint("LEFT", questionsBtn, "RIGHT", 12, 0)
    helpBtn:SetText("Как помочь?")

    -- Панель «Вопросы»
    local qPanel = CreateFrame("Frame", nil, f)
    qPanel:SetPoint("TOPLEFT", questionsBtn, "BOTTOMLEFT", 0, -12)
    qPanel:SetPoint("RIGHT", f, "RIGHT", -24, 0)
    qPanel:SetPoint("BOTTOM", f, "BOTTOM", 0, 54)
    qPanel:Hide()

    local qTitle = FS(qPanel, 15, BROWN, 396, "LEFT")
    qTitle:SetPoint("TOPLEFT", qPanel, "TOPLEFT", 0, 0)
    qTitle:SetText("Почему переведено не всё?")

    local qBody = FS(qPanel, 14, INK, 396, "LEFT")
    qBody:SetPoint("TOPLEFT", qTitle, "BOTTOMLEFT", 0, -8)
    qBody:SetText("База перевода пополняется постепенно. Часть текста — особенно реплики NPC — игра присылает с сервера по одной странице за раз, поэтому редкие или новые диалоги какое-то время могут оставаться на английском. Мы регулярно добавляем недостающее, и со временем пробелов становится всё меньше.")

    -- Панель «Как помочь?»
    local helpPanel = CreateFrame("Frame", nil, f)
    helpPanel:SetPoint("TOPLEFT", questionsBtn, "BOTTOMLEFT", 0, -12)
    helpPanel:SetPoint("RIGHT", f, "RIGHT", -24, 0)
    helpPanel:SetPoint("BOTTOM", f, "BOTTOM", 0, 54)
    helpPanel:Hide()

    local hTitle = FS(helpPanel, 15, BROWN, 396, "LEFT")
    hTitle:SetPoint("TOPLEFT", helpPanel, "TOPLEFT", 0, 0)
    hTitle:SetText("Увидел непереведённый текст у NPC?")

    local hBody = FS(helpPanel, 14, INK, 396, "LEFT")
    hBody:SetPoint("TOPLEFT", hTitle, "BOTTOMLEFT", 0, -8)
    hBody:SetText(
        "1. Введи в чат  /mtscan  — включится сбор непереведённых строк.\n" ..
        "2. Поговори с NPC и пройди весь диалог (прокликай все ответы).\n" ..
        "3. Введи  /mtmissing  — покажет, сколько собрано.\n" ..
        "4. Пришли файл  SavedVariables\\Matreshka.lua  в наш Discord.")

    local dLabel = FS(helpPanel, 11, LABEL, 396, "LEFT")
    dLabel:SetPoint("TOPLEFT", hBody, "BOTTOMLEFT", 0, -12)
    dLabel:SetText("НАШ DISCORD (нажми на поле и скопируй, Ctrl+C):")

    local discordBox = CreateFrame("EditBox", nil, helpPanel, "InputBoxTemplate")
    discordBox:SetSize(240, 22)
    discordBox:SetPoint("TOPLEFT", dLabel, "BOTTOMLEFT", 6, -6)
    discordBox:SetAutoFocus(false)
    discordBox:SetFont(FONT, 13, "")
    discordBox:SetTextColor(0.10, 0.10, 0.10)
    discordBox:SetText(DISCORD_URL)
    discordBox:SetCursorPosition(0)
    -- Только для чтения и удобного копирования: выделяем весь текст при фокусе,
    -- откатываем любые правки, снимаем фокус по Esc/Enter.
    discordBox:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
    discordBox:SetScript("OnMouseUp", function(self) self:HighlightText(); self:SetCursorPosition(0) end)
    discordBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    discordBox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    discordBox:SetScript("OnTextChanged", function(self)
        if self:GetText() ~= DISCORD_URL then
            self:SetText(DISCORD_URL)
            self:HighlightText()
        end
    end)

    -- Переключение разделов: клик по активному — сворачивает.
    local function SetSection(name)
        f.section = name
        qPanel:SetShown(name == "questions")
        helpPanel:SetShown(name == "help")

        if name == "questions" then questionsBtn:LockHighlight() else questionsBtn:UnlockHighlight() end
        if name == "help" then helpBtn:LockHighlight() else helpBtn:UnlockHighlight() end

        if name ~= "help" then discordBox:ClearFocus() end
    end

    questionsBtn:SetScript("OnClick", function()
        SetSection(f.section == "questions" and nil or "questions")
    end)
    helpBtn:SetScript("OnClick", function()
        SetSection(f.section == "help" and nil or "help")
    end)

    -- Кнопка «Понятно»
    local okBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    okBtn:SetSize(150, 28)
    okBtn:SetPoint("BOTTOM", f, "BOTTOM", 0, 16)
    okBtn:SetText("Понятно")
    okBtn:SetScript("OnClick", function() f:Hide() end)

    -- Закрытие по Esc
    tinsert(UISpecialFrames, "MatreshkaWelcomeFrame")

    f:Hide()
    welcomeFrame = f
    return f
end

-- Показ по требованию (первый вход и слэш-команда)
local function ShowWelcome()
    CreateWelcomeFrame():Show()
end

_G["Matreshka_ShowWelcome"] = ShowWelcome

-- Первый вход: показываем один раз, потом ставим флаг
local loginFrame = CreateFrame("Frame")
loginFrame:RegisterEvent("PLAYER_LOGIN")
loginFrame:SetScript("OnEvent", function()
    if not MatreshkaOptions then return end

    if not MatreshkaOptions["WELCOME_SHOWN"] then
        MatreshkaOptions["WELCOME_SHOWN"] = true
        ShowWelcome()
    end
end)

SLASH_MTWELCOME1 = "/mtwelcome"
SlashCmdList["MTWELCOME"] = function(msg)
    if msg == "reset" then
        if MatreshkaOptions then MatreshkaOptions["WELCOME_SHOWN"] = nil end
        print("|cFFFFD100Matreshka|r: приветствие сброшено — покажется при следующем входе.")
        return
    end

    ShowWelcome()
end
