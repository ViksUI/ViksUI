local T, C, L = unpack(ViksUI)
if C.minimap.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Farm mode for minimap(by Elv22)
----------------------------------------------------------------------------------------
T.FarmMode = false
SlashCmdList.FARMMODE = function()
	if T.FarmMode == false then
		MinimapAnchor:SetSize(C.minimap.size * 1.65, C.minimap.size * 1.65)
		Minimap:SetSize(C.minimap.size * 1.65, C.minimap.size * 1.65)
		MinimapAnchor:SetPoint("CENTER", UIParent, "CENTER", -460, -46)
		T.FarmMode = true
	else
		MinimapAnchor:SetSize(C.minimap.size, C.minimap.size)
		Minimap:SetSize(C.minimap.size, C.minimap.size)
		if C.panels.NoPanels == true then
		MinimapAnchor:SetPoint(unpack(C.position.minimapline))
		else
		MinimapAnchor:SetPoint(unpack(C.position.minimap))
		end
		T.FarmMode = false
	end
end
SLASH_FARMMODE1 = "/farmmode"
SLASH_FARMMODE2 = "/афкььщву"
SLASH_FARMMODE3 = "/fm"
SLASH_FARMMODE4 = "/аь"

----------------------------------------------------------------------------------------
--	Farm mode mouseover button(by m2jest1c)
----------------------------------------------------------------------------------------
local farm = CreateFrame("Button", "FarmMode", UIParent)
farm:SetTemplate("Transparent")
farm:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", -3, 18)
farm:SetSize(19, 19)
farm:SetAlpha(0)

farm.t = farm:CreateTexture(nil, "OVERLAY")
farm.t:SetTexture("Interface\\Icons\\inv_misc_map_01")
farm.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
farm.t:SetPoint("TOPLEFT", farm, 2, -2)
farm.t:SetPoint("BOTTOMRIGHT", farm, -2, 2)

farm:SetScript("OnClick", function()
	SlashCmdList.FARMMODE()
end)

farm:SetScript("OnEnter", function()

	farm:FadeIn()
	GameTooltip:SetOwner(farm, "ANCHOR_LEFT")
	GameTooltip:AddLine(L_MINIMAP_FARM, 0.40, 0.78, 1)
	GameTooltip:Show()
end)

farm:SetScript("OnLeave", function()
	farm:FadeOut()
end)
