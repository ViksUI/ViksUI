local T, C, L = unpack(ViksUI)

--Lua functions
local select = select
local format, join = string.format, string.join
local ceil = math.ceil
local strform = string.format
local tonumber = tonumber
local tostring = tostring

--WoW API / Variables
local L_EasyMenu = L_EasyMenu
local setCV = SetCVar
local getCV = GetCVar
local IsShiftKeyDown = IsShiftKeyDown

if C.datatext.Volume and C.datatext.Volume > 0 then
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
		Volume = {
			CVar = "Sound_MasterVolume",
			Value = 0
		},
		Enable = {
			CVar = "Sound_EnableMaster",
			Value = 0
		}
	},
	{
		Name = "SFX",
		Volume = {
			CVar = "Sound_SFXVolume",
			Value = 0
		},
		Enable = {
			CVar = "Sound_EnableSXF",
			Value = 0
		}
	},
	{
		Name = "Ambience",
		Volume = {
			CVar = "Sound_AmbienceVolume",
			Value = 0
		},
		Enable = {
			CVar = "Sound_EnableAmbience",
			Value = 0
		}
	},
	{
		Name = "Dialog",
		Volume = {
			CVar = "Sound_DialogVolume",
			Value = 0
		},
		Enable = {
			CVar = "Sound_EnableDialog",
			Value = 0
		}
	},
	{
		Name = "Music",
		Volume = {
			CVar = "Sound_MusicVolume",
			Value = 0
		},
		Enable = {
			CVar = "Sound_EnableMusic",
			Value = 0
		}
	}
}

local activeVolumeIndex = 1
local activeVolume = volumeCVars[activeVolumeIndex]


local function roundVal(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return ceil(num * mult + 0.5) / mult
end

local function OnEvent(self, event, ...)
	for key,value in pairs(volumeCVars) do
		value.Volume.Value = roundVal(getCV(value.Volume.CVar), 3)
		setCV(value.Volume.CVar, value.Volume.Value)
		value.Enable.Value = getCV(value.Enable.CVar)
	end

	if (event == "PLAYER_ENTERING_WORLD" ) then

		self:EnableMouseWheel(true)

		self:SetScript("OnMouseWheel", function(tself, delta)
			local vol = activeVolume.Volume.Value;
			local volScale = 100;
			
			if (IsShiftKeyDown()) then
				volScale = 10;
			end

			vol = vol + (delta / volScale)

			if (vol >= 1) then
				vol = 1
			elseif (vol <= 0) then
				vol = 0
			end
			
			activeVolume.Volume.Value = vol
			setCV(activeVolume.Volume.CVar, vol)
			Text:SetText(activeVolume.Name..": ".. qColor..strform("%.f", vol * 100) .. "%")
		end)

	end
	
	Text:SetText(activeVolume.Name..": ".. qColor..strform("%.f", activeVolume.Volume.Value * 100) .. "%")
		self:SetAllPoints(Text)
		self:SetScript("OnEnter", function()
			if not InCombatLockdown() then
				GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6);
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
				GameTooltip:ClearLines()
				GameTooltip:AddDoubleLine("Scroll to change volume level")
				GameTooltip:AddDoubleLine("Click to switch volum type")
				GameTooltip:Show()
			end
		end)
	self:SetScript("OnLeave", function() GameTooltip:Hide() end)
			
end

Stat:SetScript("OnMouseDown", function(self)
	activeVolumeIndex = activeVolumeIndex + 1
	if (activeVolumeIndex == 6) then
		activeVolumeIndex = 1
	end

	activeVolume = volumeCVars[activeVolumeIndex]
	

	OnEvent(self, nil, nil)
end)

--Stat:RegisterEvent("CVAR_UPDATE")
Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:SetScript("OnEvent", OnEvent)

end
