local T, C, L = unpack(ViksUI)
if C.nameplate.enable ~= true or C_AddOns.IsAddOnLoaded("Plater") or C_AddOns.IsAddOnLoaded("Threat Plates") or C_AddOns.IsAddOnLoaded("TidyPlates") then return end

----------------------------------------------------------------------------------------
--	oUF nameplates
----------------------------------------------------------------------------------------
local _, ns = ...
local oUF = ns.oUF

local frame = CreateFrame("Frame")
frame:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
if C.nameplate.combat then
	frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	frame:RegisterEvent("PLAYER_REGEN_DISABLED")

	function frame:PLAYER_REGEN_ENABLED()
		SetCVar("nameplateShowEnemies", 0)
	end

	function frame:PLAYER_REGEN_DISABLED()
		SetCVar("nameplateShowEnemies", 1)
	end
end

frame:RegisterEvent("PLAYER_ENTERING_WORLD")
function frame:PLAYER_ENTERING_WORLD()
	C_NamePlate.SetNamePlateSize(C.nameplate.width * 1.2, (C.nameplate.height + C.font.nameplates_font_size + 8) * 2)

	if C.nameplate.combat then
		if InCombatLockdown() then
			SetCVar("nameplateShowEnemies", 1)
		else
			SetCVar("nameplateShowEnemies", 0)
		end
	end
end

frame:RegisterEvent("PLAYER_LOGIN")
function frame:PLAYER_LOGIN()
	if C.nameplate.enhance_threat then
		SetCVar("threatWarning", 3)
	end
	SetCVar("nameplateGlobalScale", 1)
	SetCVar("namePlateMinScale", 1)
	SetCVar("namePlateMaxScale", 1)
	SetCVar("nameplateLargerScale", 1)
	SetCVar("nameplateSelectedScale", 1)
	SetCVar("nameplateMinAlpha", 1)
	SetCVar("nameplateMaxAlpha", 1)
	SetCVar("nameplateSelectedAlpha", 1)
	SetCVar("nameplateNotSelectedAlpha", 1)
	SetCVar("nameplateLargeTopInset", 0.08)

	SetCVar("nameplateOtherTopInset", C.nameplate.clamp and 0.08 or -1)
	SetCVar("nameplateOtherBottomInset", C.nameplate.clamp and 0.1 or -1)
	SetCVar("clampTargetNameplateToScreen", C.nameplate.clamp and "1" or "0")

	SetCVar("nameplatePlayerMaxDistance", 60)

	if C.nameplate.only_name then
		SetCVar("nameplateShowOnlyNameForFriendlyPlayerUnits", 1)
	end
	SetCVar("nameplateUseClassColorForFriendlyPlayerUnitNames", 1)

	local function changeFont(self, size)
		local mult = size or 1
		self:SetFont(C.font.nameplates_font, C.font.nameplates_font_size * mult * 1, C.font.nameplates_font_style)
		self:SetShadowOffset(C.font.nameplates_font_shadow and 1 or 0, C.font.nameplates_font_shadow and -1 or 0)
	end
	changeFont(SystemFont_NamePlateFixed)
	changeFont(SystemFont_LargeNamePlateFixed, 2)
end

local healList, exClass, healerSpecs = {}, {}, {}

exClass.DEATHKNIGHT = true
exClass.DEMONHUNTER = true
exClass.HUNTER = true
exClass.MAGE = true
exClass.ROGUE = true
exClass.WARLOCK = true
exClass.WARRIOR = true
if C.nameplate.healer_icon then
	local t = CreateFrame("Frame")

	local numFactions = {
		["Horde"] = 1,
		["Alliance"] = 0,
	}
	local healerSpecIDs = {
		105,	-- Druid Restoration
		1468,	-- Evoker Preservation
		270,	-- Monk Mistweaver
		65,		-- Paladin Holy
		256,	-- Priest Discipline
		257,	-- Priest Holy
		264,	-- Shaman Restoration
	}
	for _, specID in pairs(healerSpecIDs) do
		local _, name = GetSpecializationInfoByID(specID)
		if name and not healerSpecs[name] then
			healerSpecs[name] = true
		end
	end

	local lastCheck = 20
	local function CheckHealers(_, elapsed)
		lastCheck = lastCheck + elapsed
		if lastCheck > 25 then
			lastCheck = 0
			wipe(healList)
			local playerFaction = numFactions[UnitFactionGroup("player")]
			for i = 1, GetNumBattlefieldScores() do
				local name, _, _, _, _, faction, _, _, _, _, _, _, _, _, _, talentSpec = GetBattlefieldScore(i)
				if T.NotSecretValue(name) and name and healerSpecs[talentSpec] and faction == playerFaction then
					name = name:match("(.+)%-.+") or name
					healList[name] = talentSpec
				end
			end
		end
	end

	local function CheckArenaHealers(_, elapsed)
		lastCheck = lastCheck + elapsed
		if lastCheck > 10 then
			lastCheck = 0
			wipe(healList)
			for i = 1, 5 do
				local specID = GetArenaOpponentSpec(i)
				if specID and specID > 0 then
					local name = UnitName(format("arena%d", i))
					local _, talentSpec = GetSpecializationInfoByID(specID)
					if T.NotSecretValue(name) and name and healerSpecs[talentSpec] then
						healList[name] = talentSpec
						local nameplate = C_NamePlate.GetNamePlateForUnit(format("arena%d", i))
						if nameplate then
							nameplate.unitFrame:UpdateAllElements("UNIT_NAME_UPDATE")
						end
					end
				end
			end
		end
	end

	local function CheckLoc(_, event)
		if event == "PLAYER_ENTERING_WORLD" then
			local _, instanceType = IsInInstance()
			if instanceType == "pvp" then
				t:SetScript("OnUpdate", CheckHealers)
			elseif instanceType == "arena" then
				t:SetScript("OnUpdate", CheckArenaHealers)
			else
				wipe(healList)
				t:SetScript("OnUpdate", nil)
			end
		end
	end

	t:RegisterEvent("PLAYER_ENTERING_WORLD")
	t:SetScript("OnEvent", CheckLoc)
end

local totemData = {
	[GetSpellInfo(192058)] = 136013,	-- Capacitor Totem
	[GetSpellInfo(98008)]  = 237586,	-- Spirit Link Totem
	[GetSpellInfo(192077)] = 538576,	-- Wind Rush Totem
	[GetSpellInfo(204331)] = 511726,	-- Counterstrike Totem
	[GetSpellInfo(204332)] = 136114,	-- Windfury Totem
	[GetSpellInfo(204336)] = 136039,	-- Grounding Totem
	-- [GetSpellInfo(157153)] = 971076,	-- Cloudburst Totem
	[GetSpellInfo(5394)]   = 135127,	-- Healing Stream Totem
	[GetSpellInfo(108280)] = 538569,	-- Healing Tide Totem
	[GetSpellInfo(207399)] = 136080,	-- Ancestral Protection Totem
	[GetSpellInfo(198838)] = 136098,	-- Earthen Wall Totem
	[GetSpellInfo(51485)]  = 136100,	-- Earthgrab Totem
	[GetSpellInfo(196932)] = 136232,	-- Voodoo Totem
	[GetSpellInfo(192222)] = 971079,	-- Liquid Magma Totem
	[GetSpellInfo(204330)] = 135829,	-- Skyfury Totem
}

local function CreateBorderFrame(frame, point)
	if point == nil then point = frame end
	if point.backdrop then return end

	if C.nameplate.shadow_border then
		-- Shadow border style - create overlay frame for border
		local border = CreateFrame("Frame", nil, frame, "BackdropTemplate")
		border:SetFrameLevel(frame:GetFrameLevel() + 1)
		border:SetPoint("TOPLEFT", point, "TOPLEFT", -1, 1)
		border:SetPoint("BOTTOMRIGHT", point, "BOTTOMRIGHT", 1, -1)
		border:SetBackdrop({
			edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1,
			insets = {left = -1, right = -1, top = -1, bottom = -1}
		})
		border:SetBackdropColor(0, 0, 0, 0)
		border:SetBackdropBorderColor(0, 0, 0, 1)
		frame.iborder = border

		-- Shadow frame
		local shadow = CreateFrame("Frame", nil, frame, "BackdropTemplate")
		shadow:SetFrameLevel(0)
		shadow:SetFrameStrata(frame:GetFrameStrata())
		shadow:SetPoint("TOPLEFT", point, "TOPLEFT", -4, 4)
		shadow:SetPoint("BOTTOMRIGHT", point, "BOTTOMRIGHT", 4, -4)
		shadow:SetBackdrop({
			edgeFile = "Interface\\AddOns\\ViksUI\\Media\\Other\\glowTex", edgeSize = 4,
		})
		shadow:SetBackdropColor(0, 0, 0, 0)
		shadow:SetBackdropBorderColor(0, 0, 0, 0.8)
		frame.shadow = shadow
		frame.backdrop = true
	else
		-- Default border style
		frame.backdrop = frame:CreateTexture(nil, "BORDER")
		frame.backdrop:SetDrawLayer("BORDER", -8)
		frame.backdrop:SetPoint("TOPLEFT", point, "TOPLEFT", -1 * 3, 1 * 3)
		frame.backdrop:SetPoint("BOTTOMRIGHT", point, "BOTTOMRIGHT", 1 * 3, -1 * 3)
		local r, g, b, a = unpack(C.media.backdrop_color)
		frame.backdrop:SetColorTexture(r, g, b + 0.01, a)

		frame.bordertop = frame:CreateTexture(nil, "BORDER")
		frame.bordertop:SetPoint("TOPLEFT", point, "TOPLEFT", -1 * 2, 1 * 2)
		frame.bordertop:SetPoint("TOPRIGHT", point, "TOPRIGHT", 1 * 2, 1 * 2)
		frame.bordertop:SetHeight(1)
		frame.bordertop:SetColorTexture(unpack(C.media.border_color))
		frame.bordertop:SetDrawLayer("BORDER", -7)

		frame.borderbottom = frame:CreateTexture(nil, "BORDER")
		frame.borderbottom:SetPoint("BOTTOMLEFT", point, "BOTTOMLEFT", -1 * 2, -1 * 2)
		frame.borderbottom:SetPoint("BOTTOMRIGHT", point, "BOTTOMRIGHT", 1 * 2, -1 * 2)
		frame.borderbottom:SetHeight(1)
		frame.borderbottom:SetColorTexture(unpack(C.media.border_color))
		frame.borderbottom:SetDrawLayer("BORDER", -7)

		frame.borderleft = frame:CreateTexture(nil, "BORDER")
		frame.borderleft:SetPoint("TOPLEFT", point, "TOPLEFT", -1 * 2, 1 * 2)
		frame.borderleft:SetPoint("BOTTOMLEFT", point, "BOTTOMLEFT", 1 * 2, -1 * 2)
		frame.borderleft:SetWidth(1)
		frame.borderleft:SetColorTexture(unpack(C.media.border_color))
		frame.borderleft:SetDrawLayer("BORDER", -7)

		frame.borderright = frame:CreateTexture(nil, "BORDER")
		frame.borderright:SetPoint("TOPRIGHT", point, "TOPRIGHT", 1 * 2, 1 * 2)
		frame.borderright:SetPoint("BOTTOMRIGHT", point, "BOTTOMRIGHT", -1 * 2, -1 * 2)
		frame.borderright:SetWidth(1)
		frame.borderright:SetColorTexture(unpack(C.media.border_color))
		frame.borderright:SetDrawLayer("BORDER", -7)
	end
end

local function SetColorBorder(frame, r, g, b)
	if C.nameplate.shadow_border then
		-- When shadow_border is enabled, use black as default instead of border_color
		if frame.iborder then
			frame.iborder:SetBackdropBorderColor(r, g, b, 1)
		end
		if frame.shadow then
			frame.shadow:SetBackdropBorderColor(r, g, b, 0.8)
		end
	else
		if frame.bordertop then
			frame.bordertop:SetColorTexture(r, g, b)
		end
		if frame.borderbottom then
			frame.borderbottom:SetColorTexture(r, g, b)
		end
		if frame.borderleft then
			frame.borderleft:SetColorTexture(r, g, b)
		end
		if frame.borderright then
			frame.borderright:SetColorTexture(r, g, b)
		end
	end
end

-- Helper to get default border color (black for shadow, border_color for default)
local function GetDefaultBorderColor()
	if C.nameplate.shadow_border then
		return 0, 0, 0
	else
		return unpack(C.media.border_color)
	end
end

-- Auras functions
local AurasCustomFilter = function(_, unit, data)
	local allow = false

	if not UnitIsFriend("player", unit) then
		if data.isHarmfulAura then
			if C.nameplate.track_debuffs and data.isPlayerAura then
				local filter = not C_UnitAuras.IsAuraFilteredOutByInstanceID(unit, data.auraInstanceID, "HARMFUL|PLAYER|")
				if filter then
					allow = true
				end
			end
		else
			if C.nameplate.track_buffs then
				local filter = not C_UnitAuras.IsAuraFilteredOutByInstanceID(unit, data.auraInstanceID, "HELPFUL|EXTERNAL_DEFENSIVE")
				if filter then
					allow = true
				end

				local filter = not C_UnitAuras.IsAuraFilteredOutByInstanceID(unit, data.auraInstanceID, "HELPFUL|BIG_DEFENSIVE")
				if filter then
					allow = true
				end

				local filter = not C_UnitAuras.IsAuraFilteredOutByInstanceID(unit, data.auraInstanceID, "HELPFUL|RAID_PLAYER_DISPELLABLE")
				if filter then
					allow = true
				end
			end
		end
	end

	return allow
end

local Mult = 1
if T.screenHeight > 1200 then
	Mult = T.mult
end

local AurasPostCreateIcon = function(_, button, options)
	if CreateBorderFrame then
		CreateBorderFrame(button)
	end

	if button.Cooldown then
		T.SkinCooldown(button.Cooldown, "aura")
	end

	if button.Icon then
		button.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	end

	if button.Count then
		button.Count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 1, 0)
		button.Count:SetJustifyH("RIGHT")
		button.Count:SetFont(C.font.auras_font, C.font.auras_font_size * 1 / Mult, C.font.auras_font_style)
		button.Count:SetShadowOffset(C.font.auras_font_shadow and 1 or 0, C.font.auras_font_shadow and -1 or 0)
	end

	if C.aura.show_spiral and button.Cooldown then
		button.Cooldown:SetReverse(true)
	end
end

local AurasPostUpdateIcon = function(_, button, unit, data)
	if not UnitIsFriend("player", unit) then
		if data.isHarmfulAura then
			if C.nameplate.track_debuffs and data.isPlayerAura or (canaccessvalue(data.sourceUnit) and data.sourceUnit == "pet") then
				if C.nameplate.track_buffs then
					SetColorBorder(button, GetDefaultBorderColor())
				end
			end
		else
			local color = C_CurveUtil.EvaluateColorFromBoolean(data.isStealable, {r = 1, g = 0.85, b = 0, a = 1}, {r = 0, g = 0.5, b = 0, a = 1})
			SetColorBorder(button, color:GetRGB())
			-- if T.BuffWhiteList[data.name] then
				-- SetColorBorder(button, 0, 0.5, 0)
			-- elseif data.isStealable then
				-- SetColorBorder(button, 1, 0.85, 0)
			-- end
		end
	end
end

local function GetCastbarOffset()
	-- Normal border extends farther outside the frame; shadow border is only 1px.
	-- Keep the castbar/icon close to the healthbar when using the shadow style.
	return C.nameplate.shadow_border and 3 or 8
end

local function UpdateTarget(self)
	-- Use oUF's canonical private unit token.
	local unit = self.__unit
	local gap = GetCastbarOffset()
	local isTarget = unit and T.unitIsUnit(unit, "target")
	local isMe = unit and T.unitIsUnit(unit, "player")

	-- Always clear target-only visuals first. This prevents a recycled
	-- nameplate from retaining the previous target's arrows/glow if the
	-- target changes or the plate is rebound.
	self.ArrowR:Hide()
	self.ArrowL:Hide()
	self.Level:Show()
	if C.nameplate.target_glow then
		self.Glow:Hide()
	end

	if isTarget and not isMe then
		if C.nameplate.ad_height > 0 or C.nameplate.ad_width > 0 then
			if C.nameplate.target_arrow == true then
				self:SetSize((C.nameplate.width + C.nameplate.ad_width) * T.noscalemult, (C.nameplate.height + C.nameplate.ad_height) * T.noscalemult)
				self.Castbar:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 8+((C.nameplate.height + C.nameplate.ad_height) * T.noscalemult), -gap)
				self.Castbar:SetPoint("BOTTOMLEFT", self.Health, "BOTTOMLEFT", 0, -gap-((C.nameplate.height + C.nameplate.ad_height) * T.noscalemult))
				self.Castbar.Icon:SetSize(((C.nameplate.height + C.nameplate.ad_height) * T.noscalemult), ((C.nameplate.height + C.nameplate.ad_height) * T.noscalemult))
			else
				self:SetSize((C.nameplate.width + C.nameplate.ad_width) * T.noscalemult, (C.nameplate.height + C.nameplate.ad_height) * T.noscalemult)
				self.Castbar:SetPoint("BOTTOMLEFT", self.Health, "BOTTOMLEFT", 0, -gap-((C.nameplate.height + C.nameplate.ad_height) * T.noscalemult))
				self.Castbar.Icon:SetSize(((C.nameplate.height + C.nameplate.ad_height) * 2 * T.noscalemult) + 8, ((C.nameplate.height + C.nameplate.ad_height) * 2 * T.noscalemult) + 8)
			end
			if C.nameplate.class_icons == true then
				self.Class.Icon:SetSize(((C.nameplate.height + C.nameplate.ad_height) * 2 * T.noscalemult) + 8, ((C.nameplate.height + C.nameplate.ad_height) * 2 * T.noscalemult) + 8)
			end
		end

		self.ArrowR:Show()
		self.ArrowL:Show()
		self.Level:Hide()

		if C.nameplate.target_glow then
			self.Glow:Show()
		end
		self:SetAlpha(1)
	else
		if C.nameplate.ad_height > 0 or C.nameplate.ad_width > 0 then
			if C.nameplate.target_arrow == true then
				self:SetSize(C.nameplate.width * T.noscalemult, C.nameplate.height * T.noscalemult)
				self.Castbar:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", (C.nameplate.height * T.noscalemult)+8, -gap)
				self.Castbar:SetPoint("BOTTOMLEFT", self.Health, "BOTTOMLEFT", (C.nameplate.height * T.noscalemult), -gap-(C.nameplate.height * T.noscalemult))
				self.Castbar.Icon:SetSize((C.nameplate.height * T.noscalemult), (C.nameplate.height * T.noscalemult))
			else
				self:SetSize(C.nameplate.width * T.noscalemult, C.nameplate.height * T.noscalemult)
				self.Castbar:SetPoint("BOTTOMLEFT", self.Health, "BOTTOMLEFT", 0, -gap-(C.nameplate.height * T.noscalemult))
				self.Castbar.Icon:SetSize((C.nameplate.height * 2 * T.noscalemult) + 8, (C.nameplate.height * 2 * T.noscalemult) + 8)
			end
			if C.nameplate.class_icons == true then
				self.Class.Icon:SetSize((C.nameplate.height * 2 * T.noscalemult) + 8, (C.nameplate.height * 2 * T.noscalemult) + 8)
			end
		end

		if not UnitExists("target") or isMe then
			self:SetAlpha(1)
		else
			self:SetAlpha(C.nameplate.alpha)
		end
	end
end

local function UpdateFocus(self)
	if T.unitIsUnit(self.__unit, "focus") then
		SetColorBorder(self.Health, 1, 0.8, 0)
	else
		SetColorBorder(self.Health, GetDefaultBorderColor())
	end
end

local function UpdateName(self)
	if C.nameplate.healer_icon then
		local name = self.unitName
		if name and canaccessvalue(name) then
			if healList[name] then
				if exClass[healList[name]] then
					self.HealerIcon:Hide()
				else
					self.HealerIcon:Show()
				end
			else
				self.HealerIcon:Hide()
			end
		end
	end

	if C.nameplate.class_icons then
		local reaction = UnitReaction(self.__unit, "player")
		if UnitIsPlayer(self.__unit) and canaccessvalue(reaction) and reaction <= 4 then
			local _, class = UnitClass(self.__unit)
			if canaccessvalue(class) then
				local texcoord = CLASS_ICON_TCOORDS[class]
				if texcoord then
					self.Class.Icon:SetTexCoord(texcoord[1] + 0.015, texcoord[2] - 0.02, texcoord[3] + 0.018, texcoord[4] - 0.02)
					self.Class:Show()
					self.Level:SetPoint("RIGHT", self.Name, "LEFT", -2, 0)
				else
					self.Class.Icon:SetTexCoord(0, 0, 0, 0)
					self.Class:Hide()
					self.Level:SetPoint("RIGHT", self.Health, "LEFT", -2, 0)
				end
			else
				self.Class.Icon:SetTexCoord(0, 0, 0, 0)
				self.Class:Hide()
				self.Level:SetPoint("RIGHT", self.Health, "LEFT", -2, 0)
			end
		else
			self.Class.Icon:SetTexCoord(0, 0, 0, 0)
			self.Class:Hide()
			self.Level:SetPoint("RIGHT", self.Health, "LEFT", -2, 0)
		end
	end

	if C.nameplate.totem_icons then
		local name = self.unitName
		if name and canaccessvalue(name) then
			if totemData[name] then
				self.Totem.Icon:SetTexture(totemData[name])
				self.Totem:Show()
			else
				self.Totem:Hide()
			end
		end
	end
end

local kickID = 0
if C.nameplate.kick_color then
	if T.class == "DEATHKNIGHT" then
		kickID = 47528
	elseif T.class == "DEMONHUNTER" then
		kickID = 183752
	elseif T.class == "DRUID" then
		kickID = 106839
	elseif T.class == "EVOKER" then
		kickID = 351338
	elseif T.class == "HUNTER" then
		kickID = C_SpecializationInfo.GetSpecialization() == 3 and 187707 or 147362
	elseif T.class == "MAGE" then
		kickID = 2139
	elseif T.class == "MONK" then
		kickID = 116705
	elseif T.class == "PALADIN" then
		kickID = 96231
	elseif T.class == "PRIEST" then
		kickID = 15487
	elseif T.class == "ROGUE" then
		kickID = 1766
	elseif T.class == "SHAMAN" then
		kickID = 57994
	elseif T.class == "WARLOCK" then
		kickID = 119910
	elseif T.class == "WARRIOR" then
		kickID = 6552
	end
end

-- Cast color
local function castColor(self, unit, spellID, notInterruptible)
	-- oUF passes the current cast's spellID and interruptibility directly
	-- to PostCastStart. Do not read self.spellID/self.notInterruptible here:
	-- those are not public CastBar fields in this oUF implementation.
	local color = C_CurveUtil.EvaluateColorFromBoolean(
		notInterruptible,
		{r = 0.78, g = 0.25, b = 0.25, a = 1},
		{r = 1, g = 0.8, b = 0, a = 1}
	)

	-- if C.nameplate.kick_color then
		-- local start, _, enabled = GetSpellCooldown(kickID)
		-- local col = C_CurveUtil.EvaluateColorFromBoolean(enabled, {r = 1, g = 0.5, b = 0, a = 1}, {r = 1, g = 0.8, b = 0, a = 1})
		-- -- Rewrite color for notInterruptible
		-- color = C_CurveUtil.EvaluateColorFromBoolean(self.notInterruptible, {r = 0.78, g = 0.25, b = 0.25, a = 1}, {r = col.r, g = col.g, b = col.b, a = 1})
	-- end

	self:GetStatusBarTexture():SetVertexColor(color:GetRGBA())
	self.bg:SetColorTexture(color.r, color.g, color.b, 0.2)

	-- if canaccessvalue(self.notInterruptible) and self.notInterruptible then -- secret, need to create new element with alpha?
		-- self:SetStatusBarColor(0.78, 0.25, 0.25)
		-- self.bg:SetColorTexture(0.78, 0.25, 0.25, 0.2)
	-- else
		-- if C.nameplate.kick_color then
			-- local start = GetSpellCooldown(kickID)
			-- if (canaccessvalue(start) and start ~= 0) or start then -- BETA
				-- self:SetStatusBarColor(1, 0.5, 0)
				-- self.bg:SetColorTexture(1, 0.5, 0, 0.2)
			-- else
				-- self:SetStatusBarColor(1, 0.8, 0)
				-- self.bg:SetColorTexture(1, 0.8, 0, 0.2)
			-- end
		-- else
			-- self:SetStatusBarColor(1, 0.8, 0)
			-- self.bg:SetColorTexture(1, 0.8, 0, 0.2)
		-- end
	-- end

	if C.nameplate.cast_color then
		-- C_Spell.IsSpellImportant() is designed to accept the spell identifier
		-- supplied by the cast system, including secret spell identifiers on
		-- restricted/instance nameplates. Do not gate this with canaccessvalue():
		-- the identifier can be secret while still being a valid API argument.
		-- EvaluateColorFromBoolean() is the secret-safe sink for the result.
		local important = C_Spell.IsSpellImportant(spellID)
		local br, bg, bb = GetDefaultBorderColor()
		local color = C_CurveUtil.EvaluateColorFromBoolean(
			important,
			{r = 1, g = 0.8, b = 0, a = 1},
			{r = br, g = bg, b = bb, a = 1}
		)
		SetColorBorder(self, color:GetRGB())
		SetColorBorder(self.Border, color:GetRGB())
	end

	if C.nameplate.cast_target then
		local target = UnitSpellTargetName(unit)
		if target then
			local class = UnitSpellTargetClass(unit)
			if class then
				local classColor = C_ClassColor.GetClassColor(class)
				if classColor then
					target = classColor:WrapTextInColorCode(target)
				end
			end
			self.Text:SetText("-> "..target)
		end
	end

	-- if C.nameplate.cast_color and canaccessvalue(self.spellID) then -- BETA not work
		-- if T.InterruptCast[self.spellID] then
			-- SetColorBorder(self, 1, 0.8, 0)
			-- SetColorBorder(self.Border, 1, 0.8, 0)
		-- elseif T.ImportantCast[self.spellID] then
			-- SetColorBorder(self, 1, 0, 0)
			-- SetColorBorder(self.Border, 1, 0, 0)
		-- else
			-- SetColorBorder(self, unpack(C.media.border_color))
			-- SetColorBorder(self.Border, unpack(C.media.border_color))
		-- end
	-- end
end

local function CastInterrupted(self, unit, interruptedBy)
	self:GetStatusBarTexture():SetVertexColor(0.2, 0.2, 0.2)
	if interruptedBy then
		local _, class, _, _, _, unitName = GetPlayerInfoByGUID(interruptedBy)
		if unitName then
			if class then
				local classColor = C_ClassColor.GetClassColor(class)
				if classColor then
					unitName = classColor:WrapTextInColorCode(unitName)
				end
			end
			self.Time:SetText()
			self.Text:SetFormattedText("%s: %s", INTERRUPTED, unitName)
		end
	end
end

-- 12.1 dungeon mob-type resolver, mapped from EllesmereUI's nameplate
-- priority model.
--
-- Categories:
--   boss      = worldboss / skull / 2+ effective levels above player
--   miniboss  = lieutenant / elite one level above player
--   caster    = unit has a MANA power type
--   mini      = normal / minus / trivial dungeon trash
--   melee     = remaining elite / rareelite dungeon mobs
--
-- Important 12.1 rule: do not use UnitClassBase for caster detection.
-- UnitHasPowerType(unit, Enum.PowerType.Mana) is safe and also matches the
-- actual behavior used by EllesmereUI.
local function GetDungeonMobType(unit)
	if not unit or UnitIsPlayer(unit) then return nil end

	local classification = UnitClassification(unit)
	local inInstance = IsInInstance()

	if not inInstance then
		return nil
	end

	-- Bosses: worldboss is an immediate boss classification.
	if classification == "worldboss" then
		return "boss"
	end

	-- Mini-boss / boss tiering for elite/rareelite mobs.
	if classification == "elite" or classification == "rareelite" then
		local level = UnitEffectiveLevel(unit)
		local playerLevel = UnitEffectiveLevel("player")

		local levelClean = level ~= nil and not issecretvalue(level)
		local playerLevelClean = playerLevel ~= nil and not issecretvalue(playerLevel)

		if levelClean and playerLevelClean then
			local isSkull = level == -1
			local aboveOne = level >= playerLevel + 1

			if isSkull or aboveOne then
				local aboveTwo = level >= playerLevel + 2
				local lieutenant = (not isSkull) and UnitIsLieutenant and UnitIsLieutenant(unit)

				if not lieutenant and (isSkull or aboveTwo) then
					return "boss"
				else
					return "miniboss"
				end
			end
		end
	end

	-- Caster detection: this is the important difference from the old
	-- PALADIN-based logic. Blizzard exposes the actual mana power type.
	if UnitHasPowerType and Enum and Enum.PowerType and UnitHasPowerType(unit, Enum.PowerType.Mana) then
		return "caster"
	end

	-- Mini enemies / non-elite dungeon trash.
	if classification == "normal" or classification == "minus" or classification == "trivial" then
		return "mini"
	end

	-- Remaining elite/rare-elite mobs are normal dungeon enemies.
	if classification == "elite" or classification == "rareelite" then
		return "melee"
	end

	return nil
end

local function GetDungeonMobColor(unit)
	local mobType = GetDungeonMobType(unit)
	if not mobType then return nil end

	if mobType == "boss" then
		return C.nameplate.elite_boss_color, mobType
	elseif mobType == "miniboss" then
		return C.nameplate.elite_miniboss_color, mobType
	elseif mobType == "caster" then
		return C.nameplate.elite_caster_color, mobType
	elseif mobType == "mini" then
		return C.nameplate.elite_trivial_color, mobType
	elseif mobType == "melee" then
		return C.nameplate.elite_melee_color, mobType
	end
end

local function GetMobColorOverride(self)
	if not C.nameplate.elite_only_instance then return nil end
	if not self or not self.__unit then return nil end

	local color, mobType = GetDungeonMobColor(self.__unit)
	if color then
		return color, mobType
	end
end

local function threatColor(self, forced)
	if UnitIsPlayer(self.__unit) then return end

	if C.nameplate.enhance_threat ~= true then
		SetColorBorder(self.Health, GetDefaultBorderColor())
	end

	if UnitIsTapDenied(self.__unit) then
		self.Health:SetStatusBarColor(0.6, 0.6, 0.6)
		return
	end

	-- Only use threat coloring while the player is actually in combat.
	if not UnitAffectingCombat("player") then
		if not forced then
			self.Health:ForceUpdate()
		end
		return
	end

	local threatStatus = UnitThreatSituation("player", self.__unit)

	-- Preserve the existing special affix behavior.
	if self.npcID == "120651" then
		self.Health:SetStatusBarColor(unpack(C.nameplate.extra_color))
		return
	elseif self.npcID == "174773" then
		if threatStatus == 3 then
			self.Health:SetStatusBarColor(unpack(C.nameplate.extra_color))
		else
			self.Health:SetStatusBarColor(unpack(C.nameplate.good_color))
		end
		return
	end

	if not threatStatus then
		return
	end

	-- EllesmereUI priority mapping:
	-- DPS/healer: has aggro / near aggro override mob colors.
	-- Tank: losing aggro / no aggro override mob colors.
	if T.Role == "Tank" then
		if threatStatus == 2 or threatStatus == 1 then
			if C.nameplate.enhance_threat then
				self.Health:SetStatusBarColor(unpack(C.nameplate.near_color))
			else
				SetColorBorder(self.Health, unpack(C.nameplate.near_color))
			end
			return
		elseif threatStatus == 0 then
			if C.nameplate.enhance_threat then
				local offTank = false
				if IsInRaid() then
					for i = 1, GetNumGroupMembers() do
						local raidUnit = "raid"..i
						if UnitExists(raidUnit)
							and not T.unitIsUnit(raidUnit, "player")
							and UnitGroupRolesAssigned(raidUnit) == "TANK" then
							if UnitDetailedThreatSituation(raidUnit, self.__unit) then
								offTank = true
								break
							end
						end
					end
				end

				if offTank then
					self.Health:SetStatusBarColor(unpack(C.nameplate.offtank_color))
				else
					self.Health:SetStatusBarColor(unpack(C.nameplate.bad_color))
				end
			else
				SetColorBorder(self.Health, unpack(C.nameplate.bad_color))
			end
			return
		end

		-- threatStatus == 3: tank has secure aggro.
		-- Do NOT overwrite mob-type colors. This is the important EllesmereUI
		-- behavior: miniboss/caster/boss colors survive normal tank aggro.
		return
	else
		if threatStatus == 3 then
			if C.nameplate.enhance_threat then
				self.Health:SetStatusBarColor(unpack(C.nameplate.bad_color))
			else
				SetColorBorder(self.Health, unpack(C.nameplate.bad_color))
			end
			return
		elseif threatStatus == 2 or threatStatus == 1 then
			if C.nameplate.enhance_threat then
				self.Health:SetStatusBarColor(unpack(C.nameplate.near_color))
			else
				SetColorBorder(self.Health, unpack(C.nameplate.near_color))
			end
			return
		elseif threatStatus == 0 then
			-- DPS/healer with no active threat warning: preserve the mob-type
			-- color when mob coloring is enabled, otherwise use the old good
			-- color behavior.
			if C.nameplate.enhance_threat and not C.nameplate.mob_color_enable then
				self.Health:SetStatusBarColor(unpack(C.nameplate.good_color))
			end
			return
		end
	end
end

-- Low health border for enemy player and mobs
local low_health_player = C_CurveUtil.CreateColorCurve()
low_health_player:SetType(Enum.LuaCurveType.Step)
low_health_player:AddPoint(0, CreateColor(1, 0, 0, 1))
low_health_player:AddPoint(0.2, CreateColor(1, 1, 0, 1))
if C.nameplate.shadow_border then
	low_health_player:AddPoint(0.5, CreateColor(0, 0, 0))
else
	low_health_player:AddPoint(0.5, CreateColor(unpack(C.media.border_color)))
end

local low_health = C_CurveUtil.CreateColorCurve()
low_health:SetType(Enum.LuaCurveType.Step)
low_health:AddPoint(0, CreateColor(unpack(C.nameplate.low_health_color)))
if C.nameplate.shadow_border then
	low_health:AddPoint(C.nameplate.low_health_value, CreateColor(0, 0, 0))
else
	low_health:AddPoint(C.nameplate.low_health_value, CreateColor(unpack(C.media.border_color)))
end

local function HealthPostUpdate(self, unit)
	local isPlayer = UnitIsPlayer(unit)
	if isPlayer then
		local color = UnitHealthPercent(unit, true, low_health_player)
		local r, g, b = color:GetRGB()
		SetColorBorder(self, r, g, b)
	elseif not isPlayer and C.nameplate.enhance_threat then
		if C.nameplate.low_health then
			local color = UnitHealthPercent(unit, true, low_health)
			local r, g, b = color:GetRGB()
			SetColorBorder(self, r, g, b)
		else
			SetColorBorder(self, GetDefaultBorderColor())
		end
	end
end

local function HealthPostUpdateColor(self, unit, color)
	T.PostUpdateBackdropColor(self, color)

	local main = self:GetParent()
	local r, g, b
	local isPlayer = UnitIsPlayer(unit)
	local unitReaction = UnitReaction(unit, "player")
	local reactionAccessible = canaccessvalue(unitReaction)
	if not T.unitIsUnit("player", unit) and isPlayer and reactionAccessible and unitReaction >= 5 then
		r, g, b = T.oUF_colors.power["MANA"]:GetRGB()
		self:SetStatusBarColor(r, g, b)
		self.bg:SetVertexColor(r, g, b, 0.2)
	elseif UnitIsTapDenied(unit) then
		r, g, b = unpack(C.nameplate.tapped_color)
		self:SetStatusBarColor(r, g, b)
		self.bg:SetVertexColor(r, g, b, 0.2)
	elseif not isPlayer then
		local special = UnitClassification(unit)
		local inInstance = IsInInstance()
		local unitGUID = UnitGUID(unit)

		-- Quest colors retain highest mob-color priority.
		if C.nameplate.quests and main.QuestIcon and main.QuestIcon:IsShown() then
			if reactionAccessible then
				if unitReaction >= 4 then
					r, g, b = unpack(C.nameplate.quest_friendly_color)
				elseif unitReaction == 3 then
					r, g, b = unpack(C.nameplate.quest_neutral_color)
				else
					r, g, b = unpack(C.nameplate.quest_hostile_color)
				end
			end
		elseif C.nameplate.elite_only_instance and inInstance then
			-- EllesmereUI-style dungeon mob categories:
			-- Bosses > Mini-Bosses > Spell Casters > Mini Enemies > Enemies.
			local dungeonColor, mobType = GetDungeonMobColor(unit)

			if dungeonColor then
				r, g, b = unpack(dungeonColor)
				main._dungeonMobType = mobType
			else
				main._dungeonMobType = nil

				-- Existing explicit NPC color table remains the fallback for
				-- mobs that do not fall into a dungeon category.
				local npcColor = C.nameplate.mob_color_enable
					and main.npcID
					and T.ColorPlate[main.npcID]

				if npcColor then
					r, g, b = unpack(npcColor)
				elseif special == "rare" or special == "rareelite" then
					r, g, b = 0, 0.7, 0.6
				else
					local reaction = reactionAccessible and T.oUF_colors.reaction[unitReaction]
					if reaction then
						if unitReaction < 4 and not UnitCanAttack("player", unit) then
							r, g, b = UnitSelectionColor(unit, true)
						else
							r, g, b = reaction:GetRGB()
						end
					else
						r, g, b = UnitSelectionColor(unit, true)
					end
				end
			end
		else
			main._dungeonMobType = nil

			-- Outside dungeon coloring, preserve the existing NPC/reaction logic.
			local npcColor = C.nameplate.mob_color_enable
				and main.npcID
				and T.ColorPlate[main.npcID]

			if npcColor then
				r, g, b = unpack(npcColor)
			elseif special == "rare" or special == "rareelite" then
				r, g, b = 0, 0.7, 0.6
			else
				local reaction = reactionAccessible and T.oUF_colors.reaction[unitReaction]
				if reaction then
					if unitReaction < 4 and not UnitCanAttack("player", unit) then
						r, g, b = UnitSelectionColor(unit, true)
					else
						r, g, b = reaction:GetRGB()
					end
				else
					r, g, b = UnitSelectionColor(unit, true)
				end
			end
		end

		self:SetStatusBarColor(r, g, b)
		self.bg:SetVertexColor(r, g, b, 0.2)
	end

	threatColor(main, true)

	if T.unitIsUnit(unit, "focus") then
		SetColorBorder(self, 1, 0.8, 0)
	end
end

local function callback(self, _, unit)
	if not self then return end
	if unit then
		self.__unit = unit
		local unitGUID = UnitGUID(unit)
		self.npcID = unitGUID and canaccessvalue(unitGUID) and select(6, strsplit('-', unitGUID))
		self.unitName = UnitName(unit)
		self.widgetsOnly = UnitNameplateShowsWidgetsOnly(unit)
		if self.npcID and T.PlateBlacklist[self.npcID] then
			self:Hide()
		else
			self:Show()
		end

		UpdateTarget(self)

		if T.unitIsUnit(unit, "player") then
			if self.Name then self.Name:Hide() end
			if self.Castbar then self.Castbar:SetAlpha(0) end
			if self.RaidTargetIndicator then self.RaidTargetIndicator:SetAlpha(0) end
		else
			if self.Name then self.Name:Show() end
			if self.Castbar then self.Castbar:SetAlpha(1) end
			if self.RaidTargetIndicator then self.RaidTargetIndicator:SetAlpha(1) end

			local isOwnerOrController = UnitIsOwnerOrControllerOfUnit("player", unit)
			if self.widgetsOnly or (UnitWidgetSet(unit) and canaccessvalue(isOwnerOrController) and isOwnerOrController) then
				if self.Health then self.Health:SetAlpha(0) end
				if self.Level then self.Level:SetAlpha(0) end
				if self.Name then self.Name:SetAlpha(0) end
				if self.Castbar then self.Castbar:SetAlpha(0) end
			else
				if self.Health then self.Health:SetAlpha(1) end
				if self.Level then self.Level:SetAlpha(1) end
				if self.Name then self.Name:SetAlpha(1) end
				if self.Castbar then self.Castbar:SetAlpha(1) end
			end

			local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
			if nameplate.UnitFrame then
				if nameplate.UnitFrame.WidgetContainer then
					nameplate.UnitFrame.WidgetContainer:SetParent(nameplate)
				end
			end

			if C.nameplate.only_name then
				if UnitIsFriend("player", unit) then
					if not InCombatLockdown() then
						nameplate:SetSize(C.nameplate.width * 0.5, C.font.nameplates_font_size + 8)
					end
					if self.Health then self.Health:SetAlpha(0) end
					if self.Name then
						self.Name:ClearAllPoints()
						self.Name:SetPoint("CENTER", self, "CENTER", 0, 0)
					end
					if self.Level then self.Level:SetAlpha(0) end
					if self.Castbar then self.Castbar:SetAlpha(0) end
					if C.nameplate.target_glow and self.Glow then
						self.Glow:SetAlpha(0)
					end
					if C.raidframe.plugins_healcomm then
						self.Health.DamageAbsorb:Hide()

						if C.raidframe.plugins_over_heal_absorb then
							self.Health.OverDamageAbsorbIndicator:Hide()
						end
					end
				else
					if not InCombatLockdown() then
						nameplate:SetSize(C.nameplate.width * 1.2, (C.nameplate.height + C.font.nameplates_font_size + 8) * 2)
					end
					if self.Health then self.Health:SetAlpha(1) end
					if self.Name then
						self.Name:ClearAllPoints()
						self.Name:SetPoint("BOTTOMLEFT", self, "TOPLEFT", -3, 4)
						self.Name:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 3, 4)
					end
					if self.Level then self.Level:SetAlpha(1) end
					if self.Castbar then self.Castbar:SetAlpha(1) end
					if C.nameplate.target_glow and self.Glow then
						self.Glow:SetAlpha(1)
					end
					if C.raidframe.plugins_healcomm and self.Health then
						self.Health.DamageAbsorb:Show()

						if C.raidframe.plugins_over_heal_absorb then
							self.Health.OverDamageAbsorbIndicator:Show()
						end
					end
				end
			end
		end
	end
end

local function style(self, unit)
	local main = self
	self.__unit = unit
	local castbarGap = GetCastbarOffset()

	self:ClearAllPoints()
	self:SetPoint("CENTER")
	self:SetSize(C.nameplate.width, C.nameplate.height)

	-- Health Bar
	self.Health = CreateFrame("StatusBar", nil, self)
	self.Health:SetAllPoints(self)
	self.Health:SetStatusBarTexture(C.media.texture)
	self.Health.colorTapping = true
	self.Health.colorDisconnected = true
	self.Health.colorClass = true
	self.Health.colorReaction = true
	self.Health.colorHealth = true
	CreateBorderFrame(self.Health)

	self.Health.bg = self.Health:CreateTexture(nil, "BORDER")
	self.Health.bg:SetAllPoints()
	self.Health.bg:SetTexture(C.media.texture)
	self.Health.bg.multiplier = 0.2

	-- Health Text
	if C.nameplate.health_value then
		self.Health.value = self.Health:CreateFontString(nil, "OVERLAY")
		self.Health.value:SetFont(C.font.nameplates_font, C.font.nameplates_font_size * 1, C.font.nameplates_font_style)
		self.Health.value:SetShadowOffset(C.font.nameplates_font_shadow and 1 or 0, C.font.nameplates_font_shadow and -1 or 0)
		self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
		self:Tag(self.Health.value, "[NameplateHealth]")
	end

	-- Name Text
	self.Name = self:CreateFontString(nil, "OVERLAY")
	self.Name:SetFont(C.font.nameplates_font, C.font.nameplates_font_size, C.font.nameplates_font_style)
	self.Name:SetShadowOffset(C.font.nameplates_font_shadow and 1 or 0, C.font.nameplates_font_shadow and -1 or 0)
	self.Name:SetPoint("BOTTOMLEFT", self, "TOPLEFT", -3, 4)
	self.Name:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 3, 4)
	self.Name:SetWordWrap(false)

	if C.nameplate.name_abbrev then
		self:Tag(self.Name, "[NameplateNameColor][NameLongAbbrev]")
	elseif C.nameplate.short_name then
		self:Tag(self.Name, "[NameplateNameColor][NameplateNameShort]")
	else
		self:Tag(self.Name, "[NameplateNameColor][NameLong]")
	end

	-- Target Glow
	if C.nameplate.target_glow then
		self.Glow = CreateFrame("Frame", nil, self, "BackdropTemplate")
		self.Glow:SetBackdrop({edgeFile = [[Interface\AddOns\ViksUI\Media\Textures\Glow.tga]], edgeSize = 4 * T.noscalemult})
		self.Glow:SetPoint("TOPLEFT", -7 * 1, 7 * 1)
		self.Glow:SetPoint("BOTTOMRIGHT", 7 * 1, -7 * 1)
		self.Glow:SetBackdropBorderColor(0.8, 0.8, 0.8)
		self.Glow:SetFrameLevel(0)
		self.Glow:Hide()
	end

	-- Level Text
	self.Level = self:CreateFontString(nil, "ARTWORK")
	self.Level:SetFont(C.font.nameplates_font, C.font.nameplates_font_size, C.font.nameplates_font_style)
	self.Level:SetShadowOffset(C.font.nameplates_font_shadow and 1 or 0, C.font.nameplates_font_shadow and -1 or 0)
	self.Level:SetPoint("RIGHT", self.Health, "LEFT", -2, 0)
	self:Tag(self.Level, "[DiffColor][NameplateLevel][shortclassification]")

	-- Cast Bar
	self.Castbar = CreateFrame("StatusBar", nil, self.Health)
	self.Castbar:SetFrameLevel(3)
	self.Castbar:SetStatusBarTexture(C.media.texture)
	self.Castbar:SetStatusBarColor(1, 0.8, 0)
	local castbarHeight = C.nameplate.castbar_height > 0 and C.nameplate.castbar_height or C.nameplate.height
	if C.nameplate.target_arrow == true then
		self.Castbar:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", (C.nameplate.height * T.noscalemult)+castbarGap, -castbarGap)
	else
		self.Castbar:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -castbarGap)
	end
	self.Castbar:SetPoint("BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", 0, -castbarGap-castbarHeight)
	CreateBorderFrame(self.Castbar)

	self.Castbar.bg = self.Castbar:CreateTexture(nil, "BORDER")
	self.Castbar.bg:SetAllPoints()
	self.Castbar.bg:SetTexture(C.media.texture)
	self.Castbar.bg:SetColorTexture(1, 0.8, 0, 0.2)

	self.Castbar.PostCastStart = castColor
	self.Castbar.PostCastInterruptible = castColor

	-- Cast Time Text
	self.Castbar.Time = self.Castbar:CreateFontString(nil, "ARTWORK")
	self.Castbar.Time:SetPoint("RIGHT", self.Castbar, "RIGHT", 0, 0)
	self.Castbar.Time:SetFont(C.font.nameplates_font, C.font.nameplates_font_size * 1, C.font.nameplates_font_style)
	self.Castbar.Time:SetShadowOffset(C.font.nameplates_font_shadow and 1 or 0, C.font.nameplates_font_shadow and -1 or 0)

	-- Cast Name Text
	if C.nameplate.show_castbar_name or C.nameplate.cast_target then
		self.Castbar.Text = self.Castbar:CreateFontString(nil, "OVERLAY")
		self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 3, 0)
		self.Castbar.Text:SetPoint("RIGHT", self.Castbar.Time, "LEFT", -1, 0)
		self.Castbar.Text:SetFont(C.font.nameplates_font, C.font.nameplates_font_size * 1, C.font.nameplates_font_style)
		self.Castbar.Text:SetShadowOffset(C.font.nameplates_font_shadow and 1 or 0, C.font.nameplates_font_shadow and -1 or 0)
		self.Castbar.Text:SetHeight(C.font.nameplates_font_size)
		self.Castbar.Text:SetJustifyH("LEFT")

		self.Castbar.timeToHold = 1.5 -- for interrupted
		self.Castbar.PostCastInterrupted = CastInterrupted
	end

	-- Cast Bar Icon
	self.Castbar.Border = CreateFrame("Frame", nil, self.Castbar)
	self.Castbar.Icon = self.Castbar.Border:CreateTexture(nil, "OVERLAY")
	self.Castbar.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	self.Castbar.Icon:SetDrawLayer("ARTWORK")
	self.Castbar.Icon:SetSize(castbarHeight, castbarHeight)
	if C.nameplate.target_arrow == true then
		self.Castbar.Icon:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -castbarGap)
	else
		self.Castbar.Icon:SetPoint("TOPLEFT", self.Health, "TOPRIGHT", castbarGap, 0)
	end
	CreateBorderFrame(self.Castbar.Border, self.Castbar.Icon)

	-- Raid Icon
	self.RaidTargetIndicator = self:CreateTexture(nil, "OVERLAY", nil, 7)
	self.RaidTargetIndicator:SetSize((C.nameplate.height * 2 * 1) + 8, (C.nameplate.height * 2 * 1) + 8)
	self.RaidTargetIndicator:SetPoint("BOTTOM", self.Health, "TOP", 0, C.nameplate.track_debuffs and 38 or 16)

	-- Class Icon
	if C.nameplate.class_icons then
		self.Class = CreateFrame("Frame", nil, self)
		self.Class.Icon = self.Class:CreateTexture(nil, "OVERLAY")
		self.Class.Icon:SetSize((C.nameplate.height * 2 * 1) + 8, (C.nameplate.height * 2 * 1) + 8)
		self.Class.Icon:SetPoint("TOPRIGHT", self.Health, "TOPLEFT", -8, 0)
		self.Class.Icon:SetTexture("Interface\\WorldStateFrame\\Icons-Classes")
		self.Class.Icon:SetTexCoord(0, 0, 0, 0)
		CreateBorderFrame(self.Class, self.Class.Icon)
		self.Class:Hide()
	end

	-- Totem Icon
	if C.nameplate.totem_icons then
		self.Totem = CreateFrame("Frame", nil, self)
		self.Totem.Icon = self.Totem:CreateTexture(nil, "OVERLAY")
		self.Totem.Icon:SetSize((C.nameplate.height * 2 * 1) + 8, (C.nameplate.height * 2 * 1) + 8)
		self.Totem.Icon:SetPoint("BOTTOM", self.Health, "TOP", 0, 16)
		self.Totem.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		CreateBorderFrame(self.Totem, self.Totem.Icon)
		self.Totem:Hide()
	end

	-- Arrow for important NPC
	self.Arrow = self.Health:CreateTexture(nil, "OVERLAY")
	self.Arrow:SetSize(C.nameplate.height * T.noscalemult + 8, C.nameplate.height * T.noscalemult + 8)
	self.Arrow:SetPoint("CENTER", self.Health, "BOTTOM", 0, 0)
	self.Arrow:SetTexture([[Interface\AddOns\ViksUI\Media\Other\priority.tga]])
	self.Arrow:Hide()

	-- Target Arrow
	self.ArrowR = self.Health:CreateTexture(nil, "OVERLAY")
	self.ArrowR:SetSize((C.nameplate.height + C.nameplate.ad_width) * T.noscalemult + 8, (C.nameplate.height  + C.nameplate.ad_width) * T.noscalemult + 8)
	self.ArrowR:SetPoint("RIGHT", self.Health, "LEFT", -4, 0)
	self.ArrowR:SetTexture([[Interface\AddOns\ViksUI\Media\Other\TargetArrowRight.tga]])
	self.ArrowR:SetVertexColor(unpack(C.nameplate.targetarrow_color))
	self.ArrowR:Hide()
	
	self.ArrowL = self.Health:CreateTexture(nil, "OVERLAY")
	self.ArrowL:SetSize((C.nameplate.height + C.nameplate.ad_width) * T.noscalemult + 8, (C.nameplate.height  + C.nameplate.ad_width) * T.noscalemult + 8)
	self.ArrowL:SetPoint("LEFT", self.Health, "RIGHT", 4, 0)
	self.ArrowL:SetTexture([[Interface\AddOns\ViksUI\Media\Other\TargetArrowLeft.tga]])
	self.ArrowL:SetVertexColor(unpack(C.nameplate.targetarrow_color))
	self.ArrowL:Hide()
	
	-- Healer Icon
	if C.nameplate.healer_icon then
		self.HealerIcon = self.Health:CreateFontString(nil, "OVERLAY")
		self.HealerIcon:SetFont(C.font.nameplates_font, 32, C.font.nameplates_font_style)
		self.HealerIcon:SetText("|cFFD53333+|r")
		self.HealerIcon:SetPoint("BOTTOM", self.Name, "TOP", 0, C.nameplate.track_debuffs and 13 or 0)
		self.HealerIcon:Hide()
	end

	-- Quest Icon
	if C.nameplate.quests then
		self.QuestIcon = self:CreateTexture(nil, "OVERLAY", nil, 7)
		self.QuestIcon:SetSize((C.nameplate.height * 2 * 1), (C.nameplate.height * 2 * 1))
		self.QuestIcon:SetPoint("RIGHT", self.Health, "LEFT", -5, 0)
		self.QuestIcon:Hide()

		self.QuestIcon.Text = self:CreateFontString(nil, "OVERLAY")
		self.QuestIcon.Text:SetPoint("RIGHT", self.QuestIcon, "LEFT", -1, 0)
		self.QuestIcon.Text:SetFont(C.font.nameplates_font, C.font.nameplates_font_size * 1 * 2, C.font.nameplates_font_style)
		self.QuestIcon.Text:SetShadowOffset(C.font.nameplates_font_shadow and 1 or 0, C.font.nameplates_font_shadow and -1 or 0)

		self.QuestIcon.Item = self:CreateTexture(nil, "OVERLAY")
		self.QuestIcon.Item:SetSize((C.nameplate.height * 2 * 1) - 2, (C.nameplate.height * 2 * 1) - 2)
		self.QuestIcon.Item:SetPoint("RIGHT", self.QuestIcon.Text, "LEFT", -2, 0)
		self.QuestIcon.Item:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	end

	-- Aura tracking
	if C.nameplate.track_debuffs or C.nameplate.track_buffs then
		self.Auras = self:CreateAuras({
			initialAnchor = "BOTTOMRIGHT",
			growthX = "LEFT",
			growthY = "UP",
			layoutLimit = 20 + C.nameplate.width,
		})
		self.Auras:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, C.font.nameplates_font_size + 8)
		self.Auras:SetSize(20 + C.nameplate.width, C.nameplate.auras_size)
		self.Auras.elementSpacing = 5 * 1
		self.Auras.size = C.nameplate.auras_size * 1 - 3
		self.Auras.disableMouse = true
		self.Auras.showCount = true

		self.Auras.PostCreateButton = AurasPostCreateIcon

		if C.nameplate.track_buffs then
			self.Auras:AddGroup("HELPFUL", {
				maxFrameCount = 4,
				showStealableBorder = true,
			})
		end

		if C.nameplate.track_debuffs then
			self.Auras:AddGroup("HARMFUL|PLAYER", {
				maxFrameCount = 6,
				-- showDebuffBorder = true,
			})
		end

	end

	-- Health color
	self.Health:RegisterEvent("PLAYER_REGEN_DISABLED")
	self.Health:RegisterEvent("PLAYER_REGEN_ENABLED")
	self.Health:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE")
	self.Health:RegisterEvent("UNIT_THREAT_LIST_UPDATE")

	self.Health:SetScript("OnEvent", function()
		threatColor(main)
	end)

	self.Health.PostUpdate = HealthPostUpdate
	self.Health.PostUpdateColor = HealthPostUpdateColor

	-- Absorb
	if C.raidframe.plugins_healcomm then
		local absorb = CreateFrame("StatusBar", nil, self)
		absorb:SetPoint("TOPLEFT", self.Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
		absorb:SetPoint("BOTTOMLEFT", self.Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
		absorb:SetStatusBarTexture(C.media.texture)
		absorb:SetStatusBarColor(1, 1, 0, 0.8)
		self.Health.DamageAbsorb = absorb

		-- Over absorb in right
		if C.raidframe.plugins_over_heal_absorb then
			local oa = CreateFrame("StatusBar", nil, self)
			oa:SetAllPoints(self.Health)
			oa:SetFrameLevel(self.Health:GetFrameLevel())
			oa:SetStatusBarTexture(C.media.blank)
			oa:SetReverseFill(true)
			oa:SetValue(0)

			local texture = oa:GetStatusBarTexture()
			texture:SetTexture([[Interface\AddOns\ShestakUI\Media\Textures\Cross.tga]], "REPEAT", "REPEAT")
			texture:SetVertexColor(0.5, 0.5, 1)
			texture:SetHorizTile(true)
			texture:SetVertTile(true)
			texture:SetAlpha(0.5)
			texture:SetBlendMode("ADD")
			self.Health.OverDamageAbsorbIndicator = oa

			hooksecurefunc(self.Health, "PostUpdate", function(self, unit, _, max)
				local absorb = UnitGetTotalAbsorbs(unit)
				oa:SetMinMaxValues(0, max)
				oa:SetValue(absorb)
			end)
		end
	end

	-- Register update functions as event handlers
	self:RegisterEvent("UNIT_NAME_UPDATE", UpdateName)
	self:RegisterEvent("PLAYER_TARGET_CHANGED", UpdateTarget, true)
	self:RegisterEvent("PLAYER_FOCUS_CHANGED", UpdateFocus, true)

	-- Disable movement via /moveui
	self.disableMovement = true

	if T.PostCreateNameplates then
		T.PostCreateNameplates(self, unit)
	end
end

oUF:RegisterStyle("ViksNameplates", style)
oUF:SetActiveStyle("ViksNameplates")
oUF:SpawnNamePlates("ViksNameplates")

oUFViksUI_NamePlateDriver:SetTargetCallback(callback)
oUFViksUI_NamePlateDriver:SetAddedCallback(callback)
oUFViksUI_NamePlateDriver:SetRemovedCallback(callback)
if C.nameplate.click_through then
	oUFViksUI_NamePlateDriver:SetFriendlyInteractible(false)
end