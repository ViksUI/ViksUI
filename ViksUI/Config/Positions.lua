local T, C, L, _ = unpack(select(2, ...))
if C.filger.filger and C.unitframe.enable ~= true then return end

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