local _, L = ...
if GetLocale() ~= "deDE" then return end

----------------------------------------------------------------------------------------
--	Localization for deDE client
--	Translation: Alwa, Baine, Chubidu, Vienchen
----------------------------------------------------------------------------------------
L_GUI_SET_SAVED_SETTTINGS = "Einstellungen für jeden Charakter einzeln vornehmen"
L_GUI_SET_SAVED_SETTTINGS_DESC = "Switch between a profile that applies to all characters and one that is unique to this character." -- Need review
L_GUI_RESET_CHAR = "Bist du sicher, dass du die Charaktereinstellungen für ViksUI zurücksetzen willst?"
L_GUI_RESET_ALL = "Bist du sicher, dass du alle Einstellungen von ViksUI zurücksetzen willst?"
L_GUI_PER_CHAR = "Bist du sicher, dass du 'Einzelne Einstellungen für jeden Charakter' ein oder ausschalten möchtest?"
L_GUI_NEED_RELOAD = "|cffff2735Benutzeroberfläche erneut laden, um Ihre Änderungen zu übernehmen.|r"

-- General options
L_GUI_GENERAL_SUBTEXT = "Diese Einstellungen steuern die allgemeinen Einstellungen der Benutzeroberfläche. Geben Sie im Chat '/uihelp ein, um Hilfe zu erhalten."
L_GUI_GENERAL_WELCOME_MESSAGE = "Welcome message in chat"
L_GUI_GENERAL_AUTOSCALE = "Auto UI Scale"
L_GUI_GENERAL_UISCALE = "UI Scale (if auto-scale is disabled)"
L.media_border_color = "Color for borders"
L.media_backdrop_color = "Color for borders backdrop"
L.media_overlay_color = "Color for action bars overlay"
L.media_pxcolor1 = "Color for Name on Datatex"
L.media_pxcolor2 = "Color for Value on Datatext if not dynamic color by value"
L.media_backdrop_alpha = "Alpha for transparent backdrop"
L.media_subheader_pixel = "Change Pixel font"
L.media_subheader_pixel2 = "Change Pixel font for Headers"
L.media_subheader_Dcolor = "Change color for DataTexts"

-- Font options
L.font = "Schriftart"
L.font_subtext = "Anpassen der einzelne Schriftarten für Elemente."
L.font_stats_font = "Schriftart auswählen"
L.font_stats_font_style = "Schriftart Flag"
L.font_stats_font_shadow = "Schriftart Schatten"
L.font_subheader_stats = "Stats Schriftart"
L.font_subheader_combat = "Combat Text Schriftart"
L.font_subheader_chat = "Chat Text Schriftart"
L.font_subheader_chat_tabs = "Chat Tabs Schriftart"
L.font_subheader_action = "Action bars font" -- Need review
L.font_subheader_threat = "Threat meter font" -- Need review
L.font_subheader_raidcd = "Raid cooldowns font" -- Need review
L.font_subheader_cooldown = "Cooldowns timer font" -- Need review
L.font_subheader_loot = "Loot font" -- Need review
L.font_subheader_nameplates = "Nameplates font" -- Need review
L.font_subheader_unit = "Unit frames font" -- Need review
L.font_subheader_aura = "Auras font" -- Need review
L.font_subheader_filger = "Filger font" -- Need review
L.font_subheader_style = "Stylization font" -- Need review
L.font_subheader_bag = "Bags font" -- Need review

-- Skins options
L_GUI_SKINS = "Stylization"
L_GUI_SKINS_SUBTEXT = "Change the appearance of the standard interface."
L_GUI_SKINS_BLIZZARD = "Enable styling Blizzard frames"
L_GUI_SKINS_MINIMAP_BUTTONS = "Enable styling addons icons on minimap"
L_GUI_SKINS_SUBHEADER = "Stylization of addons"
L_GUI_SKINS_ACE3 = "Ace3"
L_GUI_SKINS_ATLASLOOT = "AtlasLoot"
L_GUI_SKINS_BLOOD_SHIELD_TRACKER = "BloodShieldTracker"
L_GUI_SKINS_BW = "BigWigs"
L_GUI_SKINS_CAPPING = "Capping"
L_GUI_SKINS_CLIQUE = "Clique"
L_GUI_SKINS_COOL_LINE = "CoolLine"
L_GUI_SKINS_DBM = "DBM"
L_GUI_SKINS_DBM_MOVABLE = "Allow to move DBM bars"
L_GUI_SKINS_DOMINOS = "Dominos"
L_GUI_SKINS_FLYOUT_BUTTON = "FlyoutButtonCustom"
L_GUI_SKINS_LS_TOASTS = "ls: Toasts"
L_GUI_SKINS_MAGE_NUGGETS = "MageNuggets"
L_GUI_SKINS_MY_ROLE_PLAY = "MyRolePlay"
L_GUI_SKINS_NPCSCAN = "NPCScan"
L_GUI_SKINS_NUG_RUNNING = "NugRunning"
L_GUI_SKINS_OMEN = "Omen"
L_GUI_SKINS_OPIE = "OPie"
L_GUI_SKINS_OVALE = "OvaleSpellPriority"
L_GUI_SKINS_POSTAL = "Postal"
L_GUI_SKINS_RECOUNT = "Recount"
L_GUI_SKINS_REMATCH = "Rematch"
L_GUI_SKINS_SKADA = "Skada"
L_GUI_SKINS_TINY_DPS = "TinyDPS"
L_GUI_SKINS_VANASKOS = "VanasKoS"
L_GUI_SKINS_WEAK_AURAS = "WeakAuras"

-- Unit Frames options
L_GUI_UF_SUBTEXT = "Customize player, target frames and etc."
L_GUI_UF_ENABLE = "Enable unit frames"
L_GUI_UF_HEALFRAMES = "Use healer layout"
L_GUI_UF_OWN_COLOR = "Set your color for health bars"
L_GUI_UF_CLASS_COLOR = "Use Class Color on healthbars"
L_GUI_UF_UF_COLOR = "Color of Health Bars (if own color is enabled)"
L_GUI_UF_BG_COLOR = "Color of healthbar background"
L_GUI_UF_POWER_COLOR = "Use Class color for power bar"
L_GUI_UF_VUHDO = "Always Hide Raidframes if VuhDo is loaded"
L_GUI_UF_ENEMY_HEALTH_COLOR = "Enemy target healthbar is red"
L_GUI_UF_TOTAL_VALUE = "Display of info text on player and target with XXXX/Total"
L_GUI_UF_COLOR_VALUE = "Health/mana value is colored"
L_GUI_UF_BAR_COLOR_VALUE = "Health bar color by current health remaining"
L_GUI_UF_LINES = "Show Player and Target lines"
L_GUI_UF_SUBHEADER_CAST = "Castbars"
L_GUI_UF_UNIT_CASTBAR = "Show castbars"
L_GUI_UF_CASTBAR_ICON = "Show castbar icons"
L_GUI_UF_CASTBAR_LATENCY = "Castbar latency"
L_GUI_UF_CASTBAR_TICKS = "Castbar ticks"
L_GUI_UF_SUBHEADER_FRAMES = "Frames"
L_GUI_UF_SHOW_PET = "Pet"
L_GUI_UF_SHOW_FOCUS = "Focus"
L_GUI_UF_SHOW_FOCUST = "Target of focus"
L_GUI_UF_SHOW_TOT = "Target of target"
L_GUI_UF_SHOW_BOSS = "Bosses"
L_GUI_UF_SHOW_TANKS = "Main tanks"
L_GUI_UF_BOSS_RIGHT = "Boss frames on the right"
L_GUI_UF_SHOW_ARENA = "Arena"
L_GUI_UF_ARENA_RIGHT = "Arena frames on the right"
L_GUI_UF_BOSS_DEBUFFS = "Number of debuffs"
L_GUI_UF_BOSS_DEBUFFS_DESC = "Number of debuffs on the boss frames"
L_GUI_UF_BOSS_BUFFS = "Number of buffs"
L_GUI_UF_BOSS_BUFFS_DESC = "Number of buffs on the boss frames"
L_GUI_UF_ICONS_PVP = "Mouseover PvP text(not icons) on player and target frames"
L_GUI_UF_ICONS_COMBAT = "Combat icon"
L_GUI_UF_ICONS_RESTING = "Resting icon"
L_GUI_UF_SUBHEADER_PORTRAIT = "Portraits"
L_GUI_UF_PORTRAIT_ENABLE = "Enable player/target portraits"
L_GUI_UF_PORTRAIT_CLASSCOLOR_BORDER = "Classcolor border for portraits"
L_GUI_UF_PORTRAIT_BARS = "Show portraits on Healthbar"
L_GUI_UF_PORTRAIT_HEIGHT = "Portrait height"
L_GUI_UF_PORTRAIT_WIDTH = "Portrait width"
L_GUI_UF_SUBHEADER_PLUGINS = "Plugins"
L_GUI_UF_PLUGINS_GCD = "Global cooldown spark on player frame"
L_GUI_UF_PLUGINS_SWING = "Enable swing bar"
L.unitframe_insideAlpha = "Alpha when Unitframe is in range"
L.unitframe_outsideAlpha = "Alpha when Unitframe is out of range"
L.unitframe_UFfont = "Unitframe font"
L.unitframe_UFNamefont = "Font to use on Names"
L.unitframe_plugins_reputation_bar = "Reputation bar"
L.unitframe_plugins_reputation_bar_desc = "Enable Reputation bar (left from player frame by mouseover)"
L.unitframe_plugins_experience_bar = "Experience bar"
L.unitframe_plugins_experience_bar_desc = "Enable Experience bar (left from player frame by mouseover)"
L.unitframe_plugins_artifact_bar = "Azerite Power bar"
L.unitframe_plugins_artifact_bar_desc = "Enable Azerite Power bar (left from player frame by mouseover)"
L.unitframe_plugins_auto_resurrection = "Auto cast resurrection"
L.unitframe_plugins_auto_resurrection_desc = "Auto cast resurrection on middle-click (doesn't work with Clique)"
L_GUI_UF_PLUGINS_SMOOTH_BAR = "Smooth bar"
L_GUI_UF_PLUGINS_ENEMY_SPEC = "Show enemy talent spec in BG and Arena"
L_GUI_UF_PLUGINS_COMBAT_FEEDBACK = "Combat text on player/target frame"
L_GUI_UF_PLUGINS_FADER = "Fade unit frames"
L_GUI_UF_PLUGINS_DIMINISHING = "Diminishing Returns icons on arena frames"
L_GUI_UF_PLUGINS_POWER_PREDICTION = "Power cost prediction bar on player frame"

-- Unit Frames Class bar options
L_GUI_UF_PLUGINS_CLASS_BAR = "Unit Frames Klassenleisten"
L_GUI_UF_PLUGINS_CLASS_BAR_SUBTEXT = "Control of special class resources." -- Need review
L_GUI_UF_PLUGINS_COMBO_BAR = "Symbole für Schurke/Druide Combopunkte"
L_GUI_UF_PLUGINS_COMBO_BAR_ALWAYS = "Zeige immer die Combo Leiste für Druiden"
L_GUI_UF_PLUGINS_COMBO_BAR_OLD = "Zeige Combopunkte auf dem Ziel"
L_GUI_UF_PLUGINS_ARCANE_BAR = "Aktiviere Arcane Charge Leiste"
L_GUI_UF_PLUGINS_CHI_BAR = "Ativiere Chi Leiste"
L_GUI_UF_PLUGINS_STAGGER_BAR = "Aktiviere Stagger Leiste (für Monk Tanks)"
L_GUI_UF_PLUGINS_HOLY_BAR = "Aktivere Heilige Kraft Leiste"
L_GUI_UF_PLUGINS_SHARD_BAR = "Aktiviere Splitter Leiste"
L_GUI_UF_PLUGINS_RUNE_BAR = "Runenleiste"
L_GUI_UF_PLUGINS_TOTEM_BAR = "Totemleiste"
L_GUI_UF_PLUGINS_RANGE_BAR = "Aktiviere Abstandsleiste"

-- Raid Frames options
L_GUI_UF_RAIDFRAMES_SUBTEXT = "Customize the appearance of the raid frames." -- Need review
L_GUI_UF_BY_ROLE = "Sortierung der Gruppenspieler nach Rolle"
L_GUI_UF_AGGRO_BORDER = "Rahmen bei Bedrohung"
L_GUI_UF_DEFICIT_HEALTH = "Fehlendes Leben im Raid"
L_GUI_UF_SHOW_PARTY = "Zeige Gruppenfenster"
L_GUI_UF_SHOW_RAID = "Zeige Raidfenster"
L_GUI_UF_VERTICAL_HEALTH = "Vertikale Orientierung für Lebensbalken"
L_GUI_UF_ALPHA_HEALTH = "Transparenz der Lebensbalken wenn 100% Leben"
L_GUI_UF_SHOW_RANGE = "Raidframes durchsichtig abhängig von der Entfernung"
L_GUI_UF_RANGE_ALPHA = "Alpha" -- Need review
L_GUI_UF_RANGE_ALPHA_DESC = "Einheitenfenster zu diesem Maß ausblenden wenn außer Reichweite"
L_GUI_UF_SUBHEADER_RAIDFRAMES = "Frames" -- Need review
L_GUI_UF_SOLO_MODE = "Spielerfenster immer Anzeigen"
L_GUI_UF_PLAYER_PARTY = "Spielerfenster in der Gruppe anzeigen"
L_GUI_UF_SHOW_TANK = "Zeige Raid Tanks an"
L_GUI_UF_SHOW_TANK_TT = "Zeige Ziel des Raid Tank Ziels (Ziel des Ziels)"
L_GUI_UF_RAID_GROUP = "Anzahl der Gruppen im Raid"
L_GUI_UF_RAID_VERTICAL_GROUP = "Vertikale Raidgruppen(Heiler Layout)"
L_GUI_UF_SUBHEADER_ICONS = "Icons" -- Need review
L_GUI_UF_ICONS_ROLE = "Rollensymbol auf den Unit Frames"
L_GUI_UF_ICONS_RAID_MARK = "Raidsymbole"
L_GUI_UF_ICONS_READY_CHECK = "Bereitschaftschecksymbole"
L_GUI_UF_ICONS_LEADER = "Anführer/Assistent an den Fenstern anzeigen"
L_GUI_UF_ICONS_SUMON = "Sumon icons on frames" -- Need review
L_GUI_UF_PLUGINS_DEBUFFHIGHLIGHT_ICON = "Debufftextur und Symbol hervorheben"
L_GUI_UF_PLUGINS_AURA_WATCH = "'RAID' Buffüberwachung"
L_GUI_UF_PLUGINS_AURA_WATCH_TIMER = "Timer auf Schlachtzugsdebuff Icons"
L_GUI_UF_PLUGINS_PVP_DEBUFFS = "Zeige ebenfalls PvP Debuff Symbol (aus der Liste)"
L_GUI_UF_PLUGINS_HEALCOMM = "Leiste für Eingehende Heilung"
L.raidframe_plugins_auto_resurrection = "Auto cast resurrection" -- Need review
L.raidframe_plugins_auto_resurrection_desc = "Mittel-Klick um automatisch Auferstehung zu zauber wenn das Ziel tot ist (funktioniert nicht wenn Clique installiert ist)"

-- Announcements options
L_GUI_ANNOUNCEMENTS = "Benachrichtigungen"
L_GUI_ANNOUNCEMENTS_SUBTEXT = "Settings that add chat announcements about spells or items." -- Need review
L_GUI_ANNOUNCEMENTS_DRINKING = "Sage im Chat an wenn ein Arenagegener trinkt"
L_GUI_ANNOUNCEMENTS_INTERRUPTS = "Sage deine Unterbrechungen im Raid oder Schlachtzugschat an"
L_GUI_ANNOUNCEMENTS_SPELLS = "Sage im Raid/Schachtzugschat an, wenn du den selben Zauber castest"
L_GUI_ANNOUNCEMENTS_SPELLS_FROM_ALL = "Prüfe Zauber von allen Spielern"
L_GUI_ANNOUNCEMENTS_TOY_TRAIN = "Benachrichtigung über Spielzeugzug oder Düsterbräu's Fernbedienung"
L_GUI_ANNOUNCEMENTS_SAYS_THANKS = "Bedanke dich für einige Zauber"
L_GUI_ANNOUNCEMENTS_PULL_COUNTDOWN = "Pull cuntdown Benachrichtigung '/pc #'"
L_GUI_ANNOUNCEMENTS_FLASK_FOOD = "Benachrichtigung über Fläschchen und Bufffood"
L_GUI_ANNOUNCEMENTS_FLASK_FOOD_AUTO = "Automatische Benachrichtigung beim ReadyCheck"
L_GUI_ANNOUNCEMENTS_FLASK_FOOD_RAID = "Benachrichtigung in den Raid Channel"
L_GUI_ANNOUNCEMENTS_FEASTS = "Benachrichtigung wenn Festmahl/Kessel/Seelensteine/Reparatur Bots aufgestellt wurden"
L_GUI_ANNOUNCEMENTS_PORTALS = "Benachrichtigung über Portale/Ritual der Beschwörung"
L_GUI_ANNOUNCEMENTS_BAD_GEAR = "Überprüfe auf schlechte Ausrüstung in Instanzen"
L_GUI_ANNOUNCEMENTS_SAFARI_HAT = "Überprüfe Safari Hat"

-- Automation options
L_GUI_AUTOMATION = "Automatisierung"
L_GUI_AUTOMATION_SUBTEXT = "This block contains settings that facilitate the routine." -- Need review
L_GUI_AUTOMATION_RELEASE = "Automatisch im Schlachtfeld wiederbeleben"
L_GUI_AUTOMATION_SCREENSHOT = "Speicher einen Screenshot wenn ein Achivment errungen wird"
L_GUI_AUTOMATION_SOLVE_ARTIFACT = "Auto Popup für gelöste Artefakte"
L_GUI_AUTOMATION_ACCEPT_INVITE = "Einladungen automatisch annehmen"
L_GUI_AUTOMATION_DECLINE_DUEL = "Duell automatisch ablehnen"
L_GUI_AUTOMATION_ACCEPT_QUEST = "Quests automatisch annehmen"
L_GUI_AUTOMATION_AUTO_COLLAPSE = "WatchFrame Automatisch in Instanzen reduzuieren"
L_GUI_AUTOMATION_AUTO_COLLAPSE_RELOAD = "Automatisches schließen der Questverfolgung nach Reload/RL"
L_GUI_AUTOMATION_SKIP_CINEMATIC = "Auto Cinematics/Filme überspringen"
L_GUI_AUTOMATION_AUTO_ROLE = "Automatisch die eigene Rolle wählen"
L_GUI_AUTOMATION_CANCEL_BAD_BUFFS = "Automatisch einige Buffs abbrechen"
L_GUI_AUTOMATION_TAB_BINDER = "Automatisch nur feindliche Spieler mit der TAB Taste anvisieren"
L_GUI_AUTOMATION_LOGGING_COMBAT = "Automatisch Kampflog in Raids als Textdatei mitschreiben"
L_GUI_AUTOMATION_BUFF_ON_SCROLL = "Wirke Stärkungszauber mit Mausrad"
L_GUI_AUTOMATION_OPEN_ITEMS = "Öffnet Automatisch Items in der Tasche"

-- Combat text options
L_GUI_COMBATTEXT = "Kampftext"
L_GUI_COMBATTEXT_SUBTEXT = "For moving type in the chat '/xct'" -- Need review
L_GUI_COMBATTEXT_ENABLE = "Kampftext aktivieren"
L.combattext_blizz_head_numbers = "Aktiviere Blizzard Kampftext"
L.combattext_blizz_head_numbers_desc = "Blizzard Schaden-/Heilausgabe benutzen (über Spieler/Kreaturen Kopf)"
L.combattext_damage_style = "Ändert die Standardkampfschriftart"
L.combattext_damage_style_desc = "Standard Schaden/Heilung Schriftart über Kreaturen/Spieler Köpfen ändern (Neustart von WoW erforderlich um Änderungen zu sehen)"
L_GUI_COMBATTEXT_DAMAGE = "Zeige ausgehenden Schaden in einem eigenen Fenster"
L_GUI_COMBATTEXT_HEALING = "Zeige ausgehende Heilung in einem eigenen Fenster"
L_GUI_COMBATTEXT_HOTS = "Zeige peroidische Heilungseffekte im Heilungsfenster"
L_GUI_COMBATTEXT_OVERHEALING = "Zeige ausgehende Überheilung an"
L_GUI_COMBATTEXT_PET_DAMAGE = "Zeige Begleiterschaden"
L_GUI_COMBATTEXT_DOT_DAMAGE = "Zeige Schaden von Schaden über Zeit"
L_GUI_COMBATTEXT_DAMAGE_COLOR = "Zeige Schadensnummern in Abhängigkeit von der Art des Zaubers"
L_GUI_COMBATTEXT_CRIT_PREFIX = "Symbol vor einem kritischen Treffer"
L_GUI_COMBATTEXT_CRIT_POSTFIX = "Symbol hinter einem kritischen Treffer"
L_GUI_COMBATTEXT_ICONS = "Zeige Symbole für ausgehenden Schaden"
L_GUI_COMBATTEXT_ICON_SIZE = "Icon größe"
L_GUI_COMBATTEXT_ICON_SIZE_DESC = "Symbolgröße der Zauber im Fenster für ausgehenden Schaden. Nimmt auch Einfluss auf die Schriftgröße"
L_GUI_COMBATTEXT_TRESHOLD = "Ab welcher Größe soll der Schaden angezeigt werden"
L_GUI_COMBATTEXT_HEAL_TRESHOLD = "Ab welche Größe soll ein-/ausgehende Heilung angezeigt werden"
L_GUI_COMBATTEXT_SCROLLABLE = "Erlaubt es dir mit dem Mausrad durch die letzten Zeilen zu scrollen"
L_GUI_COMBATTEXT_MAX_LINES = "Max. Zeilen"
L_GUI_COMBATTEXT_MAX_LINES_DESC = "Maximale Zeilen, die behalten werden sollen im Scrollmodus (mehr Zeilen = mehr Speicherverbrauch)"
L_GUI_COMBATTEXT_TIME_VISIBLE = "Zeit"
L_GUI_COMBATTEXT_TIME_VISIBLE_DESC = "Zeit(Sekunden) wielange eine einzelne Nachricht angezeigt wird"
L_GUI_COMBATTEXT_DK_RUNES = "Zeige Runenaufladung vom Todesritter"
L_GUI_COMBATTEXT_KILLINGBLOW = "Teilt dir mit ob du den Todesstoß bei einer Kreatur/einem Spieler hattest"
L_GUI_COMBATTEXT_MERGE_AOE_SPAM = "Vereint mehrfachen Flächenschaden in eine einzige Nachricht"
L_GUI_COMBATTEXT_MERGE_MELEE = "Fügt mehrfachen automatischen Angriffsschaden-Spam zusammen"
L_GUI_COMBATTEXT_DISPEL = "Informiert dich über deine Bannungen"
L_GUI_COMBATTEXT_INTERRUPT = "Informiert dich über deine Unterbrechungen"
L_GUI_COMBATTEXT_DIRECTION = "Ändert die Bildlaufrichtung von unten nach oben"
L_GUI_COMBATTEXT_SHORT_NUMBERS = "Zeige kurze Zahlen an ('25.3k' statt '25342')"

-- Buffs reminder options
L_GUI_REMINDER = "Erinnerungen für Buffs"
L_GUI_REMINDER_SUBTEXT = "Anzeige der vermissten Auren."
L_GUI_REMINDER_SOLO_ENABLE = "Zeige fehlende Eigenbuffs"
L_GUI_REMINDER_SOLO_SOUND = "Spiele Warngeräusch ab bei fehlenden Eigenbuffs"
L_GUI_REMINDER_SOLO_SIZE = "Solo Icon größe"
L_GUI_REMINDER_SOLO_SIZE_DESC = "Eigener buff Icon größe"
L_GUI_REMINDER_SUBHEADER = "Raidbuffs"
L_GUI_REMINDER_RAID_ENABLE = "Zeige fehlende Raidbuffs an"
L_GUI_REMINDER_RAID_ALWAYS = "Zeige Bufferinnerungen immer an"
L_GUI_REMINDER_RAID_SIZE = "Raid Icon größe"
L_GUI_REMINDER_RAID_SIZE_DESC = "Symbolgröße für Raidbuffs"
L_GUI_REMINDER_RAID_ALPHA = "Transparent"
L_GUI_REMINDER_RAID_ALPHA_DESC = "Transparente Symbole wenn der Buff vorhanden ist"

-- Raid cooldowns options
L_GUI_COOLDOWN_RAID = "Schlachtzugs Cooldowns"
L_GUI_COOLDOWN_RAID_SUBTEXT = "Tracking raid abilities in the upper left corner." -- Need review
L_GUI_COOLDOWN_RAID_ENABLE = "Abklingzeiten des Raids aktivieren"
L_GUI_COOLDOWN_RAID_HEIGHT = "Bars height" -- Need review
L_GUI_COOLDOWN_RAID_WIDTH = "Bars width" -- Need review
L_GUI_COOLDOWN_RAID_SORT = "Leisten für Raidabklingzeiten wachsen nach oben"
L_GUI_COOLDOWN_RAID_EXPIRATION = "Sortieren nach Abklingzeit"
L_GUI_COOLDOWN_RAID_SHOW_SELF = "Zeige deine Cooldowns"
L_GUI_COOLDOWN_RAID_ICONS = "Symbole für Raidabklingzeiten"
L_GUI_COOLDOWN_RAID_IN_RAID = "Zeige Raidabklingzeiten in Raidgebieten"
L_GUI_COOLDOWN_RAID_IN_PARTY = "Zeige Raidabklingzeiten in Gruppengebieten"
L_GUI_COOLDOWN_RAID_IN_ARENA = "Zeige Raidabklingzeiten in der Arena"

-- Enemy cooldowns options
L_GUI_COOLDOWN_ENEMY = "Gegner Cooldowns"
L_GUI_COOLDOWN_ENEMY_SUBTEXT = "Tracking enemy abilities as icons above your spell casting bar." -- Need review
L_GUI_COOLDOWN_ENEMY_ENABLE = "Aktiviere gegnerische Abklingzeiten"
L_GUI_COOLDOWN_ENEMY_SIZE = "Symbolgröße für gegnerische Abklingzeiten"
L_GUI_COOLDOWN_ENEMY_DIRECTION = "Gegner Cooldowns Symbol ausrichtung"
L_GUI_COOLDOWN_ENEMY_EVERYWHERE = "Zeige gegnerische Abklingzeiten überall"
L_GUI_COOLDOWN_ENEMY_IN_BG = "Zeige gegnerische Abklingzeiten in Schlachtfeldern"
L_GUI_COOLDOWN_ENEMY_IN_ARENA = "Zeige gegnerische Abklingzeiten in der Arena"

-- Pulse cooldowns options
L_GUI_COOLDOWN_PULSE = "Pulse Cooldowns"
L_GUI_COOLDOWN_PULSE_SUBTEXT = "Track your cd using a pulse icon in the center of the screen." -- Need review
L_GUI_COOLDOWN_PULSE_ENABLE = "Zeige Abklingzeitimpuls"
L_GUI_COOLDOWN_PULSE_SIZE = "Abklingzeitimpuls Symbolgröße"
L_GUI_COOLDOWN_PULSE_SOUND = "Akustische Warnungen"
L_GUI_COOLDOWN_PULSE_ANIM_SCALE = "Animationen Skalieren"
L_GUI_COOLDOWN_PULSE_HOLD_TIME = "Maximale Zeit in der die Anzeige aktiv ist"
L_GUI_COOLDOWN_PULSE_THRESHOLD = "Threshold time" -- Need review
L_GUI_COOLDOWN_PULSE_THRESHOLD_DESC = "Minimale Zeitschwälle"

-- Threat options
L_GUI_THREAT = "Bedrohungsleisten"
L_GUI_THREAT_SUBTEXT = "Display of the threat list (a simple analogue of Omen)." -- Need review
L_GUI_THREAT_ENABLE = "Aktiviere Bedrohungsleisten"
L_GUI_THREAT_HEIGHT = "Höhe der Bedrohungsleisten"
L_GUI_THREAT_WIDTH = "Breite der Bedrohungsleisten"
L_GUI_THREAT_ROWS = "Anzahl der Bedrohungsleisten"
L_GUI_THREAT_HIDE_SOLO = "Nur in Gruppen oder Schlachtzügen anzeigen"

-- Tooltip options
L_GUI_TOOLTIP = "Tooltip"
L_GUI_TOOLTIP_SUBTEXT = "In this block, you can change the standard tips when mouseovering." -- Need review
L_GUI_TOOLTIP_ENABLE = "Aktiviere Tooltip"
L_GUI_TOOLTIP_SHIFT = "Tooltip anzeigen wenn 'Umschalttaste' gedrückt wird"
L_GUI_TOOLTIP_CURSOR = "Tooltip unter dem Mauszeiger öffnen"
L_GUI_TOOLTIP_ICON = "Symbol der Gegenstände im Tooltip anzeigen"
L_GUI_TOOLTIP_HEALTH = "Numerischer Wert der Lebenspunkte"
L_GUI_TOOLTIP_HIDE = "Tooltips für Aktionsleisten verstecken"
L_GUI_TOOLTIP_HIDE_COMBAT = "Verstecke Tooltip im Kampf"
L_GUI_TOOLTIP_SUBHEADER_PLUGINS = "Plugins"
L_GUI_TOOLTIP_TALENTS = "Zeige die Talente im Tooltip an"
L_GUI_TOOLTIP_ACHIEVEMENTS = "Verlgeichen von Erfolgen in Tooltips"
L_GUI_TOOLTIP_TARGET = "Ziel des Spielers im Tooltip anzeigen"
L_GUI_TOOLTIP_TITLE = "Spieler Title im Tooltip"
L_GUI_TOOLTIP_REALM = "Spieler Realm Name im Tooltip"
L_GUI_TOOLTIP_RANK = "Gildenrank im Tooltip anzeigen"
L_GUI_TOOLTIP_ARENA_EXPERIENCE = "PvP-Erfahrung des Spielers im Tooltip anzeigen (Arena)"
L_GUI_TOOLTIP_SPELL_ID = "Zauber ID"
L_GUI_TOOLTIP_AVERAGE_LVL_DESC = "Der durchschnittliche Item Level (GS)"
L_GUI_TOOLTIP_RAID_ICON = "Raidsymbol"
L_GUI_TOOLTIP_WHO_TARGETTING = "Zeige an, wer die Eihneit, die in deiner Gruppe/Raid ist, ins Ziel nimmt"
L_GUI_TOOLTIP_ITEM_COUNT = "Gegenstandsanzahl"
L_GUI_TOOLTIP_UNIT_ROLE = "Klassenrolle (Tank/Schaden/Heiler)"
L_GUI_TOOLTIP_INSTANCE_LOCK = "Deine abgeschlossenen Instanzen im Tooltip"

-- Chat options
L_GUI_CHAT_SUBTEXT = "Hier Einstellungen des Chat-Fensters ändern."
L_GUI_CHAT_ENABLE = "Chat aktivieren"
L_GUI_CHAT_BACKGROUND = "Chathintergrund aktivieren"
L_GUI_CHAT_BACKGROUND_ALPHA = "Transparenz des Hintergrunds"
L_GUI_CHAT_SPAM = "Entferne Systemspam ('Player1' gewinnt Duell 'Player2')"
L_GUI_CHAT_GOLD = "Entferne einigen Spam vom Server"
L_GUI_CHAT_WIDTH = "Breite des Chatfensters"
L_GUI_CHAT_HEIGHT = "Höhe desChatfensters"
L_GUI_CHAT_BAR = "Kleine Leiste um den Chatchannel zu wechseln"
L_GUI_CHAT_BAR_MOUSEOVER = "Aktionsleiste bei Mousover hervorheben"
L_GUI_CHAT_TIMESTAMP = "Farbe des Zeitstempels"
L_GUI_CHAT_WHISP = "Geräusch abspielen wenn eine private Nachricht empfangen wird"
L_GUI_CHAT_SKIN_BUBBLE = "Blizzard Chat Blasen verändern"
L_GUI_CHAT_CL_TAB = "Kampflog Reiter anzeigen"
L_GUI_CHAT_TABS_MOUSEOVER = "Zeige Chat-Reiter bei Mouseover"
L_GUI_CHAT_STICKY = "Behalte den letzen Channel"
L_GUI_CHAT_DAMAGE_METER_SPAM = "Fasse DMG-Meterspam in einer Zeile zusammen"

-- Bag options
L_GUI_BAGS = "Taschen"
L_GUI_BAGS_SUBTEXT = "Ändern der Blizzard Taschen."
L_GUI_BAGS_ENABLE = "Taschen aktivieren"
L_GUI_BAGS_ILVL = "Zeigt Itemlevel der Waffen & Rüstung"
L_GUI_BAGS_BUTTON_SIZE = "Buttongröße"
L_GUI_BAGS_BUTTON_SPACE = "Buttonabstand"
L_GUI_BAGS_BANK = "Anzahl der Spalten in der Bank"
L_GUI_BAGS_BAG = "Anzahl der Spalten in der Tasche"

-- Minimap options
L_GUI_MINIMAP_SUBTEXT = "Minimap settings."
L_GUI_MINIMAP_ENABLE = "Enable minimap"
L_GUI_MINIMAP_ICON = "Tracking icon"
L_GUI_GARRISON_ICON = "Garrison icon"
L_GUI_MINIMAP_SIZE = "Map size"
L_GUI_MINIMAP_HIDE_COMBAT = "Hide minimap in combat"
L_GUI_MINIMAP_TOGGLE_MENU = "Show toggle menu"
L_GUI_MINIMAP_COMPASS = "Show N/S/E/W"
L_GUI_MINIMAP_MINIBT_1 = "Background for Minimap bottom right"
L_GUI_MINIMAP_MINIBT_2 = "Background for Minimap bottom left"
L.minimap_bg_map_stylization = "BG map stylization"
L.minimap_fog_of_war = "Remove fog of war on World Map"
L.minimap_fog_of_war_desc = "Right click on the close button of World Map to activate the option to hide fog of war"

-- Loot options
L_GUI_LOOT_SUBTEXT = "Settings for loot frame." -- Need review
L_GUI_LOOT_ENABLE = "Plünderfenster aktivieren"
L_GUI_LOOT_ROLL_ENABLE = "Gruppenplünderfenster aktivieren"
L_GUI_LOOT_ICON_SIZE = "Symbolgröße"
L_GUI_LOOT_WIDTH = "Breite des Plünderfensters"
L_GUI_LOOT_AUTOGREED = "Aktiviere automatisches Würfeln (Gier) für Gegenstände, falls das höchste Level erreicht wurde."
L_GUI_LOOT_AUTODE = "Entzauberung automatisch bestätigen"

-- Nameplate options
L_GUI_NAMEPLATE_SUBTEXT = "Nameplates Einstellung"
L_GUI_NAMEPLATE_ENABLE = "Namensplaketten aktivieren"
L_GUI_NAMEPLATE_COMBAT = "Namensplaketten automatisch im Kampf anzeigen"
L_GUI_NAMEPLATE_HEALTH = "Numerischer Wert der Lebenspunkte"
L_GUI_NAMEPLATE_HEIGHT = "Höhe der Namensplakette"
L_GUI_NAMEPLATE_WIDTH = "Breite der Namensplakette"
L_GUI_NAMEPLATE_DISTANCE = "Anzeigerbereich"
L_GUI_NAMEPLATE_AD_HEIGHT = "Zusätzliche Höhe"
L_GUI_NAMEPLATE_AD_WIDTH = "Zusätzliche Breite"
L_GUI_NAMEPLATE_CASTBAR_NAME = "Zeige den Namen in der Zauberleiste"
L_GUI_NAMEPLATE_CLASS_ICON = "Zeige Klassensymbole an (PvP)"
L_GUI_NAMEPLATE_NAME_ABBREV = "Namen abgekürzt anzeigen"
L_GUI_NAMEPLATE_CLAMP = "Clamp nameplates to the top of the screen when outside of view" -- Need review
L_GUI_NAMEPLATE_SHOW_DEBUFFS = "Zeige Schwächungszauber (Abgekürzte Namen müssen deaktiviert sein)"
L_GUI_NAMEPLATE_SHOW_BUFFS = "Show buffs above player nameplate (from the list)" -- Need review
L_GUI_NAMEPLATE_DEBUFFS_SIZE = "Größe der Debuffs"
L_GUI_NAMEPLATE_HEALER_ICON = "Zeige Heilersymbol auf allen gegnerischen Heiler-Nameplates im BG"
L_GUI_NAMEPLATE_TOTEM_ICONS = "Show icon above enemy totems nameplate" -- Need review
L_GUI_NAMEPLATE_THREAT = "Aktiviere Bedrohungsanzeige, ändert sich automatisch je nach deiner Rolle"
L_GUI_NAMEPLATE_GOOD_COLOR = "Positive Bedrohungsfarbe. Variiert abhängig ob Tank oder dps/heal"
L_GUI_NAMEPLATE_NEAR_COLOR = "Verlust oder Zuwachs der Bedrohung farbig kennzeichen"
L_GUI_NAMEPLATE_BAD_COLOR = "Negative Bedrohungsfarbe. Variiert abhängig ob Tank oder dps/heal"
L_GUI_NAMEPLATE_OFFTANK_COLOR = "Offtank threat color" -- Need review

-- ActionBar options
L_GUI_ACTIONBAR = "Aktionsleisten"
L_GUI_ACTIONBAR_ENABLE = "Aktionsleisten aktivieren"
L_GUI_ACTIONBAR_HOTKEY = "Zeige Hotkey-Text an"
L_GUI_ACTIONBAR_MACRO = "Zeige Makronamen auf den Buttons"
L_GUI_ACTIONBAR_GRID = "Zeige die leeren Knöpfe der Aktionsleisten an"
L_GUI_ACTIONBAR_BUTTON_SIZE = "Knopfgröße"
L_GUI_ACTIONBAR_BUTTON_SPACE = "Buttonabstand"
L_GUI_ACTIONBAR_SPLIT_BARS = "Splitte die Fünfte Aktionsleiste im zwei 6 Knöpfe Leisten"
L_GUI_ACTIONBAR_CLASSCOLOR_BORDER = "Aktiviere Klassenfarbe für Aktionsleisten"
L_GUI_ACTIONBAR_TOGGLE_MODE = "Aktiviere 'toggle mode'"
L_GUI_ACTIONBAR_HIDE_HIGHLIGHT = "hebe keine Procs hervor"
L_GUI_ACTIONBAR_BOTTOMBARS = "Anzahl der Aktionsleisten an der unteren Seite"
L_GUI_ACTIONBAR_RIGHTBARS = "Anzahl der Aktionsleisten an der rechten Seite"
L_GUI_ACTIONBAR_RIGHTBARS_MOUSEOVER = "Zeige die rechten Leisten nur bei Mouseover"
L_GUI_ACTIONBAR_PETBAR_HIDE = "Verstecke Begleiterleiste"
L_GUI_ACTIONBAR_PETBAR_HORIZONTAL = "Aktiviere horizontale Begleiterleiste"
L_GUI_ACTIONBAR_PETBAR_MOUSEOVER = "Zeige die Begleiterleiste nur bei Mouseover(nur für horizontale Begleiterleiste)"
L_GUI_ACTIONBAR_STANCEBAR_HIDE = "Gestaltenleiste verstecken"
L_GUI_ACTIONBAR_STANCEBAR_HORIZONTAL = "Horizontale Haltungsleiste aktivieren"
L_GUI_ACTIONBAR_STANCEBAR_MOUSEOVER = "Zeige Haltungsleiste/Gestaltenleiste nur bei Mouseover"
L_GUI_ACTIONBAR_MICROMENU = "Zeige Micromenü"
L_GUI_ACTIONBAR_MICROMENU_MOUSEOVER = "Micromenü bei MouseOver"

-- Auras/Buffs/Debuffs
L_GUI_AURA_PLAYER_BUFF_SIZE = "Buffs größe"
L_GUI_AURA_PLAYER_BUFF_SIZE_DESC = "Größe der Spielerbuffs"
L_GUI_AURA_SHOW_SPIRAL = "Spirale auf Buffsymbolen"
L_GUI_AURA_SHOW_TIMER = "Zeige Abklingzeit für Buffs"
L_GUI_AURA_PLAYER_AURAS = "Buffs auf dem Spielerfenster"
L_GUI_AURA_TARGET_AURAS = "Buffs auf dem Zielfenster"
L_GUI_AURA_FOCUS_DEBUFFS = "Debuffs auf dem Fokusfenster"
L_GUI_AURA_FOT_DEBUFFS = "Debuffs auf dem Fokusziel"
L_GUI_AURA_PET_DEBUFFS = "Debuffs auf dem Begleiterfenster"
L_GUI_AURA_TOT_DEBUFFS = "Debuffs bei Ziel des Ziels anzeigen"
L_GUI_AURA_BOSS_BUFFS = "Stärkungszauber auf dem Bossframe anzeigen."
L_GUI_AURA_PLAYER_AURA_ONLY = "Nur eigenen Debuffs bei dem Zielfenster anzeigen"
L_GUI_AURA_DEBUFF_COLOR_TYPE = "Debuffs nach Art einfärben"
L_GUI_AURA_CAST_BY = "Zeige im Tooltip an von wem ein Buff- bzw. Debuff gewirkt wurde"
L_GUI_AURA_CLASSCOLOR_BORDER = "Aktiviere Klassenfarbe für Spielerbuffs"

-- Filger
L_GUI_FILGER = "Timers (Filger)"
L_GUI_FILGER_SUBTEXT = "Filger - analogue WeakAuras, but more simple and easy. Allows you to display in the form of icons and bars your auras and timers."
L_GUI_FILGER_ENABLE = "Enable Filger"
L_GUI_FILGER_TEST_MODE = "Test icon mode"
L_GUI_FILGER_MAX_TEST_ICON = "The number of icons to the test"
L_GUI_FILGER_SHOW_TOOLTIP = "Show tooltip"
L_GUI_FILGER_DISABLE_CD = "Disable cooldowns"
L_GUI_FILGER_DISABLE_PVP = "Disable PvP debuffs on Player and Target"
L_GUI_FILGER_EXPIRATION = "Sort cooldowns by expiration time"
L_GUI_FILGER_BUFFS_SIZE = "Buffs size"
L_GUI_FILGER_COOLDOWN_SIZE = "Cooldowns size"
L_GUI_FILGER_PVP_SIZE = "Debuffs size"
L_GUI_FILGER_PROC_SIZE = "Proc icon size"
L_GUI_FILGER_BARICON_SIZE = "Bar icon size"

-- Panel options
L_GUI_TOP_PANEL = "Oberes Panel"
L_GUI_TOP_PANEL_SUBTEXT = "Manage built-in top panel with information." -- Need review
L_GUI_TOP_PANEL_ENABLE = "Aktiviere oberes Panel"
L_GUI_TOP_PANEL_MOUSE = "Oberes Panel nur bei Mouseover anzeigen"
L_GUI_TOP_PANEL_WIDTH = "Breite des Panels"
L_GUI_TOP_PANEL_HEIGHT = "Höhe des Panels"

-- Stats options
L_GUI_STATS = "Statistiken"
L_GUI_STATS_SUBTEXT = "Statistics blocks located at the bottom of the screen. Type in the chat '/ls' for info." -- Need review
L_GUI_STATS_CLOCK = "Uhr"
L_GUI_STATS_LATENCY = "Latenz"
L_GUI_STATS_MEMORY = "Speicher"
L_GUI_STATS_FPS = "BPS"
L_GUI_STATS_EXPERIENCE = "Erfahrung"
L_GUI_STATS_TALENTS_DESC = "Wechselt bei Klick die Beute und Spec"
L_GUI_STATS_COORDS = "Koordinaten"
L_GUI_STATS_LOCATION = "Ort"
L_GUI_STATS_BG = "Schlachtfeld"
L_GUI_STATS_SUBHEADER_CURRENCY = "Currency/Abzeichen (Anzeige im Gold Data Text)"
L_GUI_STATS_CURRENCY_ARCHAEOLOGY = "Zeige Archäologie Fragmente"
L_GUI_STATS_CURRENCY_COOKING = "Zeige Kochpreise/Marken"
L_GUI_STATS_CURRENCY_PROFESSIONS = "Zeige Berufeabzeichen/Tokens"
L_GUI_STATS_CURRENCY_RAID = "Zeige Schlatzugs Siegel/Bonuswürffe"
L_GUI_STATS_CURRENCY_MISCELLANEOUS = "Zeige sonstige Abzeichen an"

-- Panels options
L_GUI_PANELS = "Panels" -- Needs review
L_GUI_PANELS_SUBTEXT = "Manage all the panels on screen." -- Needs review
L.panels_CPwidth = "Chat Width" -- Needs review
L.panels_CPwidth_desc = "Width for Left and Right side panels that holds text" -- Needs review
L.panels_CPLwidth = "Chat Lines." -- Needs review
L.panels_CPLwidth_desc = "Width for Left and Right Chat lines." -- Needs review
L.panels_CPTextheight = "Chat Hight" -- Needs review
L.panels_CPTextheight_desc = "Hight for the panel that chat window is inside" -- Needs review
L.panels_CPbarsheight = "Chat Bar Hight" -- Needs review
L.panels_CPbarsheight_desc = "Hight for panels that shows under and above chat window. And Top Panel" -- Needs review
L.panels_CPABarSide = "Side Action Bar" -- Needs review
L.panels_CPABarSide_desc = "Width for Action Bars next to chat windows" -- Needs review
L.panels_CPXPBa_r = "Xp Bar" -- Needs review
L.panels_CPXPBa_r_desc = "Hight for the XP bar above Left Chat" -- Needs review
L.panels_xoffset = "X Offset" -- Needs review
L.panels_xoffset_desc = "Horisontal spacing between panels" -- Needs review
L.panels_yoffset = "Y Offset" -- Needs review
L.panels_yoffset_desc = "Vertical spacing between panels" -- Needs review
L.panels_CPSidesWidth = "Addon Panels" -- Needs review
L.panels_CPSidesWidth_desc = "Width of panels that is used to hold dmg meter and threathbar (Recount & Omen)" -- Needs review
L.panels_CPMABwidth = "Width Main Actionbar" -- Needs review
L.panels_CPMABwidth_desc = "Width for panel behind main action bar" -- Needs review
L.panels_CPMABheight = "Hight For Main Actionbar" -- Needs review
L.panels_CPMABheight_desc = "Hight for panel behind main action bar" -- Needs review
L.panels_CPMAByoffset = "Y Offset Actionbar" -- Needs review
L.panels_CPMAByoffset_desc = "Main action bar panel placement distance from bottom of screen" -- Needs review
L.panels_CPCooldheight = "Cooldown Bar" -- Needs review
L.panels_CPCooldheight_desc = "Hight For Cooldown Panel under main action bar panel" -- Needs review
L.panels_CPTop = "Top Panels" -- Needs review
L.panels_CPTop_desc = "Width For Top Panel" -- Needs review
L.panels_Pscale = "Can Be Used To Resize All Panels. It Does Not Change X Y Values" -- Needs review
L.panels_Pscale_desc = "Can Be Used To Resize All Panels. It Does Not Change X Y Values" -- Needs review
L.panels_NoPanels = "Will Set All Panels To Hidden And Show Lines Instead. On Test Stage Still!" -- Needs review
L.panels_NoPanels_desc = "Will Set All Panels To Hidden And Show Lines Instead. On Test Stage Still!" -- Needs review
L.panels_HideABPanels = "Hides Actionbars Panels" -- Needs review
L.panels_HideABPanels_desc = "Hides All Panels Behind Actionbars!" -- Needs review

-- Error options
L_GUI_ERROR = "Fehler"
L_GUI_ERROR_SUBTEXT = "Filtern von Standardtext am oberen Bildschirmrand von Blizzard."
L_GUI_ERROR_BLACK = "Verstecke Fehler der Schwarzen Liste"
L_GUI_ERROR_WHITE = "Zeige Fehler der Weißen Liste"
L_GUI_ERROR_HIDE_COMBAT = "Verberge alle Fehlermeldungen im Kampf"

-- Miscellaneous options
L_GUI_MISC_SUBTEXT = "Other settings that add interesting features."
L.misc_shift_marking = "Marks mouseover target"
L.misc_shift_marking_desc = "Marks mouseover target when you push Shift (only in group)"
L_GUI_MISC_INVKEYWORD = "Short keyword for invite (/ainv)"
L_GUI_MISC_SPIN_CAMERA = "Spin camera while afk"
L_GUI_MISC_VEHICLE_MOUSEOVER = "Vehicle frame on mouseover"
L_GUI_MISC_QUEST_AUTOBUTTON = "Quest/item auto button (from the list)"
L.misc_raid_tools = "Raid tools"
L.misc_raid_tools_desc = "Button at the top of the screen for ready check (Left-click), checking roles (Middle-click), setting marks, etc. (for leader and assistants)"
L_GUI_MISC_PROFESSION_TABS = "Professions tabs on tradeskill/trade frames"
L_GUI_MISC_HIDE_BG_SPAM = "Remove Boss Emote spam during BG"
L.misc_hide_bg_spam_desc = "Remove Boss Emote spam about capture/losing node during BG Arathi and Gilneas"
L_GUI_MISC_ITEM_LEVEL = "Item level on character slot buttons"
L_GUI_MISC_ALREADY_KNOWN = "Colorizes recipes/mounts/pets/toys that is already known"
L_GUI_MISC_DISENCHANTING = "Milling, Prospecting and Disenchanting by Alt + click"
L_GUI_MISC_SUM_BUYOUTS = "Sum up all current auctions"
L_GUI_MISC_CLICK_CAST = "Simple click2cast spell binder"
L_GUI_MISC_CLICK_CAST_FILTER = "Ignore Player and Target frames"
L_GUI_MISC_MOVE_BLIZZARD = "Move some Blizzard frames"
L_GUI_MISC_COLOR_PICKER = "Improved ColorPicker"
L_GUI_MISC_ENCHANTMENT_SCROLL = "Enchantment scroll on TradeSkill frame"
L_GUI_MISC_ARCHAEOLOGY = "Archaeology artifacts and cooldown"
L_GUI_MISC_CHARS_CURRENCY = "Tracks your currency tokens across multiple characters"
L.misc_armory_link = "Add Armory link"
L.misc_armory_link_desc = "Add the Armory link in the chat menu and target (but it will not be possible to set the focus through the target menu)"
L_GUI_MISC_MERCHANT_ITEMLEVEL = "Show item level for weapons and armor in merchant"
L_GUI_MISC_MINIMIZE_MOUSEOVER = "Mouseover for quest minimize button"
L_GUI_MISC_HIDE_BANNER = "Hide Boss Banner Loot Frame"
L_GUI_MISC_HIDE_TALKING_HEAD = "Hide Talking Head Frame"
L_GUI_MISC_HIDE_RAID_BUTTON = "Hide button for oUF_RaidDPS (top left corner)"
L_GUI_MISC_LAG_TOLERANCE = "Automatically update the Blizzard Custom Lag Tolerance option to your latency"
L_GUI_MISC_MARKBAR = "Markbar for Raid Icons and flares"
L_GUI_MISC_CLASSTIMER = "Shows buff/debuffs/procs as bar on player/target frame"
L_GUI_MISC_WATCHFRAME = "Use custom Quest watch frame"
L_GUI_MISC_BT4BARS = "Panels behind Sidebar & Small bars for Bartender 4"
L_GUI_MISC_PSCALE = "Scale ViksUI Panels"
L_GUI_MISC_PANELSH = "Set UI Panels to hidden"

-- DataText options
L_GUI_DATATEXT = "DataText"
L_GUI_DATATEXT_SUBTEXT = "DataText positions. From left to right. Bottom is nr 1 to 6 and Top is 7 to 13."
L_GUI_DATATEXT_Arena = "Arena Score" 
L_GUI_DATATEXT_Armor = "Armor Value"
L_GUI_DATATEXT_RunSpeed = "Run Speed"
L_GUI_DATATEXT_Avd = "Avoidance"
L_GUI_DATATEXT_Bags = "Bag Space"
L_GUI_DATATEXT_Battleground = "Enable 3 stats in battleground only that replace stat1,stat2,stat3"
L_GUI_DATATEXT_Crit = "Crit"
L_GUI_DATATEXT_Durability = "Durability"
L_GUI_DATATEXT_Friends = "Friends List"
L_GUI_DATATEXT_Gold = "Gold"
L_GUI_DATATEXT_Guild = "Guild"
L_GUI_DATATEXT_Haste = "Haste"
L_GUI_DATATEXT_Versatility = "Versatility"
L_GUI_DATATEXT_location = "Location"
L_GUI_DATATEXT_showcoords = "Coordinates on location"
L_GUI_DATATEXT_Mastery = "Mastery"
L_GUI_DATATEXT_Power = "Power"
L_GUI_DATATEXT_Regen = "Mana regeneration"
L_GUI_DATATEXT_System = "Fps and MS"
L_GUI_DATATEXT_Talents = "Talent"
L_GUI_DATATEXT_togglemenu = "Minimenu"
L_GUI_DATATEXT_Volume = "Volume"
L_GUI_DATATEXT_Wowtime = "THIS IS BLOCKED TO FIXED POSITION! SO CAN'T BE CHANGED HERE! NUMBER MUST BE > 0, BUT DOESN'T USE UP A SPOT!"
L_GUI_DATATEXT_Time24 = "Set time to 24h format"
L_GUI_DATATEXT_Localtime = "Show Local time instead of server time"
L_GUI_DATATEXT_classcolor = "Use Class Color in text"
L_GUI_DATATEXT_color = "Color to use it not Class color"
L_GUI_DATATEXT_SUBHEADER_CURRENCY = "Options"
L_GUI_DATATEXT_CurrArchaeology = "Archaeology Fragments under gold"
L_GUI_DATATEXT_CurrCooking = "Cooking Awards under gold"
L_GUI_DATATEXT_CurrProfessions = "Profession Tokens under gold"
L_GUI_DATATEXT_CurrMiscellaneous = "Miscellaneous Currency under gold"
L_GUI_DATATEXT_CurrPvP = "PVP Currency under gold"
L_GUI_DATATEXT_CurrRaid = "Raid Seals under gold"
L_GUI_DATATEXT_Quests = "Quest position"
L_GUI_DATATEXT_Bfamissions = "BFA Missions"