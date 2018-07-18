local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
-- Crit (Spell or Melee.. or ranged)
--------------------------------------------------------------------

if C.datatext.Crit and C.datatext.Crit > 0 then
	local Stat = CreateFrame("Frame", "DataTextCrit", UIParent)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	PP(C.datatext.Crit, Text)

	local int = 1

	local function Update(self, t)
		int = int - t
		meleeCrit = GetCritChance()
		spellCrit = GetSpellCritChance(1)
		rangedCrit = GetRangedCritChance()
		if spellCrit > meleeCrit then
			CritChance = spellCrit
		elseif select(2, UnitClass("Player")) == "HUNTER" then    
			CritChance = rangedCrit
		else
			CritChance = meleeCrit
		end
		if int < 0 then
			Text:SetText(qColor..format("%.2f", CritChance) .."%".. qColor2.."Crit")
			int = 1
		end     
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end