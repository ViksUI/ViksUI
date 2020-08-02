local T, C, L, _ = unpack(select(2, ...))
--if C.filger.filger and C.unitframe.enable ~= true then return end

-- P_BUFF_ICON
AnchorP_PROC_ICON = CreateFrame("Frame","Move_P_PROC_ICON",UIParent)
AnchorP_PROC_ICON:SetPoint("RIGHT", UIParent, "CENTER", -158, 80)
CreateAnchor(AnchorP_PROC_ICON, "Move P_PROC_ICON", 36, 36)

AnchorBUFF_ICON = CreateFrame("Frame","Move_BUFF_ICON",UIParent)
AnchorBUFF_ICON:SetPoint("RIGHT", UIParent, "CENTER", -158, 38)
CreateAnchor(AnchorBUFF_ICON, "Move BUFF_ICON", 36, 36)

AnchorT_SPECIAL_P_BUFF_ICON = CreateFrame("Frame","Move_SPECIAL_P_BUFF_ICON",UIParent)
AnchorT_SPECIAL_P_BUFF_ICON:SetPoint("RIGHT", UIParent, "CENTER", -158, -4)
CreateAnchor(AnchorT_SPECIAL_P_BUFF_ICON, "Move SPECIAL_P_BUFF_ICON", 36, 36)

AnchorT_BAR = CreateFrame("Frame","Move_T_BAR",UIParent)
AnchorT_BAR:SetPoint("LEFT", UIParent, "CENTER", 450, -114)
CreateAnchor(AnchorT_BAR, "Move T_BAR", 36, 36)

AnchorT_DEBUFF_ICON = CreateFrame("Frame","Move_T_DEBUFF_ICON",UIParent)
AnchorT_DEBUFF_ICON:SetPoint("LEFT", UIParent, "CENTER", 158, 80)
CreateAnchor(AnchorT_DEBUFF_ICON, "Move T_DEBUFF_ICON", 36, 36)

Anchor_CD = CreateFrame("Frame","Move_CD",UIParent)
Anchor_CD:SetPoint("LEFT", UIParent, "LEFT", 500, -180)
CreateAnchor(Anchor_CD, "Move CD", 36, 36)

Anchor_PVEPVPCD = CreateFrame("Frame","Move_PVEPVPCD",UIParent)
Anchor_PVEPVPCD:SetPoint("LEFT", UIParent, "CENTER", 158, 38)
CreateAnchor(Anchor_PVEPVPCD, "Move PVEPVPCD", 36, 36)

AnchorT_BUFF_ICON = CreateFrame("Frame","Move_T_BUFF_ICON",UIParent)
AnchorT_BUFF_ICON:SetPoint("LEFT", UIParent, "CENTER", 158, 134)
CreateAnchor(AnchorT_BUFF_ICON, "Move T_BUFF_ICON", 64, 64)

Anchor_PVEDEBUFF = CreateFrame("Frame","Move_PVEDEBUFF",UIParent)
Anchor_PVEDEBUFF:SetPoint("RIGHT", UIParent, "CENTER", -158, 134)
CreateAnchor(Anchor_PVEDEBUFF, "Move PVEDEBUFF", 60, 60)


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
	["bn_popup"] = {"BOTTOMLEFT", ChatFrame1, "TOPLEFT", -3, 27},					-- Battle.net popup
	["bn_popup_line"] = {"BOTTOMLEFT", ChatFrame1, "TOPLEFT", -9, 50},				-- Battle.net popup with line style
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
	["enemy_cooldown"] = {"BOTTOMLEFT", "oUF_Player", "TOPRIGHT", 33, 350},			-- Enemy cooldowns
	["pulse_cooldown"] = {"CENTER", UIParent, "CENTER", 0, 0},						-- Pulse cooldowns
	["bg_score"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 350},				-- BG stats
	["player_buffs"] = {"TOPRIGHT", Minimap, "TOPLEFT", -6, 2},						-- Player buffs
	["self_buffs"] = {"CENTER", UIParent, "CENTER", 0, 0},							-- Self buff reminder
	["raid_buffs"] = {"CENTER", UIParent, "CENTER", 0, 0},							-- Raid buff reminder
	["top_panel"] = {"TOP", UIParent, "TOP", 0, -20},								-- Top panel
	["raid_utility"] = {"TOP", UIParent, "TOP", -280, 1},							-- Raid utility
	["archaeology"] = {"RIGHT", CPMinimb2, "RIGHT", -40, 1},						-- Archaeology frame
	["auto_button"] = {"LEFT", UIParent, "LEFT", 0, 0},								-- Auto button
	["extra_button"] = {"BOTTOM", UIParent, "BOTTOM", 0, 350},						-- Extra action button
	["alt_power_bar"] = {"TOP", UIWidgetTopCenterContainerFrame, "BOTTOM", 0, -7},	-- Alt power bar
	["talking_head"] = {"TOP", UIParent, "TOP", 0, -25},							-- Talking Head
	["uiwidget_top"] = {"TOP", UIParent, "TOP", 0, -25},							-- Top Widget
	["uiwidget_below"] = {"TOP", UIWidgetTopCenterContainerFrame, "BOTTOM", 0, -15},-- Below Widget
	-- ActionBar positions
	["bottom_bars"] = {"BOTTOM", UIParent, "BOTTOM", 0, 40},						-- Bottom bars
	["right_bars"] = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -21, 330},			-- Right bars
	["pet_horizontal"] = {"BOTTOMRIGHT", UIParent, "BOTTOM", -175, 167},			-- Horizontal pet bar
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
}

C["filger_position"] = {
	player_buff_icon = {"RIGHT", AnchorBUFF_ICON},	-- "P_BUFF_ICON"
	player_proc_icon = {"RIGHT", AnchorP_PROC_ICON},	-- "P_PROC_ICON"
	special_proc_icon = {"RIGHT", AnchorT_SPECIAL_P_BUFF_ICON},	-- "SPECIAL_P_BUFF_ICON"
	target_debuff_icon = {"LEFT", AnchorT_DEBUFF_ICON},	-- "T_DEBUFF_ICON"
	target_buff_icon = {"LEFT", AnchorT_BUFF_ICON},	-- "T_BUFF"
	pve_debuff = {"LEFT", Anchor_PVEDEBUFF},			-- "PVE/PVP_DEBUFF"
	pve_cc = {"LEFT", Anchor_PVEPVPCD},				-- "PVE/PVP_CC"
	cooldown = {"RIGHT", Anchor_CD},		-- "COOLDOWN"
	target_bar = {"LEFT", AnchorT_BAR},	-- "T_DE/BUFF_BAR"
}