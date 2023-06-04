local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- Player Avoidance
--------------------------------------------------------------------

if C.datatext.Avd and C.datatext.Avd > 0 then
	local Stat = CreateFrame("Frame", "DataTextAvoidance", UIParent)
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	if C.datatext.Avd >= 6 then
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
	else
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	end
	PP(C.datatext.Avd, Text)
	
	local targetlv
	local playerlv

	local function Update(self)
		local format = string.format
		targetlv, playerlv = UnitLevel("target"), UnitLevel("player")
		
		if targetlv == -1 then
			basemisschance = (5 - (3*.2))  --Boss Value
			leveldifference = 3
		elseif targetlv > playerlv then
			basemisschance = (5 - ((targetlv - playerlv)*.2)) --Mobs above player level
			leveldifference = (targetlv - playerlv)
		elseif targetlv < playerlv and targetlv > 0 then
			basemisschance = (5 + ((playerlv - targetlv)*.2)) --Mobs below player level
			leveldifference = (targetlv - playerlv)
		else
			basemisschance = 5 --Sets miss chance of attacker level if no target exists, lv80=5, 81=4.2, 82=3.4, 83=2.6
			leveldifference = 0
		end

		if leveldifference >= 0 then
			dodge = (GetDodgeChance()-leveldifference*.2)
			parry = (GetParryChance()-leveldifference*.2)
			block = (GetBlockChance()-leveldifference*.2)
			MissChance = (basemisschance + 1/(0.0625 + 0.956/(GetCombatRating(CR_DEFENSE_SKILL)/4.91850*0.04)))
			avoidance = (dodge+parry+block+MissChance)
			if C.datatext.Avd >= 6 then
			Text:SetText("|cffFFFFFF"..format("%.2f", avoidance)..qColor2.." Avd")
			else
			Text:SetText(qColor..format("%.2f", avoidance)..qColor2.." Avd")
			end
		else
			dodge = (GetDodgeChance()+abs(leveldifference*.2))
			parry = (GetParryChance()+abs(leveldifference*.2))
			block = (GetBlockChance()+abs(leveldifference*.2))
			MissChance = (basemisschance + 1/(0.0625 + 0.956/(GetCombatRating(CR_DEFENSE_SKILL)/4.91850*0.04)))
			avoidance = (dodge+parry+block+MissChance)
			if C.datatext.Avd >= 6 then
			Text:SetText("|cffFFFFFF"..format("%.2f", avoidance)..qColor2.." Avd")
			else
			Text:SetText(qColor..format("%.2f", avoidance)..qColor2.." Avd")
			end
		end

		--Setup Avoidance Tooltip
		self:SetAllPoints(Text)
	end


	Stat:RegisterEvent("UNIT_AURA")
	Stat:RegisterEvent("UNIT_INVENTORY_CHANGED")
	Stat:RegisterEvent("PLAYER_TARGET_CHANGED")
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:SetScript("OnEvent", Update)
	Stat:SetScript("OnEnter", function(self)
		if not InCombatLockdown() then
			local anchor, yoff = DataTextTooltipAnchor(Text)
			GameTooltip:SetOwner(self, anchor, 0, yoff)
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
			GameTooltip:ClearLines()
			if targetlv > 1 then
				GameTooltip:AddDoubleLine("Avoidance Breakdown".." (".."lvl".." "..targetlv..")")
			elseif targetlv == -1 then
				GameTooltip:AddDoubleLine("Avoidance Breakdown".." (".."Boss"..")")
			else
				GameTooltip:AddDoubleLine("Avoidance Breakdown".." (".."lvl".." "..targetlv..")")
			end
			GameTooltip:AddDoubleLine("Miss",format("%.2f",MissChance) .. "%",1,1,1,  1,1,1)
			GameTooltip:AddDoubleLine("Dodge",format("%.2f",dodge) .. "%",1,1,1,  1,1,1)
			GameTooltip:AddDoubleLine("Parry",format("%.2f",parry) .. "%",1,1,1,  1,1,1)
			GameTooltip:AddDoubleLine("Block",format("%.2f",block) .. "%",1,1,1,  1,1,1)
			GameTooltip:Show()
		end
	end)
	Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
end
