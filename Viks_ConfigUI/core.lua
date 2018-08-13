
local realm = GetRealmName()
local name = UnitName("player")
local ALLOWED_GROUPS = {
	["general"] = 1,
	["misc"] = 2,
	["announcements"] = 3,	
	["automation"] = 4,
	["skins"] = 5,
	["combattext"] = 6,	
	["reminder"] = 7,
	["raidcooldown"] = 8,
	["enemycooldown"] = 9,
	["pulsecooldown"] = 11,
	["tooltip"] = 12,
	["chat"] = 13,
	["bag"] = 14,
	["minimap"] = 15,
	["map"] = 16,
	["loot"] = 17,
	["nameplate"] = 18,
	["aura"] = 19,
	["unitframe"] = 20,
	["unitframe_class_bar"] = 21,
	["toppanel"] = 23,	
	["cooldown"] = 24,
	["datatext"] = 25,
	["error"] = 26,
	["media"] = 27,
	["panels"] = 28,
	["stats"] = 29,
	["XPBar"] = 30,
	["Filger"] = 31,
}
local function Local(o)
	local T, Viks, L = unpack(ViksUI)
if o == "UIConfigspacer" then o = "-------------------" end	
if o == "UIConfigcooldown" then o = "Cooldown Timer" end
if o == "UIConfigcooldownenable" then o = "Cooldown Timer on Items" end
	
	-- Media
	if o == "UIConfigmedia" then o = "MEDIA" end
	if o == "UIConfigmediafont" then o = "Main Font In Viks UI" end
	if o == "UIConfigmediablank_font" then o = "Blank Font" end
	if o == "UIConfigmediafontcombat" then o = "Scrolling Combat Text Font" end
	if o == "UIConfigmediapixel_font" then o = "DataText Normal Font" end
	if o == "UIConfigmediapxfontHeader" then o = "DataText Headers Font" end
	if o == "UIConfigmediapixel_font_style" then o = "DataText Normal Flags" end
	if o == "UIConfigmediapxfontHFlag" then o = "DataText Header Flags" end
	if o == "UIConfigmediapixel_font_size" then o = "DataText Normal Font Size" end
	if o == "UIConfigmediapxfontHsize" then o = "DataText Header Font Size" end
	if o == "UIConfigmediafontsize" then o = "Main Font Size" end
	if o == "UIConfigmediaborder_color" then o = "Color on Borders" end
	if o == "UIConfigmediabackdrop_color" then o = "Color on Background" end
	if o == "UIConfigmediaoverlay_color" then o = "Color for action bars overlay" end
	if o == "UIConfigmediatexture" then o = "Texture" end
	if o == "UIConfigmediablank" then o = "Background Texture" end
	if o == "UIConfigmediablank_border" then o = "Border" end
	if o == "UIConfigmediahighlight" then o = "Highlight" end
	if o == "UIConfigmediapxcolor1" then o = "DataText, Color on Names" end
	if o == "UIConfigmediapxcolor2" then o = "DataText, Color on Values" end
	if o == "UIConfigmediaoUFfont" then o = "Font on UnitFrames" end
	if o == "UIConfigmediaoUFfontsize" then o = "Font Size on UnitFrames" end
	if o == "UIConfigmediaoUFfontcolor" then o = "Font Color on UnitFrames" end
	if o == "UIConfigmedianormal_font" then o = "Main font in Viks UI" end
	if o == "UIConfigmediawhisp_sound" then o = "Sound for wispers" end
	if o == "UIConfigmediawarning_sound" then o = "Sound for warning" end
	if o == "UIConfigmediaproc_sound" then o = "Sound for procs" end

	-- general
	if o == "UIConfiggeneral" then o = GENERAL_LABEL end
	if o == "UIConfiggeneralauto_scale" then o = L_GUI_GENERAL_AUTOSCALE end
	if o == "UIConfiggeneraluiscale" then o = L_GUI_GENERAL_UISCALE end
	if o == "UIConfiggeneralwelcome_message" then o = L_GUI_GENERAL_WELCOME_MESSAGE end
	if o == "UIConfiggeneralcustom_lagtolerance" then o = L_GUI_GENERAL_LAG_TOLERANCE end

	--	Announcements options
	if o == "UIConfigannouncements" then o = L_GUI_ANNOUNCEMENTS end
	if o == "UIConfigannouncementsdrinking" then o = L_GUI_ANNOUNCEMENTS_DRINKING end
	if o == "UIConfigannouncementsinterrupts" then o = L_GUI_ANNOUNCEMENTS_INTERRUPTS end
	if o == "UIConfigannouncementsspells" then o = L_GUI_ANNOUNCEMENTS_SPELLS end
	if o == "UIConfigannouncementsspells_from_all" then o = L_GUI_ANNOUNCEMENTS_SPELLS_FROM_ALL end
	if o == "UIConfigannouncementslightwell" then o = L_GUI_ANNOUNCEMENTS_LIGHTWELL end
	if o == "UIConfigannouncementstoys" then o = L_GUI_ANNOUNCEMENTS_TOY_TRAIN end
	if o == "UIConfigannouncementssays_thanks" then o = L_GUI_ANNOUNCEMENTS_SAYS_THANKS end
	if o == "UIConfigannouncementspull_countdown" then o = L_GUI_ANNOUNCEMENTS_PULL_COUNTDOWN end
	if o == "UIConfigannouncementsflask_food" then o = L_GUI_ANNOUNCEMENTS_FLASK_FOOD end
	if o == "UIConfigannouncementsflask_food_auto" then o = L_GUI_ANNOUNCEMENTS_FLASK_FOOD_AUTO end
	if o == "UIConfigannouncementsflask_food_raid" then o = L_GUI_ANNOUNCEMENTS_FLASK_FOOD_RAID end
	if o == "UIConfigannouncementsfeasts" then o = L_GUI_ANNOUNCEMENTS_FEASTS end
	if o == "UIConfigannouncementsportals" then o = L_GUI_ANNOUNCEMENTS_PORTALS end
	if o == "UIConfigannouncementsbad_gear" then o = L_GUI_ANNOUNCEMENTS_BAD_GEAR end
	if o == "UIConfigannouncementssafari_hat" then o = L_GUI_ANNOUNCEMENTS_SAFARI_HAT end

	--	Automation options
	if o == "UIConfigautomation" then o = L_GUI_AUTOMATION end
	if o == "UIConfigautomationrelease" then o = L_GUI_AUTOMATION_RELEASE end
	if o == "UIConfigautomationscreenshot" then o = L_GUI_AUTOMATION_SCREENSHOT end
	if o == "UIConfigautomationsolve_artifact" then o = L_GUI_AUTOMATION_SOLVE_ARTIFACT end
	if o == "UIConfigautomationaccept_invite" then o = L_GUI_AUTOMATION_ACCEPT_INVITE end
	if o == "UIConfigautomationdecline_duel" then o = L_GUI_AUTOMATION_DECLINE_DUEL end
	if o == "UIConfigautomationaccept_quest" then o = L_GUI_AUTOMATION_ACCEPT_QUEST end
	if o == "UIConfigautomationauto_collapse" then o = L_GUI_AUTOMATION_AUTO_COLLAPSE end
	if o == "UIConfigautomationskip_cinematic" then o = L_GUI_AUTOMATION_SKIP_CINEMATIC end
	if o == "UIConfigautomationauto_role" then o = L_GUI_AUTOMATION_AUTO_ROLE end
	if o == "UIConfigautomationcancel_bad_buffs" then o = L_GUI_AUTOMATION_CANCEL_BAD_BUFFS end
	if o == "UIConfigautomationtab_binder" then o = L_GUI_AUTOMATION_TAB_BINDER end
	if o == "UIConfigautomationlogging_combat" then o = L_GUI_AUTOMATION_LOGGING_COMBAT end
	if o == "UIConfigautomationcurrency_cap" then o = L_GUI_AUTOMATION_CURRENCY_CAP end
	if o == "UIConfigautomationbuff_on_scroll" then o = L_GUI_AUTOMATION_BUFF_ON_SCROLL end
	if o == "UIConfigautomationvendor" then o = "Auto sell grey items" end
	if o == "UIConfigautomationAutoRepair" then o = "Automaticly repair" end
	if o == "UIConfigautomationAutoRepairG" then o = "Repair with guild funds" end
	if o == "UIConfigautomationopen_items" then o = L_GUI_AUTOMATION_OPEN_ITEMS end
	if o == "UIConfigautomationvendor_misc" then o = "Sell some defined (craps not grey) items automatically" end

	-- Skins options
	if o == "UIConfigskins" then o = L_GUI_SKINS end
	if o == "UIConfigskinsbartender" then o = "Skinn under Construction for Bartender" end
	if o == "UIConfigskinsExtraActionBarFrame" then o = "Skinn ExtraActionBarFrame with Masque" end
	if o == "UIConfigskinsblizzard_frames" then o = L_GUI_SKINS_BLIZZARD end
	if o == "UIConfigskinsminimap_buttons" then o = L_GUI_SKINS_MINIMAP_BUTTONS end
	if o == "UIConfigskinsclcret" then o = L_GUI_SKINS_CLCR end
	if o == "UIConfigskinsclcprot" then o = L_GUI_SKINS_CLCP end
	if o == "UIConfigskinscombustion_helper" then o = L_GUI_SKINS_COMBUSTION_HELPER end
	if o == "UIConfigskinsbigwigs" then o = L_GUI_SKINS_BW end
	if o == "UIConfigskinsdbm" then o = L_GUI_SKINS_DBM end
	if o == "UIConfigskinsdbm_movable" then o = L_GUI_SKINS_DBM_MOVABLE end
	if o == "UIConfigskinsdxe" then o = L_GUI_SKINS_DXE end
	if o == "UIConfigskinsomen" then o = L_GUI_SKINS_OMEN end
	if o == "UIConfigskinsrecount" then o = L_GUI_SKINS_RECOUNT end
	if o == "UIConfigskinsblood_shield_tracker" then o = L_GUI_SKINS_BLOOD_SHIELD_TRACKER end
	if o == "UIConfigskinsdominos" then o = L_GUI_SKINS_DOMINOS end
	if o == "UIConfigskinsflyout_button" then o = L_GUI_SKINS_FLYOUT_BUTTON end
	if o == "UIConfigskinsnug_running" then o = L_GUI_SKINS_NUG_RUNNING end
	if o == "UIConfigskinsovale" then o = L_GUI_SKINS_OVALE end
	if o == "UIConfigskinsclique" then o = L_GUI_SKINS_CLIQUE end
	if o == "UIConfigskinsace3" then o = L_GUI_SKINS_ACE3 end
	if o == "UIConfigskinspallypower" then o = L_GUI_SKINS_PP end
	if o == "UIConfigskinscapping" then o = L_GUI_SKINS_CAPPING end
	if o == "UIConfigskinscool_line" then o = L_GUI_SKINS_COOL_LINE end
	if o == "UIConfigskinsatlasloot" then o = L_GUI_SKINS_ATLASLOOT end
	if o == "UIConfigskinstiny_dps" then o = L_GUI_SKINS_TINY_DPS end
	if o == "UIConfigskinsface_shooter" then o = L_GUI_SKINS_FACE_SHOOTER end
	if o == "UIConfigskinsmage_nuggets" then o = L_GUI_SKINS_MAGE_NUGGETS end
	if o == "UIConfigskinsnpcscan" then o = L_GUI_SKINS_NPCSCAN end
	if o == "UIConfigskinsvanaskos" then o = L_GUI_SKINS_VANASKOS end
	if o == "UIConfigskinsweak_auras" then o = L_GUI_SKINS_WEAK_AURAS end
	if o == "UIConfigskinsskada" then o = L_GUI_SKINS_SKADA end
	if o == "UIConfigskinsmy_role_play" then o = L_GUI_SKINS_MY_ROLE_PLAY end
	if o == "UIConfigskinsarh" then o = L_GUI_SKINS_ARH end
	if o == "UIConfigskinspostal" then o = L_GUI_SKINS_POSTAL end
	if o == "UIConfigskinsopie" then o = L_GUI_SKINS_OPIE end
	if o == "UIConfigskinsrematch" then o = L_GUI_SKINS_REMATCH end
	if o == "UIConfigskinsls_toasts" then o = L_GUI_SKINS_LS_TOASTS end
	if o == "UIConfigskinsuserControll" then o = "User Control some of the look" end

	-- Combat text options
	if o == "UIConfigcombattext" then o = L_GUI_COMBATTEXT end
	if o == "UIConfigcombattextenable" then o = L_GUI_COMBATTEXT_ENABLE end
	if o == "UIConfigcombattextblizz_head_numbers" then o = L_GUI_COMBATTEXT_BLIZZ_HEAD_NUMBERS end
	if o == "UIConfigcombattextdamage_style" then o = L_GUI_COMBATTEXT_DAMAGE_STYLE end
	if o == "UIConfigcombattextdamage" then o = L_GUI_COMBATTEXT_DAMAGE end
	if o == "UIConfigcombattexthealing" then o = L_GUI_COMBATTEXT_HEALING end
	if o == "UIConfigcombattextshow_hots" then o = L_GUI_COMBATTEXT_HOTS end
	if o == "UIConfigcombattextshow_overhealing" then o = L_GUI_COMBATTEXT_OVERHEALING end
	if o == "UIConfigcombattextpet_damage" then o = L_GUI_COMBATTEXT_PET_DAMAGE end
	if o == "UIConfigcombattextdot_damage" then o = L_GUI_COMBATTEXT_DOT_DAMAGE end
	if o == "UIConfigcombattextdamage_color" then o = L_GUI_COMBATTEXT_DAMAGE_COLOR end
	if o == "UIConfigcombattextcrit_prefix" then o = L_GUI_COMBATTEXT_CRIT_PREFIX end
	if o == "UIConfigcombattextcrit_postfix" then o = L_GUI_COMBATTEXT_CRIT_POSTFIX end
	if o == "UIConfigcombattexticons" then o = L_GUI_COMBATTEXT_ICONS end
	if o == "UIConfigcombattexticon_size" then o = L_GUI_COMBATTEXT_ICON_SIZE end
	if o == "UIConfigcombattexttreshold" then o = L_GUI_COMBATTEXT_TRESHOLD end
	if o == "UIConfigcombattextheal_treshold" then o = L_GUI_COMBATTEXT_HEAL_TRESHOLD end
	if o == "UIConfigcombattextscrollable" then o = L_GUI_COMBATTEXT_SCROLLABLE end
	if o == "UIConfigcombattextmax_lines" then o = L_GUI_COMBATTEXT_MAX_LINES end
	if o == "UIConfigcombattexttime_visible" then o = L_GUI_COMBATTEXT_TIME_VISIBLE end
	if o == "UIConfigcombattextdk_runes" then o = L_GUI_COMBATTEXT_DK_RUNES end
	if o == "UIConfigcombattextkillingblow" then o = L_GUI_COMBATTEXT_KILLINGBLOW end
	if o == "UIConfigcombattextmerge_aoe_spam" then o = L_GUI_COMBATTEXT_MERGE_AOE_SPAM end
	if o == "UIConfigcombattextmerge_melee" then o = L_GUI_COMBATTEXT_MERGE_MELEE end
	if o == "UIConfigcombattextdispel" then o = L_GUI_COMBATTEXT_DISPEL end
	if o == "UIConfigcombattextinterrupt" then o = L_GUI_COMBATTEXT_INTERRUPT end
	if o == "UIConfigcombattextdirection" then o = L_GUI_COMBATTEXT_DIRECTION end
	if o == "UIConfigcombattextshort_numbers" then o = L_GUI_COMBATTEXT_SHORT_NUMBERS end

	-- Buffs reminder options
	if o == "UIConfigreminder" then o = L_GUI_REMINDER end
	if o == "UIConfigremindersolo_buffs_enable" then o = L_GUI_REMINDER_SOLO_ENABLE end
	if o == "UIConfigremindersolo_buffs_sound" then o = L_GUI_REMINDER_SOLO_SOUND end
	if o == "UIConfigremindersolo_buffs_size" then o = L_GUI_REMINDER_SOLO_SIZE end
	if o == "UIConfigreminderraid_buffs_enable" then o = L_GUI_REMINDER_RAID_ENABLE end
	if o == "UIConfigreminderraid_buffs_always" then o = L_GUI_REMINDER_RAID_ALWAYS end
	if o == "UIConfigreminderraid_buffs_size" then o = L_GUI_REMINDER_RAID_SIZE end
	if o == "UIConfigreminderraid_buffs_alpha" then o = L_GUI_REMINDER_RAID_ALPHA end

	-- Raid cooldowns options
	if o == "UIConfigraidcooldown" then o = L_GUI_COOLDOWN_RAID end
	if o == "UIConfigraidcooldownenable" then o = L_GUI_COOLDOWN_RAID_ENABLE end
	if o == "UIConfigraidcooldownheight" then o = L_GUI_COOLDOWN_RAID_HEIGHT end
	if o == "UIConfigraidcooldownwidth" then o = L_GUI_COOLDOWN_RAID_WIDTH end
	if o == "UIConfigraidcooldownupwards" then o = L_GUI_COOLDOWN_RAID_SORT end
	if o == "UIConfigraidcooldownexpiration" then o = L_GUI_COOLDOWN_RAID_EXPIRATION end
	if o == "UIConfigraidcooldownshow_my" then o = L_GUI_COOLDOWN_RAID_SHOW_MY end
	if o == "UIConfigraidcooldownshow_icon" then o = L_GUI_COOLDOWN_RAID_ICONS end
	if o == "UIConfigraidcooldownshow_inraid" then o = L_GUI_COOLDOWN_RAID_IN_RAID end
	if o == "UIConfigraidcooldownshow_inparty" then o = L_GUI_COOLDOWN_RAID_IN_PARTY end
	if o == "UIConfigraidcooldownshow_inarena" then o = L_GUI_COOLDOWN_RAID_IN_ARENA end

	-- Enemy cooldowns options
	if o == "UIConfigenemycooldown" then o = L_GUI_COOLDOWN_ENEMY end
	if o == "UIConfigenemycooldownenable" then o = L_GUI_COOLDOWN_ENEMY_ENABLE end
	if o == "UIConfigenemycooldownsize" then o = L_GUI_COOLDOWN_ENEMY_SIZE end
	if o == "UIConfigenemycooldowndirection" then o = L_GUI_COOLDOWN_ENEMY_DIRECTION end
	if o == "UIConfigenemycooldownshow_always" then o = L_GUI_COOLDOWN_ENEMY_EVERYWHERE end
	if o == "UIConfigenemycooldownshow_inpvp" then o = L_GUI_COOLDOWN_ENEMY_IN_BG end
	if o == "UIConfigenemycooldownshow_inarena" then o = L_GUI_COOLDOWN_ENEMY_IN_ARENA end

	-- Pulse cooldown options
	if o == "UIConfigpulsecooldown" then o = L_GUI_COOLDOWN_PULSE end
	if o == "UIConfigpulsecooldownenable" then o = L_GUI_COOLDOWN_PULSE_ENABLE end
	if o == "UIConfigpulsecooldownsize" then o = L_GUI_COOLDOWN_PULSE_SIZE end
	if o == "UIConfigpulsecooldownsound" then o = L_GUI_COOLDOWN_PULSE_SOUND end
	if o == "UIConfigpulsecooldownanim_scale" then o = L_GUI_COOLDOWN_PULSE_ANIM_SCALE end
	if o == "UIConfigpulsecooldownhold_time" then o = L_GUI_COOLDOWN_PULSE_HOLD_TIME end
	if o == "UIConfigpulsecooldownthreshold" then o = L_GUI_COOLDOWN_PULSE_THRESHOLD end

	-- Threat options
	if o == "UIConfigthreat" then o = L_GUI_THREAT end
	if o == "UIConfigthreatenable" then o = L_GUI_THREAT_ENABLE end
	if o == "UIConfigthreatheight" then o = L_GUI_THREAT_HEIGHT end
	if o == "UIConfigthreatwidth" then o = L_GUI_THREAT_WIDTH end
	if o == "UIConfigthreatbar_rows" then o = L_GUI_THREAT_ROWS end
	if o == "UIConfigthreathide_solo" then o = L_GUI_THREAT_HIDE_SOLO end

	-- Tooltip options
	if o == "UIConfigtooltip" then o = L_GUI_TOOLTIP end
	if o == "UIConfigtooltipenable" then o = L_GUI_TOOLTIP_ENABLE end
	if o == "UIConfigtooltipshift_modifer" then o = L_GUI_TOOLTIP_SHIFT end
	if o == "UIConfigtooltipcursor" then o = L_GUI_TOOLTIP_CURSOR end
	if o == "UIConfigtooltipitem_icon" then o = L_GUI_TOOLTIP_ICON end
	if o == "UIConfigtooltiphealth_value" then o = L_GUI_TOOLTIP_HEALTH end
	if o == "UIConfigtooltiphidebuttons" then o = L_GUI_TOOLTIP_HIDE end
	if o == "UIConfigtooltiphide_combat" then o = L_GUI_TOOLTIP_HIDE_COMBAT end
	if o == "UIConfigtooltiptalents" then o = L_GUI_TOOLTIP_TALENTS end
	if o == "UIConfigtooltipachievements" then o = L_GUI_TOOLTIP_ACHIEVEMENTS end
	if o == "UIConfigtooltiptarget" then o = L_GUI_TOOLTIP_TARGET end
	if o == "UIConfigtooltiptitle" then o = L_GUI_TOOLTIP_TITLE end
	if o == "UIConfigtooltiprealm" then o = L_GUI_TOOLTIP_REALM end
	if o == "UIConfigtooltiprank" then o = L_GUI_TOOLTIP_RANK end
	if o == "UIConfigtooltiparena_experience" then o = L_GUI_TOOLTIP_ARENA_EXPERIENCE end
	if o == "UIConfigtooltipspell_id" then o = L_GUI_TOOLTIP_SPELL_ID end
	if o == "UIConfigtooltipaverage_lvl" then o = STAT_AVERAGE_ITEM_LEVEL end
	if o == "UIConfigtooltipraid_icon" then o = L_GUI_TOOLTIP_RAID_ICON end
	if o == "UIConfigtooltipwho_targetting" then o = L_GUI_TOOLTIP_WHO_TARGETTING end
	if o == "UIConfigtooltipitem_count" then o = L_GUI_TOOLTIP_ITEM_COUNT end
	if o == "UIConfigtooltipunit_role" then o = L_GUI_TOOLTIP_UNIT_ROLE end
	if o == "UIConfigtooltipinstance_lock" then o = L_GUI_TOOLTIP_INSTANCE_LOCK end
	if o == "UIConfigtooltipitem_transmogrify" then o = L_GUI_TOOLTIP_ITEM_TRANSMOGRIFY end
	if o == "UIConfigtooltipbottomleft" then o = "Tooltip shows from BottomLeft of /ui anchor " end
	if o == "UIConfigtooltipbottomright" then o = "Tooltip shows from Bottomright of /ui anchor " end
	if o == "UIConfigtooltiptopright" then o = "Tooltip shows from Top Right of /ui anchor " end
	if o == "UIConfigtooltiptopleft" then o = "Tooltip shows from Top Left of /ui anchor " end

	--	Chat options
	if o == "UIConfigchat" then o = "CHAT" end
	if o == "UIConfigchatenable" then o = L_GUI_CHAT_ENABLE end
	if o == "UIConfigchatbackground" then o = L_GUI_CHAT_BACKGROUND end
	if o == "UIConfigchatbackground_alpha" then o = L_GUI_CHAT_BACKGROUND_ALPHA end
	if o == "UIConfigchatfilter" then o = L_GUI_CHAT_SPAM end
	if o == "UIConfigchatspam" then o = L_GUI_CHAT_GOLD end
	if o == "UIConfigchatwidth" then o = L_GUI_CHAT_WIDTH end
	if o == "UIConfigchatheight" then o = L_GUI_CHAT_HEIGHT end
	if o == "UIConfigchatchat_bar" then o = L_GUI_CHAT_BAR end
	if o == "UIConfigchatchat_bar_mouseover" then o = L_GUI_CHAT_BAR_MOUSEOVER end
	if o == "UIConfigchattime_color" then o = L_GUI_CHAT_TIMESTAMP end
	if o == "UIConfigchatwhisp_sound" then o = L_GUI_CHAT_WHISP end
	if o == "UIConfigchatbubbles" then o = L_GUI_CHAT_SKIN_BUBBLE end
	if o == "UIConfigchattransp_bubbles" then o = L_GUI_CHAT_SKIN_BUBBLE_TRANS end
	if o == "UIConfigchattransp_bubbles_a" then o = L_GUI_CHAT_SKIN_BUBBLE_TRANS_A end
	if o == "UIConfigchatcombatlog" then o = L_GUI_CHAT_CL_TAB end
	if o == "UIConfigchattabs_mouseover" then o = L_GUI_CHAT_TABS_MOUSEOVER end
	if o == "UIConfigchatsticky" then o = L_GUI_CHAT_STICKY end
	if o == "UIConfigchatdamage_meter_spam" then o = L_GUI_CHAT_DAMAGE_METER_SPAM end
	if o == "UIConfigchatsmileys" then o = "Use custom Smileys/icon in chat"  end

	--	Bag options
	if o == "UIConfigbag" then o = L_GUI_BAGS end
	if o == "UIConfigbagenable" then o = L_GUI_BAGS_ENABLE end
	if o == "UIConfigbagBagBars" then o = "Bag Bars" end
	if o == "UIConfigbagSortTop" then o = "Sort from top down" end
	if o == "UIConfigbagbutton_size" then o = L_GUI_BAGS_BUTTON_SIZE end
	if o == "UIConfigbagbutton_space" then o = L_GUI_BAGS_BUTTON_SPACE end
	if o == "UIConfigbagbank_columns" then o = L_GUI_BAGS_BANK end
	if o == "UIConfigbagbag_columns" then o = L_GUI_BAGS_BAG end
	if o == "UIConfigbagilvl" then o = L_GUI_BAGS_ILVL end
	if o == "UIConfigbagbag_buttons" then o = L_GUI_BAGS_BUTTONS end
	-- Minimap
	if o == "UIConfigminimap" then o = MINIMAP_LABEL end
	if o == "UIConfigminimapenable" then o = L_GUI_MINIMAP_ENABLE end
	if o == "UIConfigminimapminimb1" then o = "Enable Buttonframe 1" end
	if o == "UIConfigminimapminimb2" then o = "Enable Buttonframe 2" end
	if o == "UIConfigminimapPicomenu" then o = "Enable Picomenu" end
	if o == "UIConfigminimapcompass" then o = "Enable Compass" end
	if o == "UIConfigminimapsize" then o = L_GUI_MINIMAP_SIZE end
	if o == "UIConfigminimaptoggle_menu" then o = L_GUI_MINIMAP_TOGGLE_MENU end

	if o == "UIConfigmap" then o = ViksL.option_Map end
	if o == "UIConfigmapenable" then o = ViksL.option_mapenable end	
	-- Map options
	if o == "UIConfigmap" then o = WORLD_MAP end
	if o == "UIConfigmapbg_map_stylization" then o = L_GUI_MAP_BG_STYLIZATION end
	if o == "UIConfigmapmap_boss_count" then o = L_GUI_MAP_BOSS_COUNT end
	if o == "UIConfigmapexplore_map" then o = L_GUI_MAP_EXPLORE end
	if o == "UIConfigmapfog_of_war" then o = L_GUI_MAP_FOG_OF_WAR end

	-- Loot options
	if o == "UIConfigloot" then o = LOOT end
	if o == "UIConfiglootlootframe" then o = L_GUI_LOOT_ENABLE end
	if o == "UIConfiglootrolllootframe" then o = L_GUI_LOOT_ROLL_ENABLE end
	if o == "UIConfiglooticon_size" then o = L_GUI_LOOT_ICON_SIZE end
	if o == "UIConfiglootwidth" then o = L_GUI_LOOT_WIDTH end
	if o == "UIConfiglootauto_greed" then o = L_GUI_LOOT_AUTOGREED end
	if o == "UIConfiglootauto_confirm_de" then o = L_GUI_LOOT_AUTODE end

	-- Nameplate options
	if o == "UIConfignameplate" then o = UNIT_NAMEPLATES end
	if o == "UIConfignameplateenable" then o = L_GUI_NAMEPLATE_ENABLE end
	if o == "UIConfignameplateheight" then o = L_GUI_NAMEPLATE_HEIGHT end
	if o == "UIConfignameplatewidth" then o = L_GUI_NAMEPLATE_WIDTH end
	if o == "UIConfignameplatedistance" then o = L_GUI_NAMEPLATE_DISTANCE end
	if o == "UIConfignameplatead_height" then o = L_GUI_NAMEPLATE_AD_HEIGHT end
	if o == "UIConfignameplatead_width" then o = L_GUI_NAMEPLATE_AD_WIDTH end
	if o == "UIConfignameplatecombat" then o = L_GUI_NAMEPLATE_COMBAT end
	if o == "UIConfignameplatehealth_value" then o = L_GUI_NAMEPLATE_HEALTH end
	if o == "UIConfignameplateshow_castbar" then o = L_GUI_NAMEPLATE_CASTBAR end
	if o == "UIConfignameplateshow_castbar_name" then o = L_GUI_NAMEPLATE_CASTBAR_NAME end
	if o == "UIConfignameplateenhance_threat" then o = L_GUI_NAMEPLATE_THREAT end
	if o == "UIConfignameplateclass_icons" then o = L_GUI_NAMEPLATE_CLASS_ICON end
	if o == "UIConfignameplatename_abbrev" then o = L_GUI_NAMEPLATE_NAME_ABBREV end
	if o == "UIConfignameplateclamp" then o = L_GUI_NAMEPLATE_CLAMP end
	if o == "UIConfignameplategood_color" then o = L_GUI_NAMEPLATE_GOOD_COLOR end
	if o == "UIConfignameplatenear_color" then o = L_GUI_NAMEPLATE_NEAR_COLOR end
	if o == "UIConfignameplatebad_color" then o = L_GUI_NAMEPLATE_BAD_COLOR end
	if o == "UIConfignameplateofftank_color" then o = L_GUI_NAMEPLATE_OFFTANK_COLOR end
	if o == "UIConfignameplatetrack_auras" then o = L_GUI_NAMEPLATE_SHOW_DEBUFFS end
	if o == "UIConfignameplatetrack_buffs" then o = L_GUI_NAMEPLATE_SHOW_BUFFS end
	if o == "UIConfignameplateauras_size" then o = L_GUI_NAMEPLATE_DEBUFFS_SIZE end
	if o == "UIConfignameplatehealer_icon" then o = L_GUI_NAMEPLATE_HEALER_ICON end
	if o == "UIConfignameplatetotem_icons" then o = L_GUI_NAMEPLATE_TOTEM_ICONS end	

	--	Auras/Buffs/Debuffs options
	if o == "UIConfigaura" then o = BUFFOPTIONS_LABEL end
	if o == "UIConfigauraplayer_buff_size" then o = L_GUI_AURA_PLAYER_BUFF_SIZE end
	if o == "UIConfigauraplayer_debuff_size" then o = "Player DeBuff Size" end
	if o == "UIConfigaurashow_spiral" then o = L_GUI_AURA_SHOW_SPIRAL end
	if o == "UIConfigaurashow_timer" then o = L_GUI_AURA_SHOW_TIMER end
	if o == "UIConfigauraplayer_auras" then o = L_GUI_AURA_PLAYER_AURAS end
	if o == "UIConfigauratarget_auras" then o = L_GUI_AURA_TARGET_AURAS end
	if o == "UIConfigaurafocus_debuffs" then o = L_GUI_AURA_FOCUS_DEBUFFS end
	if o == "UIConfigaurafot_debuffs" then o = L_GUI_AURA_FOT_DEBUFFS end
	if o == "UIConfigaurapet_debuffs" then o = L_GUI_AURA_PET_DEBUFFS end
	if o == "UIConfigauratot_debuffs" then o = L_GUI_AURA_TOT_DEBUFFS end
	if o == "UIConfigauraboss_buffs" then o = L_GUI_AURA_BOSS_BUFFS end
	if o == "UIConfigauraplayer_aura_only" then o = L_GUI_AURA_PLAYER_AURA_ONLY end
	if o == "UIConfigauradebuff_color_type" then o = L_GUI_AURA_DEBUFF_COLOR_TYPE end
	if o == "UIConfigauraclasscolor_border" then o = "Enable classcolor border for player buffs" end
	if o == "UIConfigauracast_by" then o = L_GUI_AURA_CAST_BY end	

	-- Unitframes
	if o == "UIConfigunitframe" then o = "UNIT FRAMES" end
	if o == "UIConfigunitframeenable" then o = ViksL.option_unitframes_enable end
	if o == "UIConfigunitframeShowIncHeals" then o = "Show Incomming heals" end
	if o == "UIConfigunitframeHealthBarBackGround" then o = "Background Color for HealthBar" end
	if o == "UIConfigunitframecastbar_ticks" then o = L_GUI_UF_CASTBAR_TICKS end
	if o == "UIConfigunitframeHealFrames" then o = ViksL.option_unitframes_HealFrames end
	if o == "UIConfigunitframeshowIndicators" then o = ViksL.option_unitframes_showIndicators end
	if o == "UIConfigunitframeshowAuraWatch" then o = ViksL.option_unitframes_showAuraWatch end
	if o == "UIConfigunitframeShowParty" then o = ViksL.option_unitframes_ShowParty end
	if o == "UIConfigunitframeShowRaid" then o = ViksL.option_unitframes_ShowRaid end
	if o == "UIConfigunitframeRaidShowSolo" then o = ViksL.option_unitframes_RaidShowSolo end
	if o == "UIConfigunitframeRaidShowAllGroups" then o = ViksL.option_unitframes_RaidShowAllGroups end
	if o == "UIConfigunitframeenableDebuffHighlight" then o = ViksL.option_unitframes_enableDebuffHighlight end
	if o == "UIConfigunitframeshowRaidDebuffs" then o = ViksL.option_unitframes_showRaidDebuffs end
	if o == "UIConfigunitframeshowtot" then o = ViksL.option_unitframes_showtot end
	if o == "UIConfigunitframeshowpet" then o = ViksL.option_unitframes_showpet end
	if o == "UIConfigunitframeshowfocus" then o = ViksL.option_unitframes_showfocus end
	if o == "UIConfigunitframeshowfocustarget" then o = ViksL.option_unitframes_showfocustarget end
	if o == "UIConfigunitframeshowBossFrames" then o = ViksL.option_unitframes_showBossFrames end
	if o == "UIConfigunitframeTotemBars" then o = ViksL.option_unitframes_TotemBars end
	if o == "UIConfigunitframeMTFrames" then o = ViksL.option_unitframes_MTFrames end
	if o == "UIConfigunitframeArenaFrames" then o = ViksL.option_unitframes_ArenaFrames end
	if o == "UIConfigunitframeReputationbar" then o = ViksL.option_unitframes_Reputationbar end
	if o == "UIConfigunitframeExperiencebar" then o = ViksL.option_unitframes_Experiencebar end
	if o == "UIConfigunitframeshowPlayerAuras" then o = ViksL.option_unitframes_showPlayerAuras end
	if o == "UIConfigunitframeThreatBar" then o = ViksL.option_unitframes_ThreatBar end
	if o == "UIConfigunitframeshowPortrait" then o = ViksL.option_unitframes_showPortrait end
	if o == "UIConfigunitframeshowRunebar" then o = ViksL.option_unitframes_showRunebar end
	if o == "UIConfigunitframeshowHolybar" then o = ViksL.option_unitframes_showHolybar end
	if o == "UIConfigunitframeshowEclipsebar" then o = ViksL.option_unitframes_showEclipsebar end
	if o == "UIConfigunitframeshowShardbar" then o = ViksL.option_unitframes_showShardbar end
	if o == "UIConfigunitframeRCheckIcon" then o = ViksL.option_unitframes_RCheckIcon end
	if o == "UIConfigunitframeCastbars" then o = ViksL.option_unitframes_Castbars end
	if o == "UIConfigunitframeshowLFDIcons" then o = ViksL.option_unitframes_showLFDIcons end
	if o == "UIConfigunitframeshowPartyFrames" then o = ViksL.option_unitframes_showPartyFrames end
	if o == "UIConfigunitframeHealthcolorClass" then o = ViksL.option_unitframes_HealthcolorClass end
	if o == "UIConfigunitframePowercolor" then o = ViksL.option_unitframes_Powercolor end
	if o == "UIConfigunitframebigcastbar" then o = ViksL.option_unitframes_bigcastbar end
	if o == "UIConfigunitframeIndicatorIcons2" then o = "Show Indicator Type 2" end
	if o == "UIConfigunitframeVuhDo" then o = "Hide Raidframes if VuhDo Addon is loaded" end
	if o == "UIConfigunitframeshowHarmony" then o = "Show Monk Harmony bar" end
	if o == "UIConfigunitframeshowPortraitHPbar" then o = "Show portraits on Healthbar" end
	if o == "UIConfigunitframebuffsOnlyShowPlayer" then o = "Only show your buffs" end
	if o == "UIConfigunitframeshowShadowOrbsBar" then o = "Show Shadow Priest Shadow Orbs bar" end
	if o == "UIConfigunitframecustomLFDIcons" then o = "Use Custom Roll Icons; custom Roll Text must be off" end
	if o == "UIConfigunitframeinsideAlpha" then o = "Alpha when Unitframe is in range" end
	if o == "UIConfigunitframeoutsideAlpha" then o = "Alpha when Unitframe is out of range" end
	if o == "UIConfigunitframeFindoutline" then o = "Outline on Indicators" end
	if o == "UIConfigunitframefontsizeEdge" then o = "Font Size on misk tags" end
	if o == "UIConfigunitframeUFNamefont" then o = "Font to use on Names" end
	if o == "UIConfigunitframeaurasize" then o = "Size on Auras" end
	if o == "UIConfigunitframesymbolsize" then o = "Size on Symbols on Indicator type 2" end
	if o == "UIConfigunitframeindicatorsize" then o = "Size on Squares on Indicator type 2" end
	if o == "UIConfigunitframecustomLFDText" then o = "Use Text instead of Icon; Tank/Dps/Heal. Custom Roll Icons must be off" end
	if o == "UIConfigunitframedebuffsOnlyShowPlayer" then o = "Only show your debuffs on target" end
	if o == "UIConfigunitframeUFfont" then o = "Font on unitframes tags (Hp/power++)" end
	if o == "UIConfigunitframeuf_color" then o = "Color for UF if own_color = true" end
	if o == "UIConfigunitframeplugins_gcd" then o = L_GUI_UF_PLUGINS_GCD end
	if o == "UIConfigunitframeplugins_swing" then o = L_GUI_UF_PLUGINS_SWING end
	if o == "UIConfigunitframeplugins_reputation_bar" then o = L_GUI_UF_PLUGINS_REPUTATION_BAR end
	if o == "UIConfigunitframeplugins_experience_bar" then o = L_GUI_UF_PLUGINS_EXPERIENCE_BAR end
	if o == "UIConfigunitframeplugins_artifact_bar" then o = L_GUI_UF_PLUGINS_ARTIFACT_BAR end
	if o == "UIConfigunitframeplugins_smooth_bar" then o = L_GUI_UF_PLUGINS_SMOOTH_BAR end
	if o == "UIConfigunitframeplugins_enemy_spec" then o = L_GUI_UF_PLUGINS_ENEMY_SPEC end
	if o == "UIConfigunitframeplugins_combat_feedback" then o = L_GUI_UF_PLUGINS_COMBAT_FEEDBACK end
	if o == "UIConfigunitframeplugins_fader" then o = L_GUI_UF_PLUGINS_FADER end
	if o == "UIConfigunitframeplugins_diminishing" then o = L_GUI_UF_PLUGINS_DIMINISHING end
	if o == "UIConfigunitframeplugins_debuffhighlight_icon" then o = L_GUI_UF_PLUGINS_DEBUFFHIGHLIGHT_ICON end
	if o == "UIConfigunitframeplugins_aura_watch" then o = L_GUI_UF_PLUGINS_AURA_WATCH end
	if o == "UIConfigunitframeplugins_aura_watch_timer" then o = L_GUI_UF_PLUGINS_AURA_WATCH_TIMER end
	if o == "UIConfigunitframeplugins_pvp_debuffs" then o = L_GUI_UF_PLUGINS_PVP_DEBUFFS end
	if o == "UIConfigunitframeplugins_healcomm" then o = L_GUI_UF_PLUGINS_HEALCOMM end
	if o == "UIConfigunitframeplugins_auto_resurrection" then o = L_GUI_UF_PLUGINS_AUTO_RESURRECTION end

	-- Unit Frames Class bar options
	if o == "UIConfigunitframe_class_bar" then o = L_GUI_UF_PLUGINS_CLASS_BAR end
	if o == "UIConfigunitframe_class_barcombo" then o = L_GUI_UF_PLUGINS_COMBO_BAR end
	if o == "UIConfigunitframe_class_barcomboalways" then o = L_GUI_UF_PLUGINS_COMBO_BAR_ALWAYS end
	if o == "UIConfigunitframe_class_barshadow" then o = L_GUI_UF_PLUGINS_SHADOW_BAR end
	if o == "UIConfigunitframe_class_barchi" then o = L_GUI_UF_PLUGINS_CHI_BAR end
	if o == "UIConfigunitframe_class_barvengeance" then o = L_GUI_UF_PLUGINS_VENGEANCE_BAR end
	if o == "UIConfigunitframe_class_bareclipse" then o = L_GUI_UF_PLUGINS_ECLIPSE_BAR end
	if o == "UIConfigunitframe_class_barholy" then o = L_GUI_UF_PLUGINS_HOLY_BAR end
	if o == "UIConfigunitframe_class_barshard" then o = L_GUI_UF_PLUGINS_SHARD_BAR end
	if o == "UIConfigunitframe_class_barrune" then o = L_GUI_UF_PLUGINS_RUNE_BAR end
	if o == "UIConfigunitframe_class_bartotem" then o = L_GUI_UF_PLUGINS_TOTEM_BAR end
	if o == "UIConfigunitframe_class_barrange" then o = L_GUI_UF_PLUGINS_RANGE_BAR end
	if o == "UIConfigunitframe_class_barcombo_old" then o = L_GUI_UF_PLUGINS_COMBO_BAR_OLD end
	if o == "UIConfigunitframe_class_bararcane" then o = L_GUI_UF_PLUGINS_ARCANE_BAR end
	if o == "UIConfigunitframe_class_barstagger" then o = L_GUI_UF_PLUGINS_STAGGER_BAR end
		
	--raidframes
	if o == "UIConfigraidframes" then o = "RAID FRAMES" end
	if o == "UIConfigraidframesenable" then o = ViksL.option_raidframes_enable end
	if o == "UIConfigraidframesscale" then o = ViksL.option_raidframes_scale end
	if o == "UIConfigraidframeswidth" then o = ViksL.option_raidframes_width end
	if o == "UIConfigraidframesheight" then o = ViksL.option_raidframes_height end
	if o == "UIConfigraidframesheight25" then o = "Hight on Raidframes in 25man" end
	if o == "UIConfigraidframeswidth25" then o = "Width on Raidframes in 25man" end
	if o == "UIConfigraidframesheight40" then o = "Hight on Raidframes in 40man" end
	if o == "UIConfigraidframeswidth40" then o = "Width on Raidframes in 40man" end
	if o == "UIConfigraidframesautorez" then o = "Auto cast Rez" end
	if o == "UIConfigraidframesfontsize" then o = ViksL.option_raidframes_fontsize end
	if o == "UIConfigraidframesfontsizeEdge" then o = ViksL.option_raidframes_fontsizeEdge end
	if o == "UIConfigraidframesoutline" then o = ViksL.option_raidframes_outline end
	if o == "UIConfigraidframessolo" then o = ViksL.option_raidframes_solo end
	if o == "UIConfigraidframesplayer" then o = ViksL.option_raidframes_player end
	if o == "UIConfigraidframesparty" then o = ViksL.option_raidframes_party end
	if o == "UIConfigraidframesnumCol" then o = ViksL.option_raidframes_numCol end
	if o == "UIConfigraidframesnumUnits" then o = ViksL.option_raidframes_numUnits end
	if o == "UIConfigraidframesspacing" then o = ViksL.option_raidframes_spacing end
	if o == "UIConfigraidframesorientation" then o = ViksL.option_raidframes_orientation end
	if o == "UIConfigraidframesporientation" then o = ViksL.option_raidframes_porientation end
	if o == "UIConfigraidframeshorizontal" then o = ViksL.option_raidframes_horizontal end
	if o == "UIConfigraidframesgrowth" then o = ViksL.option_raidframes_growth end
	if o == "UIConfigraidframesreversecolors" then o = ViksL.option_raidframes_reversecolors end
	if o == "UIConfigraidframesdefinecolors" then o = ViksL.option_raidframes_definecolors end
	if o == "UIConfigraidframespowerbar" then o = ViksL.option_raidframes_powerbar end
	if o == "UIConfigraidframespowerbarsize" then o = ViksL.option_raidframes_powerbarsize end
	if o == "UIConfigraidframesoutsideRange" then o = ViksL.option_raidframes_outsideRange end
	if o == "UIConfigraidframeshealtext" then o = ViksL.option_raidframes_healtext end
	if o == "UIConfigraidframeshealbar" then o = ViksL.option_raidframes_healbar end
	if o == "UIConfigraidframeshealoverflow" then o = ViksL.option_raidframes_healoverflow end
	if o == "UIConfigraidframeshealothersonly" then o = ViksL.option_raidframes_healothersonly end
	if o == "UIConfigraidframeshealalpha" then o = ViksL.option_raidframes_healalpha end
	if o == "UIConfigraidframesroleicon" then o = ViksL.option_raidframes_roleicon end
	if o == "UIConfigraidframesindicatorsize" then o = ViksL.option_raidframes_indicatorsize end
	if o == "UIConfigraidframessymbolsize" then o = ViksL.option_raidframes_symbolsize end
	if o == "UIConfigraidframesleadersize" then o = ViksL.option_raidframes_leadersize end
	if o == "UIConfigraidframesaurasize" then o = ViksL.option_raidframes_aurasize end
	if o == "UIConfigraidframesmulti" then o = ViksL.option_raidframes_multi end
	if o == "UIConfigraidframesmulti" then o = ViksL.option_raidframes_multi end
	if o == "UIConfigraidframesdeficit" then o = ViksL.option_raidframes_deficit end
	if o == "UIConfigraidframesperc" then o = ViksL.option_raidframes_perc end
	if o == "UIConfigraidframesactual" then o = ViksL.option_raidframes_actual end
	if o == "UIConfigraidframesmyhealcolor" then o = ViksL.option_raidframes_myhealcolor end
	if o == "UIConfigraidframesotherhealcolor" then o = ViksL.option_raidframes_otherhealcolor end
	if o == "UIConfigraidframeshpcolor" then o = ViksL.option_raidframes_hpcolor end
	if o == "UIConfigraidframeshpbgcolor" then o = ViksL.option_raidframes_hpbgcolor end
	if o == "UIConfigraidframespowercolor" then o = ViksL.option_raidframes_powercolor end
	if o == "UIConfigraidframespowerbgcolor" then o = ViksL.option_raidframes_powerbgcolor end
	if o == "UIConfigraidframespowerdefinecolors" then o = ViksL.option_raidframes_powerdefinecolors end
	if o == "UIConfigraidframescolorSmooth" then o = ViksL.option_raidframes_colorSmooth end
	if o == "UIConfigraidframesgradient" then o = ViksL.option_raidframes_gradient end
	if o == "UIConfigraidframestborder" then o = ViksL.option_raidframes_tborder end
	if o == "UIConfigraidframesfborder" then o = ViksL.option_raidframes_fborder end
	if o == "UIConfigraidframesafk" then o = ViksL.option_raidframes_afk end
	if o == "UIConfigraidframeshighlight" then o = ViksL.option_raidframes_highlight end
	if o == "UIConfigraidframesdispel" then o = ViksL.option_raidframes_dispel end
	if o == "UIConfigraidframespowerclass" then o = ViksL.option_raidframes_powerclass end
	if o == "UIConfigraidframestooltip" then o = ViksL.option_raidframes_tooltip end
	if o == "UIConfigraidframessortName" then o = ViksL.option_raidframes_sortName end
	if o == "UIConfigraidframessortClass" then o = ViksL.option_raidframes_sortClass end
	if o == "UIConfigraidframesclassOrder" then o = ViksL.option_raidframes_classOrder end
	if o == "UIConfigraidframeshidemenu" then o = ViksL.option_raidframes_hidemenu end
	if o == "UIConfigraidframesshowIndicators" then o = "Show Buff Indicators" end	
	-- TopPanel options (mouse hidden)
	if o == "UIConfigtoppanel" then o = L_GUI_TOP_PANEL end
	if o == "UIConfigtoppanelenable" then o = L_GUI_TOP_PANEL_ENABLE end
	if o == "UIConfigtoppanelmouseover" then o = L_GUI_TOP_PANEL_MOUSE end
	if o == "UIConfigtoppanelheight" then o = L_GUI_TOP_PANEL_HEIGHT end
	if o == "UIConfigtoppanelwidth" then o = L_GUI_TOP_PANEL_WIDTH end
	-- Stats options
	if o == "UIConfigstats" then o = L_GUI_STATS end
	if o == "UIConfigstatsbattleground" then o = L_GUI_STATS_BG end
	if o == "UIConfigstatsclock" then o = L_GUI_STATS_CLOCK end
	if o == "UIConfigstatslatency" then o = L_GUI_STATS_LATENCY end
	if o == "UIConfigstatsmemory" then o = L_GUI_STATS_MEMORY end
	if o == "UIConfigstatsfps" then o = L_GUI_STATS_FPS end
	if o == "UIConfigstatsfriend" then o = FRIENDS end
	if o == "UIConfigstatsguild" then o = GUILD end
	if o == "UIConfigstatsdurability" then o = DURABILITY end
	if o == "UIConfigstatsexperience" then o = L_GUI_STATS_EXPERIENCE end
	if o == "UIConfigstatscoords" then o = L_GUI_STATS_COORDS end
	if o == "UIConfigstatslocation" then o = L_GUI_STATS_LOCATION end
	if o == "UIConfigstatscurrency" then o = "Currency" end
	if o == "UIConfigstatsCurrArchaeology" then o = L_GUI_STATS_CURRENCY_ARCHAEOLOGY end
	if o == "UIConfigstatsCurrCooking" then o = L_GUI_STATS_CURRENCY_COOKING end
	if o == "UIConfigstatsCurrProfessions" then o = L_GUI_STATS_CURRENCY_PROFESSIONS end
	if o == "UIConfigstatsCurrRaid" then o = L_GUI_STATS_CURRENCY_RAID end
	if o == "UIConfigstatsCurrPvP" then o = L_GUI_STATS_CURRENCY_PVP end
	if o == "UIConfigstatsCurrMiscellaneous" then o = L_GUI_STATS_CURRENCY_MISCELLANEOUS end

	-- Error options
	if o == "UIConfigerror" then o = L_GUI_ERROR end
	if o == "UIConfigerrorblack" then o = L_GUI_ERROR_BLACK end
	if o == "UIConfigerrorwhite" then o = L_GUI_ERROR_WHITE end
	if o == "UIConfigerrorcombat" then o = L_GUI_ERROR_HIDE_COMBAT end

	--datatext
	if o == "UIConfigdatatext" then o = "DATA TEXT" end
	if o == "UIConfigdatatextArena" then o = "Arena position (0 for disabled)" end
	if o == "UIConfigdatatextArmor" then o = "Armor position (0 for disabled)" end
	if o == "UIConfigdatatextRunSpeed" then o = "Run Speed position (0 for disabled)" end
	if o == "UIConfigdatatextAvd" then o = "Avoidance position (0 for disabled)" end
	if o == "UIConfigdatatextBags" then o = "Bags position (0 for disabled)" end
	if o == "UIConfigdatatextBattleground" then o = "Battleground Stats" end
	if o == "UIConfigdatatextCrit" then o = "Crit position (0 for disabled)" end
	if o == "UIConfigdatatextDurability" then o = "Durability position (0 for disabled)" end
	if o == "UIConfigdatatextFriends" then o = "Friends position (0 for disabled)" end
	if o == "UIConfigdatatextGold" then o = "Gold position (0 for disabled)" end
	if o == "UIConfigdatatextGuild" then o = "Guild position (0 for disabled)" end
	if o == "UIConfigdatatextHaste" then o = "Haste position (0 for disabled)" end
	if o == "UIConfigdatatextVersatility" then o = "Versatility position (0 for disabled)" end
	if o == "UIConfigdatatextMastery" then o = "Mastery position (0 for disabled)" end
	if o == "UIConfigdatatextPower" then o = "Power stat position (0 for disabled)" end
	if o == "UIConfigdatatextRegen" then o = "Regen position (0 for disabled)" end
	if o == "UIConfigdatatextSystem" then o = "Latency and FPS position (0 for disabled)" end
	if o == "UIConfigdatatextlocation" then o = "Location and cords (0 for disabled)" end
	if o == "UIConfigdatatextTalents" then o = "Talent" end
	if o == "UIConfigdatatexttogglemenu" then o = "ToggleMenu" end
	if o == "UIConfigdatatextWowtime" then o = "Show Clock" end
	if o == "UIConfigdatatextTime24" then o = "Enable 24h time" end
	if o == "UIConfigdatatextLocaltime" then o = "Use Local Time instead of Server Time" end
	if o == "UIConfigdatatextclasscolor" then o = "Class color data text" end
	if o == "UIConfigdatatextcolor" then o = "If Class color data text false then choose color: " end
	if o == "UIConfigdatatextQuests" then o = "Objectiveframe Datatext Button" end
	if o == "UIConfigdatatextVolume" then o = "Volume Bar - Scroll to change volume, click to change sub cat" end
	if o == "UIConfigdatatextCurrArchaeology" then o = L_GUI_STATS_CURRENCY_ARCHAEOLOGY end
	if o == "UIConfigdatatextCurrCooking" then o = L_GUI_STATS_CURRENCY_COOKING end
	if o == "UIConfigdatatextCurrProfessions" then o = L_GUI_STATS_CURRENCY_PROFESSIONS end
	if o == "UIConfigdatatextCurrRaid" then o = L_GUI_STATS_CURRENCY_RAID end
	if o == "UIConfigdatatextCurrPvP" then o = L_GUI_STATS_CURRENCY_PVP end
	if o == "UIConfigdatatextCurrMiscellaneous" then o = L_GUI_STATS_CURRENCY_MISCELLANEOUS end	
	if o == "UIConfigdatatextFont" then o = "Font to use on DataText" end

	--Actionbars	
	if o == "UIConfigactionbar" then o = ViksL.option_actionbar end
	if o == "UIConfigactionbarenable" then o = ViksL.option_actionbar_enable end
	if o == "UIConfigactionbarhotkey" then o = ViksL.option_actionbar_hotkey end
	if o == "UIConfigactionbarhideshapeshift" then o = ViksL.option_actionbar_hideshapeshift end
	if o == "UIConfigactionbarbuttonsize" then o = ViksL.option_actionbar_buttonsize end
	if o == "UIConfigactionbarbuttonspacing" then o = ViksL.option_actionbar_buttonspacing end
	if o == "UIConfigactionbarpetbuttonsize" then o = ViksL.option_actionbar_petbuttonsize end
	if o == "UIConfigactionbarpetbuttonspacing" then o = ViksL.option_actionbar_petbuttonspacing end
	if o == "UIConfigactionbarshowgrid" then o = ViksL.option_actionbar_showgrid end	
	if o == "UIConfigactionbarmainbarWidth" then o = ViksL.option_actionbar_mainbarWidth end
	if o == "UIConfigactionbarownshdbar" then o = ViksL.option_actionbar_ownshdbar end
	if o == "UIConfigactionbarlowversion" then o = ViksL.option_actionbar_lowversion end
	if o == "UIConfigactionbarsidebarWidth" then o = ViksL.option_actionbar_sidebarWidth end
	--XPBar
	if o == "UIConfigXPBar" then o = "XP BAR" end
	if o == "UIConfigXPBarenable" then o = "Enable XP BAR" end

	--	Miscellaneous options
	if o == "UIConfigmisc" then o = "Miscellaneous" end
	if o == "UIConfigmiscshift_marking" then o = L_GUI_MISC_MARKING end
	if o == "UIConfigmiscinvite_keyword" then o = L_GUI_MISC_INVKEYWORD end
	if o == "UIConfigmiscafk_spin_camera" then o = L_GUI_MISC_SPIN_CAMERA end
	if o == "UIConfigmiscafk_spin_camera_anim" then o = L_GUI_MISC_SPIN_CAMERA_ANIM end
	if o == "UIConfigmiscvehicle_mouseover" then o = L_GUI_MISC_VEHICLE_MOUSEOVER end
	if o == "UIConfigmiscquest_auto_button" then o = L_GUI_MISC_QUEST_AUTOBUTTON end
	if o == "UIConfigmiscraid_tools" then o = L_GUI_MISC_RAID_TOOLS end
	if o == "UIConfigmiscprofession_tabs" then o = L_GUI_MISC_PROFESSION_TABS end
	if o == "UIConfigmiscprofession_database" then o = L_GUI_MISC_PROFESSION_DATABASE end
	if o == "UIConfigmischide_bg_spam" then o = L_GUI_MISC_HIDE_BG_SPAM end
	if o == "UIConfigmiscitem_level" then o = L_GUI_MISC_ITEM_LEVEL end
	if o == "UIConfigmiscgem_counter" then o = L_GUI_MISC_GEM_COUNTER end
	if o == "UIConfigmiscalready_known" then o = L_GUI_MISC_ALREADY_KNOWN end
	if o == "UIConfigmiscdisenchanting" then o = L_GUI_MISC_DISENCHANTING end
	if o == "UIConfigmiscsum_buyouts" then o = L_GUI_MISC_SUM_BUYOUTS end
	if o == "UIConfigmiscclick_cast" then o = L_GUI_MISC_CLICK_CAST end
	if o == "UIConfigmiscclick_cast_filter" then o = L_GUI_MISC_CLICK_CAST_FILTER end
	if o == "UIConfigmiscmove_blizzard" then o = L_GUI_MISC_MOVE_BLIZZARD end
	if o == "UIConfigmisccolor_picker" then o = L_GUI_MISC_COLOR_PICKER end
	if o == "UIConfigmiscenchantment_scroll" then o = L_GUI_MISC_ENCHANTMENT_SCROLL end
	if o == "UIConfigmiscarchaeology" then o = L_GUI_MISC_ARCHAEOLOGY end
	if o == "UIConfigmiscchars_currency" then o = L_GUI_MISC_CHARS_CURRENCY end
	if o == "UIConfigmiscmarkbar" then o = ViksL.option_markbar end
	if o == "UIConfigmiscfilger" then o = ViksL.option_filger end
	if o == "UIConfigmiscfilgerCD" then o = "Show Cooldown Bar with Filger" end
	if o == "UIConfigmiscclasstimer" then o = ViksL.option_classtimer end
	if o == "UIConfigmiscCooldownFlash" then o = ViksL.option_CooldownFlash end
	if o == "UIConfigmiscraidcooldowns" then o = ViksL.option_raidcooldowns end
	if o == "UIConfigmiscWatchFrame" then o = "Use Custom Quest WatchFrame" end
	if o == "UIConfigmiscMMBFbutton" then o = "Use Minimap Button Frame" end
	if o == "UIConfigmiscBT4Bars" then o = "Sidebar & Small bars for Bartender 4" end
	if o == "UIConfigmiscPscale" then o = "Scale ViksUI Panels" end
	if o == "UIConfigmiscpanelsh" then o = "Set Panels to hidden" end
	if o == "UIConfigmiscThreatbar" then o = "Shows threathbar over XP bar location" end
	if o == "UIConfigmiscGameMenuBar" then o = "Shows Game menu at bottom of screen" end
	if o == "UIConfigmiscOrderHallBar" then o = "Show OrderHallBar Frame" end
	if o == "UIConfigmiscmerchant_itemlevel" then o = L_GUI_MISC_MERCHANT_ITEMLEVEL end
	if o == "UIConfigmiscminimize_mouseover" then o = L_GUI_MISC_MINIMIZE_MOUSEOVER end
	if o == "UIConfigmischide_banner" then o = L_GUI_MISC_HIDE_BANNER end
	if o == "UIConfigmischide_talking_head" then o = L_GUI_MISC_HIDE_TALKING_HEAD end
	if o == "UIConfigmisccombatanimation" then o = L_GUI_MISC_COMBAT_ANIM end
	if o == "UIConfigmiscInfoPanel_Stats" then o = "Show Icy-Vein stats over character frame" end

	--Panels
	if o == "UIConfigpanels" then o = "UI Panels" end
	if o == "UIConfigpanelsCPwidth" then o = "Width for Left and Right side panels that holds text." end
	if o == "UIConfigpanelsCPLwidth" then o = "Width for Left and Right side Lines." end
	if o == "UIConfigpanelsCPTextheight" then o = "Hight for panel where chat window is inside" end
	if o == "UIConfigpanelsCPbarsheight" then o = "Hight for Panels under/above Chat window" end
	if o == "UIConfigpanelsCPABarSide" then o = "Width for Action Bars next to chat windows" end
	if o == "UIConfigpanelsCPMinimap" then o = "Width/Hight for Minimap" end
	if o == "UIConfigpanelsPscale" then o = "Can be used to resize all panels. It does not change X Y Values" end
	if o == "UIConfigpanelsCPXPBa_r" then o = "Hight for the XP bar above Left Chat" end
	if o == "UIConfigpanelsxoffset" then o = "Horisontal spacing between panels" end
	if o == "UIConfigpanelsyoffset" then o = "Vertical spacing between panels" end
	if o == "UIConfigpanelsCPSidesWidth" then o = "Width of panels that is used to hold dmg meter and threathbar (Recount & Omen)" end 
	if o == "UIConfigpanelsCPMABwidth" then o = "Width for Main Actionbar" end
	if o == "UIConfigpanelsCPMABheight" then o = "Hight for Main Actionbar" end
	if o == "UIConfigpanelsCPMAByoffset" then o = "Hight for Main Actionbar" end
	if o == "UIConfigpanelsCPCooldheight" then o = "Hight for Cooldown Bar" end
	if o == "UIConfigpanelsCPTop" then o = "Width for Top Panels" end
	if o == "UIConfigpanelsNoPanels" then o = "NoPanels - Use Lines" end
	if o == "UIConfigpanelsHideABPanels" then o = "Hide Panels behind Actionbars" end

	-- Raid cooldowns options
	if o == "UIConfigraidcooldown" then o = L_GUI_COOLDOWN_RAID end
	if o == "UIConfigraidcooldownenable" then o = L_GUI_COOLDOWN_RAID_ENABLE end
	if o == "UIConfigraidcooldownheight" then o = L_GUI_COOLDOWN_RAID_HEIGHT end
	if o == "UIConfigraidcooldownwidth" then o = L_GUI_COOLDOWN_RAID_WIDTH end
	if o == "UIConfigraidcooldownupwards" then o = L_GUI_COOLDOWN_RAID_SORT end
	if o == "UIConfigraidcooldownshow_icon" then o = L_GUI_COOLDOWN_RAID_ICONS end
	if o == "UIConfigraidcooldownshow_inraid" then o = L_GUI_COOLDOWN_RAID_IN_RAID end
	if o == "UIConfigraidcooldownshow_inparty" then o = L_GUI_COOLDOWN_RAID_IN_PARTY end
	if o == "UIConfigraidcooldownshow_inarena" then o = L_GUI_COOLDOWN_RAID_IN_ARENA end

	-- Filger	
	if o == "UIConfigFilger" then o = L_GUI_FILGER end
	if o == "UIConfigFilgerenable" then o = L_GUI_FILGER_ENABLE end
	if o == "UIConfigFilgerdisable_cd" then o = "Disable cooldowns" end	
	if o == "UIConfigFilgerfilgertbar" then o = "Filger, shows special bars for target" end	
	if o == "UIConfigFilgerproc_size" then o = "Icon size for procs" end
	if o == "UIConfigFilgerbuffs_size" then o = "Icon size for buffs" end
	if o == "UIConfigFilgerdebuff_size" then o = "Icon size for debuffs" end
	if o == "UIConfigFilgerbar_iconsize" then o = "Icon size for bars" end
	if o == "UIConfigFilgerbar_width" then o = "Width for bars" end
	if o == "UIConfigFilgercooldown_size" then o = "Icon size for cooldowns" end
	if o == "UIConfigFilgerfilgerCD" then o = "Filger, shows Cooldowns on a bar list" end	
	if o == "UIConfigFilgertest_mode" then o = L_GUI_FILGER_TEST_MODE end
	if o == "UIConfigFilgermax_test_icon" then o = L_GUI_FILGER_MAX_TEST_ICON end
	if o == "UIConfigFilgershow_tooltip" then o = L_GUI_FILGER_SHOW_TOOLTIP end
	if o == "UIConfigFilgerdisable_cd" then o = L_GUI_FILGER_DISABLE_CD end
	if o == "UIConfigFilgerfilgertbar" then o = L_GUI_FILGERTBAR end
	
	T.option = o
end
local NewButton = function(text, parent)
	local T, C, L = unpack(ViksUI)

	local result = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	local label = result:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	label:SetText(text)
	result:SetWidth(label:GetWidth())
	result:SetHeight(label:GetHeight())
	result:SetFontString(label)
	result:SetNormalTexture("")
	result:SetHighlightTexture("")
	result:SetPushedTexture("")
	result.Left:SetAlpha(0)
	result.Right:SetAlpha(0)
	result.Middle:SetAlpha(0)

	return result
end

local NormalButton = function(text, parent)
	local T, C, L = unpack(ViksUI)

	local result = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	local label = result:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	label:SetJustifyH("LEFT")
	label:SetText(text)
	result:SetWidth(100)
	result:SetHeight(23)
	result:SetFontString(label)
	if IsAddOnLoaded("Aurora") then
		local F = unpack(Aurora)
		F.Reskin(result)
	else
		result:SkinButton()
	end

	return result
end

StaticPopupDialogs.PERCHAR = {
	text = L_GUI_PER_CHAR,
	OnAccept = function()
		if UIConfigAllCharacters:GetChecked() then
			GUIConfigAll[realm][name] = true
		else
			GUIConfigAll[realm][name] = false
		end
		ReloadUI()
	end,
	OnCancel = function()
		UIConfigCover:Hide()
		if UIConfigAllCharacters:GetChecked() then
			UIConfigAllCharacters:SetChecked(false)
		else
			UIConfigAllCharacters:SetChecked(true)
		end
	end,
	button1 = ACCEPT,
	button2 = CANCEL,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 5,
}

StaticPopupDialogs.RESET_PERCHAR = {
	text = L_GUI_RESET_CHAR,
	OnAccept = function()
		GUIConfig = GUIConfigSettings
		ReloadUI()
	end,
	OnCancel = function() if UIConfig and UIConfig:IsShown() then UIConfigCover:Hide() end end,
	button1 = ACCEPT,
	button2 = CANCEL,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 5,
}

StaticPopupDialogs.RESET_ALL = {
	text = L_GUI_RESET_ALL,
	OnAccept = function()
		GUIConfigSettings = nil
		GUIConfig = nil
		ReloadUI()
	end,
	OnCancel = function() UIConfigCover:Hide() end,
	button1 = ACCEPT,
	button2 = CANCEL,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 5,
}

local function SetValue(group, option, value)
	local mergesettings
	if GUIConfig == GUIConfigSettings then
		mergesettings = true
	else
		mergesettings = false
	end

	if GUIConfigAll[realm][name] == true then
		if not GUIConfig then GUIConfig = {} end
		if not GUIConfig[group] then GUIConfig[group] = {} end
		GUIConfig[group][option] = value
	else
		if mergesettings == true then
			if not GUIConfig then GUIConfig = {} end
			if not GUIConfig[group] then GUIConfig[group] = {} end
			GUIConfig[group][option] = value
		end

		if not GUIConfigSettings then GUIConfigSettings = {} end
		if not GUIConfigSettings[group] then GUIConfigSettings[group] = {} end
		GUIConfigSettings[group][option] = value
	end
end

local VISIBLE_GROUP = nil
local lastbutton = nil
local function ShowGroup(group, button)
	local T, C, L = unpack(ViksUI)

	if lastbutton then
		lastbutton:SetText(lastbutton:GetText().sub(lastbutton:GetText(), 11, -3))
	end
	if VISIBLE_GROUP then
		_G["UIConfig"..VISIBLE_GROUP]:Hide()
	end
	if _G["UIConfig"..group] then
		local o = "UIConfig"..group
		Local(o)
		_G["UIConfigTitle"]:SetText(T.option)
		local height = _G["UIConfig"..group]:GetHeight()
		_G["UIConfig"..group]:Show()
		local scrollamntmax = 400
		local scrollamntmin = scrollamntmax - 10
		local max = height > scrollamntmax and height-scrollamntmin or 1

		if max == 1 then
			_G["UIConfigGroupSlider"]:SetValue(1)
			_G["UIConfigGroupSlider"]:Hide()
		else
			_G["UIConfigGroupSlider"]:SetMinMaxValues(0, max)
			_G["UIConfigGroupSlider"]:Show()
			_G["UIConfigGroupSlider"]:SetValue(1)
		end
		_G["UIConfigGroup"]:SetScrollChild(_G["UIConfig"..group])

		local x
		if UIConfigGroupSlider:IsShown() then
			_G["UIConfigGroup"]:EnableMouseWheel(true)
			_G["UIConfigGroup"]:SetScript("OnMouseWheel", function(self, delta)
				if UIConfigGroupSlider:IsShown() then
					if delta == -1 then
						x = _G["UIConfigGroupSlider"]:GetValue()
						_G["UIConfigGroupSlider"]:SetValue(x + 10)
					elseif delta == 1 then
						x = _G["UIConfigGroupSlider"]:GetValue()
						_G["UIConfigGroupSlider"]:SetValue(x - 30)
					end
				end
			end)
		else
			_G["UIConfigGroup"]:EnableMouseWheel(false)
		end

		VISIBLE_GROUP = group
		lastbutton = button
	end
end

local loaded
function CreateUIConfig()
	if InCombatLockdown() and not loaded then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return end
	local T, C, L = unpack(ViksUI)

	if UIConfigMain then
		ShowGroup("general")
		UIConfigMain:Show()
		return
	end

	-- Main Frame
	local UIConfigMain = CreateFrame("Frame", "UIConfigMain", UIParent)
	UIConfigMain:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 200)
	UIConfigMain:SetWidth(780)
	UIConfigMain:SetHeight(520)
	if IsAddOnLoaded("Aurora") then
		local F = unpack(Aurora)
		F.CreateBD(UIConfigMain)
	else
		UIConfigMain:SetTemplate("Transparent")
	end
	UIConfigMain:SetFrameStrata("DIALOG")
	UIConfigMain:SetFrameLevel(20)
	tinsert(UISpecialFrames, "UIConfigMain")

	-- Version Title
	local TitleBoxVer = CreateFrame("Frame", "TitleBoxVer", UIConfigMain)
	TitleBoxVer:SetWidth(180)
	TitleBoxVer:SetHeight(26)
	TitleBoxVer:SetPoint("TOPLEFT", UIConfigMain, "TOPLEFT", 23, -15)

	local TitleBoxVerText = TitleBoxVer:CreateFontString("UIConfigTitleVer", "OVERLAY", "GameFontNormal")
	TitleBoxVerText:SetPoint("CENTER")
	TitleBoxVerText:SetText("Viks UI "..T.version)

	-- Main Frame Title
	local TitleBox = CreateFrame("Frame", "TitleBox", UIConfigMain)
	TitleBox:SetWidth(540)
	TitleBox:SetHeight(26)
	TitleBox:SetPoint("TOPLEFT", TitleBoxVer, "TOPRIGHT", 15, 0)

	local TitleBoxText = TitleBox:CreateFontString("UIConfigTitle", "OVERLAY", "GameFontNormal")
	TitleBoxText:SetPoint("LEFT", TitleBox, "LEFT", 15, 0)

	-- Options Frame
	local UIConfig = CreateFrame("Frame", "UIConfig", UIConfigMain)
	UIConfig:SetPoint("TOPLEFT", TitleBox, "BOTTOMLEFT", 10, -15)
	UIConfig:SetWidth(520)
	UIConfig:SetHeight(400)

	local UIConfigBG = CreateFrame("Frame", "UIConfigBG", UIConfig)
	UIConfigBG:SetPoint("TOPLEFT", -10, 10)
	UIConfigBG:SetPoint("BOTTOMRIGHT", 10, -10)

	-- Group Frame
	local groups = CreateFrame("ScrollFrame", "UIConfigCategoryGroup", UIConfig)
	groups:SetPoint("TOPLEFT", TitleBoxVer, "BOTTOMLEFT", 10, -15)
	groups:SetWidth(160)
	groups:SetHeight(400)

	local groupsBG = CreateFrame("Frame", "groupsBG", UIConfig)
	groupsBG:SetPoint("TOPLEFT", groups, -10, 10)
	groupsBG:SetPoint("BOTTOMRIGHT", groups, 10, -10)

	local UIConfigCover = CreateFrame("Frame", "UIConfigCover", UIConfigMain)
	UIConfigCover:SetPoint("TOPLEFT", 0, 0)
	UIConfigCover:SetPoint("BOTTOMRIGHT", 0, 0)
	UIConfigCover:SetFrameLevel(UIConfigMain:GetFrameLevel() + 20)
	UIConfigCover:EnableMouse(true)
	UIConfigCover:SetScript("OnMouseDown", function(self) print(L_GUI_MAKE_SELECTION) end)
	UIConfigCover:Hide()

	-- Group Scroll
	local slider = CreateFrame("Slider", "UIConfigCategorySlider", groups)
	slider:SetPoint("TOPRIGHT", 0, 0)
	slider:SetWidth(20)
	slider:SetHeight(400)
	slider:SetThumbTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
	slider:SetOrientation("VERTICAL")
	slider:SetValueStep(20)
	slider:SetScript("OnValueChanged", function(self, value) groups:SetVerticalScroll(value) end)

	if not slider.bg then
		slider.bg = CreateFrame("Frame", nil, slider)
		slider.bg:SetPoint("TOPLEFT", slider:GetThumbTexture(), "TOPLEFT", 10, -7)
		slider.bg:SetPoint("BOTTOMRIGHT", slider:GetThumbTexture(), "BOTTOMRIGHT", -7, 7)
		slider.bg:SetTemplate("Overlay")
		slider:GetThumbTexture():SetAlpha(0)
	end

	local function sortMyTable(a, b)
		return ALLOWED_GROUPS[a] < ALLOWED_GROUPS[b]
	end
	local function pairsByKey(t, f)
		local a = {}
		for n in pairs(t) do table.insert(a, n) end
		table.sort(a, sortMyTable)
		local i = 0
		local iter = function()
			i = i + 1
			if a[i] == nil then return nil
			else return a[i], t[a[i]]
			end
		end
		return iter
	end


	local GetOrderedIndex = function(t)
		local OrderedIndex = {}

		for key in pairs(t) do table.insert(OrderedIndex, key) end
		table.sort(OrderedIndex)
		return OrderedIndex
	end

	local OrderedNext = function(t, state)
		local Key

		if (state == nil) then
			t.OrderedIndex = GetOrderedIndex(t)
			Key = t.OrderedIndex[1]
			return Key, t[Key]
		end

		Key = nil
		for i = 1, #t.OrderedIndex do
			if (t.OrderedIndex[i] == state) then Key = t.OrderedIndex[i + 1] end
		end

		if Key then return Key, t[Key] end
		t.OrderedIndex = nil
		return
	end

	local PairsByKeys = function(t) return OrderedNext, t, nil end

	local child = CreateFrame("Frame", nil, groups)
	child:SetPoint("TOPLEFT")
	local offset = 5
	for i in pairsByKey(ALLOWED_GROUPS) do
		local o = "UIConfig"..i
		Local(o)
		local button = NewButton(T.option, child)
		button:SetHeight(16)
		button:SetWidth(125)
		button:SetPoint("TOPLEFT", 5, -offset)
		button:SetScript("OnClick", function(self) ShowGroup(i, button) self:SetText("|cff00ff00"..T.option.."|r") end)
		offset = offset + 20
	end
	child:SetWidth(125)
	child:SetHeight(offset)
	slider:SetMinMaxValues(0, (offset == 0 and 1 or offset - 12 * 33))
	slider:SetValue(1)
	groups:SetScrollChild(child)

	local x
	_G["UIConfigCategoryGroup"]:EnableMouseWheel(true)
	_G["UIConfigCategoryGroup"]:SetScript("OnMouseWheel", function(self, delta)
		if _G["UIConfigCategorySlider"]:IsShown() then
			if delta == -1 then
				x = _G["UIConfigCategorySlider"]:GetValue()
				_G["UIConfigCategorySlider"]:SetValue(x + 10)
			elseif delta == 1 then
				x = _G["UIConfigCategorySlider"]:GetValue()
				_G["UIConfigCategorySlider"]:SetValue(x - 20)
			end
		end
	end)

	local group = CreateFrame("ScrollFrame", "UIConfigGroup", UIConfig)
	group:SetPoint("TOPLEFT", 0, 5)
	group:SetWidth(520)
	group:SetHeight(400)

	-- Options Scroll
	local slider = CreateFrame("Slider", "UIConfigGroupSlider", group)
	slider:SetPoint("TOPRIGHT", 0, 0)
	slider:SetWidth(20)
	slider:SetHeight(400)
	slider:SetThumbTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
	slider:SetOrientation("VERTICAL")
	slider:SetValueStep(20)
	slider:SetScript("OnValueChanged", function(self, value) group:SetVerticalScroll(value) end)

	if not slider.bg then
		slider.bg = CreateFrame("Frame", nil, slider)
		slider.bg:SetPoint("TOPLEFT", slider:GetThumbTexture(), "TOPLEFT", 10, -7)
		slider.bg:SetPoint("BOTTOMRIGHT", slider:GetThumbTexture(), "BOTTOMRIGHT", -7, 7)
		slider.bg:SetTemplate("Overlay")
		slider:GetThumbTexture():SetAlpha(0)
	end

	for i in pairs(ALLOWED_GROUPS) do
		local frame = CreateFrame("Frame", "UIConfig"..i, UIConfigGroup)
		frame:SetPoint("TOPLEFT")
		frame:SetWidth(225)

		local offset = 5

		if type(C[i]) ~= "table" then error(i.." GroupName not found in config table.") return end
		for j, value in PairsByKeys(C[i]) do
			if type(value) == "boolean" then
				local button = CreateFrame("CheckButton", "UIConfig"..i..j, frame, "InterfaceOptionsCheckButtonTemplate")
				if IsAddOnLoaded("Aurora") then
					local F = unpack(Aurora)
					F.ReskinCheck(button)
				else
					T.SkinCheckBox(button)
				end
				local o = "UIConfig"..i..j
				Local(o)
				_G["UIConfig"..i..j.."Text"]:SetText(T.option)
				_G["UIConfig"..i..j.."Text"]:SetFontObject(GameFontHighlight)
				_G["UIConfig"..i..j.."Text"]:SetWidth(460)
				_G["UIConfig"..i..j.."Text"]:SetJustifyH("LEFT")
				button:SetChecked(value)
				button:SetScript("OnClick", function(self) SetValue(i, j, (self:GetChecked() and true or false)) end)
				button:SetPoint("TOPLEFT", 5, -offset)
				offset = offset + 25
			elseif type(value) == "number" or type(value) == "string" then
				local label = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
				local o = "UIConfig"..i..j
				Local(o)
				label:SetText(T.option)
				label:SetWidth(460)
				label:SetHeight(20)
				label:SetJustifyH("LEFT")
				label:SetPoint("TOPLEFT", 5, -offset)

				local editbox = CreateFrame("EditBox", nil, frame)
				editbox:SetAutoFocus(false)
				editbox:SetMultiLine(false)
				editbox:SetWidth(220)
				editbox:SetHeight(20)
				editbox:SetMaxLetters(255)
				editbox:SetTextInsets(3, 0, 0, 0)
				editbox:SetFontObject(GameFontHighlight)
				editbox:SetPoint("TOPLEFT", 8, -(offset + 20))
				editbox:SetText(value)
				if IsAddOnLoaded("Aurora") then
					local F = unpack(Aurora)
					F.CreateBD(editbox)
				else
					editbox:SetTemplate("Overlay")
				end

				local okbutton = CreateFrame("Button", nil, frame)
				okbutton:SetHeight(editbox:GetHeight())
				okbutton:SkinButton()
				okbutton:SetPoint("LEFT", editbox, "RIGHT", 2, 0)

				local oktext = okbutton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
				oktext:SetText(OKAY)
				oktext:SetPoint("CENTER", okbutton, "CENTER", -1, 0)
				okbutton:SetWidth(oktext:GetWidth() + 5)
				okbutton:Hide()

				if type(value) == "number" then
					editbox:SetScript("OnEscapePressed", function(self) okbutton:Hide() self:ClearFocus() self:SetText(value) end)
					editbox:SetScript("OnChar", function(self) okbutton:Show() end)
					editbox:SetScript("OnEnterPressed", function(self) okbutton:Hide() self:ClearFocus() SetValue(i, j, tonumber(self:GetText())) end)
					okbutton:SetScript("OnMouseDown", function(self) editbox:ClearFocus() self:Hide() SetValue(i, j, tonumber(editbox:GetText())) end)
				else
					editbox:SetScript("OnEscapePressed", function(self) okbutton:Hide() self:ClearFocus() self:SetText(value) end)
					editbox:SetScript("OnChar", function(self) okbutton:Show() end)
					editbox:SetScript("OnEnterPressed", function(self) okbutton:Hide() self:ClearFocus() SetValue(i, j, tostring(self:GetText())) end)
					okbutton:SetScript("OnMouseDown", function(self) editbox:ClearFocus() self:Hide() SetValue(i, j, tostring(editbox:GetText())) end)
				end

				offset = offset + 45
			elseif type(value) == "table" then
				local label = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
				local o = "UIConfig"..i..j
				Local(o)
				label:SetText(T.option)
				label:SetWidth(440)
				label:SetHeight(20)
				label:SetJustifyH("LEFT")
				label:SetPoint("TOPLEFT", 5, -offset)

				colorbuttonname = (label:GetText().."ColorPicker")

				local colorbutton = CreateFrame("Button", colorbuttonname, frame)
				colorbutton:SetHeight(20)
				colorbutton:SetTemplate("Transparent")
				colorbutton:SetBackdropBorderColor(unpack(value))
				colorbutton:SetBackdropColor(value[1], value[2], value[3], 0.3)
				colorbutton:SetPoint("LEFT", label, "RIGHT", 2, 0)

				local colortext = colorbutton:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
				colortext:SetText(COLOR)
				colortext:SetPoint("CENTER")
				colortext:SetJustifyH("CENTER")
				colorbutton:SetWidth(colortext:GetWidth() + 5)

				local oldvalue = value

				local function round(number, decimal)
					return (("%%.%df"):format(decimal)):format(number)
				end

				colorbutton:SetScript("OnMouseDown", function(self)
					if ColorPickerFrame:IsShown() then return end
					local newR, newG, newB, newA
					local fired = 0

					local r, g, b, a = self:GetBackdropBorderColor()
					r, g, b, a = round(r, 2), round(g, 2), round(b, 2), round(a, 2)
					local originalR, originalG, originalB, originalA = r, g, b, a

					local function ShowColorPicker(r, g, b, a, changedCallback)
						ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = changedCallback, changedCallback, changedCallback
						ColorPickerFrame:SetColorRGB(r, g, b)
						a = tonumber(a)
						ColorPickerFrame.hasOpacity = (a ~= nil and a ~= 1)
						ColorPickerFrame.opacity = a
						ColorPickerFrame.previousValues = {originalR, originalG, originalB, originalA}
						ColorPickerFrame:Hide()
						ColorPickerFrame:Show()
					end

					local function myColorCallback(restore)
						fired = fired + 1
						if restore ~= nil then
							-- The user bailed, we extract the old color from the table created by ShowColorPicker
							newR, newG, newB, newA = unpack(restore)
						else
							-- Something changed
							newA, newR, newG, newB = OpacitySliderFrame:GetValue(), ColorPickerFrame:GetColorRGB()
						end

						value = {newR, newG, newB, newA}
						SetValue(i, j, (value))
						self:SetBackdropBorderColor(newR, newG, newB, newA)
						self:SetBackdropColor(newR, newG, newB, 0.3)
					end

					ShowColorPicker(originalR, originalG, originalB, originalA, myColorCallback)
				end)

				offset = offset + 25
			end
		end

		frame:SetHeight(offset)
		frame:Hide()
	end

	local reset = NormalButton(DEFAULT, UIConfigMain)
	reset:SetPoint("TOPLEFT", UIConfig, "BOTTOMLEFT", -10, -25)
	reset:SetScript("OnClick", function(self)
		UIConfigCover:Show()
		if GUIConfigAll[realm][name] == true then
			StaticPopup_Show("RESET_PERCHAR")
		else
			StaticPopup_Show("RESET_ALL")
		end
	end)

	local close = NormalButton(CLOSE, UIConfigMain)
	close:SetPoint("TOPRIGHT", UIConfig, "BOTTOMRIGHT", 10, -25)
	close:SetScript("OnClick", function(self) PlaySound(PlaySoundKitID and "igMainMenuOption" or SOUNDKIT.IG_MAINMENU_OPTION) UIConfigMain:Hide() end)

	local load = NormalButton(APPLY, UIConfigMain)
	load:SetPoint("RIGHT", close, "LEFT", -4, 0)
	load:SetScript("OnClick", function(self) ReloadUI() end)

	local totalreset = NormalButton(L_GUI_BUTTON_RESET, UIConfigMain)
	totalreset:SetWidth(180)
	totalreset:SetPoint("TOPLEFT", groupsBG, "BOTTOMLEFT", 0, -15)
	totalreset:SetScript("OnClick", function(self)
		StaticPopup_Show("RESET_UI")
		GUIConfig = {}
		if GUIConfigAll[realm][name] == true then
			GUIConfigAll[realm][name] = {}
		end
		GUIConfigSettings = {}
	end)

	if GUIConfigAll then
		local button = CreateFrame("CheckButton", "UIConfigAllCharacters", TitleBox, "InterfaceOptionsCheckButtonTemplate")
		button:SetScript("OnClick", function(self) StaticPopup_Show("PERCHAR") UIConfigCover:Show() end)
		button:SetPoint("RIGHT", TitleBox, "RIGHT", -3, 0)
		button:SetHitRectInsets(0, 0, 0, 0)
		if IsAddOnLoaded("Aurora") then
			local F = unpack(Aurora)
			F.ReskinCheck(button)
		else
			T.SkinCheckBox(button)
		end

		local label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		label:SetText(L_GUI_SET_SAVED_SETTTINGS)
		label:SetPoint("RIGHT", button, "LEFT")

		if GUIConfigAll[realm][name] == true then
			button:SetChecked(true)
		else
			button:SetChecked(false)
		end
	end

	local bgskins = {TitleBox, TitleBoxVer, UIConfigBG, groupsBG}
	for _, sb in pairs(bgskins) do
		if IsAddOnLoaded("Aurora") then
			local F = unpack(Aurora)
			F.CreateBD(sb)
		else
			sb:SetTemplate("Overlay")
		end
	end

	ShowGroup("general")
	loaded = true
end

do
	function SlashCmdList.CONFIG()
		if not UIConfigMain or not UIConfigMain:IsShown() then

			PlaySound(PlaySoundKitID and "igMainMenuOption" or SOUNDKIT.IG_MAINMENU_OPTION)
			CreateUIConfig()
			HideUIPanel(GameMenuFrame)
		else

			PlaySound(PlaySoundKitID and "igMainMenuOption" or SOUNDKIT.IG_MAINMENU_OPTION)
			UIConfigMain:Hide()
		end
	end
	SLASH_CONFIG1 = "/config"
	SLASH_CONFIG2 = "/cfg"
	SLASH_CONFIG3 = "/configui"

	function SlashCmdList.RESETCONFIG()
		if UIConfigMain and UIConfigMain:IsShown() then UIConfigCover:Show() end

		if GUIConfigAll[realm][name] == true then
			StaticPopup_Show("RESET_PERCHAR")
		else
			StaticPopup_Show("RESET_ALL")
		end
	end
	SLASH_RESETCONFIG1 = "/resetconfig"
end

do
	local frame = CreateFrame("Frame", nil, InterfaceOptionsFramePanelContainer)
	frame:Hide()

	frame.name = "ViksUI"
	frame:SetScript("OnShow", function(self)
		if self.show then return end
		local T, C, L = unpack(ViksUI)
		local title = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title:SetPoint("TOPLEFT", 16, -16)
		title:SetText("Info about ViksUI:")

		local subtitle = self:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
		subtitle:SetWidth(580)
		subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
		subtitle:SetJustifyH("LEFT")
		subtitle:SetText("WoWInterface: |cff298F00http://www.wowinterface.com/downloads/info21462-ViksUI.html|r\nChange Log: |cff298F00On WoWInterface|r")

		local title2 = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title2:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, -16)
		title2:SetText("Credits:")

		local subtitle2 = self:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
		subtitle2:SetWidth(580)
		subtitle2:SetPoint("TOPLEFT", title2, "BOTTOMLEFT", 0, -8)
		subtitle2:SetJustifyH("LEFT")
		subtitle2:SetText("AcidWeb, Aezay, Affli, Ailae, Allez, ALZA, Ammo, Astromech, Beoko, Bitbyte, Blamdarot, Bozo, Caellian, Califpornia, Camealion, Chiril, CrusaderHeimdall, Cybey, Dawn, Don Kaban, Dridzt, Duffed, Durcyn, Eclipse, Egingell, Elv22, Evilpaul, Evl, Favorit, Fernir, Foof, Freebaser, g0st, gi2k15, Gorlasch, Gsuz, Haleth, Haste, Hoochie, Hungtar, HyPeRnIcS, Hydra, Ildyria, iSpawnAtHome, Jaslm, Karl_w_w, Karudon, Katae, Kemayo, Killakhan, Kraftman, Kunda, Leatrix, m2jest1c, Magdain, Meurtcriss, Monolit, MrRuben5, Myrilandell of Lothar, Nathanyel, Nefarion, Nightcracker, Nils Ruesch, p3lim, Partha, Phanx, pvtschlag, Rahanprout, Renstrom, RustamIrzaev, Safturento, Sara.Festung, SDPhantom, Sildor, Silverwind, SinaC, Slakah, Soeters, Starlon, Suicidal Katt, Syzgyn, Tekkub, Telroth, Thalyra, Thizzelle, Tia Lynn, Timmy2250, Tohveli, Tukz, Tuller, Veev, Villiv, Vladinator, Wetxius, Woffle of Dark Iron, Wrug, Xuerian, Yleaf, Zork.")

		local title3 = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title3:SetPoint("TOPLEFT", subtitle2, "BOTTOMLEFT", 0, -16)
		title3:SetText("Translation:")

		local subtitle3 = self:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
		subtitle3:SetWidth(580)
		subtitle3:SetPoint("TOPLEFT", title3, "BOTTOMLEFT", 0, -8)
		subtitle3:SetJustifyH("LEFT")
		subtitle3:SetText("Aelb, Alwa, Baine, Chubidu, Cranan, eXecrate, F5Hellbound, Ianchan, Leg883, Mania, Nanjiqq, Oz, Puree, Seal, Sinaris, Spacedragon, Tat2dawn, Tibles, Vienchen.")

		local title4 = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title4:SetPoint("TOPLEFT", subtitle3, "BOTTOMLEFT", 0, -16)
		title4:SetText("Thanks:")

		local subtitle4 = self:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
		subtitle4:SetWidth(580)
		subtitle4:SetPoint("TOPLEFT", title4, "BOTTOMLEFT", 0, -8)
		subtitle4:SetJustifyH("LEFT")
		subtitle4:SetText("Akimba, Antthemage, Crunching, Dandruff, DesFolk, Elfrey, Ente, Erratic, Falchior, Gromcha, Halogen, Homicidal Retribution, ILF7, Illusion, Ipton, k07n, Kazarl, Leots, m2jest1c, MoLLIa, Nefrit, Noobolov, Obakol, Oz, PterOs, Sart, Scorpions, Sitatunga, Sw2rT1, Wetxius, Yakodzuna, UI Users and Russian Community.")

		local title5 = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		title5:SetPoint("TOPLEFT", subtitle4, "BOTTOMLEFT", 0, -16)
		title5:SetText("Special thanks to: Shestak and Qulight")
		
		local version = self:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		version:SetPoint("BOTTOMRIGHT", -16, 16)
		version:SetText("Version: "..T.version)

		self.show = true
	end)

	InterfaceOptions_AddCategory(frame)
end
----------------------------------------------------------------------------------------
--	Button in GameMenuButton frame
----------------------------------------------------------------------------------------
local button = CreateFrame("Button", "GameMenuButtonSettingsUI", GameMenuFrame, "GameMenuButtonTemplate")
button:SetText("ViksUI")
button:SetPoint("TOP", "GameMenuButtonAddons", "BOTTOM", 0, -1)

GameMenuFrame:HookScript("OnShow", function()
	GameMenuFrame:SetHeight(GameMenuFrame:GetHeight() + button:GetHeight())
	GameMenuButtonLogout:SetPoint("TOP", button, "BOTTOM", 0, -16)
end)

button:SetScript("OnClick", function()

	PlaySound(PlaySoundKitID and "igMainMenuOption" or SOUNDKIT.IG_MAINMENU_OPTION)
	HideUIPanel(GameMenuFrame)
	if not UIConfigMain or not UIConfigMain:IsShown() then
		CreateUIConfig()
	else
		UIConfigMain:Hide()
	end
end)