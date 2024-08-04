local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	Add quest/achievement wowhead link
----------------------------------------------------------------------------------------
-- Get localised Wowhead URL
local wowheadLoc
local GameLocale = GetLocale()
if GameLocale == "deDE" then wowheadLoc = "de.wowhead.com"
elseif GameLocale == "esMX" then wowheadLoc = "es.wowhead.com"
elseif GameLocale == "esES" then wowheadLoc = "es.wowhead.com"
elseif GameLocale == "frFR" then wowheadLoc = "fr.wowhead.com"
elseif GameLocale == "itIT" then wowheadLoc = "it.wowhead.com"
elseif GameLocale == "ptBR" then wowheadLoc = "pt.wowhead.com"
elseif GameLocale == "ruRU" then wowheadLoc = "ru.wowhead.com"
elseif GameLocale == "koKR" then wowheadLoc = "ko.wowhead.com"
elseif GameLocale == "zhCN" then wowheadLoc = "cn.wowhead.com"
elseif GameLocale == "zhTW" then wowheadLoc = "cn.wowhead.com"
else							 wowheadLoc = "wowhead.com"
end

----------------------------------------------------------------------
-- ObjectiveTracker frame
----------------------------------------------------------------------

local selfText
StaticPopupDialogs.WATCHFRAME_URL = {
	text = L_WATCH_WOWHEAD_LINK,
	button1 = OKAY,
	timeout = 0,
	whileDead = true,
	hasEditBox = true,
	editBoxWidth = 350,
	OnShow = function(self, text)
		self.editBox:SetMaxLetters(0)
		self.editBox:SetText(text)
		self.editBox:HighlightText()
		selfText = text
	end,
	EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
	EditBoxOnTextChanged = function(self)
		if self:GetText():len() < 1 then
			self:GetParent():Hide()
		else
			self:SetText(selfText)
			self:HighlightText()
		end
	end,
	preferredIndex = 5,
}

local ID
local headers = {
	BonusObjectiveTracker,
	CampaignQuestObjectiveTracker,
	QuestObjectiveTracker,
	AchievementObjectiveTracker,
	WorldQuestObjectiveTracker,
}

for i = 1, #headers do
	local tracker = headers[i]
	if tracker then
		hooksecurefunc(tracker, "OnBlockHeaderClick", function(_, block)
			ID = block.id
		end)
	end
end

Menu.ModifyMenu("MENU_QUEST_OBJECTIVE_TRACKER", function(_, rootDescription)
	local button = MenuUtil.CreateButton(L_WATCH_WOWHEAD_LINK, function()
		StaticPopup_Show("WATCHFRAME_URL", _, _, "https://" .. wowheadLoc .. "/quest=" .. ID .. "#comments")
	end)
	rootDescription:Insert(button, 1)
	local divider = MenuUtil.CreateDivider()
	rootDescription:Insert(divider, 2)
end)

Menu.ModifyMenu("MENU_BONUS_OBJECTIVE_TRACKER", function(_, rootDescription)
	local button = MenuUtil.CreateButton(L_WATCH_WOWHEAD_LINK, function()
		StaticPopup_Show("WATCHFRAME_URL", _, _, "https://" .. wowheadLoc .. "/quest=" .. ID .. "#comments")
	end)
	rootDescription:Insert(button, 1)
	local divider = MenuUtil.CreateDivider()
	rootDescription:Insert(divider, 2)
end)

Menu.ModifyMenu("MENU_ACHIEVEMENT_TRACKER", function(_, rootDescription)
	local button = MenuUtil.CreateButton(L_WATCH_WOWHEAD_LINK, function()
		StaticPopup_Show("WATCHFRAME_URL", _, _, "https://" .. wowheadLoc .. "/achievement=" .. ID .. "#comments")
	end)
	rootDescription:Insert(button, 1)
	local divider = MenuUtil.CreateDivider()
	rootDescription:Insert(divider, 2)
end)

----------------------------------------------------------------------
-- Achievements frame
----------------------------------------------------------------------

-- Achievement link function
local function DoWowheadAchievementFunc()

	-- Create editbox
	local aEB = CreateFrame("EditBox", nil, AchievementFrame.backdrop)
	aEB:ClearAllPoints()
	aEB:SetPoint("BOTTOMRIGHT", 0, -20)
	aEB:SetHeight(16)
	aEB:SetFontObject("GameFontNormalSmall")
	aEB:SetBlinkSpeed(0)
	aEB:SetJustifyH("CENTER")
	aEB:SetAutoFocus(false)
	aEB:EnableKeyboard(false)
	aEB:SetHitRectInsets(90, 0, 0, 0)
	aEB:SetScript("OnKeyDown", function() end)
	aEB:SetScript("OnMouseUp", function()
		if aEB:IsMouseOver() then
			aEB:HighlightText()
		else
			aEB:HighlightText(0, 0)
		end
	end)
	T.SkinFrame(aEB)

	-- Create hidden font string (used for setting width of editbox)
	aEB.z = aEB:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
	aEB.z:Hide()

	-- Store last link in case editbox is cleared
	local lastAchievementLink

	-- Function to set editbox value
	local function SetAchievementFunc(self, achievementID)
		if achievementID then
			-- Set editbox text
			aEB:SetText("https://" .. wowheadLoc .. "/achievement=" .. achievementID .. "#comments")
			lastAchievementLink = aEB:GetText()
			-- Set hidden fontstring then resize editbox to match
			aEB.z:SetText(aEB:GetText())
			aEB:SetWidth(aEB.z:GetStringWidth() + 90)
			-- Get achievement title for tooltip
			local achievementLink = GetAchievementLink(achievementID)
			if achievementLink then
				aEB.tiptext = achievementLink:match("%[(.-)%]") .. "|n" .. "Press CTRL/C to copy."
			end
			-- Show the editbox
			aEB:Show()
		end
	end
	hooksecurefunc(AchievementTemplateMixin, "DisplayObjectives", SetAchievementFunc)
	hooksecurefunc("AchievementFrameComparisonTab_OnClick", function(self) aEB:Hide() end)

	-- Create tooltip
	aEB:HookScript("OnEnter", function()
		aEB:HighlightText()
		aEB:SetFocus()
		GameTooltip:SetOwner(aEB, "ANCHOR_TOP", 0, 10)
		GameTooltip:SetText(aEB.tiptext, nil, nil, nil, nil, true)
		GameTooltip:Show()
	end)

	aEB:HookScript("OnLeave", function()
		-- Set link text again if it's changed since it was set
		if aEB:GetText() ~= lastAchievementLink then aEB:SetText(lastAchievementLink) end
		aEB:HighlightText(0, 0)
		aEB:ClearFocus()
		GameTooltip:Hide()
	end)

end

-- Run function when achievement UI is loaded
if C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
	DoWowheadAchievementFunc()
else
	local waitAchievementsFrame = CreateFrame("FRAME")
	waitAchievementsFrame:RegisterEvent("ADDON_LOADED")
	waitAchievementsFrame:SetScript("OnEvent", function(self, event, arg1)
		if arg1 == "Blizzard_AchievementUI" then
			DoWowheadAchievementFunc()
			waitAchievementsFrame:UnregisterAllEvents()
		end
	end)
end

----------------------------------------------------------------------
-- World map frame
----------------------------------------------------------------------

-- Hide the title text
WorldMapFrameTitleText:Hide()

-- Create editbox
local mEB = CreateFrame("EditBox", nil, WorldMapFrame)
mEB:SetFrameLevel(WorldMapFrame.BorderFrame:GetFrameLevel() + 2)
mEB:SetFrameStrata(WorldMapFrame.BorderFrame:GetFrameStrata())
-- mEB:SetFrameLevel(501)
mEB:SetPoint("BOTTOMRIGHT", 0, -28)
mEB:SetHeight(16)
mEB:SetFontObject("GameFontNormal")
mEB:SetBlinkSpeed(0)
mEB:SetJustifyH("CENTER")
mEB:SetAutoFocus(false)
mEB:EnableKeyboard(false)
mEB:SetHitRectInsets(0, 90, 0, 0)
mEB:SetScript("OnKeyDown", function() end)
mEB:SetScript("OnMouseUp", function()
	if mEB:IsMouseOver() then
		mEB:HighlightText()
	else
		mEB:HighlightText(0, 0)
	end
end)
T.SkinFrame(mEB)
mEB:SetParent(QuestMapFrame.DetailsFrame)
-- Create hidden font string (used for setting width of editbox)
mEB.z = mEB:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
mEB.z:Hide()

-- Function to set editbox value
local function SetQuestInBox()
	local questID
	if QuestMapFrame.DetailsFrame:IsShown() then
		-- Get quest ID from currently showing quest in details panel
		questID = QuestMapFrame_GetDetailQuestID()
	else
		-- Get quest ID from currently selected quest on world map
		questID = C_SuperTrack.GetSuperTrackedQuestID()
	end
	if questID then
		-- Hide editbox if quest ID is invalid
		if questID == 0 then mEB:Hide() else mEB:Show() end
		-- Set editbox text
		mEB:SetText("https://" .. wowheadLoc .. "/quest=" .. questID .. "#comments")
		-- Set hidden fontstring then resize editbox to match
		mEB.z:SetText(mEB:GetText())
		mEB:SetWidth(mEB.z:GetStringWidth() + 60)
		-- Get quest title for tooltip
		local questLink = GetQuestLink(questID) or nil
		if questLink then
			mEB.tiptext = questLink:match("%[(.-)%]") .. "|n" .. "Press CTRL/C to copy."
		else
			mEB.tiptext = ""
			if mEB:IsMouseOver() and GameTooltip:IsShown() then GameTooltip:Hide() end
		end
	end
end

-- Set URL when super tracked quest changes and on startup
mEB:RegisterEvent("SUPER_TRACKING_CHANGED")
mEB:SetScript("OnEvent", SetQuestInBox)
SetQuestInBox()

-- Set URL when quest details frame is shown or hidden
hooksecurefunc("QuestMapFrame_ShowQuestDetails", SetQuestInBox)
hooksecurefunc("QuestMapFrame_CloseQuestDetails", SetQuestInBox)

-- Create tooltip
mEB:HookScript("OnEnter", function()
	mEB:HighlightText()
	mEB:SetFocus()
	GameTooltip:SetOwner(mEB, "ANCHOR_BOTTOM", 0, -10)
	GameTooltip:SetText(mEB.tiptext, nil, nil, nil, nil, true)
	GameTooltip:Show()
end)

mEB:HookScript("OnLeave", function()
	mEB:HighlightText(0, 0)
	mEB:ClearFocus()
	GameTooltip:Hide()
	SetQuestInBox()
end)