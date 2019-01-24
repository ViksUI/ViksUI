local T, C, L, _ = unpack(select(2, ...))
if C.datatext.Arena and C.datatext.Arena > 0 then


	local Stat = CreateFrame("Frame", "DataTextArena", UIParent)
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	--Set font based on where.
	if C.datatext.Arena >= 6 then
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
	else
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	end
	PP(C.datatext.Arena, Text)
	
	dispConquestPoints = false
	local conquestPoints = 0
	local ArenaTeams={}
	local MaxPoints = 0
	local PotentialCap = 0
	local stringItem = ""
	local capFromTeam = ""

	Stat:SetScript("OnMouseDown", function()
		if InCombatLockdown() then return end
		if IsShiftKeyDown() then
		TogglePVPFrame()
		PVPFrameTab1:Click()
		else
		TogglePVPFrame()
		PVPFrameTab2:Click()
		end
	end)

	DataTextTooltipAnchor = function(self)
	local panel = self:GetParent()
	local anchor = "ANCHOR_CURSOR"
	local xoff = 0
	local yoff = 20
	return anchor, panel, xoff, yoff
	end
	

	local function CalculatePoints(rating)
	local rating = tonumber(rating)
	local cap = nil
	if rating then
		if rating >= 3000 then
			cap = 3000
		elseif rating < 3000 and rating > 1500 then
			cap = math.floor(1.4326 * (1511.26 / (1 + 1639.28 / exp(0.00412 * rating))) + 850.15)
		else
			cap = 1343
		end
	else 
		cap = 0
	end
	return cap
	end


	local function OnEvent(self, event, ...)
		local conquestLocalized, conquestPoints = GetCurrencyInfo(390)
		local personalBGRating, ratedBGreward, pointsThisWeek, maxPointsThisWeek, weeklyWins, weeklyPlayed = GetPersonalRatedBGInfo();
		MaxPoints=0
		for i =1,3 do
			local teamName, teamSize, teamRating, weekPlayed, weekWins, seasonPlayed, seasonWins, playerPlayed, seasonPlayerPlayed, teamRank, playerRating = GetArenaTeam(i)
			if(teamName~=nil) then
				ArenaTeams[i] = {}
				ArenaTeams[i]["Size"] = teamSize
				ArenaTeams[i]["Name"] = teamName
				ArenaTeams[i]["Rating"] = teamRating
				PotentialCap = CalculatePoints(teamRating)
				ArenaTeams[i]["Points"] = PotentialCap
				if(PotentialCap>MaxPoints) and pointsThisWeek > 0 and playerPlayed > 0 then
					MaxPoints = PotentialCap
					capFromTeam = ArenaTeams[i]["Size"].."v"..ArenaTeams[i]["Size"]
				else
					MaxPoints = 0
				end
			end
		end
		-- Checks for Rated BG potential Cap
		if MaxPoints == 0 and pointsThisWeek > 0 then
			MaxPoints = CalculatePoints(personalBGRating)
			capFromTeam = "Rated BG"
		else
			MaxPoints = 1343
			capFromTeam = "No games played"
		end
		if dispConquestPoints then
			stringItem = conquestPoints
		else
			stringItem = MaxPoints
		end
		-- All values have been picked up, let's start displaying it.
		
		-- Showing the text
		local dummy = CreateFrame("FRAME", "FooAddonFrame");
		dummy:RegisterEvent("PLAYER_ENTERING_WORLD");
		local function eventHandler(self, event, ...)
		for i = 1,3 do
			if(ArenaTeams[i]~=nil) then
			Text:SetText("|cff0063C7"..ArenaTeams[i]["Size"].."v"..ArenaTeams[i]["Size"]..": ".."|r".."|cffFFFFFF"..ArenaTeams[i]["Rating"].."|r")
			dummy:Show()
			end
		end
		end
		
		local int = 1
local function Update(self, t)
	int = int - t
	if int < 0 then
	Text:SetText("|cff0063C7"..ArenaTeams[i]["Size"].."v"..ArenaTeams[i]["Size"]..": ".."|r".."|cffFFFFFF"..ArenaTeams[i]["Rating"].."|r")
	self:SetAllPoints(Text)
	end
end
		dummy:SetScript("OnEvent", eventHandler);
		-- Adding the tooltip
		Text:SetText("No Arena")
		Stat:SetAllPoints(Text)
		Stat:SetScript("OnEnter", function()
		local anchor, panel, xoff, yoff = DataTextTooltipAnchor(Text)
		GameTooltip:SetOwner(panel, anchor, xoff, yoff)
		GameTooltip:ClearLines()
		if not InCombatLockdown() then
			GameTooltip:AddLine("|cffffff00".."Arena Teams".."|r")
			GameTooltip:AddLine("-------------------------", 1, 1, 1)
			for i = 1,3 do
				if(ArenaTeams[i]~=nil) then
					GameTooltip:AddDoubleLine("["..ArenaTeams[i]["Size"].."v"..ArenaTeams[i]["Size"].."] <"..ArenaTeams[i]["Name"]..">", "("..ArenaTeams[i]["Rating"]..") ["..ArenaTeams[i]["Points"].."]", 1, 1, 1, 1, 1, 1)
					Text:SetText("|cff0063C7"..ArenaTeams[i]["Size"].."v"..ArenaTeams[i]["Size"]..": ".."|r".."|cffFFFFFF"..ArenaTeams[i]["Rating"].."|r")
					end
			end
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cffffff00"..PVP_RATED_BATTLEGROUND.."|r")
			if personalBGRating > 0 then
				GameTooltip:AddLine("-------------------------", 1, 1, 1)
				GameTooltip:AddDoubleLine("Personal Rating", "("..personalBGRating..") ["..CalculatePoints(personalBGRating).."]", 1, 1, 1, 1, 1, 1)
			end
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cffffff00"..conquestLocalized.."|r")
			GameTooltip:AddLine("-------------------------", 1, 1, 1)
			GameTooltip:AddDoubleLine("Current", pointsThisWeek.."/"..maxPointsThisWeek, 1, 1, 1, 1, 1, 1)
			GameTooltip:AddLine(" ")
			if db.dispConquestPoints then
				GameTooltip:AddDoubleLine("Next week's cap is from '"..capFromTeam.."'.", MaxPoints, 1, 1, 1, 1, 1, 1)
			else
				GameTooltip:AddDoubleLine(conquestLocalized, conquestPoints, 1, 1, 1, 1, 1, 1)
			end
			GameTooltip:AddLine("-------------------------", 1, 1, 1)
			GameTooltip:AddLine("|cffffff00".."Click to toggle Conquest/Signup")
			GameTooltip:AddLine("|cffffff00".."Shift-Click to toggle PVP Frame")
		end
		GameTooltip:Show()
		end)
		Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
	end
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:RegisterEvent("ARENA_TEAM_UPDATE")
	Stat:SetScript("OnEvent", OnEvent)

end




--[[
if not C.datatext.Arena or C.datatext.Arena == 0 then return end
DataTextTooltipAnchor = function(self)
	local panel = self:GetParent()
	local anchor = "ANCHOR_CURSOR"
	local xoff = 0
	local yoff = 20
	return anchor, panel, xoff, yoff
end

if IsInArenaTeam() then
else return end


local ADDON_NAME, ns = ...
local oUF = ns.oUF or oUF

ns._Objects = {}
ns._Headers = {}

local Stat = CreateFrame("Frame")
Stat:EnableMouse(true)
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)

local Text  = LBottom:CreateFontString(nil, "OVERLAY")
--Set font based on where.
if C.datatext.Arena >= 9 then
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
PP(C.datatext.Arena, Text)



if IsInArenaTeam() then
else return end

local function OnEvent(self, event)
if  event == "PLAYER_ENTERING_WORLD" or "PVP_RATED_STATS_UPDATE" or "ARENA_TEAM_UPDATE" then
	self:SetAllPoints(Text)
	-- Get TeamID for 2v2 and 3v3
	local teamID2v2 = ArenaTeam_GetTeamSizeID(2)
	local teamID3v3 = ArenaTeam_GetTeamSizeID(3)
	-- Get data for 2v2
	local teamName, teamSize, teamRating, weekPlayed, weekWins, seasonPlayed, seasonWins, playerPlayed, seasonPlayerPlayed, teamRank, playerRating = GetArenaTeam(teamID2v2);
	local Arena_2v2 = playerRating
	-- Get data for 3v3
	local teamName, teamSize, teamRating, weekPlayed, weekWins, seasonPlayed, seasonWins, playerPlayed, seasonPlayerPlayed, teamRank, playerRating = GetArenaTeam(teamID3v3);
	local Arena_3v3 = playerRating
	-- Get data for Conquest points
	--local localized_label, amount, icon_file_name = GetCurrencyInfo(390)
	--local CQ_points = amount
	
	-- Verify if 2v2 and/or 3v3 exist and display the ones available
	if Arena_2v2 > 1 and Arena_3v3 > 1 then Text:SetText("|cff0063C7 2v2: |cffFFFFFF" .. Arena_2v2 .. "|cff0063C7 3v3: |cffFFFFFF" .. Arena_3v3)
	elseif Arena_2v2 > 1 then Text:SetText("|cff0063C7 2v2: |cffFFFFFF" .. Arena_2v2)
	elseif Arena_3v3 > 1 then Text:SetText("|cff0063C7 3v3: |cffFFFFFF" .. Arena_3v3)
	else Text:SetText("|cffFFFF33 Conquest: |cff0063C7" .. "No Teams found") end
end	
end

Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:RegisterEvent("ARENA_TEAM_UPDATE")
Stat:SetScript("OnEvent", OnEvent) 

Stat:SetScript("OnMouseDown", function()
	if InCombatLockdown() then return end
	if IsShiftKeyDown() then
		TogglePVPFrame()
		PVPFrameTab1:Click()
		else
		TogglePVPFrame()
		PVPFrameTab2:Click()
		end
end)

local function CalculatePoints(rating)
	local rating = tonumber(rating)
	local cap = nil
	if rating then
		if rating >= 3000 then
			cap = 3000
		elseif rating < 3000 and rating > 1500 then
			cap = math.floor(1.4326 * (1511.26 / (1 + 1639.28 / exp(0.00412 * rating))) + 850.15)
		else
			cap = 1343
		end
	else 
		cap = 0
	end
	return cap
end

local conquestPoints = 0
local ArenaTeams={}
local MaxPoints = 0
local PotentialCap = 0
local stringItem = ""
local capFromTeam = ""

Stat:SetScript("OnEnter", function()
	if InCombatLockdown() then return end
	local anchor, panel, xoff, yoff = DataTextTooltipAnchor(Text)
	GameTooltip:SetOwner(panel, anchor, xoff, yoff)
	GameTooltip:ClearLines()
	local conquestLocalized, conquestPoints = GetCurrencyInfo(390)
	local personalBGRating, ratedBGreward, pointsThisWeek, maxPointsThisWeek, weeklyWins, weeklyPlayed = GetPersonalRatedBGInfo();
	MaxPoints=0
	for i =1,3 do
		local teamName, teamSize, teamRating, weekPlayed, weekWins, seasonPlayed, seasonWins, playerPlayed, seasonPlayerPlayed, teamRank, playerRating = GetArenaTeam(i)
		if(teamName~=nil) then
			ArenaTeams[i] = {}
			ArenaTeams[i]["Size"] = teamSize
			ArenaTeams[i]["Name"] = teamName
			ArenaTeams[i]["Rating"] = teamRating
			PotentialCap = CalculatePoints(teamRating)
			ArenaTeams[i]["Points"] = PotentialCap
			if(PotentialCap>MaxPoints) and pointsThisWeek > 0 and playerPlayed > 0 then
				MaxPoints = PotentialCap
				capFromTeam = ArenaTeams[i]["Size"].."v"..ArenaTeams[i]["Size"]
			else
				MaxPoints = 0
			end
		end
	end
		-- Checks for Rated BG potential Cap
	if MaxPoints == 0 and pointsThisWeek > 0 then
		MaxPoints = CalculatePoints(personalBGRating)
		capFromTeam = "Rated BG"
	else
		MaxPoints = 1343
		capFromTeam = "No games played"
	end
	if db.dispConquestPoints then
		stringItem = conquestPoints
	else
		stringItem = MaxPoints
	end

			GameTooltip:AddLine("|cffffff00".."Arena Teams".."|r")
			GameTooltip:AddLine("-------------------------", 1, 1, 1)
			for i = 1,3 do
				if(ArenaTeams[i]~=nil) then
					GameTooltip:AddDoubleLine("["..ArenaTeams[i]["Size"].."v"..ArenaTeams[i]["Size"].."] <"..ArenaTeams[i]["Name"]..">", "("..ArenaTeams[i]["Rating"]..") ["..ArenaTeams[i]["Points"].."]", 1, 1, 1, 1, 1, 1)
				end
			end
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cffffff00"..PVP_RATED_BATTLEGROUND.."|r")
			if personalBGRating > 0 then
				GameTooltip:AddLine("-------------------------", 1, 1, 1)
				GameTooltip:AddDoubleLine("Personal Rating", "("..personalBGRating..") ["..CalculatePoints(personalBGRating).."]", 1, 1, 1, 1, 1, 1)
			end
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("|cffffff00"..conquestLocalized.."|r")
			GameTooltip:AddLine("-------------------------", 1, 1, 1)
			GameTooltip:AddDoubleLine("Current", pointsThisWeek.."/"..maxPointsThisWeek, 1, 1, 1, 1, 1, 1)
			GameTooltip:AddLine(" ")
			if db.dispConquestPoints then
				GameTooltip:AddDoubleLine("Next week's cap is from '"..capFromTeam.."'.", MaxPoints, 1, 1, 1, 1, 1, 1)
			else
				GameTooltip:AddDoubleLine(conquestLocalized, conquestPoints, 1, 1, 1, 1, 1, 1)
			end
			GameTooltip:AddLine("-------------------------", 1, 1, 1)
			GameTooltip:AddLine("|cffffff00".."Click to toggle Conquest/Signup")
			GameTooltip:AddLine("|cffffff00".."Shift-Click to toggle PVP Frame")
			GameTooltip:Show()
end)
Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
--]]