local _, L = ...
if GetLocale() ~= "frFR" then return end

----------------------------------------------------------------------------------------
--	Localization for frFR client
--	Translation: Cranan, Puree, AlbertDuval
----------------------------------------------------------------------------------------
L_GUI_SET_SAVED_SETTTINGS = "Sauvegarder la configuration par personnage"
L_GUI_SET_SAVED_SETTTINGS_DESC = "Switch between a profile that applies to all characters and one that is unique to this character." -- Need review
L_GUI_RESET_CHAR = "Réinitialiser les paramètres de votre personnage sur ViksUI ?"
L_GUI_RESET_ALL = "Réinitialiser tous les paramètres de ViksUI ?"
L_GUI_PER_CHAR = "Modifier la configuration du personnage ?"
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
L_GUI_UF_PLUGINS_CLASS_BAR = "Barres de classe"
L_GUI_UF_PLUGINS_CLASS_BAR_SUBTEXT = "Control of special class resources." -- Need review
L_GUI_UF_PLUGINS_COMBO_BAR = "Afficher la barre des points de combo pour les Voleurs/Druides"
L_GUI_UF_PLUGINS_COMBO_BAR_ALWAYS = "Toujours montrer la barre des points de combo pour la classe Druide"
L_GUI_UF_PLUGINS_COMBO_BAR_OLD = "Activer les points de Combo sur la cible"
L_GUI_UF_PLUGINS_ARCANE_BAR = "Activer la barre de charge Arcanique"
L_GUI_UF_PLUGINS_CHI_BAR = "Activer la barre de Chi"
L_GUI_UF_PLUGINS_STAGGER_BAR = "Activer la barre de chancelement (pour les Tanks Monk)"
L_GUI_UF_PLUGINS_HOLY_BAR = "Activer la barre de Puissance sacrée"
L_GUI_UF_PLUGINS_SHARD_BAR = "Activier la barre de Fragment d'âme"
L_GUI_UF_PLUGINS_RUNE_BAR = "Activer la barre de Rune"
L_GUI_UF_PLUGINS_TOTEM_BAR = "Activer la barre de Totem"
L_GUI_UF_PLUGINS_RANGE_BAR = "Active la barre de distance (pour la classe Prêtre)"

-- Raid Frames options
L_GUI_UF_RAIDFRAMES_SUBTEXT = "Customize the appearance of the raid frames." -- Need review
L_GUI_UF_BY_ROLE = "Trier les joueurs par rôle dans les groupes"
L_GUI_UF_AGGRO_BORDER = "Aggro signalée en bordure"
L_GUI_UF_DEFICIT_HEALTH = "Déficit en vie du raid"
L_GUI_UF_SHOW_PARTY = "Afficher les barres du groupe"
L_GUI_UF_SHOW_RAID = "Afficher les barres du raid"
L_GUI_UF_VERTICAL_HEALTH = "Orientation vertical des barres de vie"
L_GUI_UF_ALPHA_HEALTH = "Opacité des barres de vie quand 100%hp"
L_GUI_UF_SHOW_RANGE = "Changer l'opacité par rapport ? la portée sur les barres de raid"
L_GUI_UF_RANGE_ALPHA = "Alpha" -- Need review
L_GUI_UF_RANGE_ALPHA_DESC = "Opacité de la barre vie quand hors de portée"
L_GUI_UF_SUBHEADER_RAIDFRAMES = "Frames" -- Need review
L_GUI_UF_SOLO_MODE = "Toujours afficher la barre du joueur"
L_GUI_UF_PLAYER_PARTY = "Afficher la barre du joueur en groupe"
L_GUI_UF_SHOW_TANK = "Afficher les tanks de raid"
L_GUI_UF_SHOW_TANK_TT = "Afficher la cible de la cible des tanks"
L_GUI_UF_RAID_GROUP = "Nombre de groupe dans le raid"
L_GUI_UF_RAID_VERTICAL_GROUP = "Groupe de raid verticaux(pour l'interface Heal)"
L_GUI_UF_SUBHEADER_ICONS = "Icons" -- Need review
L_GUI_UF_ICONS_ROLE = "Icone de rôle sur les barres de vie"
L_GUI_UF_ICONS_RAID_MARK = "Signe de raid"
L_GUI_UF_ICONS_READY_CHECK = "Icone d'appel"
L_GUI_UF_ICONS_LEADER = "Icone du Chef de raid, icone de l'assistant"
L_GUI_UF_ICONS_SUMON = "Faire apparaître les icones sur les barres"
L_GUI_UF_PLUGINS_DEBUFFHIGHLIGHT_ICON = "Mise en évidence des debuffs texture + îcone"
L_GUI_UF_PLUGINS_AURA_WATCH = "Aura/debuff de raid"
L_GUI_UF_PLUGINS_AURA_WATCH_TIMER = "Durée sur les icônes de débuff du raid"
L_GUI_UF_PLUGINS_PVP_DEBUFFS = "Afficher aussi les debuff JcJ (de la liste)"
L_GUI_UF_PLUGINS_HEALCOMM = "Barre de soin entrant (incoming)"
L.raidframe_plugins_auto_resurrection = "Auto cast resurrection" -- Need review
L.raidframe_plugins_auto_resurrection_desc = "Lance automatiquement le sort de résurrection de masse avec un clic central souris sur une cible morte (ne fonctionne pas avec l'addon Clique activé)"

-- Announcements options
L_GUI_ANNOUNCEMENTS = "Annonces"
L_GUI_ANNOUNCEMENTS_SUBTEXT = "Settings that add chat announcements about spells or items." -- Need review
L_GUI_ANNOUNCEMENTS_DRINKING = "Annonce dans la fenêtre de discussion quand un joueur ennemi est entrain de boire"
L_GUI_ANNOUNCEMENTS_INTERRUPTS = "Annonce /gr, /raid si vous interrompez un sort"
L_GUI_ANNOUNCEMENTS_SPELLS = "Annonce dans la fenêtre groupe/raid quand vous lancez certains sorts"
L_GUI_ANNOUNCEMENTS_SPELLS_FROM_ALL = "Annonce les sorts lancés par tous les membres"
L_GUI_ANNOUNCEMENTS_TOY_TRAIN = "Annonce le lancement du sort Train électrique ou Télécommande navrebière"
L_GUI_ANNOUNCEMENTS_SAYS_THANKS = "Dire merci pour certains sorts"
L_GUI_ANNOUNCEMENTS_PULL_COUNTDOWN = "Annonce le compte à rebours pou Pull '/pc #'"
L_GUI_ANNOUNCEMENTS_FLASK_FOOD = "Annonce l'usage de flasques et nourriture"
L_GUI_ANNOUNCEMENTS_FLASK_FOOD_AUTO = "Annonce automatiquement la prise de flasque et nourriture après un appel raid"
L_GUI_ANNOUNCEMENTS_FLASK_FOOD_RAID = "Announce flasque et nourriture sur le canal raid"
L_GUI_ANNOUNCEMENTS_FEASTS = "Annonce la pose de Festins/Pierre de soins/Robots de réparation"
L_GUI_ANNOUNCEMENTS_PORTALS = "Annonce le lancement de Portails/Pierre de téléportation"
L_GUI_ANNOUNCEMENTS_BAD_GEAR = "Vérifie si un mauvais équipement est porté en instance"
L_GUI_ANNOUNCEMENTS_SAFARI_HAT = "Vérifie l'équipement du Chapeau de Safari"

-- Automation options
L_GUI_AUTOMATION = "Automatisation"
L_GUI_AUTOMATION_SUBTEXT = "This block contains settings that facilitate the routine." -- Need review
L_GUI_AUTOMATION_RELEASE = "Libération automatique du corps en champ de bataille"
L_GUI_AUTOMATION_SCREENSHOT = "Prend une capture d'écran quand un haut-fait est accomplie"
L_GUI_AUTOMATION_SOLVE_ARTIFACT = "Affiche automatiquement une fenêtre pour la résolution d'un artéfact"
L_GUI_AUTOMATION_ACCEPT_INVITE = "Accepter automatiquement les invitations"
L_GUI_AUTOMATION_DECLINE_DUEL = "Décliner les duels automatiquement"
L_GUI_AUTOMATION_ACCEPT_QUEST = "Accepter les quêtes automatiquement"
L_GUI_AUTOMATION_AUTO_COLLAPSE = "Rétrécie automatiquement la liste des quêtes en instance"
L_GUI_AUTOMATION_AUTO_COLLAPSE_RELOAD = "Fermeture automatique de la fenêtre de suivi des objectifs après rechargement"
L_GUI_AUTOMATION_SKIP_CINEMATIC = "Désactive automatiquement les cinématiques/film (inactif si la touche Ctrl est appuyée)"
L_GUI_AUTOMATION_AUTO_ROLE = "Active automatiquement l'affichage de votre rôle"
L_GUI_AUTOMATION_CANCEL_BAD_BUFFS = "Annule automatiquement certains buffs"
L_GUI_AUTOMATION_TAB_BINDER = "Active la touche Tab pour ne cibler que les personnages joueurs ennemis"
L_GUI_AUTOMATION_LOGGING_COMBAT = "Active automatiquement l'enregistrement du journal de combat en raid"
L_GUI_AUTOMATION_BUFF_ON_SCROLL = "Lancement de sort via la molette souris"
L_GUI_AUTOMATION_OPEN_ITEMS = "Ouverture automatique des objets dans les sacs"

-- Combat text options
L_GUI_COMBATTEXT = "Texte de combat"
L_GUI_COMBATTEXT_SUBTEXT = "For moving type in the chat '/xct'" -- Need review
L_GUI_COMBATTEXT_ENABLE = "Activer les textes de combat"
L.combattext_blizz_head_numbers = "Enable Blizzard combat text" -- Need review
L.combattext_blizz_head_numbers_desc = "Utiliser les textes de combat de Blizzard"
L.combattext_damage_style = "Change default combat font" -- Need review
L.combattext_damage_style_desc = "Change la police par défaut des dégâts/soins au dessus de la tête de la cible (Vous devez redémarrer WoW pour valider le changement)"
L_GUI_COMBATTEXT_DAMAGE = "Afficher les dégâts dans une fenêtre dédiée"
L_GUI_COMBATTEXT_HEALING = "Afficher les soins dans une fenêtre dédiée"
L_GUI_COMBATTEXT_HOTS = "Afficher les effets des soins périodiques dans la fenêtre de soin"
L_GUI_COMBATTEXT_OVERHEALING = "Afficher les excès de soins sortants"
L_GUI_COMBATTEXT_PET_DAMAGE = "Afficher les dégâts du familier"
L_GUI_COMBATTEXT_DOT_DAMAGE = "Afficher les dégâts des dots"
L_GUI_COMBATTEXT_DAMAGE_COLOR = "Afficher les dégâts en fonction de l'école de magie"
L_GUI_COMBATTEXT_CRIT_PREFIX = "Caractère à afficher avant le montant d'un critique"
L_GUI_COMBATTEXT_CRIT_POSTFIX = "Caractère à afficher après le montant d'un critique"
L_GUI_COMBATTEXT_ICONS = "Afficher l'icône du sort"
L_GUI_COMBATTEXT_ICON_SIZE = "Icon size" -- Need review
L_GUI_COMBATTEXT_ICON_SIZE_DESC = "Taille de l'icône du sort"
L_GUI_COMBATTEXT_TRESHOLD = "Dégâts minimum pour afficher dans la fenêtre de dégâts"
L_GUI_COMBATTEXT_HEAL_TRESHOLD = "Soins minimum pour afficher dans la fenêtre de dégâts"
L_GUI_COMBATTEXT_SCROLLABLE = "Autoriser le défilement avec la molette dans la fenêtre de dégâts/soins"
L_GUI_COMBATTEXT_MAX_LINES = "Max lines" -- Need review
L_GUI_COMBATTEXT_MAX_LINES_DESC = "Nombre de lignes maximum à conserver si l'option de défilement est activée (plus de ligne = plus de mémoire utilisée)"
L_GUI_COMBATTEXT_TIME_VISIBLE = "Time" -- Need review
L_GUI_COMBATTEXT_TIME_VISIBLE_DESC = "Temps en seconde durant lequel un message est affiché"
L_GUI_COMBATTEXT_DK_RUNES = "Afficher le rechargement des runes du chevalier de la mort"
L_GUI_COMBATTEXT_KILLINGBLOW = "Afficher les coups fatals"
L_GUI_COMBATTEXT_MERGE_AOE_SPAM = "Rassembler tous les dégâts d'un aoe en un seul message"
L_GUI_COMBATTEXT_MERGE_MELEE = "Rassemble les dégâts multiples en auto attaque"
L_GUI_COMBATTEXT_DISPEL = "Affiche les sorts que vous avez dissipé"
L_GUI_COMBATTEXT_INTERRUPT = "Affiche les sorts que vous avez interrompu"
L_GUI_COMBATTEXT_DIRECTION = "Change scrolling direction from bottom to top" -- Need review
L_GUI_COMBATTEXT_SHORT_NUMBERS = "Rendre plus lisible les nombres ('25.3k' au lieu de '25342')"

-- Buffs reminder options
L_GUI_REMINDER = "Contrôle des buffs"
L_GUI_REMINDER_SUBTEXT = "Display of missed auras." -- Need review
L_GUI_REMINDER_SOLO_ENABLE = "Voir les buffs personnels manquants"
L_GUI_REMINDER_SOLO_SOUND = "Son d'alerte si buff manquant"
L_GUI_REMINDER_SOLO_SIZE = "Icon size" -- Need review
L_GUI_REMINDER_SOLO_SIZE_DESC = "Taille de l'icône pour les buffs personnels"
L_GUI_REMINDER_SUBHEADER = "Raid buffs" -- Need review
L_GUI_REMINDER_RAID_ENABLE = "Voir les buffs de raid manquants"
L_GUI_REMINDER_RAID_ALWAYS = "Toujours voir les buffs manquants"
L_GUI_REMINDER_RAID_SIZE = "Icon size" -- Need review
L_GUI_REMINDER_RAID_SIZE_DESC = "Taille de l'icône pour les buffs de raid"
L_GUI_REMINDER_RAID_ALPHA = "Transparent" -- Need review
L_GUI_REMINDER_RAID_ALPHA_DESC = "Icône transparente quand le buff de raid est présent"

-- Raid cooldowns options
L_GUI_COOLDOWN_RAID = "Temps de recharge du raid"
L_GUI_COOLDOWN_RAID_SUBTEXT = "Tracking raid abilities in the upper left corner." -- Need review
L_GUI_COOLDOWN_RAID_ENABLE = "Activer les CD de raid"
L_GUI_COOLDOWN_RAID_HEIGHT = "Bars height" -- Need review
L_GUI_COOLDOWN_RAID_WIDTH = "Bars width" -- Need review
L_GUI_COOLDOWN_RAID_SORT = "Nouvelle barre vers le haut"
L_GUI_COOLDOWN_RAID_EXPIRATION = "Tri par temps d'expiration"
L_GUI_COOLDOWN_RAID_SHOW_SELF = "Montrer mes temps de recharge"
L_GUI_COOLDOWN_RAID_ICONS = "Icônes des temps de recharge de raid"
L_GUI_COOLDOWN_RAID_IN_RAID = "Voir les temps de recharge alliés en raid"
L_GUI_COOLDOWN_RAID_IN_PARTY = "Voir les temps de recharge alliés en groupe"
L_GUI_COOLDOWN_RAID_IN_ARENA = "Voir les temps de recharge alliés en arène"

-- Enemy cooldowns options
L_GUI_COOLDOWN_ENEMY = "Temps de recharge des ennemis"
L_GUI_COOLDOWN_ENEMY_SUBTEXT = "Tracking enemy abilities as icons above your spell casting bar." -- Need review
L_GUI_COOLDOWN_ENEMY_ENABLE = "Activer les temps de recharge ennemis"
L_GUI_COOLDOWN_ENEMY_SIZE = "Taille de l'icône des temps de recharge ennemis"
L_GUI_COOLDOWN_ENEMY_DIRECTION = "Icône directionnelle du temps de recharge ennemis"
L_GUI_COOLDOWN_ENEMY_EVERYWHERE = "Voir les temps de recharge ennemis partout"
L_GUI_COOLDOWN_ENEMY_IN_BG = "Voir les temps de recharge ennemis dans les champs de bataille"
L_GUI_COOLDOWN_ENEMY_IN_ARENA = "Voir les temps de recharge ennemis en arène"

-- Pulse cooldowns options
L_GUI_COOLDOWN_PULSE = "Temps de recharge par îcone d'impulsion"
L_GUI_COOLDOWN_PULSE_SUBTEXT = "Track your cd using a pulse icon in the center of the screen." -- Need review
L_GUI_COOLDOWN_PULSE_ENABLE = "Activation de l'îcone d'impulsion"
L_GUI_COOLDOWN_PULSE_SIZE = "Taille de l'îcone d'impulstion"
L_GUI_COOLDOWN_PULSE_SOUND = "Avertissement sonore"
L_GUI_COOLDOWN_PULSE_ANIM_SCALE = "Mise à l'échelle des animations"
L_GUI_COOLDOWN_PULSE_HOLD_TIME = "Temps maximum pour la rémanence de l'îcone"
L_GUI_COOLDOWN_PULSE_THRESHOLD = "Threshold time" -- Need review
L_GUI_COOLDOWN_PULSE_THRESHOLD_DESC = "Temps minimum de déclenchement"

-- Threat options
L_GUI_THREAT = "Barre de menace"
L_GUI_THREAT_SUBTEXT = "Display of the threat list (a simple analogue of Omen)." -- Need review
L_GUI_THREAT_ENABLE = "Activer les barres de menace"
L_GUI_THREAT_HEIGHT = "Hauteur des barres de menace"
L_GUI_THREAT_WIDTH = "Largeur des barres de menace"
L_GUI_THREAT_ROWS = "Nombre de barres de menace"
L_GUI_THREAT_HIDE_SOLO = "Afficher la menace seulement en groupe/raid"

-- Tooltip options
L_GUI_TOOLTIP = "Tooltip"
L_GUI_TOOLTIP_SUBTEXT = "In this block, you can change the standard tips when mouseovering." -- Need review
L_GUI_TOOLTIP_ENABLE = "Activer les tooltips"
L_GUI_TOOLTIP_SHIFT = "Afficher la tooltip quand la touche 'MAJ' est appuyée"
L_GUI_TOOLTIP_CURSOR = "Afficher la Tooltip sous le curseur"
L_GUI_TOOLTIP_ICON = "Afficher l'îcone de l'objet"
L_GUI_TOOLTIP_HEALTH = "Afficher les points de vie"
L_GUI_TOOLTIP_HIDE = "Cacher le tooltip pour les barres d'action"
L_GUI_TOOLTIP_HIDE_COMBAT = "Cacher les tooltips en combat"
L_GUI_TOOLTIP_SUBHEADER_PLUGINS = "Plugins" -- Need review
L_GUI_TOOLTIP_TALENTS = "Afficher les talents"
L_GUI_TOOLTIP_ACHIEVEMENTS = "Afficher Comparer les Hauts Faits"
L_GUI_TOOLTIP_TARGET = "Afficher la cible"
L_GUI_TOOLTIP_TITLE = "Afficher les titres"
L_GUI_TOOLTIP_REALM = "Affiche le serveur du joueur"
L_GUI_TOOLTIP_RANK = "Afficher le rang de guilde"
L_GUI_TOOLTIP_ARENA_EXPERIENCE = "Expérience en arène"
L_GUI_TOOLTIP_SPELL_ID = "Afficher l'ID du sort"
L_GUI_TOOLTIP_AVERAGE_LVL_DESC = "The average item level" -- Need review
L_GUI_TOOLTIP_RAID_ICON = "Afficher l'îcone de raid"
L_GUI_TOOLTIP_WHO_TARGETTING = "Afficher qui cible actuellement l'unité qui est dans votre groupe/raid"
L_GUI_TOOLTIP_ITEM_COUNT = "Afficher le nombre d'objets possédés"
L_GUI_TOOLTIP_UNIT_ROLE = "Afficher les rôles"
L_GUI_TOOLTIP_INSTANCE_LOCK = "Afficher le verrouillage de votre instance"

-- Chat options
L_GUI_CHAT_SUBTEXT = "Here you can change the settings of the chat window." -- Need review
L_GUI_CHAT_ENABLE = "Activer la fenêtre de dialogue"
L_GUI_CHAT_BACKGROUND = "Activer l'arrière plan"
L_GUI_CHAT_BACKGROUND_ALPHA = "Transparence de l'arrière"
L_GUI_CHAT_SPAM = "Supprime certains spam(Player1 gagne contre Player2)"
L_GUI_CHAT_GOLD = "Supprime tous les spams joueur"
L_GUI_CHAT_WIDTH = "Largeur de la fenêtre"
L_GUI_CHAT_HEIGHT = "Hauteur de la fenêtre"
L_GUI_CHAT_BAR = "Bouton pour changer de canal"
L_GUI_CHAT_BAR_MOUSEOVER = "Affiche les boutons de canaux au survol de la souris"
L_GUI_CHAT_TIMESTAMP = "Coloration du temps"
L_GUI_CHAT_WHISP = "Alerte sonore quand murmure"
L_GUI_CHAT_SKIN_BUBBLE = "Skin des bulles de discussions"
L_GUI_CHAT_CL_TAB = "Afficher l'onglet du journal de combat"
L_GUI_CHAT_TABS_MOUSEOVER = "Affiche les onglets de discussion au survol de la souris"
L_GUI_CHAT_STICKY = "Active le dernier canal utilisé(canal persistant)"
L_GUI_CHAT_DAMAGE_METER_SPAM = "Rassemble les lignes de statistiques de dégâts en un seul lien/ligne"

-- Bag options
L_GUI_BAGS = "Sacs"
L_GUI_BAGS_SUBTEXT = "Changing the built-in bags." -- Need review
L_GUI_BAGS_ENABLE = "Activer les sacs"
L_GUI_BAGS_ILVL = "Afficher le niveau d'objet des armes et armures"
L_GUI_BAGS_BUTTON_SIZE = "Taille des boutons"
L_GUI_BAGS_BUTTON_SPACE = "Espacement des boutons"
L_GUI_BAGS_BANK = "Nombre de colonne pour la banque"
L_GUI_BAGS_BAG = "Nombre de colonne pour les sacs"

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
L_GUI_LOOT_ENABLE = "Activer la fenêtre de butin"
L_GUI_LOOT_ROLL_ENABLE = "Activer la fenêtre de butin de groupe"
L_GUI_LOOT_ICON_SIZE = "Taille de l'icône"
L_GUI_LOOT_WIDTH = "Largeur de la fenêtre de butin"
L_GUI_LOOT_AUTOGREED = "Activer désenchantement automatique pour les objets verts au niveau maximum"
L_GUI_LOOT_AUTODE = "Confirmation automatique pour le désenchantement"

-- Nameplate options
L_GUI_NAMEPLATE_SUBTEXT = "Nameplates settings" -- Need review
L_GUI_NAMEPLATE_ENABLE = "Activer les barres de nom"
L_GUI_NAMEPLATE_COMBAT = "Afficher automatiquement les barres de nom en combat"
L_GUI_NAMEPLATE_HEALTH = "Valeur de points de vie"
L_GUI_NAMEPLATE_HEIGHT = "Hauteur des barres de nom"
L_GUI_NAMEPLATE_WIDTH = "Largeur des barres de nom"
L_GUI_NAMEPLATE_DISTANCE = "Display range" -- Need review
L_GUI_NAMEPLATE_AD_HEIGHT = "Additional height" -- Need review
L_GUI_NAMEPLATE_AD_WIDTH = "Additional width" -- Need review
L_GUI_NAMEPLATE_CASTBAR_NAME = "Afficher le nom du sort"
L_GUI_NAMEPLATE_CLASS_ICON = "Icône de classe en JcJ"
L_GUI_NAMEPLATE_NAME_ABBREV = "Afficher les noms abrégés"
L_GUI_NAMEPLATE_CLAMP = "Afficher les barres en haut de l'écran quand celles-ci sont au delà de la vision"
L_GUI_NAMEPLATE_SHOW_DEBUFFS = "Affiche les affaiblissements (Les noms abrégés doivent être désactivés)"
L_GUI_NAMEPLATE_SHOW_BUFFS = "Afficher les améliorations au dessus des barres des alliés (contenu dans la liste)"
L_GUI_NAMEPLATE_DEBUFFS_SIZE = "Taille des affaiblissements"
L_GUI_NAMEPLATE_HEALER_ICON = "Affiche une icône de soigneur sur toutes les barres de vie des soigneurs ennemis dans les champs de bataille"
L_GUI_NAMEPLATE_TOTEM_ICONS = "Afficher une icone au dessus des barres de vie des totems ennemis"
L_GUI_NAMEPLATE_THREAT = "Activer la gestion de la menace, change automatiquement selon votre rôle"
L_GUI_NAMEPLATE_GOOD_COLOR = "Bonne couleur de menace, dépend de si vous êtes un tank ou dps/heal"
L_GUI_NAMEPLATE_NEAR_COLOR = "Perte/Gain de couleur de menace"
L_GUI_NAMEPLATE_BAD_COLOR = "Mauvaise couleur de menace, dépend de si vous êtes un tank ou dps/heal"
L_GUI_NAMEPLATE_OFFTANK_COLOR = "Coloration de la menace du tank secondaire"

-- ActionBar options
L_GUI_ACTIONBAR = "Barres d'action"
L_GUI_ACTIONBAR_ENABLE = "Activer les barres d'action"
L_GUI_ACTIONBAR_HOTKEY = "Afficher le texte des macros"
L_GUI_ACTIONBAR_MACRO = "Afficher le nom des macros sur les touches"
L_GUI_ACTIONBAR_GRID = "Afficher les boutons vides"
L_GUI_ACTIONBAR_BUTTON_SIZE = "Taille des boutons"
L_GUI_ACTIONBAR_BUTTON_SPACE = "Espacement des boutons"
L_GUI_ACTIONBAR_SPLIT_BARS = "Séparation de la 5ème barre en 2 barres de 6 boutons de chaque côté"
L_GUI_ACTIONBAR_CLASSCOLOR_BORDER = "Active la couleur de votre classe pour la bordure de boutons"
L_GUI_ACTIONBAR_TOGGLE_MODE = "Active le mode pour bloquer les combinaisons des barres d'action"
L_GUI_ACTIONBAR_HIDE_HIGHLIGHT = "Cache la surbrillance des effets à déclenchement"
L_GUI_ACTIONBAR_BOTTOMBARS = "Nombre de barres d'action en bas"
L_GUI_ACTIONBAR_RIGHTBARS = "Nombre de barres d'action à droite"
L_GUI_ACTIONBAR_RIGHTBARS_MOUSEOVER = "Barres de droite en 'mouseover'"
L_GUI_ACTIONBAR_PETBAR_HIDE = "Cacher la barre du familier"
L_GUI_ACTIONBAR_PETBAR_HORIZONTAL = "Activer la barre du familier horizontale"
L_GUI_ACTIONBAR_PETBAR_MOUSEOVER = "Barre du familier en 'mouseover'(uniquement pour la barre horizontale)"
L_GUI_ACTIONBAR_STANCEBAR_HIDE = "Cacher changeforme"
L_GUI_ACTIONBAR_STANCEBAR_HORIZONTAL = "Activer la barre de posture horizontale"
L_GUI_ACTIONBAR_STANCEBAR_MOUSEOVER = "Changeforme/Posture/barre de totems en 'mouseover'" -- Need review
L_GUI_ACTIONBAR_MICROMENU = "Active le Micro menu"
L_GUI_ACTIONBAR_MICROMENU_MOUSEOVER = "Affiche le Micro menu au survol de la souris"

-- Auras/Buffs/Debuffs
L_GUI_AURA_PLAYER_BUFF_SIZE = "Buffs size" -- Need review
L_GUI_AURA_PLAYER_BUFF_SIZE_DESC = "Taille des buffs du joueur"
L_GUI_AURA_SHOW_SPIRAL = "Spirale sur les icones d'aura"
L_GUI_AURA_SHOW_TIMER = "Afficher le cooldown des icones d'aura"
L_GUI_AURA_PLAYER_AURAS = "Auras sur la barre du joueur"
L_GUI_AURA_TARGET_AURAS = "Auras sur la barre de cible"
L_GUI_AURA_FOCUS_DEBUFFS = "Afficher les debuffs du focus"
L_GUI_AURA_FOT_DEBUFFS = "Afficher les debuffs de la cible du focus"
L_GUI_AURA_PET_DEBUFFS = "Afficher les debuffs du pet"
L_GUI_AURA_TOT_DEBUFFS = "Afficher les debuffs de la cible de la cible"
L_GUI_AURA_BOSS_BUFFS = "Afficher les améliorations sur le cadre du Boss"
L_GUI_AURA_PLAYER_AURA_ONLY = "Afficher seulement ses propres debuffs sur la cible"
L_GUI_AURA_DEBUFF_COLOR_TYPE = "Coleur de debuff par type"
L_GUI_AURA_CAST_BY = "Voir qui a jeté un buff / debuff sur son tooltip"
L_GUI_AURA_CLASSCOLOR_BORDER = "Active la couleur de votre classe pour la bordure de vos buffs"

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
L_GUI_TOP_PANEL = "Panneau supérieur"
L_GUI_TOP_PANEL_SUBTEXT = "Manage built-in top panel with information." -- Need review
L_GUI_TOP_PANEL_ENABLE = "Activer le panneau supérieur"
L_GUI_TOP_PANEL_MOUSE = "Panneau supérieur en 'mouseover'"
L_GUI_TOP_PANEL_WIDTH = "Largeur du panneau"
L_GUI_TOP_PANEL_HEIGHT = "Hauteur du panneau"

-- Stats options
L_GUI_STATS = "Stats"
L_GUI_STATS_SUBTEXT = "Statistics blocks located at the bottom of the screen. Type in the chat '/ls' for info." -- Need review
L_GUI_STATS_CLOCK = "Horloge"
L_GUI_STATS_LATENCY = "Latence"
L_GUI_STATS_MEMORY = "Mémoire"
L_GUI_STATS_FPS = "FPS"
L_GUI_STATS_EXPERIENCE = "Expérience"
L_GUI_STATS_TALENTS_DESC = "Date-text allows you to change the spec and loot on click" -- Need review
L_GUI_STATS_COORDS = "Coordonnées"
L_GUI_STATS_LOCATION = "Lieu actuel"
L_GUI_STATS_BG = "Champ de bataille"
L_GUI_STATS_SUBHEADER_CURRENCY = "Currency (displayed in gold data text)" -- Need review
L_GUI_STATS_CURRENCY_ARCHAEOLOGY = "Afficher les fragments d'Archéologie dans l'onglet des devises"
L_GUI_STATS_CURRENCY_COOKING = "Afficher les marques de Cuisine dans l'onglet des devises"
L_GUI_STATS_CURRENCY_PROFESSIONS = "Afficher les marques de métiers dans l'onglet des devises"
L_GUI_STATS_CURRENCY_RAID = "Afficher les sceaux de raid dans l'onglet des devises"
L_GUI_STATS_CURRENCY_MISCELLANEOUS = "Afficher les jetons/monnaie divers dans l'onglet des devises"

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
L_GUI_ERROR = "Erreurs"
L_GUI_ERROR_SUBTEXT = "Filtering standard text at the top of the screen from Blizzard." -- Need review
L_GUI_ERROR_BLACK = "Cacher les erreurs de la liste noire"
L_GUI_ERROR_WHITE = "Afficher les erreurs de la liste blanche"
L_GUI_ERROR_HIDE_COMBAT = "Cacher toutes les erreurs en combat"

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