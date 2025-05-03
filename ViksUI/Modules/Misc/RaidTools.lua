local T, C, L = unpack(ViksUI)
if C.misc.markbar ~= true then return end

local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local thickness = 1
local CreateBtn = T.CreateBtn
local RaidToolsHeight, RaidToolsWidth = 130, 290

------------------------------------------------------------------------------------------
-- RAIDTOOLS
------------------------------------------------------------------------------------------
-- raid tool background
local raidtoolbg = CreateFrame("Frame", "RaidToolPanel", UIParent)
RaidToolPanel:SetTemplate("Transparent")
RaidToolPanel:SetHeight(RaidToolsHeight)
RaidToolPanel:SetWidth(RaidToolsWidth)

-- Create Tooltip for Dragging
RaidToolPanel:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
    GameTooltip:AddLine("Drag to move")
    GameTooltip:AddLine("Use /ui to store location", 0.8, 0.8, 0.8)
    GameTooltip:Show()
end)

RaidToolPanel:SetMovable(true)
RaidToolPanel:EnableMouse(true)
RaidToolPanel:RegisterForDrag("LeftButton")
RaidToolPanel:SetScript("OnDragStart", function() RaidToolPanel:StartMoving() end)
RaidToolPanel:SetScript("OnDragStop", function() RaidToolPanel:StopMovingOrSizing() end)

if C.panels.NoPanels == true then
	RaidToolPanel:SetPoint(C.position.raid_tool[1], RIGHTChatline, C.position.raid_tool[3], C.position.raid_tool[4] + 100, C.position.raid_tool[5])
	raidtoolbg_point = RIGHTChatline
else
	RaidToolPanel:SetPoint(C.position.raid_tool[1], RChatTab, C.position.raid_tool[3], C.position.raid_tool[4] + 100, C.position.raid_tool[5])
	raidtoolbg_point = RChatTab
end

RaidToolPanel:SetFrameLevel(1)
RaidToolPanel:SetFrameStrata("HIGH")
RaidToolPanel:Hide()

-- Create background Lines for buttons
local function CreateLine(parent, name, width, thickness, anchor, offsetY, text)
    local line = CreateFrame("Frame", name, parent)
    line:SetTemplate()
    line:SetSize(width, thickness)
    line:SetPoint("CENTER", parent, anchor, 0, offsetY)
    line:SetFrameLevel(2)
    line:SetFrameStrata("HIGH")
    line:Hide()

    local label = line:CreateFontString(nil, "OVERLAY")
    label:SetFontObject(CombatLogFont)
    label:SetPoint("LEFT", line, "LEFT", 4, 0)
    label:SetText(text)
    return line
end

local Line01 = CreateLine(RaidToolPanel, "Line01", RaidToolsWidth - 10, thickness, "TOP", -(RaidToolsHeight / 4), "RM:")
local Line02 = CreateLine(RaidToolPanel, "Line02", RaidToolsWidth - 10, thickness, "CENTER", 0, "WM:")
local Line03 = CreateLine(RaidToolPanel, "Line03", RaidToolsWidth - 10, thickness, "TOP", -(RaidToolsHeight / 4) * 3, "Comm:")

-- Raid Markers Text
local Raidmarkertext = Line01:CreateFontString(nil, "OVERLAY")
Raidmarkertext:SetFontObject(CombatLogFont)
Raidmarkertext:SetPoint("LEFT", Line01, "LEFT", 4, 0)
Raidmarkertext:SetText("Raid Marker:")
Raidmarkertext:SetText("RM:")

-- World Markers / Flares Text
local worldmarkerstext = Line02:CreateFontString(nil, "OVERLAY")
worldmarkerstext:SetFontObject(CombatLogFont)
worldmarkerstext:SetPoint("LEFT", Line02, "LEFT", 4, 0)
worldmarkerstext:SetText("WM:")

-- Command line Text
local commandstext = Line03:CreateFontString(nil, "OVERLAY")
commandstext:SetFontObject(CombatLogFont)
commandstext:SetPoint("LEFT", Line03, "LEFT", 4, 0)
commandstext:SetText("Commands:")
commandstext:SetText("Comm:")

-- Create hidden button to show / hide frame 
local ShowHideRaid = CreateFrame("Button", "ShowHideRaid", raidtoolbg_point, "SecureHandlerClickTemplate")
ShowHideRaid:SetTemplate()
ShowHideRaid:SetSize(((RaidToolsWidth+10)/3), 20)
ShowHideRaid:SetFrameLevel(2)
ShowHideRaid:SetFrameStrata("BACKGROUND")
ShowHideRaid:SetAlpha(0)

-- Creating the Text that will display on screen and work as button
local RaidToolsText = raidtoolbg_point:CreateFontString(nil, "OVERLAY")
RaidToolsText:SetFont(C.media.pixel_font, C.media.pixel_font_size-2, C.media.pixel_font_style)
RaidToolsText:SetTextColor(unpack(C.media.pxcolor1))

if C.panels.NoPanels == true then
	ShowHideRaid:SetPoint("CENTER", raidtoolbg_point, "CENTER", 0, -2)
	RaidToolsText:SetPoint("RIGHT", raidtoolbg_point, "RIGHT", -150, -2)
else
	RaidToolsText:SetPoint("RIGHT", raidtoolbg_point, "RIGHT", -150, 0)
	ShowHideRaid:SetPoint("CENTER", raidtoolbg_point, "CENTER", 0, 0)
end

RaidToolsText:SetText("RAID TOOLS")

ShowHideRaid:SetScript("OnEnter", function(self)
RaidToolsText:SetTextColor(class.r, class.g, class.b)
end)

ShowHideRaid:SetScript("OnLeave", function(self)
RaidToolsText:SetTextColor(unpack(C.media.pxcolor1))
end)

-- tooltip Anchor
RaidToolsTooltipAnchor = RaidToolPanel

------------------------------------------------------------------------------------------
-- Raid Markers
------------------------------------------------------------------------------------------
-- Function to create buttons dynamically
local function CreateMarkerButton(parent, name, macroText, texture, point, relativeTo, offsetX, tooltip)
    -- Create the button
    local button = CreateBtn(name, parent, 19, 19, tooltip, "", RaidToolPanel)
    
    -- Set button properties
    button:SetPoint(point, relativeTo, "LEFT", offsetX, 0)
    button:SetAttribute("macrotext", macroText)
    button.icon:SetTexture(texture)

    return button
end

-- Create Clear Markers Button and work as anchor for rest of markers
local clearRaidMarker = CreateBtn("clearraidmarker", Line01, RaidToolsWidth / 5.5, 19, "Clear Target Marker", "Clear", RaidToolPanel)
clearRaidMarker:SetPoint("RIGHT", Line01, "RIGHT", -5, 0)
clearRaidMarker:SetAttribute("macrotext", "/tm 0")

-- Add More Marker Buttons (reusing CreateMarkerButton)
local markerTextures = {
    { tooltip = "Set Raid Marker |cffFFFF00Star|r", texture = [[Interface\AddOns\ViksUI\Media\Markers\star.blp]] },
    { tooltip = "Set Raid Marker |cffFFA500Circle|r", texture = [[Interface\AddOns\ViksUI\Media\Markers\circle.blp]] },
    { tooltip = "Set Raid Marker |cff800080Diamond|r", texture = [[Interface\AddOns\ViksUI\Media\Markers\diamond.blp]] },
    { tooltip = "Set Raid Marker |cff008000Triangle|r", texture = [[Interface\AddOns\ViksUI\Media\Markers\triangle.blp]] },
    { tooltip = "Set Raid Marker |cffCCCCFFMoon|r", texture = [[Interface\AddOns\ViksUI\Media\Markers\moon.blp]] },
    { tooltip = "Set Raid Marker |cff0000FFSquare|r", texture = [[Interface\AddOns\ViksUI\Media\Markers\square.blp]] },
    { tooltip = "Set Raid Marker |cffFF0000Cross|r", texture = [[Interface\AddOns\ViksUI\Media\Markers\cross.blp]] },
    { tooltip = "Set Raid Marker |cffFFFFFFSkull|r", texture = [[Interface\AddOns\ViksUI\Media\Markers\skull.blp]] },
}

-- Function to create buttons dynamically
local previousButton = clearRaidMarker
for i, data in ipairs(markerTextures) do
    previousButton = CreateMarkerButton(Line01, "mbbutton" .. i, "/tm " .. i, data.texture, "RIGHT", previousButton, -5, data.tooltip)
end

------------------------------------------------------------------------------------------
-- World Markers
------------------------------------------------------------------------------------------
-- Data for world markers
local worldMarkerData = {
    { name = "wbbutton08", tooltip = "Set World Marker |cffFFFF00Star|r", texture = [[Interface\AddOns\ViksUI\Media\Flares\yellow.tga]], macro = "/wm 5" },
    { name = "wbbutton07", tooltip = "Set World Marker |cffFF8000Circle|r", texture = [[Interface\AddOns\ViksUI\Media\Flares\orange.tga]], macro = "/wm 6" },
    { name = "wbbutton06", tooltip = "Set World Marker |cffFF00FFDiamond|r", texture = [[Interface\AddOns\ViksUI\Media\Flares\purple.tga]], macro = "/wm 3" },
    { name = "wbbutton05", tooltip = "Set World Marker |cff33FF33Triangle|r", texture = [[Interface\AddOns\ViksUI\Media\Flares\green.tga]], macro = "/wm 2" },
    { name = "wbbutton04", tooltip = "Set World Marker |cffCCCCFFMoon|r", texture = [[Interface\AddOns\ViksUI\Media\Flares\grey.tga]], macro = "/wm 7" },
    { name = "wbbutton03", tooltip = "Set World Marker |cff0080FFSquare|r", texture = [[Interface\AddOns\ViksUI\Media\Flares\blue.tga]], macro = "/wm 1" },
    { name = "wbbutton02", tooltip = "Set World Marker |cffFF0000Cross|r", texture = [[Interface\AddOns\ViksUI\Media\Flares\red.tga]], macro = "/wm 4" },
    { name = "wbbutton01", tooltip = "Set World Marker |cffFFFFFFSkull|r", texture = [[Interface\AddOns\ViksUI\Media\Flares\white.tga]], macro = "/wm 8" },
}

-- Function to create buttons dynamically
local function CreateWorldMarkerButtons(parent, data, anchor, tooltipAnchor)
    local previousButton = anchor
    for _, marker in ipairs(data) do
        -- Check group status
        local tooltip = marker.tooltip
        if not IsInGroup() then
            tooltip = tooltip .. " |cffFF0000(Only available in a party)|r"
        end

        -- Create the button
        local button = CreateBtn(marker.name, parent, 19, 19, tooltip, "", tooltipAnchor or RaidToolsTooltipAnchor)
        button.icon:SetTexture(marker.texture)
        button:SetAttribute("macrotext", marker.macro)

        -- Position the button
        if previousButton then
            button:SetPoint("RIGHT", previousButton, "LEFT", -5, 0)
        else
            button:SetPoint("LEFT", parent, "LEFT", 5, 0)
        end

        previousButton = button
    end
end

-- Create clear world markers button
local clearWorldMarkers = CreateBtn("clearworldmarkers", Line02, RaidToolsWidth / 5.5, 19, "Clear World Markers", "Clear", RaidToolsTooltipAnchor)
clearWorldMarkers:SetPoint("RIGHT", Line02, "RIGHT", -5, 0)
clearWorldMarkers:SetAttribute("macrotext", "/cwm 0")

-- Create world marker buttons
CreateWorldMarkerButtons(Line02, worldMarkerData, clearWorldMarkers, RaidToolsTooltipAnchor)

------------------------------------------------------------------------------------------
-- Raid Commands
------------------------------------------------------------------------------------------
-- Data for raid command buttons
local raidCommandButtons = {
    {
        name = "pulltimer",
        tooltip = "Start a DBM pull timer",
        text = "Pull",
        macro = "/dbm pull 10",
        size = { width = RaidToolsWidth / 5.5, height = 19 },
        texture = nil,
    },
    {
        name = "mainassistbutton",
        tooltip = "Set Main Assist",
        text = "",
        macro = "/ma",
        size = { width = RaidToolsWidth / 6, height = 19 },
        texture = [[Interface\AddOns\ViksUI\Media\Roleicons\mainassist.tga]],
    },
    {
        name = "maintankbutton",
        tooltip = "Set Main Tank",
        text = "",
        macro = "/mt",
        size = { width = RaidToolsWidth / 6, height = 19 },
        texture = [[Interface\AddOns\ViksUI\Media\Roleicons\tank2.tga]],
    },
    {
        name = "rcbutton",
        tooltip = "Start a readycheck",
        text = "",
        macro = "/readycheck",
        size = { width = RaidToolsWidth / 6, height = 19 },
        texture = [[Interface\AddOns\ViksUI\Media\Roleicons\readycheck.tga]],
        iconSize = { width = 34, height = 17 },
    },
}

-- Function to create raid command buttons dynamically
local function CreateRaidCommandButtons(parent, buttonsData, tooltipAnchor)
    local previousButton = nil -- Start with no previous button
    for i, buttonData in ipairs(buttonsData) do
        -- Check if the player is in a group
        local tooltip = buttonData.tooltip
        if not IsInGroup() then
            tooltip = tooltip .. " |cffFF0000(Only available in a party)|r"
        end

        -- Create the button
        local button = CreateBtn(buttonData.name, parent, buttonData.size.width, buttonData.size.height, tooltip, buttonData.text, tooltipAnchor)
        button:SetAttribute("macrotext", buttonData.macro)

        -- Position the button
        if i == 1 then
            -- First button is anchored to the RIGHT of the parent
            button:SetPoint("RIGHT", parent, "RIGHT", -5, 0)
        else
            -- Subsequent buttons are anchored to the LEFT of the previous button
            button:SetPoint("RIGHT", previousButton, "LEFT", -5, 0)
        end

        -- Set texture if applicable
        if buttonData.texture then
            button.icon:SetTexture(buttonData.texture)
        end

        -- Set custom icon size if specified
        if buttonData.iconSize then
            button.icon:SetSize(buttonData.iconSize.width, buttonData.iconSize.height)
        end

        -- Update the reference for the previous button
        previousButton = button
    end
end

-- Generate the raid command buttons dynamically
CreateRaidCommandButtons(Line03, raidCommandButtons, Line03, RaidToolsTooltipAnchor)

-- Register frames with the secure button
ShowHideRaid:SetFrameRef("RaidToolPanel", RaidToolPanel)
ShowHideRaid:SetFrameRef("Line01", Line01)
ShowHideRaid:SetFrameRef("Line02", Line02)
ShowHideRaid:SetFrameRef("Line03", Line03)
------------------------------------------------------------------------------------------
-- SHOW HIDE FUNCTIONALITY 
------------------------------------------------------------------------------------------
-- Add secure scripts for combat-safe visibility toggling
ShowHideRaid:SetAttribute("_onclick", [=[
	if self:GetFrameRef("RaidToolPanel"):IsShown() then
		self:GetFrameRef("RaidToolPanel"):Hide()
		self:GetFrameRef("Line01"):Hide()
		self:GetFrameRef("Line02"):Hide()
		self:GetFrameRef("Line03"):Hide()
	else
		self:GetFrameRef("RaidToolPanel"):Show()
		self:GetFrameRef("Line01"):Show()
		self:GetFrameRef("Line02"):Show()
		self:GetFrameRef("Line03"):Show()
	end
]=])
------------------------------------------------------------------------------------------
-- UI TOOLS MODULE
------------------------------------------------------------------------------------------
CreateBtn("ShowHideTools", raidtoolbg_point, ((RaidToolsWidth+10)/3), 20, "", "")
ShowHideTools:SetAttribute("macrotext", "/config")
ShowHideTools:SetAlpha(0)

local ToolsText = raidtoolbg_point:CreateFontString(nil, "OVERLAY")
ToolsText:SetFont(C.media.pixel_font, C.media.pixel_font_size-2, C.media.pixel_font_style)
ToolsText:SetTextColor(unpack(C.media.pxcolor1))

ToolsText:SetText("UI TOOLS")
if C.panels.NoPanels == true then
ShowHideTools:SetPoint("RIGHT", raidtoolbg_point, "RIGHT", 0, -2)
ToolsText:SetPoint("RIGHT", raidtoolbg_point, "RIGHT", -28, -2)
else
ShowHideTools:SetPoint("RIGHT", raidtoolbg_point, "RIGHT", 0, 0)
ToolsText:SetPoint("RIGHT", raidtoolbg_point, "RIGHT", -28, 0)
end

ShowHideTools:SetScript("OnEnter", function(self)
	ToolsText:SetTextColor(class.r, class.g, class.b)
end)

ShowHideTools:SetScript("OnLeave", function(self)
	ToolsText:SetTextColor(unpack(C.media.pxcolor1))	
end)