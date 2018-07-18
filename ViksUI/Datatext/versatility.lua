local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
-- Player Versatility
--------------------------------------------------------------------

-- Versatility Rating
if not C.datatext.Versatility == nil or C.datatext.Versatility > 0 then
	local Stat = CreateFrame("Frame", "DataTextVersatility", UIParent)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
if C.datatext.Versatility >= 9 then
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
	PP(C.datatext.Versatility, Text)
	local vDB = GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE) + GetVersatilityBonus(CR_VERSATILITY_DAMAGE_DONE)
	local vDTR = GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_TAKEN) + GetVersatilityBonus(CR_VERSATILITY_DAMAGE_TAKEN)

	local function Update(self, t)
		Text:SetText(qColor2 .. "Vers.: " .. "|r" .. qColor .. format("%.2f%%", vDB) .. "|r ")
		self:SetAllPoints(Text)
	end
	Stat:RegisterEvent("UNIT_INVENTORY_CHANGED")
	Stat:RegisterEvent("UNIT_AURA")
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:SetScript("OnEnter", function(self)
		if not InCombatLockdown() then
			local anchor, panel, xoff, yoff = DataTextTooltipAnchor(Text)	
			GameTooltip:SetOwner(panel, anchor, xoff, yoff)
			GameTooltip:ClearLines()
			GameTooltip:AddLine(STAT_VERSATILITY)
			GameTooltip:AddLine(" ")
			GameTooltip:AddDoubleLine("Damage & Healing:", format("%.2f%%", vDB), 1, 1, 1)
			GameTooltip:AddDoubleLine("Damage Reduction:", format("%.2f%%", vDTR), 1, 1, 1)
			GameTooltip:Show()
		end
	end)
	Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
	Stat:SetScript("OnEvent", Update)
	Update(Stat, 29)
end