-- Matreshka — внутриигровой русификатор WoW.
-- © 2026 MRAktiv. Все права защищены. Несанкционированное копирование и распространение запрещено.

-- Строка о версии при входе и проверка обновления. Сетевого API у аддонов нет, поэтому о новой
-- версии можно узнать только от других игроков с Matreshka: свою версию рассылаем скрытым
-- addon-сообщением в гильдию и группу, чужие принимаем оттуда же. Версия выше своей →
-- предупреждение, один раз за сеанс. Если у отправителя версия ниже, отвечаем ему шёпотом —
-- иначе тот, кто вошёл в игру позже всех, ни от кого ничего не услышит.

local ADDON_NAME = "Matreshka"
local PREFIX = "MTRSHKA"
local TAG = "|cFFFFD100[Matreshka]|r "
local BROADCAST_COOLDOWN = 20

local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local VERSION = GetAddOnMetadata(ADDON_NAME, "Version") or "0.0.0"

local warned = false
local lastBroadcast = 0

-- "2.5.0" → 2, 5, 0
local function Parse(version)
    local major, minor, patch = tostring(version):match("^(%d+)%.(%d+)%.(%d+)")

    if not major then
        return nil
    end

    return tonumber(major), tonumber(minor), tonumber(patch)
end

local function IsNewer(other, mine)
    local o1, o2, o3 = Parse(other)
    local m1, m2, m3 = Parse(mine)

    if not o1 or not m1 then
        return false
    end

    if o1 ~= m1 then return o1 > m1 end
    if o2 ~= m2 then return o2 > m2 end

    return o3 > m3
end

local function Send(channel, target)
    C_ChatInfo.SendAddonMessage(PREFIX, VERSION, channel, target)
end

-- GROUP_ROSTER_UPDATE приходит очередями (сбор группы, вход в подземелье), поэтому рассылка
-- ограничена по времени: лишние addon-сообщения ловят троттлинг клиента.
local function Broadcast()
    if GetTime() - lastBroadcast < BROADCAST_COOLDOWN then
        return
    end

    lastBroadcast = GetTime()

    if IsInGuild() then
        Send("GUILD")
    end

    if IsInRaid() then
        Send("RAID")
    elseif IsInGroup() then
        Send("PARTY")
    end
end

local function OnVersionReceived(peerVersion, sender)
    if IsNewer(peerVersion, VERSION) then
        if not warned then
            warned = true
            -- Номер собирается из разобранных чисел, а не из присланной строки: в чат не должен
            -- попасть произвольный текст чужого клиента.
            local major, minor, patch = Parse(peerVersion)
            print(TAG .. ("Your version of Matreshka is outdated. Latest: v%d.%d.%d"):format(major, minor, patch))
        end
    elseif IsNewer(VERSION, peerVersion) then
        Send("WHISPER", sender)
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        print(TAG .. ("v%s by MRAktiv. Type /mtwelcome to start."):format(VERSION))
        C_ChatInfo.RegisterAddonMessagePrefix(PREFIX)
        C_Timer.After(10, Broadcast) -- на самом входе гильдейский канал ещё не готов
        return
    end

    if event == "GROUP_ROSTER_UPDATE" then
        if IsInGroup() then
            Broadcast()
        end

        return
    end

    local prefix, message, _, sender = ...

    if prefix ~= PREFIX or not sender then
        return
    end

    -- Свои же сообщения возвращаются из канала обратно
    if strsplit("-", sender) == UnitName("player") then
        return
    end

    OnVersionReceived(message, sender)
end)
