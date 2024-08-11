local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	Switch theme mouseover button on minimap
----------------------------------------------------------------------------------------
local theme = CreateFrame("Button", "SwitchTheme", UIParent)
theme:SetTemplate("Transparent")
theme:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", -3, 0)
theme:SetSize(18, 18)
theme:SetAlpha(0)

theme.t = theme:CreateTexture(nil, "OVERLAY")
theme.t:SetTexture(C.media.blank)
theme.t:SetVertexColor(unpack(C.media.border_color))
theme.t:SetPoint("TOPLEFT", theme, 2, -2)
theme.t:SetPoint("BOTTOMRIGHT", theme, -2, 2)

local function ThemeBorderC(r, g, b, a)
	if ViksUIOptionsGlobal then
		if ViksUIOptionsGlobal[T.realm] and ViksUIOptionsGlobal[T.realm][T.name] and ViksUIOptionsGlobal[T.realm]["Current_Profile"] then
			local i = tostring(ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name])
			if ViksUIOptionsPerChar[i]["media"] == nil then ViksUIOptionsPerChar[i]["media"] = {} end
			ViksUIOptionsPerChar[i]["media"]["border_color"] = {r, g, b, a}
		else
			local i = tostring(ViksUIOptionsGlobal["Current_Profile"])
			if ViksUIOptions[i]["media"] == nil then ViksUIOptions[i]["media"] = {} end
			ViksUIOptions[i]["media"]["border_color"] = {r, g, b, a}
		end
	end
end

local function ThemeBackdropC(r, g, b, a)
	if ViksUIOptionsGlobal then
		if ViksUIOptionsGlobal[T.realm] and ViksUIOptionsGlobal[T.realm][T.name] and ViksUIOptionsGlobal[T.realm]["Current_Profile"] then
			local i = tostring(ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name])
			ViksUIOptionsPerChar[i]["media"]["backdrop_color"] = {r, g, b, a}
		else
			local i = tostring(ViksUIOptionsGlobal["Current_Profile"])
			ViksUIOptions[i]["media"]["backdrop_color"] = {r, g, b, a}
		end
	end
end

local function ThemeOverlayC(r, g, b, a)
	if ViksUIOptionsGlobal then
		if ViksUIOptionsGlobal[T.realm] and ViksUIOptionsGlobal[T.realm][T.name] and ViksUIOptionsGlobal[T.realm]["Current_Profile"] then
			local i = tostring(ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name])
			ViksUIOptionsPerChar[i]["media"]["overlay_color"] = {r, g, b, a}
		else
			local i = tostring(ViksUIOptionsGlobal["Current_Profile"])
			ViksUIOptions[i]["media"]["overlay_color"] = {r, g, b, a}
		end
	end
end

local function ThemeNoPanels(value)
	if ViksUIOptionsGlobal then
		if ViksUIOptionsGlobal[T.realm] and ViksUIOptionsGlobal[T.realm][T.name] and ViksUIOptionsGlobal[T.realm]["Current_Profile"] then
			local i = tostring(ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name])
			ViksUIOptionsPerChar[i]["panels"]["NoPanels"] = value
		else
			local i = tostring(ViksUIOptionsGlobal["Current_Profile"])
			ViksUIOptions[i]["panels"]["NoPanels"] = value
		end
	end
end

local menuFrame = CreateFrame("Frame", "MinimapSwitchThemeButton", UIParent, "UIDropDownMenuTemplate")
local thememenu = {
	{text = "Style", isTitle = 1, notCheckable = 1, notClickable = 1},
	{text = "Classic", notCheckable = 1, func = function()
		ThemeBorderC(0, .38, .651, 1)
		ThemeBackdropC(.06,.06,.06, 1)
		ThemeOverlayC(0, 0, 0, 0.9)
		ThemeNoPanels(false)
		ReloadUI()
	end},
	{text = "ClassicLine", notCheckable = 1, func = function()
		ThemeBorderC(0, .38, .651, 1)
		ThemeBackdropC(.06,.06,.06, 1)
		ThemeOverlayC(0, 0, 0, 0.5)
		ThemeNoPanels(true)
		ViksUISettingsPerChar.BartenderSet = false
		ReloadUI()
	end},
	{text = "TranspGray", notCheckable = 1, func = function()
		ThemeBorderC(.64, .64, .64, 1)
		ThemeBackdropC(.06,.06,.06, 1)
		ThemeOverlayC(0, 0, 0, 0.5)
		ReloadUI()
	end},
	{text = "Dark", notCheckable = 1, func = function()
		ThemeBorderC(.31, .31, .31, 1)
		ThemeBackdropC(.1, .1, .1, 1)
		ThemeOverlayC(.054, .054, .054, .8)
		ReloadUI()
	end},
	{text = "Black", notCheckable = 1, func = function()
		ThemeBorderC(.125, .125, .125)
		ThemeBackdropC(.05, .05, .05)
		ThemeOverlayC(0, 0, 0, 0.4)
		ReloadUI()
	end},
	{text = format("|cff%02x%02x%02x%s|r", 255 * T.color.r, 255 * T.color.g, 255 * T.color.b, "ClassColor"), notCheckable = 1, func = function()
		ThemeBorderC(T.color.r, T.color.g, T.color.b, 1)
		ThemeBackdropC(.06,.06,.06, 1)
		ThemeOverlayC(0, 0, 0, 0.9)
		ReloadUI()
	end},
}

theme:EnableMouse(true)
theme:SetScript("OnClick", function()
	EasyMenu(thememenu, menuFrame, "cursor", 0, 0, "MENU")
end)

theme:SetScript("OnEnter", function()
	if InCombatLockdown() then return end
	theme:FadeIn()
end)

theme:SetScript("OnLeave", function()
	theme:FadeOut()
end)
