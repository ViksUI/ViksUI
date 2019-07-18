local T, C, L, _ = unpack(select(2, ...))
if C.automation.auto_collapse ~= true then return end

----------------------------------------------------------------------------------------
--	Auto collapse ObjectiveTrackerFrame
----------------------------------------------------------------------------------------
if C.automation.auto_collapse or C.automation.auto_collapse_reload then
	local collapse = CreateFrame("Frame")
	collapse:RegisterEvent("PLAYER_ENTERING_WORLD")
	collapse:SetScript("OnEvent", function()
		if C.automation.auto_collapse and not C.automation.auto_collapse_reload then
			if IsInInstance() then
				ObjectiveTracker_Collapse()
			elseif ObjectiveTrackerFrame.collapsed and not InCombatLockdown() then
				ObjectiveTracker_Expand()
			end
		elseif C.automation.auto_collapse_reload or C.automation.auto_collapse_login then
			ObjectiveTracker_Collapse()
		end
	end)
end