local T, C, L, _ = unpack(select(2, ...))

C["position"] = {
	-- Miscellaneous positions
	["minimap_buttons"] = {"TOPLEFT", Minimap, "BOTTOMLEFT", -2, -4},				-- Minimap buttons
	["minimap"] = {"TOPRIGHT", UIParent, "TOPRIGHT", -3, -(C.panels.yoffset+C.panels.CPbarsheight+2)},				-- Minimap
	["minimapline"] = {"TOPRIGHT", UIParent, "TOPRIGHT", -14, -(C.panels.yoffset+C.panels.CPbarsheight+2)},				-- Minimap Line
	["map"] = {"BOTTOM", UIParent, "BOTTOM", -120, 320},							-- Map
	["chat"] = {"BOTTOMLEFT", LChat, "BOTTOMLEFT", 5, 21},							-- Chat
	["chatr"] = {"BOTTOMLEFT", RChat, "BOTTOMLEFT", 5, 21},							-- Chat
	["bag"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -40, 200},					-- Bag
	["bank"] = {"BOTTOMLEFT", UIParent, "BOTTOMLEFT", 20, 200},						-- Bank
	["bn_popup"] = {"BOTTOMLEFT", UIParent, "TOPLEFT", 40, 280},					-- Battle.net popup
	["bn_popup_line"] = {"BOTTOMLEFT", UIParent, "TOPLEFT", 40, 280},				-- Battle.net popup with line style
	["achievement"] = {"TOP", UIParent, "TOP", 0, -21},								-- Achievements frame
	["tooltip"] = {"TOPLEFT", UIParent, "TOPLEFT", 2, -20},							-- Tooltip
	["uiwidget"] = {"TOP", UIParent, "TOP", 0, -55},								-- UIWidget frame
	["capture_bar"] = {"TOP", UIParent, "TOP", 0, 3},								-- BG capture bars
	["vehicle"] = {"TOP", UIParent, "TOP", 0, -30},									-- Vehicle frame
	["ghost"] = {"TOP", UIParent, "TOP", 0, -30},									-- Ghost frame
	["uierror"] = {"TOP", UIParent, "TOP", 0, -30},									-- Errors frame
	["quest"] = {"TOPLEFT", UIParent, "TOPLEFT", 21, -2},							-- Quest log
	["loot"] = {"TOPLEFT", UIParent, "TOPLEFT", 245, -220},							-- Loot
	["group_loot"] = {"BOTTOM", UIParent, "BOTTOM", -238, 500},						-- Group roll loot
	["threat_meter"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 200},			-- Threat meter
	["raid_cooldown"] = {"TOPLEFT", UIParent, "TOPLEFT", 21, -21},					-- Raid cooldowns
	["enemy_cooldown"] = {"CENTER", UIParent, "CENTER", 0, -150},					-- Enemy cooldowns
	["pulse_cooldown"] = {"CENTER", UIParent, "CENTER", 0, 0},						-- Pulse cooldowns
	["bg_score"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 350},				-- BG stats
	["player_buffs"] = {"TOPRIGHT", Minimap, "TOPLEFT", -6, 2},						-- Player buffs
	["self_buffs"] = {"CENTER", UIParent, "CENTER", 0, 0},							-- Self buff reminder
	["raid_buffs"] = {"CENTER", UIParent, "CENTER", 0, 0},							-- Raid buff reminder
	["top_panel"] = {"TOP", UIParent, "TOP", 0, -20},								-- Top panel
	["raid_utility"] = {"TOP", UIParent, "TOP", -280, -20},							-- Raid utility
	["archaeology"] = {"RIGHT", CPMinimb2, "RIGHT", -40, 1},						-- Archaeology frame
	["auto_button"] = {"LEFT", UIParent, "LEFT", 0, 0},								-- Auto button
	["extra_button"] = {"BOTTOM", UIParent, "BOTTOM", 0, 350},						-- Extra action button
	["zone_button"] = {"BOTTOMLEFT", UIParent, "BOTTOM", -394, 125},				-- Zone action button
	["alt_power_bar"] = {"TOP", UIWidgetTopCenterContainerFrame, "BOTTOM", 0, -7},	-- Alt power bar
	["talking_head"] = {"TOP", UIParent, "TOP", 0, -25},							-- Talking Head
	["uiwidget_top"] = {"TOP", UIParent, "TOP", 0, -25},							-- Top Widget
	["uiwidget_below"] = {"TOP", UIWidgetTopCenterContainerFrame, "BOTTOM", 0, -15},-- Below Widget
	-- ActionBar positions
	["bottom_bars"] = {"BOTTOM", UIParent, "BOTTOM", 0, 40},						-- Bottom bars
	["right_bars"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -21, 330},			-- Right bars
	["pet_horizontal"] = {"BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, (C.panels.CPTextheight+(C.panels.CPbarsheight*2))+26},			-- Horizontal pet bar
	["stance_bar"] = {"BOTTOMRIGHT", UIParent, "BOTTOM", -202, 167},				-- Stance bar
	["vehicle_bar"] = {"BOTTOMRIGHT", ActionButton1, "BOTTOMLEFT", -3, 0},			-- Vehicle button
	["micro_menu"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -4, 200},					-- Micro menu
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
	-- Filger positions
	filger = {
		["player_buff_icon"] = {"RIGHT", UIParent, "CENTER", -173, 23},			-- "P_BUFF_ICON"
		["player_proc_icon"] = {"RIGHT", UIParent, "CENTER", -173, 80},			-- "P_PROC_ICON"
		["special_proc_icon"] = {"RIGHT", UIParent, "CENTER", -173, -18},		-- "SPECIAL_P_BUFF_ICON"
		["target_debuff_icon"] = {"LEFT", UIParent, "CENTER", 173, 80},			-- "T_DEBUFF_ICON"
		["target_buff_icon"] = {"LEFT", UIParent, "CENTER", 173, 134},			-- "T_BUFF"
		["pve_debuff"] = {"RIGHT", UIParent, "CENTER", -173, 134},				-- "PVE/PVP_DEBUFF"
		["pve_cc"] = {"LEFT", UIParent, "CENTER", 173, 38},						-- "PVE/PVP_CC"
		["cooldown"] = {"RIGHT", UIParent, "CENTER", -550, -230},				-- "COOLDOWN"
		["target_bar"] = {"LEFT", UIParent, "CENTER", 450, -114},				-- "T_DE/BUFF_BAR"
	},
}
