﻿local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	!BaudErrorFrame skin
----------------------------------------------------------------------------------------
local AuroraSkin = CreateFrame("Frame")
AuroraSkin:RegisterEvent("PLAYER_LOGIN")
AuroraSkin:SetScript("OnEvent", function()
	if not C_AddOns.IsAddOnLoaded("!BaudErrorFrame") then return end

	BaudErrorFrame:SetTemplate("Transparent")
	BaudErrorFrameListScrollBox:SetTemplate("Overlay")
	BaudErrorFrameDetailScrollBox:SetTemplate("Overlay")

	BaudErrorFrameClearButton:SkinButton()
	BaudErrorFrameCloseButton:SkinButton()

	T.SkinScrollBar(BaudErrorFrameDetailScrollFrame.ScrollBar)
	T.SkinScrollBar(BaudErrorFrameListScrollBoxScrollBar.ScrollBar)
end)