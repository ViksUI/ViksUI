local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end



local _G = _G
local select = select

local function LoadSkin()

	local AzeriteRespecFrame = _G.AzeriteRespecFrame
	AzeriteRespecFrame:SetClipsChildren(true)
	AzeriteRespecFrame.Background:Hide()
	AzeriteRespecFrame:StripTextures()
	AzeriteRespecFrame:SetTemplate("Transparent")

	local Lines = AzeriteRespecFrame:CreateTexture(nil, "BACKGROUND")
	Lines:ClearAllPoints()
	Lines:SetPoint("TOPLEFT", -50, 25)
	Lines:SetPoint("BOTTOMRIGHT")
	Lines:SetTexture([[Interface\Transmogrify\EtherealLines]], true, true)
	Lines:SetHorizTile(true)
	Lines:SetVertTile(true)
	Lines:SetAlpha(0.5)

	local ItemSlot = AzeriteRespecFrame.ItemSlot
	ItemSlot:SetSize(64, 64)
	ItemSlot:SetPoint("CENTER", AzeriteRespecFrame)
	ItemSlot.Icon:ClearAllPoints()
	ItemSlot.Icon:SetPoint("TOPLEFT", 1, -1)
	ItemSlot.Icon:SetPoint("BOTTOMRIGHT", -1, 1)
	ItemSlot.GlowOverlay:SetAlpha(0)

	ItemSlot:CreateBackdrop("Transparent")
	ItemSlot.backdrop:SetBackdropColor(.6, 0, .6, .5)
	T:CropIcon(AzeriteRespecFrame.ItemSlot.Icon)

	local ButtonFrame = AzeriteRespecFrame.ButtonFrame
	ButtonFrame:GetRegions():Hide()
	ButtonFrame.ButtonBorder:Hide()
	ButtonFrame.ButtonBottomBorder:Hide()

	ButtonFrame.MoneyFrameEdge:Hide()
	ButtonFrame.MoneyFrame:ClearAllPoints()
	ButtonFrame.MoneyFrame:SetPoint("BOTTOMRIGHT", ButtonFrame.MoneyFrameEdge, 7, 5)

	--AzeriteRespecFrame:CreateBackdrop("Transparent")
	-- Hide the damn Tutorial Tooltip
	local HelpBox = AzeriteRespecFrame.HelpBox
	HelpBox:SetAlpha(0)
	--AzeriteRespecFrame.backdrop:SetAllPoints()

	T:HandleButton(AzeriteRespecFrame.ButtonFrame.AzeriteRespecButton)
	T.SkinCloseButton(AzeriteRespecFrameCloseButton)
end
T.SkinFuncs["Blizzard_AzeriteRespecUI"] = LoadSkin