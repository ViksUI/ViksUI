local T, C, L = unpack(ViksUI)
if C.announcements.drinking ~= true then return end

----------------------------------------------------------------------------------------
--	Announce enemy drinking in arena(by Duffed)
----------------------------------------------------------------------------------------
local drinkSpell = {
	[GetSpellInfo(118358)] = true,	-- Drink
	[GetSpellInfo(167152)] = true,	-- Refreshment
	[GetSpellInfo(167268)] = true,	-- Ba'ruun's Bountiful Bloom
}

local frame = CreateFrame("Frame")
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
frame:SetScript("OnEvent", function(_, event, ...)
	if not (event == "UNIT_SPELLCAST_SUCCEEDED" and C_PvP.GetZonePVPInfo() == "arena") then return end

	local unit, _, spellID = ...
	if UnitIsEnemy("player", unit) and drinkSpell[GetSpellInfo(spellID)] then
		C_ChatInfo.SendChatMessage(UnitClass(unit).." "..UnitName(unit)..L_MISC_DRINKING, T.CheckChat(true))
	end
end)