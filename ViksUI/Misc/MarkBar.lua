local T, C, L, _ = unpack(select(2, ...))
if not C.misc.markbar == true then return end

-- Config
font = C.media.pixel_font           
fontsize = 8                    		
buttonwidth = 15    		
buttonheight = 15  
 		
AnchorMarkBar = CreateFrame("Frame","Move_MarkBar",UIParent)
AnchorMarkBar:SetPoint("LEFT", CPCool, "RIGHT", 8, 5)
CreateAnchor(AnchorMarkBar, "Move Mark Bar", buttonwidth * 4 + 15, 28)						

local anchor = {}
anchor = {"BOTTOMRIGHT", AnchorMarkBar}


-- Create main frame
local MarkBarBG = CreateFrame("Frame", "MarkBarBackground", oUF_PetBattleFrameHider)
MarkBarBG:CreatePanel("Transparent", buttonwidth * 4 + 15, 90, "BOTTOM", AnchorMarkBar,0,22)
MarkBarBG:SetFrameLevel(0)
MarkBarBG:SetFrameStrata("HIGH")
MarkBarBG:Hide()


--Change border when mouse is inside the button
local function ButtonEnter(self)
	local color = RAID_CLASS_COLORS[myclass]
	self:SetBackdropBorderColor(color.r, color.g, color.b)
end
 
--Change border back to normal when mouse leaves button
local function ButtonLeave(self)
	self:SetBackdropBorderColor(unpack(C.media.border_color))
end

-- Mark Button BG and icons
icon = CreateFrame("Button", "tmb_Icon", MarkBarBG)
mark = CreateFrame("Button", "tmb_Menu", MarkBarBG)
for i = 1, 8 do
	mark[i] = CreateFrame("Button", "tbm_Mark"..i, MarkBarBG)
	CreatePanel(mark[i], buttonwidth, buttonheight, "LEFT", MarkBarBG, "LEFT", 3, 3)
	if i == 1 then
		mark[i]:SetPoint("TOPLEFT", MarkBarBG, "TOPLEFT",  3, -3)
	elseif i == 5 then
		mark[i]:SetPoint("TOP", mark[1], "BOTTOM", 0, -3)
	else
		mark[i]:SetPoint("LEFT", mark[i-1], "RIGHT", 3, 0)
	end
	mark[i]:EnableMouse(true)
	mark[i]:SetScript("OnEnter", ButtonEnter)
	mark[i]:SetScript("OnLeave", ButtonLeave)
	mark[i]:RegisterForClicks("AnyUp")
	mark[i]:SetFrameStrata("HIGH")
	
	icon[i] = CreateFrame("Button", "icon"..i, MarkBarBG)
	icon[i]:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
	icon[i]:SetSize(10, 10)
	icon[i]:SetPoint("CENTER", mark[i])
	icon[i]:SetFrameStrata("HIGH")
	
	-- Set up each button
	if i == 1 then -- Skull
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 8) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.75,1,0.25,0.5)
	elseif i == 2 then -- Cross
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 7) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.5,0.75,0.25,0.5)
	elseif i == 3 then -- Square
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 6) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.25,0.5,0.25,0.5)
	elseif i == 4 then -- Moon
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 5) end)
		icon[i]:GetNormalTexture():SetTexCoord(0,0.25,0.25,0.5)
	elseif i == 5 then -- Triangle
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 4) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.75,1,0,0.25)
	elseif i == 6 then -- Diamond
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 3) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.5,0.75,0,0.25)
	elseif i == 7 then -- Circle
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 2) end)
		icon[i]:GetNormalTexture():SetTexCoord(0.25,0.5,0,0.25)
	elseif i == 8 then -- Star
		mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", 1) end)
		icon[i]:GetNormalTexture():SetTexCoord(0,0.25,0,0.25)
	end
end

local function CreateMarkerButton(name, point, relativeto, point2, x, y)
    local f = CreateFrame("Button", name, MarkBarBG, "SecureActionButtonTemplate")
    f:SetPoint(point, relativeto, point2, x, y)
	f:SetSize(13, 13)


	f:SetTemplate("Transparent")


    f:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    f:SetAttribute("type", "macro")
end

--Setup Secure Buttons
CreateMarkerButton("BlueFlare", "BOTTOMLEFT", MarkBarBG, "BOTTOMLEFT", 3, 19)
BlueFlare:SetAttribute("macrotext", [[
/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button3

]])
BlueFlare:SetBackdropColor(0, 0, 1)
CreateMarkerButton("GreenFlare", "BOTTOMLEFT", BlueFlare, "BOTTOMRIGHT", 3, 0)
GreenFlare:SetAttribute("macrotext", [[
/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button5

]])
GreenFlare:SetBackdropColor(0, 1, 0)
CreateMarkerButton("PurpleFlare", "BOTTOMLEFT", GreenFlare, "BOTTOMRIGHT", 3, 0)
PurpleFlare:SetAttribute("macrotext", [[
/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button6

]])
PurpleFlare:SetBackdropColor(1, 0, 1)
CreateMarkerButton("RedFlare", "BOTTOMLEFT", PurpleFlare, "BOTTOMRIGHT", 3, 0)
RedFlare:SetAttribute("macrotext", [[
/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button2

]])
RedFlare:SetBackdropColor(1, 0, 0)
CreateMarkerButton("YellowFlare", "BOTTOMLEFT", MarkBarBG, "BOTTOMLEFT", 3, 3)
YellowFlare:SetAttribute("macrotext", [[
/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button8

]])
YellowFlare:SetBackdropColor(1, 1, 0)

CreateMarkerButton("OrangeFlare", "BOTTOMLEFT", YellowFlare, "BOTTOMRIGHT", 3, 0)
OrangeFlare:SetAttribute("macrotext", [[
/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button7
]])
OrangeFlare:SetBackdropColor(1, .6, 0)

CreateMarkerButton("WhiteFlare", "BOTTOMLEFT", OrangeFlare, "BOTTOMRIGHT", 3, 0)
WhiteFlare:SetAttribute("macrotext", [[
/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button1
]])
WhiteFlare:SetBackdropColor(1, 1, 1)

CreateMarkerButton("GreyFlare", "BOTTOMLEFT", WhiteFlare, "BOTTOMRIGHT", 3, 0)
GreyFlare:SetAttribute("macrotext", [[
/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button4
]])
GreyFlare:SetBackdropColor(.8, .8, .8)

CreateMarkerButton("ClearFlare", "BOTTOMLEFT", GreyFlare, "BOTTOMRIGHT", 2, 0)
ClearFlare:SetAttribute("macrotext", [[
/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton
/click DropDownList1Button9

]])
ClearFlare:SetSize(6, 30)
ClearFlare:SetBackdropColor(.075, .075, .075)
 
-- Create Button for clear target
local ClearTargetButton = CreateFrame("Button", "ClearTargetButton", MarkBarBackground)
CreatePanel(ClearTargetButton, (buttonwidth * 4) + 9, 16, "TOPLEFT", mark[5], "BOTTOMLEFT", 0, -3)
ClearTargetButton:SetScript("OnEnter", ButtonEnter)
ClearTargetButton:SetScript("OnLeave", ButtonLeave)
ClearTargetButton:SetScript("OnMouseUp", function() SetRaidTarget("target", 0) end)
ClearTargetButton:SetFrameStrata("HIGH")

local ClearTargetButtonText = ClearTargetButton:CreateFontString("ClearTargetButtonText","OVERLAY", ClearTargetButton)
ClearTargetButtonText:SetFont(font,fontsize,"OUTLINE")
ClearTargetButtonText:SetText("Clear Target")
ClearTargetButtonText:SetPoint("CENTER")
ClearTargetButtonText:SetJustifyH("CENTER", 1, 0)


--Create toggle button
local ToggleButton = CreateFrame("Frame", "ToggleButton", oUF_PetBattleFrameHider)
CreatePanel(ToggleButton, buttonwidth * 4 + 15, 18, "CENTER", UIParent, "CENTER", 0, 0)
ToggleButton:ClearAllPoints()
ToggleButton:SetPoint(unpack(anchor))
ToggleButton:EnableMouse(true)
ToggleButton:SetScript("OnEnter", ButtonEnter)
ToggleButton:SetScript("OnLeave", ButtonLeave)
--CreateShadow(ToggleButton)
local ToggleButtonText = ToggleButton:CreateFontString(nil ,"OVERLAY")
ToggleButtonText:SetFont(font, fontsize)
ToggleButtonText:SetText("Mark Bar")
ToggleButtonText:SetPoint("CENTER", ToggleButton, "CENTER")
	
--Create close button
local CloseButton = CreateFrame("Frame", "CloseButton", MarkBarBackground)
CreatePanel(CloseButton, 15, 15, "BOTTOMRIGHT", MarkBarBackground, "TOPRIGHT", 0, 2)
CloseButton:EnableMouse(true)
CloseButton:SetScript("OnEnter", ButtonEnter)
CloseButton:SetScript("OnLeave", ButtonLeave)
--CreateShadow(CloseButton)
local CloseButtonText = CloseButton:CreateFontString(nil, "OVERLAY")
CloseButtonText:SetFont(font, fontsize)
CloseButtonText:SetText("x")
CloseButtonText:SetPoint("CENTER", CloseButton, "CENTER")

ToggleButton:SetScript("OnMouseDown", function()
	if MarkBarBackground:IsShown() then
		MarkBarBackground:Hide()
	else
		MarkBarBackground:Show()
	end
end)
	
CloseButton:SetScript("OnMouseDown", function()
	if MarkBarBackground:IsShown() then
		MarkBarBackground:Hide()
	else
		ToggleButton:Show()
	end
end)

--Check if we are Raid Leader or Raid Officer
local function CheckRaidStatus()
	local _, instanceType = IsInInstance()
	if ((GetNumGroupMembers() > 0 and UnitIsGroupLeader("player") and not UnitInRaid("player")) or UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) and (instanceType ~= "pvp" or instanceType ~= "arena") then
		return true
	else
		return false
	end
end

--Automatically show/hide the frame if we have RaidLeader or RaidOfficer
local LeadershipCheck = CreateFrame("Frame")
LeadershipCheck:RegisterEvent("PLAYER_ENTERING_WORLD")
LeadershipCheck:RegisterEvent("GROUP_ROSTER_UPDATE")
