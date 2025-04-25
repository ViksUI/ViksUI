local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	!BaudErrorFrame skin
----------------------------------------------------------------------------------------
local AuroraSkin = CreateFrame("Frame")
AuroraSkin:RegisterEvent("PLAYER_LOGIN")
AuroraSkin:SetScript("OnEvent", function()
	-- if not C_AddOns.IsAddOnLoaded("!BaudErrorFrame") then return end // Always load

	BaudErrorFrame:SetTemplate("Transparent")
	BaudErrorFrameListScrollBox:SetTemplate("Overlay")
	BaudErrorFrameDetailScrollBox:SetTemplate("Overlay")

	BaudErrorFrameClearButton:SkinButton()
	BaudErrorFrameCloseButton:SkinButton()
	BaudErrorFrameReloadUIButton:SkinButton()

	T.SkinScrollBar(BaudErrorFrameDetailScrollFrame.ScrollBar)
	T.SkinScrollBar(BaudErrorFrameListScrollBoxScrollBar.ScrollBar)

	BaudErrorFrameDetailScrollFrame.ScrollBar:SetPoint("TOPLEFT", BaudErrorFrameDetailScrollFrame, "TOPRIGHT", 6, -3)
	BaudErrorFrameDetailScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", BaudErrorFrameDetailScrollFrame, "BOTTOMRIGHT", 6, 3)
end)