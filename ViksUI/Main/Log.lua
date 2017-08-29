local T, C, L, _ = unpack(select(2, ...))
local csf = CreateFrame("Frame")
csf:SetScript("OnEvent", function()
--SetCVar("cameraDistanceMax", 50)
--SetCVar("cameraDistanceMaxFactor", 3.4)
SetCVar("ShowClassColorInNameplate", 1)
--SetCVar("consolidateBuffs",0) 
SetCVar("scriptErrors", 1)
SetCVar("buffDurations",1)

end)
csf:RegisterEvent("PLAYER_ENTERING_WORLD")

----------------------------------------------------------------------------------------
-- Launcher
----------------------------------------------------------------------------------------
local function positionsetup()
	SavedOptionsPerChar = {}
end

local ViksOnLogon = CreateFrame("Frame")
ViksOnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
ViksOnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	
	if (SavedStats == nil) then SavedStats = {} end
	if (SavedOptionsPerChar == nil) then SavedOptionsPerChar = {} end
	
		SetCVar("useuiscale", 1)
		if C.general.uiscale > 1 then C.general.uiscale = 1 end
		if C.general.uiscale < 0.64 then C.general.uiscale = 0.64 end
		SetCVar("uiscale", C.general.uiscale)
	
	print("Welcome to |cFF00A2FFViks UI|r")
	print(" ")
	print("|cFF00A2FF/config |r - Config Viks UI;")
	print("|cFF00A2FF/ui |r - Command for change all UI positions.")
	print("|cFF00A2FF/ui reset |r - Set default UI postions.")
end)