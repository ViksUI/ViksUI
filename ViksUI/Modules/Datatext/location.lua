local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- Location and Coords
--------------------------------------------------------------------
if not C.datatext.location and not C.datatext.location > 0 then return end

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

local mapRects, tempVec2D = {}, CreateVector2D(0, 0)
local function GetPlayerMapPos(mapID)
	tempVec2D.x, tempVec2D.y = UnitPosition("player")
	if not tempVec2D.x then return end

	local mapRect = mapRects[mapID]
	if not mapRect then
		local _, pos1 = C_Map.GetWorldPosFromMapPos(mapID, CreateVector2D(0, 0))
		local _, pos2 = C_Map.GetWorldPosFromMapPos(mapID, CreateVector2D(1, 1))
		if not pos1 or not pos2 then return end
		mapRect = {pos1, pos2}
		mapRect[2]:Subtract(mapRect[1])
		mapRects[mapID] = mapRect
	end
	tempVec2D:Subtract(mapRect[1])

	return (tempVec2D.y/mapRect[2].y), (tempVec2D.x/mapRect[2].x)
end

local int = 0
local function Update(self, t)
	local subZoneText = GetMinimapZoneText() or ""
	local zoneText = _G.GetRealZoneText() or _G.UNKNOWN;
	local _, instanceType = IsInInstance()

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
	if instanceType == "raid" or instanceType == "party" then
		x = 0
		y = 0
		Text:SetText(string.format("|cff%02x%02x%02x%s|r", r*255, g*255, b*255, displayLine))
	else
		int = int + 1
		if int >= 3 then
			local unitMap = C_Map.GetBestMapForUnit("player")
			--local x, y = 0, 0

			if unitMap then
				x, y = GetPlayerMapPos(unitMap)
			end
			if (not x) and (not y) then
				x = 0
				y = 0
			end
			
			x = math.floor(100 * x) or 0
			y = math.floor(100 * y) or 0	
			if C.datatext.showcoords == true then
				Text:SetText(qColor..x.." ".. string.format("|cff%02x%02x%02x%s|r", r*255, g*255, b*255, displayLine)..qColor.." "..y)
			else
				Text:SetText(string.format("|cff%02x%02x%02x%s|r", r*255, g*255, b*255, displayLine))
			end
			int = 0
		end
	end
end

Stat:SetScript("OnUpdate", Update)
Update(Stat, 10)