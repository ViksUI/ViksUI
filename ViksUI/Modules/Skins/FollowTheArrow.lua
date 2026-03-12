local T, C, L = unpack(ViksUI)
if C.skins.follow_the_arrow ~= true then return end

----------------------------------------------------------------------------------------
--	FollowTheArrow skin
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
	if not C_AddOns.IsAddOnLoaded("FollowTheArrow") then return end

	FollowTheArrowFrame:StripTextures()
	FollowTheArrowFrame:CreateBackdrop("Overlay")
end)
