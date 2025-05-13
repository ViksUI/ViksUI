local T, C, L = unpack(ViksUI)

-- Exit early if the location datatext is disabled
if not C.datatext.location or C.datatext.location <= 0 then return end

-- Create the Stat frame
local Stat = CreateFrame("Frame", "DataTextLocation", UIParent)
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)
Stat:EnableMouse(true)

-- Create the FontString for displaying location information
local Text = Stat:CreateFontString(nil, "OVERLAY")
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(
    C.datatext.location >= 9 and C.media.pxfontHeader or C.media.pixel_font,
    C.datatext.location >= 9 and C.media.pxfontHsize or C.media.pixel_font_size,
    C.datatext.location >= 9 and C.media.pxfontHFlag or C.media.pixel_font_style
)

PP(C.datatext.location, Text)

-- UI Setup
local function SetupStatFrame()
    local Stat = CreateFrame("Frame", "DataTextLocation", UIParent)
    Stat:EnableMouse(true)
    Stat:SetFrameStrata("BACKGROUND")
    Stat:SetFrameLevel(3)

    local Text = Stat:CreateFontString(nil, "OVERLAY")
    Stat.text = Text

    if C.datatext.location >= 9 then
        Text:SetTextColor(unpack(C.media.pxcolor1))
        Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
    else
        Text:SetTextColor(unpack(C.media.pxcolor1))
        Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
    end

    PP(C.datatext.location, Text)
    return Stat, Text
end

-- Function to determine zone coloring based on PVP type
local function GetZoneColor()
    local pvpType = GetZonePVPInfo()
    if pvpType == "arena" or pvpType == "combat" or pvpType == "hostile" then
        return 0.84, 0.03, 0.03 -- Red
    elseif pvpType == "friendly" then
        return 0.05, 0.85, 0.03 -- Green
    elseif pvpType == "contested" then
        return 0.9, 0.85, 0.05 -- Yellow
    elseif pvpType == "sanctuary" then
        return 0.035, 0.58, 0.84 -- Blue
    else
        return 1, 1, 0 -- Default Yellow
    end
end

-- Cache for map rectangles
local mapRects, tempVec2D = {}, CreateVector2D(0, 0)

-- Function to get the player's map position
local function GetPlayerMapPosition(mapID)
    if not mapID then return 0, 0 end

    tempVec2D.x, tempVec2D.y = UnitPosition("player")
    if not tempVec2D.x then return 0, 0 end

    -- Retrieve or calculate the map rectangle
    local mapRect = mapRects[mapID]
    if not mapRect then
        local _, pos1 = C_Map.GetWorldPosFromMapPos(mapID, CreateVector2D(0, 0))
        local _, pos2 = C_Map.GetWorldPosFromMapPos(mapID, CreateVector2D(1, 1))
        if not pos1 or not pos2 then return 0, 0 end

        mapRect = { pos1, pos2 }
        mapRect[2]:Subtract(mapRect[1])
        mapRects[mapID] = mapRect
    end

    tempVec2D:Subtract(mapRect[1])
    return (tempVec2D.y / mapRect[2].y), (tempVec2D.x / mapRect[2].x)
end

-- Update function for the Stat frame
local function Update(self, elapsed)
    self.elapsed = (self.elapsed or 0) + elapsed
    if self.elapsed < 0.3 then return end -- Throttle updates to every 0.3 seconds
    self.elapsed = 0

    local subZoneText = GetMinimapZoneText() or ""
    local zoneText = _G.GetRealZoneText() or _G.UNKNOWN
    local displayLine = (subZoneText ~= "" and subZoneText ~= zoneText) and (zoneText .. ": " .. subZoneText) or subZoneText

    local r, g, b = GetZoneColor()
    local _, instanceType = IsInInstance()

    if instanceType == "raid" or instanceType == "party" then
        Text:SetText(string.format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, displayLine))
    else
        local unitMap = C_Map.GetBestMapForUnit("player")
        local x, y = GetPlayerMapPosition(unitMap)
        x, y = math.floor(100 * x), math.floor(100 * y)

        if C.datatext.showcoords then
            Text:SetText(string.format("%s%d %s |cff%02x%02x%02x%s|r %s%d", qColor, x, qColor, r * 255, g * 255, b * 255, displayLine, qColor, y))
        else
            Text:SetText(string.format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, displayLine))
        end
    end
end

-- Function to insert detailed location into the chat edit box
local function InsertLocationInChat()
    if ChatFrame1EditBox:IsShown() then -- Check if the chat edit box is open
        local subZoneText = GetMinimapZoneText() or ""
        local zoneText = _G.GetRealZoneText() or _G.UNKNOWN
        local pvpType = GetZonePVPInfo() or "unknown"
        local _, instanceType = IsInInstance()
        local unitMap = C_Map.GetBestMapForUnit("player")
        local x, y = GetPlayerMapPosition(unitMap)
        x, y = math.floor(100 * x), math.floor(100 * y)

        -- Construct detailed location text
        local locationText = string.format("Zone: %s, Sub-zone: %s, PVP Type: %s, Coordinates: %d, %d", 
            zoneText, 
            subZoneText, 
            pvpType, 
            x, 
            y
        )

        -- Insert the location text into the chat edit box
        ChatFrame1EditBox:Insert(locationText)
    else
        print("Chat edit box is not open.") -- Optional message if the chat box is not open
    end
end

-- Add a keybinding or button to trigger the function (example: left-click on the Stat text)
Text:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        InsertLocationInChat() -- Call the function when left-clicking the text
    end
end)

-- Function to insert a clickable map pin into the current chat edit box
local function InsertMapPinIntoChat()
    local c, p = C_Map, "player"
    local mapID = c.GetBestMapForUnit(p) -- Get the player's current map ID
    if not mapID then
        print("Unable to determine your current map.") -- Error handling
        return
    end

    local position = c.GetPlayerMapPosition(mapID, p) -- Get the player's position
    if not position then
        print("Unable to determine your current position.") -- Error handling
        return
    end

    -- Set the user waypoint
    c.SetUserWaypoint({ position = position, uiMapID = mapID })

    -- Generate the clickable map pin link
    local mapPinLink = c.GetUserWaypointHyperlink()

    -- Check if the chat edit box is open
    if ChatFrame1EditBox:IsShown() then
        -- Insert the map pin into the chat edit box
        ChatFrame1EditBox:Insert(mapPinLink)
    else
        print("Chat edit box is not open.") -- Optional message if the chat box is not open
    end
end

-- Right-click functionality to insert the map pin into the chat edit box
Text:SetScript("OnMouseUp", function(self, button)
    if button == "RightButton" then
        InsertMapPinIntoChat() -- Insert the map pin into the chat edit box
    elseif button == "LeftButton" then
        InsertLocationInChat() -- Insert detailed location on left-click
    end
end)

-- Tooltip for clarity on functionality
Text:SetScript("OnEnter", function(self)
    local subZoneText = GetMinimapZoneText() or ""
    local zoneText = _G.GetRealZoneText() or _G.UNKNOWN
    local pvpType = GetZonePVPInfo() or "unknown"
    local _, instanceType = IsInInstance()
    local r, g, b = GetZoneColor()

    GameTooltip:SetOwner(self, "ANCHOR_NONE") -- Remove default anchoring
    GameTooltip:ClearAllPoints() -- Clear previous positions
    GameTooltip:SetPoint("TOP", self, "BOTTOM", 0, -4) -- Place it below the text with a large offset downwards
    GameTooltip:ClearLines()

    -- Title with highlight
    GameTooltip:AddLine("Location Details", 1, 0.8, 0)
    GameTooltip:AddLine(" ") -- Spacer line

    -- Highlighted Zone Information
    GameTooltip:AddDoubleLine("Zone:", zoneText, 1, 1, 0, r, g, b)
    GameTooltip:AddDoubleLine("Sub-zone:", subZoneText, 1, 1, 0, 0.9, 0.9, 0.9)

    -- PVP Type with color coding
    local pvpColor = pvpType == "friendly" and {0, 1, 0} or
                     pvpType == "hostile" and {1, 0, 0} or
                     pvpType == "contested" and {1, 1, 0} or
                     {0.5, 0.5, 0.5}

    GameTooltip:AddDoubleLine("PVP Type:", pvpType, 1, 1, 0, unpack(pvpColor))

    -- Instance Type Information
    if instanceType and (instanceType == "raid" or "party") then
        GameTooltip:AddDoubleLine("Instance Type:", instanceType, 1, 1, 0, 0.3, 0.7, 1)
    else
        local unitMap = C_Map.GetBestMapForUnit("player")
        local x, y = GetPlayerMapPosition(unitMap)
        x, y = math.floor(100 * x), math.floor(100 * y)
        GameTooltip:AddDoubleLine("Coordinates:", string.format("%d, %d", x, y), 1, 1, 0, 0.3, 0.7, 1)
    end

    -- Add a note about map pin functionality
    GameTooltip:AddLine(" ")
	GameTooltip:AddLine("Tips: (Editbox must be open)", r, g, b)
    GameTooltip:AddLine("Left-click: Insert location in chat", 0.8, 0.8, 0.8)
    GameTooltip:AddLine("Right-click: Send map pin in chat", 0.8, 0.8, 0.8)

    GameTooltip:Show()
end)

Text:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)
-- Attach tooltip handlers to the Stat frame
Stat:SetScript("OnEnter", OnEnter)
Stat:SetScript("OnLeave", OnLeave)

-- Set the OnUpdate script for the Stat frame
Stat:SetScript("OnUpdate", Update)