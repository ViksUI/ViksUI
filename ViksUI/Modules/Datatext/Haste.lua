local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- player Haste
--------------------------------------------------------------------

if C.datatext.Haste and C.datatext.Haste > 0 then
local _, class = UnitClass("player")
local classcolor = RAID_CLASS_COLORS[class]
local qColor = ("|cff%.2x%.2x%.2x"):format(classcolor.r * 255, classcolor.g * 255, classcolor.b * 255)
local br, bg, bb = unpack(C.media.border_color)
local qColor2 = ("|cff%.2x%.2x%.2x"):format(br * 255, bg * 255, bb * 255)

	local Stat = CreateFrame("Frame", "DataTextHaste", UIParent)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text = Stat:CreateFontString(nil, "OVERLAY")
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
	PP(C.datatext.Haste, Text)

	local lastValidValue = "0"
	local lastValidText = ""

	local function IsInMythicPlus()
		local _, _, _, _, _, _, _, instanceType = GetInstanceInfo()
		return instanceType == "party" and IsInGroup() and not IsInRaid()
	end

	local function Update()
		if InCombatLockdown() or IsInMythicPlus() then 
			if lastValidText ~= "" then
				Text:SetText(lastValidText)
			end
			return 
		end
		
		-- Wrap the entire rating fetch in pcall to handle taint errors gracefully
		local success, spellhaste = pcall(GetCombatRating, 20)
		local success2, rangedhaste = pcall(GetCombatRating, 19)
		local success3, attackhaste = pcall(GetCombatRating, 18)
		
		if not success or not success2 or not success3 then
			if lastValidText ~= "" then
				Text:SetText(lastValidText)
			else
				Text:SetText(qColor.."--"..qColor2.." Haste")
			end
			return
		end

		local function safeVal(val)
			return type(val) == "number" and val or 0
		end

		local hasteValue
		local _, class = UnitClass("player")
		
		if attackhaste and spellhaste and attackhaste > spellhaste and class ~= "HUNTER" then
			hasteValue = safeVal(attackhaste)
		elseif class == "HUNTER" and rangedhaste then
			hasteValue = safeVal(rangedhaste)
		else
			hasteValue = safeVal(spellhaste)
		end

		lastValidValue = hasteValue
		lastValidText = qColor..hasteValue..qColor2.." Haste"
		Text:SetText(lastValidText)
	end

	-- Register events instead of using OnUpdate
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:RegisterEvent("PLAYER_REGEN_ENABLED")
	Stat:RegisterEvent("UNIT_STATS")
	Stat:RegisterEvent("UNIT_ATTACK")
	Stat:RegisterEvent("UNIT_ATTACK_SPEED")
	Stat:RegisterEvent("CHARACTER_POINTS_CHANGED")
	Stat:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	
	Stat:SetScript("OnEvent", Update)
	Stat:SetScript("OnUpdate", nil)
	
	Update()
end