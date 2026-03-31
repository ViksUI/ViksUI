local T, C, L = unpack(ViksUI)
if C.general.move_blizzard ~= true then return end

----------------------------------------------------------------------------------------
--	Move some Blizzard frames
-- 	Left Mousebuton Drag will save position, Right mouse button clears values/ need relog to let Edit Mode place it.
----------------------------------------------------------------------------------------

-- Initialize saved variables for frame positions (per-character)
ViksUIPositionsPerChar = ViksUIPositionsPerChar or {}

local function SaveFramePosition(frameName, frame)
	if not frame then return end
	
	local point, relativeFrame, relativePoint, x, y = frame:GetPoint()
	
	ViksUIPositionsPerChar[frameName] = {
		point = point,
		relativeFrame = relativeFrame and relativeFrame:GetName() or "UIParent",
		relativePoint = relativePoint,
		x = x,
		y = y,
	}
end

local function RestoreFramePosition(frameName, frame)
	if not frame then return end
	
	local pos = ViksUIPositionsPerChar[frameName]
	if pos then
		frame:ClearAllPoints()
		local relativeFrame = _G[pos.relativeFrame] or UIParent
		frame:SetPoint(pos.point, relativeFrame, pos.relativePoint, pos.x, pos.y)
	end
end

local function ResetFramePosition(frameName, frame)
	if not frame then return end
	
	-- Clear the saved position
	ViksUIPositionsPerChar[frameName] = nil
	
	-- Reset to default position (center of screen)
	frame:ClearAllPoints()
	frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	
	-- print("|cff00ff00ViksUI:|r Position reset for " .. frameName) -- For debuging
end

local function SetupMovableFrame(frame, frameName)
	if not frame then return end
	
	-- Restore previous position if it exists
	RestoreFramePosition(frameName, frame)
	
	-- Setup movement
	frame:EnableMouse(true)
	frame:SetMovable(true)
	frame:SetClampedToScreen(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
	frame:SetScript("OnDragStop", function(self) 
		self:StopMovingOrSizing()
		SaveFramePosition(frameName, self)
	end)
	
	-- Right-click to reset position
	frame:SetScript("OnMouseUp", function(self, button)
		if button == "RightButton" then
			ResetFramePosition(frameName, self)
		end
	end)
end

local frames = {
	"CharacterFrame", "ChannelFrame", "TaxiFrame", "QuestFrame", "PVEFrame", "AddonList",
	"QuestLogPopupDetailFrame", "MerchantFrame", "TradeFrame", "MailFrame", "LootFrame",
	"FriendsFrame", "CinematicFrame", "TabardFrame", "PetStableFrame", "BankFrame",
	"PetitionFrame", "HelpFrame", "GossipFrame", "DressUpFrame", "GuildRegistrarFrame",
	"ChatConfigFrame", "RaidBrowserFrame", "InterfaceOptionsFrame", "WorldMapFrame",
	"GameMenuFrame", "VideoOptionsFrame", "GuildInviteFrame", "ItemTextFrame",
	"OpenMailFrame", "StackSplitFrame", "TutorialFrame", "StaticPopup1", "SettingsPanel",
	"StaticPopup2", "ScrollOfResurrectionSelectionFrame", "CommunitiesFrame", "ViksUIOptionsPanel", "CooldownViewerSettings", "EssentialCooldownViewer",
	"UtilityCooldownViewer", "BuffBarCooldownViewer", "BuffIconCooldownViewer", "DamageMeter"
}

for _, v in pairs(frames) do
	SetupMovableFrame(_G[v], v)
end

local AddOnFrames = {
	["Blizzard_AchievementUI"] = {"AchievementFrame"},
	["Blizzard_ArchaeologyUI"] = {"ArchaeologyFrame"},
	["Blizzard_ArtifactUI"] = {"ArtifactRelicForgeFrame"},
	["Blizzard_AuctionHouseUI"] = {"AuctionHouseFrame"},
	["Blizzard_BarberShopUI"] = {"BarberShopFrame"},
	["Blizzard_BindingUI"] = {"KeyBindingFrame"},
	["Blizzard_BlackMarketUI"] = {"BlackMarketFrame"},
	["Blizzard_Calendar"] = {"CalendarCreateEventFrame", "CalendarFrame", "CalendarViewEventFrame", "CalendarViewHolidayFrame"},
	["Blizzard_ChallengesUI"] = {"ChallengesLeaderboardFrame"},
	["Blizzard_Collections"] = {"CollectionsJournal", "WardrobeFrame"},
	["Blizzard_EncounterJournal"] = {"EncounterJournal"},
	["Blizzard_GMChatUI"] = {"GMChatStatusFrame"},
	["Blizzard_GMSurveyUI"] = {"GMSurveyFrame"},
	["Blizzard_GarrisonUI"] = {"GarrisonLandingPage", "GarrisonMissionFrame", "GarrisonCapacitiveDisplayFrame", "GarrisonBuildingFrame", "GarrisonRecruiterFrame", "GarrisonRecruitSelectFrame", "GarrisonShipyardFrame"},
	["Blizzard_GuildBankUI"] = {"GuildBankFrame"},
	["Blizzard_GuildControlUI"] = {"GuildControlUI"},
	["Blizzard_InspectUI"] = {"InspectFrame"},
	["Blizzard_ItemAlterationUI"] = {"TransmogrifyFrame"},
	["Blizzard_ItemSocketingUI"] = {"ItemSocketingFrame"},
	["Blizzard_ItemUpgradeUI"] = {"ItemUpgradeFrame"},
	["Blizzard_LookingForGuildUI"] = {"LookingForGuildFrame"},
	["Blizzard_MacroUI"] = {"MacroFrame"},
	["Blizzard_OrderHallUI"] = {"OrderHallMissionFrame"},
	["Blizzard_PlayerSpells"] = {"PlayerSpellsFrame"},
	["Blizzard_Professions"] = {"ProfessionsFrame"},
	["Blizzard_ProfessionsBook"] = {"ProfessionsBookFrame"},
	["Blizzard_QuestChoice"] = {"QuestChoiceFrame"},
	["Blizzard_ReforgingUI"] = {"ReforgingFrame"},
	["Blizzard_TalkingHeadUI"] = {"TalkingHeadFrame"},
	["Blizzard_TrainerUI"] = {"ClassTrainerFrame"},
}

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, _, addon)
	-- Fix move
	if addon == "Blizzard_Collections" then
		--BETA local checkbox = _G.WardrobeTransmogFrame.ToggleSecondaryAppearanceCheckbox
		-- checkbox.Label:ClearAllPoints()
		-- checkbox.Label:SetPoint("LEFT", checkbox, "RIGHT", 2, 1)
		-- checkbox.Label:SetPoint("RIGHT", checkbox, "RIGHT", 160, 1)
	elseif addon == "Blizzard_EncounterJournal" then
		local replacement = function(rewardFrame)
			if rewardFrame.data then
				_G.EncounterJournalTooltip:ClearAllPoints()
			end
			AdventureJournal_Reward_OnEnter(rewardFrame)
		end
		_G.EncounterJournal.suggestFrame.Suggestion1.reward:HookScript("OnEnter", replacement)
		_G.EncounterJournal.suggestFrame.Suggestion2.reward:HookScript("OnEnter", replacement)
		_G.EncounterJournal.suggestFrame.Suggestion3.reward:HookScript("OnEnter", replacement)
	elseif addon == "Blizzard_Communities" then
		local dialog = _G.CommunitiesFrame.NotificationSettingsDialog
		if dialog then
			dialog:ClearAllPoints()
			dialog:SetAllPoints()
		end
	end
	
	if AddOnFrames[addon] then
		for _, v in pairs(AddOnFrames[addon]) do
			if _G[v] then
				if (v == "PlayerSpellsFrame" or v == "ProfessionsBookFrame") and not InCombatLockdown() then
					SetupMovableFrame(_G[v], v)
				elseif (v ~= "PlayerSpellsFrame" and v ~= "ProfessionsBookFrame") then
					SetupMovableFrame(_G[v], v)
				end
			end
		end
	end
end)

-- Delay restoration to happen AFTER Edit Mode loads and applies its own positions
-- This gives Edit Mode time to initialize, then our custom positions override it
local delayFrame = CreateFrame("Frame")
delayFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
delayFrame:SetScript("OnEvent", function(self, event)
	-- Wait 2 seconds to ensure Edit Mode is fully initialized
	C_Timer.After(2, function()
		-- Re-apply all saved positions after Edit Mode finishes
		for frameName, _ in pairs(ViksUIPositionsPerChar) do
			local frame = _G[frameName]
			if frame then
				RestoreFramePosition(frameName, frame)
			end
		end
	end)
	self:UnregisterEvent(event)
end)