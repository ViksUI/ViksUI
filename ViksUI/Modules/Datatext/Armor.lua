local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- player Armor
--------------------------------------------------------------------

if C.datatext.Armor and C.datatext.Armor > 0 then
	local Stat = CreateFrame("Frame", "DataTextArmor", UIParent)
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	--Set font based on where.
	if C.datatext.Armor >= 6 then
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
	else
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	end

	PP(C.datatext.Armor, Text)

	local function Update(self)
		baseArmor , effectiveArmor, Armor, posBuff, negBuff = UnitArmor("player");
		shortArmor = effectiveArmor/1000
		if C.datatext.Armor >= 6 then
		Text:SetText("|cffFFFFFF"..format("%.1f",(shortArmor)).."K "..qColor2.."Armor")
		else
		Text:SetText(qColor..format("%.1f",(shortArmor)).."K "..qColor2.."Armor")
		end
		--Setup Armor Tooltip
		self:SetAllPoints(Text)
	end

	Stat:RegisterEvent("UNIT_INVENTORY_CHANGED")
	Stat:RegisterEvent("UNIT_AURA")
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:SetScript("OnMouseDown", function() ToggleCharacter("PaperDollFrame") end)
	Stat:SetScript("OnEvent", Update)
	Stat:SetScript("OnEnter", function(self)
		if not InCombatLockdown() then
			local anchor, panel, xoff, yoff = DataTextTooltipAnchor(Text)	
			GameTooltip:SetOwner(panel, anchor, xoff, yoff)
			GameTooltip:ClearLines()
			GameTooltip:AddLine("Mitigation By Level: ")
			local lv = 83
			for i = 1, 4 do
				local format = string.format
				local mitigation = (effectiveArmor/(effectiveArmor+(467.5*lv-22167.5)));
				if mitigation > .75 then
					mitigation = .75
				end
				GameTooltip:AddDoubleLine(lv,format("%.2f", mitigation*100) .. "%",1,1,1)
				lv = lv - 1
			end
			if UnitLevel("target") > 0 and UnitLevel("target") < UnitLevel("player") then
				mitigation = (effectiveArmor/(effectiveArmor+(467.5*(UnitLevel("target"))-22167.5)));
				if mitigation > .75 then
					mitigation = .75
				end
				GameTooltip:AddDoubleLine(UnitLevel("target"),format("%.2f", mitigation*100) .. "%",1,1,1)
			end
			GameTooltip:Show()
		end
	end)
	Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
end
