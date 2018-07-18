local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
-- player Haste
--------------------------------------------------------------------

if C.datatext.Haste and C.datatext.Haste > 0 then
	local Stat = CreateFrame("Frame", "DataTextHaste", UIParent)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	PP(C.datatext.Haste, Text)

	local int = 1

	local function Update(self, t)
		spellhaste = GetCombatRating(20)
		rangedhaste = GetCombatRating(19)
		attackhaste = GetCombatRating(18)
		
		if attackhaste > spellhaste and select(2, UnitClass("Player")) ~= "HUNTER" then
			Haste = attackhaste
		elseif select(2, UnitClass("Player")) == "HUNTER" then
			Haste = rangedhaste
		else
			Haste = spellhaste
		end
		
		int = int - t
		if int < 0 then
			Text:SetText(qColor..Haste..qColor2.." ".."Haste")
			int = 1
		end     
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end