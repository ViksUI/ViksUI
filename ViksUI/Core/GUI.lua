local T, C, L, _ = unpack(select(2, ...))
if not IsAddOnLoaded("Viks_ConfigUI") then return end

----------------------------------------------------------------------------------------
--	This Module loads new user settings if ViksUI_Config is loaded
----------------------------------------------------------------------------------------
-- Сreate the profile boolean
if not ViksUIOptionsGlobal then ViksUIOptionsGlobal = {} end
if ViksUIOptionsGlobal[T.realm] == nil then ViksUIOptionsGlobal[T.realm] = {} end
if ViksUIOptionsGlobal[T.realm][T.name] == nil then ViksUIOptionsGlobal[T.realm][T.name] = false end

-- Сreate the main options table
if ViksUIOptions == nil then ViksUIOptions = {} end

-- TODO: Remove Backward compatible for old GUI after while
if GUIConfigSettings then
	ViksUIOptions = GUIConfigSettings
end

if GUIConfigAll and GUIConfigAll[T.realm][T.name] == true then
	ViksUIOptionsGlobal[T.realm][T.name] = true
	ViksUIOptionsPerChar = GUIConfig
end

-- Determine which settings to use
local profile
if ViksUIOptionsGlobal[T.realm][T.name] == true then
	if ViksUIOptionsPerChar == nil then
		ViksUIOptionsPerChar = {}
	end
	profile = ViksUIOptionsPerChar
else
	profile = ViksUIOptions
end

-- Apply or remove saved settings as needed
for group, options in pairs(profile) do
	if C[group] then
		for option, value in pairs(options) do
			if C[group][option] == nil or C[group][option] == value then
				-- remove saved vars if they do not exist in lua config anymore, or are the same as the lua config
				profile[group][option] = nil
			else
				C[group][option] = value
			end
		end
	else
		profile[group] = nil
	end
end

-- Add global options variable
C.options = profile