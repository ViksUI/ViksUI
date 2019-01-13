local T, C, L, _ = unpack(select(2, ...))
if not C.datatext.Bfamissions or C.datatext.Bfamissions == 0 or T.level <= 110 then return end

-- Variables
local format = string.format
local tsort = table.sort
local ipairs = ipairs
local C_Garrison_GetFollowerShipments = C_Garrison.GetFollowerShipments
local C_Garrison_GetInProgressMissions = C_Garrison.GetInProgressMissions
local C_Garrison_RequestLandingPageShipmentInfo = C_Garrison.RequestLandingPageShipmentInfo
local C_Garrison_GetLandingPageShipmentInfoByContainerID = C_Garrison.GetLandingPageShipmentInfoByContainerID
local C_Garrison_GetTalentTreeIDsByClassID = C_Garrison.GetTalentTreeIDsByClassID
local C_Garrison_GetTalentTreeInfoForID = C_Garrison.GetTalentTreeInfoForID
local C_Garrison_GetCompleteTalent = C_Garrison.GetCompleteTalent
local C_Garrison_HasGarrison = C_Garrison.HasGarrison
local C_IslandsQueue_GetIslandsWeeklyQuestID = C_IslandsQueue.GetIslandsWeeklyQuestID
local ShowGarrisonLandingPage = ShowGarrisonLandingPage
local HideUIPanel = HideUIPanel
local GetCurrencyInfo = GetCurrencyInfo
local GetMouseFocus = GetMouseFocus
local COMPLETE = COMPLETE
local RESEARCH_TIME_LABEL = RESEARCH_TIME_LABEL
local GARRISON_LANDING_SHIPMENT_COUNT = GARRISON_LANDING_SHIPMENT_COUNT
local FOLLOWERLIST_LABEL_TROOPS = FOLLOWERLIST_LABEL_TROOPS
local LE_FOLLOWER_TYPE_GARRISON_8_0 = LE_FOLLOWER_TYPE_GARRISON_8_0
local LE_GARRISON_TYPE_8_0 = LE_GARRISON_TYPE_8_0

local Stat = CreateFrame("Frame", "DataTextBfamissions", UIParent)
Stat:RegisterEvent('PLAYER_ENTERING_WORLD')
Stat:RegisterEvent('CURRENCY_DISPLAY_UPDATE')
Stat:RegisterEvent('GARRISON_LANDINGPAGE_SHIPMENTS')
Stat:EnableMouse(true)
Stat:SetFrameStrata('BACKGROUND')
Stat:SetFrameLevel(3)
Stat.Option = C.datatext.Bfamissions
Stat.Color1 = T.RGBToHex(.4, .4, .4)
Stat.Color2 = T.RGBToHex(1, 1, 1 )

local Text  = Stat:CreateFontString(nil, "OVERLAY")
if C.datatext.Bfamissions>= 8 then
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
PP(C.datatext.Bfamissions, Text)
Stat:SetAllPoints(Text)

local function sortFunction(a, b) return a.missionEndTime < b.missionEndTime end

local function Currency(id, weekly, capped)
	local name, amount, tex, week, weekmax, maxed, discovered = GetCurrencyInfo(id)

	local r, g, b = 1, 1, 1
	for i = 1, GetNumWatchedTokens() do
		local _, _, _, itemID = GetBackpackCurrencyInfo( i )
		if id == itemID then r, g, b = .77, .12, .23 end
	end

	if (amount == 0 and r == 1) then return end
	if weekly then
		if discovered then GameTooltip:AddDoubleLine("\124T" .. tex .. ":12\124t " .. name, "Current: " .. amount .. " - " .. WEEKLY .. ": " .. week .. " / " .. weekmax, r, g, b, r, g, b) end
	elseif capped  then
		if id == 392 then maxed = 4000 end
		if discovered then GameTooltip:AddDoubleLine("\124T" .. tex .. ":12\124t " .. name, amount .. " / " .. maxed, r, g, b, r, g, b) end
	else
		if discovered then GameTooltip:AddDoubleLine("\124T" .. tex .. ":12\124t " .. name, amount, r, g, b, r, g, b) end
	end
end

local function Update(self, event)
	local Missions = {}
	
	C_Garrison_GetInProgressMissions(Missions, LE_FOLLOWER_TYPE_GARRISON_8_0)
	local CountInProgress = 0
	local CountCompleted = 0

	for i = 1, #Missions do
		if Missions[i].inProgress then
			local TimeLeft = Missions[i].timeLeft:match("%d")

			if (TimeLeft ~= "0") then CountInProgress = CountInProgress + 1 else CountCompleted = CountCompleted + 1 end
		end
	end
	if (CountInProgress > 0) then
		Text:SetFormattedText(qColor2..format("Work Work: ") .. qColor.. CountCompleted, #Missions)
	else
		Text:SetFormattedText(qColor2..format("No Missions"))
	end
	self:SetAllPoints(Text)
end

Stat:SetScript('OnEnter', function(self)
	--if not C['datatext']['ShowInCombat'] then
		if InCombatLockdown() then return end
	--end
	
	GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6)
	
	C_Garrison_RequestLandingPageShipmentInfo()
	
	--Missions
	local inProgressMissions = {}
	C_Garrison_GetInProgressMissions(inProgressMissions, LE_FOLLOWER_TYPE_GARRISON_8_0)
	local numMissions = #inProgressMissions
	if (numMissions > 0) then
		tsort(inProgressMissions, sortFunction)
		firstLine = false
		
		GameTooltip:AddLine("Mission(s) Report: ")
		for i = 1, numMissions do
			local mission = inProgressMissions[i]
			local timeLeft = mission.timeLeft:match('%d')
			local r, g, b = 1, 1, 1
			if (mission.isRare) then r, g, b = 0.09, 0.51, 0.81 end

			if (timeLeft and timeLeft == "0") then
				GameTooltip:AddDoubleLine(mission.name, COMPLETE, r, g, b, 0, 1, 0)
			else
				GameTooltip:AddDoubleLine(mission.name, mission.timeLeft, r, g, b)
			end
		end
	end

	-- Troop Work Orders
	local followerShipments = C_Garrison_GetFollowerShipments(LE_GARRISON_TYPE_8_0)
	local hasFollowers = false
	if (followerShipments) then
		for i = 1, #followerShipments do
			local name, _, _, shipmentsReady, shipmentsTotal = C_Garrison_GetLandingPageShipmentInfoByContainerID(followerShipments[i])
			if (name and shipmentsReady and shipmentsTotal) then
				if (hasFollowers == false) then
					if not firstLine then GameTooltip:AddLine(' ') end
					firstLine = false
					GameTooltip:AddLine(FOLLOWERLIST_LABEL_TROOPS)
					hasFollowers = true
				end

				GameTooltip:AddDoubleLine(name, format(GARRISON_LANDING_SHIPMENT_COUNT, shipmentsReady, shipmentsTotal), 1, 1, 1)
			end
		end
	end

	-- Talents
	local talentTreeIDs = C_Garrison_GetTalentTreeIDsByClassID(LE_GARRISON_TYPE_8_0, select(3, UnitClass('player')))
	local hasTalent = false
	if (talentTreeIDs) then
		local completeTalentID = C_Garrison_GetCompleteTalent(LE_GARRISON_TYPE_8_0)
		for _, treeID in ipairs(talentTreeIDs) do
			local _, _, tree = C_Garrison_GetTalentTreeInfoForID(treeID)
			for _, talent in ipairs(tree) do
				local showTalent = false
				if (talent.isBeingResearched) then
					showTalent = true
				end
				if (talent.id == completeTalentID) then
					showTalent = true
				end
				if (showTalent) then
					if not firstLine then GameTooltip:AddLine(' ') end
					firstLine = false
					GameTooltip:AddLine(RESEARCH_TIME_LABEL)
					GameTooltip:AddDoubleLine(talent.name, format(GARRISON_LANDING_SHIPMENT_COUNT, talent.isBeingResearched and 0 or 1, 1), 1, 1, 1)
					hasTalent = true
				end
			end
		end
	end

	-- Island Expeditions
	local hasIsland = false
	if (UnitLevel('player') >= GetMaxLevelForExpansionLevel(LE_EXPANSION_BATTLE_FOR_AZEROTH)) then
		local questID = C_IslandsQueue_GetIslandsWeeklyQuestID() or nil
		if questID then
			local _, _, finished, numFulfilled, numRequired = GetQuestObjectiveInfo(questID, 1, false)
			local text = ''
			local r1, g1 ,b1

			if finished or IsQuestFlaggedCompleted(questID) then
				text = GOAL_COMPLETED
				r1, g1, b1 = GREEN_FONT_COLOR:GetRGB()
			else
				text = ISLANDS_QUEUE_WEEKLY_QUEST_PROGRESS:format(numFulfilled, numRequired)
				r1, g1, b1 = selectioncolor
			end
			if not firstLine then GameTooltip:AddLine(' ') end
			firstLine = false
			GameTooltip:AddLine(ISLANDS_HEADER..":")
			GameTooltip:AddDoubleLine(ISLANDS_QUEUE_FRAME_TITLE, text, 1, 1, 1, r1, g1, b1)
			hasIsland = true
		end
	end

	if not firstLine then GameTooltip:AddLine(' ') end

	GameTooltip:AddLine(TOKENS)
	GameTooltip:AddDoubleLine(Currency(1560))
	GameTooltip:Show()
end)

Stat:SetScript('OnLeave', function() GameTooltip:Hide() end)	
Stat:SetScript('OnEvent', Update)
Stat:SetScript('OnMouseDown', function() 
	if not (C_Garrison_HasGarrison(LE_GARRISON_TYPE_8_0)) then return end

	local isShown = GarrisonLandingPage and GarrisonLandingPage:IsShown()
	if (not isShown) then
		ShowGarrisonLandingPage(LE_GARRISON_TYPE_8_0)
	elseif (GarrisonLandingPage) then
		local currentGarrType = GarrisonLandingPage.garrTypeID
		HideUIPanel(GarrisonLandingPage)
		if (currentGarrType ~= LE_GARRISON_TYPE_8_0) then
			ShowGarrisonLandingPage(LE_GARRISON_TYPE_8_0)
		end
	end
end)