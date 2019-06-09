local _, L = ...
if GetLocale() ~= "itIT" then return end

----------------------------------------------------------------------------------------
--	Localization for itIT client
--	Translation: Oz
----------------------------------------------------------------------------------------
L_GUI_SET_SAVED_SETTTINGS = "Imposta le impostazioni 'Per-Personaggio'"
L_GUI_SET_SAVED_SETTTINGS_DESC = "Switch between a profile that applies to all characters and one that is unique to this character." -- Need review
L_GUI_RESET_CHAR = "Vuoi davvero ripristinare le impostazioni iniziali della ViksUI per questo personaggio?"
L_GUI_RESET_ALL = "Vuoi davvero ripristinate tutte le impostazioni iniziali della ViksUI?"
L_GUI_PER_CHAR = "Vuoi davvero modificare questa impostazione (attivazione/disattivazione salvataggio impostazioni 'Per-Personaggio')?"
L_GUI_NEED_RELOAD = "|cffff2735You need to reload the UI to apply your changes.|r" -- Need review

-- General options
L_GUI_GENERAL_SUBTEXT = "These settings control the general user interface settings. Type in chat '/uihelp' for help."
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
L.font = "Fonts" -- Need review
L.font_subtext = "Customize individual fonts for elements." -- Need review
L.font_stats_font = "Select font" -- Need review
L.font_stats_font_style = "Font flag" -- Need review
L.font_stats_font_shadow = "Font shadow" -- Need review
L.font_subheader_stats = "Stats font" -- Need review
L.font_subheader_combat = "Combat text font" -- Need review
L.font_subheader_chat = "Chat font" -- Need review
L.font_subheader_chat_tabs = "Chat tabs font" -- Need review
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
L_GUI_UF_PLUGINS_CLASS_BAR = "Barre di classe"
L_GUI_UF_PLUGINS_CLASS_BAR_SUBTEXT = "Control of special class resources." -- Need review
L_GUI_UF_PLUGINS_COMBO_BAR = "Icone punti combo per druido e ladro"
L_GUI_UF_PLUGINS_COMBO_BAR_ALWAYS = "Mostra sempre la barra combo per il druido"
L_GUI_UF_PLUGINS_COMBO_BAR_OLD = "Mostra i punti combo sul bersaglio"
L_GUI_UF_PLUGINS_ARCANE_BAR = "Attiva la barra carica arcana"
L_GUI_UF_PLUGINS_CHI_BAR = "Attiva la barra di classe del monaco"
L_GUI_UF_PLUGINS_STAGGER_BAR = "Attiva la barra noncuranza (per i monaci difensori)"
L_GUI_UF_PLUGINS_HOLY_BAR = "Attiva la barra di classe del paladino"
L_GUI_UF_PLUGINS_SHARD_BAR = "Attiva la barra di classe dello stregone"
L_GUI_UF_PLUGINS_RUNE_BAR = "Attiva la barra di classe del cavaliere della morte"
L_GUI_UF_PLUGINS_TOTEM_BAR = "Attiva la barra dei totems dello sciamano"
L_GUI_UF_PLUGINS_RANGE_BAR = "Attiva la barra della distanza per i sacerdoti"

-- Raid Frames options
L_GUI_UF_RAIDFRAMES_SUBTEXT = "Customize the appearance of the raid frames." -- Need review
L_GUI_UF_BY_ROLE = "Suddividi i giocatori in gruppo a seconda del ruolo"
L_GUI_UF_AGGRO_BORDER = "Cambio di colore dei bordi in base al grado di aggressione"
L_GUI_UF_DEFICIT_HEALTH = "Deficit salute in incursione"
L_GUI_UF_SHOW_PARTY = "Mostra i riquadri del gruppo"
L_GUI_UF_SHOW_RAID = "Mostra i riquadri d'incursione"
L_GUI_UF_VERTICAL_HEALTH = "Orientamento verticale della salute"
L_GUI_UF_ALPHA_HEALTH = "Trasparenza delle barre della salute quando i punti sono al 100%"
L_GUI_UF_SHOW_RANGE = "Abilita l'opacità dei riquadri d'incursione in base alla distanza"
L_GUI_UF_RANGE_ALPHA = "Alpha" -- Need review
L_GUI_UF_RANGE_ALPHA_DESC = "Trasparenza dei riquadri delle unità quando un'unità è fuori portata"
L_GUI_UF_SUBHEADER_RAIDFRAMES = "Frames" -- Need review
L_GUI_UF_SOLO_MODE = "Mostra sempre il riquadro del giocatore"
L_GUI_UF_PLAYER_PARTY = "Mostra il riquadro del giocatore in gruppo"
L_GUI_UF_SHOW_TANK = "Mostra i difensori dell'incursione"
L_GUI_UF_SHOW_TANK_TT = "Mostra il bersaglio del bersaglio dei difensori dell'incursione"
L_GUI_UF_RAID_GROUP = "Numero dei gruppi nell'incursione"
L_GUI_UF_RAID_VERTICAL_GROUP = "Gruppi dell'incursione verticali (solo per la Disposizione da Guaritore)"
L_GUI_UF_SUBHEADER_ICONS = "Icons" -- Need review
L_GUI_UF_ICONS_ROLE = "Icona del ruolo sui riquadri"
L_GUI_UF_ICONS_RAID_MARK = "Marchi d'incursione"
L_GUI_UF_ICONS_READY_CHECK = "Icone dell'appello"
L_GUI_UF_ICONS_LEADER = "Icona del capoincursione, dell'assistente"
L_GUI_UF_ICONS_SUMON = "Icone d’evocazione sui riquadri"
L_GUI_UF_PLUGINS_DEBUFFHIGHLIGHT_ICON = "Evidenzia texture + icona delle penalità"
L_GUI_UF_PLUGINS_AURA_WATCH = "Icone delle penalità d'incursione"
L_GUI_UF_PLUGINS_AURA_WATCH_TIMER = "Timer sulle icone delle penalità d'incursione"
L_GUI_UF_PLUGINS_PVP_DEBUFFS = "Mostra anche un’icona per le penalità PvP (dall’elenco)"
L_GUI_UF_PLUGINS_HEALCOMM = "Mostra le cure in arrivo sul riquadro"
L.raidframe_plugins_auto_resurrection = "Auto cast resurrection" -- Need review
L.raidframe_plugins_auto_resurrection_desc = "'Auto-lancia' resurrezione col tasto centrale quando l'unità è morta (non funziona con Clique attiva)"
L.raidframe_plugins_auto_resurrection_desc = "Auto cast resurrection on middle-click (doesn't work with Clique)"

-- Announcements options
L_GUI_ANNOUNCEMENTS = "Annunci"
L_GUI_ANNOUNCEMENTS_SUBTEXT = "Settings that add chat announcements about spells or items." -- Need review
L_GUI_ANNOUNCEMENTS_DRINKING = "Annuncia in chat quando un nemico in arena sta bevendo"
L_GUI_ANNOUNCEMENTS_INTERRUPTS = "Annuncia in gruppo/incursione quando tu interrompi un incantesimo/abilità"
L_GUI_ANNOUNCEMENTS_SPELLS = "Annuncia in gruppo/incursione quando usi alcuni incantesimi/abilità"
L_GUI_ANNOUNCEMENTS_SPELLS_FROM_ALL = "Controlla incantesimi/abilità lanciati da tutti i compagni di gruppo/incursione"
L_GUI_ANNOUNCEMENTS_TOY_TRAIN = "Annuncia l'uso del Trenino Giocattolo o del Telecomando di Birranera"
L_GUI_ANNOUNCEMENTS_SAYS_THANKS = "Ringrazia per alcuni incantesimi/abilità"
L_GUI_ANNOUNCEMENTS_PULL_COUNTDOWN = "Annuncia il conto alla rovescia di avvio incontro '/pc #'"
L_GUI_ANNOUNCEMENTS_FLASK_FOOD = "Annuncia l'uso di tonici e cibo"
L_GUI_ANNOUNCEMENTS_FLASK_FOOD_AUTO = "Annuncia automaticamente l'uso di cibi e tonici all'appello"
L_GUI_ANNOUNCEMENTS_FLASK_FOOD_RAID = "Annuncia l'uso di cibi e tonici nel canale incursione"
L_GUI_ANNOUNCEMENTS_FEASTS = "Annuncia l'uso di tripudi/calderoni/anime/robots per le riparazioni"
L_GUI_ANNOUNCEMENTS_PORTALS = "Annuncia l'uso di un portale/Rituale d'Evocazione"
L_GUI_ANNOUNCEMENTS_BAD_GEAR = "Controlla l'equip. non idoneo in instance"
L_GUI_ANNOUNCEMENTS_SAFARI_HAT = "Controlla se il Cappello da Safari sia indossato o meno"

-- Automation options
L_GUI_AUTOMATION = "Automation"
L_GUI_AUTOMATION_SUBTEXT = "This block contains settings that facilitate the routine."
L_GUI_AUTOMATION_RELEASE = "Auto release the spirit in battlegrounds"
L_GUI_AUTOMATION_SCREENSHOT = "Take screenshot when player get achievement"
L_GUI_AUTOMATION_SOLVE_ARTIFACT = "Auto popup for solve artifact"
L_GUI_AUTOMATION_ACCEPT_INVITE = "Auto accept invite"
L_GUI_AUTOMATION_DECLINE_DUEL = "Auto decline duel (/disduel to temporarily disable)"
L_GUI_AUTOMATION_ACCEPT_QUEST = "Auto accept quest (disabled if hold Shift)"
L_GUI_AUTOMATION_AUTO_COLLAPSE = "Auto collapse ObjectiveTrackerFrame in instance"
L_GUI_AUTOMATION_AUTO_COLLAPSE_RELOAD = "Auto collapse ObjectiveTrackerFrame after reload"
L_GUI_AUTOMATION_SKIP_CINEMATIC = "Auto skip cinematics/movies (disabled if hold Ctrl)"
L_GUI_AUTOMATION_AUTO_ROLE = "Auto set your role"
L_GUI_AUTOMATION_CANCEL_BAD_BUFFS = "Auto cancel various buffs (from the list)"
L_GUI_AUTOMATION_TAB_BINDER = "Auto change Tab key to only target enemy players"
L_GUI_AUTOMATION_LOGGING_COMBAT = "Auto enables combat log text file in raid instances"
L_GUI_AUTOMATION_BUFF_ON_SCROLL = "Cast buff on mouse scroll (from the list)"
L_GUI_AUTOMATION_OPEN_ITEMS = "Auto opening of items in bag"

-- Combat text options
L_GUI_COMBATTEXT = "Testo di combattimento"
L_GUI_COMBATTEXT_SUBTEXT = "For moving type in the chat '/xct'" -- Need review
L_GUI_COMBATTEXT_ENABLE = "Attiva il testo di combattimento"
L.combattext_blizz_head_numbers = "Enable Blizzard combat text" -- Need review
L.combattext_blizz_head_numbers_desc = "Usa il testo di combattimento della Blizzard per danni/cure"
L.combattext_damage_style = "Change default combat font" -- Need review
L.combattext_damage_style_desc = "Cambia il carattere di base per danni/cure (è necessario riavviare il gioco)"
L_GUI_COMBATTEXT_DAMAGE = "Mostra i danni in un proprio riquadro dedicato"
L_GUI_COMBATTEXT_HEALING = "Mostra le cure in un proprio riquadro dedicato"
L_GUI_COMBATTEXT_HOTS = "Mostra gli effetti delle cure periodiche nel riquadro delle cure"
L_GUI_COMBATTEXT_OVERHEALING = "Mostra le cure in eccesso"
L_GUI_COMBATTEXT_PET_DAMAGE = "Mostra i danni del tuo famiglio"
L_GUI_COMBATTEXT_DOT_DAMAGE = "Mostra i tuoi danni nel tempo"
L_GUI_COMBATTEXT_DAMAGE_COLOR = "Colora i numeri dei danni in base alla scuola di magia"
L_GUI_COMBATTEXT_CRIT_PREFIX = "Simbolo che sarà aggiunto prima dei critici"
L_GUI_COMBATTEXT_CRIT_POSTFIX = "Simbolo che sarà aggiunto dopo i critici"
L_GUI_COMBATTEXT_ICONS = "Mostra le icone dei danni"
L_GUI_COMBATTEXT_ICON_SIZE = "Icon size" -- Need review
L_GUI_COMBATTEXT_ICON_SIZE_DESC = "Dimensioni icone danni (influenza anche le dimensioni del carattere dei danni)"
L_GUI_COMBATTEXT_TRESHOLD = "Danno minimo da mostrare nel riquadro dei danni"
L_GUI_COMBATTEXT_HEAL_TRESHOLD = "Cure minime da mostrare nei messaggi delle cure"
L_GUI_COMBATTEXT_SCROLLABLE = "Attiva la 'modalità scorrimento': consente di scorrere tra le righe dei riquadri con la rotellina del mouse"
L_GUI_COMBATTEXT_MAX_LINES = "Max lines" -- Need review
L_GUI_COMBATTEXT_MAX_LINES_DESC = "Massimo numero righe da ricordare in 'scorrimento' (più righe = più memoria)"
L_GUI_COMBATTEXT_TIME_VISIBLE = "Time" -- Need review
L_GUI_COMBATTEXT_TIME_VISIBLE_DESC = "Tempo (in secondi) in cui un singolo messaggio sarà visibile"
L_GUI_COMBATTEXT_DK_RUNES = "Mostra la ricarica delle rune dei cavalieri della morte"
L_GUI_COMBATTEXT_KILLINGBLOW = "Comunica i tuoi colpi di grazia"
L_GUI_COMBATTEXT_MERGE_AOE_SPAM = "Unisci lo spam per danni multipli a più bersagli in un singolo messaggio"
L_GUI_COMBATTEXT_MERGE_MELEE = "Unifica lo spam di attacchi automatici multipli"
L_GUI_COMBATTEXT_DISPEL = "Comunica le tue dissoluzioni (dispels)"
L_GUI_COMBATTEXT_INTERRUPT = "Comunica le tue interruzioni (interrupts)"
L_GUI_COMBATTEXT_DIRECTION = "Change scrolling direction from bottom to top" -- Need review
L_GUI_COMBATTEXT_SHORT_NUMBERS = "Usa abbreviazioni numeriche ('25.3k' invece di '25342')"

-- Buffs reminder options
L_GUI_REMINDER = "Promemoria benefici"
L_GUI_REMINDER_SUBTEXT = "Display of missed auras." -- Need review
L_GUI_REMINDER_SOLO_ENABLE = "Mostra i propri benefici mancanti"
L_GUI_REMINDER_SOLO_SOUND = "Attiva un suono d'avviso per il promemoria dei propri benefici mancanti"
L_GUI_REMINDER_SOLO_SIZE = "Icon size" -- Need review
L_GUI_REMINDER_SOLO_SIZE_DESC = "Dimensione dell'icona dei propri benefici"
L_GUI_REMINDER_SUBHEADER = "Raid buffs" -- Need review
L_GUI_REMINDER_RAID_ENABLE = "Mostra i benefici d'incursione mancanti"
L_GUI_REMINDER_RAID_ALWAYS = "Mostra sempre il promemoria benefici"
L_GUI_REMINDER_RAID_SIZE = "Icon size" -- Need review
L_GUI_REMINDER_RAID_SIZE_DESC = "Dimensioni delle icone del promemoria benefici d'incursione"
L_GUI_REMINDER_RAID_ALPHA = "Transparent" -- Need review
L_GUI_REMINDER_RAID_ALPHA_DESC = "Trasparenza icona quando il beneficio è presente"

-- Raid cooldowns options
L_GUI_COOLDOWN_RAID = "Recuperi d'incursione"
L_GUI_COOLDOWN_RAID_SUBTEXT = "Tracking raid abilities in the upper left corner." -- Need review
L_GUI_COOLDOWN_RAID_ENABLE = "Visualizza i recuperi d'incursione"
L_GUI_COOLDOWN_RAID_HEIGHT = "Bars height" -- Need review
L_GUI_COOLDOWN_RAID_WIDTH = "Bars width" -- Need review
L_GUI_COOLDOWN_RAID_SORT = "Disposizione verso l'alto delle barre dei recuperi d'incursione"
L_GUI_COOLDOWN_RAID_EXPIRATION = "Ordina in base al tempo di scadenza"
L_GUI_COOLDOWN_RAID_SHOW_SELF = "Mostra i miei recuperi"
L_GUI_COOLDOWN_RAID_ICONS = "Icone dei recuperi d'incursione"
L_GUI_COOLDOWN_RAID_IN_RAID = "Mostra i recuperi d'incursione nelle aree da incursione"
L_GUI_COOLDOWN_RAID_IN_PARTY = "Mostra i recuperi d'incursione nelle aree da gruppo"
L_GUI_COOLDOWN_RAID_IN_ARENA = "Mostra i recuperi d'incursione nelle aree da arena"

-- Enemy cooldowns options
L_GUI_COOLDOWN_ENEMY = "Recuperi del nemico"
L_GUI_COOLDOWN_ENEMY_SUBTEXT = "Tracking enemy abilities as icons above your spell casting bar." -- Need review
L_GUI_COOLDOWN_ENEMY_ENABLE = "Visualizza i recuperi del nemico"
L_GUI_COOLDOWN_ENEMY_SIZE = "Dimensioni delle icone dei recuperi del nemico"
L_GUI_COOLDOWN_ENEMY_DIRECTION = "Direzione icone recuperi del nemico"
L_GUI_COOLDOWN_ENEMY_EVERYWHERE = "Mostra i recuperi del nemico in qualsiasi area"
L_GUI_COOLDOWN_ENEMY_IN_BG = "Mostra i recuperi del nemico nelle aree da Campo di Battaglia"
L_GUI_COOLDOWN_ENEMY_IN_ARENA = "Mostra i recuperi del nemico nelle aree da arena"

-- Pulse cooldowns options
L_GUI_COOLDOWN_PULSE = "Recuperi effetto 'pulse'"
L_GUI_COOLDOWN_PULSE_SUBTEXT = "Track your cd using a pulse icon in the center of the screen." -- Need review
L_GUI_COOLDOWN_PULSE_ENABLE = "Mostra i recuperi con effetto 'pulse'"
L_GUI_COOLDOWN_PULSE_SIZE = "Dimensione dell'icona dei recuperi con effetto 'pulse'"
L_GUI_COOLDOWN_PULSE_SOUND = "Attiva un suono di avviso"
L_GUI_COOLDOWN_PULSE_ANIM_SCALE = "Regolazione dell'animazione"
L_GUI_COOLDOWN_PULSE_HOLD_TIME = "Opacità del tempo d'attesa massimo"
L_GUI_COOLDOWN_PULSE_THRESHOLD = "Threshold time" -- Need review
L_GUI_COOLDOWN_PULSE_THRESHOLD_DESC = "Soglia di tempo minimo"

-- Threat options
L_GUI_THREAT = "Barre di minaccia"
L_GUI_THREAT_SUBTEXT = "Display of the threat list (a simple analogue of Omen)." -- Need review
L_GUI_THREAT_ENABLE = "Attiva le barre di minaccia"
L_GUI_THREAT_HEIGHT = "Altezza delle barre di minaccia"
L_GUI_THREAT_WIDTH = "Larghezza delle barre di minaccia"
L_GUI_THREAT_ROWS = "Numero delle barre di minaccia"
L_GUI_THREAT_HIDE_SOLO = "Mostra soltanto in gruppo/incursione"

-- Tooltip options
L_GUI_TOOLTIP = "Suggerimenti"
L_GUI_TOOLTIP_SUBTEXT = "In this block, you can change the standard tips when mouseovering." -- Need review
L_GUI_TOOLTIP_ENABLE = "Attiva i suggerimenti"
L_GUI_TOOLTIP_SHIFT = "Mostra i suggerimenti quando è premuto il tasto Shift"
L_GUI_TOOLTIP_CURSOR = "Suggerimenti sopra il cursore"
L_GUI_TOOLTIP_ICON = "Icone degli oggetti nei suggerimenti"
L_GUI_TOOLTIP_HEALTH = "Valore numerico della salute"
L_GUI_TOOLTIP_HIDE = "Nascondi i suggerimenti relativi alle barre delle azioni"
L_GUI_TOOLTIP_HIDE_COMBAT = "Nascondi i suggerimenti in combattimento"
L_GUI_TOOLTIP_SUBHEADER_PLUGINS = "Plugins" -- Need review
L_GUI_TOOLTIP_TALENTS = "Mostra i talenti nei suggerimenti"
L_GUI_TOOLTIP_ACHIEVEMENTS = "Mostra il paragone delle imprese nei suggerimenti"
L_GUI_TOOLTIP_TARGET = "Mostra nei suggerimenti chi ha il giocatore come bersaglio"
L_GUI_TOOLTIP_TITLE = "Titolo del giocatore nei suggerimenti"
L_GUI_TOOLTIP_REALM = "Reame del giocatore nei suggerimenti"
L_GUI_TOOLTIP_RANK = "Rango in gilda nei suggerimenti"
L_GUI_TOOLTIP_ARENA_EXPERIENCE = "Esperienza PvP del giocatore in arena"
L_GUI_TOOLTIP_SPELL_ID = "ID Incantesimo/Abilità"
L_GUI_TOOLTIP_AVERAGE_LVL_DESC = "The average item level" -- Need review
L_GUI_TOOLTIP_RAID_ICON = "Visualizza i marchi d'incursione nei suggerimenti"
L_GUI_TOOLTIP_WHO_TARGETTING = "Visualizza chi ha in bersaglio l'unità che è nel tuo gruppo/incursione"
L_GUI_TOOLTIP_ITEM_COUNT = "Conteggio oggetti"
L_GUI_TOOLTIP_UNIT_ROLE = "Ruolo dell'unità"
L_GUI_TOOLTIP_INSTANCE_LOCK = "Info incursione nei suggerimenti"

-- Chat options
L_GUI_CHAT_SUBTEXT = "Here you can change the settings of the chat window." -- Need review
L_GUI_CHAT_ENABLE = "Attiva chat"
L_GUI_CHAT_BACKGROUND = "Attiva lo sfondo della chat"
L_GUI_CHAT_BACKGROUND_ALPHA = "Trasparenza sfondo della chat"
L_GUI_CHAT_SPAM = "Rimozione di un po' di spam di sistema ('Giocatore1' sconfigge 'Giocatore2' in un duello.)"
L_GUI_CHAT_GOLD = "Rimozione di un po' di spam degli altri giocatori"
L_GUI_CHAT_WIDTH = "Larghezza chat"
L_GUI_CHAT_HEIGHT = "Altezza chat"
L_GUI_CHAT_BAR = "Barra con pulsanti per passare velocemente da un canale all'altro della chat"
L_GUI_CHAT_BAR_MOUSEOVER = "Barra canali chat al passaggio del mouse"
L_GUI_CHAT_TIMESTAMP = "Colorazione orario dei messaggi"
L_GUI_CHAT_WHISP = "Suono quando ricevi un sussurro"
L_GUI_CHAT_SKIN_BUBBLE = "Restyling dei fumetti delle chats"
L_GUI_CHAT_CL_TAB = "Mostra la linguetta del Registro di combattimento"
L_GUI_CHAT_TABS_MOUSEOVER = "Linguette delle chats al passaggio del mouse"
L_GUI_CHAT_STICKY = "Ricorda l'ultimo canale"
L_GUI_CHAT_DAMAGE_METER_SPAM = "Riunisce lo spam di un contatore dei danni in un singolo link"

-- Bag options
L_GUI_BAGS = "Sacche"
L_GUI_BAGS_SUBTEXT = "Changing the built-in bags." -- Need review
L_GUI_BAGS_ENABLE = "Attiva le sacche"
L_GUI_BAGS_ILVL = "Mostra il livello oggetto di armi e armature"
L_GUI_BAGS_BUTTON_SIZE = "Dimensioni degli scomparti"
L_GUI_BAGS_BUTTON_SPACE = "Spazio tra gli scomparti"
L_GUI_BAGS_BANK = "Numero di colonne in banca"
L_GUI_BAGS_BAG = "Numero di colonne nella sacca principale"

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
L_GUI_LOOT_ENABLE = "Attiva il riquadro bottino"
L_GUI_LOOT_ROLL_ENABLE = "Attiva il riquadro del bottino di gruppo"
L_GUI_LOOT_ICON_SIZE = "Dimensioni delle icone"
L_GUI_LOOT_WIDTH = "Larghezza del riquadro bottino"
L_GUI_LOOT_AUTOGREED = "A livello massimo, attiva automaticamente la bramosia per gli oggetti verdi"
L_GUI_LOOT_AUTODE = "'Auto-conferma' il disincantamento degli oggetti"

-- Nameplate options
L_GUI_NAMEPLATE_SUBTEXT = "Nameplates settings" -- Need review
L_GUI_NAMEPLATE_ENABLE = "Attiva le barre delle unità"
L_GUI_NAMEPLATE_COMBAT = "Mostra automaticamente le barre delle unità in combattimento"
L_GUI_NAMEPLATE_HEALTH = "Valore numerico della salute"
L_GUI_NAMEPLATE_HEIGHT = "Altezza delle barre delle unità"
L_GUI_NAMEPLATE_WIDTH = "Larghezza delle barre delle unità"
L_GUI_NAMEPLATE_DISTANCE = "Display range" -- Need review
L_GUI_NAMEPLATE_AD_HEIGHT = "Additional height" -- Need review
L_GUI_NAMEPLATE_AD_WIDTH = "Additional width" -- Need review
L_GUI_NAMEPLATE_CASTBAR_NAME = "Mostra il nome di incantesimi/abilità sulle barre incantesimi"
L_GUI_NAMEPLATE_CLASS_ICON = "Icone delle classi in PvP"
L_GUI_NAMEPLATE_NAME_ABBREV = "Mostra nomi abbreviati"
L_GUI_NAMEPLATE_CLAMP = "Aggancia le barre delle unità in cima allo schermo quando sono fuori portata visiva"
L_GUI_NAMEPLATE_SHOW_DEBUFFS = "Mostra le penalità sulle barre delle unità (l'ozpione 'Mostra nomi abbreviati' deve essere disabilitata)"
L_GUI_NAMEPLATE_SHOW_BUFFS = "Mostra i benefici (da un elenco) sopra la barra la barra del giocatore"
L_GUI_NAMEPLATE_DEBUFFS_SIZE = "Dimensioni delle penalità sulle barre delle unità"
L_GUI_NAMEPLATE_HEALER_ICON = "Nei Campi di Battaglia, mostra un'icona 'guaritore' accanto alle barre delle unità di tutti i guaritori nemici"
L_GUI_NAMEPLATE_TOTEM_ICONS = "Mostra un’icona sopra la barra dei totem nemici"
L_GUI_NAMEPLATE_THREAT = "Attiva il sensore di rilevamento minaccia (si adatta automaticamente al tuo ruolo)"
L_GUI_NAMEPLATE_GOOD_COLOR = "Colore se il PG è minacciato (in base a difensore o assaltatore/guaritore)"
L_GUI_NAMEPLATE_NEAR_COLOR = "Colore per perdita/guadagno minaccia"
L_GUI_NAMEPLATE_BAD_COLOR = "Colore se il PG non è minacciato (se difensore o assaltatore/guaritore)"
L_GUI_NAMEPLATE_OFFTANK_COLOR = "Colore della minaccia per il difensore secondario"

-- ActionBar options
L_GUI_ACTIONBAR = "Barre delle azioni"
L_GUI_ACTIONBAR_ENABLE = "Attiva le barre delle azioni"
L_GUI_ACTIONBAR_HOTKEY = "Mostra i nomi dei tasti di scelta rapida sugli scomparti"
L_GUI_ACTIONBAR_MACRO = "Mostra i nomi delle macro sugli scomparti"
L_GUI_ACTIONBAR_GRID = "Mostra lo sfondo degli scomparti vuoti sulle barre delle azioni"
L_GUI_ACTIONBAR_BUTTON_SIZE = "Dimensioni degli scomparti"
L_GUI_ACTIONBAR_BUTTON_SPACE = "Spazio tra gli scomparti"
L_GUI_ACTIONBAR_SPLIT_BARS = "Dividi la quinta barra in 2 barre da 6 scomparti ciascuna"
L_GUI_ACTIONBAR_CLASSCOLOR_BORDER = "Colora i bordi degli scomparti con i colori delle classi"
L_GUI_ACTIONBAR_TOGGLE_MODE = "Attiva la modalità a scomparsa"
L_GUI_ACTIONBAR_HIDE_HIGHLIGHT = "Nascondi il lumeggiare (highlight) di un proc."
L_GUI_ACTIONBAR_BOTTOMBARS = "Numero delle barre delle azioni in basso"
L_GUI_ACTIONBAR_RIGHTBARS = "Numero di barre delle azioni sulla destra"
L_GUI_ACTIONBAR_RIGHTBARS_MOUSEOVER = "Barre sulla destra al passaggio del mouse"
L_GUI_ACTIONBAR_PETBAR_HIDE = "Nascondi la barra famiglio"
L_GUI_ACTIONBAR_PETBAR_HORIZONTAL = "Rendi orizzontale la barra famiglio"
L_GUI_ACTIONBAR_PETBAR_MOUSEOVER = "Barra famiglio al passaggio del mouse (solo con la barra famiglio orizzontale)"
L_GUI_ACTIONBAR_STANCEBAR_HIDE = "Nascondi barra postura"
L_GUI_ACTIONBAR_STANCEBAR_HORIZONTAL = "Rendi orizzontale la barra postura"
L_GUI_ACTIONBAR_STANCEBAR_MOUSEOVER = "Barra postura al passaggio del mouse"
L_GUI_ACTIONBAR_MICROMENU = "Attiva il micromenu"
L_GUI_ACTIONBAR_MICROMENU_MOUSEOVER = "Micromenu al passaggio del mouse"

-- Auras/Buffs/Debuffs
L_GUI_AURA_PLAYER_BUFF_SIZE = "Buffs size" -- Need review
L_GUI_AURA_PLAYER_BUFF_SIZE_DESC = "Dimensione benefici giocatore"
L_GUI_AURA_SHOW_SPIRAL = "Spirale trascorrere tempo sulle icone delle auree"
L_GUI_AURA_SHOW_TIMER = "Mostra il timer del recupero sulle icone delle auree"
L_GUI_AURA_PLAYER_AURAS = "Auree sul riquadro del giocatore"
L_GUI_AURA_TARGET_AURAS = "Auree sul riquadro del bersaglio"
L_GUI_AURA_FOCUS_DEBUFFS = "Penalità sul riquadro del focus"
L_GUI_AURA_FOT_DEBUFFS = "Penalità sul riquadro del bersaglio del focus"
L_GUI_AURA_PET_DEBUFFS = "Penalità sul riquadro del famiglio"
L_GUI_AURA_TOT_DEBUFFS = "Penalità sul riquadro del bersaglio del bersaglio"
L_GUI_AURA_BOSS_BUFFS = "Benefici sul riquadro del boss"
L_GUI_AURA_PLAYER_AURA_ONLY = "Mostra solo le tue penalità sul riquadro del bersaglio"
L_GUI_AURA_DEBUFF_COLOR_TYPE = "Colora le penalità a seconda del tipo"
L_GUI_AURA_CAST_BY = "Mostra chi ha lanciato un beneficio o una penalità nei suggerimenti"
L_GUI_AURA_CLASSCOLOR_BORDER = "Colora i bordi dei benefici del giocatore in base al colore della classi"

-- Filger
L_GUI_FILGER = "Timers (Filger)"
L_GUI_FILGER_SUBTEXT = "Filger - analogue WeakAuras, but more simple and easy. Allows you to display in the form of icons and bars your auras and timers." -- Need review
L_GUI_FILGER_ENABLE = "Attiva Filger"
L_GUI_FILGER_TEST_MODE = "Modalità di prova delle icone"
L_GUI_FILGER_MAX_TEST_ICON = "Il numero di icone da sottoporre alla prova"
L_GUI_FILGER_SHOW_TOOLTIP = "Mostra suggerimenti"
L_GUI_FILGER_DISABLE_CD = "Disattiva i recuperi"
L_GUI_FILGER_DISABLE_PVP = "Disable PvP debuffs on Player and Target" -- Need review
L_GUI_FILGER_EXPIRATION = "Sort cooldowns by expiration time" -- Need review
L_GUI_FILGER_BUFFS_SIZE = "Dimensione dei benefici"
L_GUI_FILGER_COOLDOWN_SIZE = "Dimensione dei recuperi"
L_GUI_FILGER_PVP_SIZE = "Dimensione delle penalità PvP"

-- Panel options
L_GUI_TOP_PANEL = "Pannello superiore"
L_GUI_TOP_PANEL_SUBTEXT = "Manage built-in top panel with information." -- Need review
L_GUI_TOP_PANEL_ENABLE = "Attiva il pannello superiore"
L_GUI_TOP_PANEL_MOUSE = "Pannello superiore al passaggio del mouse"
L_GUI_TOP_PANEL_WIDTH = "Larghezza pannello"
L_GUI_TOP_PANEL_HEIGHT = "Altezza pannello"

-- Stats options
L_GUI_STATS = "Stats"
L_GUI_STATS_SUBTEXT = "Statistics blocks located at the bottom of the screen. Type in the chat '/ls' for info." -- Need review
L_GUI_STATS_CLOCK = "Orologio"
L_GUI_STATS_LATENCY = "Latenza"
L_GUI_STATS_MEMORY = "Memoria"
L_GUI_STATS_FPS = "Frames Per Seconds"
L_GUI_STATS_EXPERIENCE = "Esperienza"
L_GUI_STATS_TALENTS_DESC = "Date-text allows you to change the spec and loot on click" -- Need review
L_GUI_STATS_COORDS = "Coordinate"
L_GUI_STATS_LOCATION = "Località"
L_GUI_STATS_BG = "Campi di Battaglia"
L_GUI_STATS_SUBHEADER_CURRENCY = "Currency (displayed in gold data text)" -- Need review
L_GUI_STATS_CURRENCY_ARCHAEOLOGY = "Mostra i frammenti di archeologia sotto la linguetta della valuta"
L_GUI_STATS_CURRENCY_COOKING = "Mostra le ricompense di cucina sotto la linguetta della valuta"
L_GUI_STATS_CURRENCY_PROFESSIONS = "Mostra i gettoni delle professioni sotto la linguetta della valuta"
L_GUI_STATS_CURRENCY_RAID = "Mostra i sigilli delle incursioni"
L_GUI_STATS_CURRENCY_MISCELLANEOUS = "Mostra valuta varia sotto la linguetta della valuta"

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
L_GUI_ERROR = "Errori"
L_GUI_ERROR_SUBTEXT = "Filtering standard text at the top of the screen from Blizzard." -- Need review
L_GUI_ERROR_BLACK = "Nascondi gli errori della lista nera"
L_GUI_ERROR_WHITE = "Mostra gli errori della lista bianca"
L_GUI_ERROR_HIDE_COMBAT = "In combattimento, nascondi tutti gli errori"

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