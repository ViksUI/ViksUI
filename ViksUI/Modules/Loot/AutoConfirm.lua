local T, C, L = unpack(ViksUI)
if C.loot.auto_confirm_de ~= true then return end

----------------------------------------------------------------------------------------
--	Disenchant confirmation(tekKrush by Tekkub)
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("CONFIRM_DISENCHANT_ROLL")
frame:RegisterEvent("CONFIRM_LOOT_ROLL")
frame:RegisterEvent("LOOT_BIND_CONFIRM")
frame:SetScript("OnEvent", function()
	for i = 1, 4 do
		local frame = _G["StaticPopup"..i]
		if (frame.which == "CONFIRM_LOOT_ROLL" or frame.which == "LOOT_BIND") and frame:IsVisible() then
			StaticPopup_OnClick(frame, 1)
		end
	end
end)