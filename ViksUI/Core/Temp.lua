local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	Temporary stuff
----------------------------------------------------------------------------------------
-- Keep Nameplaye stacked
C_Timer.After(.1, function()
	if not InCombatLockdown() then
        SetCVar("nameplateMotion", 1)
	end
end)