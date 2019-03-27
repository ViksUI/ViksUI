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
if T.name == "Bauge" or "Vikingdruid" or "Modi" or "ViksDK" or "Honir" or "Bloodwrath" and T.realm == "Quel'Thalas" then
	C["nameplate"].enhance_threat = true
end

----------------------------------------------------------------------------------------
--	Viks Config all chars
----------------------------------------------------------------------------------------
if T.name == "Bauge" or "Reidmar" or "Sneskre" or "Skytter" or "Búre" or "Bure" or "Bor" or "Vikingdruid" or "Modi" or "ViksDK" or "Honir" or "Bloodwrath" and T.realm == "Quel'Thalas" then
	C["general"].welcome_message = false
	C["nameplate"].enhance_threat = true
	C["skins"].rematch = true
	C["skins"].pawn = true
	C["skins"].bigwigs = true
	C["misc"].InfoPanel_Stats = false
	C["misc"].hide_banner = false
	C["media"].fontsize = 14
	C["panels"].NoPanels = false
	C["chat"].spam = false
	C["announcements"].bad_gear = false
	C["announcements"].feasts = false
	C["announcements"].portals = false
	C["unitframe"].RaidShowSolo = true
	C["unitframe"].plugins_smooth_bar = true
	C["Filger"].disable_cd = true
	C["Filger"].enable = false
	C["automation"].accept_quest = true
	C["automation"].accept_invite = true
end