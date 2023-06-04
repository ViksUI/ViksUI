local T, C, L = unpack(ViksUI)
if C.loot.faster_loot ~= true then return end

----------------------------------------------------------------------------------------
--	Faster auto looting
----------------------------------------------------------------------------------------
local tDelay = 0
local LOOT_DELAY = 0.3

LOOTFRAME_AUTOLOOT_DELAY = 0.1;
LOOTFRAME_AUTOLOOT_RATE = 0.1;
	
local frame = CreateFrame("Frame")
frame:RegisterEvent("LOOT_READY")
frame:SetScript("OnEvent", function ()
	if GetCVarBool("autoLootDefault") ~= IsModifiedClick("AUTOLOOTTOGGLE") then
		if (GetTime() - tDelay) >= LOOT_DELAY then
			for i = GetNumLootItems(), 1, -1 do
				LootSlot(i)
			end
			tDelay = GetTime()
		end
	end
end)
