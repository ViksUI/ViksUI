local T, C, L, _ = unpack(select(2, ...))
SetCVar("scriptErrors", 1)
----------------------------------------------------------------------------------------
--	Force readycheck warning
----------------------------------------------------------------------------------------
local ShowReadyCheckHook = function(self, initiator)
	if initiator ~= "player" then
		PlaySound(SOUNDKIT.READY_CHECK, "Master")
	end
end
hooksecurefunc("ShowReadyCheck", ShowReadyCheckHook)

----------------------------------------------------------------------------------------
--	Force other warning
----------------------------------------------------------------------------------------
local ForceWarning = CreateFrame("Frame")
ForceWarning:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
ForceWarning:RegisterEvent("PET_BATTLE_QUEUE_PROPOSE_MATCH")
ForceWarning:RegisterEvent("LFG_PROPOSAL_SHOW")
ForceWarning:RegisterEvent("RESURRECT_REQUEST")
ForceWarning:SetScript("OnEvent", function(self, event)
	if event == "UPDATE_BATTLEFIELD_STATUS" then
		for i = 1, GetMaxBattlefieldID() do
			local status = GetBattlefieldStatus(i)
			if status == "confirm" then
				PlaySound(SOUNDKIT.PVP_THROUGH_QUEUE, "Master")
				break
			end
			i = i + 1
		end
	elseif event == "PET_BATTLE_QUEUE_PROPOSE_MATCH" then
		PlaySound(SOUNDKIT.PVP_THROUGH_QUEUE, "Master")
	elseif event == "LFG_PROPOSAL_SHOW" then
		PlaySound(SOUNDKIT.READY_CHECK, "Master")
	elseif event == "RESURRECT_REQUEST" then
		PlaySoundFile("Sound\\Spells\\Resurrection.wav", "Master")
	end
end)

----------------------------------------------------------------------------------------
--	Misclicks for some popups
----------------------------------------------------------------------------------------
StaticPopupDialogs.RESURRECT.hideOnEscape = nil
StaticPopupDialogs.AREA_SPIRIT_HEAL.hideOnEscape = nil
StaticPopupDialogs.PARTY_INVITE.hideOnEscape = nil
StaticPopupDialogs.CONFIRM_SUMMON.hideOnEscape = nil
StaticPopupDialogs.ADDON_ACTION_FORBIDDEN.button1 = nil
StaticPopupDialogs.TOO_MANY_LUA_ERRORS.button1 = nil
PetBattleQueueReadyFrame.hideOnEscape = nil
PVPReadyDialog.leaveButton:Hide()
PVPReadyDialog.enterButton:ClearAllPoints()
PVPReadyDialog.enterButton:SetPoint("BOTTOM", PVPReadyDialog, "BOTTOM", 0, 25)

----------------------------------------------------------------------------------------
--	Spin camera while afk(by Telroth and Eclipse)
----------------------------------------------------------------------------------------
if C.misc.afk_spin_camera == true then
local PName = UnitName("player")
local PLevel = UnitLevel("player")
local PClass = UnitClass("player")
local PRace = UnitRace("player")
local PFaction = UnitFactionGroup("player")
local color = T.RGBToHex(unpack(C["media"].pxcolor1))
local Version = tonumber(GetAddOnMetadata("ViksUI", "Version"))

T.AFK_LIST = {
	"Mouseover minimap shows coords and locations.",
	"Small yellow square on minimap shows micromenu.",
	"Right click the minimap for trackingmenu.",
	"Farm Mode: Toggle with mapbutton (lower left on minimap, hidden) or with /fm or /farmmode",
	"By right-clicking on a quest or achievment at the objective tracker, you can retrieve the wowhead link.",
	"You can type /ui to move the frames from the Interface.",
	"You can type /uihelp to show some supported commands.",
	"You can find much information about something on screen with /fstack command",
	"Anim nr: 0 = idle, 1 = death, 3 = stop, 4 = fast walk, 5 = run, 8 = take a light hit, 9 = take a medium hit, 10 = take a heavy hit, 11-12 = turning, 13 = backing up",
	"Anim nr: 14 = stunned, 26 = attack stance, 43 = swimming, 60 = chat, 61 = eat, 62 = mine ore, 63 = combine tradeskill, 66 = bow, 67 = wave, 68 = cheer, 69 = dance",
	"Anim nr: 70 = laugh, 73 = rude, 74 = roar, 75 = kneel, 76 = kiss, 77 = cry, 78 = chicken, 80 = applaud, 81 = shout, 82 = flex, ,83 = flirt, 84 = point, 97 = sit",
	"Anim nr: 101 = get up, 113 = salute, 119 = crouching run, 120 = crouch, 124 = channel spell, 125 = channel spell, 126 = spin, 137 = stunned",
}

--[[Guild]]--
local function GuildText()
	if IsInGuild() then
		local guildName = GetGuildInfo("player")
		ViksUIAFKPanel.GuildText:SetText(color .. guildName .. "|r")
	else
		ViksUIAFKPanel.GuildText:SetText(" ")
	end
end

--[[AFK-Timer]]--
local function UpdateTimer()
	local time = GetTime() - startTime
	ViksUIAFKPanel.AFKTimer:SetText(format("%02d" .. color ..":|r%02d", floor(time/60), time % 60))
end

--[[Playermodel]]--
local function Model()
	ViksUIAFKPanel.modelHolder = CreateFrame("Frame", "AFKPlayerModelHolder", ViksUIAFKPanel)
	ViksUIAFKPanel.modelHolder:SetSize(150, 150)
	ViksUIAFKPanel.modelHolder:SetPoint("BOTTOMRIGHT", ViksUIAFKPanel, "TOPRIGHT", -150, 120)

	ViksUIAFKPanel.model = CreateFrame("PlayerModel", "AFKPlayerModel", ViksUIAFKPanel.modelHolder)
	ViksUIAFKPanel.model:SetPoint("CENTER", ViksUIAFKPanel.modelHolder, "CENTER")
	ViksUIAFKPanel.model:SetSize(GetScreenWidth() * 2, GetScreenHeight() * 2)
	ViksUIAFKPanel.model:SetCamDistanceScale(6)
	ViksUIAFKPanel.model:SetFacing(6)
	ViksUIAFKPanel.model:SetUnit("player")
	ViksUIAFKPanel.model:SetAnimation(C.misc.afk_spin_camera_anim)
	ViksUIAFKPanel.model:SetRotation(math.rad(-15))
end

--[[Spin function]]--
function SpinStart()
	spinning = true
	MoveViewRightStart(.1)
end

function SpinStop()
	if(not spinning) then return end
	spinning = nil
	MoveViewRightStop()
end

--[[Frames]]--
local ViksUIAFKPanel = CreateFrame("Frame", "ViksUIAFKPanel", nil)
ViksUIAFKPanel:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 100)
ViksUIAFKPanel:SetSize((T.ScreenWidth - 550), 80)
ViksUIAFKPanel:SetTemplate("Transparent")
ViksUIAFKPanel:SetFrameStrata("FULLSCREEN")
ViksUIAFKPanel:Hide()

local ViksUIAFKPanelIcon = CreateFrame("Frame", "ViksUIAFKPanelIcon", ViksUIAFKPanel)
ViksUIAFKPanelIcon:SetWidth(48)
ViksUIAFKPanelIcon:SetHeight(48)
ViksUIAFKPanelIcon:SetPoint("CENTER", ViksUIAFKPanel, "TOP", 0, 0)
ViksUIAFKPanelIcon:SetTemplate("Default")

ViksUIAFKPanelIcon.Texture = ViksUIAFKPanelIcon:CreateTexture(nil, "ARTWORK")
ViksUIAFKPanelIcon.Texture:SetPoint("TOPLEFT", 2, -2)
ViksUIAFKPanelIcon.Texture:SetPoint("BOTTOMRIGHT", -2, 2)
ViksUIAFKPanelIcon.Texture:SetTexture("Interface\\AddOns\\ViksUI\\Media\\textures\\viksicon.blp")

ViksUIAFKPanel.ViksUIText = ViksUIAFKPanel:CreateFontString(nil, "OVERLAY")
ViksUIAFKPanel.ViksUIText:SetPoint("CENTER", ViksUIAFKPanel, "CENTER", 0, -10)
ViksUIAFKPanel.ViksUIText:SetFont(C["media"].pxfontHeader, 40, "OUTLINE")
ViksUIAFKPanel.ViksUIText:SetText("|cffc41f3bViksUI " .. Version)

ViksUIAFKPanel.DateText = ViksUIAFKPanel:CreateFontString(nil, "OVERLAY")
ViksUIAFKPanel.DateText:SetPoint("BOTTOMLEFT", ViksUIAFKPanel, "BOTTOMRIGHT", -100, 54)
ViksUIAFKPanel.DateText:SetFont(C["media"].normal_font, 15, "OUTLINE")

ViksUIAFKPanel.ClockText = ViksUIAFKPanel:CreateFontString(nil, "OVERLAY")
ViksUIAFKPanel.ClockText:SetPoint("BOTTOMLEFT", ViksUIAFKPanel, "BOTTOMRIGHT", -100, 30)
ViksUIAFKPanel.ClockText:SetFont(C["media"].normal_font, 20, "OUTLINE")

ViksUIAFKPanel.AFKTimer = ViksUIAFKPanel:CreateFontString(nil, "OVERLAY")
ViksUIAFKPanel.AFKTimer:SetPoint("BOTTOMLEFT", ViksUIAFKPanel, "BOTTOMRIGHT", -100, 6)
ViksUIAFKPanel.AFKTimer:SetFont(C["media"].normal_font, 20, "OUTLINE")

ViksUIAFKPanel.PlayerNameText = ViksUIAFKPanel:CreateFontString(nil, "OVERLAY")
ViksUIAFKPanel.PlayerNameText:SetPoint("LEFT", ViksUIAFKPanel, "LEFT", 25, 15)
ViksUIAFKPanel.PlayerNameText:SetFont(C["media"].normal_font, 28, "OUTLINE")
ViksUIAFKPanel.PlayerNameText:SetText(color .. PName .. "|r")

ViksUIAFKPanel.GuildText = ViksUIAFKPanel:CreateFontString(nil, "OVERLAY")
ViksUIAFKPanel.GuildText:SetPoint("LEFT", ViksUIAFKPanel, "LEFT", 25, -3)
ViksUIAFKPanel.GuildText:SetFont(C["media"].normal_font, 15, "OUTLINE")

ViksUIAFKPanel.PlayerInfoText = ViksUIAFKPanel:CreateFontString(nil, "OVERLAY")
ViksUIAFKPanel.PlayerInfoText:SetPoint("LEFT", ViksUIAFKPanel, "LEFT", 25, -20)
ViksUIAFKPanel.PlayerInfoText:SetFont(C["media"].normal_font, 15, "OUTLINE")
ViksUIAFKPanel.PlayerInfoText:SetText(LEVEL .. " " .. PLevel .. " " .. PFaction .. " " .. color .. PClass .. "|r")

--[[Dynamic time & date]]--
local interval = 0
ViksUIAFKPanel:SetScript("OnUpdate", function(self, elapsed)
	interval = interval - elapsed
	if interval <= 0 then
		ViksUIAFKPanel.ClockText:SetText(format("%s", date("%H" .. color .. ":|r%M" .. color .. ":|r%S")))
		ViksUIAFKPanel.DateText:SetText(format("%s", date(color .. "%a|r %b" .. color .. "/|r%d")))
		UpdateTimer()
		interval = 0.5
	end
end)

--[[Register events, script to start]]--
ViksUIAFKPanel:RegisterEvent("PLAYER_FLAGS_CHANGED")
ViksUIAFKPanel:RegisterEvent("PLAYER_REGEN_DISABLED")
ViksUIAFKPanel:RegisterEvent("PLAYER_DEAD")
ViksUIAFKPanel:RegisterEvent("MODIFIER_STATE_CHANGED")
ViksUIAFKPanel:SetScript("OnEvent", function(self, event, unit)
	if InCombatLockdown() then return end

	if event == "PLAYER_FLAGS_CHANGED" then
		startTime = GetTime()
		if unit == "player" then
			if UnitIsAFK(unit) and not UnitIsDead(unit) then
				SpinStart()
				ViksUIAFKPanel:Show()
				GuildText()
				if not AFKPlayerModel then Model() end
				Minimap:Hide()
			else
				SpinStop()
				ViksUIAFKPanel:Hide()
				Minimap:Show()
			end
		end
	elseif event == "PLAYER_DEAD" then
		if UnitIsAFK("player") then
			SpinStop()
			ViksUIAFKPanel:Hide()
			Minimap:Show()
		end
	elseif event == "PLAYER_REGEN_DISABLED" then
		if UnitIsAFK("player") then
			SpinStop()
			ViksUIAFKPanel:Hide()
			Minimap:Show()
		end
	elseif event == "MODIFIER_STATE_CHANGED" then
		if UnitIsAFK("player") then
			SpinStop()
			ViksUIAFKPanel:Hide()
			Minimap:Show()
		end
	end
end)

local texts = T.AFK_LIST
local interval = #texts

local ViksUIAFKScrollFrame = CreateFrame("ScrollingMessageFrame", "ViksUIAFKScrollFrame", ViksUIAFKPanel)
ViksUIAFKScrollFrame:SetSize(ViksUIAFKPanel:GetWidth(), ViksUIAFKPanel:GetHeight())
ViksUIAFKScrollFrame:SetPoint("CENTER", ViksUIAFKPanel, "CENTER", 0, -20)
ViksUIAFKScrollFrame:SetFont(C["media"].normal_font, 20, "OUTLINE")
ViksUIAFKScrollFrame:SetShadowColor(0, 0, 0, 0)
ViksUIAFKScrollFrame:SetFading(false)
ViksUIAFKScrollFrame:SetFadeDuration(0)
ViksUIAFKScrollFrame:SetTimeVisible(1)
ViksUIAFKScrollFrame:SetMaxLines(1)
ViksUIAFKScrollFrame:SetSpacing(2)
ViksUIAFKScrollFrame:SetScript("OnUpdate", function(self, time)
	interval = interval - (time / 30)
	for index, name in pairs(T.AFK_LIST) do
		if interval < index then
			ViksUIAFKScrollFrame:AddMessage(T.AFK_LIST[index], 1, 1, 1)
			tremove(texts, index)
		end
	end

	if interval < 0 then self:SetScript("OnUpdate", nil) end
end)

--[[Fade in & out]]--
ViksUIAFKPanel:SetScript("OnShow", function(self) UIFrameFadeIn(UIParent, .5, 1, 0) end)
ViksUIAFKPanel:SetScript("OnHide", function(self) UIFrameFadeOut(UIParent, .5, 0, 1) end)
end
----------------------------------------------------------------------------------------
--	Custom Lag Tolerance(by Elv22)
----------------------------------------------------------------------------------------
if C.general.custom_lagtolerance == true then
	local customlag = CreateFrame("Frame")
	local int = 5
	local _, _, _, lag = GetNetStats()
	local LatencyUpdate = function(self, elapsed)
		int = int - elapsed
		if int < 0 then
			if lag ~= 0 and lag <= 400 then
				SetCVar("SpellQueueWindow", tostring(lag))
			end
			int = 5
		end
	end
	customlag:SetScript("OnUpdate", LatencyUpdate)
	LatencyUpdate(customlag, 10)
end

----------------------------------------------------------------------------------------
--	Auto select current event boss from LFD tool(EventBossAutoSelect by Nathanyel)
----------------------------------------------------------------------------------------
local firstLFD
LFDParentFrame:HookScript("OnShow", function()
	if not firstLFD then
		firstLFD = 1
		for i = 1, GetNumRandomDungeons() do
			local id = GetLFGRandomDungeonInfo(i)
			local isHoliday = select(15, GetLFGDungeonInfo(id))
			if isHoliday and not GetLFGDungeonRewards(id) then
				LFDQueueFrame_SetType(id)
			end
		end
	end
end)

----------------------------------------------------------------------------------------
--	Remove Boss Emote spam during BG(ArathiBasin SpamFix by Partha)
----------------------------------------------------------------------------------------
if C.misc.hide_bg_spam == true then
	local Fixer = CreateFrame("Frame")
	local RaidBossEmoteFrame, spamDisabled = RaidBossEmoteFrame

	local function DisableSpam()
		if GetZoneText() == L_ZONE_ARATHIBASIN or GetZoneText() == L_ZONE_GILNEAS then
			RaidBossEmoteFrame:UnregisterEvent("RAID_BOSS_EMOTE")
			spamDisabled = true
		elseif spamDisabled then
			RaidBossEmoteFrame:RegisterEvent("RAID_BOSS_EMOTE")
			spamDisabled = false
		end
	end

	Fixer:RegisterEvent("PLAYER_ENTERING_WORLD")
	Fixer:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	Fixer:SetScript("OnEvent", DisableSpam)
end

----------------------------------------------------------------------------------------
--	Undress button in auction dress-up frame(by Nefarion)
----------------------------------------------------------------------------------------
local strip = CreateFrame("Button", "DressUpFrameUndressButton", DressUpFrame, "UIPanelButtonTemplate")
strip:SetText(L_MISC_UNDRESS)
strip:SetHeight(22)
strip:SetWidth(strip:GetTextWidth() + 40)
strip:SetPoint("RIGHT", DressUpFrameResetButton, "LEFT", -2, 0)
strip:RegisterForClicks("AnyUp")
strip:SetScript("OnClick", function(self, button)
	if button == "RightButton" then
		self.model:UndressSlot(19)
	else
		self.model:Undress()
	end
	PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
end)
strip.model = DressUpModel

strip:RegisterEvent("AUCTION_HOUSE_SHOW")
strip:RegisterEvent("AUCTION_HOUSE_CLOSED")
strip:SetScript("OnEvent", function(self)
	if AuctionFrame:IsVisible() and self.model ~= SideDressUpModel then
		self:SetParent(SideDressUpModel)
		self:ClearAllPoints()
		self:SetPoint("TOP", SideDressUpModelResetButton, "BOTTOM", 0, -3)
		self.model = SideDressUpModel
	elseif self.model ~= DressUpModel then
		self:SetParent(DressUpModel)
		self:ClearAllPoints()
		self:SetPoint("RIGHT", DressUpFrameResetButton, "LEFT", -2, 0)
		self.model = DressUpModel
	end
end)

----------------------------------------------------------------------------------------
--	GuildTab in FriendsFrame
----------------------------------------------------------------------------------------
local n = FriendsFrame.numTabs + 1
local gtframe = CreateFrame("Button", "FriendsFrameTab"..n, FriendsFrame, "FriendsFrameTabTemplate")
gtframe:SetText(GUILD)
gtframe:SetPoint("LEFT", _G["FriendsFrameTab"..n - 1], "RIGHT", -15, 0)
PanelTemplates_DeselectTab(gtframe)
gtframe:SetScript("OnClick", function() ToggleGuildFrame() end)

----------------------------------------------------------------------------------------
--	Force quit
----------------------------------------------------------------------------------------
local CloseWoW = CreateFrame("Frame")
CloseWoW:RegisterEvent("CHAT_MSG_SYSTEM")
CloseWoW:SetScript("OnEvent", function(self, event, msg)
	if event == "CHAT_MSG_SYSTEM" then
		if msg and msg == IDLE_MESSAGE then
			ForceQuit()
		end
	end
end)

----------------------------------------------------------------------------------------
--	Old achievements filter
----------------------------------------------------------------------------------------
--[[
function AchievementFrame_GetCategoryNumAchievements_OldIncomplete(categoryID)
	local numAchievements, numCompleted = GetCategoryNumAchievements(categoryID)
	return numAchievements - numCompleted, 0, numCompleted
end

function old_nocomplete_filter_init()
	AchievementFrameFilters = {
		{text = ACHIEVEMENTFRAME_FILTER_ALL, func = AchievementFrame_GetCategoryNumAchievements_All},
		{text = ACHIEVEMENTFRAME_FILTER_COMPLETED, func = AchievementFrame_GetCategoryNumAchievements_Complete},
		{text = ACHIEVEMENTFRAME_FILTER_INCOMPLETE, func = AchievementFrame_GetCategoryNumAchievements_Incomplete},
		{text = ACHIEVEMENTFRAME_FILTER_INCOMPLETE.." ("..ALL.." )", func = AchievementFrame_GetCategoryNumAchievements_OldIncomplete}
	}
end

local filter = CreateFrame("Frame")
filter:RegisterEvent("ADDON_LOADED")
filter:SetScript("OnEvent", function(self, event, addon, ...)
	if addon == "Blizzard_AchievementUI" then
		if AchievementFrame then
			old_nocomplete_filter_init()
			if C.skins.blizzard_frames == true then
				AchievementFrameFilterDropDown:SetWidth(AchievementFrameFilterDropDown:GetWidth() + 20)
			end
			filter:UnregisterEvent("ADDON_LOADED")
		end
	end
end)
]]
----------------------------------------------------------------------------------------
--	Boss Banner Hider
----------------------------------------------------------------------------------------
if C.misc.hide_banner == true then
	BossBanner.PlayBanner = function() end
end

----------------------------------------------------------------------------------------
--	Hide TalkingHeadFrame
----------------------------------------------------------------------------------------
if C.misc.hide_talking_head == true then
	local frame = CreateFrame("Frame")
	frame:RegisterEvent("ADDON_LOADED")
	frame:SetScript("OnEvent", function(self, event, addon)
		if addon == "Blizzard_TalkingHeadUI" then
			hooksecurefunc("TalkingHeadFrame_PlayCurrent", function()
				TalkingHeadFrame:Hide()
			end)
			self:UnregisterEvent(event)
		end
	end)
end

----------------------------------------------------------------------------------------
-- confirm item destruction with delete key
----------------------------------------------------------------------------------------

local addText = "\n\n|cff808080Note:|r You may also press the |cffffd200Delete|r key as confirmation."
local itemDialogs = {
  "DELETE_ITEM",
  "DELETE_GOOD_ITEM",
  "DELETE_QUEST_ITEM",
  "DELETE_GOOD_QUEST_ITEM",
}
 
for k, v in pairs(itemDialogs) do
  StaticPopupDialogs[v].text = _G[v] .. addText
end
 
local f = CreateFrame("Frame", nil, UIParent)
f:RegisterEvent("DELETE_ITEM_CONFIRM")
f:SetScript("OnEvent", function(self, event)
  for i = 1, STATICPOPUP_NUMDIALOGS do
    local dialog = _G["StaticPopup" .. i]
    local editBox = _G["StaticPopup" .. i .. "EditBox"]
    local isItemDialog = false
    for k, v in pairs(itemDialogs) do
      if dialog.which == v then
        isItemDialog = true
      end
    end
    if isItemDialog then
      if editBox then
        editBox:ClearFocus()
      end
      dialog:SetScript("OnKeyDown", function(self, key)
        if key == "DELETE" then
          DeleteCursorItem()
        end
      end)
      dialog:HookScript("OnHide", function(self)
        self:SetScript("OnKeyDown", nil)
      end)
    end
  end
end)
hooksecurefunc(StaticPopupDialogs["DELETE_GOOD_ITEM"],"OnShow",function(s) s.editBox:SetText(DELETE_ITEM_CONFIRM_STRING) end)

----------------------------------------------------------------------------------------
--	Change UIErrorsFrame strata
----------------------------------------------------------------------------------------
UIErrorsFrame:SetFrameLevel(0)

------------------------------------------------------------------------------------------
-- Remove Class Hall Resource Bar
------------------------------------------------------------------------------------------

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_OrderHallUI" and C["misc"]["OrderHallBar"] == false then
		OrderHallCommandBar:UnregisterAllEvents()
		OrderHallCommandBar:HookScript("OnShow", OrderHallCommandBar.Hide)
		OrderHallCommandBar:Kill()
		OrderHall_CheckCommandBar = function () end
		self:UnregisterEvent(event)
	end
end)
f:RegisterEvent("ADDON_LOADED")