local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- Primary Stat
--------------------------------------------------------------------

if not C.datatext.Power and not C.datatext.Power > 0 then return end

local Stat = CreateFrame("Frame", "DataTextPower", UIParent)
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)

local Text  = Stat:CreateFontString(nil, "OVERLAY")
if C.datatext.Power >= 6 then
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end

PP(C.datatext.Power, Text)

local UnitStat = UnitStat

Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:RegisterEvent("PLAYER_REGEN_DISABLED")
Stat:RegisterEvent("PLAYER_REGEN_ENABLED")
Stat:RegisterEvent("UNIT_STATS")
Stat:RegisterEvent("UNIT_AURA")
	
Stat:SetScript("OnEvent", function(self)
	SPECIALIZATION_CACHE = {}
	for index = 1, GetNumSpecializations() do
		local id, name, _, icon, _, statID = GetSpecializationInfo(index)

		if id then
			SPECIALIZATION_CACHE[index] = { id = id, name = name, icon = icon, statID = statID }
			SPECIALIZATION_CACHE[id] = { name = name, icon = icon }
		end
	end

	local Spec = GetSpecialization()
	local StatID = Spec and SPECIALIZATION_CACHE[Spec] and SPECIALIZATION_CACHE[Spec].statID

	local name = StatID and _G['SPELL_STAT'..StatID..'_NAME']
		if name then
			name = gsub(name,"Strength","Str")
			name = gsub(name,"Agility","Agi")
			name = gsub(name,"Intellect","Int")
			name = gsub(name,"Stamina","Stam")
			name = gsub(name,"Versatility","Vers")
		end

	if name then
		Text:SetText(qColor..name..qColor2.." ".. UnitStat('player', StatID))      
	else
		Text:SetText(qColor.."N/A")
	end
end)