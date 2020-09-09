local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	ViksUI personal configuration file
--	BACKUP THIS FILE BEFORE UPDATING!
--	ATTENTION: When saving changes to a file encoded file should be in UTF8
----------------------------------------------------------------------------------------
--	Configuration example:
----------------------------------------------------------------------------------------
-- if T.name == "MegaChar" then
--		C["chat"].width = 100500
--		C["tooltip"].cursor = false
--		C["unitframe_class_bar"].totem = false
--		C["position"].tooltip = {"BOTTOMRIGHT", Minimap, "TOPRIGHT", 2, 5}
--		C["position"].bottom_bars = {"BOTTOM", UIParent, "BOTTOM", 2, 8}
--		C["position"].unitframes.tank = {"BOTTOMLEFT", UIParent, "BOTTOM", 176, 68}
--		T.CustomFilgerSpell = {
--			{"T_DEBUFF_ICON", {spellID = 115767, unitID = "target", caster = "player", filter = "DEBUFF"}},
--		}
-- end
----------------------------------------------------------------------------------------
if T.name == "Drachlock" or "Viksdruid" or "Tøttan" or "Tryllefox" or "Týr" or "Deathstorms" or "Bompibjorn" or "Vìk" or "Sløv" or "Mechvik" or "Bauge" or "Reidmar" or "Sneskre" or "Skytter" or "Búre" or "Bure" or "Bor" or "Vikingdruid" or "Modi" or "ViksDK" or "Honir" or "Bloodwrath" or "Tjalla" and T.realm == "Quel'Thalas" then
 Viks = true
 end
----------------------------------------------------------------------------------------
--	Per Class Config (overwrite general)
--	Class need to be UPPERCASE
----------------------------------------------------------------------------------------
if T.class == "DRUID" then

end

----------------------------------------------------------------------------------------
--	Per Character Name Config (overwrite general and class)
--	Name need to be case sensitive
----------------------------------------------------------------------------------------
if T.name == "CharacterName" then

end

----------------------------------------------------------------------------------------
--	Per Max Character Level Config (overwrite general, class and name)
----------------------------------------------------------------------------------------
if T.level ~= MAX_PLAYER_LEVEL then

end

----------------------------------------------------------------------------------------
--	Tank chars @Quel'Thalas Config
----------------------------------------------------------------------------------------
if T.name == "Sløv" or "Bauge" or "Vikingdruid" or "Modi" or "ViksDK" or "Honir" or "Bloodwrath" and T.realm == "Quel'Thalas" then
	C["nameplate"].enhance_threat = true
end

----------------------------------------------------------------------------------------
--	Viks Config all chars
----------------------------------------------------------------------------------------
if Viks then
	C["general"].welcome_message = false
	C["nameplate"].enhance_threat = true
	C["skins"].rematch = true
	C["skins"].opie = true
	C["skins"].pawn = true
	C["skins"].skada = true
	C["skins"].ace3 = true
	C["skins"].dbm = true
	C["skins"].bigwigs = true
	C["misc"].hide_banner = false
	C["media"].fontsize = 14
	C["chat"].spam = true
	C["announcements"].bad_gear = false
	C["announcements"].feasts = false
	C["announcements"].portals = false
	C["announcements"].interrupts = false
	C["announcements"].spells = false
	C["unitframe"].RaidShowSolo = true
	C["unitframe"].plugins_smooth_bar = true
	C["filger"].disable_cd = true
	C["filger"].enable = true
	C["automation"].accept_quest = true
	C["automation"].accept_invite = true
	T.CustomFilgerSpell = {
		{"COOLDOWN", {spellID = 313698, filter = "ICD", trigger = "BUFF", duration = 80}}, -- Gift of the Titans
	}
-- KeyBindings
	--Raidmarkers
	SetBinding ("NUMPAD1", "RAIDTARGET8")
	SetBinding ("NUMPAD2", "RAIDTARGET7")
	SetBinding ("NUMPAD3", "RAIDTARGET6")
	SetBinding ("NUMPAD4", "RAIDTARGET5")
	SetBinding ("NUMPAD5", "RAIDTARGET1")
	SetBinding ("NUMPAD6", "RAIDTARGET4")
	SetBinding ("NUMPAD7", "RAIDTARGET3")
	SetBinding ("NUMPAD8", "RAIDTARGET2")
	SetBinding ("NUMPAD0", "RAIDTARGETNONE")
	--Movment
	SetBinding ("A", "STRAFELEFT")
	SetBinding ("D", "STRAFERIGHT")
end