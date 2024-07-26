local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- GUILD ROSTER
--------------------------------------------------------------------
function RGBToHex(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return string.format("|cff%02x%02x%02x", r*255, g*255, b*255)
end
function ShortValue(v)
	if v >= 1e6 then
		return ("%.1fm"):format(v / 1e6):gsub("%.?0+([km])$", "%1")
	elseif v >= 1e3 or v <= -1e3 then
		return ("%.1fk"):format(v / 1e3):gsub("%.?0+([km])$", "%1")
	else
		return v
	end
end
if C.datatext.Guild and C.datatext.Guild > 0 then
	
-- localized references for global functions (about 50% faster)
local join 			= string.join
local format		= string.format
local find			= string.find
local gsub			= string.gsub
local sort			= table.sort
local ceil			= math.ceil

local CUSTOM_CLASS_COLORS = CUSTOM_CLASS_COLORS
local GetGuildRosterInfo = GetGuildRosterInfo
local GetGuildRosterMOTD = GetGuildRosterMOTD
local C_GuildInfo_GuildRoster = C_GuildInfo.GuildRoster
local GetNumGuildMembers = GetNumGuildMembers
local GetQuestDifficultyColor = GetQuestDifficultyColor
local GetRealmName = GetRealmName
local InCombatLockdown = InCombatLockdown
local IsInGuild = IsInGuild
local maxDailyXP = maxDailyXP
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local UnitGetGuildXP = UnitGetGuildXP
local UnitInParty = UnitInParty
local UnitInRaid = UnitInRaid

local tthead, ttsubh, ttoff = {r=0.4, g=0.78, b=1}, {r=0.75, g=0.9, b=1}, {r=.3,g=1,b=.3}
local activezone, inactivezone = {r=0.3, g=1.0, b=0.3}, {r=0.65, g=0.65, b=0.65}
local displayString = join("", GUILD, ": ", qColor, "%d|r")
local noGuildString = join("", qColor, "Find a Guild")
local guildInfoString = "%s [%d]"
local guildInfoString2 = join("", GUILD, ": %d/%d")
local guildMotDString = "%s |cffaaaaaa- |cffffffff%s"
local levelNameString = "|cff%02x%02x%02x%d|r |cff%02x%02x%02x%s|r %s"
local levelNameStatusString = "|cff%02x%02x%02x%d|r %s %s"
local nameRankString = "%s |cff999999-|cffffffff %s"
local standingString = join("", RGBToHex(ttsubh.r, ttsubh.g, ttsubh.b), "%s:|r |cFFFFFFFF%s/%s (%s%%)")
local moreMembersOnlineString = join("", "+ %d ", FRIENDS_LIST_ONLINE, "...")
local noteString = join("", "|cff999999   ", LABEL_NOTE, ":|r %s")
local officerNoteString = join("", "|cff999999   ", GUILD_RANK1_DESC, ":|r %s")
local friendOnline, friendOffline = gsub(ERR_FRIEND_ONLINE_SS,"\124Hplayer:%%s\124h%[%%s%]\124h",""), gsub(ERR_FRIEND_OFFLINE_S,"%%s","")
local guildTable, guildMotD = {}, {}, ""

local Stat = CreateFrame("Frame", "DataTextGuild", UIParent)
Stat:EnableMouse(true)
Stat:SetFrameStrata("MEDIUM")
Stat:SetFrameLevel(3)



local Text  = Stat:CreateFontString(nil, "OVERLAY")
if C.datatext.Guild>= 9 then
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
PP(C.datatext.Guild, Text)
Stat:SetAllPoints(Text)
--Stat:SetParent(Text:GetParent())


local function SortGuildTable(shift)
	sort(guildTable, function(a, b)
		if a and b then
			if shift then
				return a[10] < b[10]
			else
				return a[1] < b[1]
			end
		end
	end)
end

local function BuildGuildTable()
	wipe(guildTable)
	local name, rank, level, zone, note, officernote, connected, status, class
	local count = 0
	for i = 1, GetNumGuildMembers() do
		name, rank, _, level, _, zone, note, officernote, connected, status, class, _, _, isMobile = GetGuildRosterInfo(i)
		-- we are only interested in online members
		name = Ambiguate(name, "guild")
		if status == 1 then
			status = "|cffFFFFFF[|r|cffFF0000"..'AFK'.."|r|cffFFFFFF]|r"
		elseif status == 2 then
			status = "|cffFFFFFF[|r|cffFF0000"..'DND'.."|r|cffFFFFFF]|r"
		else 
			status = '';
		end
		
		if connected then 
			count = count + 1
			guildTable[count] = {name, rank, level, zone, note, officernote, connected, status, class, isMobile}
			name = Ambiguate(name, "guild")
		end
	end
	SortGuildTable(IsShiftKeyDown())
end



local function UpdateGuildMessage()
	guildMotD = GetGuildRosterMOTD()
end

local function Update(self, event, ...)	
	if IsInGuild() then
		C_GuildInfo_GuildRoster() -- Bux Fix on 5.4.
		-- special handler to request guild roster updates when guild members come online or go
		-- offline, since this does not automatically trigger the GuildRoster update from the server
		if event == "CHAT_MSG_SYSTEM" then
			local message = select(1, ...)
			if find(message, friendOnline) or find(message, friendOffline) then C_GuildInfo_GuildRoster() end
		end
		-- our guild xp changed, recalculate it
		if event == "GUILD_XP_UPDATE" then UpdateGuildXP() return end
		-- our guild message of the day changed
		if event == "GUILD_MOTD" then UpdateGuildMessage() return end
		-- when we enter the world and guildframe is not available then
		-- load guild frame, update guild message and guild xp
		if event == "PLAYER_ENTERING_WORLD" then
			if not GuildFrame and IsInGuild() then LoadAddOn("Blizzard_GuildUI") UpdateGuildMessage() end
		end
		-- an event occured that could change the guild roster, so request update, and wait for guild roster update to occur
		if event ~= "GUILD_ROSTER_UPDATE" and event~="PLAYER_GUILD_UPDATE" then C_GuildInfo_GuildRoster() return end

		totalOnline = select(3, GetNumGuildMembers())
		
		Text:SetFormattedText(displayString, totalOnline)
	else
		Text:SetText(noGuildString)
	end
end
	
local menuFrame = CreateFrame("Frame", "GuildRightClickMenu", UIParent, "UIDropDownMenuTemplate")
local menuList = {
	{ text = OPTIONS_MENU, isTitle = true, notCheckable=true},
	{ text = INVITE, hasArrow = true, notCheckable=true,},
	{ text = CHAT_MSG_WHISPER_INFORM, hasArrow = true, notCheckable=true,}
}

local function inviteClick(self, arg1, arg2, checked)
	menuFrame:Hide()
	C_PartyInfo.InviteUnit(arg1)
end

local function whisperClick(self,arg1,arg2,checked)
	menuFrame:Hide()
	SetItemRef( "player:"..arg1, ("|Hplayer:%1$s|h[%1$s]|h"):format(arg1), "LeftButton" )
end

local function ToggleGuild()
	ToggleGuildFrame()
end

Stat:SetScript("OnMouseUp", function(self, btn)
	if btn ~= "RightButton" or not IsInGuild() then return end
	if InCombatLockdown() then return end
	
	GameTooltip:Hide()

	local classc, levelc, grouped, info
	local menuCountWhispers = 0
	local menuCountInvites = 0

	menuList[2].menuList = {}
	menuList[3].menuList = {}

	for i = 1, #guildTable do
		info = guildTable[i]
		if info[7] and info[1] ~= myname then
			local classc, levelc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[info[9]], GetQuestDifficultyColor(info[3])


			if UnitInParty(info[1]) or UnitInRaid(info[1]) then
				grouped = "|cffaaaaaa*|r"
			else
				menuCountInvites = menuCountInvites +1
				grouped = ""
				menuList[2].menuList[menuCountInvites] = {text = format(levelNameString, levelc.r*255,levelc.g*255,levelc.b*255, info[3], classc.r*255,classc.g*255,classc.b*255, info[1], ""), arg1 = info[1],notCheckable=true, func = inviteClick}
			end
			menuCountWhispers = menuCountWhispers + 1
			menuList[3].menuList[menuCountWhispers] = {text = format(levelNameString, levelc.r*255,levelc.g*255,levelc.b*255, info[3], classc.r*255,classc.g*255,classc.b*255, info[1], grouped), arg1 = info[1],notCheckable=true, func = whisperClick}
		end
	end

	EasyMenu(menuList, menuFrame, "cursor", 0, 0, "MENU", 2)
end)

Stat:SetScript("OnMouseDown", function(self, btn)
	if btn ~= "LeftButton" then return end
	ToggleGuild()
end)

Stat:SetScript("OnEnter", function(self)
	if not IsInGuild() then return end
	
	local total, online = GetNumGuildMembers()
	C_GuildInfo_GuildRoster()
	BuildGuildTable()
	
	
	local guildName, guildRank = GetGuildInfo('player')

	GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6)
	
	GameTooltip:ClearLines()
	GameTooltip:AddDoubleLine(format(guildInfoString, guildName, guildLevel), format(guildInfoString2, online, total),tthead.r,tthead.g,tthead.b,tthead.r,tthead.g,tthead.b)
	GameTooltip:AddLine(guildRank, unpack(tthead))
	GameTooltip:AddLine(' ')
	
	if guildMotD ~= "" then GameTooltip:AddLine(format(guildMotDString, GUILD_MOTD, guildMotD), ttsubh.r, ttsubh.g, ttsubh.b, 1) end
	
	local col = RGBToHex(ttsubh.r, ttsubh.g, ttsubh.b)
	GameTooltip:AddLine(' ')
	
	local factionTemp = {}
	local GetGuildFactionInfo = (C_Reputation and C_Reputation.GetGuildFactionData) or function()
		factionTemp.name, factionTemp.description, factionTemp.reaction, factionTemp.currentReactionThreshold, factionTemp.nextReactionThreshold, factionTemp.currentStanding = _G.GetGuildFactionInfo()
		return factionTemp
	end

	local info = C_Reputation.GetGuildFactionData()
	if info and info.reaction ~= 8 then -- Not Max Rep
			local nextReactionThreshold = info.nextReactionThreshold - info.currentReactionThreshold
			local currentStanding = info.currentStanding - info.currentReactionThreshold
		GameTooltip:AddLine(format(standingString, COMBAT_FACTION_CHANGE, ShortValue(currentStanding), ShortValue(nextReactionThreshold), ceil((currentStanding / nextReactionThreshold) * 100)))
	end
	
	local zonec, classc, levelc, info
	local shown = 0
	
	GameTooltip:AddLine(' ')
	for i = 1, #guildTable do
		-- if more then 30 guild members are online, we don't Show any more, but inform user there are more
		if 80 - shown <= 1 then
			if online - 30 > 1 then GameTooltip:AddLine(format(moreMembersOnlineString, online - 30), ttsubh.r, ttsubh.g, ttsubh.b) end
			break
		end

		info = guildTable[i]
		if GetRealZoneText() == info[4] then zonec = activezone else zonec = inactivezone end
		classc, levelc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[info[9]], GetQuestDifficultyColor(info[3])
		
		if IsShiftKeyDown() then
			GameTooltip:AddDoubleLine(format(nameRankString, info[1], info[2]), info[4], classc.r, classc.g, classc.b, zonec.r, zonec.g, zonec.b)
			if info[5] ~= "" then GameTooltip:AddLine(format(noteString, info[5]), ttsubh.r, ttsubh.g, ttsubh.b, 1) end
			if info[6] ~= "" then GameTooltip:AddLine(format(officerNoteString, info[6]), ttoff.r, ttoff.g, ttoff.b, 1) end
		else
			GameTooltip:AddDoubleLine(format(levelNameStatusString, levelc.r*255, levelc.g*255, levelc.b*255, info[3], info[1], info[8]), info[4], classc.r,classc.g,classc.b, zonec.r,zonec.g,zonec.b)
		end
		shown = shown + 1
	end
	GameTooltip:Show()
end)

Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)

--Stat:RegisterEvent("GUILD_ROSTER_SHOW")
Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:RegisterEvent("GUILD_ROSTER_UPDATE")
--Stat:RegisterEvent("GUILD_XP_UPDATE")
Stat:RegisterEvent("PLAYER_GUILD_UPDATE")
Stat:RegisterEvent("GUILD_MOTD")
Stat:RegisterEvent("CHAT_MSG_SYSTEM")
Stat:SetScript("OnEvent", Update)
end
