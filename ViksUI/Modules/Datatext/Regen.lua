local T, C, L = unpack(ViksUI)
if not C.datatext.Regen and not C.datatext.Regen > 0 then return end

local regen

local Stat = CreateFrame("Frame", "DataTextRegen", UIParent)
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)

local Text  = Stat:CreateFontString(nil, "OVERLAY")
	if C.datatext.Regen >= 6 then
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
	else
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	end
PP(C.datatext.Regen, Text)

Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:RegisterEvent("PLAYER_REGEN_DISABLED")
Stat:RegisterEvent("PLAYER_REGEN_ENABLED")
Stat:RegisterEvent("UNIT_STATS")
Stat:RegisterEvent("UNIT_AURA")
Stat:SetScript("OnEvent", function(self)
	local base, casting = GetManaRegen()

	if InCombatLockdown() then
		regen = floor(casting*5)
	else
		regen = floor(base*5)		
	end
	if C.datatext.Regen >= 6 then
	Text:SetText("|cffFFFFFF"..regen..qColor2.." "..MANA_REGEN_ABBR)
	else
	Text:SetText(qColor..regen..qColor2.." "..MANA_REGEN_ABBR)
	end
end)
