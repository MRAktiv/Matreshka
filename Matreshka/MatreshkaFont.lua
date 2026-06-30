-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Bundled Cyrillic font: lets the russifier render Russian text WITHOUT the player replacing
-- any client font files. A fresh enUS client has no Cyrillic glyphs at all (shows boxes), so we
-- swap the typeface on the standard font objects — keeping each object's size and flags.
-- Drop a TTF at Fonts\FrizQuadrataCTT.ttf; until then every SetFont below fails silently (no-op).

local FONT = "Interface\\AddOns\\Matreshka\\Fonts\\FrizQuadrataCTT.ttf"

-- Text font objects that can show translated/Cyrillic content (number fonts are left alone — digits are Latin)
local FONT_OBJECTS = {
    "SystemFont_Tiny", "SystemFont_Small", "SystemFont_Med1", "SystemFont_Med2", "SystemFont_Med3",
    "SystemFont_Large", "SystemFont_Huge1", "SystemFont_World",
    "SystemFont_Shadow_Small", "SystemFont_Shadow_Med1", "SystemFont_Shadow_Med2", "SystemFont_Shadow_Med3",
    "SystemFont_Shadow_Large", "SystemFont_Shadow_Huge1", "SystemFont_OutlineThick_Huge2",
    "GameFontNormal", "GameFontNormalSmall", "GameFontNormalLarge", "GameFontNormalHuge",
    "GameFontHighlight", "GameFontHighlightSmall", "GameFontHighlightLarge",
    "GameFontDisable", "GameFontDisableSmall", "GameFontDisableLarge",
    "GameFontGreen", "GameFontRed", "GameFontWhite", "GameFontBlackSmall",
    "GameTooltipText", "GameTooltipTextSmall", "GameTooltipHeaderText", "Tooltip_Med", "Tooltip_Small",
    "QuestFont", "QuestFontNormalSmall", "QuestTitleFont", "QuestFontLarge", "QuestFontHighlight",
    "ChatFontNormal", "ChatFontSmall", "MailFont_Large", "MailTextFontNormal", "SpellFont_Small",
    "FriendsFont_Normal", "FriendsFont_Small", "FriendsFont_Large", "FriendsFont_UserText",
    "InvoiceFont_Med", "InvoiceFont_Small", "ItemTextFontNormal", "DialogButtonNormalText",
    "ZoneTextFont", "SubZoneTextFont", "PVPInfoTextFont", "WorldMapTextFont", "AchievementFont_Small",
}

local function ApplyFont()
    -- Offer our bundled font to other addons (Questie, WeakAuras, …) through the shared font
    -- library under the font's native name, so the player can pick "FrizQuadrataCTT" in their font
    -- setting (WeakAuras, Details!, …) — no file copying needed.
    local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)

    if LSM then
        LSM:Register("font", "FrizQuadrataCTT", FONT)
    end

    if MatreshkaOptions and MatreshkaOptions.CUSTOM_FONT_ENABLED == false then
        return
    end

    for _, name in ipairs(FONT_OBJECTS) do
        local obj = _G[name]

        if obj and obj.GetFont and obj.SetFont then
            local _, height, flags = obj:GetFont()

            if height then
                obj:SetFont(FONT, height, flags)
            end
        end
    end

    -- Hint for font strings other addons/frames create later
    STANDARD_TEXT_FONT = FONT
    UNIT_NAME_FONT = FONT
end

Matreshka_ApplyFont = ApplyFont

local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_LOGIN")
loader:SetScript("OnEvent", ApplyFont)

SLASH_MATRESHKA_FONT1 = "/mtfont"
SlashCmdList["MATRESHKA_FONT"] = function()
    MatreshkaOptions = MatreshkaOptions or {}
    local enabled = MatreshkaOptions.CUSTOM_FONT_ENABLED ~= false
    MatreshkaOptions.CUSTOM_FONT_ENABLED = not enabled

    if MatreshkaOptions.CUSTOM_FONT_ENABLED then
        ApplyFont()
        print("|cFFFFD100Matreshka|r: свой шрифт включён.")
    else
        print("|cFFFFD100Matreshka|r: свой шрифт выключен — /reload, чтобы вернуть стандартный.")
    end
end
