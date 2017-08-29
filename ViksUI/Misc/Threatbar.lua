local T, C, L, _ = unpack(select(2, ...))
if not C.misc.Threatbar == true then return end
local aggroColors = {
	[1] = {12/255, 151/255,  15/255},
	[2] = {166/255, 171/255,  26/255},
	[3] = {163/255,  24/255,  24/255},
}
local addon, ns = ...
local oUF = ns.oUF or oUF
local ThreatBar = CreateFrame("StatusBar", "ThreatBar", CPCool)
ThreatBar:SetPoint("TOPLEFT", 2, -2)
ThreatBar:SetPoint("BOTTOMRIGHT", -2, 2)
ThreatBar:SetFrameStrata("MEDIUM")
ThreatBar:SetFrameLevel(5)

ThreatBar:SetStatusBarTexture(C.media.texture)
ThreatBar:GetStatusBarTexture():SetHorizTile(false)
ThreatBar:SetBackdrop({bgFile = C.media.texture})
ThreatBar:SetBackdropColor(0, 0, 0, 0)
ThreatBar:SetMinMaxValues(0, 100)

ThreatBar.text = SetFontString(ThreatBar, C.media.normal_font, 10)
ThreatBar.text:SetPoint("RIGHT", ThreatBar, "RIGHT", -30, 0)

ThreatBar.Title = SetFontString(ThreatBar, C.media.normal_font, 10)
ThreatBar.Title:SetText("Threat on current target:")
ThreatBar.Title:SetPoint("LEFT", ThreatBar, "LEFT", 30, 0)
	  
ThreatBar.bg = ThreatBar:CreateTexture(nil, 'BORDER')
ThreatBar.bg:SetAllPoints(ThreatBar)
ThreatBar.bg:SetColorTexture(0.1,0.1,0.1)

local function OnEvent(self, event, ...)
	local party = GetNumGroupMembers()
	local raid = GetNumGroupMembers()
	local pet = select(1, HasPetUI())
	if event == "PLAYER_ENTERING_WORLD" then
		self:Hide()
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	elseif event == "PLAYER_REGEN_ENABLED" then
		self:Hide()
	elseif event == "PLAYER_REGEN_DISABLED" then
		if party > 0 or raid > 0 or pet == 1 then
			self:Show()
		else
			self:Hide()
		end
	else
		if (InCombatLockdown()) and (party > 0 or raid > 0 or pet == 1) then
			self:Show()
		else
			self:Hide()
		end
	end
end

local function OnUpdate(self, event, unit)
	if UnitAffectingCombat(self.unit) then
		local _, _, threatpct, rawthreatpct, _ = UnitDetailedThreatSituation(self.unit, self.tar)
		local threatval = threatpct or 0
		
		self:SetValue(threatval)
		self.text:SetFormattedText("%3.1f", threatval)
		
		local r, g, b = oUF.ColorGradient(threatval,100, 0,.8,0,.8,.8,0,.8,0,0)
		self:SetStatusBarColor(r, g, b)

		if threatval > 0 then
			self:SetAlpha(1)
		else
			self:SetAlpha(0)
		end		
	end
end

ThreatBar:RegisterEvent("PLAYER_ENTERING_WORLD")
ThreatBar:RegisterEvent("PLAYER_REGEN_ENABLED")
ThreatBar:RegisterEvent("PLAYER_REGEN_DISABLED")
ThreatBar:SetScript("OnEvent", OnEvent)
ThreatBar:SetScript("OnUpdate", OnUpdate)
ThreatBar.unit = "player"
ThreatBar.tar = ThreatBar.unit.."target"
ThreatBar.Colors = aggroColors
ThreatBar:SetAlpha(0)