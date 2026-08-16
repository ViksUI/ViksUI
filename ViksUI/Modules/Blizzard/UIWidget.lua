local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	UIWidget position
----------------------------------------------------------------------------------------
local top, below, power = _G["UIWidgetTopCenterContainerFrame"], _G["UIWidgetBelowMinimapContainerFrame"], _G["UIWidgetPowerBarContainerFrame"]

-- Top Widget
local topAnchor = CreateFrame("Frame", "UIWidgetTopAnchor", UIParent)
topAnchor:SetSize(200, 30)
if C.toppanel.enable then
	topAnchor:SetPoint(C.position.uiwidget_top[1], C.position.uiwidget_top[2], C.position.uiwidget_top[3], C.position.uiwidget_top[4], C.position.uiwidget_top[5] - 30)
else
	topAnchor:SetPoint(unpack(C.position.uiwidget_top))
end

top:ClearAllPoints()
top:SetPoint("TOP", topAnchor)

-- Below Widget
local belowAnchor = CreateFrame("Frame", "UIWidgetBelowAnchor", UIParent)
belowAnchor:SetSize(150, 30)

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		if not belowAnchor:IsUserPlaced() then
			belowAnchor:ClearAllPoints()
			belowAnchor:SetPoint(unpack(C.position.uiwidget_below))
		end
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end)

hooksecurefunc(below, "SetPoint", function(self, _, anchor)
	if anchor and anchor ~= belowAnchor then
		self:ClearAllPoints()
		self:SetPoint("TOP", belowAnchor)
	end
end)

-- Power Bar Widget
local powerAnchor = CreateFrame("Frame", "UIWidgetPowerBarAnchor", UIParent)
powerAnchor:SetSize(210, 30)
powerAnchor:SetPoint(unpack(C.position.uiwidget_below))

hooksecurefunc(power, "SetPoint", function(self, _, anchor)
	if anchor and anchor ~= powerAnchor then
		self:ClearAllPoints()
		self:SetPoint("TOP", powerAnchor)
	end
end)

-- Mover for all widgets
for _, frame in pairs({top, below}) do
	local anchor = frame == top and topAnchor or frame == below and belowAnchor
	anchor:SetMovable(true)
	anchor:SetClampedToScreen(true)
	frame:SetClampedToScreen(true)
	frame:SetScript("OnMouseDown", function(_, button)
		if IsAltKeyDown() or IsShiftKeyDown() then
			anchor:ClearAllPoints()
			anchor:StartMoving()
		elseif IsControlKeyDown() and button == "RightButton" then
			anchor:ClearAllPoints()
			if frame == top then
				anchor:SetPoint(unpack(C.position.uiwidget_top))
			elseif frame == below then
				anchor:SetPoint(unpack(C.position.uiwidget_below))
			else
				anchor:SetPoint("TOPRIGHT", BuffsAnchor, "BOTTOMRIGHT", 0, -3)
			end
			anchor:SetUserPlaced(false)
		end
	end)
	frame:SetScript("OnMouseUp", function()
		anchor:StopMovingOrSizing()
	end)
end

----------------------------------------------------------------------------------------
--	UIWidget skin
----------------------------------------------------------------------------------------
-- 12.1 SAFE MODE
--
-- Blizzard's UIWidget templates now pass secret dimensions through their native
-- LayoutFrame/TextWithSubtext setup/layout path. ViksUI must not modify individual
-- widget frames or hook their Setup methods, because doing so can taint Blizzard's
-- secure widget layout code.
--
-- Keep the container positioning/movers above. Individual widget styling is
-- intentionally disabled in this 12.1 build until the native widget layout path
-- is confirmed clean.
--
-- This removes:
--   * UPDATE_UI_WIDGET per-widget skinning
--   * UPDATE_ALL_UI_WIDGETS per-widget skinning
--   * UIWidgetTemplateScenarioHeaderCurrenciesAndBackgroundMixin:Setup hook
--   * UIWidgetTemplateStatusBarMixin:Setup hook
--   * UIWidgetBaseSpellTemplateMixin:Setup hook
--   * UIWidgetBaseItemTemplateMixin:Setup hook
--   * UIWidgetTemplateTextWithStateMixin:Setup hook
--
-- Do NOT add those hooks back until each widget type has been tested against
-- the 12.1 secret-value/layout restrictions.
