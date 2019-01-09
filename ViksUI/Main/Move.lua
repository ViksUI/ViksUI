local T, C, L, _ = unpack(select(2, ...))
local t_unlock = false

AnchorFrames = {}
SavedPositions = {}

local SetPosition = function(anch)
	local ap, _, rp, x, y = anch:GetPoint()
	SavedPositions[anch:GetName()] = {ap, "UIParent", rp, x, y}
end

local OnDragStart = function(self)
	self:StartMoving()
end

local OnDragStop = function(self)
	self:StopMovingOrSizing()
	SetPosition(self)
end

local shadows = {
	edgeFile = "Interface\\AddOns\\ViksUI\\media\\Other\\glowTex", 
	edgeSize = 4,
	insets = { left = 3, right = 3, top = 3, bottom = 3 }
}
function CreateShadowmove(f) --
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(29)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -4, 4)
	shadow:SetPoint("BOTTOMRIGHT", 4, -4)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor(0, 0, 0, 0)
	shadow:SetBackdropBorderColor(0,0,0, 1)
	f.shadow = shadow
	return shadow
end
function framemove(f)
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1, 
		insets = {left = -1, right = -1, top = -1, bottom = -1} 
	})
	f:SetBackdropColor(.05,.05,.05,0.5)
	f:SetBackdropBorderColor(.23,.45,.13, 1)	
end
function CreateAnchor(f, text, width, height)
	f:SetScale(1)
	f:SetFrameStrata("TOOLTIP")
	f:SetScript("OnDragStart", OnDragStart)
	f:SetScript("OnDragStop", OnDragStop)
	f:SetWidth(width)
	f:SetHeight(height)
	
	local h = CreateFrame("Frame", nil)
	h:SetFrameLevel(30)
	h:SetAllPoints(f)
	f.dragtexture = h
	
	local v = CreateFrame("Frame", nil, h)
	v:SetPoint("TOPLEFT",0,0)
	v:SetPoint("BOTTOMRIGHT",0,0)
	framemove(v)

	f:SetMovable(true)
	f.dragtexture:SetAlpha(0)
	f:EnableMouse(nil)
	f:RegisterForDrag(nil)

	f.text = f:CreateFontString(nil, "OVERLAY")
	f.text:SetFont(C["media"].normal_font, 10)
	f.text:SetJustifyH("LEFT")
	f.text:SetShadowColor(0, 0, 0)
	f.text:SetShadowOffset(1, -1)
	f.text:SetAlpha(0)
	f.text:SetPoint("CENTER")
	f.text:SetText(text)

	tinsert(AnchorFrames, f:GetName())
end

function AnchorsUnlock()
	print("UI: all frames unlocked")
	for _, v in pairs(AnchorFrames) do
		f = _G[v]
		f.dragtexture:SetAlpha(1)
		f.text:SetAlpha(1)
		f:EnableMouse(true)
		f:RegisterForDrag("LeftButton")
	end
end

function AnchorsLock()
	print("UI: all frames locked")
	for _, v in pairs(AnchorFrames) do
		f = _G[v]
		f.dragtexture:SetAlpha(0)
		f.text:SetAlpha(0)
		f:EnableMouse(nil)
		f:SetUserPlaced(false)
		f:RegisterForDrag(nil)
	end
end

function AnchorsReset()
	if(SavedPositions) then SavedPositions = nil end
	ReloadUI()
end
local grid
local boxSize = 128

function Grid_Show()
	if not grid then
        Grid_Create()
	elseif grid.boxSize ~= boxSize then
        grid:Hide()
        Grid_Create()
    else
		grid:Show()
	end
end

function Grid_Hide()
	if grid then
		grid:Hide()
	end
end
function Grid_Create() 
	grid = CreateFrame("Frame", nil, UIParent)
	grid:SetAllPoints(UIParent)
	local width = GetScreenWidth() / 128
	local height = GetScreenHeight() / 72
	for i = 0, 128 do
		local texture = grid:CreateTexture(nil, "BACKGROUND")
		if i == 64 then
			texture:SetColorTexture(1, 0, 0, 0.8)
		else
			texture:SetColorTexture(0, 0, 0, 0.8)
		end
		texture:SetPoint("TOPLEFT", grid, "TOPLEFT", i * width - 1, 0)
		texture:SetPoint("BOTTOMRIGHT", grid, "BOTTOMLEFT", i * width, 0)
	end
	for i = 0, 72 do
		local texture = grid:CreateTexture(nil, "BACKGROUND")
		if i == 36 then
			texture:SetColorTexture(1, 0, 0, 0.8)
		else
			texture:SetColorTexture(0, 0, 0, 0.8)
		end
		texture:SetPoint("TOPLEFT", grid, "TOPLEFT", 0, -i * height)
		texture:SetPoint("BOTTOMRIGHT", grid, "TOPRIGHT", 0, -i * height - 1)
	end
end
local function SlashCmd(cmd)
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	if (cmd:match"reset") then
		AnchorsReset()
	else
		if t_unlock == false then
			t_unlock = true
			AnchorsUnlock()
			boxSize = (math.ceil((tonumber(arg) or boxSize) / 32) * 32)
				 
					Grid_Show()
					isAligning = true
				
		elseif t_unlock == true then
			t_unlock = false
			AnchorsLock()
			Grid_Hide()
            isAligning = false
		end
	end
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
	for frame_name, SetPoint in pairs(SavedPositions) do
		if _G[frame_name] then
			_G[frame_name]:ClearAllPoints()
			_G[frame_name]:SetPoint(unpack(SetPoint))
		end
	end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent(event)
	RestoreUI(self)
	
end)

SlashCmdList["uiold"] = SlashCmd;
SLASH_uiold1 = "/uiold";

AnchorBuff = CreateFrame("Frame","Move_Buff",UIParent)
AnchorDeBuff = CreateFrame("Frame","Move_DeBuff",UIParent)


if C.panels.NoPanels == true then
AnchorBuff:SetPoint("TOPRIGHT", UIParent, -(C.minimap.size+18), -(C.panels.yoffset+C.panels.CPbarsheight+2))
AnchorDeBuff:SetPoint("TOPRIGHT", UIParent, -(C.minimap.size+18), -(C.panels.yoffset+C.panels.CPbarsheight+C.minimap.size-(C.aura.player_buff_size*1.5)))
else
AnchorBuff:SetPoint("TOPRIGHT", UIParent, -(C.minimap.size+7), -(C.panels.yoffset+C.panels.CPbarsheight+2))
AnchorDeBuff:SetPoint("TOPRIGHT", UIParent, -(C.minimap.size+7), -(C.panels.yoffset+C.panels.CPbarsheight+C.minimap.size-(C.aura.player_buff_size*1.5)))
end
CreateAnchor(AnchorBuff, "Move Buff", 300, 70)
CreateAnchor(AnchorDeBuff, "Move DeBuff", 300, 70)

if C.unitframe.HealFrames then
---Frames
---Frames
Anchorviksplayer = CreateFrame("Frame","Move_player",UIParent)
Anchorviksplayer:SetPoint("TOPRIGHT", UIParent, "BOTTOM", -270, 305)
CreateAnchor(Anchorviksplayer, "Move player", 200, 25)

Anchorvikstarget = CreateFrame("Frame","Move_target",UIParent)
Anchorvikstarget:SetPoint("TOPLEFT", UIParent, "BOTTOM", 270, 305)
CreateAnchor(Anchorvikstarget, "Move target", 200, 25)

Anchorviksraid = CreateFrame("Frame","Move_raid",UIParent)
Anchorviksraid:SetPoint("BOTTOM", UIParent, "BOTTOM", -2, 190)
CreateAnchor(Anchorviksraid, "Move raid", 530, 20)

Anchorvikstot = CreateFrame("Frame","Move_tot",UIParent)
Anchorvikstot:SetPoint("BOTTOM", UIParent, "BOTTOM", 552, 271) 
CreateAnchor(Anchorvikstot, "Move tot", 100, 18)

Anchorvikspet = CreateFrame("Frame","Move_pet",UIParent)
Anchorvikspet:SetPoint("TOPRIGHT", UIParent, "BOTTOM", -540, 285) 
CreateAnchor(Anchorvikspet, "Move pet", 100, 18)

Anchorviksplayercastbar = CreateFrame("Frame","Move_playercastbar",UIParent)
Anchorviksplayercastbar:SetPoint("TOPRIGHT", UIParent, "BOTTOM", -182, 282)
CreateAnchor(Anchorviksplayercastbar, "Move playercastbar", 277, 18)

Anchorvikstargetcastbar = CreateFrame("Frame","Move_targetcastbar",UIParent)
Anchorvikstargetcastbar:SetPoint("TOPLEFT", UIParent, "BOTTOM", 208, 282)
CreateAnchor(Anchorvikstargetcastbar, "Move targetcastbar", 277, 18)

Anchorviksfocus = CreateFrame("Frame","Move_focus",UIParent)
Anchorviksfocus:SetPoint("TOPLEFT", UIParent, "BOTTOM", 560, 490)
CreateAnchor(Anchorviksfocus, "Move focus", 180, 25)

Anchorviksfocuscastbar = CreateFrame("Frame","Move_focuscastbar",UIParent)
Anchorviksfocuscastbar:SetPoint("TOPLEFT", UIParent, "BOTTOM", 579, 450)
CreateAnchor(Anchorviksfocuscastbar, "Move focuscastbar", 158, 13)

Anchorvikstank = CreateFrame("Frame","Move_tank",UIParent)
Anchorvikstank:SetPoint("BOTTOM", UIParent, "BOTTOM", -80, 330)
CreateAnchor(Anchorvikstank, "Move tank", 80, 18)

Anchorviksboss = CreateFrame("Frame","Move_boss",UIParent)
Anchorviksboss:SetPoint("RIGHT", UIParent, "RIGHT", -100, -90)
CreateAnchor(Anchorviksboss, "Move boss", 150, 200)

Anchorviksthreatbar = CreateFrame("Frame","Move_threatbar",UIParent)
Anchorviksthreatbar:SetPoint("BOTTOM", UIParent,"BOTTOM", 300, 295)
CreateAnchor(Anchorviksthreatbar, "Move threatbar", 200, 3)

else

AnchorviksplayerDps = CreateFrame("Frame","Move_player_Dps",UIParent)
AnchorviksplayerDps:SetPoint("TOPRIGHT", UIParent, "BOTTOM", -158, 320)
CreateAnchor(AnchorviksplayerDps, "Move player_Dps", 245, 60)

AnchorvikstargetDps = CreateFrame("Frame","Move_target_Dps",UIParent)
AnchorvikstargetDps:SetPoint("TOPLEFT", UIParent, "BOTTOM", 158, 320)
CreateAnchor(AnchorvikstargetDps, "Move target_Dps", 245, 60)

Anchorviksraid = CreateFrame("Frame","Move_raid",UIParent)
Anchorviksraid:SetPoint("BOTTOM", UIParent, "BOTTOM", -2, 190)
CreateAnchor(Anchorviksraid, "Move raid", 530, 20)

Anchorviksraid40dps = CreateFrame("Frame","Move_raid40dps",UIParent)
Anchorviksraid40dps:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -2, 190)
CreateAnchor(Anchorviksraid40dps, "Move raid40dps", 530, 20)

AnchorvikstotDps = CreateFrame("Frame","Move_tot_Dps",UIParent)
AnchorvikstotDps:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 259) 
CreateAnchor(AnchorvikstotDps, "Move tot_Dps", 120, 20)

AnchorvikspetDps = CreateFrame("Frame","Move_pet_Dps",UIParent)
AnchorvikspetDps:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 289) 
CreateAnchor(AnchorvikspetDps, "Move pet_Dps", 120, 20)

AnchorviksplayercastbarDps = CreateFrame("Frame","Move_playercastbar_Dps",UIParent)
AnchorviksplayercastbarDps:SetPoint("TOPRIGHT", UIParent, "BOTTOM", -92, 261)
CreateAnchor(AnchorviksplayercastbarDps, "Move playercastbar_Dps", 277, 18)

AnchorvikstargetcastbarDps = CreateFrame("Frame","Move_targetcastbar_Dps",UIParent)
AnchorvikstargetcastbarDps:SetPoint("TOPLEFT", UIParent, "BOTTOM", 117, 261)
CreateAnchor(AnchorvikstargetcastbarDps, "Move targetcastbar_Dps", 277, 18)

AnchorviksfocusDps = CreateFrame("Frame","Move_focus_Dps",UIParent)
AnchorviksfocusDps:SetPoint("TOPLEFT", UIParent, "BOTTOM", 430, 382)
CreateAnchor(AnchorviksfocusDps, "Move focus_Dps", 180, 25)

AnchorviksfocuscastbarDps = CreateFrame("Frame","Move_focuscastbar_Dps",UIParent)
AnchorviksfocuscastbarDps:SetPoint("TOPLEFT", UIParent, "BOTTOM", 449, 344)
CreateAnchor(AnchorviksfocuscastbarDps, "Move focuscastbar_Dps", 158, 13)

AnchorvikstankDps = CreateFrame("Frame","Move_tank_Dps",UIParent)
AnchorvikstankDps:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 200, 320)
CreateAnchor(AnchorvikstankDps, "Move tankDps", 80, 18)

AnchorviksbossDps = CreateFrame("Frame","Move_boss_Dps",UIParent)
AnchorviksbossDps:SetPoint("RIGHT", UIParent, "RIGHT", -100, -90)
CreateAnchor(AnchorviksbossDps, "Move boss_Dps", 150, 200)

AnchorviksthreatbarDps = CreateFrame("Frame","Move_threatbar_Dps",UIParent)
AnchorviksthreatbarDps:SetPoint("BOTTOM", UIParent,"BOTTOM", 300, 295)
CreateAnchor(AnchorviksthreatbarDps, "Move threatbar_Dps", 200, 3)
end

