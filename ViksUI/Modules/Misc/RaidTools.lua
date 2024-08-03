local T, C, L = unpack(ViksUI)
if C.misc.markbar ~= true then return end
------------------------------------------------------------------------------------------
-- Credit to MaxUI
------------------------------------------------------------------------------------------

--setting up RAID TOOLS.

------------------------------------------------------------------------------------------
-- LOCALS/VARIABLES/FUNCTIONS
local T, C, L = unpack(ViksUI)
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local thickness = 1
local CreateBtn = T.CreateBtn
local RaidToolsHeight = 130
local RaidToolsWidth = 290

if C.panels.NoPanels == true then  -- Quick Solution - Todo 
------------------------------------------------------------------------------------------
-- RAIDTOOLS
------------------------------------------------------------------------------------------
-- raid tool background
local raidtoolbg = CreateFrame("Frame", "raidtoolbg", UIParent)
raidtoolbg:SetTemplate("Transparent")
raidtoolbg:SetHeight(RaidToolsHeight)
raidtoolbg:SetWidth(RaidToolsWidth)

raidtoolbg:SetMovable(true)
raidtoolbg:EnableMouse(true)
raidtoolbg:RegisterForDrag("LeftButton")
raidtoolbg:SetScript("OnDragStart", function() raidtoolbg:StartMoving() end)
raidtoolbg:SetScript("OnDragStop", function() raidtoolbg:StopMovingOrSizing() end)


raidtoolbg:SetPoint("TOP", RIGHTChatline, "TOP", 4, -10)

raidtoolbg:SetFrameLevel(1)
raidtoolbg:SetFrameStrata("HIGH")
raidtoolbg:Hide()

-- Raid Markers
local Line01 = CreateFrame("Frame", "Line01", UIParent)
Line01:SetTemplate()
Line01:SetSize(RaidToolsWidth-10, thickness)
Line01:SetPoint("CENTER", raidtoolbg, "TOP", 0, -(RaidToolsHeight/4))
Line01:SetFrameLevel(2)
Line01:SetFrameStrata("HIGH")
Line01:SetAlpha(1)
Line01:Hide()

local Raidmarkertext = Line01:CreateFontString(nil, "OVERLAY")
Raidmarkertext:SetFontObject(CombatLogFont)
Raidmarkertext:SetPoint("LEFT", Line01, "LEFT", 4, 0)
Raidmarkertext:SetText("Raid Marker:")
Raidmarkertext:SetText("RM:")

-- world markers
local Line02 = CreateFrame("Frame", "Line02", UIParent)
Line02:SetTemplate()
Line02:SetSize(RaidToolsWidth-10, thickness)
Line02:SetPoint("CENTER", raidtoolbg, "CENTER", 0, 0)
Line02:SetFrameLevel(2)
Line02:SetFrameStrata("HIGH")
Line02:SetAlpha(1)
Line02:Hide()

local worldmarkerstext = Line02:CreateFontString(nil, "OVERLAY")
worldmarkerstext:SetFontObject(CombatLogFont)
worldmarkerstext:SetPoint("LEFT", Line02, "LEFT", 4, 0)
worldmarkerstext:SetText("WM:")

-- commands
local Line03 = CreateFrame("Frame", "Line03", UIParent)
Line03:SetTemplate()
Line03:SetSize(RaidToolsWidth-10, thickness)
Line03:SetPoint("CENTER", raidtoolbg, "TOP", 0, -(RaidToolsHeight/4)*3)
Line03:SetFrameLevel(2)
Line03:SetFrameStrata("HIGH")
Line03:SetAlpha(1)
Line03:Hide()

local commandstext = Line03:CreateFontString(nil, "OVERLAY")
commandstext:SetFontObject(CombatLogFont)
commandstext:SetPoint("LEFT", Line03, "LEFT", 4, 0)
commandstext:SetText("Commands:")
commandstext:SetText("Comm:")

-- show hide button
local ShowHideRaid = CreateFrame("Button", "ShowHideRaid", RIGHTChatline)
ShowHideRaid:SetTemplate()
ShowHideRaid:SetSize(((RaidToolsWidth+10)/3), 20)
ShowHideRaid:SetPoint("CENTER", RIGHTChatline, "CENTER", 0, -2)
ShowHideRaid:SetFrameLevel(2)
ShowHideRaid:SetFrameStrata("BACKGROUND")
ShowHideRaid:SetAlpha(0)

local RaidToolsText = RIGHTChatline:CreateFontString(nil, "OVERLAY")
RaidToolsText:SetFont(C.media.pixel_font, C.media.pixel_font_size-2, C.media.pixel_font_style)
RaidToolsText:SetTextColor(unpack(C.media.pxcolor1))
RaidToolsText:SetPoint("RIGHT", RIGHTChatline, "RIGHT", -150, -2)
RaidToolsText:SetText("RAID TOOLS")
		
--RIGHTChatline.iconmiddle = RIGHTChatline:CreateTexture(nil, "OVERLAY")
--RIGHTChatline.iconmiddle:SetSize(17, 17)
--RIGHTChatline.iconmiddle:SetPoint("RIGHT", RaidToolsText, "LEFT", -4, -2)
--RIGHTChatline.iconmiddle:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\skull.blp]])
--RIGHTChatline.iconmiddle:SetVertexColor(unpack(C.media.pxcolor1))

ShowHideRaid:SetScript("OnEnter", function(self)
RaidToolsText:SetTextColor(class.r, class.g, class.b)
--RIGHTChatline.iconmiddle:SetVertexColor(class.r, class.g, class.b)
end)

ShowHideRaid:SetScript("OnLeave", function(self)
RaidToolsText:SetTextColor(unpack(C.media.pxcolor1))
--RIGHTChatline.iconmiddle:SetVertexColor(unpack(C.media.pxcolor1))
end)

-- tooltip Anchor
RaidToolsTooltipAnchor = raidtoolbg
		
------------------------------------------------------------------------------------------
-- Raid Markers
------------------------------------------------------------------------------------------
-- Button Clear Raid Marker
CreateBtn("clearraidmarker", Line01, RaidToolsWidth/5.5, 19, "Clear Target Marker", "Clear", RaidToolsTooltipAnchor)
clearraidmarker:SetPoint("RIGHT", Line01, "RIGHT", -5, 0)
clearraidmarker:SetAttribute("macrotext", "/tm 0")

-- Button 8 - Yellow Star
CreateBtn("mbbutton08", Line01, 19, 19, "Set Raid Marker |cffFFFF00STAR|r", "", RaidToolsTooltipAnchor)
mbbutton08:SetPoint("RIGHT", clearraidmarker, "LEFT", -5, 0)
mbbutton08:SetAttribute("macrotext", "/tm 1")
mbbutton08.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\star.blp]])

-- Button 7 - Orange/Circle
CreateBtn("mbbutton07", Line01, 19, 19, "Set Raid Marker |cffFF8000CIRCLE|r", "", RaidToolsTooltipAnchor)
mbbutton07:SetPoint("RIGHT", mbbutton08, "LEFT", -5, 0)
mbbutton07:SetAttribute("macrotext", "/tm 2")
mbbutton07.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\circle.blp]])

-- Button 6 - Purple/Diamond
CreateBtn("mbbutton06", Line01, 19, 19, "Set Raid Marker |cffFF00FFDIAMOND|r", "", RaidToolsTooltipAnchor)
mbbutton06:SetPoint("RIGHT", mbbutton07, "LEFT", -5, 0)
mbbutton06:SetAttribute("macrotext", "/tm 3")
mbbutton06.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\diamond.blp]])

-- Button 5 - Green/Triangle
CreateBtn("mbbutton05", Line01, 19, 19, "Set Raid Marker |cff33FF33TRIANGLE|r", "", RaidToolsTooltipAnchor)
mbbutton05:SetPoint("RIGHT", mbbutton06, "LEFT", -5, 0)
mbbutton05:SetAttribute("macrotext", "/tm 4")
mbbutton05.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\triangle.blp]])

-- Button 4 - Grey/Moon
CreateBtn("mbbutton04", Line01, 19, 19, "Set Raid Marker |cffCCCCFFMOON|r", "", RaidToolsTooltipAnchor)
mbbutton04:SetPoint("RIGHT", mbbutton05, "LEFT", -5, 0)
mbbutton04:SetAttribute("macrotext", "/tm 5")
mbbutton04.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\moon.blp]])

-- Button 3 - Blue/Square
CreateBtn("mbbutton03", Line01, 19, 19, "Set Raid Marker |cff0080FFSQUARE|r", "", RaidToolsTooltipAnchor)
mbbutton03:SetPoint("RIGHT", mbbutton04, "LEFT", -5, 0)
mbbutton03:SetAttribute("macrotext", "/tm 6")
mbbutton03.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\square.blp]])

-- Button 2 - Red/Cross
CreateBtn("mbbutton02", Line01, 19, 19, "Set Raid Marker |cffFF0000CROSS|r", "", RaidToolsTooltipAnchor)
mbbutton02:SetPoint("RIGHT", mbbutton03, "LEFT", -5, 0)
mbbutton02:SetAttribute("macrotext", "/tm 7")
mbbutton02.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\cross.blp]])

-- Button 1 - White/Skull
CreateBtn("mbbutton01", Line01, 19, 19, "Set Raid Marker |cffFFFFFFSKULL|r", "", RaidToolsTooltipAnchor)
mbbutton01:SetPoint("RIGHT", mbbutton02, "LEFT", -5, 0)
mbbutton01:SetAttribute("macrotext", "/tm 8")
mbbutton01.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\skull.blp]])

------------------------------------------------------------------------------------------
-- World Markers / flares
------------------------------------------------------------------------------------------
-- Button clearworldmarkers
CreateBtn("clearworldmarkers", Line02, RaidToolsWidth/5.5, 19, "Clear World Markers", "Clear", RaidToolsTooltipAnchor)
clearworldmarkers:SetPoint("RIGHT", Line02, "RIGHT", -5, 0)
clearworldmarkers:SetAttribute("macrotext", "/cwm 0")

-- Button 8 - yellow/star
CreateBtn("wbbutton08", Line02, 19, 19, "Set World Marker |cffFFFF00STAR|r", "", RaidToolsTooltipAnchor)
wbbutton08:SetPoint("RIGHT", clearworldmarkers, "LEFT", -5, 0)
wbbutton08:SetAttribute("macrotext", "/wm 5")
wbbutton08.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\yellow.tga]])

-- Button 7 - orange/circle
CreateBtn("wbbutton07", Line02, 19, 19, "Set World Marker |cffFF8000CIRCLE|r", "", RaidToolsTooltipAnchor)
wbbutton07:SetPoint("RIGHT", wbbutton08, "LEFT", -5, 0)
wbbutton07:SetAttribute("macrotext", "/wm 6")
wbbutton07.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\orange.tga]])

-- Button 6 - purple/diamond
CreateBtn("wbbutton06", Line02, 19, 19, "Set World Marker |cffFF00FFDIAMOND|r", "", RaidToolsTooltipAnchor)
wbbutton06:SetPoint("RIGHT", wbbutton07, "LEFT", -5, 0)
wbbutton06:SetAttribute("macrotext", "/wm 3")
wbbutton06.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\purple.tga]])

-- Button 5 - green/triangle
CreateBtn("wbbutton05", Line02, 19, 19, "Set World Marker |cff33FF33TRIANGLE|r", "", RaidToolsTooltipAnchor)
wbbutton05:SetPoint("RIGHT", wbbutton06, "LEFT", -5, 0)
wbbutton05:SetAttribute("macrotext", "/wm 2")
wbbutton05.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\green.tga]])

-- Button 4 - gray/moon
CreateBtn("wbbutton04", Line02, 19, 19, "Set World Marker |cffCCCCFFMOON|r", "", RaidToolsTooltipAnchor)
wbbutton04:SetPoint("RIGHT", wbbutton05, "LEFT", -5, 0)
wbbutton04:SetAttribute("macrotext", "/wm 7")
wbbutton04.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\grey.tga]])

-- Button 3 - blue/square
CreateBtn("wbbutton03", Line02, 19, 19, "Set World Marker |cff0080FFSQUARE|r", "", RaidToolsTooltipAnchor)
wbbutton03:SetPoint("RIGHT", wbbutton04, "LEFT", -5, 0)
wbbutton03:SetAttribute("macrotext", "/wm 1")
wbbutton03.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\blue.tga]])

-- Button 2 - Red/Cross
CreateBtn("wbbutton02", Line02, 19, 19, "Set World Marker |cffFF0000CROSS|r", "", RaidToolsTooltipAnchor)
wbbutton02:SetPoint("RIGHT", wbbutton03, "LEFT", -5, 0)
wbbutton02:SetAttribute("macrotext", "/wm 4")
wbbutton02.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\red.tga]])

-- Button 1 - White/Skull
CreateBtn("wbbutton01", Line02, 19, 19, "Set World Marker |cffFFFFFFSKULL|r", "", RaidToolsTooltipAnchor)
wbbutton01:SetPoint("RIGHT", wbbutton02, "LEFT", -5, 0)
wbbutton01:SetAttribute("macrotext", "/wm 8")
wbbutton01.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\white.tga]])
		
------------------------------------------------------------------------------------------
-- Raid Commands
------------------------------------------------------------------------------------------
-- Pull Timer
CreateBtn("pulltimer", Line03, RaidToolsWidth/5.5, 19, "Start a DBM pull timer", "Pull", RaidToolsTooltipAnchor)
pulltimer:SetPoint("RIGHT", Line03, "RIGHT", -5, 0)
pulltimer:SetAttribute("macrotext", "/dbm pull 10")

-- Button Set Main Assist
CreateBtn("mainassistbutton", Line03, RaidToolsWidth/6, 19, "Set Main Assist", "", RaidToolsTooltipAnchor)
mainassistbutton:SetPoint("RIGHT", pulltimer, "LEFT", -5, 0)
mainassistbutton:SetAttribute("macrotext", "/ma")
	mainassistbutton.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Roleicons\mainassist.tga]])

-- Button Set Main Tank
CreateBtn("maintankbutton", Line03, RaidToolsWidth/6, 19, "Set Main Tank", "", RaidToolsTooltipAnchor)
maintankbutton:SetPoint("RIGHT", mainassistbutton, "LEFT", -5, 0)
maintankbutton:SetAttribute("macrotext", "/mt")
	maintankbutton.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Roleicons\tank2.tga]])

-- Button Readycheck
CreateBtn("rcbutton", Line03, RaidToolsWidth/6, 19, "Start a readycheck", "", RaidToolsTooltipAnchor)
rcbutton:SetPoint("RIGHT", maintankbutton, "LEFT", -5, 0)
rcbutton:SetAttribute("macrotext", "/readycheck")
rcbutton.icon:SetSize(34, 17)
rcbutton.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Roleicons\readycheck.tga]])

------------------------------------------------------------------------------------------
-- SHOW HIDE FUNCTIONALITY 
------------------------------------------------------------------------------------------
ShowHideRaid:SetScript("OnMouseDown", function(self)
	
	if raidtoolbg:IsShown() then
		raidtoolbg:Hide()
		Line01:Hide()
		Line02:Hide()
		Line03:Hide()
	else
		raidtoolbg:Show()
		Line01:Show()
		Line02:Show()
		Line03:Show()
	end
end)
		

------------------------------------------------------------------------------------------
-- UI TOOLS MODULE
------------------------------------------------------------------------------------------
CreateBtn("ShowHideTools", RIGHTChatline, ((RaidToolsWidth+10)/3), 20, "", "")
ShowHideTools:SetPoint("RIGHT", RIGHTChatline, "RIGHT", 0, -2)
ShowHideTools:SetAttribute("macrotext", "/config")
ShowHideTools:SetAlpha(0)

local ToolsText = RIGHTChatline:CreateFontString(nil, "OVERLAY")
ToolsText:SetFont(C.media.pixel_font, C.media.pixel_font_size-2, C.media.pixel_font_style)
ToolsText:SetTextColor(unpack(C.media.pxcolor1))
ToolsText:SetPoint("RIGHT", RIGHTChatline, "RIGHT", -28, -2)
ToolsText:SetText("UI TOOLS")

--RIGHTChatline.iconright = RIGHTChatline:CreateTexture(nil, "OVERLAY")
--RIGHTChatline.iconright:SetSize(17, 17)
--RIGHTChatline.iconright:SetPoint("RIGHT", RIGHTChatline, "RIGHT", -12, -2)
--RIGHTChatline.iconright:SetTexture([[Interface\AddOns\ViksUI\Media\Menuicons\acp.tga]])

ShowHideTools:SetScript("OnEnter", function(self)
	ToolsText:SetTextColor(class.r, class.g, class.b)
	--RIGHTChatline.iconright:SetVertexColor(class.r, class.g, class.b)
end)

ShowHideTools:SetScript("OnLeave", function(self)
	ToolsText:SetTextColor(unpack(C.media.pxcolor1))
	--RIGHTChatline.iconright:SetVertexColor(1, 1, 1)	
end)

else

------------------------------------------------------------------------------------------
-- RAIDTOOLS
------------------------------------------------------------------------------------------
-- raid tool background
local raidtoolbg = CreateFrame("Frame", "raidtoolbg", UIParent)
raidtoolbg:SetTemplate("Transparent")
raidtoolbg:SetHeight(RaidToolsHeight)
raidtoolbg:SetWidth(RaidToolsWidth)

raidtoolbg:SetMovable(true)
raidtoolbg:EnableMouse(true)
raidtoolbg:RegisterForDrag("LeftButton")
raidtoolbg:SetScript("OnDragStart", function() raidtoolbg:StartMoving() end)
raidtoolbg:SetScript("OnDragStop", function() raidtoolbg:StopMovingOrSizing() end)


raidtoolbg:SetPoint("TOP", RChatTab, "TOP", 4, -10)

raidtoolbg:SetFrameLevel(1)
raidtoolbg:SetFrameStrata("HIGH")
raidtoolbg:Hide()

-- Raid Markers
local Line01 = CreateFrame("Frame", "Line01", UIParent)
Line01:SetTemplate()
Line01:SetSize(RaidToolsWidth-10, thickness)
Line01:SetPoint("CENTER", raidtoolbg, "TOP", 0, -(RaidToolsHeight/4))
Line01:SetFrameLevel(2)
Line01:SetFrameStrata("HIGH")
Line01:SetAlpha(1)
Line01:Hide()

local Raidmarkertext = Line01:CreateFontString(nil, "OVERLAY")
Raidmarkertext:SetFontObject(CombatLogFont)
Raidmarkertext:SetPoint("LEFT", Line01, "LEFT", 4, 0)
Raidmarkertext:SetText("Raid Marker:")
Raidmarkertext:SetText("RM:")

-- world markers
local Line02 = CreateFrame("Frame", "Line02", UIParent)
Line02:SetTemplate()
Line02:SetSize(RaidToolsWidth-10, thickness)
Line02:SetPoint("CENTER", raidtoolbg, "CENTER", 0, 0)
Line02:SetFrameLevel(2)
Line02:SetFrameStrata("HIGH")
Line02:SetAlpha(1)
Line02:Hide()

local worldmarkerstext = Line02:CreateFontString(nil, "OVERLAY")
worldmarkerstext:SetFontObject(CombatLogFont)
worldmarkerstext:SetPoint("LEFT", Line02, "LEFT", 4, 0)
worldmarkerstext:SetText("WM:")

-- commands
local Line03 = CreateFrame("Frame", "Line03", UIParent)
Line03:SetTemplate()
Line03:SetSize(RaidToolsWidth-10, thickness)
Line03:SetPoint("CENTER", raidtoolbg, "TOP", 0, -(RaidToolsHeight/4)*3)
Line03:SetFrameLevel(2)
Line03:SetFrameStrata("HIGH")
Line03:SetAlpha(1)
Line03:Hide()

local commandstext = Line03:CreateFontString(nil, "OVERLAY")
commandstext:SetFontObject(CombatLogFont)
commandstext:SetPoint("LEFT", Line03, "LEFT", 4, 0)
commandstext:SetText("Commands:")
commandstext:SetText("Comm:")

-- show hide button
local ShowHideRaid = CreateFrame("Button", "ShowHideRaid", RChatTab)
ShowHideRaid:SetTemplate()
ShowHideRaid:SetSize(((RaidToolsWidth+10)/3), 20)
ShowHideRaid:SetPoint("CENTER", RChatTab, "CENTER", 0, 0)
ShowHideRaid:SetFrameLevel(2)
ShowHideRaid:SetFrameStrata("BACKGROUND")
ShowHideRaid:SetAlpha(0)

local RaidToolsText = RChatTab:CreateFontString(nil, "OVERLAY")
RaidToolsText:SetFont(C.media.pixel_font, C.media.pixel_font_size-2, C.media.pixel_font_style)
RaidToolsText:SetTextColor(unpack(C.media.pxcolor1))
RaidToolsText:SetPoint("RIGHT", RChatTab, "RIGHT", -150, 0)
RaidToolsText:SetText("Raid Tools")
		
--RChatTab.iconmiddle = RChatTab:CreateTexture(nil, "OVERLAY")
--RChatTab.iconmiddle:SetSize(17, 17)
--RChatTab.iconmiddle:SetPoint("RIGHT", RaidToolsText, "LEFT", -4, 0)
--RChatTab.iconmiddle:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\skull.blp]])

ShowHideRaid:SetScript("OnEnter", function(self)
RaidToolsText:SetTextColor(class.r, class.g, class.b)
--RChatTab.iconmiddle:SetVertexColor(class.r, class.g, class.b)
end)

ShowHideRaid:SetScript("OnLeave", function(self)
RaidToolsText:SetTextColor(unpack(C.media.pxcolor1))
--RChatTab.iconmiddle:SetVertexColor(1, 1, 1)
end)

-- tooltip Anchor
RaidToolsTooltipAnchor = raidtoolbg
		
------------------------------------------------------------------------------------------
-- Raid Markers
------------------------------------------------------------------------------------------
-- Button Clear Raid Marker
CreateBtn("clearraidmarker", Line01, RaidToolsWidth/5.5, 19, "Clear Target Marker", "Clear", RaidToolsTooltipAnchor)
clearraidmarker:SetPoint("RIGHT", Line01, "RIGHT", -5, 0)
clearraidmarker:SetAttribute("macrotext", "/tm 0")

-- Button 8 - Yellow Star
CreateBtn("mbbutton08", Line01, 19, 19, "Set Raid Marker |cffFFFF00STAR|r", "", RaidToolsTooltipAnchor)
mbbutton08:SetPoint("RIGHT", clearraidmarker, "LEFT", -5, 0)
mbbutton08:SetAttribute("macrotext", "/tm 1")
mbbutton08.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\star.blp]])

-- Button 7 - Orange/Circle
CreateBtn("mbbutton07", Line01, 19, 19, "Set Raid Marker |cffFF8000CIRCLE|r", "", RaidToolsTooltipAnchor)
mbbutton07:SetPoint("RIGHT", mbbutton08, "LEFT", -5, 0)
mbbutton07:SetAttribute("macrotext", "/tm 2")
mbbutton07.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\circle.blp]])

-- Button 6 - Purple/Diamond
CreateBtn("mbbutton06", Line01, 19, 19, "Set Raid Marker |cffFF00FFDIAMOND|r", "", RaidToolsTooltipAnchor)
mbbutton06:SetPoint("RIGHT", mbbutton07, "LEFT", -5, 0)
mbbutton06:SetAttribute("macrotext", "/tm 3")
mbbutton06.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\diamond.blp]])

-- Button 5 - Green/Triangle
CreateBtn("mbbutton05", Line01, 19, 19, "Set Raid Marker |cff33FF33TRIANGLE|r", "", RaidToolsTooltipAnchor)
mbbutton05:SetPoint("RIGHT", mbbutton06, "LEFT", -5, 0)
mbbutton05:SetAttribute("macrotext", "/tm 4")
mbbutton05.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\triangle.blp]])

-- Button 4 - Grey/Moon
CreateBtn("mbbutton04", Line01, 19, 19, "Set Raid Marker |cffCCCCFFMOON|r", "", RaidToolsTooltipAnchor)
mbbutton04:SetPoint("RIGHT", mbbutton05, "LEFT", -5, 0)
mbbutton04:SetAttribute("macrotext", "/tm 5")
mbbutton04.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\moon.blp]])

-- Button 3 - Blue/Square
CreateBtn("mbbutton03", Line01, 19, 19, "Set Raid Marker |cff0080FFSQUARE|r", "", RaidToolsTooltipAnchor)
mbbutton03:SetPoint("RIGHT", mbbutton04, "LEFT", -5, 0)
mbbutton03:SetAttribute("macrotext", "/tm 6")
mbbutton03.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\square.blp]])

-- Button 2 - Red/Cross
CreateBtn("mbbutton02", Line01, 19, 19, "Set Raid Marker |cffFF0000CROSS|r", "", RaidToolsTooltipAnchor)
mbbutton02:SetPoint("RIGHT", mbbutton03, "LEFT", -5, 0)
mbbutton02:SetAttribute("macrotext", "/tm 7")
mbbutton02.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\cross.blp]])

-- Button 1 - White/Skull
CreateBtn("mbbutton01", Line01, 19, 19, "Set Raid Marker |cffFFFFFFSKULL|r", "", RaidToolsTooltipAnchor)
mbbutton01:SetPoint("RIGHT", mbbutton02, "LEFT", -5, 0)
mbbutton01:SetAttribute("macrotext", "/tm 8")
mbbutton01.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Markers\skull.blp]])

------------------------------------------------------------------------------------------
-- World Markers / flares
------------------------------------------------------------------------------------------
-- Button clearworldmarkers
CreateBtn("clearworldmarkers", Line02, RaidToolsWidth/5.5, 19, "Clear World Markers", "Clear", RaidToolsTooltipAnchor)
clearworldmarkers:SetPoint("RIGHT", Line02, "RIGHT", -5, 0)
clearworldmarkers:SetAttribute("macrotext", "/cwm 0")

-- Button 8 - yellow/star
CreateBtn("wbbutton08", Line02, 19, 19, "Set World Marker |cffFFFF00STAR|r", "", RaidToolsTooltipAnchor)
wbbutton08:SetPoint("RIGHT", clearworldmarkers, "LEFT", -5, 0)
wbbutton08:SetAttribute("macrotext", "/wm 5")
wbbutton08.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\yellow.tga]])

-- Button 7 - orange/circle
CreateBtn("wbbutton07", Line02, 19, 19, "Set World Marker |cffFF8000CIRCLE|r", "", RaidToolsTooltipAnchor)
wbbutton07:SetPoint("RIGHT", wbbutton08, "LEFT", -5, 0)
wbbutton07:SetAttribute("macrotext", "/wm 6")
wbbutton07.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\orange.tga]])

-- Button 6 - purple/diamond
CreateBtn("wbbutton06", Line02, 19, 19, "Set World Marker |cffFF00FFDIAMOND|r", "", RaidToolsTooltipAnchor)
wbbutton06:SetPoint("RIGHT", wbbutton07, "LEFT", -5, 0)
wbbutton06:SetAttribute("macrotext", "/wm 3")
wbbutton06.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\purple.tga]])

-- Button 5 - green/triangle
CreateBtn("wbbutton05", Line02, 19, 19, "Set World Marker |cff33FF33TRIANGLE|r", "", RaidToolsTooltipAnchor)
wbbutton05:SetPoint("RIGHT", wbbutton06, "LEFT", -5, 0)
wbbutton05:SetAttribute("macrotext", "/wm 2")
wbbutton05.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\green.tga]])

-- Button 4 - gray/moon
CreateBtn("wbbutton04", Line02, 19, 19, "Set World Marker |cffCCCCFFMOON|r", "", RaidToolsTooltipAnchor)
wbbutton04:SetPoint("RIGHT", wbbutton05, "LEFT", -5, 0)
wbbutton04:SetAttribute("macrotext", "/wm 7")
wbbutton04.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\grey.tga]])

-- Button 3 - blue/square
CreateBtn("wbbutton03", Line02, 19, 19, "Set World Marker |cff0080FFSQUARE|r", "", RaidToolsTooltipAnchor)
wbbutton03:SetPoint("RIGHT", wbbutton04, "LEFT", -5, 0)
wbbutton03:SetAttribute("macrotext", "/wm 1")
wbbutton03.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\blue.tga]])

-- Button 2 - Red/Cross
CreateBtn("wbbutton02", Line02, 19, 19, "Set World Marker |cffFF0000CROSS|r", "", RaidToolsTooltipAnchor)
wbbutton02:SetPoint("RIGHT", wbbutton03, "LEFT", -5, 0)
wbbutton02:SetAttribute("macrotext", "/wm 4")
wbbutton02.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\red.tga]])

-- Button 1 - White/Skull
CreateBtn("wbbutton01", Line02, 19, 19, "Set World Marker |cffFFFFFFSKULL|r", "", RaidToolsTooltipAnchor)
wbbutton01:SetPoint("RIGHT", wbbutton02, "LEFT", -5, 0)
wbbutton01:SetAttribute("macrotext", "/wm 8")
wbbutton01.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Flares\white.tga]])
		
------------------------------------------------------------------------------------------
-- Raid Commands
------------------------------------------------------------------------------------------
-- Pull Timer
CreateBtn("pulltimer", Line03, RaidToolsWidth/5.5, 19, "Start a DBM pull timer", "Pull", RaidToolsTooltipAnchor)
pulltimer:SetPoint("RIGHT", Line03, "RIGHT", -5, 0)
pulltimer:SetAttribute("macrotext", "/dbm pull 10")

-- Button Set Main Assist
CreateBtn("mainassistbutton", Line03, RaidToolsWidth/6, 19, "Set Main Assist", "", RaidToolsTooltipAnchor)
mainassistbutton:SetPoint("RIGHT", pulltimer, "LEFT", -5, 0)
mainassistbutton:SetAttribute("macrotext", "/ma")
mainassistbutton.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Roleicons\mainassist.tga]])

-- Button Set Main Tank
CreateBtn("maintankbutton", Line03, RaidToolsWidth/6, 19, "Set Main Tank", "", RaidToolsTooltipAnchor)
maintankbutton:SetPoint("RIGHT", mainassistbutton, "LEFT", -5, 0)
maintankbutton:SetAttribute("macrotext", "/mt")
maintankbutton.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Roleicons\tank2.tga]])

-- Button Readycheck
CreateBtn("rcbutton", Line03, RaidToolsWidth/6, 19, "Start a readycheck", "", RaidToolsTooltipAnchor)
rcbutton:SetPoint("RIGHT", maintankbutton, "LEFT", -5, 0)
rcbutton:SetAttribute("macrotext", "/readycheck")
rcbutton.icon:SetSize(34, 17)
rcbutton.icon:SetTexture([[Interface\AddOns\ViksUI\Media\Roleicons\readycheck.tga]])

------------------------------------------------------------------------------------------
-- SHOW HIDE FUNCTIONALITY 
------------------------------------------------------------------------------------------
ShowHideRaid:SetScript("OnMouseDown", function(self)
	
	if raidtoolbg:IsShown() then
		raidtoolbg:Hide()
		Line01:Hide()
		Line02:Hide()
		Line03:Hide()
	else
		raidtoolbg:Show()
		Line01:Show()
		Line02:Show()
		Line03:Show()
	end
end)
		


------------------------------------------------------------------------------------------
-- UI TOOLS MODULE
------------------------------------------------------------------------------------------
CreateBtn("ShowHideTools", RChatTab, ((RaidToolsWidth+10)/3), 20, "", "")
ShowHideTools:SetPoint("RIGHT", RChatTab, "RIGHT", 0, 0)
ShowHideTools:SetAttribute("macrotext", "/config")
ShowHideTools:SetAlpha(0)

local ToolsText = RChatTab:CreateFontString(nil, "OVERLAY")
ToolsText:SetFont(C.media.pixel_font, C.media.pixel_font_size-2, C.media.pixel_font_style)
ToolsText:SetTextColor(unpack(C.media.pxcolor1))
ToolsText:SetPoint("RIGHT", RChatTab, "RIGHT", -28, 0)
ToolsText:SetText("UI TOOLS")

--RChatTab.iconright = RChatTab:CreateTexture(nil, "OVERLAY")
--RChatTab.iconright:SetSize(17, 17)
--RChatTab.iconright:SetPoint("RIGHT", RChatTab, "RIGHT", -12, 0)
--RChatTab.iconright:SetTexture([[Interface\AddOns\ViksUI\Media\Menuicons\acp.tga]])

ShowHideTools:SetScript("OnEnter", function(self)
	ToolsText:SetTextColor(class.r, class.g, class.b)
	--RChatTab.iconright:SetVertexColor(class.r, class.g, class.b)
end)

ShowHideTools:SetScript("OnLeave", function(self)
	ToolsText:SetTextColor(unpack(C.media.pxcolor1))
	--RChatTab.iconright:SetVertexColor(1, 1, 1)	
end)
end
