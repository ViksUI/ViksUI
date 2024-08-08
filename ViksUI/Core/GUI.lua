local T, C, L = unpack(ViksUI)

-- Spells lists initialization
C.filger.buff_spells_list = {}
C.filger.proc_spells_list = {}
C.filger.debuff_spells_list = {}
C.filger.aura_bar_spells_list = {}
C.filger.cd_spells_list = {}
C.filger.ignore_spells_list = {}
C.unitframe.plugins_aura_watch_list = {}
C.announcements.spells_list = {}
C.raidcooldown.spells_list = {}
C.raidcooldown.spells_list_ver = 1
C.enemycooldown.spells_list = {}
C.enemycooldown.spells_list_ver = 1
C.pulsecooldown.spells_list = {}
C.nameplate.debuffs_list = {}
C.nameplate.buffs_list = {}
C.combattext.spells_list = {}
C.chat.spam_list = ""
C.font.global_font = false
C.media.profile = "-- Insert Your code here\n"
C.general.choose_profile = 1
C.general.profile_name = "1"
C.options = {}

if not IsAddOnLoaded("Viks_ConfigUI") then return end

----------------------------------------------------------------------------------------
--	This Module loads new user settings if Viks_ConfigUI is loaded
----------------------------------------------------------------------------------------
-- Create the profile boolean
if not ViksUIOptionsGlobal then ViksUIOptionsGlobal = {} end
if ViksUIOptionsGlobal[T.realm] == nil then ViksUIOptionsGlobal[T.realm] = {} end
if ViksUIOptionsGlobal[T.realm][T.name] == nil then ViksUIOptionsGlobal[T.realm][T.name] = false end
if ViksUIOptionsGlobal[T.realm]["Current_Profile"] == nil then ViksUIOptionsGlobal[T.realm]["Current_Profile"] = {} end

-- Create the main options table
if ViksUIOptions == nil then ViksUIOptions = {} end

-- Determine which settings to use
local profile
if ViksUIOptionsGlobal[T.realm][T.name] == true then
	if ViksUIOptionsPerChar == nil then
		ViksUIOptionsPerChar = ViksUIOptions
		ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name] = ViksUIOptionsGlobal["Current_Profile"] or 1
	end

	ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name] = ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name] or 1
	local i = tostring(ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name])
	ViksUIOptionsPerChar[i] = ViksUIOptionsPerChar[i] or {}
	profile = ViksUIOptionsPerChar[i]
else
	ViksUIOptionsGlobal["Current_Profile"] = ViksUIOptionsGlobal["Current_Profile"] or 1
	local i = tostring(ViksUIOptionsGlobal["Current_Profile"])
	ViksUIOptions[i] = ViksUIOptions[i] or {}
	profile = ViksUIOptions[i]
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
		-- profile[group] = nil
	end
end

-- Add global options variable
C.options = profile

-- Load edited profile code
loadstring("local T, C, L = unpack(ViksUI)\n"..C["media"].profile)()