local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- Mastery
----------------------------------------------------------------

if not C.datatext.Mastery == nil or C.datatext.Mastery > 0 then
	local Stat = CreateFrame("Frame", "DataTextMastery", UIParent)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	--Set font based on where.
	if C.datatext.Mastery >= 6 then
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
	else
		Text:SetTextColor(unpack(C.media.pxcolor1))
		Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	end
	PP(C.datatext.Mastery, Text)

	local int = 1
	
	local function Update(self, t)
		int = int - t
		if int < 0 then
			if C.datatext.Mastery >= 6 then
			Text:SetText("|cffFFFFFF"..GetCombatRating(26)..qColor2.." Mastery")
			int = 1
			else
			Text:SetText(qColor..GetCombatRating(26)..qColor2.." Mastery")
			int = 1
			end
		end
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end
