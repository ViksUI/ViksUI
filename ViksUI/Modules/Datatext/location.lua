local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
-- Location and Coords
--------------------------------------------------------------------
local Unknown = UNKNOWN
local cordson = C.datatext.showcoords

local ZoneColors = {
	["friendly"] = {0.1, 1.0, 0.1},
	["sanctuary"] = {0.41, 0.8, 0.94},
	["arena"] = {1.0, 0.1, 0.1},
	["hostile"] = {1.0, 0.1, 0.1},
	["contested"] = {1.0, 0.7, 0},
	["combat"] = {1.0, 0.1, 0.1},
	["else"] = {1.0, 0.9294, 0.7607}
}

if C.datatext.location and C.datatext.location > 0 then
	local Stat = CreateFrame("Frame", "DataTextLocation", UIParent)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
if C.datatext.location >= 9 then
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
	PP(C.datatext.location, Text)

function LocMopColoring()
	local pvpType = GetZonePVPInfo()
	if pvpType == "arena" then
		return 0.84, 0.03, 0.03
	elseif pvpType == "friendly" then
		return 0.05, 0.85, 0.03
	elseif pvpType == "contested" then
		return 0.9, 0.85, 0.05
	elseif pvpType == "hostile" then 
		return 0.84, 0.03, 0.03
	elseif pvpType == "sanctuary" then
		return 0.035, 0.58, 0.84
	elseif pvpType == "combat" then
		return 0.84, 0.03, 0.03
	else
		return 1, 1, 0
	end
end

local ela = 0
local function Update(self, t)
	local curTime = GetTime()
	if curTime - ela <= 0.2 then return end
	ela = curTime

	local subZoneText = GetMinimapZoneText() or ""
	local zoneText = _G.GetRealZoneText() or _G.UNKNOWN;
	
	if cordson == true then
		local unitMap = C_Map.GetBestMapForUnit("player")
		local mapRects, tempVec2D = {}, CreateVector2D(0, 0)
		local function GetPlayerMapPos(mapID)
			tempVec2D.x, tempVec2D.y = UnitPosition("player")
			if not tempVec2D.x then return end

			local mapRect = mapRects[mapID]
			if not mapRect then
				mapRect = {
					select(2, C_Map.GetWorldPosFromMapPos(mapID, CreateVector2D(0, 0))),
					select(2, C_Map.GetWorldPosFromMapPos(mapID, CreateVector2D(1, 1)))}
				mapRect[2]:Subtract(mapRect[1])
				mapRects[mapID] = mapRect
			end
			tempVec2D:Subtract(mapRect[1])

			return (tempVec2D.y/mapRect[2].y), (tempVec2D.x/mapRect[2].x)
		end
		if unitMap then
			x, y = GetPlayerMapPos(unitMap)
		end
		
		if (not x) and (not y) then
			x = 0
			y = 0
		end
		
		x = math.floor(100 * x) or 0
		y = math.floor(100 * y) or 0
		
		local eventcount = 0
		if (InCombatLockdown() and eventcount > 25000) or (not InCombatLockdown() and eventcount > 10000) or event == "PLAYER_ENTERING_WORLD" then
			collectgarbage("collect")
			eventcount = 0
		end
	end
	local displayLine
	-- zone and subzone
	if C.datatext.location and C.datatext.location > 0 then
		if (subZoneText ~= "") and (subZoneText ~= zoneText) then
			displayLine = zoneText .. ": " .. subZoneText
			else
			displayLine = subZoneText
			end
		else
			displayLine = subZoneText
		end
		local r, g, b = LocMopColoring()
		if cordson == true then
			Text:SetText(qColor..x.." ".. string.format("|cff%02x%02x%02x%s|r", r*255, g*255, b*255, displayLine)..qColor.." "..y)
		else
			Text:SetText(string.format("|cff%02x%02x%02x%s|r", r*255, g*255, b*255, displayLine))
		end
	end
	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end