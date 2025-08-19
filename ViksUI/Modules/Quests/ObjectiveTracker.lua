local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	Move ObjectiveTrackerFrame and hide background
----------------------------------------------------------------------------------------
local anchor = CreateFrame("Frame", "ObjectiveTrackerAnchor", UIParent)
anchor:SetPoint("TOPRIGHT", DataTextQuests, "BOTTOMLEFT", 0, -14)
anchor:SetSize(224, 150)

ObjectiveTrackerFrame.IsUserPlaced = function() return true end
ObjectiveTrackerFrame:SetClampedToScreen(false)

hooksecurefunc(ObjectiveTrackerFrame, "SetPoint", function(_, _, parent)
	if parent ~= anchor then
		ObjectiveTrackerFrame:ClearAllPoints()
		ObjectiveTrackerFrame:SetPoint("TOPLEFT", anchor, "TOPLEFT", 20, 5)
	end
end)

local height = T.screenHeight / 1.6
ObjectiveTrackerFrame:SetHeight(height)

hooksecurefunc(ObjectiveTrackerFrame, "SetHeight", function(_, h)
	if h ~= height then
		ObjectiveTrackerFrame:SetHeight(height)
	end
end)

local headers = {
	ScenarioObjectiveTracker,
	BonusObjectiveTracker,
	UIWidgetObjectiveTracker,
	CampaignQuestObjectiveTracker,
	QuestObjectiveTracker,
	AdventureObjectiveTracker,
	AchievementObjectiveTracker,
	MonthlyActivitiesObjectiveTracker,
	ProfessionsRecipeTracker,
	WorldQuestObjectiveTracker,
}

ObjectiveTrackerFrame.Header.Background:SetTexture(nil)

----------------------------------------------------------------------------------------
--	Skin ObjectiveTrackerFrame.HeaderMenu.MinimizeButton
----------------------------------------------------------------------------------------
if C.skins.blizzard_frames == true then
	local button = ObjectiveTrackerFrame.Header.MinimizeButton
	button:SetSize(17, 17)
	button:StripTextures()
	button:SetTemplate("Overlay")

	button.minus = button:CreateTexture(nil, "OVERLAY")
	button.minus:SetSize(7, 1)
	button.minus:SetPoint("CENTER")
	button.minus:SetTexture(C.media.blank)

	button.plus = button:CreateTexture(nil, "OVERLAY")
	button.plus:SetSize(1, 7)
	button.plus:SetPoint("CENTER")
	button.plus:SetTexture(C.media.blank)

	button:HookScript("OnEnter", T.SetModifiedBackdrop)
	button:HookScript("OnLeave", T.SetOriginalBackdrop)

	button.plus:Hide()

	hooksecurefunc(ObjectiveTrackerFrame, "SetCollapsed", function(_, collapsed)
		if collapsed then
			button.plus:Show()
			if C.general.minimize_mouseover then
				button:SetAlpha(0)
				button:HookScript("OnEnter", function() button:SetAlpha(1) end)
				button:HookScript("OnLeave", function() button:SetAlpha(0) end)
			end
		else
			button.plus:Hide()
			if C.general.minimize_mouseover then
				button:SetAlpha(1)
				button:HookScript("OnEnter", function() button:SetAlpha(1) end)
				button:HookScript("OnLeave", function() button:SetAlpha(1) end)
			end
		end
		button:SetNormalTexture(0)
		button:SetPushedTexture(0)
	end)
end
ObjectiveTrackerFrame.Header.MinimizeButton:Hide() -- Hide, controlled bt DataText / Todo: Add option
ObjectiveTrackerFrame.Header.Text:Hide() -- Hide, controlled bt DataText / Todo: Add option
----------------------------------------------------------------------------------------
--	Auto collapse Objective Tracker
----------------------------------------------------------------------------------------
-- NOTE: SetCollapsed() cause UseQuestLogSpecialItem() taint
if C.quest.auto_collapse ~= "NONE" then
	local collapse = CreateFrame("Frame")
	collapse:RegisterEvent("PLAYER_ENTERING_WORLD")
	collapse:SetScript("OnEvent", function()
		if C.quest.auto_collapse == "RAID" then
			if IsInInstance() then
				C_Timer.After(0.1, function()
					ObjectiveTrackerFrame:SetCollapsed(true)
				end)
			elseif not InCombatLockdown() then
				if ObjectiveTrackerFrame.isCollapsed then
					ObjectiveTrackerFrame:SetCollapsed(false)
				end
			end
		elseif C.quest.auto_collapse == "SCENARIO" then
			local inInstance, instanceType = IsInInstance()
			if inInstance then
				if instanceType == "party" or instanceType == "scenario" then
					C_Timer.After(0.1, function() -- for some reason it got error after reload in instance
						for i = 3, #headers do
							headers[i]:SetCollapsed(true)
						end
					end)
				else
					C_Timer.After(0.1, function()
						ObjectiveTrackerFrame:SetCollapsed(true)
					end)
				end
			else
				if not InCombatLockdown() then
					for i = 3, #headers do
						if headers[i].isCollapsed then
							headers[i]:SetCollapsed(false)
						end
					end
					if ObjectiveTrackerFrame.isCollapsed then
						ObjectiveTrackerFrame:SetCollapsed(false)
					end
				end
			end
		elseif C.quest.auto_collapse == "RELOAD" then
			C_Timer.After(0.1, function()
				ObjectiveTrackerFrame:SetCollapsed(true)
			end)
		end
	end)
end

----------------------------------------------------------------------------------------
--	Difficulty color for quest headers
----------------------------------------------------------------------------------------
hooksecurefunc(QuestObjectiveTracker, "Update", function()
	for i = 1, C_QuestLog.GetNumQuestWatches() do
		local questID = C_QuestLog.GetQuestIDForQuestWatchIndex(i)
		if not questID then
			break
		end
		local block = QuestObjectiveTracker:GetExistingBlock(questID)
		if block then
			local col = GetDifficultyColor(C_PlayerInfo.GetContentDifficultyQuestForPlayer(questID))
			local diff = C_PlayerInfo.GetContentDifficultyQuestForPlayer(questID)
			if diff == 2 then
				local r1, g1, b1 = unpack(C.quest.title_text_color)
				col = {r = r1, g = g1, b = b1}
			end
			block.HeaderText:SetFont(C.quest.title_text_font, C.quest.title_text_font_size, C.quest.title_text_font_style)
			block.HeaderText:SetTextColor(col.r, col.g, col.b)
			block.HeaderText.col = col
		end
	end
end)

hooksecurefunc(QuestObjectiveTracker, "OnBlockHeaderLeave", function(_, block)
	if block.HeaderText.col then
		block.HeaderText:SetTextColor(block.HeaderText.col.r, block.HeaderText.col.g, block.HeaderText.col.b)
	end
end)

local function colorQuest(_, block)
	C_Timer.After(0.01, function()
		local poi = block.poiButton
		if poi then
			poi:SetScale(0.82)
			poi:SetPoint("TOP")
			if poi.UnderlayAtlas then poi.UnderlayAtlas:Hide() end
			if poi.Glow and poi.Glow:IsShown() then -- quest is selected
				poi:SetAlpha(1)
			else
				poi:SetAlpha(0.7)
			end
			local style = poi:GetStyle()
			block.HeaderText:SetFont(C.quest.title_text_font, C.quest.title_text_font_size, C.quest.title_text_font_style)
			block.HeaderText:SetTextColor(unpack(C.quest.title_text_color))
			if style == POIButtonUtil.Style.WorldQuest then
				local questID = poi:GetQuestID()
				local info = C_QuestLog.GetQuestTagInfo(questID)
				if info then
					local col = {r = 1, g = 1, b = 1}
					if info.quality == Enum.WorldQuestQuality.Epic then
						col = BAG_ITEM_QUALITY_COLORS[4]
					elseif info.quality == Enum.WorldQuestQuality.Rare then
						col = BAG_ITEM_QUALITY_COLORS[3]
					else
						local r1, g1, b1 = unpack(C.quest.title_text_color)
						col = {r = r1, g = g1, b = b1}
					end
					block.HeaderText:SetFont(C.quest.title_text_font, C.quest.title_text_font_size, C.quest.title_text_font_style)
					block.HeaderText:SetTextColor(col.r, col.g, col.b)
					block.HeaderText.col = col
				end
			end
		end
	end)
end

----------------------------------------------------------------------------------------
--	Skin quest item buttons
----------------------------------------------------------------------------------------
local function HotkeyShow(self)
	local item = self:GetParent()
	if item.rangeOverlay then item.rangeOverlay:Show() end
end

local function HotkeyHide(self)
	local item = self:GetParent()
	if item.rangeOverlay then item.rangeOverlay:Hide() end
end

local function HotkeyColor(self, r)
	local item = self:GetParent()
	if item.rangeOverlay then
		if r == 1 then
			item.rangeOverlay:Show()
		else
			item.rangeOverlay:Hide()
		end
	end
end

local function SkinQuestIcons(_, block)
	local item = block and block.ItemButton

	if item and not item.skinned then
		item:SetSize(25, 25)
		item:SetTemplate("Default")
		item:StyleButton()

		item:SetNormalTexture(0)

		item.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		item.icon:SetPoint("TOPLEFT", item, 2, -2)
		item.icon:SetPoint("BOTTOMRIGHT", item, -2, 2)

		item.Cooldown:SetAllPoints(item.icon)

		item.Count:ClearAllPoints()
		item.Count:SetPoint("BOTTOMRIGHT", 0, 2)
		item.Count:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
		item.Count:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)

		local rangeOverlay = item:CreateTexture(nil, "OVERLAY")
		rangeOverlay:SetTexture(C.media.texture)
		rangeOverlay:SetInside()
		rangeOverlay:SetVertexColor(1, 0.3, 0.1, 0.6)
		item.rangeOverlay = rangeOverlay

		hooksecurefunc(item.HotKey, "Show", HotkeyShow)
		hooksecurefunc(item.HotKey, "Hide", HotkeyHide)
		hooksecurefunc(item.HotKey, "SetVertexColor", HotkeyColor)
		HotkeyColor(item.HotKey, item.HotKey:GetTextColor())
		item.HotKey:SetAlpha(0)

		item.skinned = true
	end

	local finder = block and block.rightEdgeFrame
    local poi = block and block.poiButton
	if finder and not finder.skinned then
		finder:SetSize(26, 26)
		finder:SetNormalTexture(0)
		finder:SetHighlightTexture(0)
		finder:SetPushedTexture(0)
		finder.b = CreateFrame("Frame", nil, finder)
		finder.b:SetTemplate("Overlay")
		finder.b:SetPoint("TOPLEFT", finder, "TOPLEFT", 2, -3)
		finder.b:SetPoint("BOTTOMRIGHT", finder, "BOTTOMRIGHT", -4, 3)
		finder.b:SetFrameLevel(1)

		finder:HookScript("OnEnter", function(self)
			if self:IsEnabled() then
				self.b:SetBackdropBorderColor(unpack(C.media.classborder_color))
				if self.b.overlay then
					self.b.overlay:SetVertexColor(C.media.classborder_color[1] * 0.3, C.media.classborder_color[2] * 0.3, C.media.classborder_color[3] * 0.3, 1)
				end
			end
		end)

		finder:HookScript("OnLeave", function(self)
			self.b:SetBackdropBorderColor(unpack(C.media.border_color))
			if self.b.overlay then
				self.b.overlay:SetVertexColor(0.1, 0.1, 0.1, 1)
			end
		end)

		hooksecurefunc(finder, "Show", function(self)
			self.b:SetFrameLevel(1)
		end)

		finder.skinned = true
	end
	
	-- Only move the button if finder & block exist
	local function positionFinder(b)
		-- re-fetch fresh references
		local finder = b and b.rightEdgeFrame
		local poi = b and b.poiButton
		local block = b

		if not finder or not block then return end  -- safety check

		local function IsObjectiveTrackerOnRight()
			if not ObjectiveTrackerFrame then return false end
			local left = ObjectiveTrackerFrame:GetLeft()
			local right = ObjectiveTrackerFrame:GetRight()
			if not left or not right then return false end
			local screenWidth = GetScreenWidth()
			local trackerCenter = (left + right) / 2
			return trackerCenter > (screenWidth / 2)
		end

		if IsObjectiveTrackerOnRight() then
			finder:ClearAllPoints()
			if poi then
				finder:SetPoint("TOPLEFT", poi, "BOTTOMLEFT", -4, -8)
			else
				finder:SetPoint("TOPLEFT", block, "TOPLEFT", -4, -8)
			end
		end
	end

	positionFinder(block)

	-- Re-apply position every time finder is shown
	if finder and not finder._moved then
		finder:HookScript("OnShow", function() positionFinder(block) end)
		finder._moved = true
	end

	-- Re-apply position every time finder is updated (extra robust)
	if finder and not finder._updateHooked then
		finder:HookScript("OnUpdate", function() positionFinder(block) end)
		finder._updateHooked = true
	end
end

----------------------------------------------------------------------------------------
-- Move Find Group button (eye) under POI icon for World Quests
----------------------------------------------------------------------------------------
local function FixWorldQuestFinderButton()
    if not WorldQuestObjectiveTracker or not WorldQuestObjectiveTracker.usedBlocks then return end
    for block in pairs(WorldQuestObjectiveTracker.usedBlocks) do
        local finder = block.rightEdgeFrame
        local poi = block.poiButton
        if finder and poi then
            finder:ClearAllPoints()
            finder:SetPoint("TOPLEFT", poi, "BOTTOMLEFT", -4, -6)
        end
    end
end

hooksecurefunc(WorldQuestObjectiveTracker, "AddBlock", FixWorldQuestFinderButton)
hooksecurefunc(WorldQuestObjectiveTracker, "Update", function()
    C_Timer.After(0, FixWorldQuestFinderButton)
end)

local updateFixFrame = CreateFrame("Frame")
local elapsed = 0
updateFixFrame:SetScript("OnUpdate", function(self, e)
    elapsed = elapsed + e
    FixWorldQuestFinderButton()
    if elapsed > 0.5 then
        self:SetScript("OnUpdate", nil)
        elapsed = 0
    end
end)

hooksecurefunc(WorldQuestObjectiveTracker, "Update", function()
    updateFixFrame:SetScript("OnUpdate", updateFixFrame:GetScript("OnUpdate"))
end)
----------------------------------------------------------------------------------------
--	Skin quest objective progress bar
----------------------------------------------------------------------------------------
local function SkinProgressBar(tracker, key)
	local progressBar = tracker.usedProgressBars[key]
	local bar = progressBar and progressBar.Bar
	local label = bar and bar.Label
	local icon = bar and bar.Icon

	if not progressBar.styled then
		if bar.BarFrame then bar.BarFrame:Hide() end
		if bar.BarFrame2 then bar.BarFrame2:Hide() end
		if bar.BarFrame3 then bar.BarFrame3:Hide() end
		if bar.BarGlow then bar.BarGlow:Hide() end
		if bar.Sheen then bar.Sheen:Hide() end
		if bar.IconBG then bar.IconBG:SetAlpha(0) end
		if bar.BorderLeft then bar.BorderLeft:SetAlpha(0) end
		if bar.BorderRight then bar.BorderRight:SetAlpha(0) end
		if bar.BorderMid then bar.BorderMid:SetAlpha(0) end
		if progressBar.PlayFlareAnim then progressBar.PlayFlareAnim  = T.dummy end -- hide animation

		bar:SetSize(200, 16)
		bar:SetStatusBarTexture(C.media.texture)
		bar:CreateBackdrop("Transparent")

		label:ClearAllPoints()
		label:SetPoint("CENTER", 0, -1)
		label:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
		label:SetDrawLayer("OVERLAY")

		if icon then
			icon:SetPoint("RIGHT", 26, 0)
			icon:SetSize(20, 20)
			icon:SetMask("")

			local border = CreateFrame("Frame", "$parentBorder", bar)
			border:SetAllPoints(icon)
			border:SetTemplate("Transparent")
			border:SetBackdropColor(0, 0, 0, 0)
			bar.newIconBg = border

			hooksecurefunc(bar.AnimIn, "Play", function()
				bar.AnimIn:Stop()
			end)
		end

		progressBar.styled = true
	end

	if bar.newIconBg then bar.newIconBg:SetShown(icon:IsShown()) end
end

----------------------------------------------------------------------------------------
--	Skin Timer bar
----------------------------------------------------------------------------------------
local function SkinTimer(tracker, key)
	local timerBar = tracker.usedTimerBars[key]
	local bar = timerBar and timerBar.Bar

	if not timerBar.styled then
		if bar.BorderLeft then bar.BorderLeft:SetAlpha(0) end
		if bar.BorderRight then bar.BorderRight:SetAlpha(0) end
		if bar.BorderMid then bar.BorderMid:SetAlpha(0) end

		bar:SetStatusBarTexture(C.media.texture)
		bar:CreateBackdrop("Transparent")
		timerBar.styled = true
	end
end
-- for test in dungeon /run ScenarioObjectiveTracker.ObjectivesBlock:AddTimerBar(60, GetTime() - 5)

----------------------------------------------------------------------------------------
--	Ctrl+Click to abandon a quest or Alt+Click to share a quest(by Suicidal Katt)
----------------------------------------------------------------------------------------
local function onClick(questID)
	if IsControlKeyDown() then
		Menu.GetManager():HandleESC()
		QuestMapQuestOptions_AbandonQuest(questID)
	elseif IsAltKeyDown() and C_QuestLog.IsPushableQuest(questID) then
		Menu.GetManager():HandleESC()
		QuestMapQuestOptions_ShareQuest(questID)
	end
end

hooksecurefunc("QuestMapLogTitleButton_OnClick", function(self) onClick(self.questID) end)

----------------------------------------------------------------------------------------
--	Skin and hook all trackers
----------------------------------------------------------------------------------------
for i = 1, #headers do
	local header = headers[i].Header
	if header then
		header.Background:SetTexture(nil)
		if C.quest.header_button_only then
		header.Text:Hide()
		else
			header.MinimizeButton:Hide()
			header.Text:SetFont(C.quest.header_text_font, C.quest.header_text_font_size, C.quest.header_text_font_style)
			header.Text:SetJustifyH(C.quest.header_text_ori)
			header.Text:SetTextColor(unpack(C.quest.header_text_color))
			header.Text:SetDrawLayer("OVERLAY", 7)
			header.Text:SetPoint("BOTTOMRIGHT", 0, 8)
			HeaderPanel = CreateFrame("Frame", nil, header)
			HeaderPanel:SetFrameLevel(header:GetFrameLevel() - 1)
			HeaderPanel:SetFrameStrata("BACKGROUND")
			HeaderPanel:SetOutside(header, 1, 1)

			HeaderBar = CreateFrame("StatusBar", nil, HeaderPanel)
			HeaderBar:Size(C.quest.header_bar_width, C.quest.header_bar_height)
			HeaderBar:SetPoint("RIGHT", HeaderPanel, 0, -10)
			HeaderBar:SetStatusBarTexture(C.quest.header_bar_Texture)
			HeaderBar:SetStatusBarColor(unpack(C.quest.header_bar_color))
			HeaderBar:SetTemplate()
			HeaderBar:CreateShadow()
			header:SetScript("OnEnter", function(self)
				header.Text:SetTextColor(1, .8, 0)
			end)
			header:SetScript("OnLeave", function(self)
				header.Text:SetTextColor(unpack(C.quest.header_text_color))
			end)
		end
	end

	local tracker = headers[i]
	if tracker then
		hooksecurefunc(tracker, "AddBlock", SkinQuestIcons)
		hooksecurefunc(tracker, "GetProgressBar", SkinProgressBar)
		hooksecurefunc(tracker, "GetTimerBar", SkinTimer)
		tracker.Header:SetScript("OnMouseDown", function()
			if IsAltKeyDown() or IsShiftKeyDown() then
				QuestObjectiveTracker:SetCollapsed(true)
				WorldQuestObjectiveTracker:SetCollapsed(true)
				CampaignQuestObjectiveTracker:SetCollapsed(true)
				WorldQuestObjectiveTracker:SetCollapsed(true)
				AchievementObjectiveTracker:SetCollapsed(true)
			elseif IsControlKeyDown() then
				QuestObjectiveTracker:SetCollapsed(false)
				WorldQuestObjectiveTracker:SetCollapsed(false)
				CampaignQuestObjectiveTracker:SetCollapsed(false)
				WorldQuestObjectiveTracker:SetCollapsed(false)
				AchievementObjectiveTracker:SetCollapsed(false)
			else
				if tracker:IsCollapsed() then
				tracker:SetCollapsed(false);
				else
				tracker:SetCollapsed(true);
				end
			end
		end)
		hooksecurefunc(tracker, "OnBlockHeaderClick", function(_, block) onClick(block.id)
			if IsControlKeyDown() then
				Menu.GetManager():HandleESC()
				QuestMapQuestOptions_AbandonQuest(block.id)
			elseif IsAltKeyDown() and C_QuestLog.IsPushableQuest(block.id) then
				Menu.GetManager():HandleESC()
				QuestMapQuestOptions_ShareQuest(block.id)
			end
		end)

		hooksecurefunc(tracker, "OnBlockHeaderEnter", function(_, block)
			if T.IsFramePositionedLeft(ObjectiveTrackerFrame) then
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("TOPLEFT", block, "TOPRIGHT", 0, 0)
				GameTooltip:Show()
			end
		end)

		hooksecurefunc(tracker, "OnBlockHeaderLeave", function(_, block)
			if block.HeaderText and block.HeaderText.col then
				block.HeaderText:SetTextColor(block.HeaderText.col.r, block.HeaderText.col.g, block.HeaderText.col.b)
			end
		end)
		hooksecurefunc(tracker, "AddBlock", colorQuest)
	end
end

----------------------------------------------------------------------------------------
--	Skin Dungeon block
----------------------------------------------------------------------------------------
hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateStageBlock", function(block)
	if not block.backdrop then
		block:CreateBackdrop("Overlay")
		block.backdrop:SetPoint("TOPLEFT", block.NormalBG, 3, -3)
		block.backdrop:SetPoint("BOTTOMRIGHT", block.NormalBG, -6, 3)

		block.NormalBG:SetAlpha(0)
		block.FinalBG:SetAlpha(0)
		block.GlowTexture:SetTexture("")
	end
end)

hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateWidgetRegistration", function(self)
	local widgetContainer = self.WidgetContainer
	if widgetContainer.widgetFrames then
		for _, widgetFrame in pairs(widgetContainer.widgetFrames) do
			if widgetFrame.Frame then widgetFrame.Frame:SetAlpha(0) end

			local bar = widgetFrame.TimerBar
			if bar and not bar.styled then
				hooksecurefunc(bar, "SetWidth", function(self, width)
					if width ~= 200 then
						self:SetWidth(200)
						self:SetStatusBarTexture(C.media.texture)
					end
				end)
				bar:SetStatusBarTexture(C.media.texture)
				bar:CreateBackdrop("Overlay")
				bar:SetStatusBarColor(0, 0.6, 1)
				bar:SetFrameLevel(bar:GetFrameLevel() + 3)
				bar.styled = true
			end

			if widgetFrame.CurrencyContainer then
				for currencyFrame in widgetFrame.currencyPool:EnumerateActive() do
					if not currencyFrame.styled then
						currencyFrame.Icon:SkinIcon()
						currencyFrame.styled = true
					end
				end
			end
		end
	end
end)

ScenarioObjectiveTracker.StageBlock:HookScript("OnEnter", function(self)
	if T.IsFramePositionedLeft(ObjectiveTrackerFrame) then
		GameTooltip:ClearAllPoints()
		GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT", 50, -3)
	end
end)

----------------------------------------------------------------------------------------
--	Skin Mythic+ block
----------------------------------------------------------------------------------------
hooksecurefunc(ScenarioObjectiveTracker.ChallengeModeBlock, "Activate", function(block)
	if not block.backdrop then
		block:CreateBackdrop("Overlay")
		block.backdrop:SetPoint("TOPLEFT", block, 3, -3)
		block.backdrop:SetPoint("BOTTOMRIGHT", block, -6, 3)
		block.backdrop.overlay:SetVertexColor(0.12, 0.12, 0.12, 1)

		local bg = select(3, block:GetRegions())
		bg:SetAlpha(0)

		block.TimerBGBack:SetAlpha(0)
		block.TimerBG:SetAlpha(0)

		block.StatusBar:SetStatusBarTexture(C.media.texture)
		block.StatusBar:CreateBackdrop("Overlay")
		block.StatusBar.backdrop:SetFrameLevel(block.backdrop:GetFrameLevel() + 1)
		block.StatusBar:SetStatusBarColor(0, 0.6, 1)
		block.StatusBar:SetFrameLevel(block.StatusBar:GetFrameLevel() + 3)
	end
end)

hooksecurefunc(ScenarioObjectiveTracker.ChallengeModeBlock, "SetUpAffixes", function(self)
	for frame in self.affixPool:EnumerateActive() do
		frame.Border:SetTexture(nil)
		frame.Portrait:SetTexture(nil)
		if not frame.styled then
			frame.Portrait:SkinIcon()
			frame.styled = true
		end

		if frame.info then
			frame.Portrait:SetTexture(CHALLENGE_MODE_EXTRA_AFFIX_INFO[frame.info.key].texture)
		elseif frame.affixID then
			local _, _, filedataid = C_ChallengeMode.GetAffixInfo(frame.affixID)
			frame.Portrait:SetTexture(filedataid)
		end
	end
end)

----------------------------------------------------------------------------------------
--	Skin Torghast ablities
----------------------------------------------------------------------------------------
local Maw = ScenarioObjectiveTracker.MawBuffsBlock.Container
Maw:SkinButton()
Maw:SetPoint("TOPRIGHT", ScenarioObjectiveTracker.MawBuffsBlock, "TOPRIGHT", -23, 0)
Maw.List.button:SetSize(234, 30)
Maw.List:StripTextures()
Maw.List:SetTemplate("Overlay")

Maw.List:HookScript("OnShow", function(self)
	self.button:SetPushedTexture(0)
	self.button:SetHighlightTexture(0)
	self.button:SetWidth(234)
	self.button:SetButtonState("NORMAL")
	self.button:SetPushedTextOffset(0, 0)
	self.button:SetButtonState("PUSHED", true)
end)

Maw.List:HookScript("OnHide", function(self)
	self.button:SetPushedTexture(0)
	self.button:SetHighlightTexture(0)
	self.button:SetWidth(234)
end)

Maw:HookScript("OnClick", function(container)
	container.List:ClearAllPoints()
	if T.IsFramePositionedLeft(ObjectiveTrackerFrame) then
		container.List:SetPoint("TOPLEFT", container, "TOPRIGHT", 30, 1)
	else
		container.List:SetPoint("TOPRIGHT", container, "TOPLEFT", -15, 1)
	end
end)