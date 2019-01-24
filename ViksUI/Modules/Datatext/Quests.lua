local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
 -- QUEST DATATEXT
--------------------------------------------------------------------

if C.datatext.Quests and C.datatext.Quests > 0 then
	local Stat = CreateFrame("Frame", "DataTextQuests", UIParent)
	Stat:CreatePanel("Invisible", 1, 1, "BOTTOMLEFT", self, "TOPLEFT", 0, 0)

	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	
	if C.datatext.location >= 9 then
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
	else
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	end
	
	PP(C.datatext.Quests, Text)

	local function OnEvent(self, event, ...)
		local numEntries, numQuests = GetNumQuestLogEntries()
		Text:SetText("Q |r: "..qColor.. numQuests.. "/25")
		Stat:SetAllPoints(Text)
		Stat:SetScript("OnEnter", function()
	end)

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