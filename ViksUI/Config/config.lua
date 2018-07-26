local T, C, L, _ = unpack(select(2, ...))


local _, class = UnitClass("player")
local rv, gv, bv = 0, .38, .651

----------------------------------------------------------------------------------------
--	Media
----------------------------------------------------------------------------------------
C["media"] = {
	["normal_font"] = [=[Interface\Addons\ViksUI\Media\Font\normal_font.ttf]=], 			    -- main font in Viks UI
	["blank_font"] = [[Interface\AddOns\ViksUI\Media\Font\Blank.ttf]],					-- Blank font
	["fontcombat"] = [=[Interface\Addons\ViksUI\Media\Font\LinkinPark.ttf]=], 			-- Combat Text Font (Require Game Restart)
	["pixel_font"] = [=[Interface\Addons\ViksUI\Media\Font\pixel.ttf]=], 				-- DataText Font Normal
	["pxfontHeader"] = "Interface\\Addons\\ViksUI\\Media\\Font\\LinkinPark.ttf", 		-- DataText Font for Headers. Used on Top Line
	["pixel_font_style"] = "OUTLINEMONOCHROME", 										-- Normal Text Flags like: "OVERLAY", "OUTLINE", "THINOUTLINE", "THICKOUTLINE" and "MONOCHROME"
	["pxfontHFlag"] = "NONE", 															-- Normal Text Flags like: "OVERLAY", "OUTLINE", "THINOUTLINE", "THICKOUTLINE" and "MONOCHROME"
	["pixel_font_size"] = 14, 															-- Size of font Datatext
	["pxfontHsize"] = 13, 																-- Size of font Datatext
	["fontsize"] = 12, 														    		-- Size of font 
	["border_color"] = { 0, .38, .651, 1}, 												-- border color of Viks UI panels
	["backdrop_color"] = {.06,.06,.06, 1}, 												-- background color of Viks UI panels
	["overlay_color"] = {0, 0, 0, 0.9},													-- Color for action bars overlay
	["texture"] = [[Interface\AddOns\ViksUI\Media\textures\Texture.tga]],
	["blank"] = "Interface\\Buttons\\WHITE8x8",
	["blank_border"] = "Interface\\Buttons\\WHITE8x8",			-- Texture for borders			-- Texture for status bars
	["highlight"] = [[Interface\AddOns\ViksUI\Media\textures\Highlight]],			-- Texture for debuffs highlight
	["pxcolor1"] = { .001,.38,.651,1 },													-- Color for Name on Datatext
	["pxcolor2"] = { .41,.80,.94,1 },													-- Color for Value on Datatext if not dynamic color by value
	["oUFfont"] = [=[Interface\\Addons\\ViksUI\\Media\\Font\\ROADWAY.ttf]=], 				-- DataText Font Normal
	["oUFfontsize"] = 12, 																-- Size of font Datatext
	["oUFfontcolor"] = { .07, .7, .3, 1}, 												-- Font color used when class colored bars
	["whisp_sound"] = [[Interface\AddOns\ViksUI\Media\sounds\Whisper.ogg]],				-- Sound for wispers
	["warning_sound"] = [[Interface\AddOns\ViksUI\Media\sounds\Warning.ogg]],			-- Sound for warning
	["proc_sound"] = [[Interface\AddOns\ViksUI\Media\sounds\Proc.ogg]],					-- Sound for procs
}

----------------------------------------------------------------------------------------
--	General
----------------------------------------------------------------------------------------
C["general"] = {
	["auto_scale"] = true,						-- Autoscale
	["uiscale"] = 0.96,							-- Your value(between 0.64 and 1) if "auto_scale" is disable
	["welcome_message"] = true,					-- Enable welcome message in chat
	["custom_lagtolerance"] = false,			-- Custom lag tolerance to your latency
}

----------------------------------------------------------------------------------------
--	Miscellaneous options
----------------------------------------------------------------------------------------
C["misc"] = {
	["shift_marking"] = true,					-- Marks target when you push "shift"
	["invite_keyword"] = "invite",				-- Short keyword for invite(for enable - in game type /ainv)
	["afk_spin_camera"] = true,					-- Spin camera while afk
	["afk_spin_camera_anim"] = 69,				-- Spin camera modell animation
	["vehicle_mouseover"] = false,				-- Vehicle frame on mouseover
	["quest_auto_button"] = true,				-- Quest auto button
	["raid_tools"] = true,						-- Raid tools
	["profession_tabs"] = true,					-- Professions tabs on TradeSkill frames
	["hide_bg_spam"] = true,					-- Remove Boss Emote spam during BG("Arathi Basin" and "The Battle for Gilneas")
	["item_level"] = true,						-- Item level on character slot buttons
	["already_known"] = true,					-- Colorizes recipes/mounts/pets that is already known
	["disenchanting"] = true,					-- One-click Milling, Prospecting and Disenchanting
	["sum_buyouts"] = true,						-- Sum up all current auctions
	["click_cast"] = true,						-- Simple click2cast spell binder
	["click_cast_filter"] = false,				-- Ignore Player and Target frames for click2cast
	["move_blizzard"] = true,					-- Move some Blizzard frames
	["color_picker"] = true,					-- Improved ColorPicker
	["enchantment_scroll"] = true,				-- Enchantment scroll on TradeSkill frame
	["archaeology"] = true,						-- Archaeology artifacts and cooldown
	["chars_currency"] = true,					-- Tracks your currency tokens across multiple characters
	["markbar"] = true,							-- Markbar for Raid Icons and flares
	["classtimer"] = true,						-- Shows buff/debuffs/procs as bar on player/target frame
	["CooldownFlash"] = false,					-- Flash icon on screen when spell are ready after cd
	["raidcooldowns"] = true,					-- Shows and tracks cooldowns used from raid members
	["WatchFrame"] = true,						-- Use custom Quest watch frame
	["MMBFbutton"] = true,						-- Minimap Button Frame Custom toggle button
	["BT4Bars"] = true,
	["Pscale"] = 1,
	["panelsh"] = true,
	["Threatbar"] = false,						-- Custom Threath Bar, that show on bar under main actionbars.
	["merchant_itemlevel"] = false,				-- Show item level for weapons and armor in merchant
	["combatanimation"] = true,					-- Text animation when entering/exiting combat
	["hide_banner"] = true,						-- Hide Boss Banner Loot Frame
	["hide_talking_head"] = false,				-- Hide Talking Head Frame
	["OrderHallBar"] = false,					-- Show OrderHallBar Frame
}

----------------------------------------------------------------------------------------
--	Announcements options
----------------------------------------------------------------------------------------
C["announcements"] = {
	["drinking"] = true,						-- Announce when arena enemy is drinking
	["interrupts"] = false,						-- Announce when you interrupt
	["spells"] = false,							-- Announce when you cast some spell
	["spells_from_all"] = false,				-- Check spells cast from all members
	["toys"] = false,							-- Announce some toys
	["says_thanks"] = false,					-- Says thanks for some spells
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
	["screenshot"] = true,						-- Take screenshot when player get achievement
	["solve_artifact"] = true,					-- Auto popup for solve artifact
	["accept_invite"] = false,					-- Auto accept invite
	["decline_duel"] = true,					-- Auto decline duel
	["accept_quest"] = true,					-- Auto accept quests(if hold shift or alt, auto accept is disable)
	["auto_collapse"] = true,					-- Auto collapse WatchFrame in instance
	["skip_cinematic"] = false,					-- Auto skip cinematics/movies
	["auto_role"] = true,						-- Auto set your role
	["cancel_bad_buffs"] = false,				-- Auto cancel various buffs
	["tab_binder"] = true,						-- Auto change Tab key to only target enemy players
	["logging_combat"] = false,					-- Auto enables combat log text file in raid instances
	["currency_cap"] = true,					-- Auto popup for currency cap
	["buff_on_scroll"] = false,					-- Cast buff on mouse scroll
	["vendor"] = true,							-- Auto sell grey items
	["AutoRepair"] = true,						-- automaticly repair?
	["AutoRepairG"] = true,						-- automaticly repair and Use guild funds?
	["open_items"] = false,						-- Auto opening of items in bag
}

----------------------------------------------------------------------------------------
--	Skins options
----------------------------------------------------------------------------------------
C["skins"] = {
	["blizzard_frames"] = true,					-- Blizzard frames skin
	["minimap_buttons"] = true,				-- Skin addons icons on minimap
	["clcprot"] = false,						-- CLCProt skin
	["clcret"] = false,							-- CLCRet skin
	["combustion_helper"] = false,				-- CombustionHelper skin
	["bigwigs"] = false,						-- BigWigs skin
	["dbm"] = true,								-- DBM skin
	["dbm_movable"] = false,					-- Allow to move DBM bars
	["dxe"] = false,							-- DXE skin
	["omen"] = false,							-- Omen skin
	["recount"] = false,						-- Recount skin
	["blood_shield_tracker"] = false,			-- BloodShieldTracker skin
	["dominos"] = false,						-- Dominos skin
	["flyout_button"] = false,					-- FlyoutButtonCustom skin
	["nug_running"] = false,					-- NugRunning skin
	["ovale"] = false,							-- OvaleSpellPriority skin
	["clique"] = false,							-- Clique skin
	["ace3"] = false,							-- Ace3 options elements skin
	["bartender"] = false,						-- Bartender elements skin
	["pallypower"] = false,						-- PallyPower skin
	["capping"] = false,						-- Capping skin
	["cool_line"] = false,						-- CoolLine skin
	["atlasloot"] = false,						-- AtlasLoot skin
	["tiny_dps"] = false,						-- TinyDPS skin
	["face_shooter"] = false,					-- FaceShooter skin
	["mage_nuggets"] = false,					-- MageNuggets skin
	["npcscan"] = false,						-- NPCScan skin
	["vanaskos"] = false,						-- VanasKoS skin
	["weak_auras"] = false,						-- WeakAuras skin
	["skada"] = true,							-- Skada skin
	["my_role_play"] = false,					-- MyRolePlay skin
	["ExtraActionBarFrame"] = true, 			-- Skinn ExtraActionBarFrame with Masque
	["arh"] = false,							-- Archaeology Helper skin
	["postal"] = false,							-- Postal skin
	["opie"] = false,							-- OPie skin
	["rematch"] = false,						-- Rematch skin
	["ls_toasts"] = false,						-- Is: Toasts skin
}

----------------------------------------------------------------------------------------
--	Combat text options
----------------------------------------------------------------------------------------
C["combattext"] = {
	["enable"] = true,							-- Global enable combat text
	["blizz_head_numbers"] = false,				-- Use blizzard damage/healing output(above mob/player head)
	["damage_style"] = true,					-- Change default damage/healing font above mobs/player heads(you need to restart WoW to see changes)
	["damage"] = true,							-- Show outgoing damage in it's own frame
	["healing"] = true,							-- Show outgoing healing in it's own frame
	["show_hots"] = true,						-- Show periodic healing effects in healing frame
	["show_overhealing"] = true,				-- Show outgoing overhealing
	["pet_damage"] = true,						-- Show your pet damage
	["dot_damage"] = true,						-- Show damage from your dots
	["damage_color"] = true,					-- Display damage numbers depending on school of magic
	["crit_prefix"] = "*",						-- Symbol that will be added before crit
	["crit_postfix"] = "*",						-- Symbol that will be added after crit
	["icons"] = true,							-- Show outgoing damage icons
	["icon_size"] = 16,							-- Icon size of spells in outgoing damage frame, also has effect on dmg font size
	["treshold"] = 1,							-- Minimum damage to show in damage frame
	["heal_treshold"] = 1,						-- Minimum healing to show in incoming/outgoing healing messages
	["scrollable"] = false,						-- Allows you to scroll frame lines with mousewheel
	["max_lines"] = 15,							-- Max lines to keep in scrollable mode(more lines = more memory)
	["time_visible"] = 3,						-- Time(seconds) a single message will be visible
	["dk_runes"] = true,						-- Show deathknight rune recharge
	["killingblow"] = false,					-- Tells you about your killingblows
	["merge_aoe_spam"] = true,					-- Merges multiple aoe damage spam into single message
	["merge_melee"] = true,						-- Merges multiple auto attack damage spam
	["dispel"] = true,							-- Tells you about your dispels(works only with ["damage"] = true)
	["interrupt"] = true,						-- Tells you about your interrupts(works only with ["damage"] = true)
	["direction"] = "bottom",					-- Scrolling Direction("top"(goes down) or "bottom"(goes up))
	["short_numbers"] = true,					-- Use short numbers ("25.3k" instead of "25342")
}

----------------------------------------------------------------------------------------
--	Addon Skins  //-- These are still the best to use atm
----------------------------------------------------------------------------------------
C["addonskins"] = {				 
	["PallyPower"] = false, 					-- Pally Power skinning
	["Skada"] = true, 						-- Skada skinning
	["Recount"] = false, 					-- Recount skinning
	["Omen"] = false, 						-- Omen skinning
	["KLE"] = false, 						-- KLE skinning
	["Quartz"] = true, 						-- Quartz skinning
	["Bigwigs"] = true, 					-- BigWigs Bossmod skinning
	["DXE"] = false,
}

----------------------------------------------------------------------------------------
--	Buffs reminder options
----------------------------------------------------------------------------------------
C["reminder"] = {
	-- Self buffs
	["solo_buffs_enable"] = true,				-- Enable buff reminder
	["solo_buffs_sound"] = true,				-- Enable warning sound notification for buff reminder
	["solo_buffs_size"] = 45,					-- Icon size
	-- Raid buffs
	["raid_buffs_enable"] = true,				-- Show missing raid buffs
	["raid_buffs_always"] = false,				-- Show frame always
	["raid_buffs_size"] = 20.1,					-- Icon size
	["raid_buffs_alpha"] = 0.3,					-- Transparent icons when the buff is present
}

----------------------------------------------------------------------------------------
--	Raid cooldowns options
----------------------------------------------------------------------------------------
C["raidcooldown"] = {
	["enable"] = true,							-- Enable raid cooldowns
	["height"] = 15,							-- Bars height
	["width"] = 186,							-- Bars width(if show_icon = false, bar width+28)
	["upwards"] = true,							-- Sort upwards bars
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
--	Tooltip options
----------------------------------------------------------------------------------------
C["tooltip"] = {
	["enable"] = true,							-- Enable tooltip
	["shift_modifer"] = false,					-- Show tooltip when "shift" is pushed
	["cursor"] = false,							-- Tooltip above cursor
	["item_icon"] = true,						-- Item icon in tooltip
	["health_value"] = false,					-- Numeral health value
	["hidebuttons"] = false,					-- Hide tooltip for actions bars
	["hide_combat"] = false,					-- Hide tooltip in combat
	-- Plugins
	["talents"] = true,							-- Show tooltip talents
	["achievements"] = false,					-- Comparing achievements in tooltip
	["target"] = true,							-- Target player in tooltip
	["title"] = false,							-- Player title in tooltip
	["realm"] = true,							-- Player realm name in tooltip
	["rank"] = true,							-- Player guild-rank in tooltip
	["arena_experience"] = true,				-- Player PvP experience in arena
	["spell_id"] = true,						-- Id number spells
	["average_lvl"] = true,						-- Average items level
	["raid_icon"] = true,						-- Raid icon
	["who_targetting"] = true,					-- Show who is targetting the unit(in raid or party)
	["item_count"] = true,						-- Item count in tooltip
	["unit_role"] = true,						-- Unit role in tooltip
	["instance_lock"] = true,					-- Your instance lock status in tooltip
	["bottomleft"] = false, 				-- Anchor to BottomLeft
	["bottomright"] = false, 				-- Anchor to Bottomright
	["topright"] = false, 					-- Anchor to Top Right
	["topleft"] = true, 					-- Anchor to Top Left
}

----------------------------------------------------------------------------------------
--	Minimap options
----------------------------------------------------------------------------------------
C["minimap"] = {
	["enable"] = true,
	["minimb1"] = true,						--Background for Minimap bottom right
	["minimb2"] = true,						--Background for Minimap bottom left
	["Picomenu"] = true,					--Use Picomenu
	["compass"] = true,						--Show N/S/E/W
	["size"] = 136,
	["toggle_menu"] = false,						-- Show toggle menu
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
	["CPMAByoffset"] = 68, 							-- Hight for Main Actionbar
	["CPCooldheight"] = 18, 						-- Hight for Cooldown Bar
	["CPTop"] = 1912, 								-- Width for Top Panels
	["CPMinimap"] = C["minimap"].size, 				-- Width/Hight for Minimap Panel
	["Pscale"] = C["misc"].Pscale,					-- Can be used to resize all panels. It does not change X Y Values
	["NoPanels"] = false,							-- Will Set all panels to hidden and show lines instead. On test stage still!
}
----------------------------------------------------------------------------------------
--	Chat options
----------------------------------------------------------------------------------------
C["chat"] = {
	["enable"] = true,							-- Enable chat
	["background"] = true,						-- Enable background for chat
	["background_alpha"] = 0.4,					-- Background alpha
	["filter"] = true,							-- Removing some systems spam("Player1" won duel "Player2")
	["spam"] = false,							-- Removing some players spam(gold/portals/etc)
	["width"] = C.panels.CPwidth - 4,							-- Chat width
	["height"] = C.panels.CPTextheight - 4,							-- Chat height
	["chat_bar"] = false,						-- Lite Button Bar for switch chat channel
	["chat_bar_mouseover"] = false,				-- Lite Button Bar on mouseover
	["time_color"] = {1, 1, 0},					-- Timestamp coloring(http://www.december.com/html/spec/colorcodes.html)
	["whisp_sound"] = true,						-- Sound when whisper
	["bubbles"] = true,							-- Skin Blizzard chat bubbles
	["transp_bubbles"] = true,					-- Transparent Chat Bubbles.
	["transp_bubbles_a"] = 0.35,					-- Alpha for Transparent Chat Bubbles.
	["combatlog"] = true,						-- Show CombatLog tab(need two reloads when false)
	["tabs_mouseover"] = false,					-- Chat tabs on mouseover
	["sticky"] = true,							-- Remember last channel
	["damage_meter_spam"] = false,				-- Merge damage meter spam in one line-link
	["smileys"] = true,							-- Insert smileys instead of symbols like xD
}

----------------------------------------------------------------------------------------
--	Bag options
----------------------------------------------------------------------------------------
C["bag"] = {
	["enable"] = true,							-- Enable bags
	["ilvl"] = true,							-- Show item level
	["BagBars"] = false,
	["SortTop"] = true,							-- Sort from top down
	["button_size"] = 27,						-- Buttons size
	["button_space"] = 3,						-- Buttons space
	["bank_columns"] = 17,						-- Horizontal number of columns in bank
	["bag_columns"] = 10,						-- Horizontal number of columns in main bag
	["bag_buttons"] = true,						-- Show sort/deposit/Artifact buttons
}

----------------------------------------------------------------------------------------
--	Map options
----------------------------------------------------------------------------------------
C["map"] = {
	["bg_map_stylization"] = true,				-- BG map stylization
	["map_boss_count"] = true,					-- Show boss count in World Map
	["explore_map"] = true,						-- Tracking Explorer and Lore Master achievements in World Map
	["fog_of_war"] = true,						-- Fog of war on World Map
}

----------------------------------------------------------------------------------------
--	Loot and Roll Frames
----------------------------------------------------------------------------------------
C["loot"] = {
	["lootframe"] = true,                  
	["rolllootframe"] = true,
	["icon_size"] = 22,							-- Icon size
	["width"] = 221,							-- Loot window width
	["auto_greed"] = true,						-- Push "greed" or "disenchant" button when an item roll
	["auto_confirm_de"] = true,					-- Auto confirm disenchant
}

----------------------------------------------------------------------------------------
--	Nameplate options
----------------------------------------------------------------------------------------
C["nameplate"] = {
	["enable"] = true, 							-- Enable nameplate
	["height"] = 9,								-- Nameplate height
	["width"] = 120,							-- Nameplate width
	["distance"] = 40,							-- Show nameplates for units within this range
	["ad_height"] = 0,							-- Additional height for selected nameplate
	["ad_width"] = 0,							-- Additional width for selected nameplate
	["combat"] = false,							-- Automatically show nameplate in combat
	["health_value"] = false,					-- Numeral health value
	["show_castbar_name"] = false,				-- Show castbar name
	["enhance_threat"] = true,					-- If tank good aggro = green, bad = red
	["class_icons"] = false,					-- Icons by class in PvP
	["name_abbrev"] = false,					-- Display the abbreviated names
	["clamp"] = false,							-- Clamp nameplates to the top of the screen when outside of view
	["good_color"] = {0.2, 0.8, 0.2},			-- Good threat color
	["near_color"] = {1, 1, 0},					-- Near threat color
	["bad_color"] = {1, 0, 0},					-- Bad threat color
	["offtank_color"] = {0, 0.5, 1},			-- Offtank threat color
	["track_auras"] = false,					-- Show debuffs
	["track_buffs"] = false,					-- Show buffs above player nameplate (from the list)
	["auras_size"] = 25,						-- Debuffs size
	["healer_icon"] = false,					-- Show icon above enemy healers nameplate in battlegrounds
	["totem_icons"] = false,					-- Show icon above enemy totems nameplate
}

----------------------------------------------------------------------------------------
--	Auras/Buffs/Debuffs options
----------------------------------------------------------------------------------------
C["aura"] = {
	["player_buff_size"] = 30,					-- Player buffs size
	["player_debuff_size"] = 25,				-- Player debuffs size
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
--	Unit Frames options
----------------------------------------------------------------------------------------
C["unitframe"] = {
	["enable"] = true,																	-- enable/disable action bars
	["HealFrames"] = false,																-- Healing layout/positions
	["ShowRaid"] = true,																-- Show Raid Frames
	["ShowParty"] = true,																-- show party frames (shown as 5man raid)
	["RaidShowAllGroups"] = true,														-- Show All 8 Raid Groups, if not then 5	
	["RaidShowSolo"] = false,															-- show raid frames even when solo
	["HealthcolorClass"] = false,														-- health color = class color
	["HealthBarBackGround"] = { .1, .1, .1, 1},
	["bigcastbar"] = true,
	["Powercolor"] = true,																-- power color = class color
	["showtot"] = true, 																-- show target of target frame
	["showpet"] = true,																	-- show pet frame
	["showfocus"] = true, 																-- show focus frame
	["showfocustarget"] = true, 														-- show focus targets frame
	["showBossFrames"] = true, 															-- show boss frame
	["TotemBars"] = true, 																-- show totem bars
	["MTFrames"] = true, 																-- show main tank frames
	["ArenaFrames"]  = true, 															-- show arena frame
	["Reputationbar"] = true, 															-- show reputation bar
	["Experiencebar"] = true, 															-- show experience bar
	["Artifact_bar"] = true,															-- Artefact Power bar
	["showPlayerAuras"] = false, 														-- use a custom player buffs/debuffs frame instead of blizzard's default.
	["ThreatBar"] = true,																-- show threat bar
	["showPortrait"] = true,															-- show portraits Icon
	["showPortraitHPbar"] = false,														-- show portraits on Healthbar
	["Castbars"] = true, 																-- Show built-in castbars
	["VuhDo"] = false, 																	-- Always Hide Raidframes if VuhDo is loaded.
	["showRaidDebuffs"] = true,															-- Shows debuff as icon on your raid frames
	["showAuraWatch"] = true,															-- Watch specific auras
	--["enableDebuffHighlight"] = true,													-- Highlight Unit Frame if having a Debuffs
	["ShowIncHeals"] = true,															-- Show incoming heals in player and raid frames
	["RCheckIcon"] = true,																-- Show Ready Check Icons On Health Frames
	["IndicatorIcons2"] = false,														-- Toggles different Indicator types.	
	["UFfont"] = "Interface\\Addons\\ViksUI\\Media\\Font\\ROADWAY.ttf",
	["UFNamefont"] = "Interface\\Addons\\ViksUI\\Media\\Font\\ROADWAY.ttf",				-- Font to use on Names
	["aurasize"] = 18,																	-- Aura Size for indicator type 2
	["indicatorsize"] = 6,																-- Size on Squares on Indicator type 2
	["symbolsize"] = 11,																-- Size on Symbols on Indicator type 2
	["fontsizeEdge"] = 12,
	["Findoutline"] = "OUTLINE",
	["insideAlpha"] = 1,																-- Alpha when Unitframe is in range	
	["outsideAlpha"] = 0.6,																-- Alpha when Unitframe is out of range	
	["showLFDIcons"] = true,															-- Show Raid Roll Icon on Frames
	["customLFDIcons"] = true,															-- Show Custom Raid Roll Icon on Frames
	["customLFDText"] = false,															-- Show Raid Roll Icon as Text on Frames
	["showIndicators"] = true,															-- Show Indicators on frames
	["debuffsOnlyShowPlayer"] = false,													-- only show your debuffs on target
	["buffsOnlyShowPlayer"] = false,													-- only show your buffs
	["uf_color"] = {0.4, 0.4, 0.4},														-- Color for UF if ["own_color"] = true
	["castbar_ticks"] = true,															-- Castbar ticks
	-- Plugins
	["plugins_gcd"] = false,					-- Global cooldown spark on player frame
	["plugins_swing"] = false,					-- Swing bar
	["plugins_reputation_bar"] = false,			-- Reputation bar
	["plugins_experience_bar"] = false,			-- Experience bar
	["plugins_artifact_bar"] = false,			-- Artifact Power bar
	["plugins_smooth_bar"] = false,				-- Smooth bar
	--["plugins_enemy_spec"] = false,				-- Enemy specialization
	["plugins_combat_feedback"] = false,		-- Combat text on player/target frame
	["plugins_fader"] = false,					-- Fade unit frames
	--["plugins_diminishing"] = false,			-- Diminishing Returns icons on arena frames
	}

----------------------------------------------------------------------------------------
--	Unit Frames Class bar options
----------------------------------------------------------------------------------------
C["unitframe_class_bar"] = {
	["combo"] = true,							-- Rogue/Druid Combo bar
	["comboalways"] = false,					-- Always show Combo bar for Druid
	["combo_old"] = false,						-- Show combo point on the target 
	["chi"] = true,								-- Chi bar
	["stagger"] = true,							-- Stagger bar (for Monk Tanks)
	["holy"] = true,							-- Holy Power bar
	["shard"] = true,							-- Shard/Burning bar
	["rune"] = true,							-- Rune bar
	["totem"] = true,							-- Totem bar
	["arcane"] = true, 							-- show Mage Arcane Charges bar
	["range"] = false,							-- Range bar (only for Priest)
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
	["plugins_aura_watch"] = true,				-- Raid debuff icons
	["plugins_aura_watch_timer"] = false,		-- Timer on raid debuff icons
}

----------------------------------------------------------------------------------------
--	Panel options (The datatext that is hidden on top with mouseover)
----------------------------------------------------------------------------------------
C["toppanel"] = {
	["enable"] = true,							-- Enable top panel
	["mouseover"] = true,						-- Top panel on mouseover
	["height"] = 35,							-- Panel height
	["width"] = 250,							-- Panel width
}

----------------------------------------------------------------------------------------
--	Stats options
----------------------------------------------------------------------------------------
C["stats"] = {
	["battleground"] = true,					-- BG Score
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
--	Error options (All errors on www.wowwiki.com/WoW_Constants/Errors)
----------------------------------------------------------------------------------------
C["error"] = {
	["black"] = true,							-- Hide errors from black list
	["white"] = false,							-- Show errors from white list
	["combat"] = false,							-- Hide all errors in combat
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
	["Mastery"] = 0,                        -- show mastery rating
	["Power"] = 1,                          -- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	["Regen"] = 0,  						-- show mana regeneration
	["System"] = 7,                			-- show fps and ms on panels, and total addon memory in tooltip
	["Talents"] = 12,                       -- Show Your Talent's. Shift Click to change spec. 
	["togglemenu"] = 0,  			  		-- minimenu
	["Wowtime"] = 14,              		-- THIS IS BLOCKED TO FIXED POSITION! SO CAN'T BE CHANGED HERE! NUMBER MUST BE > 0, BUT DOESN'T USE UP A SPOT!
	["Time24"] = true,            			-- set time to 24h format.
	["Localtime"] = true,  					-- Show Local time instead of server time
	["classcolor"] = true,
	["color"] = { .7, .7, .7, 1 }, 			-- if ["classcolor"] = false
	["CurrArchaeology"] = true,
	["CurrCooking"] = true,
	["CurrProfessions"] = true,
	["CurrMiscellaneous"] = true, 
	["CurrPvP"] = true,
	["CurrRaid"] = true,
	["Quests"] = 15,
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

C["XPBar"] = {
	["enable"] = true,								--Enables XPBar, Based on SaftExperience
	["pos1"] = true,								--Set position to Cooldown Bar (Get sizes from that)
	["pos2"] = false,								--Set position to anchor that is movable with /ui
	["height"] = 10,  								--Set Height for it when using pos2
	["width"] = 300,								--Set Width for it when using pos2
	["text"] = true,  								--Show text at all
	["mouse"] = true,  								--Show text only when mouseover
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
	["toggle_mode"] = true,						-- Enable toggle mode
	["hide_highlight"] = false,					-- Hide proc highlight
	-- Bottom bars
	["bottombars"] = 2,							-- Number of action bars on the bottom (1, 2 or 3)
	-- Right bars
	["rightbars"] = 3,							-- Number of action bars on right (0, 1, 2 or 3)
	["rightbars_mouseover"] = true,				-- Right bars on mouseover
	-- Pet bar
	["petbar_hide"] = false,					-- Hide pet bar
	["petbar_horizontal"] = false,				-- Enable horizontal pet bar
	["petbar_mouseover"] = false,				-- Pet bar on mouseover(only for horizontal pet bar)
	-- Stance bar
	["stancebar_hide"] = false,					-- Hide stance bar
	["stancebar_horizontal"] = true,			-- Enable horizontal stance bar
	["stancebar_mouseover"] = true,				-- Stance bar on mouseover(only for horizontal stance bar)
	-- MicroMenu
	["micromenu"] = false,						-- Enable micro menu
	["micromenu_mouseover"] = false,			-- Micro menu on mouseover
}

----------------------------------------------------------------------------------------
--	Miscellaneous options
----------------------------------------------------------------------------------------
C["Filger"] = {
	["enable"] = true,							-- Enable Filger
	["test_mode"] = false,						-- Test icon mode
	["max_test_icon"] = 5,						-- The number of icons to the test
	["show_tooltip"] = false,					-- Show tooltip
	["disable_cd"] = false,						-- Disable cooldowns
	["filgerCD"] = false,						-- Filger, shows Cooldowns on a bar list.
	["filgertbar"] = false,						-- Filger, shows special bars for target.
	["proc_size"] = 37,							-- Icon size for procs
	["buffs_size"] = 37,							-- Icon size for buffs
	["debuff_size"] = 37,						-- Icon size for debuffs
	["bar_iconsize"] = 25,						-- Icon size for bars
	["bar_width"] = 186,							-- Width for bars
	["cooldown_size"] = 30,						-- Icon size for cooldowns
}

----------------------------------------------------------------------------------------
--	Position options
--	BACKUP THIS FILE BEFORE UPDATING!
----------------------------------------------------------------------------------------
C["position"] = {
	-- Miscellaneous positions
	["minimap_buttons"] = {"TOPLEFT", Minimap, "BOTTOMLEFT", -2, -4},				-- Minimap buttons
	["minimap"] = {"TOPRIGHT", UIParent, "TOPRIGHT", -3, -(C.panels.yoffset+C.panels.CPbarsheight+2)},				-- Minimap
	["minimapline"] = {"TOPRIGHT", UIParent, "TOPRIGHT", -14, -(C.panels.yoffset+C.panels.CPbarsheight+2)},				-- Minimap Line
	["map"] = {"BOTTOM", UIParent, "BOTTOM", -120, 320},							-- Map
	["chat"] = {"BOTTOMLEFT", LChat, "BOTTOMLEFT", 5, 21},							-- Chat
	["chatr"] = {"BOTTOMLEFT", RChat, "BOTTOMLEFT", 5, 21},							-- Chat
	["bag"] = {"BOTTOMRIGHT", Minimap, "TOPRIGHT", 2, 5},							-- Bag
	["bank"] = {"LEFT", UIParent, "LEFT", 23, 150},									-- Bank
	["bn_popup"] = {"TOPRIGHT", LChat, "TOPRIGHT", 0, 40},							-- Battle.net popup
	["achievement"] = {"TOP", UIParent, "TOP", 0, -21},								-- Achievements frame
	["tooltip"] = {"TOPLEFT", UIParent, "TOPLEFT", 2, -20},							-- Tooltip
	["attempt"] = {"TOP", UIParent, "TOP", -85, -25},								-- Attempts frame
	["capture_bar"] = {"TOP", UIParent, "TOP", 0, 3},								-- BG capture bars
	["vehicle"] = {"BOTTOM", Minimap, "TOP", 0, 27},								-- Vehicle frame
	["ghost"] = {"BOTTOM", Minimap, "TOP", 0, 5},									-- Ghost frame
	["uierror"] = {"TOP", UIParent, "TOP", 0, -30},									-- Errors frame
	["quest"] = {"TOPLEFT", UIParent, "TOPLEFT", 21, -2},							-- Quest log
	["loot"] = {"TOPLEFT", UIParent, "TOPLEFT", 245, -220},							-- Loot
	["group_loot"] = {"BOTTOM", UIParent, "BOTTOM", -238, 500},						-- Group roll loot
	["threat_meter"] = {"CENTER", UIParent, "CENTER", 0, 0},						-- Threat meter
	["raid_cooldown"] = {"TOPLEFT", UIParent, "TOPLEFT", 21, -21},					-- Raid cooldowns
	["enemy_cooldown"] = {"BOTTOMLEFT", "oUF_Player", "TOPRIGHT", 33, 350},			-- Enemy cooldowns
	["pulse_cooldown"] = {"CENTER", UIParent, "CENTER", 0, 0},						-- Pulse cooldowns
	["bg_score"] = {"CENTER", UIParent, "BOTTOM", 0, 28},							-- BG stats
	["player_buffs"] = {"TOPRIGHT", Minimap, "TOPLEFT", -6, 2},				-- Player buffs
	["self_buffs"] = {"CENTER", UIParent, "CENTER", 0, 0},							-- Self buff reminder
	["raid_buffs"] = {"CENTER", UIParent, "CENTER", 0, 0},							-- Raid buff reminder
	["top_panel"] = {"TOP", UIParent, "TOP", 0, -20},								-- Top panel
	["raid_utility"] = {"TOP", UIParent, "TOP", -280, 1},							-- Raid utility
	["archaeology"] = {"RIGHT", CPMinimb2, "RIGHT", -40, 1},							-- Archaeology frame
	["auto_button"] = {"LEFT", UIParent, "LEFT", 0, 0},								-- Auto button
	["extra_button"] = {"BOTTOM", UIParent, "BOTTOM", 0, 350},						-- Extra action button
	["alt_power_bar"] = {"TOP", UIParent, "TOP", 0, -21},							-- Alt power bar
	["talking_head"] = {"TOP", UIParent, "TOP", 0, -21},							-- Talking Head
	-- ActionBar positions
	["bottom_bars"] = {"BOTTOM", UIParent, "BOTTOM", 0, 8},							-- Bottom bars
	["right_bars"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -21, 330},			-- Right bars
	["pet_horizontal"] = {"BOTTOMRIGHT", UIParent, "BOTTOM", -175, 167},			-- Horizontal pet bar
	["stance_bar"] = {"BOTTOMRIGHT", UIParent, "BOTTOM", -202, 167},				-- Stance bar
	["vehicle_bar"] = {"BOTTOMRIGHT", ActionButton1, "BOTTOMLEFT", -3, 0},			-- Vehicle button
	["micro_menu"] = {"TOPLEFT", UIParent, "TOPLEFT", 2, -2},						-- Micro menu
	-- UnitFrame positions
	unitframes = {
		["player"] = {"BOTTOMRIGHT", "ActionBarAnchor", "TOPLEFT", -9, 175},		-- Player frame
		["target"] = {"BOTTOMLEFT", "ActionBarAnchor", "TOPRIGHT", 9, 175},			-- Target frame
		["target_target"] = {"TOPRIGHT", "oUF_Target", "BOTTOMRIGHT", 0, -11},		-- ToT frame
		["pet"] = {"TOPLEFT", "oUF_Player", "BOTTOMLEFT", 0, -11},					-- Pet frame
		["focus"] = {"TOPRIGHT", "oUF_Player", "BOTTOMRIGHT", 0, -11},				-- Focus frame
		["focus_target"] = {"TOPLEFT", "oUF_Target", "BOTTOMLEFT", 0, -11},			-- Focus target frame
		["party_heal"] = {"TOPLEFT", "oUF_Player", "BOTTOMRIGHT", 11, -12},			-- Heal layout Party frames
		["raid_heal"] = {"TOPLEFT", "oUF_Player", "BOTTOMRIGHT", 11, -12},			-- Heal layout Raid frames
		["party_dps"] = {"BOTTOMLEFT", UIParent, "LEFT", 23, -70},					-- DPS layout Party frames
		["raid_dps"] = {"TOPLEFT", UIParent, "TOPLEFT", 22, -22},					-- DPS layout Raid frames
		["arena"] = {"BOTTOMRIGHT", UIParent, "RIGHT", -60, -70},					-- Arena frames
		["boss"] = {"BOTTOMRIGHT", UIParent, "RIGHT", -23, -70},					-- Boss frames
		["tank"] = {"BOTTOMLEFT", "ActionBarAnchor", "BOTTOMRIGHT", 10, 18},		-- Tank frames
		["player_portrait"] = {"TOPRIGHT", "oUF_Player", "TOPLEFT", -12, 27},		-- Player Portrait
		["target_portrait"] = {"TOPLEFT", "oUF_Target", "TOPRIGHT", 10, 27},		-- Target Portrait
		["player_castbar"] = {"BOTTOM", "ActionBarAnchor", "TOP", 0, 175},			-- Player Castbar
		["target_castbar"] = {"BOTTOM", "oUF_Player_Castbar", "TOP", 0, 7},			-- Target Castbar
		["focus_castbar"] = {"CENTER", UIParent, "CENTER", 0, 250},					-- Focus Castbar icon
	},
}


----------------------------------------------------------------------------------------
--	ViksUI fonts configuration file
--	BACKUP THIS FILE BEFORE UPDATING!
----------------------------------------------------------------------------------------
--	Configuration example:
----------------------------------------------------------------------------------------
-- C["font"] = {
--		-- Stats font
--		["stats_font"] = "Interface\\AddOns\\ViksUI\\Media\\Font\\Normal.ttf",
-- 		["stats_font_size"] = 11,
--		["stats_font_style"] = "",
--		["stats_font_shadow"] = true,
-- }
----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	Fonts options
----------------------------------------------------------------------------------------
C["font"] = {
	-- Stats font
	["stats_font"] = C.media.pixel_font,
	["stats_font_size"] = 8,
	["stats_font_style"] = "OUTLINEMONOCHROME",
	["stats_font_shadow"] = false,



	-- Combat text font
	["combat_text_font"] = C.media.pixel_font,
	["combat_text_font_size"] = 16,
	["combat_text_font_style"] = "OUTLINEMONOCHROME",
	["combat_text_font_shadow"] = false,

	-- Chat font
	["chat_font"] = C.media.normal_font,
	["chat_font_style"] = "",
	["chat_font_shadow"] = true,

	-- Chat tabs font
	["chat_tabs_font"] = "Interface\\Addons\\ViksUI\\Media\\Font\\DICTATOR.ttf",
	["chat_tabs_font_size"] = 13,
	["chat_tabs_font_style"] = "OUTLINEMONOCHROME",
	["chat_tabs_font_shadow"] = false,

	-- Action bars font
	["action_bars_font"] = C.media.pixel_font,
	["action_bars_font_size"] = 8,
	["action_bars_font_style"] = "OUTLINEMONOCHROME",
	["action_bars_font_shadow"] = false,

	-- Threat meter font
	["threat_meter_font"] = C.media.pixel_font,
	["threat_meter_font_size"] = 8,
	["threat_meter_font_style"] = "OUTLINEMONOCHROME",
	["threat_meter_font_shadow"] = false,

	-- Raid cooldowns font
	["raid_cooldowns_font"] = C.media.pixel_font,
	["raid_cooldowns_font_size"] = 8,
	["raid_cooldowns_font_style"] = "OUTLINEMONOCHROME",
	["raid_cooldowns_font_shadow"] = false,

	-- Cooldowns timer font
	["cooldown_timers_font"] = C.media.pixel_font,
	["cooldown_timers_font_size"] = 16,
	["cooldown_timers_font_style"] = "OUTLINEMONOCHROME",
	["cooldown_timers_font_shadow"] = false,

	-- Loot font
	["loot_font"] = C.media.pixel_font,
	["loot_font_size"] = 8,
	["loot_font_style"] = "OUTLINEMONOCHROME",
	["loot_font_shadow"] = false,

	-- Nameplates font
	["nameplates_font"] = C.media.pixel_font,
	["nameplates_font_size"] = 8,
	["nameplates_font_style"] = "OUTLINEMONOCHROME",
	["nameplates_font_shadow"] = false,

	-- Unit frames font
	["unit_frames_font"] = C.media.pixel_font,
	["unit_frames_font_size"] = 8,
	["unit_frames_font_style"] = "OUTLINEMONOCHROME",
	["unit_frames_font_shadow"] = false,

	-- Auras font
	["auras_font"] = C.media.pixel_font,
	["auras_font_size"] = 8,
	["auras_font_style"] = "OUTLINEMONOCHROME",
	["auras_font_shadow"] = false,

	-- Filger font
	["filger_font"] = C.media.pixel_font,
	["filger_font_size"] = 8,
	["filger_font_style"] = "OUTLINEMONOCHROME",
	["filger_font_shadow"] = false,

	-- Stylization font
	["stylization_font"] = C.media.pixel_font,
	["stylization_font_size"] = 8,
	["stylization_font_style"] = "OUTLINEMONOCHROME",
	["stylization_font_shadow"] = false,

	-- Bags font
	["bags_font"] = C.media.pixel_font,
	["bags_font_size"] = 8,
	["bags_font_style"] = "OUTLINEMONOCHROME",
	["bags_font_shadow"] = false,
}

-- pet action icons
PET_DEFENSIVE_TEXTURE = [[Interface\Addons\ViksUI\Media\textures\icon_defensive]]
PET_ASSIST_TEXTURE = [[Interface\Addons\ViksUI\Media\textures\icon_aggressive]]
PET_PASSIVE_TEXTURE = [[Interface\Addons\ViksUI\Media\textures\icon_passive]]
PET_ATTACK_TEXTURE = [[Interface\Addons\ViksUI\Media\textures\icon_attack]]
PET_FOLLOW_TEXTURE = [[Interface\Addons\ViksUI\Media\textures\icon_follow]]
PET_WAIT_TEXTURE = [[Interface\Addons\ViksUI\Media\textures\icon_wait]]
PET_MOVE_TO_TEXTURE = [[Interface\Addons\ViksUI\Media\textures\icon_moveto]]

SLASH_RELOADUI1 = "/rl"
SLASH_RELOADUI2 = "/reloadui"
SlashCmdList.RELOADUI = ReloadUI

C["spacer"] = {} -- Just spacer for config menu

--------------------------------------------------------------------------------
--	WORKING ON! Do NOT turn anything on!
----------------------------------------------------------------------------------------
C["WorkTemp"] = {
	["show_arena"] = true,	
	["class_bar_range"] = true,	
	["vengeance"] = true,	
}