local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	Temporary stuff
----------------------------------------------------------------------------------------
local VigorBar = CreateFrame("Frame", "VigorBar", UIParent)
VigorBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 190)
VigorBar:SetSize(300, 50)

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)

UIWidgetPowerBarContainerFrame:SetParent(VigorBar)
UIWidgetPowerBarContainerFrame:ClearAllPoints()
UIWidgetPowerBarContainerFrame:SetPoint("CENTER", VigorBar, "CENTER", 0, 0)
UIWidgetPowerBarContainerFrame:SetScale(0.8)
end)