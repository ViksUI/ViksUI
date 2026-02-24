local T, C, L = unpack(ViksUI)

C["position"] = {
	-- ActionBar positions
	["bottom_bars"] = {"BOTTOM", UIParent, "BOTTOM", 0, 40},						-- Bottom bars
	["right_bars"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -21, 330},			-- Right bars
	["pet_horizontal"] = {"BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, (C.panels.CPTextheight+(C.panels.CPbarsheight*2))+26},			-- Horizontal pet bar
	["stance_bar"] = {"BOTTOMRIGHT", UIParent, "BOTTOM", -202, 167},				-- Stance bar
	["vehicle_bar"] = {"BOTTOMRIGHT", ActionButton1, "BOTTOMLEFT", -3, 0},			-- Vehicle button
	["extra_button"] = {"BOTTOMRIGHT", ActionButton1, "BOTTOMLEFT", -3, 0},			-- Extra action button
	["zone_button"] = {"BOTTOMRIGHT", ActionButton1, "BOTTOMLEFT", -3, 0},			-- Zone action button
	["micro_menu"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 200},					-- Micro menu
	-- UnitFrame positions
	unitframes = {
		["player"] = {"BOTTOMRIGHT", "ActionBarAnchor", "TOPLEFT", -9, 175},
		["target"] = {"BOTTOMLEFT", "ActionBarAnchor", "TOPRIGHT", 9, 175},
		["target_target"] = C.layout2.enable and {"TOPRIGHT", "oUF_Target", "BOTTOMRIGHT", -8, -28} or {"TOPRIGHT", "oUF_Target", "BOTTOMRIGHT", 0, -11},
		["pet"] = C.layout2.enable and {"TOPLEFT", "oUF_Player", "BOTTOMLEFT", 8, -28} or {"TOPLEFT", "oUF_Player", "BOTTOMLEFT", 0, -11},
		["focus"] = C.layout2.enable and {"TOPRIGHT", "oUF_Player", "BOTTOMRIGHT", 4, -28} or {"TOPRIGHT", "oUF_Player", "BOTTOMRIGHT", 0, -11},				-- Focus frame
		["focus_target"] = C.layout2.enable and {"TOPLEFT", "oUF_Target", "BOTTOMLEFT", -4, -28} or {"TOPLEFT", "oUF_Target", "BOTTOMLEFT", 0, -11},			-- Focus target frame
		["party_heal"] = C.layout2.enable and {"TOPLEFT", "oUF_Player", "BOTTOMRIGHT", 11, -49} or {"TOPLEFT", "oUF_Player", "BOTTOMRIGHT", 11, -12},
		["raid_heal"] = C.layout2.enable and {"TOPLEFT", "oUF_Player", "BOTTOMRIGHT", 11, -12} or {"TOPLEFT", "oUF_Player", "BOTTOMRIGHT", 11, -12},
		["party_dps"] = {"BOTTOMLEFT", UIParent, "LEFT", 23, -70},					-- DPS layout Party frames
		["raid_dps"] = {"TOPLEFT", UIParent, "TOPLEFT", 23, -23},					-- DPS layout Raid frames
		["arena"] = {"BOTTOMRIGHT", UIParent, "RIGHT", -60, -70},					-- Arena frames
		["boss"] = {"BOTTOMRIGHT", UIParent, "RIGHT", -23, -70},					-- Boss frames
		["tank"] = C.layout2.enable and {"BOTTOMLEFT", UIParent, "BOTTOM", -80, 200} or {"BOTTOMLEFT", "ActionBarAnchor", "BOTTOMRIGHT", 10, 18},
		["player_portrait"] = {"TOPRIGHT", "oUF_Player", "TOPLEFT", -12, 27},
		["target_portrait"] = {"TOPLEFT", "oUF_Target", "TOPRIGHT", 12, 27},
		["player_portrait_2"] = {"BOTTOM", UIParent, "BOTTOM", -138, 300},		-- Player Portrait Layout2
		["target_portrait_2"] = {"BOTTOM", UIParent, "BOTTOM", 	138, 300},		-- Target Portrait Layout2
		["player_castbar"] = {"BOTTOM", "ActionBarAnchor", "TOP", 0, 175},			-- Player Castbar
		["target_castbar"] = {"BOTTOM", "oUF_Player_Castbar", "TOP", 0, 7},			-- Target Castbar
		["focus_castbar"] = {"CENTER", UIParent, "CENTER", 0, 250},					-- Focus Castbar icon
	},
	-- Layout2 positioning
	layout2 = {
		-- Reference point for all Layout2 frames
		-- Positioned at center of screen, 320px from bottom
		["ref_point_x"] = 0,						-- Horizontal offset from screen center (0 = centered)
		["ref_point_y"] = -320,						-- Vertical offset from bottom of screen
		
		-- Portrait offsets from reference point
		["player_portrait_offset_x"] = -50,			-- Move player portrait to the left
		["target_portrait_offset_x"] = 50,			-- Move target portrait to the right
		
		-- UnitFrame offsets from portrait
		["unitframe_portrait_offset"] = -25,			-- Move unitframe toward center from portrait
		
		-- Castbar offsets
		["player_castbar_offset_y"] = -6,			-- Space between text bar and castbar
		["target_castbar_offset_y"] = -6,			-- Space between text bar and castbar
		
	},
	-- Filger positions
	filger = {
		["player_buff_icon"] = {"RIGHT", UIParent, "CENTER", -280, 23},				-- "P_BUFF_ICON"
		["player_proc_icon"] = {"RIGHT", UIParent, "CENTER", -280, 80},				-- "P_PROC_ICON"
		["special_proc_icon"] = {"RIGHT", UIParent, "CENTER", -280, -18},			-- "SPECIAL_P_BUFF_ICON"
		["target_debuff_icon"] = {"LEFT", UIParent, "CENTER", 280, 80},				-- "T_DEBUFF_ICON"
		["target_buff_icon"] = {"LEFT", UIParent, "CENTER", 280, 134},				-- "T_BUFF"
		["pve_debuff"] = {"RIGHT", UIParent, "CENTER", -280, 134},					-- "PVE/PVP_DEBUFF"
		["pve_cc"] = {"LEFT", UIParent, "CENTER", 280, 38},							-- "PVE/PVP_CC"
		["cooldown"] = {"RIGHT", UIParent, "CENTER", -416, -234},					-- "COOLDOWN"
		["target_bar"] = {"LEFT", UIParent, "CENTER", 556, -140},					-- "T_DE/BUFF_BAR"
		["player_bar"] = {"RIGHT", UIParent, "CENTER", -416, -200},					-- "P_BUFF_BAR"
	},
	-- Miscellaneous positions
	["minimap"] = {"TOPRIGHT", UIParent, "TOPRIGHT", -3, -(C.panels.yoffset+C.panels.CPbarsheight+2)},				-- Minimap
	["minimap_buttons"] = {"TOPLEFT", Minimap, "BOTTOMLEFT", -2, -4},				-- Minimap buttons
	["minimapline"] = {"TOPRIGHT", UIParent, "TOPRIGHT", -14, -(C.panels.yoffset+C.panels.CPbarsheight+2)},				-- Minimap Line
	["tooltip"] = {"TOPLEFT", UIParent, "TOPLEFT", 2, -20},							-- Tooltip
	["vehicle"] = {"TOPRIGHT", Minimap, "BOTTOMLEFT", -10, -25},					-- Vehicle frame
	["ghost"] = {"TOP", UIParent, "TOP", 0, -30},									-- Ghost frame
	["bag"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -40, 200},					-- Bag
	["bank"] = {"BOTTOMLEFT", UIParent, "BOTTOMLEFT", 20, 200},						-- Bank
	["archaeology"] = {"RIGHT", CPMinimb2, "RIGHT", -40, 1},						-- Archaeology frame
	["auto_button"] = {"LEFT", UIParent, "LEFT", 0, 0},								-- Auto button
	["chat"] = {"BOTTOMLEFT", LChat, "BOTTOMLEFT", 5, 21},							-- Chat
	["chat_right"] = {"BOTTOMLEFT", RChat, "BOTTOMLEFT", 5, 21},					-- Chat on right side
	["chatr"] = {"BOTTOMLEFT", RChat, "BOTTOMLEFT", 5, 21},							-- Chat
	["bn_popup"] = {"BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, (C.panels.CPTextheight+(C.panels.CPbarsheight*2))+40},					-- Battle.net popup
	["bn_popup_line"] = {"BOTTOMLEFT", UIParent, "BOTTOMLEFT", 40, 280},			-- Battle.net popup with line style
	["map"] = {"BOTTOM", UIParent, "BOTTOM", -120, 320},							-- Map
	["quest"] = {"TOPLEFT", UIParent, "TOPLEFT", 0, -100},							-- Quest log (Left side option)
	["loot"] = {"TOPLEFT", UIParent, "TOPLEFT", 245, -220},							-- Loot
	["group_loot"] = {"BOTTOMLEFT", "oUF_Player", "TOPLEFT", -2, 173},				-- Group roll loot
	["threat_meter"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 200},			-- Threat meter
	["bg_score"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 350},				-- BG stats
	["raid_cooldown"] = {"LEFT", UIParent, "LEFT", 5, 130},							-- Raid cooldowns
	["enemy_cooldown"] = {"CENTER", UIParent, "CENTER", 0, -150},					-- Enemy cooldowns
	["pulse_cooldown"] = {"CENTER", UIParent, "CENTER", 0, 0},						-- Pulse cooldowns
	["player_buffs"] = {"TOPRIGHT", Minimap, "TOPLEFT", -6, 2},						-- Player buffs
	["player_debuffs"] = {"BOTTOMRIGHT", Minimap, "BOTTOMLEFT", -6, -2},			-- Player debuffs
	["self_buffs"] = {"TOP", UIParent, "TOP", 0, -60},								-- Self buff reminder
	["raid_buffs"] = {"TOPLEFT", Minimap, "BOTTOMLEFT", 0, -25},					-- Raid buff reminder
	["raid_buffs_line"] = {"TOPLEFT", Minimap, "BOTTOMLEFT", 0, -40},				-- Raid buff reminder
	["raid_utility"] = {"TOP", UIParent, "TOP", -280, -20},							-- Raid utility
	["raid_tool"] = {"TOP", RChat, "TOP", 0, 20},									-- Raid utility
	["top_panel"] = {"TOP", UIParent, "TOP", 0, -30},								-- Top panel
	["achievement"] = {"TOP", UIParent, "TOP", 0, -21},								-- Achievements frame
	["uierror"] = {"TOP", UIParent, "TOP", 0, -30},									-- Errors frame
	["talking_head"] = {"TOP", UIParent, "TOP", 0, -25},							-- Talking Head
	["alt_power_bar"] = {"TOP", UIWidgetTopCenterContainerFrame, "BOTTOM", 0, -7},	-- Alt power bar
	["uiwidget_top"] = {"TOP", UIParent, "TOP", 0, -25},							-- Top Widget
	["uiwidget_below"] = {"BOTTOM", UIParent, "BOTTOM", 0, 216},					-- Below Widget
	["capture_bar"] = {"TOP", UIParent, "TOP", 0, 3},								-- BG capture bars
}