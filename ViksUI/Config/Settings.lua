local T, C, L = unpack(ViksUI)
local _, class = UnitClass("player")
local rv, gv, bv = 0, .38, .651

----------------------------------------------------------------------------------------
--	Media
----------------------------------------------------------------------------------------
C["media"] = {
	["normal_font"] = [=[Interface\Addons\ViksUI\Media\Font\normal_font.ttf]=], 		-- main font in Viks UI
	["blank_font"] = [[Interface\AddOns\ViksUI\Media\Font\Blank.ttf]],					-- Blank font
	["fontcombat"] = [=[Interface\Addons\ViksUI\Media\Font\LinkinPark.ttf]=], 			-- Combat Text Font (Require Game Restart)
	["pixel_font"] = [=[Interface\Addons\ViksUI\Media\Font\pixel.ttf]=], 				-- DataText Font Normal
	["pxfontHeader"] = "Interface\\Addons\\ViksUI\\Media\\Font\\LinkinPark.ttf", 		-- DataText Font for Headers. Used on Top Line
	["pixel_font_style"] = "MONOCHROMEOUTLINE", 										-- Normal Text Flags like: "OVERLAY", "OUTLINE", "THINOUTLINE", "THICKOUTLINE" and "MONOCHROME"
	["pxfontHFlag"] = "OUTLINE", 															-- Normal Text Flags like: "OVERLAY", "OUTLINE", "THINOUTLINE", "THICKOUTLINE" and "MONOCHROME"
	["pixel_font_size"] = 14, 															-- Size of font Datatext
	["pxfontHsize"] = 13, 																-- Size of font Datatext
	["fontsize"] = 12, 														    		-- Size of font 
	["border_color"] = { 0, .38, .651, 1}, 												-- border color of Viks UI panels
	["backdrop_color"] = {.06,.06,.06, 1}, 												-- background color of Viks UI panels
	["backdrop_alpha"] = 0.7,															-- Alpha for transparent backdrop
	["overlay_color"] = {0, 0, 0, 0.9},													-- Color for action bars overlay
	["texture"] = [[Interface\AddOns\ViksUI\Media\Textures\Texture.tga]],				-- Texture for status bars
	["blank"] = "Interface\\Buttons\\WHITE8x8",
	["blank_border"] = "Interface\\Buttons\\WHITE8x8",									-- Texture for borders			
	["highlight"] = [[Interface\AddOns\ViksUI\Media\Textures\Highlight]],				-- Texture for debuffs highlight
	["pxcolor1"] = { .001,.38,.651,1 },													-- Color for Name on Datatext
	["pxcolor2"] = { .41,.80,.94,1 },													-- Color for Value on Datatext if not dynamic color by value
	["oUFfont"] = [=[Interface\\Addons\\ViksUI\\Media\\Font\\ROADWAY.ttf]=], 			-- DataText Font Normal
	["oUFfontsize"] = 12, 																-- Size of font Datatext
	["oUFfontcolor"] = { .07, .7, .3, 1}, 												-- Font color used when class colored bars
	["whisp_sound"] = [[Interface\AddOns\ViksUI\Media\Sounds\Whisper.ogg]],				-- Sound for wispers
	["warning_sound"] = [[Interface\AddOns\ViksUI\Media\Sounds\Warning.ogg]],			-- Sound for warning
	["proc_sound"] = [[Interface\AddOns\ViksUI\Media\Sounds\Proc.ogg]],					-- Sound for procs
	["yoffsetTop"] = -2,																-- Used to offset text in top panel on font change												
	["classcolor_border"] = false,														-- Use class color for border color		
	["classborder_color"] = {T.color.r, T.color.g, T.color.b, 1},					-- Color for class borders	
}

if GetLocale() == "ruRU" then 
	C.media.pxfontHeader = [[Interface\Addons\ViksUI\Media\Font\Cleanwork.ttf]]
	C.media.pxfontHsize = 16
	C.media.yoffsetTop = -2
end

C["quest"] = {
	["auto_collapse"] = "NONE",																-- Auto collapse Objective Tracker (RAID, RELOAD, SCENARIO, NONE)
	["header_button_only"] = false,															-- Show only +/- button and not text
	["header_text_color"] = { 0, 0.659, 1, 1},												-- Color for Headers (Quest/Scenario/etc)
	["header_text_font"] = [=[Interface\Addons\ViksUI\Media\Font\normal_font.ttf]=], 		-- Font for Headers
	["header_text_ori"] = "RIGHT",															-- Justify text for Headers
	["header_text_font_size"] = 18, 														-- Header font size
	["header_text_font_style"] = "THINOUTLINE",
	["title_text_color"] = { 0, 0.659, 1, 1},												-- Color for Title (Quest/Scenario/etc)
	["title_text_font"] = [=[Interface\Addons\ViksUI\Media\Font\normal_font.ttf]=], 		-- Title font
	["title_text_font_size"] = 15, 															-- Title font size
	["title_text_font_style"] = "THINOUTLINE", 												-- Title font style
	["header_bar_Texture"] = [[Interface\AddOns\ViksUI\Media\Textures\Glow]],				-- Texture for line under Headers (Quest/Scenario/etc)
	["header_bar_color"] = { 0, 0.659, 1},													-- Color for line under Headers (Quest/Scenario/etc)
	["header_bar_height"] = 2,																-- Height for line under Headers (Quest/Scenario/etc)
	["header_bar_width"] = 230,																-- Height for line under Headers (Quest/Scenario/etc)
	["quest_auto_button"] = true,															-- Quest auto button
	["accept_quest"] = true,																-- Auto accept quests(if hold shift or alt, auto accept is disable)
}
----------------------------------------------------------------------------------------
--	General
----------------------------------------------------------------------------------------
C["general"] = {
	["auto_scale"] = true,						-- Autoscale
	["uiscale"] = 0.75,							-- Your value(between 0.64 and 1) if "auto_scale" is disable
	["welcome_message"] = true,					-- Enable welcome message in chat
	["alt_scale"] = false,						-- Alternative way to scale
	-- Blizzard UI
	["error_filter"] = "BLACKLIST",				-- Filter Blizzard red errors (BLACKLIST, WHITELIST, COMBAT, NONE)
	["move_blizzard"] = true,					-- Move some Blizzard frames
	["color_picker"] = true,					-- Improved ColorPicker
	["vehicle_mouseover"] = false,				-- Vehicle frame on mouseover
	["hide_banner"] = false,					-- Hide Boss Banner Loot Frame
	["hide_talking_head"] = false,				-- Hide Talking Head Frame
}

if T.screenHeight == 1440 then
	C.general.auto_scale = false
	C.general.uiscale = 0.64
end

----------------------------------------------------------------------------------------
--	Minimap options
----------------------------------------------------------------------------------------
C["minimap"] = {
	["enable"] = true,
	["tracking_icon"] = false,				-- Tracking icon
	["garrison_icon"] = false,				-- Garrison icon
	["size"] = 136,							-- Minimap size
	["toggle_menu"] = false,				-- Show toggle menu
	["hide_combat"] = false,				-- Hide minimap in combat
	["compass"] = true,						-- Show N/S/E/W
	-- Other
	["bg_map_stylization"] = true,			-- BG map stylization
	["minimb1"] = true,						-- Background for Minimap bottom right
	["minimb2"] = true,						-- Background for Minimap bottom left
	["zoneMapMultilplier"] = 1,				-- Multiplier for zoneMap (NOT scale)
	["zoneMapScale"] = 1, 					-- Scale zonemap
}

----------------------------------------------------------------------------------------
--	Miscellaneous options
----------------------------------------------------------------------------------------
C["misc"] = {
	["shift_marking"] = true,					-- Marks target when you push "shift"
	["invite_keyword"] = "inv",					-- Short keyword for invite(for enable - in game type /ainv)
	["LFD_keyword"] = "none",					-- Description to change text in LFD note - none for disable
	["afk_spin_camera"] = true,					-- Spin camera while afk
	["afk_spin_camera_anim"] = 69,				-- Spin camera modell animation
	["raid_tools"] = true,						-- Raid tools
	["item_level"] = true,						-- Item level on character slot buttons
	["click_cast"] = true,						-- Simple click2cast spell binder
	["click_cast_filter"] = false,				-- Ignore Player and Target frames for click2cast
	["chars_currency"] = true,					-- Tracks your currency tokens across multiple characters
	["markbar"] = true,							-- Markbar for Raid Icons and flares
	["classtimer"] = true,						-- Shows buff/debuffs/procs as bar on player/target frame
	["BT4Bars"] = true,							-- Panels behind Sidebar & Small bars for Bartender 4
	["Pscale"] = 1,								-- Scale ViksUI Panels
	["panelsh"] = true,							-- Set UI Panels to hidden
	["combatanimation"] = true,					-- Text animation when entering/exiting combat
	["GameMenuBar"] = true,						-- Show Game Menu Bar
	["XPBar"] = true,							-- XP/Honor/Rep bar above chat windows
	["meters"] = true,							-- Show button for toggle dps meters and move chat (only in line layout)
	["InfoPanel_Stats"] = true,					-- Stats Panel with info from https://www.icy-veins.com
}

----------------------------------------------------------------------------------------
--	Panels options
----------------------------------------------------------------------------------------
C["panels"] = {
	["CPwidth"] = 300,								-- Width for Left and RIght side panels that holds text. 
	["CPLwidth"] = 390,								-- Width for Left and RIght Chat lines. 
	["CPTextheight"] = 142, 						-- Hight for panel where chat window is inside
	["CPbarsheight"] = 16, 							-- Hight for Panels under/above Chat window
	["CPABarSide"] = 30, 							-- Width for Action Bars next to chat windows
	["CPXPBa_r"] = 20, 								-- Hight for the XP bar above Left Chat
	["xoffset"] = 3, 								-- Horisontal spacing between panels
	["yoffset"] = 3, 								-- Vertical spacing between panels
	["CPSidesWidth"] = 178, 						-- Width of panels that is used to hold dmg meter and threathbar (Recount & Omen) 
	["CPMABwidth"] = 538, 							-- Width for Main Actionbar
	["CPMABheight"] = 32, 							-- Hight for Main Actionbar
	["CPMAByoffset"] = 68, 							-- Main action bar panel placement distance from bottom of screen
	["CPCooldheight"] = 18, 						-- Hight for Cooldown Bar
	["CPTop"] = 1912, 								-- Width for Top Panels
	["CPMinimap"] = C["minimap"].size, 				-- Width/Hight for Minimap Panel
	["Pscale"] = C["misc"].Pscale,					-- Can be used to resize all panels. It does not change X Y Values
	["NoPanels"] = false,							-- Will Set all panels to hidden and show lines instead. On test stage still!
	["HideABPanels"] = false,						-- Hides all panels behind actionbars!
	["HideDetailsPanels"] = false,					-- Don't show panels behind detail
	["twoDetailsPanels"] = false,					-- Don't show 2 panels on right side, Details
}
----------------------------------------------------------------------------------------
--	Skins options
----------------------------------------------------------------------------------------
C["skins"] = {
	["blizzard_frames"] = true,					-- Blizzard frames skin
	["bubbles"] = true,							-- Skin Blizzard chat bubbles
	["minimap_buttons"] = true,					-- Skin addons icons on minimap
	["minimap_buttons_mouseover"] = true,		-- Addons icons on mouseover
	-- Addons
	["ace3"] = false,							-- Ace3 options elements skin
	["atlasloot"] = false,						-- AtlasLoot skin
	["bigwigs"] = false,						-- BigWigs skin
	["blood_shield_tracker"] = false,			-- BloodShieldTracker skin
	["capping"] = false,						-- Capping skin
	["clique"] = false,							-- Clique skin
	["cool_line"] = false,						-- CoolLine skin
	["dbm"] = true,								-- DBM skin
	["dbm_movable"] = false,					-- Allow to move DBM bars
	["details"] = false,						-- Details skin
	["dominos"] = false,						-- Dominos skin
	["ExtraActionBarFrame"] = true, 			-- Skinn ExtraActionBarFrame with Masque
	["flyout_button"] = false,					-- FlyoutButtonCustom skin
	["ls_toasts"] = false,						-- Is: Toasts skin
	["mage_nuggets"] = false,					-- MageNuggets skin
	["my_role_play"] = false,					-- MyRolePlay skin
	["npcscan"] = false,						-- NPCScan skin
	["nug_running"] = false,					-- NugRunning skin
	["omen"] = false,							-- Omen skin
	["opie"] = false,							-- OPie skin
	["ovale"] = false,							-- OvaleSpellPriority skin
	["plater"] = false,							-- Plater skin
	["postal"] = false,							-- Postal skin
	["rarescanner"] = false,					-- RareScanner skin
	["recount"] = false,						-- Recount skin
	["rematch"] = false,						-- Rematch skin
	["tiny_dps"] = false,						-- TinyDPS skin
	["vanaskos"] = false,						-- VanasKoS skin
	["weak_auras"] = false,						-- WeakAuras skin
}

----------------------------------------------------------------------------------------
--	Unit Frames options
----------------------------------------------------------------------------------------
C["unitframe"] = {
	-- Main
	["enable"] = true,																	-- enable/disable action bars
	["HealFrames"] = false,																-- Healing layout/positions
	["HealthcolorClass"] = false,														-- health color = class color
	["HealthBarBackGround"] = { .1, .1, .1, 1},
	["Powercolor"] = true,																-- power color = class color
	["Autohide"] = true, 																-- Always Hide Raidframes if Vuhdo/Healbot/Grid is loaded.
	["UFfont"] = "Interface\\Addons\\ViksUI\\Media\\Font\\ROADWAY.ttf",
	["UFNamefont"] = "Interface\\Addons\\ViksUI\\Media\\Font\\ROADWAY.ttf",				-- Font to use on Names
	["insideAlpha"] = 1,																-- Alpha when Unitframe is in range	
	["outsideAlpha"] = 0.6,																-- Alpha when Unitframe is out of range
	["uf_color"] = {0.4, 0.4, 0.4},														-- Color for UF if ["own_color"] = true
	-- misc
	["showPlayerAuras"] = true, 														-- use a custom player buffs/debuffs frame instead of blizzard's default.
	["IndicatorIcons2"] = false,														-- Ø Toggles different Indicator types.
	["aurasize"] = 18,																	-- Ø Aura Size for indicator type 2
	["indicatorsize"] = 6,																-- Ø Size on Squares on Indicator type 2
	["symbolsize"] = 11,																-- Ø Size on Symbols on Indicator type 2
	["fontsizeEdge"] = 12,																-- Ø
	["tankdebuff"] = 22,																-- Size on debuffs on MT frames
	["Findoutline"] = "OUTLINE",														-- Ø
	-- Cast bars
	["Castbars"] = true, 																-- Show castbars
	["castbar_ticks"] = true,															-- Castbar ticks
	["castbar_icon"] = true,															-- Show castbar icons
	-- Frames
	["showtot"] = true, 																-- show target of target frame
	["showpet"] = true,																	-- show pet frame
	["showfocus"] = true, 																-- show focus frame
	["showfocustarget"] = true, 														-- show focus targets frame
	["showBossFrames"] = true, 															-- show boss frame
	["MTFrames"] = true, 																-- show main tank frames
	["ShowRaid"] = true,																-- Show Raid Frames
	["ShowParty"] = true,																-- show party frames (shown as 5man raid)
	["RaidShowAllGroups"] = true,														-- Show All 8 Raid Groups, if not then 5	
	["RaidShowSolo"] = false,															-- show raid frames even when solo
	-- Icons
	["showLFDIcons"] = true,															-- Show Raid Roll Icon on Frames
	["customLFDIcons"] = true,															-- Show Custom Raid Roll Icon on Frames
	["customLFDText"] = false,															-- Show Raid Roll Icon as Text on Frames
	["showIndicators"] = true,															-- Show Indicators on frames
	["debuffsOnlyShowPlayer"] = false,													-- only show your debuffs on target
	["buffsOnlyShowPlayer"] = false,													-- only show your buffs
	["RCheckIcon"] = true,																-- Show Ready Check Icons On Health Frames
	-- Portrait
	["showPortrait"] = true,															-- show portraits Icon
	["showPortraitHPbar"] = false,														-- show portraits on Healthbar, Icon must be turned off
	["portrait_type"] = "3D",															-- Type of portraits (3D, 2D, ICONS)
	-- Plugins
	["plugins_gcd"] = false,					-- Global cooldown spark on player frame
	["plugins_swing"] = false,					-- Swing bar
	["plugins_reputation_bar"] = false,			-- Reputation bar
	["plugins_experience_bar"] = false,			-- Experience bar
	["plugins_smooth_bar"] = false,				-- Smooth bar
	--["plugins_enemy_spec"] = false,				-- Enemy specialization
	["plugins_combat_feedback"] = false,		-- Combat text on player/target frame
	["plugins_fader"] = false,					-- Ø Fade unit frames
	--["plugins_diminishing"] = false,			-- Diminishing Returns icons on arena frames
	["plugins_debuffhighlight_icon"] = false,	-- Debuff highlight texture + icon
	["plugins_aura_watch"] = true,				-- Raid debuff icons (from the list)
	["plugins_aura_watch_timer"] = false,		-- Timer on raid debuff icons
	["plugins_pvp_debuffs"] = true,			-- Show also PvP debuff icons (from the list)
	["plugins_healcomm"] = true,				-- Show incoming heals in player and raid frames
	["plugins_auto_resurrection"] = false,		-- Auto cast resurrection on middle-click(doesn't work with Clique)
	-- Unit Size
	["Portrait_w"] = 56,
	["Portrait_h"] = 56,
	["Player_w"] = 245,
	["Player_h"] = 60,
	["Target_w"] = 245,
	["Target_h"] = 60,
	["Targettarget_w"] = 120,
	["Targettarget_h"] = 27,
	["Focus_w"] = 200,
	["Focus_h"] = 24,
	["Focustarget_w"] = 120,
	["Focustarget_h"] = 27,
	["Pet_w"] = 120,
	["Pet_h"] = 27,
	["PetTarget_w"] = 95, -- Not in use
	["PetTarget_h"] = 24, -- Not in use
	["Boss_w"] = 150,
	["Boss_h"] = 20,
	["Tank_w"] = 180,
	["Tank_h"] = 20,
	["TankH_w"] = 150,
	["TankH_h"] = 20,
	["Raid10H_w"] = 100,
	["Raid10H_h"] = 40,
	["Raid25H_w"] = 60,
	["Raid25H_h"] = 30,
	["Raid25_w"] = 45,
	["Raid25_h"] = 30,
	["Raid40H_w"] = 40,
	["Raid40H_h"] = 30,
	["Raid40_w"] = 40,
	["Raid40_h"] = 30,
	["Party_w"] = 100,
	["Party_h"] = 40,
	["Arena_w"] = 245,
	["Arena_h"] = 60,
	["CastbarPlayer_w"] = 0, -- Not in use
	["CastbarPlayer_h"] = 16,
	["CastbarTarget_w"] = 0, -- Not in use
	["CastbarTarget_h"] = 16,
	["CastbarArena_w"] = 0, -- Not in use
	["CastbarArena_h"] = 16,
	["CastbarBoss_w"] = 0, -- Not in use
	["CastbarBoss_h"] = 10,
	["CastbarFocus_w"] = 0, -- Not in use
	["CastbarFocus_h"] = 13,
}

----------------------------------------------------------------------------------------
--	Unit Frames Class bar options
----------------------------------------------------------------------------------------
C["unitframe_class_bar"] = {
	["combo"] = true,							-- Rogue/Druid Combo bar
	["combo_always"] = false,					-- Always show Combo bar for Druid
	["combo_old"] = false,						-- Show combo point on the target
	["arcane"] = true,							-- Arcane Charge bar
	["chi"] = true,								-- Chi bar
	["essence"] = true,							-- Essence bar	
	["stagger"] = true,							-- Stagger bar (for Monk Tanks)
	["holy"] = true,							-- Holy Power bar
	["shard"] = true,							-- Shard/Burning bar
	["rune"] = true,							-- Rune bar
	["totem"] = true,							-- Totem bar for Shaman
	["totem_other"] = true,						-- Totem bar for other classes
}

----------------------------------------------------------------------------------------
--	Raid Frames options
----------------------------------------------------------------------------------------
C["raidframes"] = {
	["enable"] = false,
	["scale"] = 1.0,
	["width"] = 101,
    ["height"] = 30,
	["width25"] = 60,
    ["height25"] = 30,
	["width40"] = 60,
    ["height40"] = 24,
    ["fontsize"] = 12,
    ["fontsizeEdge"] = 12,
    ["outline"] = "OUTLINE",
    ["solo"] = false,
    ["player"] = true,
    ["party"] = false,
    ["numCol"] = 5,
    ["numUnits"] = 5,
    ["spacing"] = 7,
    ["orientation"] = "HORIZONTAL",
    ["porientation"] = "HORIZONTAL",
    ["horizontal"] = true, 
    ["growth"] = "UP", 
    ["reversecolors"] = true,
    ["definecolors"] = true,
    ["powerbar"] = true,
    ["powerbarsize"] = 0.12,
    ["outsideRange"] = .40,
    ["healtext"] = true,
    ["healbar"] = true,
    ["healoverflow"] = true,
    ["healothersonly"] = false,
    ["healalpha"] = .40,
    ["roleicon"] = true,
	["showIndicators"] = true,
    ["indicatorsize"] = 6,
    ["symbolsize"] = 11,
    ["leadersize"] = 12,
	["autorez"] = true,
    ["aurasize"] = 18,
    ["multi"] = true, --Use multiple headers for better group sorting. Note: This disables units per group and sets it to 5.
    ["deficit"] = true,
	["multi2"] = true,
    ["perc"] = true,
    ["actual"] = true,
    ["myhealcolor"] = { 0, 1, 0.5, 0.4 },
    ["otherhealcolor"] = { 0, 1, 0, 0.4 },
    ["hpcolor"] = { 0.1, 0.1, 0.1, 1 },
    ["hpbgcolor"] = { 0.5, 0.5, 0.5, 1 },
    ["powercolor"] = { 1, 1, 1, 1 },
    ["powerbgcolor"] = { 0.33, 0.33, 0.33, 1 },
    ["powerdefinecolors"] = false,
    ["colorSmooth"] = false,
    ["gradient"] = { 1, 0, 0, 1 },
    ["tborder"] = true,
    ["fborder"] = true,
    ["afk"] = true,
    ["highlight"] = true,
    ["dispel"] = true,
    ["powerclass"] = true,
    ["tooltip"] = true,
    ["sortName"] = false,
    ["sortClass"] = false,
    ["classOrder"] = "DEATHKNIGHT,DRUID,HUNTER,MAGE,PALADIN,PRIEST,ROGUE,SHAMAN,WARLOCK,WARRIOR", --Uppercase English class names separated by a comma. \n { CLASS[,CLASS]... }"
    ["hidemenu"] = false,
}

----------------------------------------------------------------------------------------
--	Auras/Buffs/Debuffs options
----------------------------------------------------------------------------------------
C["aura"] = {
	["player_buff_size"] = 30,					-- Player buffs size
	["player_buff_mouseover"] = false,			-- Player buffs on mouseover
	["player_debuff_size"] = 44,				-- Player debuffs size
	["show_spiral"] = true,						-- Spiral on aura icons
	["show_timer"] = true,						-- Show cooldown timer on aura icons
	["player_auras"] = true,					-- Auras on player frame
	["target_auras"] = true,					-- Auras on target frame
	["focus_debuffs"] = false,					-- DeBuffs on focus frame
	["fot_debuffs"] = false,					-- DeBuffs on focustarget frame
	["pet_debuffs"] = false,					-- DeBuffs on pet frame
	["tot_debuffs"] = false,					-- DeBuffs on targettarget frame
	["boss_buffs"] = true,						-- Buffs on boss frame
	["player_aura_only"] = false,				-- Only your debuff on target frame
	["debuff_color_type"] = true,				-- Color debuff by type
	["cast_by"] = true,							-- Show who cast a buff/debuff in its tooltip
	["classcolor_border"] = false,				-- Enable classcolor border for player buffs
}

----------------------------------------------------------------------------------------
--	ActionBar options
----------------------------------------------------------------------------------------
C["actionbar"] = {
	-- Main
	["enable"] = true,							-- Enable actionbars
	["hotkey"] = true,							-- Show hotkey on buttons
	["macro"] = false,							-- Show macro name on buttons
	["show_grid"] = true,						-- Show empty action bar buttons
	["button_size"] = 25,						-- Buttons size
	["button_space"] = 3,						-- Buttons space
	["split_bars"] = false,						-- Split the fifth bar on two bars on 6 buttons
	["classcolor_border"] = false,				-- Enable classcolor border
	["hide_highlight"] = false,					-- Hide proc highlight
	["toggle_mode"] = true,						-- Enable toggle mode
	-- Bottom bars
	["bottombars"] = 2,							-- Number of action bars on the bottom (1, 2 or 3)
	["bottombars_mouseover"] = false,			-- Bottom bars on mouseover
	-- Right bars
	["rightbars"] = 3,							-- Number of action bars on right (0, 1, 2 or 3)
	["rightbars_mouseover"] = true,				-- Right bars on mouseover
	-- Pet bar
	["petbar_hide"] = false,					-- Hide pet bar
	["petbar_horizontal"] = false,				-- Enable horizontal pet bar
	["petbar_mouseover"] = false,				-- Pet bar on mouseover (only for horizontal pet bar)
	-- Stance bar
	["stancebar_hide"] = false,					-- Hide stance bar
	["stancebar_horizontal"] = true,			-- Enable horizontal stance bar
	["stancebar_mouseover"] = true,				-- Stance bar on mouseover (only for horizontal stance bar)
	["stancebar_mouseover_alpha"] = 0,			-- Stance bar mouseover alpha
	-- MicroMenu
	["micromenu"] = false,						-- Enable micro menu
	["micromenu_mouseover"] = false,			-- Micro menu on mouseover
	-- Bars editor
	["editor"] = false,							-- Allow to move and change each panel individually
	-- Bar 1
	["bar1_num"] = 12,							-- Number of buttons
	["bar1_row"] = 12,							-- Buttons per row
	["bar1_size"] = 25,							-- Buttons size
	["bar1_mouseover"] = false,					-- Bar on mouseover
	-- Bar 2
	["bar2_num"] = 12,							-- Number of buttons
	["bar2_row"] = 12,							-- Buttons per row
	["bar2_size"] = 25,							-- Buttons size
	["bar2_mouseover"] = false,					-- Bar on mouseover
	-- Bar 3
	["bar3_num"] = 12,							-- Number of buttons
	["bar3_row"] = 1,							-- Buttons per row
	["bar3_size"] = 25,							-- Buttons size
	["bar3_mouseover"] = false,					-- Bar on mouseover
	-- Bar 4
	["bar4_num"] = 12,							-- Number of buttons
	["bar4_row"] = 1,							-- Buttons per row
	["bar4_size"] = 25,							-- Buttons size
	["bar4_mouseover"] = false,					-- Bar on mouseover
	-- Bar 5
	["bar5_num"] = 12,							-- Number of buttons
	["bar5_row"] = 12,							-- Buttons per row
	["bar5_size"] = 25,							-- Buttons size
	["bar5_mouseover"] = false,					-- Bar on mouseover
	-- Bar 6
	["bar6_num"] = 12,							-- Number of buttons
	["bar6_row"] = 1,							-- Buttons per row
	["bar6_size"] = 25,							-- Buttons size
	["bar6_mouseover"] = false,					-- Bar on mouseover
	-- Bar 7
	["bar7_enable"] = false,					-- Enable custom bar 7
	["bar7_num"] = 12,							-- Number of buttons
	["bar7_row"] = 12,							-- Buttons per row
	["bar7_size"] = 25,							-- Buttons size
	["bar7_mouseover"] = false,					-- Bar on mouseover
	-- Bar 8
	["bar8_enable"] = false,					-- Enable custom bar 8
	["bar8_num"] = 12,							-- Number of buttons
	["bar8_row"] = 12,							-- Buttons per row
	["bar8_size"] = 25,							-- Buttons size
	["bar8_mouseover"] = false,					-- Bar on mouseover
}

----------------------------------------------------------------------------------------
--	Tooltip options
----------------------------------------------------------------------------------------
C["tooltip"] = {
	["enable"] = true,							-- Enable tooltip
	["shift_modifer"] = false,					-- Show tooltip when Shift is pushed
	["cursor"] = false,							-- Tooltip above cursor
	["item_icon"] = false,						-- Item icon in tooltip
	["health_value"] = false,					-- Numeral health value
	["hidebuttons"] = false,					-- Hide tooltip for actions bars
	["hide_combat"] = false,					-- Hide tooltip in combat
	-- Plugins
	["title"] = true,							-- Player title in tooltip
	["realm"] = true,							-- Player realm name in tooltip
	["rank"] = true,							-- Player guild-rank in tooltip
	["target"] = true,							-- Target player in tooltip
	["average_lvl"] = true,						-- Average items level
	["show_shift"] = false,						-- Show items level and spec when Shift is pushed
	["raid_icon"] = false,						-- Raid icon
	["unit_role"] = true,						-- Unit role in tooltip
	["who_targetting"] = true,					-- Show who is targetting the unit (in raid or party)
	["spell_id"] = true,						-- Id number spells (/si to print buff info in chat)
	["item_count"] = true,						-- Item count in bags and bank
	["achievements"] = true,					-- Comparing achievements in tooltip
	["instance_lock"] = true,					-- Your instance lock status in tooltip
	["mount"] = true,							-- Show source of mount
	["npc_id"] = false,							-- Show npc id
	["npc_tip"] = true,							-- Show Tips for important NPC in dungeons
	["DungeonScore"] = true,					-- Show Players Dungeon Score
	--Ancher
	["bottomleft"] = false, 					-- Anchor to BottomLeft
	["bottomright"] = false, 					-- Anchor to Bottomright
	["topright"] = false, 						-- Anchor to Top Right
	["topleft"] = true, 						-- Anchor to Top Left
}

----------------------------------------------------------------------------------------
--	Chat options
----------------------------------------------------------------------------------------
C["chat"] = {
	["enable"] = true,							-- Enable chat
	["width"] = C.panels.CPwidth - 4,			-- Chat width
	["height"] = C.panels.CPTextheight,			-- Chat height
	["second_frame"] = false,					-- Enable second frame on right side
	["background"] = true,						-- Enable background for chat
	["background_alpha"] = 0.4,					-- Background alpha
	["filter"] = true,							-- Removing some systems spam("Player1" won duel "Player2")
	["spam"] = false,							-- Removing some players spam(gold/portals/etc)
	["chat_bar"] = false,						-- Lite Button Bar for switch chat channel
	["chat_bar_mouseover"] = false,				-- Lite Button Bar on mouseover
	["whisp_sound"] = true,						-- Sound when whisper
	["combatlog"] = true,						-- Show CombatLog tab(need two reloads when false)
	["tabs_mouseover"] = false,					-- Chat tabs on mouseover
	["sticky"] = true,							-- Remember last channel
	["damage_meter_spam"] = true,				-- Merge damage meter spam in one line-link
	["smileys"] = true,							-- Insert smileys instead of symbols like xD
	["loot_icons"] = false,						-- Icons for loot
	["role_icons"] = false,						-- Role Icons
	["history"] = false,						-- Chat history
	["hide_combat"] = false,					-- Hide chat in combat
	["custom_time_color"] = true,				-- Enable custom timestamp coloring
	["time_color"] = {1, 1, 0},					-- Timestamp coloring (http://www.december.com/html/spec/colorcodescompact.html)
	["reset_pos"] = true,						-- Reposition chatframes at login
}

----------------------------------------------------------------------------------------
--	Nameplate options
----------------------------------------------------------------------------------------
C["nameplate"] = {
	["enable"] = true, 							-- Enable nameplate
	["height"] = 9,								-- Nameplate height
	["width"] = 120,							-- Nameplate width
	["alpha"] = 0.75,							-- Nameplate alpha
	["distance"] = 40,							-- Show nameplates for units within this range
	["ad_height"] = 8,							-- Additional height for selected nameplate
	["ad_width"] = 10,							-- Additional width for selected nameplate
	["combat"] = false,							-- Automatically show nameplate in combat
	["health_value"] = false,					-- Numeral health value
	["show_castbar_name"] = false,				-- Show castbar name
	["class_icons"] = false,					-- Icons by class in PvP
	["name_abbrev"] = false,					-- Display abbreviated names
	["clamp"] = true,							-- Clamp nameplates to the top of the screen when outside of view
	["track_debuffs"] = true,					-- Show your debuffs (from the list)
	["track_buffs"] = true,						-- Show dispellable enemy buffs and buffs from the list
	["auras_size"] = 25,						-- Auras size
	["healer_icon"] = false,					-- Show icon above enemy healers nameplate in battlegrounds
	["totem_icons"] = false,					-- Show icon above enemy totems nameplate
	["quests"] = true,							-- Show quest icon next to nameplate (Lags with many nameplates visible)
	["npc_colors"] = true,						-- Show Custom colored icon for important NPC in dungeons and raid
	["target_glow"] = true,						-- Show glow texture for target
	["target_arrow"] = true,					-- Show target Arrow
	["only_name"] = false,						-- Show only name for friendly units
	["low_health"] = false,						-- Show red border when low health
	["low_health_value"] = 0.2,					-- Value for low health (between 0.1 and 1)
	["low_health_color"] = {0.8, 0, 0},			-- Color for low health border
	["cast_color"] = false,						-- Show color border for casting important spells
	["kick_color"] = false,						-- Change cast color if interrupt on cd
	-- Threat
	["enhance_threat"] = true,					-- Enable threat feature, automatically changes by your role
	["good_color"] = {0.2, 0.8, 0.2},			-- Good threat color
	["near_color"] = {1, 1, 0},					-- Near threat color
	["bad_color"] = {1, 0, 0},					-- Bad threat color
	["offtank_color"] = {0, 0.5, 1},			-- Offtank threat color
	["priority_color"] = {.07, .26, .69},		-- Nameplate color for High priority Targets
	["semipri_color"] = {.2, .53, .92},			-- Nameplate color for Semi priority Targets
	["nuke_color"] = {.11, .86, .36},			-- Nameplate color for Nuke Targets
	["t3mobs_color"] = {1, .62, .53},			-- Nameplate color for T3 mobs
	["tides_color"] = {.48, .17, .75},			-- Nameplate color for Void Mobs (m+ affix)
	["explosive_color"] = {1, .36, .15},		-- Nameplate color for Explosive (m+ affix)
	["pvpstuff_color"] = {.85, .17, .22},		-- Nameplate color for pvp stuff	
	["targetarrow_color"] = {0, 1, 1},			-- Color for Target Arrow
	["targetglow_color"] = {0, 1, 1},			-- Color for Target Glow	
}

----------------------------------------------------------------------------------------
--	Combat text options
----------------------------------------------------------------------------------------
C["combattext"] = {
	["enable"] = true,							-- Global enable combat text
	["blizz_head_numbers"] = false,				-- Use blizzard damage/healing output (above mob/player head)
	["damage_style"] = true,					-- Change default damage/healing font above mobs/player heads (you need to restart WoW to see changes)
	["damage"] = true,							-- Show outgoing damage
	["pet_damage"] = true,						-- Show your pet damage
	["dot_damage"] = true,						-- Show damage from your dots
	["healing"] = true,							-- Show outgoing healing
	["show_hots"] = true,						-- Show periodic healing effects in healing frame
	["show_overhealing"] = true,				-- Show outgoing overhealing
	["incoming"] = true,						-- Show incoming damage and healing
	["damage_color"] = true,					-- Display damage numbers depending on school of magic
	["dispel"] = true,							-- Tells you about your dispels (works only with ["damage"] = true)
	["interrupt"] = true,						-- Tells you about your interrupts (works only with ["damage"] = true)
	["icons"] = true,							-- Show outgoing damage icons
	["icon_size"] = 16,							-- Icon size of spells in outgoing damage frame, also has effect on dmg font size
	["max_lines"] = 15,							-- Max lines to keep in scrollable mode (more lines = more memory)
	["time_visible"] = 3,						-- Time (seconds) a single message will be visible
	["short_numbers"] = true,					-- Use short numbers ("25.3k" instead of "25342")
	["merge_aoe_spam"] = true,					-- Merges multiple aoe damage/heal spam into single message
	["merge_melee"] = true,						-- Merges multiple auto attack damage spam
	["merge_all"] = false,						-- Merges all spells
	["direction"] = false,						-- Reverse scrolling direction from top to bottom
	["dk_runes"] = true,						-- Show Death Knight rune recharge
	["killingblow"] = false,					-- Tells you about your killingblows (works only with ["damage"] = true)
	["scrollable"] = false,						-- Allows you to scroll frame lines with mousewheel
	["crit_prefix"] = "*",						-- Symbol that will be added before crit
	["crit_postfix"] = "*",						-- Symbol that will be added after crit
	["treshold"] = 1,							-- Minimum damage to show in damage frame
	["heal_treshold"] = 1,						-- Minimum healing to show in incoming/outgoing healing messages
}

----------------------------------------------------------------------------------------
--	Bag options
----------------------------------------------------------------------------------------
C["bag"] = {
	["enable"] = true,							-- Enable bags
	["ilvl"] = true,							-- Show item level
	["new_items"] = true,						-- Show animation for new items
	["filter"] = true,							-- Always show filter buttons
	["BagBars"] = false,
	["SortTop"] = true,							-- Sort from top down
	["button_size"] = 27,						-- Buttons size
	["button_space"] = 3,						-- Buttons space
	["bank_columns"] = 17,						-- Horizontal number of columns in bank
	["bag_columns"] = 10,						-- Horizontal number of columns in main bag
	["bag_buttons"] = true,						-- Show sort/deposit/Artifact buttons
}

----------------------------------------------------------------------------------------
--	Loot and Roll Frames
----------------------------------------------------------------------------------------
C["loot"] = {
	["lootframe"] = true,						-- Enable loot frame
	["rolllootframe"] = true,					-- Enable group roll frame
	["icon_size"] = 22,							-- Icon size
	["width"] = 221,							-- Loot window width
	["auto_greed"] = false,						-- Push "greed" or "disenchant" button for green item roll at max level
	["auto_confirm_de"] = true,					-- Auto confirm disenchant and take BoP loot
	["faster_loot"] = false,					-- Faster auto looting
}

----------------------------------------------------------------------------------------
--	Filger options
----------------------------------------------------------------------------------------
C["filger"] = {
	["enable"] = true,							-- Enable Filger
	["show_tooltip"] = false,					-- Show tooltip
	["expiration"] = false,						-- Sort cooldowns by expiration time
	-- Elements
	["show_buff"] = true,						-- Player buffs
	["show_proc"] = true,						-- Player procs
	["show_debuff"] = true,						-- Debuffs on target
	["show_aura_bar"] = true,					-- Aura bars on target
	["show_special"] = true,					-- Special buffs on player
	["show_pvp_player"] = true,					-- PvP debuffs on player
	["show_pvp_target"] = true,					-- PvP auras on target
	["show_cd"] = true,							-- Cooldowns
	-- Icons size
	["buffs_size"] = 37,						-- Buffs size
	["buffs_space"] = 3,						-- Buffs space
	["pvp_size"] = 60,							-- PvP auras size
	["pvp_space"] = 3,							-- PvP auras space
	["cooldown_size"] = 30,						-- Cooldowns size
	["cooldown_space"] = 3,						-- Cooldowns space
	-- Testing
	["test_mode"] = false,						-- Test icon mode
	["max_test_icon"] = 5,						-- Number of icons to the test
}

----------------------------------------------------------------------------------------
--	Announcements options
----------------------------------------------------------------------------------------
C["announcements"] = {
	["drinking"] = true,						-- Announce when arena enemy is drinking
	["interrupts"] = true,						-- Announce when you interrupt
	["spells"] = true,							-- Announce when you cast some spell
	["spells_from_all"] = false,				-- Check spells cast from all members
	["toys"] = false,							-- Announce some toys
	["pull_countdown"] = true,					-- Pull countdown announce(/pc #)
	["flask_food"] = false,						-- Announce the usage of flasks and food
	["flask_food_auto"] = false,				-- Auto announce when ReadyCheck(if enable, announce to raid channel)
	["flask_food_raid"] = false,				-- Announce to raid channel
	["feasts"] = true,							-- Announce Feasts/Souls/Repair Bots cast
	["portals"] = true,							-- Announce Portals/Ritual of Summoning cast
	["bad_gear"] = true,						-- Check bad gear in instance
	["safari_hat"] = true,						-- Check Safari Hat
}

----------------------------------------------------------------------------------------
--	Automation options
----------------------------------------------------------------------------------------
C["automation"] = {
	["release"] = true,							-- Auto release the spirit in battlegrounds
	["screenshot"] = false,						-- Take screenshot when player get achievement
	["solve_artifact"] = true,					-- Auto popup for solve artifact
	["accept_invite"] = false,					-- Auto accept invite
	["decline_duel"] = true,					-- Auto decline duel (/disduel to temporarily disable)
	["skip_cinematic"] = false,					-- Auto skip cinematics/movies
	["auto_role"] = false,						-- Auto set your role
	["cancel_bad_buffs"] = false,				-- Auto cancel various buffs
	["tab_binder"] = true,						-- Auto change Tab key to only target enemy players
	["logging_combat"] = false,					-- Auto enables combat log text file in raid instances
	["currency_cap"] = true,					-- Auto popup for currency cap
	["buff_on_scroll"] = false,					-- Cast buff on mouse scroll
	["vendor"] = true,							-- Auto sell grey items
	["vendor_misc"] = true,						-- Sell some defined (craps not grey) items automatically
	["AutoRepair"] = true,						-- automaticly repair?
	["AutoRepairG"] = true,						-- automaticly repair and Use guild funds?
	["open_items"] = true,						-- Auto opening of items in bag
	["resurrection"] = false,					-- Auto confirm resurrection
	["summon"] = false,							-- Auto confirm summon after 10 sec
	["whisper_invite"] = false,					-- Auto invite when whisper keyword
	["invite_keyword"] = "inv +",				-- List of keyword (separated by space)
}

----------------------------------------------------------------------------------------
--	Buffs reminder options
----------------------------------------------------------------------------------------
C["reminder"] = {
	-- Self buffs
	["solo_buffs_enable"] = true,				-- Enable buff reminder
	["solo_buffs_sound"] = false,				-- Enable warning sound notification for buff reminder
	["solo_buffs_size"] = 45,					-- Icon size
	-- Raid buffs
	["raid_buffs_enable"] = true,				-- Show missing raid buffs
	["raid_buffs_always"] = false,				-- Show frame always (default show only in raid)
	["raid_buffs_classcolor"] = false,			-- Enable classcolor border
	["raid_buffs_size"] = 19.2,					-- Icon size
	["raid_buffs_alpha"] = 0,					-- Transparent icons when the buff is present
}

----------------------------------------------------------------------------------------
--	Raid cooldowns options
----------------------------------------------------------------------------------------
C["raidcooldown"] = {
	["enable"] = true,							-- Enable raid cooldowns
	["height"] = 15,							-- Bars height
	["width"] = 186,							-- Bars width(if show_icon = false, bar width+28)
	["upwards"] = true,						-- Sort upwards bars
	["expiration"] = false,						-- Sort by expiration time
	["show_self"] = true,						-- Show self cooldowns
	["show_icon"] = true,						-- Show icons
	["show_inraid"] = true,						-- Show in raid zone
	["show_inparty"] = true,					-- Show in party zone
	["show_inarena"] = true,					-- Show in arena zone
}

----------------------------------------------------------------------------------------
--	Enemy cooldowns options
----------------------------------------------------------------------------------------
C["enemycooldown"] = {
	["enable"] = true,							-- Enable enemy cooldowns
	["size"] = 30,								-- Icon size
	["direction"] = "RIGHT",					-- Icon direction
	["show_always"] = false,					-- Show everywhere
	["show_inpvp"] = false,						-- Show in bg zone
	["show_inarena"] = true,					-- Show in arena zone
	["show_inparty"] = false,					-- Show in party zone for allies
	["class_color"] = false,					-- Enable classcolor border
}

----------------------------------------------------------------------------------------
--	Pulse cooldowns options
----------------------------------------------------------------------------------------
C["pulsecooldown"] = {
	["enable"] = false,							-- Show cooldowns pulse
	["size"] = 75,								-- Icon size
	["sound"] = false,							-- Warning sound notification
	["anim_scale"] = 1.5,						-- Animation scaling
	["hold_time"] = 0,							-- Max opacity hold time
	["threshold"] = 3,							-- Minimal threshold time
	["whitelist"] = false,						-- Use whitelist instead of ignore list
}

----------------------------------------------------------------------------------------
--	Threat options
----------------------------------------------------------------------------------------
C["threat"] = {
	["enable"] = false,							-- Enable threat meter
	["height"] = 12,							-- Bars height
	["width"] = 217,							-- Bars width
	["bar_rows"] = 7,							-- Number of bars
	["hide_solo"] = false,						-- Show only in party/raid
}

----------------------------------------------------------------------------------------
--	Panel options (The datatext that is hidden on top with mouseover)
----------------------------------------------------------------------------------------
C["toppanel"] = {
	["enable"] = false,							-- Enable top panel
	["mouseover"] = true,						-- Top panel on mouseover
	["height"] = 35,							-- Panel height
	["width"] = 250,							-- Panel width
}

----------------------------------------------------------------------------------------
--	Stats options
----------------------------------------------------------------------------------------
C["stats"] = {
	["battleground"] = true,					-- BG Score
	["damage"] = false,							-- Show damage per second
	["clock"] = false,							-- Clock
	["latency"] = false,						-- Latency
	["memory"] = false,							-- Memory
	["fps"] = false,							-- FPS
	["friend"] = false,							-- Friends
	["guild"] = false,							-- Guild
	["durability"] = false,						-- Durability
	["experience"] = true,						-- Experience
	["coords"] = false,							-- Coords
	["location"] = false,						-- Location
	["currency"] = true,						-- Currency
	["CurrArchaeology"] = false,				-- Show Archaeology under currency tab
	["CurrCooking"] = false,					-- Show Coocking under currency tab
	["CurrProfessions"] = false,				-- Show Professions under currency tab
	["CurrRaid"] = true,						-- Show Seals under currency tab
	["CurrPvP"] = false,						-- Show PvP under currency tab
	["CurrMiscellaneous"] = true,				-- Show Miscellaneous under currency tab
}

----------------------------------------------------------------------------------------
--	Trade options
----------------------------------------------------------------------------------------
C["trade"] = {
	["profession_tabs"] = true,					-- Professions tabs on TradeSkill frames
	["already_known"] = true,					-- Colorizes recipes/mounts/pets/toys that is already known
	["disenchanting"] = true,					-- Milling, Prospecting and Disenchanting by Alt + click
	["enchantment_scroll"] = true,				-- Enchantment scroll on TradeSkill frame
	["sum_buyouts"] = false,					-- Sum up all current auctions
	["archaeology"] = false,					-- Archaeology tracker ('/arch' or right mouseover minimap button to show)
	["merchant_itemlevel"] = false,				-- Show item level for weapons and armor in merchant
}

----------------------------------------------------------------------------------------
--	Datatext
----------------------------------------------------------------------------------------
C["datatext"] = {
	["Arena"] = 0, 
	["Armor"] = 0,                          -- show your armor value against the level mob you are currently targeting	
	["RunSpeed"] = 3,                  		-- show your current Run Speed
	["Avd"] = 0,                            -- show your current avoidance against the level of the mob your targeting
	["Bags"] = 5,                			-- show space used in bags on panels
	["Battleground"] = true,                -- enable 3 stats in battleground only that replace stat1,stat2,stat3.
	["Crit"] = 0,                           -- show your crit rating on panels.
	["Durability"] = 6,                		-- show your equipment durability on panels.
	["Friends"] = 9,                		-- show number of friends connected.
	["Gold"] = 4,                			-- show your current gold on panels
	["Guild"] = 11,                			-- show number on guildmate connected on panels
	["Haste"] = 2,                          -- show your haste rating on panels.
	["Versatility"] = 0,                    -- show versatility
	["location"] = 10,                      -- show location
	["showcoords"] = true,                  -- show coordinates on location
	["Mastery"] = 0,                        -- show mastery rating
	["Power"] = 1,                          -- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	["Regen"] = 0,  						-- show mana regeneration
	["System"] = 7,                			-- show fps and ms on panels, and total addon memory in tooltip
	["fps_ms"] = true,                		-- show fps and ms only
	["Talents"] = 13,                       -- Show Your Talent's. Shift Click to change spec. 
	["Profession"] = 17,  			  		-- Profession
	["togglemenu"] = 0,  			  		-- minimenu
	["Volume"] = 12,  			  			-- Volume
	["Wowtime"] = 14,              			-- THIS IS BLOCKED TO FIXED POSITION! SO CAN'T BE CHANGED HERE! NUMBER MUST BE > 0, BUT DOESN'T USE UP A SPOT!
	["Time24"] = true,            			-- set time to 24h format.
	["Localtime"] = true,  					-- Show Local time instead of server time
	["classcolor"] = true,
	["color"] = { .7, .7, .7, 1 }, 			-- if ["classcolor"] = false
	["CurrArchaeology"] = false,
	["CurrCooking"] = false,
	["CurrProfessions"] = false,
	["CurrMiscellaneous"] = true, 
	["CurrPvP"] = true,
	["CurrRaid"] = false,
	["Quests"] = 15,
	["Bfamissions"] = 8,
}

----------------------------------------------------------------------------------------
--	Cooldown Timer for Actionbars
----------------------------------------------------------------------------------------
C["cooldown"] = {
	["enable"] = true,                     
}
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

C["togglemenu"] = {
	["enable"] = true,
	["buttonwidth"] = 98,					-- Width of menu buttons
	["buttonheight"] = 18,					-- Height of menu buttons
	["classcolor"] = true,					-- Class color buttons
}

----------------------------------------------------------------------------------------
--	Position options
--	BACKUP THIS FILE BEFORE UPDATING!
----------------------------------------------------------------------------------------

-- pet action icons
PET_DEFENSIVE_TEXTURE = [[Interface\AddOns\ViksUI\Media\Textures\icon_defensive]]
PET_ASSIST_TEXTURE = [[Interface\AddOns\ViksUI\Media\Textures\icon_aggressive]]
PET_PASSIVE_TEXTURE = [[Interface\AddOns\ViksUI\Media\Textures\icon_passive]]
PET_ATTACK_TEXTURE = [[Interface\AddOns\ViksUI\Media\Textures\icon_attack]]
PET_FOLLOW_TEXTURE = [[Interface\AddOns\ViksUI\Media\Textures\icon_follow]]
PET_WAIT_TEXTURE = [[Interface\AddOns\ViksUI\Media\Textures\icon_wait]]
PET_MOVE_TO_TEXTURE = [[Interface\AddOns\ViksUI\Media\Textures\icon_moveto]]

SLASH_RELOADUI1 = "/rl"
SLASH_RELOADUI2 = "/reloadui"
SlashCmdList.RELOADUI = ReloadUI
C["experiencebar"] = {
	--["ViksUIExperienceBar1"] = "XP",
	--["ViksUIExperienceBar2"] = "HONOR",
}
C["spacer"] = {} -- Just spacer for config menu
--------------------------------------------------------------------------------
--	WORKING ON! Do NOT turn anything on!
----------------------------------------------------------------------------------------
C["WorkTemp"] = {
	["show_arena"] = true,	
	["class_bar_range"] = true,	
	["vengeance"] = true,	
}
