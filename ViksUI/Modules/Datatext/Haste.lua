local T, C, L = unpack(ViksUI)
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
	if InCombatLockdown() then return end
		local spellhaste = GetCombatRating(20)
		local rangedhaste = GetCombatRating(19)
		local attackhaste = GetCombatRating(18)

		local function safeVal(val)
			return T.NotSecretValue(val) and val or "N/A"
		end

		-- Defensive assignment
		local Haste
		if attackhaste > spellhaste and select(2, UnitClass("Player")) ~= "HUNTER" then
			Haste = safeVal(attackhaste)
		elseif select(2, UnitClass("Player")) == "HUNTER" then
			Haste = safeVal(rangedhaste)
		else
			Haste = safeVal(spellhaste)
		end

		Text:SetText(qColor..Haste..qColor2.." ".."Haste")
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end