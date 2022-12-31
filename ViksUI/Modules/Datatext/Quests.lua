local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
 -- QUEST DATATEXT
--------------------------------------------------------------------

if C.datatext.Quests and C.datatext.Quests > 0 then
	local Stat = CreateFrame("Frame", "DataTextQuests", UIParent)

	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	
	if C.datatext.location >= 9 then
		Text:SetTextColor(unpack(C.media.pxcolor1))
		if C.datatext.location ~= 14 or C.datatext.location ~= 15 then
			Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize-2, C.media.pxfontHFlag)
		else
			Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
		end
	else	
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	end
	
	PP(C.datatext.Quests, Text)

	local function OnEvent(self, event, ...)
		local numEntries, numQuests = C_QuestLog.GetNumQuestLogEntries()
		Text:SetText("Q|r:"..qColor.. numQuests.. "/35")
		self:SetAllPoints(Text)
		self:SetScript("OnEnter", function()
			if not InCombatLockdown() then
				GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6);
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
				GameTooltip:ClearLines()
				GameTooltip:AddDoubleLine("Click to toggle ObjectiveTrackerFrame")
				GameTooltip:AddDoubleLine("")
				GameTooltip:Show()
			end
		end)
	self:SetScript("OnLeave", function() GameTooltip:Hide() end)

	end
	
    local OnMouseDown = function()
		if ( ObjectiveTrackerFrame.collapsed ) then
		ObjectiveTracker_Expand();
		else
		ObjectiveTracker_Collapse();
		end
	end 
	
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
	Stat:RegisterEvent("QUEST_LOG_UPDATE")
	Stat:SetScript("OnEvent", OnEvent)
	Stat:SetScript("OnMouseDown", OnMouseDown)
	
	local collapse = CreateFrame("Frame")
	collapse:RegisterEvent("PLAYER_ENTERING_WORLD")
	collapse:SetScript("OnEvent", function(self, event)
		if C.automation.auto_collapse_login == true then
			ObjectiveTracker_Collapse()
		end
	end)
end
