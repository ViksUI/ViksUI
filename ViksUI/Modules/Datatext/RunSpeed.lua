local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- RunningSpeed
--------------------------------------------------------------------

if C.datatext.RunSpeed and C.datatext.RunSpeed > 0 then
local _, class = UnitClass("player")
local classcolor = RAID_CLASS_COLORS[class]
local qColor = ("|cff%.2x%.2x%.2x"):format(classcolor.r * 255, classcolor.g * 255, classcolor.b * 255)
local br, bg, bb = select(1, unpack(C.media.border_color))
local qColor2 = ("|cff%.2x%.2x%.2x"):format(br * 255, bg * 255, bb * 255)

	local Stat = CreateFrame("Frame", "DataTextRunSpeed", UIParent)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text = Stat:CreateFontString(nil, "OVERLAY")
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	PP(C.datatext.RunSpeed, Text)

	local lastValidText = ""

	local function IsInMythicPlus()
		local _, _, _, _, _, _, _, instanceType = GetInstanceInfo()
		return instanceType == "party" and IsInGroup() and not IsInRaid()
	end

	local function Update()
		if IsInMythicPlus() then
			if lastValidText ~= "" then
				Text:SetText(lastValidText)
			end
			return
		end
		
		if InCombatLockdown() then 
			return 
		end
		
		local success, inVehicle = pcall(UnitInVehicle, "player")
		local unit = (success and inVehicle) and "vehicle" or "player"
		
		local speed = 0
		local success, speedValue = pcall(GetUnitSpeed, unit)
		if success and type(speedValue) == "number" then
			speed = speedValue
		end
		
		if speed > 0 then
			local percent = (speed / 7) * 100
			local runSpeed = string.format("%.0f%%", percent)
			lastValidText = qColor2.."Speed: "..qColor..runSpeed
			Text:SetText(lastValidText)
		else
			lastValidText = qColor2.."Speed: "..qColor.."--%"
			Text:SetText(lastValidText)
		end
	end

	Stat:SetScript("OnUpdate", Update)
	Stat:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	Stat:RegisterEvent("ZONE_CHANGED")
	Stat:SetScript("OnEvent", Update)
	Update()
end