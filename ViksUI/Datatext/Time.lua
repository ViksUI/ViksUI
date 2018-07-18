local T, C, L, _ = unpack(select(2, ...))
local _, class = UnitClass("player")
--local r, g, b = CUSTOM_CLASS_COLORS[class].r, CUSTOM_CLASS_COLORS[class].g, CUSTOM_CLASS_COLORS[class].b		--Classcolor // Use Classcolors Addon Values. 
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
if C.datatext.Wowtime >= 6 then
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
PP(C.datatext.Wowtime, Text)
--Text:SetFont(pxfont, pxfontsize, "OUTLINE")
--Text:SetHeight(CPMinimb2:GetHeight())
--Text:SetTextColor(r, g, b)
--Text:SetPoint("RIGHT", CPMinimb2,"RIGHT", 0, 1)

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
	--local pvp = GetNumWorldPVPAreas()
	--for i=1, pvp do
		--local timeleft = select(5, GetWorldPVPAreaInfo(i))
		--local name = select(2, GetWorldPVPAreaInfo(i))
		--local inprogress = select(3, GetWorldPVPAreaInfo(i))
		--local inInstance, instanceType = IsInInstance()
		--if not ( instanceType == "none" ) then
		--	timeleft = QUEUE_TIME_UNAVAILABLE
		--elseif inprogress then
		--	timeleft = WINTERGRASP_IN_PROGRESS
		--else
		--	local hour = tonumber(format("%01.f", floor(timeleft/3600)))
		--	local min = format(hour>0 and "%02.f" or "%01.f", floor(timeleft/60 - (hour*60)))
		--	local sec = format("%02.f", floor(timeleft - hour*3600 - min *60)) 
		--	timeleft = (hour>0 and hour..":" or "")..min..":"..sec
		--end
		--GameTooltip:AddDoubleLine("Time to".." "..name,timeleft)
	--end
	--GameTooltip:AddLine(" ")
	
	--if( UnitLevel( "player" ) >= 100 ) then
	--local Terrorfist = IsQuestFlaggedCompleted(39288)
	--local Deathtalon = IsQuestFlaggedCompleted(39287)
	--local Doomroller = IsQuestFlaggedCompleted(39289)
	--local Vengeance = IsQuestFlaggedCompleted(39290)
	local c = 0
	for i,q in ipairs({43892,43893,43894,43895,43896,43897,44164,44166}) do if (IsQuestFlaggedCompleted(q)) then c=c+1 end end
	--GameTooltip:AddDoubleLine( "Terrorfist" .. ": ", Terrorfist and "|cff00ff00" .. "Defeated" .. "|r" or "|cffff0000" .. "Undefeated" .. "|r" )
	--GameTooltip:AddDoubleLine( "Deathtalon" .. ": ", Deathtalon and "|cff00ff00" .. "Defeated" .. "|r" or "|cffff0000" .. "Undefeated" .. "|r" )
	--GameTooltip:AddDoubleLine( "Doomroller" .. ": ", Doomroller and "|cff00ff00" .. "Defeated" .. "|r" or "|cffff0000" .. "Undefeated" .. "|r" )
	--GameTooltip:AddDoubleLine( "Vengeance" .. ": ", Vengeance and "|cff00ff00" .. "Defeated" .. "|r" or "|cffff0000" .. "Undefeated" .. "|r" )
	GameTooltip:AddDoubleLine( "Seals this week" .. ": ", c)
	--end

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