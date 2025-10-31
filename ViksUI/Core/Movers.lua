local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	Movement function(by Allez)
----------------------------------------------------------------------------------------
T.MoverFrames = {
	VehicleButtonAnchor,
	ExtraButtonAnchor,
	ExtraActionBarFrame,
	ZoneButtonAnchor,
	ActionBarAnchor,
	RightActionBarAnchor,
	PetActionBarAnchor,
	StanceBarAnchor,
	MicroAnchor,
	VehicleAnchor,
	WatchFrameAnchor,
	AchievementAnchor,
	MinimapAnchor,
	TopPanelAnchor,
	BuffsAnchor,
	DeBuffsAnchor,
	RaidCDAnchor,
	RaidUtilityPanel,
	RaidToolPanel,
	EnemyCDAnchor,
	ObjectiveTrackerAnchor,
	ThreatMeterAnchor,
	LootRollAnchor,
	RaidBuffsAnchor,
	DCPAnchor,
	AutoButtonAnchor,
	AnchorMarkBar,
	TooltipAnchor,
	ChatBar,
	PulseCDAnchor,
	oUF_Player,
	oUF_Player_Castbar,
	oUF_Target_Castbar,
	oUF_Player_Portrait,
	oUF_Target_Portrait,
	P_BUFF_ICON_Anchor,
	P_PROC_ICON_Anchor,
	SPECIAL_P_BUFF_ICON_Anchor,
	T_DEBUFF_ICON_Anchor,
	T_BUFF_Anchor,
	PVE_PVP_DEBUFF_Anchor,
	PVE_PVP_CC_Anchor,
	COOLDOWN_Anchor,
	T_DE_BUFF_BAR_Anchor,
	P_BUFF_BAR_Anchor,
	Move_PVEDEBUFF,
	Anchorflash,
	DataTextP1,
	DataTextP2,
	DataTextP3,
	DataTextP4,
	DataTextP5,
	DataTextP6,
	DataTextP7,
	DataTextP8,
	DataTextP9,
	DataTextP10,
	DataTextP11,
	DataTextP12,
	CPCool,
	Move_playercastbar,
	Move_targetcastbar,
	Move_focuscastbar,
	Move_playercastbar_Dps,
	Move_targetcastbar_Dps,
	Move_focuscastbar_Dps,
	Move_tank,
	Move_threatbar,
	Move_raid,
	Move_raid40dps,
	SpellActivationOverlayFrame,
	SplitBarLeft,
	SplitBarRight,
	CustomBarAnchor,
	ViksUIExperienceBar1,
	ViksUIExperienceBar2,
	LBottom,
	LChat,
	LChatTab,
	LABar,
	RBottom,
	RChat,
	RChatTab,
	RABar,
	R_Omen,
	L_Details,
	R1_Details,
	R2_Details,
	CPTopp,
	CPMinim,
	UIWidgetPowerBarAnchor
}

if C.actionbar.bar7_enable then
	tinsert(T.MoverFrames, Bar7Holder)
end

if C.actionbar.bar8_enable then
	tinsert(T.MoverFrames, Bar8Holder)
end

if C.actionbar.editor then
	tinsert(T.MoverFrames, Bar1Holder)
	tinsert(T.MoverFrames, Bar2Holder)
	tinsert(T.MoverFrames, Bar3Holder)
	tinsert(T.MoverFrames, Bar4Holder)
	tinsert(T.MoverFrames, Bar5Holder)
	tinsert(T.MoverFrames, Bar6Holder)
	tremove(T.MoverFrames, 5)	-- RightActionBarAnchor
	tremove(T.MoverFrames, 4)	-- ActionBarAnchor
end

local unitFrames = {
	oUF_Player,
	oUF_Target,
	oUF_Pet,
	oUF_Focus,
	oUF_FocusTarget,
	oUF_TargetTarget,
	oUF_Player_Castbar,
	oUF_Target_Castbar,
	oUF_Player_Portrait,
	oUF_Target_Portrait,
	PartyAnchor,
	PartyTargetAnchor,
	PartyPetAnchor,
	RaidTankAnchor,
	PartyDPSAnchor,
	PartyTargetDPSAnchor,
	PartyPetDPSAnchor,
	RaidTankDPSAnchor
}

for i = 1, 5 do
	tinsert(unitFrames,_G["oUF_Boss"..i])
	tinsert(unitFrames,_G["oUF_Arena"..i])
	tinsert(unitFrames,_G["oUF_Arena"..i.."Target"])
end

--for i = 1, C.raidframe.raid_groups do
	--tinsert(unitFrames, _G["RaidAnchor"..i])
	--tinsert(unitFrames, _G["RaidDPSAnchor"..i])
--end

local moving = false
local movers = {}
local placed = {
	"Butsu",
	"UIAltPowerBar",
	"GroupLootHistoryFrame",
	"stArchaeologyFrame",
	"StuffingFrameBags",
	"StuffingFrameBank",
	"alDamageMeterFrame",
	"UIWidgetTopAnchor",
	"UIWidgetBelowAnchor"
}

local SaveDefaultPosition = function(mover)
	local ap, p, rp, x, y = mover.frame:GetPoint()
	local positionTable = T.CurrentProfile()
	positionTable.Default = positionTable.Default or {}
	if not positionTable.Default[mover.frame:GetName()] then
		if not p then
			p = UIParent
		end
		positionTable.Default[mover.frame:GetName()] = {ap, p:GetName(), rp, x, y}
	end
end

local SetPosition = function(mover)
	local x, y, ap = T.CalculateMoverPoints(mover)
	mover.frame:ClearAllPoints()
	mover.frame:SetPoint(ap, "UIParent", ap, x, y)
	local positionTable = T.CurrentProfile()
	positionTable[mover.frame:GetName()] = {ap, "UIParent", ap, x, y}
end

-- Controls
local controls = CreateFrame("frame", nil, UIParent)
controls:SetPoint("CENTER", UIParent)
controls:SetSize(65, 25)
controls:SetFrameStrata("TOOLTIP")
controls:SetFrameLevel(200)
controls:SetClampedToScreen(true)
controls:Hide()
controls:SetScript("OnLeave", function(self)
	if MouseIsOver(self) then return end
	if not self._frame then
		self:Hide()
	elseif not MouseIsOver(self._frame) then
		self:Hide()
	end
	controls.x:SetText("")
	controls.y:SetText("")
end)

local function CreateArrow(moveX, moveY, callback)
	moveX = moveX or 0
	moveY = moveY or 0

	local button = CreateFrame("button", nil, controls)
	button:SetSize(14, 14)
	button.controls = controls

	button.tex = button:CreateTexture(nil, "OVERLAY")
	button.tex:SetTexture("Interface\\OPTIONSFRAME\\VoiceChat-Play")

	button.tex:SetPoint("CENTER")
	button.tex:SetSize(12, 12)
	button.tex:SetVertexColor(0.6, 0.6, 0.6)

	button:SetScript("OnEnter", function(self)
		self.tex:SetVertexColor(1, 1, 1)
	end)
	button:SetScript("OnLeave", function(self)
		self.tex:SetVertexColor(0.6, 0.6, 0.6)
	end)

	callback = callback or function(self)
		local frame = self.controls._frame
		if not frame then return end
		local point, relativeTo, relativePoint, xOfs, yOfs = frame.frame:GetPoint()
		SaveDefaultPosition(frame)
		if IsControlKeyDown() then
			frame.frame:SetPoint(point, relativeTo, relativePoint, xOfs + (moveX * 20), yOfs + (moveY * 20))
		elseif IsShiftKeyDown() then
			frame.frame:SetPoint(point, relativeTo, relativePoint, xOfs + (moveX * 5), yOfs + (moveY * 5))
		else
			frame.frame:SetPoint(point, relativeTo, relativePoint, xOfs + (moveX * 1), yOfs + (moveY * 1))
		end
		local point, relativeTo, relativePoint, xOfs, yOfs = frame.frame:GetPoint()
		if not relativeTo then
			relativeTo = UIParent
		end
		local positionTable = T.CurrentProfile()
		positionTable[frame.frame:GetName()] = {point, relativeTo:GetName(), relativePoint, xOfs, yOfs}
		frame:SetAllPoints(frame.frame)
		controls.x:SetText(T.Round(xOfs))
		controls.y:SetText(T.Round(yOfs))
	end

	button:SetScript("OnClick", callback)

	if controls.last then
		button:SetPoint("LEFT", controls.last, "RIGHT", 2, 0)
	else
		button:SetPoint("LEFT", controls, "LEFT", 2, 0)
	end

	controls.last = button

	return button
end

controls.left = CreateArrow(-1, 0)
controls.left.tex:SetRotation(3.14159)

controls.up = CreateArrow(0, 1)
controls.up.tex:SetRotation(1.5708)

controls.down = CreateArrow(0, -1)
controls.down.tex:SetRotation(-1.5708)

controls.right = CreateArrow(1, 0)
controls.right.tex:SetRotation(0)

controls.x = controls:CreateFontString(nil, "OVERLAY")
controls.x:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
controls.x:SetPoint("RIGHT", controls, "LEFT", -10, 0)

controls.y = controls:CreateFontString(nil, "OVERLAY")
controls.y:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
controls.y:SetPoint("LEFT", controls, "RIGHT", 10, 0)

controls.shadow = controls:CreateTexture(nil, "OVERLAY")
controls.shadow:SetPoint("TOPLEFT", controls.x, "TOPLEFT", -5, 5)
controls.shadow:SetPoint("BOTTOMRIGHT", controls.y, "BOTTOMRIGHT", 2, -5)
controls.shadow:SetTexture(C.media.texture)
controls.shadow:SetVertexColor(0.2, 0.2, 0.2, 0.8)

local function GetQuadrant(frame)
	local _, y = frame:GetCenter()
	local vhalf = (y > UIParent:GetHeight() / 2) and "TOP" or "BOTTOM"
	return vhalf
end

local function ShowControls(frame)
	local y = GetQuadrant(frame)
	controls._frame = frame
	controls:Show()
	controls:ClearAllPoints()
	if y == "TOP" then
		controls:SetPoint("TOP", frame, "BOTTOM", 0, 0)
	else
		controls:SetPoint("BOTTOM", frame, "TOP", 0, 0)
	end
	local _, _, _, xOfs, yOfs = frame.frame:GetPoint()
	controls.x:SetText(T.Round(xOfs))
	controls.y:SetText(T.Round(yOfs))
end

local function UpdateCoords(self)
	local mover = self.child
	local x, y, ap = T.CalculateMoverPoints(mover)

	mover.frame:ClearAllPoints()
	mover.frame:SetPoint(ap, "UIParent", ap, x, y)
	controls.x:SetText(T.Round(x))
	controls.y:SetText(T.Round(y))
end

local coordFrame = CreateFrame("Frame")
coordFrame:SetScript("OnUpdate", UpdateCoords)
coordFrame:Hide()

local OnDragStart = function(self)
	SaveDefaultPosition(self)
	self:StartMoving()

	coordFrame.child = self
	coordFrame:Show()
end

local OnDragStop = function(self)
	self:StopMovingOrSizing()
	SetPosition(self)

	coordFrame.child = nil
	coordFrame:Hide()
end

local RestoreDefaults = function(self, button)
	if button == "RightButton" then
		local positionTable = T.CurrentProfile()
		local data = positionTable.Default and positionTable.Default[self.frame:GetName()]
		if data then
			self.frame:ClearAllPoints()
			self.frame:SetPoint(unpack(data))
			self:ClearAllPoints()
			self:SetAllPoints(self.frame)
			positionTable.Default[self.frame:GetName()] = nil
			positionTable[self.frame:GetName()] = nil
		end
	elseif button == "MiddleButton" then
		self:Hide()
	end
end

local UpdatePosition = function(moveX, moveY)
	moveX = moveX or 0
	moveY = moveY or 0
	local frame = controls._frame
	if not frame then return end
	local point, relativeTo, relativePoint, xOfs, yOfs = frame.frame:GetPoint()
	SaveDefaultPosition(frame)
	frame.frame:SetPoint(point, relativeTo, relativePoint, xOfs + (moveX * 1), yOfs + (moveY * 1))
	local point, relativeTo, relativePoint, xOfs, yOfs = frame.frame:GetPoint()
	if not relativeTo then
		relativeTo = UIParent
	end
	local positionTable = T.CurrentProfile()
	positionTable[frame.frame:GetName()] = {point, relativeTo:GetName(), relativePoint, xOfs, yOfs}
	frame:SetAllPoints(frame.frame)
	controls.x:SetText(T.Round(xOfs))
	controls.y:SetText(T.Round(yOfs))
end

local OnMouseWheel = function(_, offset)
	if IsShiftKeyDown() then
		UpdatePosition(0, offset)
	elseif IsControlKeyDown() then
		UpdatePosition(offset, 0)
	end
end

local chatInfo = CreateFrame("Frame", "MoverInfo", UIParent)
chatInfo:SetFrameStrata("TOOLTIP")
chatInfo:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", -3, 50)
chatInfo:SetSize(C.chat.width + 7, C.chat.height + 4)
chatInfo:SetTemplate("Overlay")
chatInfo:SetMovable(true)
chatInfo:EnableMouse(true)
chatInfo:SetScript("OnMouseDown", chatInfo.StartMoving)
chatInfo:SetScript("OnMouseUp", chatInfo.StopMovingOrSizing)
chatInfo:Hide()

local title = chatInfo:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
title:SetPoint("TOP", chatInfo, "TOP", 0, -10)
title:SetTextColor(0.40, 0.78, 1)

local subTitle1 = chatInfo:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
subTitle1:SetPoint("TOP", title, "TOP", 0, -20)
subTitle1:SetText(L_MOVE_RIGHT_CLICK)
subTitle1:SetTextColor(0.75, 0.9, 1)

local subTitle2 = chatInfo:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
subTitle2:SetPoint("TOP", subTitle1, "TOP", 0, -20)
subTitle2:SetText(L_MOVE_MIDDLE_CLICK)
subTitle2:SetTextColor(0.75, 0.9, 1)

local ResetButton = CreateFrame("Button", nil, chatInfo, "UIPanelButtonTemplate")
ResetButton:SetSize(100, 23)
ResetButton:SetText(DEFAULT)
ResetButton:SetPoint("BOTTOMLEFT", chatInfo, "BOTTOMLEFT", 10, 7)
ResetButton:SetScript("OnClick", function()
	StaticPopup_Show("MOVEUI_RESET")
end)
ResetButton:SkinButton()

local CloseButton = CreateFrame("Button", nil, chatInfo, "UIPanelButtonTemplate")
CloseButton:SetPoint("TOPRIGHT", chatInfo, "BOTTOMRIGHT", -10, 30)
CloseButton:SetSize(100, 23)
CloseButton:SetText(CLOSE)
CloseButton:SetScript("OnClick", function()
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION)
	SlashCmdList.MOVING()
end)
CloseButton:SkinButton()

local index = 200
local CreateMover = function(frame, unit)
	local mover = CreateFrame("Frame", nil, UIParent)
	if unit then
		mover:CreateBackdrop("Transparent")
		mover.backdrop:SetBackdropBorderColor(0, 0.6, 0.6)
	else
		mover:SetTemplate("Transparent")
		mover:SetBackdropBorderColor(0, 0.6, 0.6)
	end
	mover.backdrop = mover.backdrop or mover
	mover:SetAllPoints(frame)
	mover:SetFrameStrata("TOOLTIP")
	mover:SetFrameLevel(index)
	mover:EnableMouse(true)
	mover:SetMovable(true)
	mover:SetClampedToScreen(true)
	mover:RegisterForDrag("LeftButton")
	mover:SetScript("OnDragStart", OnDragStart)
	mover:SetScript("OnDragStop", OnDragStop)
	mover:SetScript("OnEnter", function(self)
		self.backdrop:SetBackdropColor(0.4, 0.4, 0.4, C.media.backdrop_alpha)
		self.backdrop:SetBackdropBorderColor(unpack(C.media.classborder_color))
		ShowControls(self)
		title:SetText(mover.name:GetText())
	end)
	mover:SetScript("OnLeave", function(self)
		self.backdrop:SetBackdropColor(C.media.backdrop_color[1], C.media.backdrop_color[2], C.media.backdrop_color[3], C.media.backdrop_alpha)
		self.backdrop:SetBackdropBorderColor(0, 0.6, 0.6)
		if not MouseIsOver(controls) then controls:Hide() end
	end)
	mover:SetScript("OnMouseUp", RestoreDefaults)
	mover:SetScript("OnMouseWheel", OnMouseWheel)
	mover.frame = frame

	mover.name = mover:CreateFontString(nil, "OVERLAY")
	mover.name:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	mover.name:SetPoint("CENTER")
	mover.name:SetTextColor(1, 1, 1)
	local text = frame:GetName()
	text = text:gsub("_Anchor", "")
	text = text:gsub("Anchor", "")
	text = text:gsub("oUF_", "")
	mover.name:SetText(text)
	mover.name:SetWidth(frame:GetWidth() - 4)
	movers[frame:GetName()] = mover
	index = index - 2
end

local GetMover = function(frame, unit)
	if movers[frame:GetName()] then
		return movers[frame:GetName()]
	else
		return CreateMover(frame, unit)
	end
end

local InitMove = function(msg)
	if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return end
	if msg and (msg == "reset" or msg == "куыуе") then
		T.CurrentProfile(true)
		for _, v in pairs(placed) do
			if _G[v] then
				_G[v]:SetUserPlaced(false)
			end
		end
		ReloadUI()
		return
	end
	if not moving then
		for _, v in pairs(T.MoverFrames) do
			local mover = GetMover(v)
			if mover then mover:Show() end
		end
		for _, v in pairs(unitFrames) do
			local mover = GetMover(v, true)
			if mover then mover:Show() end
		end
		moving = true
		SlashCmdList.GRIDONSCREEN()
		chatInfo:Show()
	else
		for _, v in pairs(movers) do
			v:Hide()
		end
		moving = false
		SlashCmdList.GRIDONSCREEN("hide")
		controls:Hide()
		chatInfo:Hide()
	end
	if T.MoveUnitFrames then T.MoveUnitFrames() end												
end

local RestoreUI = function(self)
	if InCombatLockdown() then
		if not self.shedule then self.shedule = CreateFrame("Frame", nil, self) end
		self.shedule:RegisterEvent("PLAYER_REGEN_ENABLED")
		self.shedule:SetScript("OnEvent", function(self)
			RestoreUI(self:GetParent())
			self:UnregisterEvent("PLAYER_REGEN_ENABLED")
			self:SetScript("OnEvent", nil)
		end)
		return
	end
	local positionTable = T.CurrentProfile()
	if positionTable then
		for frame_name, point in pairs(positionTable) do
			if _G[frame_name] then
				_G[frame_name]:ClearAllPoints()
				_G[frame_name]:SetPoint(unpack(point))
			end
		end
	end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent(event)
	RestoreUI(self)
end)

SlashCmdList.MOVING = InitMove
SLASH_MOVING1 = "/moveui"
SLASH_MOVING2 = "/ьщмугш"
SLASH_MOVING3 = "/ui"
SLASH_MOVING4 = "/гш"

StaticPopupDialogs.RESET_UF = {
	text = L_POPUP_RESETUI,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") else
		local positionTable = T.CurrentProfile()
		for _, frame in pairs(unitFrames) do
			if frame:GetName() then
				positionTable[frame:GetName()] = nil
			end
		end
		ReloadUI()
		end
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

SlashCmdList.RESETUF = function() StaticPopup_Show("RESET_UF") end
SLASH_RESETUF1 = "/resetuf"

StaticPopupDialogs.MOVEUI_RESET = {
	text = L_POPUP_RESETUI,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") else
		T.CurrentProfile(true)
		for _, v in pairs(placed) do
			if _G[v] then
				_G[v]:SetUserPlaced(false)
			end
		end
		ReloadUI()
		end
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}