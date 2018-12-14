local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	ScrappingMachine skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	ScrappingMachineFrame:StripTextures()
	ScrappingMachineFrame:SetTemplate("Transparent")

	local ItemSlots = ScrappingMachineFrame.ItemSlots
	ItemSlots:StripTextures()

	for button in pairs(ItemSlots.scrapButtons.activeObjects) do
		if not button.styled then
			button:StripTextures()
			button:SetTemplate()
			button.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			button.IconBorder:SetAlpha(0)
			hooksecurefunc(button.IconBorder, 'SetVertexColor', function(self, r, g, b) button:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(button.IconBorder, 'Hide', function() button:SetBackdropBorderColor(unpack(C.media.border_color)) end)

			button.styled = true
		end
	end

	ScrappingMachineFrame.ScrapButton:SkinButton()
	T.SkinCloseButton(ScrappingMachineFrameCloseButton)
	
	-- Make frame movable
	ScrappingMachineFrame:SetMovable(true)
	ScrappingMachineFrame:RegisterForDrag("LeftButton")
	ScrappingMachineFrame:SetScript("OnDragStart", function(self) self:StartMoving() end)
	ScrappingMachineFrame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

end

T.SkinFuncs["Blizzard_ScrappingMachineUI"] = LoadSkin