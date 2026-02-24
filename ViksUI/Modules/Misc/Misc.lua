local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	Force readycheck warning
----------------------------------------------------------------------------------------
local ShowReadyCheckHook = function(_, initiator)
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
ForceWarning:SetScript("OnEvent", function(_, event)
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
		PlaySound(37, "Master")
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

-- Keys
local ignoreKeys = {
	LALT = true,
	LSHIFT = true,
	RSHIFT = true
}

local printKeys = {
	["PRINTSCREEN"] = true
}

if IsMacClient() then
	printKeys[_G["KEY_PRINTSCREEN_MAC"]] = true
end

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

-- On Key down
local function OnKeyDown(_, key)
	if (ignoreKeys[key]) then
		return
	end
	if printKeys[key] then
		Screenshot()
	else
		SpinStop()
		ViksUIAFKPanel:Hide()
		Minimap:Show()
	end
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
ViksUIAFKPanel:SetSize((T.screenWidth - 550), 80)
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
ViksUIAFKPanelIcon.Texture:SetTexture("Interface\\AddOns\\ViksUI\\Media\\Textures\\viksicon.blp")

ViksUIAFKPanel.ViksUIText = ViksUIAFKPanel:CreateFontString(nil, "OVERLAY")
ViksUIAFKPanel.ViksUIText:SetPoint("CENTER", ViksUIAFKPanel, "CENTER", 0, -10)
ViksUIAFKPanel.ViksUIText:SetFont(C["media"].pxfontHeader, 40, "OUTLINE")
ViksUIAFKPanel.ViksUIText:SetText("|cffc41f3bViksUI " .. T.version)

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
		if T.CheckUnitStatus(UnitIsAFK, "player") and not UnitIsDead(unit) then
			SpinStart()
			ViksUIAFKPanel:Show()
			GuildText()
			if not AFKPlayerModel then Model() end
			Minimap:Hide()
			ObjectiveTrackerFrame:Hide()				
		else
			SpinStop()
			ViksUIAFKPanel:Hide()
			Minimap:Show()
			ObjectiveTrackerFrame:Show()				
		end
	elseif event == "PLAYER_DEAD" then
		if T.CheckUnitStatus(UnitIsAFK, "player") and not InCombatLockdown() then
			SpinStop()
			ViksUIAFKPanel:Hide()
			Minimap:Show()
			ObjectiveTrackerFrame:Show()				   
		end
	elseif event == "PLAYER_REGEN_DISABLED" then
		if T.CheckUnitStatus(UnitIsAFK, "player") and not InCombatLockdown() then
			SpinStop()
			ViksUIAFKPanel:Hide()
			Minimap:Show()
			ObjectiveTrackerFrame:Show()
		end
	elseif event == "MODIFIER_STATE_CHANGED" then
		if T.CheckUnitStatus(UnitIsAFK, "player") and not InCombatLockdown() then
			SpinStop()
			ViksUIAFKPanel:Hide()
			Minimap:Show()
			ObjectiveTrackerFrame:Show()
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
--	Auto select current event boss from LFD tool(EventBossAutoSelect by Nathanyel)
----------------------------------------------------------------------------------------
local firstLFD
LFDParentFrame:HookScript("OnShow", function()
	if not firstLFD then
		firstLFD = true

		for i = 1, GetNumRandomDungeons() do
			local id = GetLFGRandomDungeonInfo(i)
			local isHoliday, _, _, isTimeWalker = select(15, GetLFGDungeonInfo(id))
			if isHoliday and not isTimeWalker and not GetLFGDungeonRewards(id) then
				LFDQueueFrame_SetTypeInternal(id) -- Previous function cause taint SetEntryTitle()
				break
			end
		end
	end
end)

----------------------------------------------------------------------------------------
--	Undress button in dress-up frame(by Nefarion)
----------------------------------------------------------------------------------------
local strip = CreateFrame("Button", "DressUpFrameUndressButton", DressUpFrame, "UIPanelButtonTemplate")
strip:SetText(L_MISC_UNDRESS)
strip:SetWidth(strip:GetTextWidth() + 40)
strip:SetPoint("RIGHT", DressUpFrameResetButton, "LEFT", -2, 0)
strip:RegisterForClicks("AnyUp")
strip:SetScript("OnClick", function(_, button)
	local actor = DressUpFrame.ModelScene:GetPlayerActor()
	if not actor then return end
	if button == "RightButton" then
		actor:UndressSlot(19)
	else
		actor:Undress()
	end
	PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
end)

----------------------------------------------------------------------------------------
--	Boss Banner Hider
----------------------------------------------------------------------------------------
if C.general.hide_banner == true then
	BossBanner.PlayBanner = function() end
	BossBanner:UnregisterAllEvents()
end

----------------------------------------------------------------------------------------
--	Hide button for oUF_RaidDPS
----------------------------------------------------------------------------------------
if C.misc.hide_raid_button == true then
	local show = false
	SlashCmdList.HideRaidMODE = function()
		if show == false then
			if oUF_RaidDPS1 then
				for i = 1, C.raidframe.raid_groups do
					_G["oUF_RaidDPS"..i]:SetAlpha(0)
				end
				oUF_MainTank:SetAlpha(0)
			end
			show = true
		else
			if oUF_RaidDPS1 then
				for i = 1, C.raidframe.raid_groups do
					_G["oUF_RaidDPS"..i]:SetAlpha(1)
				end
				oUF_MainTank:SetAlpha(1)
			end
			show = false
		end

	end
	SLASH_HIDERAIDMODE1 = "/hideraid"

	local HideRaid = CreateFrame("Button", "HideRaidMode", UIParent)
	HideRaid:SetTemplate("ClassColor")
	HideRaid:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0)
	HideRaid:SetSize(19, 19)
	HideRaid:SetAlpha(0)
	HideRaid:Hide()

	HideRaid.t = HideRaid:CreateTexture(nil, "OVERLAY")
	HideRaid.t:SetTexture("Interface\\Icons\\inv_misc_spyglass_03")
	HideRaid.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	HideRaid.t:SetPoint("TOPLEFT", HideRaid, 2, -2)
	HideRaid.t:SetPoint("BOTTOMRIGHT", HideRaid, -2, 2)

	HideRaid:SetScript("OnClick", function()
		if oUF_RaidDPS1 and oUF_RaidDPS1:IsShown() then
			SlashCmdList.HideRaidMODE()
		end
	end)

	HideRaid:SetScript("OnEnter", function()
		if oUF_RaidDPS1 and oUF_RaidDPS1:IsShown() then
			HideRaid:FadeIn()
		end
	end)

	HideRaid:SetScript("OnLeave", function()
		HideRaid:FadeOut()
	end)

	HideRaid:RegisterEvent("PLAYER_LOGIN")
	HideRaid:SetScript("OnEvent", function(self)
		if C.unitframe.enable == true and ViksUISettings and ViksUISettings.RaidLayout == "DPS" then
			self:Show()
		end
	end)
end

----------------------------------------------------------------------------------------
--	Easy delete good items
----------------------------------------------------------------------------------------
local deleteDialog = StaticPopupDialogs["DELETE_GOOD_ITEM"]
if deleteDialog.OnShow then
	hooksecurefunc(deleteDialog, "OnShow", function(s) s:GetEditBox():SetText(DELETE_ITEM_CONFIRM_STRING) s:GetEditBox():SetAutoFocus(false) s:GetEditBox():ClearFocus() end)
end

----------------------------------------------------------------------------------------
--	Change UIErrorsFrame strata
----------------------------------------------------------------------------------------
UIErrorsFrame:SetFrameLevel(0)

----------------------------------------------------------------------------------------
--	Increase speed for AddonList scroll
----------------------------------------------------------------------------------------
AddonList.ScrollBox.wheelPanScalar = 6
AddonList.ScrollBar.wheelPanScalar = 6

if C.misc.LFD_keyword == "none" then
else
LFGListApplicationDialog:HookScript("OnShow", function(self) LFGListApplicationDialogDescription.EditBox.Instructions:SetText(C.misc.LFD_keyword) end)
end

local function OnDoubleClick(self, button)
  	if IsInGroup() then
    else
    LFGListFrame.SearchPanel_SignUpButton(self:GetParent():GetParent():GetParent())
    LFGListApplicationDialog.SignUpButton:Click()
    end
end