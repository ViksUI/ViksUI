local T, C, L, _ = unpack(select(2, ...))
local _, class = UnitClass("player")
local r, g, b = unpack(C.media.pxcolor1)
if not C.datatext.Wowtime and not C.datatext.Wowtime > 0 then return end

pxfont = C.media.pixel_font 			-- main font in Viks UI
pxfontsize = C.media.pixel_font_size

DataTextTooltipAnchor = function(self)
	local panel = self:GetParent()
	local anchor = "ANCHOR_BOTTOMLEFT"
	local xoff = 0
	local yoff = 4
	return anchor, panel, xoff, yoff
end
--------------------------------------------------------------------
-- TIME
--------------------------------------------------------------------

local Stat = CreateFrame("Frame", "DataTextTime", UIParent)
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
PP(C.datatext.Wowtime, Text)

local visionList = { 58151, 58155, 58156, 58167, 58168 }
local QUESTS_LABEL

local region = GetCVar("portal")
if region == "EU" then
	legionbase = 1565168400 -- CN-16
	bfabase = 1546768800 -- CN+7
elseif region == "US" then
	legionbase = 1565197200 -- CN-8
	bfabase = 1546769340 -- CN+16
elseif region == "CN" then
	legionbase = 1565226000 -- CN time 8/8/2019 09:00 [1]
	bfabase = 1546743600 -- CN time 1/6/2019 11:00 [1]
end

-- Check Invasion Status
local invIndex = {
	[1] = {title = "Legion Invasion", duration = 66600, maps = {630, 641, 650, 634}, timeTable = {4, 3, 2, 1, 4, 2, 3, 1, 2, 4, 1, 3}, baseTime = legionbase}, -- 1/30 9:00 [1]
	[2] = {title = "Battle for Azeroth Invasion", duration = 68400, maps = {862, 863, 864, 896, 942, 895}, timeTable = {4, 1, 6, 2, 5, 3}, baseTime = bfabase}, -- 12/13 17:00 [1]
}

local mapAreaPoiIDs = {
	[630] = 5175,
	[641] = 5210,
	[650] = 5177,
	[634] = 5178,
	[862] = 5973,
	[863] = 5969,
	[864] = 5970,
	[896] = 5964,
	[942] = 5966,
	[895] = 5896,
}

local function GetInvasionTimeInfo(mapID)
	local areaPoiID = mapAreaPoiIDs[mapID]
	local seconds = C_AreaPoiInfo.GetAreaPOISecondsLeft(areaPoiID)
	local mapInfo = C_Map.GetMapInfo(mapID)
	return seconds, mapInfo.name
end

local function CheckInvasion(index)
	for _, mapID in pairs(invIndex[index].maps) do
		local timeLeft, name = GetInvasionTimeInfo(mapID)
		if timeLeft and timeLeft > 0 then
			return timeLeft, name
		end
	end
end

local function GetNextTime(baseTime, index)
	--local currentTime = time()
	--local duration = invIndex[index].duration
	--local elapsed = mod(currentTime - baseTime, duration)
	--return duration - elapsed + currentTime
end

local function GetNextLocation(nextTime, index)
	--local inv = invIndex[index]
	--local count = #inv.timeTable
	--local elapsed = nextTime - inv.baseTime
	--local round = mod(floor(elapsed / inv.duration) + 1, count)

	--if round == 0 then
		--round = count
	--end

	--return C_Map.GetMapInfo(inv.maps[inv.timeTable[round]]).name
end

local title
local function addTitle(text)
	if not title then
		GameTooltip:AddLine(' ')
		GameTooltip:AddLine(text..":")
		title = true
	end
end

local int = 1
local function Update(self, t)
	local pendingCalendarInvites = 0 --// BETA CalendarGetNumPendingInvites()
	int = int - t
	if int < 0 then
		if C.datatext.Localtime == true then
			Hr24 = tonumber(date("%H"))
			Hr = tonumber(date("%I"))
			Min = date("%M")
			if C.datatext.Time24 == true then
				if pendingCalendarInvites > 0 then
				Text:SetText("|cffFF0000"..Hr24..":"..Min)
			else
				Text:SetText(Hr24..":"..Min)
			end
		else
			if Hr24>=12 then
				if pendingCalendarInvites > 0 then
					Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffpm|r")
				else
					Text:SetText(Hr..":"..Min.." |cffffffffpm|r")
				end
			else
				if pendingCalendarInvites > 0 then
					Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffam|r")
				else
					Text:SetText(Hr..":"..Min.." |cffffffffam|r")
				end
			end
		end
	else
		local Hr, Min = GetGameTime()
		if Min<10 then Min = "0"..Min end
		if C.datatext.Time24 == true then
			if pendingCalendarInvites > 0 then			
				Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffff|r")
			else
				Text:SetText(Hr..":"..Min.." |cffffffff|r")
			end
		else
			if Hr>=12 then
				if Hr>12 then Hr = Hr-12 end
				if pendingCalendarInvites > 0 then
					Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffpm|r")
				else
					Text:SetText(Hr..":"..Min.." |cffffffffpm|r")
				end
			else
				if Hr == 0 then Hr = 12 end
				if pendingCalendarInvites > 0 then
					Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffam|r")
				else
					Text:SetText(Hr..":"..Min.." |cffffffffam|r")
				end
			end
		end
	end
	self:SetAllPoints(Text)
	int = 1
	end
end

Stat:SetScript("OnEnter", function(self)
	local anchor, panel, xoff, yoff = DataTextTooltipAnchor(Text)
	OnLoad = function(self) RequestRaidInfo() end
	
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT", -4, 16)
	GameTooltip:ClearLines()

	local c = 0
	for i,q in ipairs({52840,52834,52835,52837,52839,52838}) do if (C_QuestLog.IsQuestFlaggedCompleted(q)) then c=c+1 end end
	GameTooltip:AddDoubleLine( L_STATS_SEALS .. ": ", c)
	
	for index, value in ipairs(invIndex) do
		title = false
		addTitle(value.title)
		local timeLeft, zoneName = CheckInvasion(index)
		local nextTime = GetNextTime(value.baseTime, index)
		if timeLeft then
			timeLeft = timeLeft / 60
			if timeLeft < 60 then
				r,g,b = 1, 0, 0
			else
				r,g,b = 0, 1, 0
			end
			--GameTooltip:AddDoubleLine('Current Invasion '..zoneName, string.format('%.2d:%.2d', timeLeft / 60, timeLeft % 60), 1, 1, 1, r, g, b)
		end
		if C['datatext']['Time24'] then
			--GameTooltip:AddDoubleLine("Next Invasion "..GetNextLocation(nextTime, index), date("%d.%m / %H:%M", nextTime), 1, 1, 1, 1, 1, 1)
		else
			--GameTooltip:AddDoubleLine('Next Invasion '..GetNextLocation(nextTime, index), date('%m/%d %H:%M', nextTime), 1, 1, 1, 1, 1, 1)
		end
	end

	for _, id in pairs(visionList) do
		if C_QuestLog.IsQuestFlaggedCompleted(id) then
			addTitle(QUESTS_LABEL)
			GameTooltip:AddDoubleLine("Lesser Vision of N'Zoth", QUEST_COMPLETE, 1,1,1, 1,0,0)
		end
	end
	
	if C.datatext.Localtime == true then
		local Hr, Min = GetGameTime()
		if Min<10 then Min = "0"..Min end
		if C.datatext.Time24 == true then         
			GameTooltip:AddDoubleLine("Server Time: ",Hr .. ":" .. Min);
		else             
			if Hr>=12 then
			Hr = Hr-12
			if Hr == 0 then Hr = 12 end
				GameTooltip:AddDoubleLine("Server Time: ",Hr .. ":" .. Min.." PM");
			else
				if Hr == 0 then Hr = 12 end
				GameTooltip:AddDoubleLine("Server Time: ",Hr .. ":" .. Min.." AM");
			end
		end
	else
		Hr24 = tonumber(date("%H"))
		Hr = tonumber(date("%I"))
		Min = date("%M")
		if C.datatext.time24 == true then
			GameTooltip:AddDoubleLine("Local Time: ",Hr24 .. ":" .. Min);
		else
			if Hr24>=12 then
				GameTooltip:AddDoubleLine("Local Time: ",Hr .. ":" .. Min.." PM");
			else
				GameTooltip:AddDoubleLine("Local Time: ",Hr .. ":" .. Min.." AM");
			end
		end
	end  
	
	local oneraid
	for i = 1, GetNumSavedInstances() do
		local name,_,reset,difficulty,locked,extended,_,isRaid,maxPlayers = GetSavedInstanceInfo(i)
		if isRaid and (locked or extended) or maxPlayers == 5 and difficulty == 23 and (locked or extended) then
			local tr,tg,tb,diff
			if not oneraid then
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Saved Mythic/Raid(s)")
				oneraid = true
			end

			local function fmttime(sec,table)
			local table = table or {}
			local d,h,m,s = ChatFrame_TimeBreakDown(floor(sec))
			local string = gsub(gsub(format(" %dd %dh %dm "..((d==0 and h==0) and "%ds" or ""),d,h,m,s)," 0[dhms]"," "),"%s+"," ")
			local string = strtrim(gsub(string, "([dhms])", {d=table.days or "d",h=table.hours or "h",m=table.minutes or "m",s=table.seconds or "s"})," ")
			if maxPlayers == 5 and difficulty == 23 then
			return strmatch(string,"^%s*$") or string
			else
			return strmatch(string,"^%s*$") and "0"..(table.seconds or L"s") or string
			end
		end
		if extended then tr,tg,tb = 0.3,1,0.3 else tr,tg,tb = 1,1,1 end
		if difficulty == 3 or difficulty == 4 then diff = "H" else diff = "N" end
		if maxPlayers == 5 and difficulty == 23 then
		GameTooltip:AddDoubleLine("M:"..name,fmttime(reset),1,1,1,tr,tg,tb)
		else
		GameTooltip:AddDoubleLine(name,fmttime(reset),1,1,1,tr,tg,tb)
		end
		end
	end
	local addedLine
	for i = 1, GetNumSavedWorldBosses() do
		local name, _, reset = GetSavedWorldBossInfo(i)
		local function fmttime(sec,table)
		local table = table or {}
		local d,h,m,s = ChatFrame_TimeBreakDown(floor(sec))
		local string = gsub(gsub(format(" %dd %dh %dm "..((d==0 and h==0) and "%ds" or ""),d,h,m,s)," 0[dhms]"," "),"%s+"," ")
		local string = strtrim(gsub(string, "([dhms])", {d=table.days or "d",h=table.hours or "h",m=table.minutes or "m",s=table.seconds or "s"})," ")
		return strmatch(string,"^%s*$") and "0"..(table.seconds or L"s") or string
		end
		if reset then
			if not addedLine then
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine(RAID_INFO_WORLD_BOSS, tr, tg, tb)
				addedLine = true
			end
			GameTooltip:AddDoubleLine(name, fmttime(reset), 1, 1, 1, 1, 1, 1)
		end
	end
	GameTooltip:Show()
end)

Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
Stat:RegisterEvent("CALENDAR_UPDATE_PENDING_INVITES")
Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:SetScript("OnUpdate", Update)
Stat:RegisterEvent("UPDATE_INSTANCE_INFO")
Stat:SetScript("OnMouseDown", function(self, btn)
	if btn == 'RightButton'  then
		ToggleTimeManager()
	else
		GameTimeFrame:Click()
	end
end)
Update(Stat, 10)