local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	Check outdated UI version
----------------------------------------------------------------------------------------
local check = function(self, event, prefix, message, _, sender)
	if event == "CHAT_MSG_ADDON" then
		if prefix ~= "ViksUIVersion" or sender == T.name then return end
		if tonumber(message) ~= nil and tonumber(message) > T.version then
			if T.vik == true then
				print("|cffff0000" .. "HEY!, Viks here, thank you for using my addon. Always nice to group with a use of my addon. It's outdated so go and grab the latest version!".."|r")
			else
				print("|cffff0000"..L_MISC_UI_OUTDATED.."|r")
			end
			self:UnregisterEvent("CHAT_MSG_ADDON")
		end
	else
		if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
			C_ChatInfo.SendAddonMessage("ViksUIVersion", T.version, "INSTANCE_CHAT")
		elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
			C_ChatInfo.SendAddonMessage("ViksUIVersion", T.version, "RAID")
		elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
			C_ChatInfo.SendAddonMessage("ViksUIVersion", T.version, "PARTY")
		elseif IsInGuild() then
			C_ChatInfo.SendAddonMessage("ViksUIVersion", T.version, "GUILD")
		end
	end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:SetScript("OnEvent", check)
C_ChatInfo.RegisterAddonMessagePrefix("ViksUIVersion")

----------------------------------------------------------------------------------------
--	Whisper UI version
----------------------------------------------------------------------------------------
local whisp = CreateFrame("Frame")
whisp:RegisterEvent("CHAT_MSG_WHISPER")
whisp:RegisterEvent("CHAT_MSG_BN_WHISPER")
whisp:SetScript("OnEvent", function(_, event, text, name, ...)
    -- Check without converting the entire string
    local isUICommand = false
    
    -- Manual character check to avoid taint
    for i = 1, #text do
        local char = text:sub(i, i)
        if char == "u" or char == "U" then
            if i+7 <= #text and text:sub(i, i+8):lower() == "ui_version" then
                isUICommand = true
                break
            end
        elseif char == "у" then
            if i+9 <= #text and text:sub(i, i+10) == "уи_версия" then
                isUICommand = true
                break
            end
        end
    end
    
    if isUICommand then
        if event == "CHAT_MSG_WHISPER" then
            SendChatMessage("ViksUI "..T.version, "WHISPER", nil, name)
        elseif event == "CHAT_MSG_BN_WHISPER" then
            local presenceID = select(11, ...)
            if presenceID then
                BNSendWhisper(presenceID, "ViksUI "..T.version)
            end
        end
    end
end)
