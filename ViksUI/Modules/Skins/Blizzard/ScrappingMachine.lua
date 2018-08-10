local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Scrapping Machine skin
----------------------------------------------------------------------------------------

local _G = _G
local unpack = unpack

local BAG_ITEM_QUALITY_COLORS = BAG_ITEM_QUALITY_COLORS
local hooksecurefunc = hooksecurefunc

local function LoadSkin()

	local MachineFrame = _G["ScrappingMachineFrame"]
	MachineFrame:StripTextures()
	ScrappingMachineFrameInset:Hide()
	MachineFrame.ScrapButton.LeftSeparator:Hide()
	MachineFrame.ScrapButton.RightSeparator:Hide()

	MachineFrame:CreateBackdrop("Transparent")

	T.SkinCloseButton(ScrappingMachineFrameCloseButton)
	T:HandleButton(MachineFrame.ScrapButton)

	local function refreshIcon(self)
		local quality = 1
		if self.itemLocation and not self.item:IsItemEmpty() and self.item:GetItemName() then
			quality = self.item:GetItemQuality()
		end
		local color = BAG_ITEM_QUALITY_COLORS[quality]
		if color and self.itemLocation and not self.item:IsItemEmpty() and self.item:GetItemName() then
			self.backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
		else
			self.backdrop:SetBackdropBorderColor(nil) -- Clear the BackdropBorderColor if no item is in the slot.
		end
	end

	local ItemSlots = MachineFrame.ItemSlots
	ItemSlots:StripTextures()

	for button in pairs(ItemSlots.scrapButtons.activeObjects) do
		if not button.styled then
			button:CreateBackdrop("Default")

			button.Icon:SetTexCoord(unpack(T.TexCoords))
			button.IconBorder:SetAlpha(0)

			hooksecurefunc(button, "RefreshIcon", refreshIcon)

			button.styled = true
		end
	end
end

T.SkinFuncs["Blizzard_ScrappingMachineUI"] = LoadSkin