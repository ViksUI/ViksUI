local T, C, L = unpack(ViksUI)
if C.minimap.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Minimap border
----------------------------------------------------------------------------------------
local MinimapAnchor = CreateFrame("Frame", "MinimapAnchor", UIParent)

if C.panels.NoPanels == true then
MinimapAnchor:CreatePanel("Transparent", C.minimap.size, C.minimap.size, unpack(C.position.minimapline))
else
MinimapAnchor:CreatePanel("Transparent", C.minimap.size, C.minimap.size, unpack(C.position.minimap))
end

--Note: Use "Invisible" to hide
----------------------------------------------------------------------------------------
--	Shape, location and scale
----------------------------------------------------------------------------------------
-- Disable Minimap Cluster
MinimapCluster:EnableMouse(false)

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent(event)
	-- Parent Minimap into our frame
	Minimap:SetParent(MinimapAnchor)
	Minimap:ClearAllPoints()
	Minimap:SetPoint("TOPLEFT", MinimapAnchor, "TOPLEFT", 2, -2)
	Minimap:SetPoint("BOTTOMRIGHT", MinimapAnchor, "BOTTOMRIGHT", -2, 2)
	Minimap:SetSize(MinimapAnchor:GetWidth(), MinimapAnchor:GetWidth())

	MinimapBackdrop:ClearAllPoints()
	MinimapBackdrop:SetPoint("TOPLEFT", MinimapAnchor, "TOPLEFT", 2, -2)
	MinimapBackdrop:SetPoint("BOTTOMRIGHT", MinimapAnchor, "BOTTOMRIGHT", -2, 2)
	MinimapBackdrop:SetSize(MinimapAnchor:GetWidth(), MinimapAnchor:GetWidth())

	-- Instance Difficulty icon
	MinimapCluster.InstanceDifficulty:SetParent(Minimap)
	MinimapCluster.InstanceDifficulty:ClearAllPoints()
	MinimapCluster.InstanceDifficulty:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 1, 3)
	MinimapCluster.InstanceDifficulty.Default.Border:Hide()
	MinimapCluster.InstanceDifficulty.Default.Background:SetSize(28, 28)
	MinimapCluster.InstanceDifficulty.Default.Background:SetVertexColor(0.6, 0.3, 0)

	-- Guild Instance Difficulty icon
	MinimapCluster.InstanceDifficulty.Guild.Border:Hide()
	MinimapCluster.InstanceDifficulty.Guild.Background:SetSize(28, 28)
	MinimapCluster.InstanceDifficulty.Guild.Background:ClearAllPoints()
	MinimapCluster.InstanceDifficulty.Guild.Background:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -1, 0)

	-- Challenge Mode icon
	MinimapCluster.InstanceDifficulty.ChallengeMode.Border:Hide()
	MinimapCluster.InstanceDifficulty.ChallengeMode.Background:SetSize(28, 28)
	MinimapCluster.InstanceDifficulty.ChallengeMode.Background:SetVertexColor(0.8, 0.8, 0)
	MinimapCluster.InstanceDifficulty.ChallengeMode.Background:ClearAllPoints()
	MinimapCluster.InstanceDifficulty.ChallengeMode.Background:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -1, 0)

	-- Move QueueStatus icon
	QueueStatusFrame:SetClampedToScreen(true)
	QueueStatusFrame:SetFrameStrata("TOOLTIP")
	QueueStatusButton:ClearAllPoints()
	QueueStatusButton:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 1, -1)
	QueueStatusButton:SetParent(Minimap)
	QueueStatusButton:SetScale(0.5)

	hooksecurefunc(QueueStatusButton, "SetPoint", function(self, _, anchor)
		if anchor ~= Minimap then
			self:ClearAllPoints()
			self:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 1, -1)
		end
	end)

	hooksecurefunc(QueueStatusButton, "SetScale", function(self, scale)
		if scale ~= 0.5 then
			self:SetScale(0.5)
		end
	end)

	-- Invites icon
	local InviteTexture = GameTimeCalendarInvitesTexture
	InviteTexture:ClearAllPoints()
	InviteTexture:SetParent(Minimap)
	InviteTexture:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -1, -4)
	GameTimeFrame:Hide()

	-- Create button to show invite tooltip and allow open calendar
	local button = CreateFrame("Button", nil, Minimap)
	button:SetAllPoints(InviteTexture)
	if not GameTimeCalendarInvitesTexture:IsShown() then
		button:Hide()
	end

	button:SetScript("OnEnter", function()
		if InCombatLockdown() then return end
		if InviteTexture:IsShown() then
			GameTooltip:SetOwner(button, "ANCHOR_LEFT")
			GameTooltip:AddLine(GAMETIME_TOOLTIP_CALENDAR_INVITES)
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(GAMETIME_TOOLTIP_TOGGLE_CALENDAR)
			GameTooltip:Show()
		end
	end)

	button:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)

	button:SetScript("OnClick", function()
		if InCombatLockdown() then return end
		if InviteTexture:IsShown() then
			ToggleCalendar()
		end
	end)

	hooksecurefunc(InviteTexture, "Show", function()
		button:Show()
	end)

	hooksecurefunc(InviteTexture, "Hide", function()
		button:Hide()
	end)

	-- Move Mail icon
	local MailFrame = MinimapCluster.IndicatorFrame.MailFrame
	hooksecurefunc(MailFrame, "SetPoint", function(self, _, anchor)
		if anchor ~= Minimap then
			self:ClearAllPoints()
			self:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 4, -1)
		end
	end)
	MiniMapMailIcon:SetTexture("Interface\\AddOns\\ViksUI\\Media\\Textures\\Mail.tga")
	MiniMapMailIcon:SetSize(16, 16)

	-- Move crafting order icon
	local Crafting = MinimapCluster.IndicatorFrame.CraftingOrderFrame
	hooksecurefunc(Crafting, "SetPoint", function(self, _, anchor)
		if anchor ~= Minimap then
			self:ClearAllPoints()
			self:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 4)
		end
	end)
end)

-- Adjusting for patch 9.0.1 Minimap.xml
Minimap:SetFrameStrata("LOW")
Minimap:SetFrameLevel(2)

-- Hide Border
MinimapCompassTexture:Hide()
MinimapCluster.BorderTop:StripTextures()

-- Hide Zoom Buttons
Minimap.ZoomIn:Kill()
Minimap.ZoomOut:Kill()

-- Hide Blob Ring
Minimap:SetArchBlobRingScalar(0)
Minimap:SetQuestBlobRingScalar(0)

-- Hide Zone Frame
MinimapCluster.ZoneTextButton:Hide()

AddonCompartmentFrame:Kill()

-- Garrison icon
if C.minimap.garrison_icon == true then
	ExpansionLandingPageMinimapButton:SetScale(0.6)
	ExpansionLandingPageMinimapButton:ClearAllPoints()
	ExpansionLandingPageMinimapButton:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", -3, 1)
	hooksecurefunc(ExpansionLandingPageMinimapButton, "SetPoint", function(_, _, _, _, _, y)
		if y ~= 1 then
			ExpansionLandingPageMinimapButton:ClearAllPoints()
			ExpansionLandingPageMinimapButton:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", -3, 1)
		end
	end)
else
	ExpansionLandingPageMinimapButton:SetScale(0.0001)
	ExpansionLandingPageMinimapButton:SetAlpha(0)
end

-- Feedback icon
if FeedbackUIButton then
	FeedbackUIButton:ClearAllPoints()
	FeedbackUIButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 0)
	FeedbackUIButton:SetScale(0.8)
end

-- Streaming icon
if StreamingIcon then
	StreamingIcon:ClearAllPoints()
	StreamingIcon:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -10)
	StreamingIcon:SetScale(0.8)
	StreamingIcon:SetFrameStrata("BACKGROUND")
end

-- GhostFrame
GhostFrame:StripTextures()
GhostFrame:SetTemplate("Overlay")
GhostFrame:StyleButton()
GhostFrame:ClearAllPoints()
GhostFrame:SetPoint(unpack(C.position.ghost))
GhostFrameContentsFrameIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
GhostFrameContentsFrameIcon:SetSize(32, 32)
GhostFrameContentsFrame:SetFrameLevel(GhostFrameContentsFrame:GetFrameLevel() + 2)
GhostFrameContentsFrame:CreateBackdrop("Overlay")
GhostFrameContentsFrame.backdrop:SetPoint("TOPLEFT", GhostFrameContentsFrameIcon, -2, 2)
GhostFrameContentsFrame.backdrop:SetPoint("BOTTOMRIGHT", GhostFrameContentsFrameIcon, 2, -2)

-- DurabilityFrame
hooksecurefunc(DurabilityFrame, "SetPoint", function(self, _, parent)
	if parent and parent ~= UIParent then
		self:SetClampedToScreen(false)
		self:ClearAllPoints()
		self:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 0, LPSTAT_CONFIG.Durability.man and 200 or -90)
	end
end)

-- Enable mouse scrolling
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(_, d)
	if d > 0 then
		_G.Minimap.ZoomIn:Click()
	elseif d < 0 then
		_G.Minimap.ZoomOut:Click()
	end
end)

-- Hide Game Time
MinimapAnchor:RegisterEvent("PLAYER_LOGIN")
MinimapAnchor:RegisterEvent("ADDON_LOADED")
MinimapAnchor:SetScript("OnEvent", function(_, _, addon)
	if addon == "Blizzard_TimeManager" then
		TimeManagerClockButton:Kill()
	elseif addon == "Blizzard_HybridMinimap" then
		HybridMinimap:SetFrameStrata("BACKGROUND")
		HybridMinimap:SetFrameLevel(100)
		HybridMinimap.MapCanvas:SetUseMaskTexture(false)
		HybridMinimap.CircleMask:SetTexture("Interface\\BUTTONS\\WHITE8X8")
		HybridMinimap.MapCanvas:SetUseMaskTexture(true)
		C_Timer.After(0.5, function()
			Minimap:SetFrameStrata("LOW")
			Minimap:SetFrameLevel(2)
		end)
	end
end)

----------------------------------------------------------------------------------------
--	Right click menu
----------------------------------------------------------------------------------------
local menuFrame = CreateFrame("Frame", "MinimapRightClickMenu", UIParent, "UIDropDownMenuTemplate")
local guildText = IsInGuild() and ACHIEVEMENTS_GUILD_TAB or LOOKINGFORGUILD
local journalText = T.client == "ruRU" and ENCOUNTER_JOURNAL or ADVENTURE_JOURNAL
local micromenu = {
	{text = CHARACTER_BUTTON, notCheckable = 1, func = function()
		ToggleCharacter("PaperDollFrame")
	end},
	{text = PROFESSIONS_BUTTON, notCheckable = 1, func = function()
		if InCombatLockdown() then
			print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return
		end
		ToggleProfessionsBook()
	end},
	{text = TALENTS_BUTTON, notCheckable = 1, func = function()
		if T.level >= 10 then
			PlayerSpellsUtil.ToggleClassTalentOrSpecFrame()
		else
			if C.general.error_filter ~= "WHITELIST" then
				UIErrorsFrame:AddMessage(format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10), 1, 0.1, 0.1)
			else
				print("|cffffff00"..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10).."|r")
			end
		end
	end},
	{text = ACHIEVEMENT_BUTTON, notCheckable = 1, func = function()
		ToggleAchievementFrame()
	end},
	{text = QUESTLOG_BUTTON, notCheckable = 1, func = function()
		ToggleQuestLog()
	end},
	{text = guildText, notCheckable = 1, func = function()
		ToggleGuildFrame()
	end},
	{text = SOCIAL_BUTTON, notCheckable = 1, func = function()
		ToggleFriendsFrame()
	end},
	{text = CHAT_CHANNELS, notCheckable = 1, func = function()
		ToggleChannelFrame()
	end},
	{text = PLAYER_V_PLAYER, notCheckable = 1, func = function()
		if T.level >= 10 then
			TogglePVPUI()
		else
			if C.general.error_filter ~= "WHITELIST" then
				UIErrorsFrame:AddMessage(format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10), 1, 0.1, 0.1)
			else
				print("|cffffff00"..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10).."|r")
			end
		end
	end},
	{text = GROUP_FINDER, notCheckable = 1, func = function()
		if T.level >= 10 then
			PVEFrame_ToggleFrame("GroupFinderFrame", nil)
		else
			if C.general.error_filter ~= "WHITELIST" then
				UIErrorsFrame:AddMessage(format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10), 1, 0.1, 0.1)
			else
				print("|cffffff00"..format(FEATURE_BECOMES_AVAILABLE_AT_LEVEL, 10).."|r")
			end
		end
	end},
	{text = journalText, notCheckable = 1, func = function()
		if C_AdventureJournal.CanBeShown() then
			ToggleEncounterJournal()
		else
			if C.general.error_filter ~= "WHITELIST" then
				UIErrorsFrame:AddMessage(FEATURE_NOT_YET_AVAILABLE, 1, 0.1, 0.1)
			else
				print("|cffffff00"..FEATURE_NOT_YET_AVAILABLE.."|r")
			end
		end
	end},
	{text = COLLECTIONS, notCheckable = 1, func = function()
		if InCombatLockdown() then
			print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return
		end
		ToggleCollectionsJournal()
	end},
	{text = HOUSING_MICRO_BUTTON, notCheckable = 1, func = function()
		if Kiosk.IsEnabled() then
			return
		end

		HousingFramesUtil.ToggleHousingDashboard()
	end},
	{text = HELP_BUTTON, notCheckable = 1, func = function()
		ToggleHelpFrame()
	end},
	{text = L_MINIMAP_CALENDAR, notCheckable = 1, func = function()
		ToggleCalendar()
	end},
	{text = BATTLEFIELD_MINIMAP, notCheckable = 1, func = function()
		ToggleBattlefieldMap()
	end},
}

if T.newPatch then
	if not IsTrialAccount() and C_StorePublic.IsEnabled() then
		tinsert(micromenu, {text = BLIZZARD_STORE, notCheckable = 1, func = function() StoreMicroButton:Click() end})
	end
else
	if not IsTrialAccount() and not C_StorePublic.IsDisabledByParentalControls() and C_StorePublic.IsEnabled() then
		tinsert(micromenu, {text = BLIZZARD_STORE, notCheckable = 1, func = function() StoreMicroButton:Click() end})
	end
end

if T.level == MAX_PLAYER_LEVEL then
	tinsert(micromenu, {text = RATED_PVP_WEEKLY_VAULT, notCheckable = 1, func = function()
		if not WeeklyRewardsFrame then
			WeeklyRewards_LoadUI()
		end
		ToggleFrame(WeeklyRewardsFrame)
	end})
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("GARRISON_SHOW_LANDING_PAGE")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function()
	if ExpansionLandingPageMinimapButton.title then
		tinsert(micromenu, {text = ExpansionLandingPageMinimapButton.title, notCheckable = 1, func = function() ExpansionLandingPageMinimapButton:ToggleLandingPage() end})
		frame:UnregisterAllEvents()
	end
end)

local MinimapArea = CreateFrame("Frame", nil, Minimap)
MinimapArea:SetPassThroughButtons("LeftButton")
MinimapArea:SetPropagateMouseMotion(true)
MinimapArea:SetAllPoints()

MinimapArea:SetScript("OnMouseUp", function(self, button)
	local position = MinimapAnchor:GetPoint()
	if button == "RightButton" then
		if position:match("LEFT") then
			EasyMenu(micromenu, menuFrame, "cursor", 0, 0, "MENU")
		else
			EasyMenu(micromenu, menuFrame, "cursor", -160, 0, "MENU")
		end
	elseif button == "MiddleButton" then
		MinimapCluster.Tracking.Button:OpenMenu()
		MinimapCluster.Tracking.Button.menu:ClearAllPoints()
		if position:match("LEFT") then
			MinimapCluster.Tracking.Button.menu:SetPoint("TOPLEFT", Minimap, "RIGHT", 4, 0)
		else
			MinimapCluster.Tracking.Button.menu:SetPoint("TOPRIGHT", Minimap, "LEFT", -4, 0)
		end
	end
end)

-- Set Square Map Mask
Minimap:SetMaskTexture(C.media.blank)
Minimap:SetArchBlobRingAlpha(0)
Minimap:SetQuestBlobRingAlpha(0)

-- For others mods with a minimap button, set minimap buttons position in square mode
function GetMinimapShape() return "SQUARE" end

----------------------------------------------------------------------------------------
--	Hide minimap in combat
----------------------------------------------------------------------------------------
if C.minimap.hide_combat == true then
	MinimapAnchor:RegisterEvent("PLAYER_REGEN_ENABLED")
	MinimapAnchor:RegisterEvent("PLAYER_REGEN_DISABLED")
	MinimapAnchor:HookScript("OnEvent", function(self, event)
		if event == "PLAYER_REGEN_ENABLED" then
			self:Show()
		elseif event == "PLAYER_REGEN_DISABLED" then
			if not T.FarmMode then
				self:Hide()
			end
		end
	end)
end

----------------------------------------------------------------------------------------
--	Tracking icon
----------------------------------------------------------------------------------------
local trackButton = MinimapCluster.Tracking.Button
trackButton:ClearAllPoints()
trackButton:SetPoint("BOTTOMLEFT", MinimapAnchor, "BOTTOMLEFT", 5, 6)
MinimapCluster.Tracking.Background:Hide()

if C.minimap.tracking_icon then
	trackButton:SetHighlightTexture(0)
	trackButton:SetSize(16, 16)

	MinimapCluster.Tracking:CreateBackdrop("ClassColor")
	MinimapCluster.Tracking.backdrop:SetPoint("TOPLEFT", trackButton, -2, 2)
	MinimapCluster.Tracking.backdrop:SetPoint("BOTTOMRIGHT", trackButton, 2, -2)
else
	trackButton:ClearAllPoints()
	trackButton:SetPoint("TOP", UIParent, "BOTTOM")
end

------------------------------------------------------------------------------------------	
-- COMPASS
------------------------------------------------------------------------------------------
if C.minimap.compass then
function compass()

		frameC = CreateFrame("Frame", "Compass", Minimap)
		frameC:SetAllPoints()
		local north = frameC:CreateFontString(frameC:GetName())
		north:SetPoint("TOP", Minimap, "TOP", 0, -2)
		north:SetFont("Interface\\Addons\\ViksUI\\Media\\Font\\HandelGothicBT.ttf",12,"OUTLINE")
		north:SetTextColor(1,1,0,1) 
		north:SetText("N")

		local east = frameC:CreateFontString(frameC:GetName())
		east:SetPoint("RIGHT", Minimap, "RIGHT", -2, 0)
		east:SetFont("Interface\\Addons\\ViksUI\\Media\\Font\\HandelGothicBT.ttf",10,"OUTLINE")
		east:SetTextColor(1,1,.251,1) 
		east:SetText("E")

		local south = frameC:CreateFontString(frameC:GetName())
		south:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 2)
		south:SetFont("Interface\\Addons\\ViksUI\\Media\\Font\\HandelGothicBT.ttf",10,"OUTLINE")
		south:SetTextColor(1,1,.251,1) 
		south:SetText("S")

		local west = frameC:CreateFontString(frameC:GetName())
		west:SetPoint("LEFT", Minimap, "LEFT", 4, 0)
		west:SetFont("Interface\\Addons\\ViksUI\\Media\\Font\\HandelGothicBT.ttf",10,"OUTLINE")
		west:SetTextColor(1,1,.251,1) 
		west:SetText("W")
end
compass()
end

--======================================================--
-----------------    [[ Difficulty ]]    -----------------
--======================================================--
CreateFS = function(parent, text, justify, anchor, x, y)
	local fs = parent:CreateFontString(nil, "OVERLAY")
	fs:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	fs:SetTextColor(unpack(C.media.pxcolor1))
	fs:SetText(text)
	fs:SetShadowOffset(0, 0)
	fs:SetWordWrap(false)
	fs:SetJustifyH(justify)
	if anchor and x and y then
		fs:SetPoint(anchor, x, y)
	else
		fs:SetPoint("CENTER", 0, 0)
	end
	
	return fs
end

local Diff = CreateFrame("Frame", "DungeonIcon", Minimap)
	Diff:SetSize(36, 36)
	Diff:SetFrameLevel(Minimap:GetFrameLevel()+2)
	Diff.Text = CreateFS(Diff, "", "CENTER")
	Diff:SetPoint("TOPLEFT", Minimap,  -5, 5)

local function styleDifficulty(self)
	local DiffText = self.Text

	local inInstance, instanceType = IsInInstance()
	local difficulty = select(3, GetInstanceInfo())
	local num = select(9, GetInstanceInfo())
	local mplus = select(1, C_ChallengeMode.GetActiveKeystoneInfo()) or ""
			
	if instanceType == "party" or instanceType == "raid" or instanceType == "scenario" then
		if difficulty == 1 then
		-- 1 = Normal Party
			DiffText:SetText("5N")
		elseif difficulty == 2 then
		-- 2 = Heroic Party
			DiffText:SetText("5H")
		elseif difficulty == 3 then
		-- 3 = 10 Player Raid Normal
			DiffText:SetText("10N")
		elseif difficulty == 4 then
		-- 4 = 25 Player Raid Normal
			DiffText:SetText("25N")
		elseif difficulty == 5 then
		-- 5 = 10 Player Raid Heroic
			DiffText:SetText("10H")
		elseif difficulty == 6 then
		-- 6 = 25 Player Raid Heroic
			DiffText:SetText("25H")
		elseif difficulty == 7 then
		-- 7 = Old LFR (before SOO)
			DiffText:SetText("LFR")
		elseif difficulty == 8 then
		-- 8 = Challenge Mode and Mythic+
			DiffText:SetText("M"..mplus)
		elseif difficulty == 9 then
		-- 9 = 40 Player Raid
			DiffText:SetText("40R")
		elseif difficulty == 11	or difficulty == 39 then
		-- 11 & 39 = Heroic Scenario
		DiffText:SetText("Sc H")
		elseif difficulty == 12 and difficulty == 38 then 
		-- 12 & 38 = Normal Scenario
			DiffText:SetText("Sc N")
		elseif difficulty == 40 then 
		-- 40 = Mythic Scenario
			DiffText:SetText("Sc M")	
		elseif difficulty == 14	then
		-- 14 = Flex normal raid
			DiffText:SetText(num .. "N")
		elseif difficulty == 15	then
		-- 15 = Flex heroic raid
			DiffText:SetText(num .. "H")
		elseif difficulty == 16	then
		-- 16 = Mythic raid since WOD
			DiffText:SetText("M")
		elseif difficulty == 17	then
		-- 17 = Looking For Raid
			DiffText:SetText("LFR")
		elseif difficulty == 18 or difficulty == 19 or difficulty == 20 or difficulty == 30 then
		-- 18: Event, 19: Event, 20: Event Scenario, 30: Event, 152: Visions of N'Zoth
			DiffText:SetText("E")
		elseif difficulty == 23	then
		-- 23 = Mythic Party
			DiffText:SetText("5M")
		elseif difficulty == 24 or difficulty == 33 then
		-- 24 = Timewalking Party, 33 = Timewalking raid, 151 Timewalking LFR
			DiffText:SetText("T")
		elseif difficulty == 25 or difficulty == 32 or difficulty == 34 or difficulty == 45 then
		-- 25 = World PvP Scenario, 32 = World PvP Scenario, 34 = PVP, 45 = PVP
			DiffText:SetText("PVP")
		elseif difficulty == 29 then
		-- 29 = PvEvP Scenario
			DiffText:SetText("PvEvP")
		elseif difficulty == 147 then
		-- 147 = Warfronts Normal
		DiffText:SetText("WF")
		elseif difficulty == 149 then
		-- 149 = Warfronts Heroic		
			DiffText:SetText("HWF")
		elseif difficulty == 167 then
		-- 167 = Torghast
			DiffText:SetText("TOR")
		end
	elseif instanceType == "pvp" or instanceType == "arena" then
		DiffText:SetText("PVP")
	else
		-- just notice you are in dungeon
		DiffText:SetText("D")
	end

	if not inInstance then
		Diff:SetAlpha(0)
	else
		Diff:SetAlpha(1)
	end
end

Diff:RegisterEvent("PLAYER_ENTERING_WORLD")
Diff:RegisterEvent("PLAYER_DIFFICULTY_CHANGED")
Diff:RegisterEvent("INSTANCE_GROUP_SIZE_CHANGED")
Diff:RegisterEvent("ZONE_CHANGED_NEW_AREA")
Diff:RegisterEvent("CHALLENGE_MODE_START")
Diff:RegisterEvent("CHALLENGE_MODE_COMPLETED")
Diff:RegisterEvent("CHALLENGE_MODE_RESET")
Diff:SetScript("OnEvent", styleDifficulty)
