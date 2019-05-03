local T, C, L, _ = unpack(select(2, ...))
if T.client ~= "deDE" then return end

------------------------------------------------
L.DataText = {} -- Data Text Locales  -- Needs review
------------------------------------------------

L.DataText.LootSpec = "Loot Specialization"
L.DataText.Garrison = "Garrison"
L.DataText.Zone = "Zone"
L.DataText.AvoidanceBreakdown = "Avoidance Breakdown"
L.DataText.Level = "Lvl"
L.DataText.Boss = "Boss"
L.DataText.Miss = "Miss"
L.DataText.Dodge = "Dodge"
L.DataText.Block = "Block"
L.DataText.Parry = "Parry"
L.DataText.Avoidance = "Avoidance"
L.DataText.AvoidanceShort = "Avd: "
L.DataText.Memory = "Memory"
L.DataText.Hit = "Hit"
L.DataText.Power = "Power"
L.DataText.Mastery = "Mastery"
L.DataText.Crit = "Crit"
L.DataText.Regen = "Regen"
L.DataText.Versatility = "Versatility"
L.DataText.Leech = "Leech"
L.DataText.Multistrike = "Multistrike"
L.DataText.Session = "Session: "
L.DataText.Earned = "Earned:"
L.DataText.Spent = "Spent:"
L.DataText.Deficit = "Deficit:"
L.DataText.Profit = "Profit:"
L.DataText.Character = "Character: "
L.DataText.Server = "Server: "
L.DataText.Gold = "Gold"
L.DataText.TotalGold = "Total: "
L.DataText.GoldShort = "|cffffd700g|r"
L.DataText.SilverShort = "|cffc7c7cfs|r"
L.DataText.CopperShort = "|cffeda55fc|r"
L.DataText.Talents = "Talents"
L.DataText.NoTalent = "No Talents"
L.DataText.Download = "Download: "
L.DataText.Bandwidth = "Bandwidth: "
L.DataText.Guild = "Guild"
L.DataText.NoGuild = "No Guild"
L.DataText.Bags = "Bags"
L.DataText.BagSlots = "Bags Slots"
L.DataText.Friends = "Friends"
L.DataText.Online = "Online: "
L.DataText.Armor = "Armor"
L.DataText.Durability = "Durability"
L.DataText.TimeTo = "Time to"
L.DataText.FriendsList = "Friends list:"
L.DataText.Spell = "SP"
L.DataText.AttackPower = "AP"
L.DataText.Haste = "Haste"
L.DataText.DPS = "DPS"
L.DataText.HPS = "HPS"
L.DataText.Session = "Session: "
L.DataText.Character = "Character: "
L.DataText.Server = "Server: "
L.DataText.Total = "Total: "
L.DataText.SavedRaid = "Saved Raid(s)"
L.DataText.Currency = "Currency"
L.DataText.FPS = "FPS &"
L.DataText.MS = "MS"
L.DataText.FPSAndMS = "FPS & MS"
L.DataText.Critical = " Crit"
L.DataText.Heal = " Heal"
L.DataText.Time = "Time"
L.DataText.ServerTime = "Server Time: "
L.DataText.LocalTime = "Local Time: "
L.DataText.Mitigation = "Mitigation By Level: "
L.DataText.Healing = "Healing: "
L.DataText.Damage = "Damage: "
L.DataText.Honor = "Honor: "
L.DataText.KillingBlow = "Killing Blows: "
L.DataText.StatsFor = "Stats for "
L.DataText.HonorableKill = "Honorable Kills:"
L.DataText.Death = "Deaths:"
L.DataText.HonorGained = "Honor Gained:"
L.DataText.DamageDone = "Damage Done:"
L.DataText.HealingDone = "Healing Done:"
L.DataText.BaseAssault = "Bases Assaulted:"
L.DataText.BaseDefend = "Bases Defended:"
L.DataText.TowerAssault = "Towers Assaulted:"
L.DataText.TowerDefend = "Towers Defended:"
L.DataText.FlagCapture = "Flags Captured:"
L.DataText.FlagReturn = "Flags Returned:"
L.DataText.GraveyardAssault = "Graveyards Assaulted:"
L.DataText.GraveyardDefend = "Graveyards Defended:"
L.DataText.DemolisherDestroy = "Demolishers Destroyed:"
L.DataText.GateDestroy = "Gates Destroyed:"
L.DataText.TotalMemory = "Total Memory Usage:"
L.DataText.ControlBy = "Controlled by:"
L.DataText.CallToArms = "Call to Arms"
L.DataText.ArmError = "Could not get Call To Arms information."
L.DataText.NoDungeonArm = "No dungeons are currently offering a Call To Arms."
L.DataText.CartControl = "Carts Controlled:"
L.DataText.VictoryPts = "Victory Points:"
L.DataText.OrbPossession = "Orb Possessions:"
L.DataText.Slots = {
	[1] = {1, "Head", 1000},
	[2] = {3, "Shoulder", 1000},
	[3] = {5, "Chest", 1000},
	[4] = {6, "Waist", 1000},
	[5] = {9, "Wrist", 1000},
	[6] = {10, "Hands", 1000},
	[7] = {7, "Legs", 1000},
	[8] = {8, "Feet", 1000},
	[9] = {16, "Main Hand", 1000},
	[10] = {17, "Off Hand", 1000},
	[11] = {18, "Ranged", 1000}
}

----------------------------------------------------------------------------------------
--	Localization for deDE client
--	Translation: Alwa, Baine, Chubidu, F5Hellbound, Sinaris, Vienchen
----------------------------------------------------------------------------------------
-- Announce flasks and food
L_ANNOUNCE_FF_NOFOOD = "Kein Essen: "
L_ANNOUNCE_FF_NOFLASK = "Kein Fläschchen: "
L_ANNOUNCE_FF_ALLBUFFED = "Alles drin!"
L_ANNOUNCE_FF_CHECK_BUTTON = "Überprüfe Food und Flask"

-- Says thanks for some spells
L_ANNOUNCE_SS_THANKS = "Danke für "
L_ANNOUNCE_SS_RECEIVED = " erhalten von "

-- Pull countdown announce
L_ANNOUNCE_PC_GO = "GO!"
L_ANNOUNCE_PC_MSG = "Pull %s in %s.."
L_ANNOUNCE_PC_ABORTED = "Pull ABGEBROCHEN!"

-- Announce feasts and portals
L_ANNOUNCE_FP_STAT = "%s bereitet ein %s vor - [%s]."
L_ANNOUNCE_FP_PRE = "%s bereitet ein %s vor."
L_ANNOUNCE_FP_PUT = "%s stellt ein %s auf."
L_ANNOUNCE_FP_CAST = "%s zaubert ein %s."
L_ANNOUNCE_FP_CLICK = "%s zaubert ein %s. Klick!"
L_ANNOUNCE_FP_USE = "%s nahm %s."

-- Announce your interrupts
L_ANNOUNCE_INTERRUPTED = INTERRUPTED

-- Tooltip
L_TOOLTIP_NO_TALENT = "Keine Talente"
L_TOOLTIP_LOADING = "Lade..."
L_TOOLTIP_ACH_STATUS = "Dein Fortschritt:"
L_TOOLTIP_ACH_COMPLETE = "Dein Status: Fertig gestellt am "
L_TOOLTIP_ACH_INCOMPLETE = "Dein Status: Noch nicht Ferig"
L_TOOLTIP_SPELL_ID = "Zauber ID:"
L_TOOLTIP_ITEM_ID = "Gegenstands ID:"
L_TOOLTIP_WHO_TARGET = "Anvisiert von"
L_TOOLTIP_ITEM_COUNT = "Gegenstandsanzahl:"
L_TOOLTIP_INSPECT_OPEN = "Betrachtungsfenster offen"

-- Misc
L_MISC_UNDRESS = "Ausziehen"
L_MISC_DRINKING = " trinkt."
L_MISC_BUY_STACK = "Alt-Klick um einen Stapel zu kaufen"
L_MISC_ONECLICK_BUYOUT = "Shift-Right-Click um den ausgewählten Gegenstand ohne Bestätigung zu kaufen"
L_MISC_ONECLICK_BID = "Shift-Right-Click um auf den ausgewählten Gegenstand ohne Bestätigung zu bieten"
L_MISC_ONECLICK_CANCEL = "Shift-Right-Click um den ausgewählten Gegenstand ohne Bestätigung abzubrechen"
L_MISC_UI_OUTDATED = "Deine Version von ViksUI ist veraltet. Du kannst die aktuelle Version von http://goo.gl/QAj0J6 laden"
L_MISC_HEADER_MARK = "Mausdrüber Raid Icon"
L_MISC_BINDER_OPEN = "Maus gebunden"
L_MISC_GROCERY_BUY = "Kaufen"
L_MISC_GROCERY_DESC = "Kaufe Lebensmittelaschen automatisch"
L_MISC_SCROLL = "Rolle"
L_MISC_COLLAPSE = "The Collapse" -- Need review

-- Raid Utility
L_RAID_UTIL_DISBAND = "Gruppe auflösen"

-- Zone name
L_ZONE_TOLBARAD = "Tol Barad"
L_ZONE_TOLBARADPEN = "Halbinsel von Tol Barad"
L_ZONE_ARATHIBASIN = "Arathibecken"
L_ZONE_GILNEAS = "Die Schlacht um Gilneas"
L_ZONE_ANCIENTDALARAN = "Dalarankrater"

-- WatchFrame Wowhead link
L_WATCH_WOWHEAD_LINK = "Wowhead Link"

-- Toggle Menu
L_TOGGLE_ADDON = "Erweiterung "
L_TOGGLE_ADDONS = " Erweiterungen"
L_TOGGLE_EXPAND = "erweitern "
L_TOGGLE_COLLAPSE = "schließen "
L_TOGGLE_RCLICK = "Rechtsklick zum Aktivieren oder Deaktiveren "
L_TOGGLE_LCLICK = "Links klicken um Fenster aktiv zu halten "
L_TOGGLE_RELOAD = " (benötigt UI neustart)"
L_TOGGLE_NOT_FOUND = " nicht gefunden."

-- UnitFrame
L_UF_GHOST = "Geist"
L_UF_DEAD = "Tod"
L_UF_OFFLINE = "Offline"
L_UF_MANA = "Niedriges Mana"

-- Map
L_MAP_CURSOR = "Mauszeiger: "
L_MAP_BOUNDS = "Außerhalb der Begrenzung!"
L_MAP_FOG = "Nebel des Krieges"
L_MAP_COORDS = "Koordinaten"

-- Minimap
L_MINIMAP_CALENDAR = "Kalender"
L_MINIMAP_HEAL_LAYOUT = "Links-Klick - Heiler Layout"
L_MINIMAP_DPS_LAYOUT = "Rechts-Klick - DPS Layout"
L_MINIMAP_BLIZZ_LAYOUT = "Mittel-Klick - Blizzard Layout"

-- Chat
L_CHAT_WHISPER = "Von"
L_CHAT_BN_WHISPER = "Von"
L_CHAT_AFK = "[AFK]"
L_CHAT_DND = "[DND]"
L_CHAT_GM = "[GM]"
L_CHAT_GUILD = "G"
L_CHAT_PARTY = "P"
L_CHAT_PARTY_LEADER = "PL"
L_CHAT_RAID = "R"
L_CHAT_RAID_LEADER = "RL"
L_CHAT_RAID_WARNING = "RW"
L_CHAT_INSTANCE_CHAT = "I"
L_CHAT_INSTANCE_CHAT_LEADER = "IL"
L_CHAT_OFFICER = "O"
L_CHAT_PET_BATTLE = "PB"
L_CHAT_COME_ONLINE = "ist jetzt |cff298F00online|r."
L_CHAT_GONE_OFFLINE = "ist jetzt |cffff0000offline|r."

-- Errors frame
L_ERRORFRAME_L = "Klick um Fehler anzuzeigen."

-- Bags
L_BAG_BANK = "Bank"
L_BAG_NO_SLOTS = "Can't buy anymore slots!"
L_BAG_COSTS = "Cost: %.2f gold"
L_BAG_BUY_SLOTS = "Buy new slot with /bags purchase yes"
L_BAG_OPEN_BANK = "You need to open your bank first."
L_BAG_SORT = "Sort your bags or your bank, if open."
L_BAG_STACK = "Fill up partial stacks in your bags or bank, if open."
L_BAG_BUY_BANKS_SLOT = "Buy bank slot (need to have bank open)."
L_BAG_SORT_MENU = "Sort"
L_BAG_SORT_SPECIAL = "Sort Special"
L_BAG_STACK_MENU = "Stack"
L_BAG_STACK_SPECIAL = "Stack Special"
L_BAG_SHOW_BAGS = "Zeige Taschen"
L_BAG_SORTING_BAGS = "Sorting finished."
L_BAG_NOTHING_SORT = "Nothing to sort."
L_BAG_BAGS_BIDS = "Using bags: "
L_BAG_STACK_END = "Restacking finished."
L_BAG_RIGHT_CLICK_SEARCH = "Rechtsklick um zu suchen"
L_BAG_STACK_MENU = "Stapeln"
L_BAG_BUTTONS_DEPOSIT = "Deposit Reagents"
L_BAG_BUTTONS_SORT = "LM:Cleanup / RM:Blizzard"
L_BAG_BUTTONS_ARTIFACT = "Right click to use Artifact Power item in bag"
L_BAG_RIGHT_CLICK_CLOSE = "Rechtsklick öffnet Menü"

-- Grab mail
L_MAIL_STOPPED = "Angehalten, Inventar ist voll."
L_MAIL_UNIQUE = "Angehalten, dieses einzigartiges Item befindet sich bereits in der Tasche oder auf der Bank."
L_MAIL_COMPLETE = "Alles Fertig."
L_MAIL_NEED = "Benötige einen Briefkasten."
L_MAIL_MESSAGES = "nachrichten"

-- Loot
L_LOOT_RANDOM = "Zufälliger Spieler"
L_LOOT_SELF = "Selbst nehmen"
L_LOOT_FISH = "Angeln"
L_LOOT_ANNOUNCE = "Ansagen"
L_LOOT_TO_RAID = "  schlachtzug"
L_LOOT_TO_PARTY = "  gruppe"
L_LOOT_TO_GUILD = "  gilde"
L_LOOT_TO_SAY = "  sagen"

-- LitePanels AFK module
L_PANELS_AFK = "Du bist AFK!"
L_PANELS_AFK_RCLICK = "Rechts-Klick zum Verstecken."
L_PANELS_AFK_LCLICK = "Links-Klick um zurück zu gehen."

-- Cooldowns
L_COOLDOWNS = "Abklingzeit: "
L_COOLDOWNS_COMBATRESS = "Battlerezz"
L_COOLDOWNS_COMBATRESS_REMAINDER = "Battlerezz übrig: "
L_COOLDOWNS_NEXTTIME = "Nächste möglichkeit: "

-- Autoinvite
L_INVITE_ENABLE = "Autoinvite AN: "
L_INVITE_DISABLE = "Autoinvite AUS"

-- Bind key
L_BIND_SAVED = "Alle Tastenbelegungen wurden gespeichert."
L_BIND_DISCARD = "Alle grade neu belegten Tastenbelegungen wurden verworfen."
L_BIND_INSTRUCT = "Bewege deine Maus über einen Aktionsbutton um ihn mit einem Hotkey zu belegen. Drücke Escape oder Rechte Maustaste um die aktuelle Tastenbelegeung des Buttons zu löschen."
L_BIND_CLEARED = "Alle Tastaturbelegungen gelöscht für"
L_BIND_BINDING = "Belegung"
L_BIND_KEY = "Taste"
L_BIND_NO_SET = "Keine Tastaturbelegung festgelegt"

-- Info text
L_INFO_ERRORS = "Noch keine Fehler."
L_INFO_INVITE = "Gruppeneinladung akzeptiert von "
L_INFO_DUEL = "Duellanfrage Ignoriert von "
L_INFO_PET_DUEL = "Haustier Duellanfrage Ignoriert von "
L_INFO_DISBAND = "Löse Gruppe auf..."
L_INFO_SETTINGS_DBM = "Gebe /settings dbm ein, um DBM Einstellungen zu laden."
L_INFO_SETTINGS_BIGWIGS = "Gebe /settings bw ein, um BigWigs Einstellungen zu laden."
L_INFO_SETTINGS_MSBT = "Gebe /settings msbt ein, um die MSBT Einstellungen zu laden."
L_INFO_SETTINGS_SKADA = "Gebe /settings skada ein, um die Skada Einstellungen zu laden."
L_INFO_SETTINGS_ALL = "Gebe /settings all ein, um die Einstellungen für alle unterstützten AddOns zu laden."
L_INFO_SETTINGS_CHAT = "Type /settings chat, to apply the default chat settings."
L_INFO_SETTINGS_CVAR = "Type /settings cvar, to apply the default cvar(Game UI) settings."
L_INFO_SETTINGS_ALL = "Type /settings all, to apply the settings for all modifications."
L_INFO_NOT_INSTALLED = " ist nicht installiert."
L_INFO_SKIN_DISABLED1 = "Stilisierung für "
L_INFO_SKIN_DISABLED2 = " ist ausgeschaltet."

-- Popups
L_POPUP_INSTALLUI = "Dies ist Ihre erste Benutzung von ViksUI mit diesem Charakter. Um das Interface zu konfigurieren, wird das UI nun neugeladen."
L_POPUP_RESETUI = "Sind Sie sich sicher, dass Sie die Einstellungen von ViksUI zurückgesetzen wollen?"
L_POPUP_RESETSTATS = "Bist du sicher das du die Gold und verbrachte Zeit Statistik zurücksetzen möchtest?"
L_POPUP_SWITCH_RAID = "Wähle Raid Layout."
L_POPUP_DISBAND_RAID = "Bist du dir sicher, dass du die Gruppe auflösen möchtest?"
L_POPUP_DISABLEUI = "ViksUI funktioniert nicht mit deiner Auflösung, möchtest du ViksUI ausschalten? (Drücke Abbrechen, falls du eine andere Auflösung testen willst)"
L_POPUP_SETTINGS_ALL = "Einstellungen für alle AddOns übernehmen? (DBM, BigWigs, Skada und MSBT)"
L_POPUP_SETTINGS_DBM = "Die Position der DBM Elemente muss verändert werden."
L_POPUP_SETTINGS_BW = "Die Position der BigWigs Elemente muss verändert werden."
L_POPUP_ARMORY = "Waffenkammer"
L_POPUP_CURRENCY_CAP = "Maximalwert erreicht"

-- Welcome message
L_WELCOME_LINE_1 = "Willkommen bei ViksUI "
L_WELCOME_LINE_2_1 = "Gebe /cfg ein um das Interface zu konfigurieren, oder besuche https://discord.gg/Dhp5nHh"
L_WELCOME_LINE_2_2 = "für weitere Informationen."

-- Combat text
L_COMBATTEXT_KILLING_BLOW = "Todesstoß"
L_COMBATTEXT_ALREADY_UNLOCKED = "Kampftext bereits freigegeben."
L_COMBATTEXT_ALREADY_LOCKED = "Kampftext bereits gespert."
L_COMBATTEXT_TEST_DISABLED = "Kampftext Testmodus deaktiviert."
L_COMBATTEXT_TEST_ENABLED = "Kampftext Testmodus aktiviert."
L_COMBATTEXT_TEST_USE_UNLOCK = "Gib '/xct' ein um die Kampftext Fenster freizugeben um sie verschieben und verändern zu können."
L_COMBATTEXT_TEST_USE_LOCK = "Gib '/xct' ein um den Kampftext Testmodus zu sperren."
L_COMBATTEXT_TEST_USE_TEST = "Gib '/xct' ein um den Kampftext Testmodus zu aktivieren."
L_COMBATTEXT_TEST_USE_RESET = "Gib /xct reset ein, um die Standardpositionen wiederherzustellen."
L_COMBATTEXT_POPUP = "Um die Kampftext Fensterpositionen zu sichern muss das Interface neu geladen werden."
L_COMBATTEXT_UNSAVED = "Kampftext Fensterpositionen nicht gespeichert, vergiss nicht das Interface neu zu laden."
L_COMBATTEXT_UNLOCKED = "Kampftext freigegeben."

-- LiteStats
L_STATS_ACC_PLAYED = "Gesamtspielzeit"
L_STATS_ADDED_JUNK = "Junk-Ausnahme hinzugefügt"
L_STATS_REMOVE_EXCEPTION = "Ausnahme hinzufügen/entfernen."
L_STATS_AUTO_REPAIR = "Automatisch reparieren"
L_STATS_GUILD_REPAIR = "Reparieren mithilfe der Gildenbank"
L_STATS_AUTO_SELL = "Junk automatisch verkaufen"
L_STATS_BANDWIDTH = "Bandbreite:"
L_STATS_DOWNLOAD = "Download:"
L_STATS_CLEARED_JUNK = "Junk-Ausnahmeliste gelöscht."
L_STATS_CLEAR_EXCEPTIONS = "Ausnahmenliste löschen."
L_STATS_CURRENCY_RAID = "Schlachtzugs Siegel"
L_STATS_WORLD_MAP = "Klicken, zum Öffnen der World-Map."
L_STATS_CURRENT_XP = "Aktuell/Max XP"
L_STATS_MEMORY_USAGE = "Blizzard UI Speicher Auslastung:"
L_STATS_GARBAGE_COLLECTED = "Abfall zusammengefasst"
L_STATS_CHANGE_SORTING = "[Gilde] Rechts-Klick, zum Ändern der Sortierung und Umschalt-Rechts-Klick zum Umkehren der Reihenfolge."
L_STATS_HIDDEN = "Versteckt"
L_STATS_VIEW_NOTES = "Halte die Alt-Taste gedrückt, zum Anzeigen der Ränge, Notizen und Offizier Notizen."
L_STATS_HR = "std"
L_STATS_INF = "unend"
L_STATS_ALREADY_EXCEPTIONS = "ist bereits in der Ausnahmeliste."
L_STATS_NOT_JUNK = "is not junk."
L_STATS_ITEMLINK = "itemlink"
L_STATS_JUNK_EXCEPTIONS = "Junk-Ausnahmen"
L_STATS_JUNK_LIST = "Junk-Liste"
L_STATS_JUNK_PROFIT = "Junk-Gewinn"
L_STATS_KILLS = "G"
L_STATS_OPEN_CALENDAR = "Links-Klick, zum Öffnen des Kalenders (/cal)."
L_STATS_OPEN_CHARACTER = "Links-Klick, zum Öffnen des Charakterfensters."
L_STATS_OPEN_CURRENCY = "Links-Klick, zum Öffnen des Abzeichen-Fensters."
L_STATS_OPEN_TALENT = "Links-Klick, zum Öffnen des Talentfensters."
L_STATS_XP_RATE = "Level XP-Rate"
L_STATS_IGNORED_ITEMS = "Zeige die aktuell ignorierten Gegenstände."
L_STATS_TOGGLE_TIME = "Lokal/Realm & 24-Stunden-Modus können in den Einstellungen der Uhr gewechselt werden."
L_STATS_LOCATION = "Standort/Koordinaten"
L_STATS_MEMORY = "Speicher"
L_STATS_ON = "AN"
L_STATS_OTHER_OPTIONS = "Weitere Einstellungen können in %s konfiguriert werden"
L_STATS_PLAYED_LEVEL = "Auf diesem Level gespielt"
L_STATS_PLAYED_SESSION = "Diese Sitzung gespielt"
L_STATS_PLAYED_TOTAL = "Gesamt gespielt"
L_STATS_QUEST = "Q"
L_STATS_QUESTS_TO = "Quests/Getötet bis %s"
L_STATS_REMAINING_XP = "Verbleibende XP"
L_STATS_REMOVED_JUNK = "Junk-Ausnahme entfernt"
L_STATS_RESTED_XP = "Erholte XP"
L_STATS_RC_COLLECTS_GARBAGE = "Rechts-Klick sammelt Lua-Abfall."
L_STATS_RC_TIME_MANAGER = "Rechts-Klick, um die Einstellungen der Uhr anzuzeigen."
L_STATS_RC_EXPERIENCE = "Rechts-Klick, zum Wechseln zwischen Erfahrung, gespielte Zeit und Fraktionsüberwachung."
L_STATS_RC_AUTO_REPAIRING = "Rechts-Klick, zum Ein- oder Ausschalten des automatischen Reparieren."
L_STATS_RC_AUTO_SELLING = "Rechts-Klick, zum Ein- oder Ausschalten des automatischen Verkaufen."
L_STATS_RC_TALENT = "Rechts-Klick, zum Wechseln Deiner Talentspezialisierung."
L_STATS_SERVER_GOLD = "Server Gold"
L_STATS_SESSION_GAIN = "Sitzung - Gewinn/Verlust"
L_STATS_SESSION_XP = "Sitzung - XP Rate"
L_STATS_INSERTS_COORDS = "Umschalt-Klick auf das Standort/Koordination Modul, zum Einfügen Deiner aktuellen Koordinaten in den Chat."
L_STATS_EQUIPMENT_CHANGER = "Umschalt-Klick oder Mittel-Klick für den Ausrüstungsmanager."
L_STATS_SORTING_BY = "Sortieren nach"
L_STATS_TIPS = "Tipps:"
L_STATS_TOTAL_MEMORY_USAGE = "Gesamte Speicherausnutzung:"
L_STATS_NOT_TO_SELL = "Verwende /junk zum Konfigurieren der Gegenstände, die nicht verkauft werden sollen."
L_STATS_WATCH_CURRENCY = "Bereits gesehene Gegenstände aus dem Abzeichen-Fenster werden im Tooltip angezeigt."
L_STATS_WATCH_FACTIONS = "Überwache Fraktionen aus dem Ruffenster."
L_STATS_TOOLTIP_TIME_PLAYED = "Wenn das max. Level erreicht ist, wird das Tooltip die gespielte Zeit für den Account anzeigen."
L_STATS_TOOLTIP_EXPERIENCE = "Wenn unter dem max. Level, wird ein Tooltip mit weiteren Details angezeigt."
L_STATS_SEALS = "Angebot der Woche"
L_STATS_TOTAL_CPU_USAGE = "Total CPU Usage:" -- Need review
L_STATS_SPEC = "Spec" -- Need review

-- Slash commands
L_SLASHCMD_HELP = {
	"Available slash commands:",
	"/rl - Interface neu laden.",
	"/rc - Starte Bereitschaftscheck.",
	"/gm - Öffne das Game Master Fenster.",
	"/dis ADDON_NAME - Deaktiviere Addon.",
	"/en ADDON_NAME - Aktiviere Addon.",
	"/rd - Gruppe oder Schlachtzug auflösen.",
	"/toraid - In Gruppe oder Schlachtzug umwandeln.",
	"/teleport - Teleport vom beliebigen Dungeon.",
	"/spec, /ss - Zwischen den Talenten wechseln.",
	"/heal - Zum Heiler Layout wechseln.",
	"/dps - Zum DPS Layout wechseln.",
	"/frame - Beschreibung nicht verfügbar.",
	"/farmmode - Erhöht die Größe der Minimap.",
	"/moveui - Ermöglicht das Bewegen der Interface Elemente.",
	"/moveui reset - Resets the movment done by /moveui.",
	"/resetui - Zurücksetzen der allgemeinen Einstellungen auf die Standardwerte.",
	"/resetuf - Zurücksetzen der Einheitenfenster auf die Standardposition.",
	"/resetconfig - Zurücksetzen der ViksUI_Config Einstellungen.",
	"/resetstats - Gold Statistik und gespielte Zeit zurücksetzen.",
	"/settings ADDON_NAME - Einstellungen für msbt, dbm, skada, oder alle Addons anwenden.",
	"/ls, /litestats - Hilfe für LiteStats.",
	"/bags - Managing for bags.",
	"/xct - Kampflogtext verwalten.",
	"/raidcd - Abklingzeiten für Schlachtzüge testen.",
	"/enemycd - Gegnerische Abklingzeiten testen.",
	"/pulsecd - Pulsierende Abklingzeiten testen.",
	"/threat - Bedrohungsmeter testen.",
	"/tt - Ziehl anflüstern.",
	"/ainv - Automatisches Einladen aktivieren.",
	"/testuf - Einheitenfenster testen.",
	"/cfg - Interface Einstellungen öffnen.",
	"/installui - Opens installer.",
	"/vbt - Opens Bartender Select Profile.",
}