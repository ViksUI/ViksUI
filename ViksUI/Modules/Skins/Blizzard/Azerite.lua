local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

local function LoadSkin()

	AzeriteEmpoweredItemUI:StripTextures()
	AzeriteEmpoweredItemUI.BorderFrame:StripTextures()
	AzeriteEmpoweredItemUIPortrait:Hide()
	AzeriteEmpoweredItemUIPortrait:Hide()
	AzeriteEmpoweredItemUITopBorder:Hide()
	AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.Bg:Hide()
	AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame.KeyOverlay.Shadow:Hide()

	AzeriteEmpoweredItemUI:CreateBackdrop("Transparent")

	T.SkinCloseButton(AzeriteEmpoweredItemUICloseButton)
end

T.SkinFuncs["Blizzard_AzeriteUI"] = LoadSkin