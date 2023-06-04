local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- RunningSpeed
--------------------------------------------------------------------

if C.datatext.RunSpeed and C.datatext.RunSpeed > 0 then
	local Stat = CreateFrame("Frame", "DataTextRunSpeed", UIParent)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = Stat:CreateFontString(nil, "OVERLAY")
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	PP(C.datatext.RunSpeed, Text)

	local HowRunning

	local function Update(self, elapsed)
		HowRunning = "player"
		if UnitInVehicle("player") then
			HowRunning = "vehicle"
		end
		RunSpeed = string.format("%.0f",  GetUnitSpeed(HowRunning) / 7 * 100 ) .. "%"
		--if int < 0 then
			Text:SetText(qColor2.."Speed: "..qColor..string.format("%.0f",  GetUnitSpeed(HowRunning) / 7 * 100 ) .. "%")

		--end     
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end
