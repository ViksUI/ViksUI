local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	Skin some ViksUI frames if loaded Aurora
----------------------------------------------------------------------------------------
local AuroraSkin = CreateFrame("Frame")
AuroraSkin:RegisterEvent("PLAYER_LOGIN")
AuroraSkin:SetScript("OnEvent", function()
	if not C_AddOns.IsAddOnLoaded("Aurora") then return end
	local F = unpack(Aurora)

	local buttons = {
		"GameMenuButtonSettingsUI",
		"BaudErrorFrameClearButton",
		"BaudErrorFrameCloseButton",
		"RaidUtilityConvertButton",
		"RaidUtilityMainTankButton",
		"RaidUtilityMainAssistButton",
		"RaidUtilityRoleButton",
		"RaidUtilityReadyCheckButton",
		"RaidUtilityShowButton",
		"RaidUtilityCloseButton",
		"RaidUtilityDisbandButton",
		"RaidUtilityRaidControlButton",
		"CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton"
	}

	for i = 1, getn(buttons) do
		local button = _G[buttons[i]]
		if button then
			F.Reskin(button)
		end
	end

	local frames = {
		"BaudErrorFrame"
	}

	for i = 1, getn(frames) do
		local frame = _G[frames[i]]
		if frame then
			F.CreateBD(frame)
		end
	end

	local bd = {
		"BaudErrorFrameListScrollBox",
		"BaudErrorFrameDetailScrollBox"
	}

	for i = 1, getn(bd) do
		local frame = _G[bd[i]]
		if frame then
			F.CreateBD(frame)
		end
	end

	if C_AddOns.IsAddOnLoaded("!BaudErrorFrame") then
		F.ReskinScroll(BaudErrorFrameListScrollBoxScrollBar.ScrollBar)
		F.ReskinScroll(BaudErrorFrameDetailScrollFrame.ScrollBar)
	end
end)