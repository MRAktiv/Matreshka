-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- In-game translation editor + export for Matreshka.
-- Edits are stored as overrides in the SavedVariable MatreshkaUserData and
-- applied on top of the shipped database (see GetEffectiveEntry in Matreshka.lua).

local PREFIX = "|cFFFFD100Matreshka|r: "
local TYPE_LABELS = { item = "Предмет", spell = "Заклинание", npc = "НПС" }
-- Positional field order per type, so the export fragment matches the on-disk DB format
local EXPORT_FIELDS = { item = { "name", "additional_info" }, spell = { "name", "additional_info" }, npc = { "name", "subname" } }

local KNOWN_TYPES = { item = true, spell = true, npc = true }

-- Override storage (SavedVariable MatreshkaUserData[type][lang][id] = {name, additional_info, ...})
local function EnsureUserData()
    MatreshkaUserData = MatreshkaUserData or {}
    return MatreshkaUserData
end

local function GetOverride(userType, languageCode, id)
    local u = MatreshkaUserData
    return u and u[userType] and u[userType][languageCode] and u[userType][languageCode][tonumber(id)]
end

local function SetOverride(userType, languageCode, id, entry)
    local u = EnsureUserData()
    u[userType] = u[userType] or {}
    u[userType][languageCode] = u[userType][languageCode] or {}
    u[userType][languageCode][tonumber(id)] = entry
end

local function RefreshTooltip()
    if Matreshka_InvalidateTooltipCache then
        Matreshka_InvalidateTooltipCache()
    end
end

local function DarkBackdrop(frame)
    frame:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 },
    })
    frame:SetBackdropColor(0.05, 0.05, 0.05, 0.95)
end

-- Editor window ---------------------------------------------------------------
local editor

local function SaveEditor()
    local f = editor
    local baseRu = Matreshka_GetEntry(f.userType, f.languageCode, f.id)

    -- Clone the base entry so fields we do not edit (e.g. subname) are preserved
    local entry = {}
    if baseRu then
        for k, v in pairs(baseRu) do entry[k] = v end
    end
    entry.name = f.nameEdit:GetText()
    entry.additional_info = f.descEdit:GetText()

    SetOverride(f.userType, f.languageCode, f.id, entry)
    RefreshTooltip()
    f.resetButton:Enable()
    print(PREFIX .. ("перевод сохранён (%s ID %d)."):format(f.userType, f.id))
    f:Hide()
end

local function ResetEditor()
    local f = editor
    SetOverride(f.userType, f.languageCode, f.id, nil)
    RefreshTooltip()
    print(PREFIX .. "правка сброшена к базе.")
    f:Hide()
end

local function EnsureEditor()
    if editor then return editor end

    editor = CreateFrame("Frame", "MatreshkaEditorFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate")
    editor:SetSize(480, 380)
    editor:SetPoint("CENTER")
    editor:SetFrameStrata("DIALOG")
    DarkBackdrop(editor)
    editor:SetMovable(true)
    editor:EnableMouse(true)
    editor:RegisterForDrag("LeftButton")
    editor:SetScript("OnDragStart", editor.StartMoving)
    editor:SetScript("OnDragStop", editor.StopMovingOrSizing)
    editor:Hide()
    tinsert(UISpecialFrames, "MatreshkaEditorFrame")

    local title = editor:CreateFontString(nil, "ARTWORK", "GameFontHighlightLarge")
    title:SetPoint("TOP", 0, -18)
    title:SetText("Matreshka — Редактор перевода")

    local close = CreateFrame("Button", nil, editor, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -8, -8)

    editor.subtitle = editor:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    editor.subtitle:SetPoint("TOPLEFT", 22, -50)
    editor.subtitle:SetPoint("TOPRIGHT", -22, -50)
    editor.subtitle:SetJustifyH("LEFT")
    editor.subtitle:SetTextColor(0.8, 0.8, 0.8)

    local nameLabel = editor:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    nameLabel:SetPoint("TOPLEFT", 22, -76)
    nameLabel:SetText("Имя:")

    editor.nameEdit = CreateFrame("EditBox", nil, editor, "InputBoxTemplate")
    editor.nameEdit:SetPoint("TOPLEFT", nameLabel, "BOTTOMLEFT", 6, -6)
    editor.nameEdit:SetSize(420, 22)
    editor.nameEdit:SetAutoFocus(false)
    editor.nameEdit:SetScript("OnEscapePressed", editor.nameEdit.ClearFocus)

    local descLabel = editor:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    descLabel:SetPoint("TOPLEFT", editor.nameEdit, "BOTTOMLEFT", -6, -16)
    descLabel:SetText("Описание:")

    local scroll = CreateFrame("ScrollFrame", "MatreshkaEditorScroll", editor, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", descLabel, "BOTTOMLEFT", 6, -8)
    scroll:SetSize(404, 150)

    local box = CreateFrame("Frame", nil, editor, BackdropTemplateMixin and "BackdropTemplate")
    box:SetPoint("TOPLEFT", scroll, -6, 6)
    box:SetPoint("BOTTOMRIGHT", scroll, 28, -6)
    box:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    box:SetBackdropColor(0, 0, 0, 0.5)
    box:SetFrameLevel(scroll:GetFrameLevel() - 1)

    editor.descEdit = CreateFrame("EditBox", nil, scroll)
    editor.descEdit:SetMultiLine(true)
    editor.descEdit:SetAutoFocus(false)
    editor.descEdit:SetFontObject(ChatFontNormal)
    editor.descEdit:SetWidth(396)
    editor.descEdit:SetScript("OnEscapePressed", editor.descEdit.ClearFocus)
    scroll:SetScrollChild(editor.descEdit)

    local saveButton = CreateFrame("Button", nil, editor, "UIPanelButtonTemplate")
    saveButton:SetSize(130, 24)
    saveButton:SetPoint("BOTTOMLEFT", 22, 18)
    saveButton:SetText("Сохранить")
    saveButton:SetScript("OnClick", SaveEditor)

    editor.resetButton = CreateFrame("Button", nil, editor, "UIPanelButtonTemplate")
    editor.resetButton:SetSize(150, 24)
    editor.resetButton:SetPoint("LEFT", saveButton, "RIGHT", 8, 0)
    editor.resetButton:SetText("Сбросить к базе")
    editor.resetButton:SetScript("OnClick", ResetEditor)

    local cancelButton = CreateFrame("Button", nil, editor, "UIPanelButtonTemplate")
    cancelButton:SetSize(100, 24)
    cancelButton:SetPoint("BOTTOMRIGHT", -22, 18)
    cancelButton:SetText("Отмена")
    cancelButton:SetScript("OnClick", function() editor:Hide() end)

    return editor
end

function Matreshka_OpenEditor(userType, id)
    id = tonumber(id)

    if not userType or not id or not KNOWN_TYPES[userType] then
        print(PREFIX .. "не удалось открыть редактор для этого объекта.")
        return
    end

    local f = EnsureEditor()
    local languageCode = (MatreshkaOptions and MatreshkaOptions["SELECTED_LANGUAGE"]) or "ru"
    local baseEn = Matreshka_GetEntry(userType, "en", id)
    local baseRu = Matreshka_GetEntry(userType, languageCode, id)
    local override = GetOverride(userType, languageCode, id)
    local effective = override or baseRu or {}

    f.userType, f.id, f.languageCode = userType, id, languageCode
    f.subtitle:SetText(("Тип: %s   |   ID: %d   |   Язык: %s   |   ориг.: %s"):format(
        TYPE_LABELS[userType] or userType, id, languageCode, (baseEn and baseEn.name) or "—"))
    f.nameEdit:SetText(effective.name or "")
    f.descEdit:SetText(effective.additional_info or "")

    if override then f.resetButton:Enable() else f.resetButton:Disable() end

    f:Show()
    f.nameEdit:SetCursorPosition(0)
    f.nameEdit:SetFocus()
end

-- Keybinding handler: edit whatever the GameTooltip currently shows -----------
function Matreshka_EditHovered()
    if not GameTooltip:IsShown() then
        print(PREFIX .. "наведите курсор на предмет, заклинание или НПС.")
        return
    end

    local _, itemLink = GameTooltip:GetItem()
    if itemLink then
        local id = tonumber(itemLink:match("item:(%d+)"))
        if id then Matreshka_OpenEditor("item", id) return end
    end

    local _, spellID = GameTooltip:GetSpell()
    if spellID then Matreshka_OpenEditor("spell", spellID) return end

    local _, unit = GameTooltip:GetUnit()
    local guid = unit and UnitGUID(unit)
    if guid then
        local kind, _, _, _, _, npcID = strsplit("-", guid)
        if kind == "Creature" and npcID then Matreshka_OpenEditor("npc", tonumber(npcID)) return end
    end

    print(PREFIX .. "не удалось определить объект под курсором.")
end

-- Hotkey (Ctrl+Shift+E): edit whatever the tooltip currently shows. Implemented via an override
-- binding on a hidden button — this client's XML loader rejects addon Bindings.xml ("Unrecognized
-- XML: Binding"), and SetPropagateKeyboardInput is protected here (it taints the key-input chain
-- → ADDON_ACTION_BLOCKED on every keypress). Override bindings are taint-free out of combat.
local editorTrigger = CreateFrame("Button", "MatreshkaEditorTrigger", UIParent)
editorTrigger:RegisterForClicks("AnyDown")
editorTrigger:SetScript("OnClick", Matreshka_EditHovered)
SetOverrideBindingClick(editorTrigger, true, "CTRL-SHIFT-E", "MatreshkaEditorTrigger")

-- Alternative trigger for the tooltip currently under the cursor
SLASH_MATRESHKA_EDIT1 = "/mtedit"
SlashCmdList["MATRESHKA_EDIT"] = Matreshka_EditHovered

-- Export window ---------------------------------------------------------------
-- Serialize an in-memory string into a single-level Lua literal
local function SerializeString(s)
    s = (s or ""):gsub("\\", "\\\\"):gsub('"', '\\"'):gsub("\n", "\\n"):gsub("\r", "\\r")
    return '"' .. s .. '"'
end

local function BuildExportText()
    local u = MatreshkaUserData

    if not u or not next(u) then
        return "-- Нет сохранённых правок."
    end

    local lines = {
        "-- Matreshka: экспорт правок перевода.",
        "-- Допишите строки в конец файла Database/<Type>/<lang>.lua — они переопределят базу.",
        "",
    }

    for _, userType in ipairs({ "item", "spell", "npc" }) do
        local byType = u[userType]

        if byType then
            local fields = EXPORT_FIELDS[userType]

            for languageCode, byId in pairs(byType) do
                local ids = {}
                for id in pairs(byId) do ids[#ids + 1] = id end
                table.sort(ids)

                for _, id in ipairs(ids) do
                    local e = byId[id]
                    local vals = {}
                    for i = 1, #fields do
                        local v = e[fields[i]]
                        vals[i] = (v == nil) and "nil" or SerializeString(v)
                    end
                    while #vals > 1 and vals[#vals] == "nil" do vals[#vals] = nil end

                    lines[#lines + 1] = ('Matreshka_DB["%s:%s"][%d]={%s}'):format(
                        userType, languageCode, id, table.concat(vals, ","))
                end
            end
        end
    end

    return table.concat(lines, "\n")
end

local exportFrame

local function EnsureExportFrame()
    if exportFrame then return exportFrame end

    exportFrame = CreateFrame("Frame", "MatreshkaExportFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate")
    exportFrame:SetSize(560, 420)
    exportFrame:SetPoint("CENTER")
    exportFrame:SetFrameStrata("DIALOG")
    DarkBackdrop(exportFrame)
    exportFrame:SetMovable(true)
    exportFrame:EnableMouse(true)
    exportFrame:RegisterForDrag("LeftButton")
    exportFrame:SetScript("OnDragStart", exportFrame.StartMoving)
    exportFrame:SetScript("OnDragStop", exportFrame.StopMovingOrSizing)
    exportFrame:Hide()
    tinsert(UISpecialFrames, "MatreshkaExportFrame")

    local title = exportFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightLarge")
    title:SetPoint("TOP", 0, -18)
    title:SetText("Matreshka — Экспорт правок")

    local close = CreateFrame("Button", nil, exportFrame, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -8, -8)

    local hint = exportFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    hint:SetPoint("TOPLEFT", 22, -46)
    hint:SetText("«Выделить всё» → Ctrl+C → пришлите автору. Esc — закрыть.")
    hint:SetTextColor(0.8, 0.8, 0.8)

    local scroll = CreateFrame("ScrollFrame", "MatreshkaExportScroll", exportFrame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 22, -66)
    scroll:SetPoint("BOTTOMRIGHT", -38, 54)

    exportFrame.edit = CreateFrame("EditBox", nil, scroll)
    exportFrame.edit:SetMultiLine(true)
    exportFrame.edit:SetAutoFocus(false)
    exportFrame.edit:SetFontObject(ChatFontNormal)
    exportFrame.edit:SetWidth(486)
    exportFrame.edit:SetScript("OnEscapePressed", function(self) self:ClearFocus() exportFrame:Hide() end)
    scroll:SetScrollChild(exportFrame.edit)

    local selectAll = CreateFrame("Button", nil, exportFrame, "UIPanelButtonTemplate")
    selectAll:SetSize(150, 24)
    selectAll:SetPoint("BOTTOMLEFT", 22, 18)
    selectAll:SetText("Выделить всё")
    selectAll:SetScript("OnClick", function() exportFrame.edit:SetFocus() exportFrame.edit:HighlightText() end)

    local closeButton = CreateFrame("Button", nil, exportFrame, "UIPanelButtonTemplate")
    closeButton:SetSize(100, 24)
    closeButton:SetPoint("BOTTOMRIGHT", -22, 18)
    closeButton:SetText("Закрыть")
    closeButton:SetScript("OnClick", function() exportFrame:Hide() end)

    return exportFrame
end

function Matreshka_ShowExport()
    local f = EnsureExportFrame()
    f.edit:SetText(BuildExportText())
    f:Show()
    f.edit:SetFocus()
    f.edit:HighlightText()
end

SLASH_MATRESHKA_EXPORT1 = "/mtexport"
SlashCmdList["MATRESHKA_EXPORT"] = Matreshka_ShowExport
