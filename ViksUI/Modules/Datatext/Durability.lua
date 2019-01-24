local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
-- DURABILITY
--------------------------------------------------------------------
localSlots = {
	[1] = {1, "Head", 1000},
	[2] = {3, "Shoulder", 1000},
	[3] = {5, "Chest", 1000},
	[4] = {6, "Waist", 1000},
	[5] = {9, "Wrist", 1000},
	[6] = {10, "Hands", 1000},
	[7] = {7, "Legs", 1000},
	[8] = {8, "Feet", 1000},
	[9] = {16, "Main Hand", 1000},
	[10] = {17, "Off Hand", 1000},
	[11] = {18, "Ranged", 1000}
}
	
if C.datatext.Durability and C.datatext.Durability > 0 then
	local Stat = CreateFrame("Frame", "DataTextDurability", UIParent)
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	PP(C.datatext.Durability, Text)

	local Total = 0
	local current, max

	local function OnEvent(self)
		for i = 1, 11 do
			if GetInventoryItemLink("player", localSlots[i][1]) ~= nil then
				current, max = GetInventoryItemDurability(localSlots[i][1])
				if current then 
					localSlots[i][3] = current/max
					Total = Total + 1
				end
			end
		end
		table.sort(localSlots, function(a, b) return a[3] < b[3] end)
		
		if Total > 0 then
			Text:SetText("Armor "..qColor..floor(localSlots[1][3]*100).."%" )
		else
			Text:SetText("Armor "..qColor..": 100%".."Armor")
		end
		-- Setup Durability Tooltip
		self:SetAllPoints(Text)
		self:SetScript("OnEnter", function()
			if not InCombatLockdown() then
				GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6);
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
				GameTooltip:ClearLines()
				for i = 1, 11 do
					if localSlots[i][3] ~= 1000 then
						green = localSlots[i][3]*2
						red = 1 - green
						GameTooltip:AddDoubleLine(localSlots[i][2], floor(localSlots[i][3]*100).."%",1 ,1 , 1, red + 1, green, 0)
					end
				end
				GameTooltip:Show()
			end
		end)
		self:SetScript("OnLeave", function() GameTooltip:Hide() end)
		Total = 0
	end

	Stat:RegisterEvent("UPDATE_INVENTORY_DURABILITY")
	Stat:RegisterEvent("MERCHANT_SHOW")
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:SetScript("OnMouseDown", function() ToggleCharacter("PaperDollFrame") end)
	Stat:SetScript("OnEvent", OnEvent)
end