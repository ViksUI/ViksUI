local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
 -- BAGS
--------------------------------------------------------------------

if C.datatext.Bags and C.datatext.Bags > 0 then
	local Stat = CreateFrame("Frame", "DataTextBags", UIParent)
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	PP(C.datatext.Bags, Text)

	local function OnEvent(self, event, ...)
		local free, total, used = 0, 0, 0
		for i = 0, NUM_BAG_SLOTS do
			free, total = free + GetContainerNumFreeSlots(i), total + GetContainerNumSlots(i)
		end
		used = total - free
		Text:SetText("Bags: "..qColor..free)
		Stat:SetAllPoints(Text)
		Stat:SetScript("OnEnter", function()
		if not InCombatLockdown() then
			GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6);
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
			GameTooltip:ClearLines()
			GameTooltip:AddDoubleLine("Bags")
			GameTooltip:AddLine(" ")
			GameTooltip:AddDoubleLine("Total:",total,0, 0.6, 1, 1, 1, 1)
			GameTooltip:AddDoubleLine("Used:",used,0, 0.6, 1, 1, 1, 1)
		end
		GameTooltip:Show()
	end)
	Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
	end
          
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:RegisterEvent("BAG_UPDATE")
	Stat:SetScript("OnEvent", OnEvent)
	Stat:SetScript("OnMouseDown", function() ToggleAllBags() end)
end