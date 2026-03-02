local T, C, L = unpack(ViksUI)

local format, join = string.format, string.join
local ceil = math.ceil
local strform = string.format

--WoW API / Variables
local setCV = C_CVar.SetCVar
local getCV = C_CVar.GetCVar
local IsShiftKeyDown = IsShiftKeyDown

if C.datatext.Volume and C.datatext.Volume > 0 then
	-- Todo: Clean up old saved variables, remove later
	if C.datatext.VolumeSettings then
		C.datatext.VolumeSettings = nil
	end

	local Stat = CreateFrame("Frame", "DataTextVolume", UIParent)
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	if C.datatext.Volume >= 9 then
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
	else
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	end
	PP(C.datatext.Volume, Text)
	
local volumeCVars = {
	{
		Name = "Master",
		CVar = "Sound_MasterVolume"
	},
	{
		Name = "SFX",
		CVar = "Sound_SFXVolume"
	},
	{
		Name = "Ambience",
		CVar = "Sound_AmbienceVolume"
	},
	{
		Name = "Dialog",
		CVar = "Sound_DialogVolume"
	},
	{
		Name = "Music",
		CVar = "Sound_MusicVolume"
	}
}

local activeVolumeIndex = 1

-- Clamp volume to 0-1 range
local function clampVolume(vol)
	if vol > 1 then
		return 1
	elseif vol < 0 then
		return 0
	end
	return vol
end

-- Get current volume from CVar
local function getVolume(cvar)
	local vol = tonumber(getCV(cvar)) or 0
	return clampVolume(vol)
end

-- Set volume to CVar
local function setVolume(cvar, vol)
	vol = clampVolume(vol)
	setCV(cvar, vol)
	return vol
end

-- Update display text
local function updateDisplay()
	local activeVolume = volumeCVars[activeVolumeIndex]
	local vol = getVolume(activeVolume.CVar)
	Text:SetText(activeVolume.Name .. ": " .. qColor .. strform("%.0f", vol * 100) .. "%")
end

local function OnEvent(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		self:EnableMouseWheel(true)

		self:SetScript("OnMouseWheel", function(tself, delta)
			local activeVolume = volumeCVars[activeVolumeIndex]
			local vol = getVolume(activeVolume.CVar)
			
			if IsShiftKeyDown() then
				vol = vol + (delta * 0.1)  -- Shift+Scroll = 10%
			else
				vol = vol + (delta * 0.01)  -- Normal Scroll = 1%
			end
			
			setVolume(activeVolume.CVar, vol)
			updateDisplay()
		end)

		self:SetScript("OnEnter", function()
			if not InCombatLockdown() then
				GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6)
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
				GameTooltip:ClearLines()
				GameTooltip:AddDoubleLine("Scroll to change volume level")
				GameTooltip:AddDoubleLine("Shift+Scroll for 10%")
				GameTooltip:AddDoubleLine("Click to switch volume type")
				GameTooltip:Show()
			end
		end)

		self:SetScript("OnLeave", function() GameTooltip:Hide() end)
	end

	updateDisplay()
	self:SetAllPoints(Text)
end

Stat:SetScript("OnMouseDown", function(self)
	activeVolumeIndex = activeVolumeIndex + 1
	if activeVolumeIndex == 6 then
		activeVolumeIndex = 1
	end
	updateDisplay()
end)

Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:SetScript("OnEvent", OnEvent)

end