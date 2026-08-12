local T, C, L = unpack(ViksUI)
if C.unitframe.enable ~= true then return end
if C.layout2.enable ~= true then return end

-- Layout2 owns these settings in the standalone layout.
C.unitframe.lines = false
C.unitframe.extra_height_auto = false
C.media.texture = C.layout2.health_texture

----------------------------------------------------------------------------------------
--	UnitFrames based on oUF_Caellian(by Caellian)
----------------------------------------------------------------------------------------
local _, ns = ...
local oUF = ns.oUF

-- Frame size
if C.unitframe.extra_height_auto then
	C.unitframe.extra_health_height = C.font.unit_frames_font_size - 8
	C.unitframe.extra_power_height = C.font.unit_frames_font_size - 8
end
T.extraHeight = C.unitframe.extra_health_height + C.unitframe.extra_power_height

local player_width = C.unitframe.player_width
local pet_width = (player_width - 7) / 2
local boss_width = C.unitframe.boss_width

----------------------------------------------------------------------------------------
--=== LAYOUT2: TAG SYSTEM ===--
----------------------------------------------------------------------------------------
local Layout2Fonts = {
	name_font = {
		font = C.layout2.UFNamefont or C.font.unit_frames_font,
		size = C.layout2.name_font_size,
		style = C.layout2.name_font_style,
	},
	number_font = {
		font = C.layout2.pixel_font or C.font.unit_frames_font,
		size = C.layout2.number_font_size,
		style = C.layout2.number_font_style,
	},
}

local Layout2Shadow = {
	name_shadow = { enable = true, color = {0, 0, 0, 1}, offset_x = 1, offset_y = -2 },
	number_shadow = { enable = false, color = {0, 0, 0, 1}, offset_x = 1, offset_y = -1 },
}

local Layout2Tags = {
	player = {
		health_bar = {
			enable = true,
			top_left = { enable = C.layout2.player_health_top_left_enable, tag = C.layout2.player_health_top_left_tag, font_type = "name_font", x = 2, y = -1, justify = "LEFT" },
			top_center = { enable = C.layout2.player_health_top_center_enable, tag = C.layout2.player_health_top_center_tag, font_type = "name_font", x = 0, y = -1, justify = "CENTER" },
			top_right = { enable = C.layout2.player_health_top_right_enable, tag = C.layout2.player_health_top_right_tag, font_type = "number_font", size = 24, x = -2, y = -1, justify = "RIGHT" },
			bottom_right = { enable = C.layout2.player_health_bottom_right_enable, tag = C.layout2.player_health_bottom_right_tag, font_type = "number_font", x = -2, y = 1, justify = "RIGHT" },
		},
		text_bar = {
			enable = true,
			bottom_left = { enable = C.layout2.player_text_bar_bottom_left_enable, tag = C.layout2.player_text_bar_bottom_left_tag, font_type = "number_font", x = 2, y = 1, justify = "LEFT" },
			bottom_center = { enable = C.layout2.player_text_bar_bottom_center_enable, tag = C.layout2.player_text_bar_bottom_center_tag, font_type = "name_font", x = 0, y = 1, justify = "CENTER" },
			bottom_right = { enable = C.layout2.player_text_bar_bottom_right_enable, tag = C.layout2.player_text_bar_bottom_right_tag, font_type = "number_font", x = -2, y = 1, justify = "RIGHT" },
		},
	},
	target = {
		health_bar = {
			enable = true,
			top_left = { enable = C.layout2.target_health_top_left_enable, tag = C.layout2.target_health_top_left_tag, font_type = "name_font", x = 2, y = -1, justify = "LEFT" },
			top_center = { enable = C.layout2.target_health_top_center_enable, tag = C.layout2.target_health_top_center_tag, font_type = "name_font", x = 0, y = -1, justify = "CENTER" },
			top_right = { enable = C.layout2.target_health_top_right_enable, tag = C.layout2.target_health_top_right_tag, font_type = "number_font", x = -2, y = -1, justify = "RIGHT" },
			bottom_right = { enable = C.layout2.target_health_bottom_right_enable, tag = C.layout2.target_health_bottom_right_tag, font_type = "number_font", x = -2, y = 1, justify = "RIGHT" },
		},
		text_bar = {
			enable = true,
			bottom_left = { enable = C.layout2.target_text_bar_bottom_left_enable, tag = C.layout2.target_text_bar_bottom_left_tag, font_type = "number_font", x = 2, y = 1, justify = "LEFT" },
			bottom_center = { enable = C.layout2.target_text_bar_bottom_center_enable, tag = C.layout2.target_text_bar_bottom_center_tag, font_type = "number_font", x = 0, y = 1, justify = "CENTER" },
			bottom_right = { enable = C.layout2.target_text_bar_bottom_right_enable, tag = C.layout2.target_text_bar_bottom_right_tag, font_type = "number_font", x = -2, y = 1, justify = "RIGHT" },
		},
	},
}

local function CreateLayout2Tag(self, parent, tagConfig, point)
	if not tagConfig or not tagConfig.enable or tagConfig.tag == "" then return nil end
	local fontType = tagConfig.font_type or "name_font"
	local fontDefaults = Layout2Fonts[fontType] or Layout2Fonts.name_font
	local font = tagConfig.font or fontDefaults.font
	local size = tagConfig.size or fontDefaults.size
	local style = tagConfig.style or fontDefaults.style
	local fontString = T.SetFontString(parent, font, size, style)
	fontString:SetJustifyH(tagConfig.justify or "LEFT")
	fontString:SetPoint(point, parent, point, tagConfig.x or 0, tagConfig.y or 0)
	if fontType == "name_font" and Layout2Shadow.name_shadow.enable then
		fontString:SetShadowColor(unpack(Layout2Shadow.name_shadow.color))
		fontString:SetShadowOffset(Layout2Shadow.name_shadow.offset_x, Layout2Shadow.name_shadow.offset_y)
	elseif fontType == "number_font" and Layout2Shadow.number_shadow.enable then
		fontString:SetShadowColor(unpack(Layout2Shadow.number_shadow.color))
		fontString:SetShadowOffset(Layout2Shadow.number_shadow.offset_x, Layout2Shadow.number_shadow.offset_y)
	end
	self:Tag(fontString, tagConfig.tag)
	return fontString
end

local function ApplyHealthBarTags(self, unit)
	if not Layout2Tags[unit] or not Layout2Tags[unit].health_bar then return end
	if not Layout2Tags[unit].health_bar.enable then return end
	local config = Layout2Tags[unit].health_bar
	if not self.Health then return end
	if config.top_left and config.top_left.enable then
		self.Health.TagTopLeft = CreateLayout2Tag(self, self.Health, config.top_left, "TOPLEFT")
	end
	if config.top_center and config.top_center.enable then
		self.Health.TagTopCenter = CreateLayout2Tag(self, self.Health, config.top_center, "TOP")
	end
	if config.top_right and config.top_right.enable then
		self.Health.TagTopRight = CreateLayout2Tag(self, self.Health, config.top_right, "TOPRIGHT")
	end
	if config.bottom_right and config.bottom_right.enable then
		self.Health.TagBottomRight = CreateLayout2Tag(self, self.Health, config.bottom_right, "BOTTOMRIGHT")
	end
end

local function ApplyTextBarTags(self, textFrame, unit)
	if not Layout2Tags[unit] or not Layout2Tags[unit].text_bar then return end
	if not Layout2Tags[unit].text_bar.enable then return end
	local config = Layout2Tags[unit].text_bar
	if config.bottom_left and config.bottom_left.enable then
		CreateLayout2Tag(self, textFrame, config.bottom_left, "BOTTOMLEFT")
	end
	if config.bottom_center and config.bottom_center.enable then
		CreateLayout2Tag(self, textFrame, config.bottom_center, "BOTTOM")
	end
	if config.bottom_right and config.bottom_right.enable then
		CreateLayout2Tag(self, textFrame, config.bottom_right, "BOTTOMRIGHT")
	end
end

--=== LAYOUT2: API FUNCTIONS ===--
function T.UpdateLayout2Tag(unit, section, position, newTag)
	if Layout2Tags[unit] and Layout2Tags[unit][section] and Layout2Tags[unit][section][position] then
		Layout2Tags[unit][section][position].tag = newTag
	end
end

function T.SetLayout2TagEnabled(unit, section, position, enabled)
	if Layout2Tags[unit] and Layout2Tags[unit][section] and Layout2Tags[unit][section][position] then
		Layout2Tags[unit][section][position].enable = enabled
	end
end

function T.UpdateLayout2Font(fontType, key, value)
	if Layout2Fonts[fontType] then Layout2Fonts[fontType][key] = value end
end

function T.UpdateLayout2Shadow(shadowType, key, value)
	if Layout2Shadow[shadowType] then Layout2Shadow[shadowType][key] = value end
end

function T.GetLayout2Tags() return Layout2Tags end
function T.GetLayout2Fonts() return Layout2Fonts end
function T.GetLayout2Shadow() return Layout2Shadow end

-- Create layout
local function Shared(self, unit)
	-- Set our own colors
	self.colors = T.oUF_colors

	-- Register click
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	-- Focus click handling (Ctrl+Alt+Shift) Leftmouse set, right mouse clears
	self:SetAttribute("alt-ctrl-shift-type1", "macro")
	self:SetAttribute("alt-ctrl-shift-macrotext1", "/focus mouseover")
	self:SetAttribute("alt-ctrl-shift-type2", "macro")
	self:SetAttribute("alt-ctrl-shift-macrotext2", "/clearfocus")

	local unit = (unit and unit:find("arena%dtarget")) and "arenatarget"
	or (unit and unit:find("arena%d")) and "arena"
	or (unit and unit:find("boss%d")) and "boss" or unit

	local unitType = unit

	-- Menu
	if (unit == "arena" and C.unitframe.show_arena and unit ~= "arenatarget") or (unit == "boss" and C.unitframe.show_boss) then
		self:SetAttribute("type2", "focus")
		self:SetAttribute("type3", "macro")
		self:SetAttribute("macrotext3", "/clearfocus")
		self:SetAttribute('oUF-enableArenaPrep', false)
	else
		self:SetAttribute("*type2", "togglemenu")
	end

	-- Backdrop for every units
	self:CreateBackdrop("Default")
	self:SetFrameStrata("BACKGROUND")
	self.backdrop:SetFrameLevel(3)

	--=== LAYOUT2: THIN BORDER + SHADOW ===--
	if C.layout2.border_style or C.layout2.enable then
		self.backdrop:SetBackdrop({edgeFile = nil})
		self.backdrop:SetBackdropBorderColor(0, 0, 0, 0)
		CreateShadow(self)
	end

	-- Health bar
	self.Health = CreateFrame("StatusBar", self:GetName().."_Health", self)
	if unit == "player" or unit == "target" or unit == "arena" or unit == "boss" then
		self.Health:SetHeight(21 + C.unitframe.extra_health_height)
	elseif unit == "arenatarget" then
		self.Health:SetHeight(27 + T.extraHeight)
	else
		self.Health:SetHeight(13 + (C.unitframe.extra_health_height / 2))
	end
	self.Health:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0)
	self.Health:SetPoint("TOPRIGHT", self, "TOPRIGHT", 0, 0)
	self.Health:SetStatusBarTexture(C.media.texture)

	--=== LAYOUT2: HEALTH FRAME ===--
	if C.layout2.enable and (unitType == "player" or unitType == "target") then
		local healthFrame = CreateFrame("Frame", self:GetName().."_HealthFrame", self, "BackdropTemplate")
		healthFrame:SetSize(C.layout2.player_width, C.layout2.player_height)
		healthFrame:SetPoint("LEFT", self, "LEFT", 0, 2)
		healthFrame:SetFrameLevel(6)
		healthFrame:SetTemplate("Invisible")
		healthFrame:SetBackdropColor(unpack(C.media.border_color))
		CreateShadow(healthFrame)

		self.Health:SetParent(healthFrame)
		self.Health:ClearAllPoints()
		self.Health:SetAllPoints()
		self.Health:SetStatusBarTexture(C.layout2.health_texture)
		self.Health:SetFrameLevel(7)
	end

	if C.unitframe.own_color then
		self.Health.colorTapping = false
		self.Health.colorDisconnected = false
		self.Health.colorClass = false
		self.Health.colorReaction = false
		self.Health:SetStatusBarColor(unpack(C.unitframe.uf_color))
	else
		self.Health.colorTapping = true
		self.Health.colorDisconnected = true
		self.Health.colorClass = true
		self.Health.colorReaction = true
	end
	if C.unitframe.plugins_smooth_bar then
		self.Health.smoothing = Enum.StatusBarInterpolation.ExponentialEaseOut or 1
	end

	self.Health.PostUpdate = T.PostUpdateHealth
	self.Health.PostUpdateColor = T.PostUpdateHealthColor

	-- Health bar background
	self.Health.bg = self.Health:CreateTexture(nil, "BORDER")
	self.Health.bg:SetAllPoints()
	if C.layout2.enable and (unitType == "player" or unitType == "target") then
		self.Health.bg:SetTexture(C.layout2.health_texture)
	else
		self.Health.bg:SetTexture(C.media.texture)
	end
	if C.unitframe.own_color then
		self.Health.bg:SetVertexColor(unpack(C.unitframe.uf_color_bg))
	else
		self.Health.bg.multiplier = 0.2
	end

	-- Health value
	if unit ~= "arenatarget" then
		self.Health.value = T.SetFontString(self.Health, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		if unit == "player" or unit == "pet" or unit == "focus" then
			self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
			self.Health.value:SetJustifyH("RIGHT")
		elseif unit == "arena" then
			if C.unitframe.arena_on_right then
				self.Health.value:SetPoint("LEFT", self.Health, "LEFT", 2, 0)
				self.Health.value:SetJustifyH("LEFT")
			else
				self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
				self.Health.value:SetJustifyH("RIGHT")
			end
		elseif unit == "boss" then
			if C.unitframe.boss_on_right then
				self.Health.value:SetPoint("LEFT", self.Health, "LEFT", 2, 0)
				self.Health.value:SetJustifyH("LEFT")
			else
				self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
				self.Health.value:SetJustifyH("RIGHT")
			end
		else
			self.Health.value:SetPoint("LEFT", self.Health, "LEFT", 2, 0)
			self.Health.value:SetJustifyH("LEFT")
		end

		-- Health value when 100% hp (Midnight workaround)
		self.Health.short_value = T.SetFontString(self.Health, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		if unit == "player" or unit == "pet" or unit == "focus" then
			self.Health.short_value:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
			self.Health.short_value:SetJustifyH("RIGHT")
		elseif unit == "arena" then
			if C.unitframe.arena_on_right then
				self.Health.short_value:SetPoint("LEFT", self.Health, "LEFT", 2, 0)
				self.Health.short_value:SetJustifyH("LEFT")
			else
				self.Health.short_value:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
				self.Health.short_value:SetJustifyH("RIGHT")
			end
		elseif unit == "boss" then
			if C.unitframe.boss_on_right then
				self.Health.short_value:SetPoint("LEFT", self.Health, "LEFT", 2, 0)
				self.Health.short_value:SetJustifyH("LEFT")
			else
				self.Health.short_value:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
				self.Health.short_value:SetJustifyH("RIGHT")
			end
		else
			self.Health.short_value:SetPoint("LEFT", self.Health, "LEFT", 2, 0)
			self.Health.short_value:SetJustifyH("LEFT")
		end

		--=== LAYOUT2: HIDE DEFAULT HEALTH TAGS ===--
		if C.layout2.enable and (unitType == "player" or unitType == "target") then
			if self.Health.value then self.Health.value:Hide() end
			if self.Health.short_value then self.Health.short_value:Hide() end
		end

		-- Power bar
		self.Power = CreateFrame("StatusBar", self:GetName().."_Power", self)
		if unit == "player" or unit == "target" or unit == "arena" or unit == "boss" then
			self.Power:SetHeight(5 + C.unitframe.extra_power_height)
		else
			self.Power:SetHeight(2)
		end
		self.Power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -1)
		self.Power:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -1)
		self.Power:SetStatusBarTexture(C.media.texture)

		self.Power.frequentUpdates = true
		self.Power.colorDisconnected = true
		self.Power.colorTapping = true
		if C.unitframe.own_color then
			self.Power.colorClass = true
		else
			self.Power.colorPower = true
		end
		if C.unitframe.plugins_smooth_bar then
			self.Power.smoothing = Enum.StatusBarInterpolation.ExponentialEaseOut or 1
		end

		self.Power.PostUpdate = T.PostUpdatePower
		self.Power.PostUpdateColor = T.PostUpdatePowerColor
		self:RegisterEvent("UNIT_FLAGS", T.ForceUpdate)		-- Force when dead, to hide power
		self:RegisterEvent("UNIT_FACTION", T.ForceUpdate)	-- Force when alive, to show power

		-- Power background
		self.Power.bg = self.Power:CreateTexture(nil, "BORDER")
		self.Power.bg:SetAllPoints()
		self.Power.bg:SetTexture(C.media.texture)
		if C.unitframe.own_color and unit == "pet" then
			self.Power.bg:SetVertexColor(C.unitframe.uf_color[1], C.unitframe.uf_color[2], C.unitframe.uf_color[3], 0.2)
		else
			self.Power.bg.multiplier = 0.2
		end

		-- Power value
		if unit ~= "pet" and unit ~= "focus" and unit ~= "focustarget" and unit ~= "targettarget" then
			self.Power.value = T.SetFontString(self.Power, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			if unit == "player" then
				self.Power.value:SetPoint("RIGHT", self.Power, "RIGHT", 0, 0)
				self.Power.value:SetJustifyH("RIGHT")
			elseif unit == "arena" then
				if C.unitframe.arena_on_right then
					self.Power.value:SetPoint("LEFT", self.Power, "LEFT", 2, 0)
					self.Power.value:SetJustifyH("LEFT")
				else
					self.Power.value:SetPoint("RIGHT", self.Power, "RIGHT", 0, 0)
					self.Power.value:SetJustifyH("RIGHT")
				end
			elseif unit == "boss" then
				if C.unitframe.boss_on_right then
					self.Power.value:SetPoint("LEFT", self.Power, "LEFT", 2, 0)
					self.Power.value:SetJustifyH("LEFT")
				else
					self.Power.value:SetPoint("RIGHT", self.Power, "RIGHT", 0, 0)
					self.Power.value:SetJustifyH("RIGHT")
				end
			else
				self.Power.value:SetPoint("LEFT", self.Power, "LEFT", 2, 0)
				self.Power.value:SetJustifyH("LEFT")
			end

			-- Power value when 100% (Midnight workaround)
			self.Power.short_value = T.SetFontString(self.Power, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			if unit == "player" then
				self.Power.short_value:SetPoint("RIGHT", self.Power, "RIGHT", 0, 0)
				self.Power.short_value:SetJustifyH("RIGHT")
			elseif unit == "arena" then
				if C.unitframe.arena_on_right then
					self.Power.short_value:SetPoint("LEFT", self.Power, "LEFT", 2, 0)
					self.Power.short_value:SetJustifyH("LEFT")
				else
					self.Power.short_value:SetPoint("RIGHT", self.Power, "RIGHT", 0, 0)
					self.Power.short_value:SetJustifyH("RIGHT")
				end
			elseif unit == "boss" then
				if C.unitframe.boss_on_right then
					self.Power.short_value:SetPoint("LEFT", self.Power, "LEFT", 2, 0)
					self.Power.short_value:SetJustifyH("LEFT")
				else
					self.Power.short_value:SetPoint("RIGHT", self.Power, "RIGHT", 0, 0)
					self.Power.short_value:SetJustifyH("RIGHT")
				end
			else
				self.Power.short_value:SetPoint("LEFT", self.Power, "LEFT", 2, 0)
				self.Power.short_value:SetJustifyH("LEFT")
			end
		end
	end

	-- Names and level
	if unit ~= "player" then
		self.Info = T.SetFontString(self.Health, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		self.Info:SetWordWrap(false)
		if unit ~= "arenatarget" then
			self.Level = T.SetFontString(self.Power, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		end
		if unit == "target" then
			self.Info:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
			self.Info:SetPoint("LEFT", self.Health.value, "RIGHT", 0, 0)
			self.Info:SetJustifyH("RIGHT")
			self:Tag(self.Info, "[GetNameColor][NameLong]")
			self.Level:SetPoint("RIGHT", self.Power, "RIGHT", 0, 0)
			self:Tag(self.Level, "[cpoints] [Threat] [DiffColor][level][shortclassification]")
		elseif unit == "focus" or unit == "pet" then
			self.Info:SetPoint("LEFT", self.Health, "LEFT", 2, 0)
			self.Info:SetPoint("RIGHT", self.Health.value, "LEFT", 0, 0)
			self.Info:SetJustifyH("LEFT")
			if unit == "pet" then
				self:Tag(self.Info, "[PetNameColor][NameMedium]")
			else
				self:Tag(self.Info, "[GetNameColor][NameMedium]")
			end
		elseif unit == "arenatarget" then
			-- self.Info:SetPoint("CENTER", self.Health, "CENTER", 1, 0) -- BETA while we can't crop name
			self.Info:SetPoint("LEFT", self.Health, "LEFT", 1, 0)
			self.Info:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
			self:Tag(self.Info, "[GetNameColor][NameArena]")
		elseif unit == "arena" then
			if C.unitframe.arena_on_right then
				self.Info:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
				self.Info:SetPoint("LEFT", self.Health.value, "RIGHT", 0, 0)
				self.Info:SetJustifyH("RIGHT")
			else
				self.Info:SetPoint("LEFT", self.Health, "LEFT", 2, 0)
				self.Info:SetPoint("RIGHT", self.Health.value, "LEFT", 0, 0)
				self.Info:SetJustifyH("LEFT")
			end
			self:Tag(self.Info, "[GetNameColor][NameMedium]")
		elseif unit == "boss" then
			if C.unitframe.boss_on_right then
				self.Info:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
				self.Info:SetPoint("LEFT", self.Health.value, "RIGHT", 0, 0)
				self.Info:SetJustifyH("RIGHT")
			else
				self.Info:SetPoint("LEFT", self.Health, "LEFT", 2, 0)
				self.Info:SetPoint("RIGHT", self.Health.value, "LEFT", 0, 0)
				self.Info:SetJustifyH("LEFT")
			end
			self:Tag(self.Info, "[GetNameColor][NameMedium]")
		else
			self.Info:SetPoint("RIGHT", self.Health, "RIGHT", 0, 0)
			self.Info:SetPoint("LEFT", self.Health.value, "RIGHT", 0, 0)
			self.Info:SetJustifyH("RIGHT")
			self:Tag(self.Info, "[GetNameColor][NameMedium]")
		end
	end

	-- ========== POWER FRAME SETUP (Layout2 exact) ==========
	if C.layout2.enable and (unitType == "player" or unitType == "target") then
		local powerFrame = CreateFrame("Frame", self:GetName().."_PowerFrame", self, "BackdropTemplate")
		powerFrame:SetSize(C.layout2.player_width, C.layout2.player_height)

		if unitType == "player" then
			powerFrame:SetPoint("TOPLEFT", self.Health, "TOPLEFT", -6, -7)
		elseif unitType == "target" then
			powerFrame:SetPoint("TOPRIGHT", self.Health, "TOPRIGHT", 6, -7)
		end

		powerFrame:SetFrameLevel(5)
		powerFrame:SetTemplate("Default")
		powerFrame:SetBackdropColor(unpack(C.media.border_color))
		CreateShadow(powerFrame)

		-- Move the ORIGINAL oUF Power element into the independent PowerFrame.
		self.Power:SetParent(powerFrame)
		self.Power:ClearAllPoints()
		self.Power:SetAllPoints()
		self.Power:SetStatusBarTexture(C.layout2.power_texture)
		self.Power:SetFrameLevel(5)
		self.Power.colorClass = true

		if not self.Power.bg then
			self.Power.bg = self.Power:CreateTexture(nil, "BORDER")
			self.Power.bg:SetAllPoints()
			self.Power.bg:SetTexture(C.layout2.power_texture)
			self.Power.bg:SetVertexColor(0.1, 0.1, 0.1, 0.2)
		end

		if self.Power.value then self.Power.value:Hide() end
		if self.Power.short_value then self.Power.short_value:Hide() end
	end

	--=== LAYOUT2: HIDE DEFAULT INFO/LEVEL + CUSTOM TAGS + TEXT FRAME ===--
	if C.layout2.enable and (unitType == "player" or unitType == "target") then
		if self.Info then self.Info:Hide() end
		if self.Level then self.Level:Hide() end

		ApplyHealthBarTags(self, unitType)

		local textFrame = CreateFrame("Frame", self:GetName().."_TextFrame", self, "BackdropTemplate")
		textFrame:SetSize(C.layout2.player_width, C.layout2.player_height)
		if unitType == "player" then
			textFrame:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 6, 13)
		elseif unitType == "target" then
			textFrame:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", -6, 13)
		end
		textFrame:SetFrameLevel(4)
		textFrame:SetTemplate("Default")

		local textBarTexture = textFrame:CreateTexture(nil, "BACKGROUND")
		textBarTexture:SetAllPoints()
		textBarTexture:SetTexture(C.layout2.textbar_texture)
		textBarTexture:SetVertexColor(0.125, 0.125, 0.125, 1)

		ApplyTextBarTags(self, textFrame, unitType)
		self.Layout2TextFrame = textFrame
	end

	if unit == "player" then
		-- Low mana text
		if T.class ~= "DEATHKNIGHT" and T.class ~= "DEMONHUNTER" and T.class ~= "HUNTER" and T.class ~= "ROGUE" and T.class ~= "WARRIOR" then
			self.LowMana = CreateFrame("Frame", self:GetName().."_LowMana", self)
			self.LowMana:SetScript("OnUpdate", T.UpdateManaLevel)
			self.LowMana:SetFrameLevel(self.Health:GetFrameLevel() + 1)
			self.LowMana:SetAllPoints(self.Health)

			self.LowMana.Text = T.SetFontString(self.LowMana, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			self.LowMana.Text:SetText("|cffaf5050"..MANA_LOW.."|r")
			self.LowMana.Text:SetPoint("CENTER", 0, 0)
			self.LowMana.Text:SetAlpha(0)
		end

		-- Combat icon
		if C.unitframe.icons_combat then
			self.CombatIndicator = self.Health:CreateTexture(nil, "OVERLAY")
			self.CombatIndicator:SetSize(14, 14)
			self.CombatIndicator:SetPoint("TOPRIGHT", 4, 8)
		end

		-- Resting icon
		if C.unitframe.icons_resting then
			self.RestingIndicator = self.Health:CreateTexture(nil, "OVERLAY")
			self.RestingIndicator:SetSize(18, 18)
			self.RestingIndicator:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", -8, -8)
		end

		-- Leader/Assistant icons
		if C.raidframe.icons_leader then
			-- Leader icon
			self.LeaderIndicator = self.Health:CreateTexture(nil, "OVERLAY")
			self.LeaderIndicator:SetSize(14, 14)
			self.LeaderIndicator:SetPoint("TOPLEFT", -3, 9)

			-- Assistant icon
			self.AssistantIndicator = self.Health:CreateTexture(nil, "OVERLAY")
			self.AssistantIndicator:SetSize(12, 12)
			self.AssistantIndicator:SetPoint("TOPLEFT", -3, 8)
		end

		-- LFD role icons
		if C.raidframe.icons_role then
			self.GroupRoleIndicator = self.Health:CreateTexture(nil, "OVERLAY")
			self.GroupRoleIndicator:SetSize(12, 12)
			self.GroupRoleIndicator:SetPoint("TOPLEFT", 10, 8)
		end

		--=== LAYOUT2: INDICATOR REPOSITION ===--
		if C.layout2.enable then
			if self.CombatIndicator then
				self.CombatIndicator:SetSize(20, 24)
				self.CombatIndicator:ClearAllPoints()
				self.CombatIndicator:SetPoint("TOPRIGHT", self.Health, "TOPRIGHT", -2, -2)
				self.CombatIndicator:SetTexture("Interface\\AddOns\\ViksUI\\Media\\Other\\combat2")
			end
			if self.RestingIndicator then
				self.RestingIndicator:SetSize(18, 18)
				self.RestingIndicator:ClearAllPoints()
				self.RestingIndicator:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", -4, -4)
				self.RestingIndicator:SetTexture("Interface\\AddOns\\ViksUI\\Media\\Other\\resting")
			end
			if self.LeaderIndicator then
				self.LeaderIndicator:SetSize(14, 14)
				self.LeaderIndicator:ClearAllPoints()
				self.LeaderIndicator:SetPoint("TOPLEFT", self.Health, "TOPLEFT", 2, -18)
			end
			if self.AssistantIndicator then
				self.AssistantIndicator:SetSize(12, 12)
				self.AssistantIndicator:ClearAllPoints()
				self.AssistantIndicator:SetPoint("TOPLEFT", self.Health, "TOPLEFT", 2, -32)
			end
			if self.GroupRoleIndicator then
				self.GroupRoleIndicator:SetSize(12, 12)
				self.GroupRoleIndicator:ClearAllPoints()
				self.GroupRoleIndicator:SetPoint("TOPRIGHT", self.Health, "TOPRIGHT", -16, -2)
			end
			if self.LowMana and self.LowMana.Text then
				self.LowMana.Text:SetFont(C.layout2.UFNamefont or C.font.unit_frames_font, C.layout2.name_font_size, C.layout2.name_font_style)
			end
		end

		-- Rune bar
		if C.unitframe_class_bar.rune and T.class == "DEATHKNIGHT" then
			self.Runes = CreateFrame("Frame", self:GetName().."_RuneBar", self)
			self.Runes:CreateBackdrop("Default")
			self.Runes:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
			self.Runes:SetSize(player_width, 7)
			self.Runes.colorSpec = true
			self.Runes.sortOrder = "asc"

			self.Runes.PostUpdateColor = function(element, color)
				for index = 1, #element do
					T.PostUpdateBackdropColor(element[index], color)
				end
			end

			for i = 1, 6 do
				self.Runes[i] = CreateFrame("StatusBar", self:GetName().."_Rune"..i, self.Runes)
				self.Runes[i]:SetSize((player_width - 5) / 6, 7)
				if i == 1 then
					self.Runes[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
				else
					self.Runes[i]:SetPoint("TOPLEFT", self.Runes[i-1], "TOPRIGHT", 1, 0)
				end
				self.Runes[i]:SetStatusBarTexture(C.media.texture)

				self.Runes[i].bg = self.Runes[i]:CreateTexture(nil, "BORDER")
				self.Runes[i].bg:SetAllPoints()
				self.Runes[i].bg:SetTexture(C.media.texture)
				self.Runes[i].bg.multiplier = 0.2
			end
		end

		-- Soul fragments bar
		if C.unitframe_class_bar.soul and T.class == "DEMONHUNTER" then
			self.SoulFragments = CreateFrame("StatusBar", self:GetName().."_SoulFragments", self)
			self.SoulFragments:CreateBackdrop("Default")
			self.SoulFragments:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
			self.SoulFragments:SetSize(player_width, 7)
			self.SoulFragments:SetStatusBarTexture(C.media.texture)

			self.SoulFragments:GetStatusBarTexture():SetVertexColor(0.4, 0, 1, 1)

			self.SoulFragments.bg = self.SoulFragments:CreateTexture(nil, "BORDER")
			self.SoulFragments.bg:SetAllPoints()
			self.SoulFragments.bg:SetTexture(C.media.texture)
			self.SoulFragments.bg:SetVertexColor(0.4, 0, 1, 0.2)

			self.SoulFragments.Text = T.SetFontString(self.SoulFragments, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			self.SoulFragments.Text:SetPoint("CENTER", self.SoulFragments, "CENTER", 0, 0)

			if C.unitframe.plugins_smooth_bar then
				self.SoulFragments.smoothing = Enum.StatusBarInterpolation.ExponentialEaseOut or 1
			end
		end

		-- Essence bar
		if C.unitframe_class_bar.essence and T.class == "EVOKER" then
			self.Essence = CreateFrame("Frame", self:GetName().."_Essence", self, "BackdropTemplate", "BackdropTemplate")
			self.Essence:CreateBackdrop("Default")
			self.Essence:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
			self.Essence:SetSize(player_width, 7)

			for i = 1, 6 do
				self.Essence[i] = CreateFrame("StatusBar", self:GetName().."_Essence"..i, self.Essence, "BackdropTemplate")
				self.Essence[i]:SetSize((player_width - 5) / 6, 7)
				if i == 1 then
					self.Essence[i]:SetPoint("LEFT", self.Essence)
				else
					self.Essence[i]:SetPoint("TOPLEFT", self.Essence[i-1], "TOPRIGHT", 1, 0)
				end
				self.Essence[i]:SetStatusBarTexture(C.media.texture)
				self.Essence[i]:SetStatusBarColor(0.2, 0.58, 0.5)

				self.Essence[i].bg = self.Essence[i]:CreateTexture(nil, "BORDER")
				self.Essence[i].bg:SetAllPoints()
				self.Essence[i].bg:SetTexture(C.media.texture)
				self.Essence[i].bg:SetVertexColor(0.2, 0.58, 0.5, 0.2)
			end
		end

		-- Arcane Charge bar
		if C.unitframe_class_bar.arcane and T.class == "MAGE" then
			self.ArcaneCharge = CreateFrame("Frame", self:GetName().."_ArcaneChargeBar", self)
			self.ArcaneCharge:CreateBackdrop("Default")
			self.ArcaneCharge:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
			self.ArcaneCharge:SetSize(player_width, 7)

			for i = 1, 4 do
				self.ArcaneCharge[i] = CreateFrame("StatusBar", self:GetName().."_ArcaneCharge"..i, self.ArcaneCharge)
				self.ArcaneCharge[i]:SetSize((player_width - 3) / 4, 7)
				if i == 1 then
					self.ArcaneCharge[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
				else
					self.ArcaneCharge[i]:SetPoint("TOPLEFT", self.ArcaneCharge[i-1], "TOPRIGHT", 1, 0)
				end
				self.ArcaneCharge[i]:SetStatusBarTexture(C.media.texture)
				self.ArcaneCharge[i]:SetStatusBarColor(0.4, 0.8, 1)

				self.ArcaneCharge[i].bg = self.ArcaneCharge[i]:CreateTexture(nil, "BORDER")
				self.ArcaneCharge[i].bg:SetAllPoints()
				self.ArcaneCharge[i].bg:SetTexture(C.media.texture)
				self.ArcaneCharge[i].bg:SetVertexColor(0.4, 0.8, 1, 0.2)
			end
		end

		if T.class == "MONK" then
			-- Chi bar
			if C.unitframe_class_bar.chi then
				self.HarmonyBar = CreateFrame("Frame", self:GetName().."_HarmonyBar", self)
				self.HarmonyBar:CreateBackdrop("Default")
				self.HarmonyBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
				self.HarmonyBar:SetSize(player_width, 7)

				for i = 1, 6 do
					self.HarmonyBar[i] = CreateFrame("StatusBar", self:GetName().."_Harmony"..i, self.HarmonyBar)
					self.HarmonyBar[i]:SetSize((player_width - 5) / 6, 7)
					if i == 1 then
						self.HarmonyBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
					else
						self.HarmonyBar[i]:SetPoint("TOPLEFT", self.HarmonyBar[i-1], "TOPRIGHT", 1, 0)
					end
					self.HarmonyBar[i]:SetStatusBarTexture(C.media.texture)
					self.HarmonyBar[i]:SetStatusBarColor(0.33, 0.63, 0.33)

					self.HarmonyBar[i].bg = self.HarmonyBar[i]:CreateTexture(nil, "BORDER")
					self.HarmonyBar[i].bg:SetAllPoints()
					self.HarmonyBar[i].bg:SetTexture(C.media.texture)
					self.HarmonyBar[i].bg:SetVertexColor(0.33, 0.63, 0.33, 0.2)
				end
			end

			-- Stagger bar
			if C.unitframe_class_bar.stagger then
				self.Stagger = CreateFrame("StatusBar", self:GetName().."_Stagger", self)
				self.Stagger:CreateBackdrop("Default")
				self.Stagger:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
				self.Stagger:SetSize(player_width, 7)
				self.Stagger:SetStatusBarTexture(C.media.texture)

				self.Stagger.bg = self.Stagger:CreateTexture(nil, "BORDER")
				self.Stagger.bg:SetAllPoints()
				self.Stagger.bg:SetTexture(C.media.texture)
				self.Stagger.bg.multiplier = 0.2

				self.Stagger.Text = T.SetFontString(self.Stagger, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
				self.Stagger.Text:SetPoint("CENTER", self.Stagger, "CENTER", 0, 0)

				self.Stagger.PostUpdateColor = function(element, color)
					T.PostUpdateBackdropColor(element, color)
				end

				self.Stagger.PostVisibility = function(element, isVisible)
					if isVisible then
						if element.__owner.Debuffs then element.__owner.Debuffs:SetPoint("BOTTOMRIGHT", element.__owner, "TOPRIGHT", 2, 19) end
					else
						if C_SpecializationInfo.GetSpecialization() ~= SPEC_MONK_WINDWALKER then -- Windwalker has own chi bar
							if element.__owner.Debuffs then element.__owner.Debuffs:SetPoint("BOTTOMRIGHT", element.__owner, "TOPRIGHT", 2, 5) end
			end
		end

	end

				if C.unitframe.plugins_smooth_bar then
					self.Stagger.smoothing = Enum.StatusBarInterpolation.ExponentialEaseOut or 1
				end
			end
		end

		-- Holy Power bar
		if C.unitframe_class_bar.holy and T.class == "PALADIN" then
			self.HolyPower = CreateFrame("Frame", self:GetName().."_HolyPowerBar", self)
			self.HolyPower:CreateBackdrop("Default")
			self.HolyPower:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
			self.HolyPower:SetSize(player_width, 7)

			for i = 1, 5 do
				self.HolyPower[i] = CreateFrame("StatusBar", self:GetName().."_HolyPower"..i, self.HolyPower)
				self.HolyPower[i]:SetSize((player_width - 4) / 5, 7)
				if i == 1 then
					self.HolyPower[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
				else
					self.HolyPower[i]:SetPoint("TOPLEFT", self.HolyPower[i-1], "TOPRIGHT", 1, 0)
				end
				self.HolyPower[i]:SetStatusBarTexture(C.media.texture)
				self.HolyPower[i]:SetStatusBarColor(0.89, 0.88, 0.1)

				self.HolyPower[i].bg = self.HolyPower[i]:CreateTexture(nil, "BORDER")
				self.HolyPower[i].bg:SetAllPoints()
				self.HolyPower[i].bg:SetTexture(C.media.texture)
				self.HolyPower[i].bg:SetVertexColor(0.89, 0.88, 0.1, 0.2)
			end
		end

		-- Rogue/Druid Combo bar
		if C.unitframe_class_bar.combo and C.unitframe_class_bar.combo_old ~= true and (T.class == "ROGUE" or T.class == "DRUID") then
			self.ComboPoints = CreateFrame("Frame", self:GetName().."_ComboBar", self)
			self.ComboPoints:CreateBackdrop("Default")
			self.ComboPoints:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
			self.ComboPoints:SetSize(player_width, 7)

			for i = 1, 7 do
				self.ComboPoints[i] = CreateFrame("StatusBar", self:GetName().."_Combo"..i, self.ComboPoints)
				self.ComboPoints[i]:SetSize((player_width - 5) / 7, 7)
				if i == 1 then
					self.ComboPoints[i]:SetPoint("LEFT", self.ComboPoints)
				else
					self.ComboPoints[i]:SetPoint("LEFT", self.ComboPoints[i-1], "RIGHT", 1, 0)
				end
				self.ComboPoints[i]:SetStatusBarTexture(C.media.texture)
			end
		end

		-- Totem bar for Shaman
		if C.unitframe_class_bar.totem and T.class == "SHAMAN" then
			self.TotemBar = CreateFrame("Frame", self:GetName().."_TotemBar", self)
			self.TotemBar:CreateBackdrop("Default")
			self.TotemBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
			self.TotemBar:SetSize(player_width, 7)
			self.TotemBar.Destroy = true

			for i = 1, 4 do
				self.TotemBar[i] = CreateFrame("StatusBar", self:GetName().."_Totem"..i, self.TotemBar)
				self.TotemBar[i]:SetSize((player_width - 3) / 4, 7)

				if i == 1 then
					self.TotemBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
				else
					self.TotemBar[i]:SetPoint("TOPLEFT", self.TotemBar[i-1], "TOPRIGHT", 1, 0)
				end
				self.TotemBar[i]:SetStatusBarTexture(C.media.texture)
				self.TotemBar[i]:SetMinMaxValues(0, 1)

				self.TotemBar[i].bg = self.TotemBar[i]:CreateTexture(nil, "BORDER")
				self.TotemBar[i].bg:SetAllPoints()
				self.TotemBar[i].bg:SetTexture(C.media.texture)
				self.TotemBar[i].bg.multiplier = 0.2
			end
		end

		-- Totem bar for other classes
		if C.unitframe_class_bar.totem and C.unitframe_class_bar.totem_other and T.class ~= "SHAMAN" then
			self.TotemBar = CreateFrame("Frame", self:GetName().."_TotemBar", self)
			self.TotemBar:SetFrameLevel(self.Health:GetFrameLevel() + 2)
			self.TotemBar:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0)
			self.TotemBar:SetSize(140, 7)
			self.TotemBar.Destroy = true

			for i = 1, 4 do
				self.TotemBar[i] = CreateFrame("StatusBar", self:GetName().."_Totem"..i, self.TotemBar)
				self.TotemBar[i]:SetSize(140 / 4, 7)
				if i == 1 then
					self.TotemBar[i]:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0)
				else
					self.TotemBar[i]:SetPoint("TOPLEFT", self.TotemBar[i-1], "TOPRIGHT", 0, 0)
				end
				self.TotemBar[i]:SetStatusBarTexture(C.media.texture)
				self.TotemBar[i]:SetMinMaxValues(0, 1)
				self.TotemBar[i]:CreateBorder(false, true)

				self.TotemBar[i].bg = self.TotemBar[i]:CreateTexture(nil, "BORDER")
				self.TotemBar[i].bg:SetAllPoints()
				self.TotemBar[i].bg:SetTexture(C.media.texture)
				self.TotemBar[i].bg.multiplier = 0.2
			end
		end

		-- Soul Shards bar
		if C.unitframe_class_bar.shard and T.class == "WARLOCK" then
			self.SoulShards = CreateFrame("Frame", self:GetName().."_SoulShardsBar", self)
			self.SoulShards:CreateBackdrop("Default")
			self.SoulShards:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
			self.SoulShards:SetSize(player_width, 7)

			for i = 1, 5 do
				self.SoulShards[i] = CreateFrame("StatusBar", self:GetName().."_SoulShards"..i, self.SoulShards)
				self.SoulShards[i]:SetSize((player_width - 4) / 5, 7)
				if i == 1 then
					self.SoulShards[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
				else
					self.SoulShards[i]:SetPoint("TOPLEFT", self.SoulShards[i-1], "TOPRIGHT", 1, 0)
				end
				self.SoulShards[i]:SetStatusBarTexture(C.media.texture)
				self.SoulShards[i]:SetStatusBarColor(0.9, 0.37, 0.37)

				self.SoulShards[i].bg = self.SoulShards[i]:CreateTexture(nil, "BORDER")
				self.SoulShards[i].bg:SetAllPoints()
				self.SoulShards[i].bg:SetTexture(C.media.texture)
				self.SoulShards[i].bg:SetVertexColor(0.9, 0.37, 0.37, 0.2)
			end
		end

		--=== LAYOUT2: CLASS BAR RESIZE ===--
		if C.layout2.enable then
			local l2w = C.layout2.player_width - 3
			if self.Runes then
				self.Runes:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.Runes:SetSize(l2w, 7)
				for i = 1, 6 do
					if self.Runes[i] then self.Runes[i]:SetSize((l2w - 5) / 6, 7) end
					if i == 1 then self.Runes[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7) end
				end
			end
			if self.SoulFragments then
				self.SoulFragments:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.SoulFragments:SetSize(l2w, 7)
			end
			if self.Essence then
				self.Essence:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.Essence:SetSize(l2w, 7)
				for i = 1, 6 do
					if self.Essence[i] then self.Essence[i]:SetSize((l2w - 5) / 6, 7) end
					if i == 1 then self.Essence[i]:SetPoint("LEFT", self.Essence) end
				end
			end
			if self.ArcaneCharge then
				self.ArcaneCharge:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.ArcaneCharge:SetSize(l2w, 7)
				for i = 1, 4 do
					if self.ArcaneCharge[i] then self.ArcaneCharge[i]:SetSize((l2w - 3) / 4, 7) end
					if i == 1 then self.ArcaneCharge[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7) end
				end
			end
			if self.HarmonyBar then
				self.HarmonyBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.HarmonyBar:SetSize(l2w, 7)
				for i = 1, 6 do
					if self.HarmonyBar[i] then self.HarmonyBar[i]:SetSize((l2w - 5) / 6, 7) end
					if i == 1 then self.HarmonyBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7) end
				end
			end
			if self.Stagger then
				self.Stagger:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.Stagger:SetSize(l2w, 7)
			end
			if self.HolyPower then
				self.HolyPower:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.HolyPower:SetSize(l2w, 7)
				for i = 1, 5 do
					if self.HolyPower[i] then self.HolyPower[i]:SetSize((l2w - 4) / 5, 7) end
					if i == 1 then self.HolyPower[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7) end
				end
			end
			if self.ComboPoints then
				self.ComboPoints:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.ComboPoints:SetSize(l2w, 7)
				for i = 1, 7 do
					if self.ComboPoints[i] then self.ComboPoints[i]:SetSize((l2w - 5) / 7, 7) end
					if i == 1 then self.ComboPoints[i]:SetPoint("LEFT", self.ComboPoints) end
				end
			end
			if self.SoulShards then
				self.SoulShards:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.SoulShards:SetSize(l2w, 7)
				for i = 1, 5 do
					if self.SoulShards[i] then self.SoulShards[i]:SetSize((l2w - 4) / 5, 7) end
					if i == 1 then self.SoulShards[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7) end
				end
			end
			if self.TotemBar then
				self.TotemBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
				self.TotemBar:SetSize(C.layout2.player_width - 2, 7)
				for i = 1, 4 do
					if self.TotemBar[i] then self.TotemBar[i]:SetSize((C.layout2.player_width - 2 - 3) / 4, 7) end
					if i == 1 then self.TotemBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7) end
				end
			end
		end

		-- Additional mana for caster
		if T.class == "DRUID" or T.class == "PRIEST" or T.class == "SHAMAN" then
			CreateFrame("Frame"):SetScript("OnUpdate", function(_, elapsed) T.UpdateClassMana(self, elapsed) end)
			self.ClassMana = T.SetFontString(self.Power, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			self.ClassMana:SetTextColor(1, 0.49, 0.04)
		end

		-- Experience bar
		if C.unitframe.plugins_experience_bar then
			self.Experience = CreateFrame("StatusBar", self:GetName().."_Experience", self)
			self.Experience:CreateBackdrop("Default")
			self.Experience:EnableMouse(true)
			if C.unitframe.portrait_enable and C.unitframe.portrait_type ~= "OVERLAY" then
				self.Experience:SetPoint("TOPRIGHT", self, "TOPLEFT", -18 - C.unitframe.portrait_width - (2 * T.mult), 28)
			else
				self.Experience:SetPoint("TOPRIGHT", self, "TOPLEFT", -11, 28)
			end
			self.Experience:SetSize(7, 94 + T.extraHeight + (C.unitframe.extra_health_height / 2))
			self.Experience:SetOrientation("Vertical")
			self.Experience:SetStatusBarTexture(C.media.texture)

			self.Experience.bg = self.Experience:CreateTexture(nil, "BORDER")
			self.Experience.bg:SetAllPoints()
			self.Experience.bg:SetTexture(C.media.texture)

			self.Experience.Rested = CreateFrame("StatusBar", nil, self.Experience)
			self.Experience.Rested:SetOrientation("Vertical")
			self.Experience.Rested:SetAllPoints()
			self.Experience.Rested:SetStatusBarTexture(C.media.texture)

			self.Experience.inAlpha = 1
			self.Experience.outAlpha = 0
		end

		-- Reputation bar
		if C.unitframe.plugins_reputation_bar then
			self.Reputation = CreateFrame("StatusBar", self:GetName().."_Reputation", self)
			self.Reputation:CreateBackdrop("Default")
			self.Reputation:EnableMouse(true)
			if C.unitframe.portrait_enable and C.unitframe.portrait_type ~= "OVERLAY" then
				if self.Experience and self.Experience:IsShown() then
					self.Reputation:SetPoint("TOPRIGHT", self.Experience, "TOPLEFT", -7, 0)
				else
					self.Reputation:SetPoint("TOPRIGHT", self, "TOPLEFT", -18 - C.unitframe.portrait_width - (2 * T.mult), 28)
				end
			else
				if self.Experience and self.Experience:IsShown() then
					self.Reputation:SetPoint("TOPRIGHT", self.Experience, "TOPLEFT", -7, 0)
				else
					self.Reputation:SetPoint("TOPRIGHT", self, "TOPLEFT", -11, 28)
				end
			end
			self.Reputation:SetSize(7, 94 + T.extraHeight + (C.unitframe.extra_health_height / 2))
			self.Reputation:SetOrientation("Vertical")
			self.Reputation:SetStatusBarTexture(C.media.texture)

			self.Reputation.bg = self.Reputation:CreateTexture(nil, "BORDER")
			self.Reputation.bg:SetAllPoints()
			self.Reputation.bg:SetTexture(C.media.texture)

			self.Reputation.inAlpha = 1
			self.Reputation.outAlpha = 0
			self.Reputation.colorStanding = true
		end

		--=== LAYOUT2: EXPERIENCE/REPUTATION BAR REPOSITION ===--
		if C.layout2.enable then
			if self.Experience then
				self.Experience:ClearAllPoints()
				self.Experience:SetPoint("TOPRIGHT", self.Portrait, "TOPLEFT", -2, -4)
				self.Experience:SetSize(3, C.layout2.portrait_size - 14)
				self.Experience:SetFrameLevel(8)
			end
			if self.Reputation then
				self.Reputation:ClearAllPoints()
				self.Reputation:SetPoint("TOPRIGHT", self.Experience, "TOPLEFT", -6, 0)
				self.Reputation:SetSize(3, C.layout2.portrait_size - 14)
				self.Reputation:SetFrameLevel(8)
			end
		end

		-- GCD spark
		if C.unitframe.plugins_gcd then
			self.GCD = CreateFrame("Frame", self:GetName().."_GCD", self)
			self.GCD:SetWidth(player_width + 3)
			self.GCD:SetHeight(3)
			self.GCD:SetFrameStrata("HIGH")
			self.GCD:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 0)

			self.GCD.Color = {1, 1, 1}
			self.GCD.Height = T.Scale(3)
			self.GCD.Width = T.Scale(4)
		end

		-- Absorbs value
		if C.unitframe.plugins_absorbs then
			self.Absorbs = T.SetFontString(self.Health, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			self.Absorbs:SetPoint("LEFT", self.Health, "LEFT", 4, 0)
			self:Tag(self.Absorbs, "[Absorbs]")
		end
	end

	-- Counter bar (Darkmoon Fair) -- Midnight secret error
	-- if unit == "player" or unit == "pet" then
		-- self.CounterBar = CreateFrame("StatusBar", self:GetName().."_CounterBar", self)
		-- self.CounterBar:CreateBackdrop("Default")
		-- self.CounterBar:SetWidth(221)
		-- self.CounterBar:SetHeight(20)
		-- self.CounterBar:SetStatusBarTexture(C.media.texture)
		-- self.CounterBar:SetPoint("TOP", UIParent, "TOP", 0, -102)

		-- self.CounterBar.bg = self.CounterBar:CreateTexture(nil, "BORDER")
		-- self.CounterBar.bg:SetAllPoints()
		-- self.CounterBar.bg:SetTexture(C.media.texture)

		-- self.CounterBar.Text = T.SetFontString(self.CounterBar, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		-- self.CounterBar.Text:SetPoint("CENTER")

		-- self.CounterBar:SetScript("OnValueChanged", function(_, value)
			-- local _, max = self.CounterBar:GetMinMaxValues()
			-- local r, g, b = oUF:ColorGradient(value, max, 0.8, 0, 0, 0.8, 0.8, 0, 0, 0.8, 0)
			-- self.CounterBar:SetStatusBarColor(r, g, b)
			-- self.CounterBar.bg:SetVertexColor(r, g, b, 0.2)
			-- self.CounterBar.Text:SetText(floor(value))
		-- end)
	-- end

	-- Debuff icons
	if unit == "pet" and C.aura.pet_debuffs or unit == "focus" and C.aura.focus_debuffs
	or unit == "focustarget" and C.aura.fot_debuffs or unit == "targettarget" and C.aura.tot_debuffs then
		self.Debuffs = self:CreateAuras({
			initialAnchor = (unit == "pet" or unit == "focus") and "TOPRIGHT" or "TOPLEFT",
			growthX = (unit == "pet" or unit == "focus") and "LEFT" or "RIGHT",
			growthY = "DOWN",
			layoutLimit = pet_width + 4,
		})
		self.Debuffs:SetHeight(25)
		self.Debuffs:SetWidth(pet_width + 4)
		self.Debuffs.size = T.Scale(C.aura.debuff_size)
		self.Debuffs.elementSpacing = T.Scale(3)
		self.Debuffs.num = 4
		if unit == "pet" or unit == "focus" then
			self.Debuffs:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 2, -17)
		else
			self.Debuffs:SetPoint("TOPLEFT", self, "BOTTOMLEFT", -2, -17)
		end
		self.Debuffs.showDebuffBorder = true
		self.Debuffs.showCount = true
		self.Debuffs.PostCreateButton = T.PostCreateIcon
		self.Debuffs:AddGroup('HARMFUL', { maxFrameCount = 4 })

		if unit == "pet" then
			self:RegisterEvent("UNIT_PET", T.UpdateAllElements)
		end
	end

	if unit == "player" or unit == "target" then
		-- Portrait
		if C.unitframe.portrait_enable then
			if C.unitframe.portrait_type == "3D" or C.unitframe.portrait_type == "OVERLAY" then
				self.Portrait = CreateFrame("PlayerModel", self:GetName().."_Portrait", self)
			else
				self.Portrait = CreateFrame("Frame", self:GetName().."_Portrait", self)
			end
			self.Portrait:SetHeight(C.unitframe.portrait_height)
			self.Portrait:SetWidth(C.unitframe.portrait_width)
			if unit == "player" then
				self.Portrait:SetPoint(unpack(C.position.unitframes.player_portrait))
			elseif unit == "target" then
				self.Portrait:SetPoint(unpack(C.position.unitframes.target_portrait))
			end

			self.Portrait.Icon = self.Portrait:CreateTexture(nil, "ARTWORK")
			self.Portrait.Icon:SetAllPoints()

			if C.unitframe.portrait_type == "ICONS" then
				self.Portrait.classIcons = true
			end

			self.Portrait:CreateBackdrop("Transparent")
			self.Portrait.backdrop:SetPoint("TOPLEFT", -2 - T.mult, 2 + T.mult)
			self.Portrait.backdrop:SetPoint("BOTTOMRIGHT", 2 + T.mult, -2 - T.mult)

			if C.unitframe.portrait_classcolor_border then
				if unit == "player" then
					self.Portrait.backdrop:SetBackdropBorderColor(T.color.r, T.color.g, T.color.b)
				elseif unit == "target" then
					self.Portrait.backdrop:RegisterEvent("PLAYER_TARGET_CHANGED")
					self.Portrait.backdrop:SetScript("OnEvent", function()
						local _, class = UnitClass("target")
						local color = (canaccessvalue(class) and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class])
						if color then
							self.Portrait.backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
						else
							self.Portrait.backdrop:SetBackdropBorderColor(unpack(C.media.border_color))
						end
					end)
				end
			end

			if C.unitframe.portrait_type == "OVERLAY" then
				local healthTex = self.Health:GetStatusBarTexture()
				self.Portrait:ClearAllPoints()
				self.Portrait:SetPoint("TOPLEFT", healthTex, "TOPLEFT", 0, 0)
				self.Portrait:SetPoint("BOTTOMRIGHT", healthTex, "BOTTOMRIGHT", 0, 1)
				self.Portrait:SetFrameLevel(self.Health:GetFrameLevel())
				self.Portrait.backdrop:Hide()
				self.Portrait:SetAlpha(0.5)
			end
		end

		--=== LAYOUT2: PORTRAIT ===--
		if C.layout2.enable and C.unitframe.portrait_enable then
			if self.Portrait then
				self.Portrait:Hide()
				self.Portrait = nil
			end

			if C.unitframe.portrait_type == "3D" or C.unitframe.portrait_type == "OVERLAY" then
				self.Portrait = CreateFrame("PlayerModel", self:GetName().."_Portrait", self)
			else
				self.Portrait = CreateFrame("Frame", self:GetName().."_Portrait", self, "BackdropTemplate")
			end

			self.Portrait:SetSize(C.layout2.portrait_size, C.layout2.portrait_size)
			if unitType == "player" then
				self.Portrait:SetPoint("TOPLEFT", self, "TOPRIGHT", 12, 0)
			elseif unitType == "target" then
				self.Portrait:SetPoint("TOPRIGHT", self, "TOPLEFT", -12, 0)
			end
			self.Portrait:SetFrameLevel(5)

			if C.unitframe.portrait_type ~= "OVERLAY" and C.unitframe.portrait_type ~= "3D" then
				self.Portrait:SetTemplate("Default")
				self.Portrait:SetBackdropColor(unpack(C.media.border_color))
				CreateShadow(self.Portrait)
				if C.unitframe.portrait_type == "ICONS" then self.Portrait.classIcons = true end
				self.Portrait.Icon = self.Portrait:CreateTexture(nil, "ARTWORK")
				self.Portrait.Icon:SetAllPoints()
				self.Portrait.Icon:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			else
				if C.unitframe.portrait_type == "3D" or C.unitframe.portrait_type == "ICONS" then
					local bgFrame = CreateFrame("Frame", nil, self, "BackdropTemplate")
					bgFrame:SetFrameLevel(self.Portrait:GetFrameLevel() - 1)
					bgFrame:SetTemplate("Invisible")
					bgFrame:SetBackdropColor(unpack(C.media.backdrop_color))
					CreateShadow(bgFrame)
					if unitType == "player" then
						bgFrame:SetPoint("TOPLEFT", self, "TOPRIGHT", 12, 1)
					elseif unitType == "target" then
						bgFrame:SetPoint("TOPRIGHT", self, "TOPLEFT", -12, 1)
					end
					bgFrame:SetSize(C.layout2.portrait_size, C.layout2.portrait_size)
					self.Portrait:ClearAllPoints()
					self.Portrait:SetPoint("TOPLEFT", bgFrame, "TOPLEFT", 1, -1)
					self.Portrait:SetPoint("BOTTOMRIGHT", bgFrame, "BOTTOMRIGHT", -1, 1)
					self.Portrait.backgroundFrame = bgFrame
				end
				if C.unitframe.portrait_type ~= "OVERLAY" then
					self.Portrait.Icon = self.Portrait:CreateTexture(nil, "ARTWORK")
					self.Portrait.Icon:SetAllPoints()
					self.Portrait.Icon:SetTexCoord(0.15, 0.85, 0.15, 0.85)
				end
			end

			self.Portrait.backdrop = self.Portrait.backdrop or { SetBackdropBorderColor = function() end }

			if C.unitframe.portrait_type == "OVERLAY" and self.Health then
				local healthTex = self.Health:GetStatusBarTexture()
				self.Portrait:ClearAllPoints()
				self.Portrait:SetPoint("TOPLEFT", healthTex, "TOPLEFT", 0, 0)
				self.Portrait:SetPoint("BOTTOMRIGHT", healthTex, "BOTTOMRIGHT", 0, 1)
				self.Portrait:SetFrameLevel(self.Health:GetFrameLevel())
				self.Portrait:SetAlpha(0.5)
			end
		end

		if unit == "player" then
			-- Debuffs on player
			if C.aura.player_auras then
				self.Debuffs = self:CreateAuras({
					initialAnchor = "BOTTOMRIGHT",
					growthX = "LEFT",
					growthY = "UP",
					layoutLimit = player_width + 4,
				})
				self.Debuffs:SetHeight(165)
				self.Debuffs:SetWidth(player_width + 4)
				self.Debuffs.size = T.Scale(C.aura.debuff_size)
				self.Debuffs.elementSpacing = T.Scale(3)
				if (T.class == "DEATHKNIGHT" and C.unitframe_class_bar.rune)
				or ((T.class == "DRUID" or T.class == "ROGUE") and C.unitframe_class_bar.combo and C.unitframe_class_bar.combo_old ~= true)
				or (T.class == "SHAMAN" and C.unitframe_class_bar.totem)
				or (T.class == "WARLOCK" and C.unitframe_class_bar.shard) then
					self.Debuffs:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 2, 19)
				else
					self.Debuffs:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 2, 5)
				end
				if C.aura.debuff_minimap then
					self.Debuffs.size = T.Scale(C.aura.player_debuff_size)
					C_Timer.After(0.25, function()
						self.Debuffs:ClearAllPoints()
						self.Debuffs:SetPoint("BOTTOMRIGHT", DeBuffsAnchor, "BOTTOMRIGHT", 0, 0)
						self.Debuffs.SetPoint = T.dummy
					end)
				end
				self.Debuffs.showDebuffBorder = true
				self.Debuffs.showCount = true
				self.Debuffs.PostCreateButton = T.PostCreateIcon
				self.Debuffs:AddGroup('HARMFUL', { maxFrameCount = 40 })
			else
				BuffFrame:Hide()
				DebuffFrame:Hide()
			end

			--=== LAYOUT2: PLAYER DEBUFFS REPOSITION ===--
			if C.layout2.enable and C.layout2.player_bigdebuff and self.Debuffs then
				self.Debuffs.size = C.layout2.player_debuff_size
				self.Debuffs:ClearAllPoints()
				self.Debuffs:SetPoint("BOTTOMRIGHT", DeBuffsAnchor, "BOTTOMRIGHT", 0, 0)
				self.Debuffs.elementSpacing = C.layout2.debuff_spacing
			end
		end

		if unit == "target" then
		-- Auras on target
		if C.aura.target_auras then
			self.Auras = self:CreateAuras({
				initialAnchor = "BOTTOMLEFT",
				growthX = "RIGHT",
				growthY = "UP",
				layoutLimit = player_width - 6,
			})
			self.Auras:SetPoint("BOTTOMLEFT", self, "TOPLEFT", -2, 5)
			self.Auras:SetHeight(165)
			self.Auras:SetWidth(player_width - 6)
				self.Auras.elementSpacing = T.Scale(3)
				self.Auras.size = T.Scale(C.aura.debuff_size)
				self.Auras.showDebuffBorder = true
				self.Auras.showStealableBorder = true
				self.Auras.showCount = true
				self.Auras.PostCreateButton = T.PostCreateIcon
				self.Auras:AddGroup('HELPFUL', { maxFrameCount = 32 })
				self.Auras:AddGroup('HARMFUL', { maxFrameCount = 16 })

				--=== LAYOUT2: TARGET AURAS REPOSITION ===--
				if C.layout2.enable then
					C_Timer.After(0, function()
						if self.Auras and self.Auras:GetParent() then
							self.Auras:ClearAllPoints()
							self.Auras:SetPoint("BOTTOMLEFT", self.Auras:GetParent(), "TOPLEFT", -1, 5)
							self.Auras:SetWidth(C.layout2.player_width - 6)
						end
					end)
				end
			end

			-- Rogue/Druid Combo bar on target
			if C.unitframe_class_bar.combo and (C.unitframe_class_bar.combo_old or (T.class ~= "DRUID" and T.class ~= "ROGUE")) then
				self.ComboPoints = CreateFrame("Frame", self:GetName().."_ComboBar", self)
				self.ComboPoints:CreateBackdrop("Default")
				self.ComboPoints:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
				self.ComboPoints:SetSize(player_width, 7)

				for i = 1, 7 do
					self.ComboPoints[i] = CreateFrame("StatusBar", self:GetName().."_Combo"..i, self.ComboPoints)
					self.ComboPoints[i]:SetSize((player_width - 5) / 7, 7)
					if i == 1 then
						self.ComboPoints[i]:SetPoint("LEFT", self.ComboPoints)
					else
						self.ComboPoints[i]:SetPoint("LEFT", self.ComboPoints[i-1], "RIGHT", 1, 0)
					end
					self.ComboPoints[i]:SetStatusBarTexture(C.media.texture)
				end
			end

			-- Enemy specialization
			if C.unitframe.plugins_enemy_spec then
				self.EnemySpec = T.SetFontString(self.Power, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
				self.EnemySpec:SetTextColor(1, 0, 0)
				self.EnemySpec:SetPoint("BOTTOM", self.Power, "BOTTOM", 0, -1)
			end

			-- Quest icon
			self.QuestIndicator = self.Health:CreateTexture(nil, "OVERLAY")
			self.QuestIndicator:SetSize(20, 20)
			self.QuestIndicator:SetPoint("CENTER", self.Health, "CENTER", -20, 0)
		end

		-- Combat text
		if C.unitframe.plugins_combat_feedback then
			self.CombatFeedbackText = T.SetFontString(self.Health, C.font.unit_frames_font, C.font.unit_frames_font_size * 2, C.font.unit_frames_font_style)
			if C.unitframe.portrait_enable and C.unitframe.portrait_type ~= "OVERLAY" then
				self.CombatFeedbackText:SetPoint("BOTTOM", self.Portrait, "BOTTOM", 0, 0)
				self.CombatFeedbackText:SetParent(self.Portrait)
			else
				self.CombatFeedbackText:SetPoint("CENTER", 0, 1)
			end
		end

		-- PvP status
		if C.unitframe.icons_pvp then
			self.Status = T.SetFontString(self.Health, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			self.Status:SetPoint("CENTER", self.Health, "CENTER", 0, 0)
			self.Status:SetTextColor(0.69, 0.31, 0.31)
			self.Status:Hide()
			self.Status.Override = T.dummy

			self:SetScript("OnEnter", function(self) if self.LowMana then self.LowMana.Text:Hide() end T.UpdatePvPStatus(self) self.Status:Show() UnitFrame_OnEnter(self) end)
			self:SetScript("OnLeave", function(self) if self.LowMana then self.LowMana.Text:Show() end self.Status:Hide() UnitFrame_OnLeave(self) end)
		end
	end

	-- Castbar
	if C.unitframe.unit_castbar and not unit:match('%wtarget$') then
		self.Castbar = CreateFrame("StatusBar", self:GetName().."_Castbar", self)
		self.Castbar:SetStatusBarTexture(C.media.texture, "ARTWORK")

		self.Castbar.bg = self.Castbar:CreateTexture(nil, "BORDER")
		self.Castbar.bg:SetAllPoints()
		self.Castbar.bg:SetTexture(C.media.texture)

		self.Castbar.Overlay = CreateFrame("Frame", nil, self.Castbar)
		self.Castbar.Overlay:SetTemplate("Default")
		self.Castbar.Overlay:SetFrameStrata("BACKGROUND")
		self.Castbar.Overlay:SetFrameLevel(0)
		self.Castbar.Overlay:SetPoint("TOPLEFT", -2, 2)
		self.Castbar.Overlay:SetPoint("BOTTOMRIGHT", 2, -2)

		self.Castbar.PostCastStart = T.PostCastStart
		self.Castbar.PostCastInterruptible = T.PostCastStart

		if unit == "player" then
			self.Castbar.CreatePip = T.CustomCreatePip
			self.Castbar.PostUpdatePips = T.PostUpdatePips
		end

		if unit == "player" then
			if C.unitframe.castbar_icon then
				self.Castbar:SetPoint(C.position.unitframes.player_castbar[1], C.position.unitframes.player_castbar[2], C.position.unitframes.player_castbar[3], C.position.unitframes.player_castbar[4] + ((C.unitframe.castbar_height + 7) / 2) , C.position.unitframes.player_castbar[5])
				self.Castbar:SetWidth(C.unitframe.castbar_width)
			else
				self.Castbar:SetPoint(unpack(C.position.unitframes.player_castbar))
				self.Castbar:SetWidth(C.unitframe.castbar_width + C.unitframe.castbar_height + 7)
			end
			self.Castbar:SetHeight(C.unitframe.castbar_height)
		elseif unit == "target" then
			if C.unitframe.castbar_icon then
				if C.unitframe.plugins_swing then
					self.Castbar:SetPoint(C.position.unitframes.target_castbar[1], C.position.unitframes.target_castbar[2], C.position.unitframes.target_castbar[3], C.position.unitframes.target_castbar[4] - C.unitframe.castbar_height - 7, C.position.unitframes.target_castbar[5] + 12)
				else
					self.Castbar:SetPoint(C.position.unitframes.target_castbar[1], C.position.unitframes.target_castbar[2], C.position.unitframes.target_castbar[3], C.position.unitframes.target_castbar[4] - C.unitframe.castbar_height - 7, C.position.unitframes.target_castbar[5])
				end
				self.Castbar:SetWidth(C.unitframe.castbar_width)
			else
				if C.unitframe.plugins_swing then
					self.Castbar:SetPoint(C.position.unitframes.target_castbar[1], C.position.unitframes.target_castbar[2], C.position.unitframes.target_castbar[3], C.position.unitframes.target_castbar[4], C.position.unitframes.target_castbar[5] + 12)
				else
					self.Castbar:SetPoint(unpack(C.position.unitframes.target_castbar))
				end
				self.Castbar:SetWidth(C.unitframe.castbar_width + C.unitframe.castbar_height + 7)
			end
			self.Castbar:SetHeight(C.unitframe.castbar_height)
		elseif unit == "arena" or unit == "boss" then
			self.Castbar:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -7)
			self.Castbar:SetWidth(boss_width)
			self.Castbar:SetHeight(16)
		else
			self.Castbar:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -7)
			self.Castbar:SetWidth(pet_width)
			self.Castbar:SetHeight(5)
		end

		--=== LAYOUT2: CASTBAR REPOSITION ===--
		if C.layout2.enable and (unitType == "player" or unitType == "target") and self.Castbar then
			self.Castbar:ClearAllPoints()
			local tfWidth = C.layout2.player_width
			if C.layout2.centerbar then
				local cbWidth = tfWidth - 4
				self.Castbar:SetWidth(cbWidth)
				if unitType == "player" then
					self.Castbar:SetPoint("TOP", self.Portrait, "TOP", 0, 0)
					self.Castbar:SetPoint("LEFT", UIParent, "CENTER", -cbWidth / 2, 0)
				elseif unitType == "target" then
					self.Castbar:SetPoint("BOTTOM", self.Portrait, "BOTTOM", 0, 0)
					self.Castbar:SetPoint("LEFT", UIParent, "CENTER", -cbWidth / 2, 0)
				end
			else
				self.Castbar:SetWidth(tfWidth)
				if unitType == "player" then
					self.Castbar:SetPoint("TOPLEFT", self.Layout2TextFrame, "BOTTOMLEFT", 0, -6)
				elseif unitType == "target" then
					self.Castbar:SetPoint("TOPRIGHT", self.Layout2TextFrame, "BOTTOMRIGHT", 0, -6)
				end
			end
			self.Castbar:SetHeight(C.unitframe.castbar_height)
		end

		if unit == "player" or unit == "target" or unit == "arena" or unit == "boss" then
			self.Castbar.Time = T.SetFontString(self.Castbar, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			self.Castbar.Time:SetPoint("RIGHT", self.Castbar, "RIGHT", 0, 0)
			self.Castbar.Time:SetTextColor(1, 1, 1)
			self.Castbar.Time:SetJustifyH("RIGHT")
			self.Castbar.CustomTimeText = T.CustomCastTimeText
			self.Castbar.CustomDelayText = T.CustomCastDelayText

			self.Castbar.Text = T.SetFontString(self.Castbar, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 2, 0)
			self.Castbar.Text:SetTextColor(1, 1, 1)
			self.Castbar.Text:SetJustifyH("LEFT")
			self.Castbar.Text:SetWordWrap(false)
			self.Castbar.Text:SetWidth(self.Castbar:GetWidth() - 50)

			if (C.unitframe.castbar_icon and (unit == "player" or unit == "target")) or unit == "arena" or unit == "boss" then
				self.Castbar.Button = CreateFrame("Frame", nil, self.Castbar)
				self.Castbar.Button:SetSize(self.Castbar:GetHeight() + 4, self.Castbar:GetHeight() + 4)
				self.Castbar.Button:SetTemplate("Default")

				self.Castbar.Icon = self.Castbar.Button:CreateTexture(nil, "ARTWORK")
				self.Castbar.Icon:SetPoint("TOPLEFT", self.Castbar.Button, 2, -2)
				self.Castbar.Icon:SetPoint("BOTTOMRIGHT", self.Castbar.Button, -2, 2)
				self.Castbar.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

				if unit == "player" then
					self.Castbar.Button:SetPoint("RIGHT", self.Castbar, "LEFT", -5, 0)
				elseif unit == "target" then
					self.Castbar.Button:SetPoint("LEFT", self.Castbar, "RIGHT", 5, 0)
				elseif unit == "boss" then
					if C.unitframe.boss_on_right then
						self.Castbar.Button:SetPoint("TOPRIGHT", self.Castbar, "TOPLEFT", -5, 2)
					else
						self.Castbar.Button:SetPoint("TOPLEFT", self.Castbar, "TOPRIGHT", 5, 2)
					end
				elseif unit == "arena" then
					if C.unitframe.arena_on_right then
						self.Castbar.Button:SetPoint("TOPRIGHT", self.Castbar, "TOPLEFT", -5, 2)
					else
						self.Castbar.Button:SetPoint("TOPLEFT", self.Castbar, "TOPRIGHT", 5, 2)
					end
				end
			end

			if unit == "player" and C.unitframe.castbar_latency then
				self.Castbar.SafeZone = self.Castbar:CreateTexture(nil, "BORDER", nil, 1)
				self.Castbar.SafeZone:SetTexture(C.media.texture)
				self.Castbar.SafeZone:SetVertexColor(0.85, 0.27, 0.27)

				self.Castbar.Latency = T.SetFontString(self.Castbar, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
				self.Castbar.Latency:SetTextColor(1, 1, 1)
				self.Castbar.Latency:SetPoint("TOPRIGHT", self.Castbar.Time, "BOTTOMRIGHT", 0, 0)
				self.Castbar.Latency:SetJustifyH("RIGHT")
			end
		end

		if unit == "focus" then
			if C.unitframe.castbar_focus_type == "ICON" or C.unitframe.castbar_focus_type == "BAR" then
				self.Castbar.Button = CreateFrame("Frame", self:GetName().."_Castbar_Icon", self.Castbar)
				self.Castbar.Button:SetPoint(unpack(C.position.unitframes.focus_castbar))
				self.Castbar.Button:SetTemplate("Default")

				self.Castbar.Icon = self.Castbar.Button:CreateTexture(nil, "ARTWORK")
				self.Castbar.Icon:SetPoint("TOPLEFT", self.Castbar.Button, 2, -2)
				self.Castbar.Icon:SetPoint("BOTTOMRIGHT", self.Castbar.Button, -2, 2)
				self.Castbar.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end
			if C.unitframe.castbar_focus_type == "ICON" then
				self.Castbar.Button:SetSize(65, 65)

				self.Castbar.Time = T.SetFontString(self.Castbar, C.font.unit_frames_font, C.font.unit_frames_font_size * 2, C.font.unit_frames_font_style)
				self.Castbar.Time:SetParent(self.Castbar.Button)
				self.Castbar.Time:SetTextColor(1, 1, 1)
				self.Castbar.Time:SetPoint("CENTER", self.Castbar.Icon, "CENTER", 0, 0)
			elseif C.unitframe.castbar_focus_type == "BAR" then
				self.Castbar:ClearAllPoints()
				self.Castbar:SetPoint("TOP", self.Castbar.Icon, "BOTTOM", 0, -7)
				self.Castbar:SetWidth(C.unitframe.castbar_width - 40)
				self.Castbar:SetHeight(C.unitframe.castbar_height)

				self.Castbar.Text = T.SetFontString(self.Castbar, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
				self.Castbar.Text:SetPoint("LEFT", self.Castbar, "LEFT", 2, 0)
				self.Castbar.Text:SetTextColor(1, 1, 1)
				self.Castbar.Text:SetJustifyH("LEFT")
				self.Castbar.Text:SetWordWrap(false)
				self.Castbar.Text:SetWidth(self.Castbar:GetWidth() - 50)

				self.Castbar.Button:SetSize(self.Castbar:GetHeight() + 30, self.Castbar:GetHeight() + 30)

				self.Castbar.Time = T.SetFontString(self.Castbar, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
				self.Castbar.Time:SetPoint("RIGHT", self.Castbar, "RIGHT", 0, 0)
				self.Castbar.Time:SetTextColor(1, 1, 1)
				self.Castbar.Time:SetJustifyH("RIGHT")
				self.Castbar.CustomTimeText = T.CustomCastTimeText
				self.Castbar.CustomDelayText = T.CustomCastDelayText
			end
		end
	end

	-- Swing bar
	if C.unitframe.plugins_swing and unit == "player" then -- BETA not work
		self.Swing = CreateFrame("StatusBar", self:GetName().."_Swing", self)
		self.Swing:CreateBackdrop("Default")
		if C.unitframe.unit_castbar then
			self.Swing:SetPoint("BOTTOMRIGHT", "oUF_Player_Castbar", "TOPRIGHT", 0, 7)
		else
			self.Swing:SetPoint(C.position.unitframes.player_castbar[1], C.position.unitframes.player_castbar[2], C.position.unitframes.player_castbar[3], C.position.unitframes.player_castbar[4], C.position.unitframes.player_castbar[5] + 23)
		end
		self.Swing:SetSize(281, 5)
		self.Swing:SetStatusBarTexture(C.media.texture)
		if C.unitframe.own_color then
			self.Swing:SetStatusBarColor(unpack(C.unitframe.uf_color))
		else
			self.Swing:SetStatusBarColor(T.color.r, T.color.g, T.color.b)
		end

		self.Swing.bg = self.Swing:CreateTexture(nil, "BORDER")
		self.Swing.bg:SetAllPoints(self.Swing)
		self.Swing.bg:SetTexture(C.media.texture)
		if C.unitframe.own_color then
			self.Swing.bg:SetVertexColor(unpack(C.unitframe.uf_color_bg))
		else
			self.Swing.bg:SetVertexColor(T.color.r, T.color.g, T.color.b, 0.2)
		end

		self.Swing.Text = T.SetFontString(self.Swing, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		self.Swing.Text:SetPoint("CENTER", 0, 0)
		self.Swing.Text:SetTextColor(1, 1, 1)
	end

	-- Arena trinket/control
	if C.unitframe.show_arena and unit == "arena" then
		self.Trinket = CreateFrame("Frame", self:GetName().."_Trinket", self)
		self.Trinket:SetSize(31 + T.extraHeight, 31 + T.extraHeight)
		self.Trinket:SetTemplate("Default")

		if C.unitframe.arena_on_right then
			self.Trinket:SetPoint("TOPRIGHT", self, "TOPLEFT", -5, 2)
		else
			self.Trinket:SetPoint("TOPLEFT", self, "TOPRIGHT", 5, 2)
		end

		self.FactionIcon = self.Health:CreateTexture(nil, "OVERLAY")
		self.FactionIcon:SetSize(16, 16)
		self.FactionIcon:SetPoint("TOP", 0, 0)

		-- Crowd control icon
		self.Debuffs = self:CreateAuras({
			initialAnchor = C.unitframe.boss_on_right and "RIGHT" or "LEFT",
			growthX = C.unitframe.boss_on_right and "LEFT" or "RIGHT",
			layoutLimit = 31 + T.extraHeight,
		})
		self.Debuffs:SetSize(31 + T.extraHeight, 31 + T.extraHeight)
		self.Debuffs:SetFrameStrata("HIGH")
		self.Debuffs.size = T.Scale(31 + T.extraHeight)
		self.Debuffs.num = 1
		if C.unitframe.boss_on_right then
			self.Debuffs:SetPoint("RIGHT", self, "LEFT", -5, 0)
		else
			self.Debuffs:SetPoint("LEFT", self, "RIGHT", 5, 0)
		end
		self.Debuffs.showDebuffBorder = true
		self.Debuffs.showCount = true
		self.Debuffs.PostCreateButton = T.PostCreateIcon
		self.Debuffs:AddGroup('HARMFUL|CROWD_CONTROL', { maxFrameCount = 1 })

		--BETA self.AuraTracker = CreateFrame("Frame", self:GetName().."_AuraTracker", self)
		-- self.AuraTracker:SetWidth(self.Trinket:GetWidth())
		-- self.AuraTracker:SetHeight(self.Trinket:GetHeight())
		-- self.AuraTracker:SetPoint("CENTER", self.Trinket, "CENTER")
		-- self.AuraTracker:SetFrameStrata("HIGH")

		-- self.AuraTracker.icon = self.AuraTracker:CreateTexture(nil, "ARTWORK")
		-- self.AuraTracker.icon:SetWidth(self.Trinket:GetWidth())
		-- self.AuraTracker.icon:SetHeight(self.Trinket:GetHeight())
		-- self.AuraTracker.icon:SetPoint("TOPLEFT", self.Trinket, 2, -2)
		-- self.AuraTracker.icon:SetPoint("BOTTOMRIGHT", self.Trinket, -2, 2)
		-- self.AuraTracker.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		-- self.AuraTracker.text = T.SetFontString(self.AuraTracker, C.font.unit_frames_font, C.font.unit_frames_font_size * 2, C.font.unit_frames_font_style)
		-- self.AuraTracker.text:SetPoint("CENTER", self.AuraTracker, 0, 0)
		-- self.AuraTracker:SetScript("OnUpdate", T.AuraTrackerTime)

		if C.unitframe.plugins_enemy_spec then
			self.EnemySpec = T.SetFontString(self.Power, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			self.EnemySpec:SetTextColor(1, 0, 0)
			if C.unitframe.arena_on_right then
				self.EnemySpec:SetPoint("RIGHT", self.Power, "RIGHT", 0, 0)
				self.EnemySpec:SetJustifyH("LEFT")
			else
				self.EnemySpec:SetPoint("LEFT", self.Power, "LEFT", 2, 0)
				self.EnemySpec:SetJustifyH("RIGHT")
			end
		end
	end

	if C.unitframe.show_boss and unit == "boss" then
		-- Alternative power bar
		self.AlternativePower = CreateFrame("StatusBar", nil, self.Health, "BackdropTemplate")
		self.AlternativePower:SetFrameLevel(self.Health:GetFrameLevel() + 1)
		self.AlternativePower:SetHeight(5)
		self.AlternativePower:SetStatusBarTexture(C.media.texture)
		self.AlternativePower:SetStatusBarColor(0.9, 0, 0)
		self.AlternativePower:SetPoint("LEFT")
		self.AlternativePower:SetPoint("RIGHT")
		self.AlternativePower:SetPoint("TOP", self.Health, "TOP")
		self.AlternativePower:SetBackdrop({
			bgFile = C.media.blank,
			edgeFile = C.media.blank,
			tile = false, tileSize = 0, edgeSize = T.Scale(1),
			insets = {left = 0, right = 0, top = 0, bottom = T.Scale(-1)}
		})
		self.AlternativePower:SetBackdropColor(0, 0, 0)
		self.AlternativePower:SetBackdropBorderColor(0, 0, 0)

		self.AlternativePower.text = T.SetFontString(self.AlternativePower, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		self.AlternativePower.text:SetPoint("CENTER", self.AlternativePower, "CENTER", 0, 0)
		self:Tag(self.AlternativePower.text, "[AltPower]")

		if C.unitframe.plugins_smooth_bar then
			self.AlternativePower.smoothing = Enum.StatusBarInterpolation.ExponentialEaseOut or 1
		end

		-- Auras on boss
		if C.aura.boss_auras then
			self.Auras = self:CreateAuras({
				initialAnchor = C.unitframe.boss_on_right and "RIGHT" or "LEFT",
				growthX = C.unitframe.boss_on_right and "LEFT" or "RIGHT",
				layoutLimit = (34 + T.extraHeight) * (C.aura.boss_debuffs + C.aura.boss_buffs + 1),
			})
			if C.unitframe.boss_on_right then
				self.Auras:SetPoint("RIGHT", self, "LEFT", -5, 0)
			else
				self.Auras:SetPoint("LEFT", self, "RIGHT", 5, 0)
			end
			self.Auras:SetHeight(31 + T.extraHeight)
			self.Auras:SetWidth((34 + T.extraHeight) * (C.aura.boss_debuffs + C.aura.boss_buffs + 1))
			self.Auras.elementSpacing = T.Scale(3)
			self.Auras.size = T.Scale(31 + T.extraHeight)
			self.Auras.showDebuffBorder = true
			self.Auras.showStealableBorder = true
			self.Auras.showCount = true
			self.Auras.PostCreateButton = T.PostCreateIcon
			self.Auras:AddGroup('HELPFUL', { maxFrameCount = C.aura.boss_buffs })
			self.Auras:AddGroup('HARMFUL', { maxFrameCount = C.aura.boss_debuffs })
		end

		self:HookScript("OnShow", T.UpdateAllElements)
	end

	-- Aggro border
	if C.raidframe.aggro_border and unit ~= "arenatarget" then
		self.ThreatIndicator = CreateFrame("Frame", nil, self)
		self.ThreatIndicator.PostUpdate = T.UpdateThreat
	end

	-- Raid marks
	if C.raidframe.icons_raid_mark then
		self.RaidTargetIndicator = self:CreateTexture(nil, "OVERLAY")
		self.RaidTargetIndicator:SetParent(self.Health)
		self.RaidTargetIndicator:SetSize((unit == "player" or unit == "target") and 15 or 12, (unit == "player" or unit == "target") and 15 or 12)
		self.RaidTargetIndicator:SetPoint("TOP", self.Health, 0, 0)
	end

	-- Dispel highlight
	if C.raidframe.plugins_debuffhighlight and not unit:match('%wtarget$') then
		self.DispelColor = self.Health:CreateTexture(nil, "OVERLAY")
		self.DispelColor:SetAllPoints(self.Health)
		self.DispelColor:SetTexture(C.media.highlight)
		self.DispelColor:SetVertexColor(0, 0, 0, 0)
		self.DispelColor:SetBlendMode("ADD")
	end

	-- Incoming heals and heal/damage absorbs
	if C.raidframe.plugins_healcomm then
		T.CreateHealthPrediction(self)
	end

	-- Power Prediction bar
	if C.unitframe.plugins_power_prediction and unit == "player" then
		self.Power.CostPrediction = CreateFrame("StatusBar", self:GetName().."_PowerPrediction", self.Power)
		self.Power.CostPrediction:SetReverseFill(true)
		self.Power.CostPrediction:SetPoint("TOP")
		self.Power.CostPrediction:SetPoint("BOTTOM")
		self.Power.CostPrediction:SetPoint("RIGHT", self.Power:GetStatusBarTexture(), "RIGHT")
		self.Power.CostPrediction:SetStatusBarTexture(C.media.texture)
		self.Power.CostPrediction:SetStatusBarColor(1, 1, 1, 0.5)
		self.Power.CostPrediction:SetWidth(player_width)
	end

	-- Fader
	if C.unitframe.plugins_fader then
		if unit ~= "arena" or unit ~= "arenatarget" or unit ~= "boss" then
			self.Fader = {
				[1] = {Combat = 1, Arena = 1, Instance = 1},
				[2] = {PlayerTarget = 1, PlayerNotMaxHealth = 1, PlayerNotMaxMana = 1, Casting = 1},
				[3] = {Stealth = 0.5},
				[4] = {notCombat = 0, PlayerTaxi = 0},
			}
		end
		self.NormalAlpha = 1
	end

	-- Apply expert code
	if T.PostCreateUnitFrames then
		T.PostCreateUnitFrames(self, unit)
	end

	return self
end

----------------------------------------------------------------------------------------
--	Default position of ViksUI unitframes
----------------------------------------------------------------------------------------
oUF:RegisterStyle("Viks", Shared)

local player = oUF:Spawn("player", "oUF_Player")
player:SetPoint(unpack(C.position.unitframes.player))
player:SetSize(player_width, 27 + T.extraHeight)

local target = oUF:Spawn("target", "oUF_Target")
target:SetPoint(unpack(C.position.unitframes.target))
target:SetSize(player_width, 27 + T.extraHeight)

if C.unitframe.show_pet then
	local pet = oUF:Spawn("pet", "oUF_Pet")
	pet:SetPoint(unpack(C.position.unitframes.pet))
	pet:SetSize(pet_width, 16 + (C.unitframe.extra_health_height / 2))
end

if C.unitframe.show_focus then
	local focus = oUF:Spawn("focus", "oUF_Focus")
	focus:SetPoint(unpack(C.position.unitframes.focus))
	focus:SetSize(pet_width, 16 + (C.unitframe.extra_health_height / 2))

	local focustarget = oUF:Spawn("focustarget", "oUF_FocusTarget")
	focustarget:SetPoint(unpack(C.position.unitframes.focus_target))
	focustarget:SetSize(pet_width, 16 + (C.unitframe.extra_health_height / 2))
end

if C.unitframe.show_target_target then
	local targettarget = oUF:Spawn("targettarget", "oUF_TargetTarget")
	targettarget:SetPoint(unpack(C.position.unitframes.target_target))
	targettarget:SetSize(pet_width, 16 + (C.unitframe.extra_health_height / 2))
end

if C.unitframe.show_boss then
	local boss = {}
	for i = 1, 10 do
		boss[i] = oUF:Spawn("boss"..i, "oUF_Boss"..i)
		if i == 1 then
			if C.unitframe.boss_on_right then
				boss[i]:SetPoint(unpack(C.position.unitframes.boss))
			else
				boss[i]:SetPoint("BOTTOMLEFT", C.position.unitframes.boss[2], "LEFT", C.position.unitframes.boss[4] + 46, C.position.unitframes.boss[5])
			end
		else
			boss[i]:SetPoint("BOTTOM", boss[i-1], "TOP", 0, 30)
		end
		boss[i]:SetSize(boss_width, 27 + T.extraHeight)
	end
end

if C.unitframe.show_arena then
	local arena = {}
	for i = 1, 5 do
		arena[i] = oUF:Spawn("arena"..i, "oUF_Arena"..i)
		if i == 1 then
			if C.unitframe.arena_on_right then
				arena[i]:SetPoint(unpack(C.position.unitframes.arena))
			else
				arena[i]:SetPoint("BOTTOMLEFT", C.position.unitframes.arena[2], "LEFT", C.position.unitframes.arena[4] + 120, C.position.unitframes.arena[5])
			end
		else
			arena[i]:SetPoint("BOTTOM", arena[i-1], "TOP", 0, 30)
		end
		arena[i]:SetSize(boss_width, 27 + T.extraHeight)
	end

	local arenatarget = {}
	for i = 1, 5 do
		arenatarget[i] = oUF:Spawn("arena"..i.."target", "oUF_Arena"..i.."Target")
		if i == 1 then
			if C.unitframe.arena_on_right then
				arenatarget[i]:SetPoint("TOPLEFT", arena[i], "TOPRIGHT", 7, 0)
			else
				arenatarget[i]:SetPoint("TOPRIGHT", arena[i], "TOPLEFT", -7, 0)
			end
		else
			arenatarget[i]:SetPoint("BOTTOM", arenatarget[i-1], "TOP", 0, 30)
		end
		arenatarget[i]:SetSize(30 + T.extraHeight, 27 + T.extraHeight)
	end
end

----------------------------------------------------------------------------------------
--	Arena preparation(by Blizzard)(../Blizzard_ArenaUI/Blizzard_ArenaUI.lua)
----------------------------------------------------------------------------------------
if C.unitframe.show_arena then
	local arenaprep = {}
	for i = 1, 5 do
		arenaprep[i] = CreateFrame("Frame", "oUF_ArenaPrep"..i, UIParent)
		arenaprep[i]:SetAllPoints(_G["oUF_Arena"..i])
		arenaprep[i]:CreateBackdrop("Default")
		arenaprep[i]:SetFrameStrata("BACKGROUND")

		arenaprep[i].Health = CreateFrame("StatusBar", nil, arenaprep[i])
		arenaprep[i].Health:SetAllPoints()
		arenaprep[i].Health:SetStatusBarTexture(C.media.texture)

		arenaprep[i].Spec = T.SetFontString(arenaprep[i].Health, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		arenaprep[i].Spec:SetPoint("CENTER")

		arenaprep[i]:Hide()
	end

	local arenaprepupdate = CreateFrame("Frame")
	arenaprepupdate:RegisterEvent("PLAYER_LOGIN")
	arenaprepupdate:RegisterEvent("PLAYER_ENTERING_WORLD")
	arenaprepupdate:RegisterEvent("ARENA_OPPONENT_UPDATE")
	arenaprepupdate:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")
	arenaprepupdate:SetScript("OnEvent", function(_, event)
		if event == "PLAYER_LOGIN" then
			for i = 1, 5 do
				arenaprep[i]:SetAllPoints(_G["oUF_Arena"..i])
			end
		elseif event == "ARENA_OPPONENT_UPDATE" then
			for i = 1, 5 do
				arenaprep[i]:Hide()
			end
		else
			local numOpps = GetNumArenaOpponentSpecs()

			if numOpps > 0 then
				for i = 1, 5 do
					local f = arenaprep[i]

					if i <= numOpps then
						local s = GetArenaOpponentSpec(i)
						local _, spec, class = nil, "UNKNOWN", "UNKNOWN"

						if s and s > 0 then
							_, spec, _, _, _, class = GetSpecializationInfoByID(s)
						end

						if class and spec then
							local color = (canaccessvalue(class) and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class])
							if C.unitframe.own_color then
								f.Health:SetStatusBarColor(unpack(C.unitframe.uf_color))
								f.Spec:SetText(spec)
								f.Spec:SetTextColor(color.r, color.g, color.b)
							else
								if color then
									f.Health:SetStatusBarColor(color.r, color.g, color.b)
								else
									f.Health:SetStatusBarColor(unpack(C.unitframe.uf_color))
								end
								f.Spec:SetText(spec)
							end
							f:Show()
						end
					else
						f:Hide()
					end
				end
			else
				for i = 1, 5 do
					arenaprep[i]:Hide()
				end
			end
		end
	end)
end

----------------------------------------------------------------------------------------
--	Test UnitFrames(by community)
----------------------------------------------------------------------------------------
local moving = false
SlashCmdList.TEST_UF = function(msg)
	if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return end
	if not moving then
		for _, frames in pairs({"oUF_Target", "oUF_TargetTarget", "oUF_Pet", "oUF_Focus", "oUF_FocusTarget"}) do
			if _G[frames] then
				_G[frames].oldunit = _G[frames].unit
				_G[frames]:SetAttribute("unit", "player")
			end
		end

		if msg == "arena" then
			if C.unitframe.show_arena then
				for i = 1, 5 do
					_G["oUF_Arena"..i].oldunit = _G["oUF_Arena"..i].unit
					_G["oUF_Arena"..i].Trinket.Hide = T.dummy
					_G["oUF_Arena"..i].Trinket.Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_37")
					_G["oUF_Arena"..i]:SetAttribute("unit", "player")

					_G["oUF_Arena"..i.."Target"].oldunit = _G["oUF_Arena"..i.."Target"].unit
					_G["oUF_Arena"..i.."Target"]:SetAttribute("unit", "player")

					if C.unitframe.plugins_enemy_spec then
						_G["oUF_Arena"..i].EnemySpec:SetText(SPECIALIZATION)
					end

					if C.unitframe.plugins_diminishing then
						SlashCmdList.DIMINISHINGCD()
					end
				end
			end
		else
			if C.unitframe.show_boss then
				for i = 1, 8 do
					_G["oUF_Boss"..i].oldunit = _G["oUF_Boss"..i].unit
					_G["oUF_Boss"..i]:SetAttribute("unit", "player")
				end
			end
		end
		moving = true
	else
		for _, frames in pairs({"oUF_Target", "oUF_TargetTarget", "oUF_Pet", "oUF_Focus", "oUF_FocusTarget"}) do
			if _G[frames] then
				_G[frames].unit = _G[frames].oldunit
				_G[frames]:SetAttribute("unit", _G[frames].unit)
			end
		end

		if msg == "arena" then
			if C.unitframe.show_arena then
				for i = 1, 5 do
					_G["oUF_Arena"..i].Trinket.Hide = nil
					_G["oUF_Arena"..i]:SetAttribute("unit", _G["oUF_Arena"..i].oldunit)
					_G["oUF_Arena"..i.."Target"]:SetAttribute("unit", _G["oUF_Arena"..i.."Target"].oldunit)
				end
			end

		else
			if C.unitframe.show_boss then
				for i = 1, 8 do
					_G["oUF_Boss"..i].unit = _G["oUF_Boss"..i].oldunit
					_G["oUF_Boss"..i]:SetAttribute("unit", _G["oUF_Boss"..i].unit)
				end
			end
		end
		moving = false
	end
end
SLASH_TEST_UF1 = "/testui"
SLASH_TEST_UF2 = "/еуыегш"
SLASH_TEST_UF3 = "/testuf"
SLASH_TEST_UF4 = "/еуыега"

----------------------------------------------------------------------------------------
--=== LAYOUT2: SUB-FRAME POSITIONING ===--
----------------------------------------------------------------------------------------
if C.layout2.enable then
	local function ApplyLayout2Positions()
		if InCombatLockdown() then return end

		C_Timer.After(0.1, function()
			local l2player = _G.oUF_Player
			local l2target = _G.oUF_Target
			local l2pet = _G.oUF_Pet
			local l2tt = _G.oUF_TargetTarget
			local l2focus = _G.oUF_Focus
			local l2ft = _G.oUF_FocusTarget

			if l2player then l2player:SetSize(C.layout2.player_width, C.layout2.player_height) end
			if l2target then l2target:SetSize(C.layout2.target_width, C.layout2.target_height) end

			if C.layout2.centerbar then
				local tfWidth = C.layout2.player_width
				local subW = (tfWidth / 2) - 6
				local subH = C.layout2.pet_height
				local gap = -4

				local playerTF = l2player and _G[l2player:GetName().."_TextFrame"]
				local targetTF = l2target and _G[l2target:GetName().."_TextFrame"]

				if l2pet and playerTF and C.unitframe.show_pet then
					l2pet:ClearAllPoints()
					l2pet:SetPoint("TOPLEFT", playerTF, "BOTTOMLEFT", 0, gap)
					l2pet:SetSize(subW, subH)
				end
				if l2focus and playerTF and C.unitframe.show_focus then
					l2focus:ClearAllPoints()
					l2focus:SetPoint("TOPRIGHT", playerTF, "BOTTOMRIGHT", 0, gap)
					l2focus:SetSize(subW, subH)
				end
				if l2ft and targetTF and C.unitframe.show_focus then
					l2ft:ClearAllPoints()
					l2ft:SetPoint("TOPLEFT", targetTF, "BOTTOMLEFT", 0, gap)
					l2ft:SetSize(subW, subH)
				end
				if l2tt and targetTF and C.unitframe.show_target_target then
					l2tt:ClearAllPoints()
					l2tt:SetPoint("TOPRIGHT", targetTF, "BOTTOMRIGHT", 0, gap)
					l2tt:SetSize(subW, subH)
				end
			end

			if C.raidframe.layout == "HEAL" or C.raidframe.layout == "AUTO" then
				if _G["PartyAnchor"] and l2player then
					_G["PartyAnchor"]:ClearAllPoints()
					_G["PartyAnchor"]:SetPoint(unpack(C.position.unitframes.party_heal_layout2))
				end
				local raidAnchor1 = _G["RaidAnchor1"]
				if raidAnchor1 and l2player then
					raidAnchor1:ClearAllPoints()
					raidAnchor1:SetPoint(unpack(C.position.unitframes.raid_heal_layout2))
				end
			end
		end)
	end

	local layout2Frame = CreateFrame("Frame")
	layout2Frame:RegisterEvent("PLAYER_LOGIN")
	layout2Frame:RegisterEvent("GROUP_ROSTER_UPDATE")
	layout2Frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	layout2Frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	if C.raidframe.layout == "AUTO" then
		layout2Frame:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")
	end
	layout2Frame:SetScript("OnEvent", function()
		ApplyLayout2Positions()
	end)
end

----------------------------------------------------------------------------------------
--	Player line
----------------------------------------------------------------------------------------
if C.unitframe.lines then
	local HorizontalPlayerLine = CreateFrame("Frame", "HorizontalPlayerLine", oUF_Player)
	HorizontalPlayerLine:CreatePanel("ClassColor", player_width + 11, 1, "TOPLEFT", "oUF_Player", "BOTTOMLEFT", -5, -5)
	HorizontalPlayerLine:SetBackdropBorderColor(T.color.r, T.color.g, T.color.b)

	local VerticalPlayerLine = CreateFrame("Frame", "VerticalPlayerLine", oUF_Player)
	VerticalPlayerLine:CreatePanel("ClassColor", 1, 98 + T.extraHeight + (C.unitframe.extra_health_height / 2), "TOPRIGHT", "oUF_Player", "TOPLEFT", -5, 30)
	VerticalPlayerLine:SetBackdropBorderColor(T.color.r, T.color.g, T.color.b)
end

----------------------------------------------------------------------------------------
--	Target line
----------------------------------------------------------------------------------------
if C.unitframe.lines then
	local HorizontalTargetLine = CreateFrame("Frame", "HorizontalTargetLine", oUF_Target)
	HorizontalTargetLine:CreatePanel("ClassColor", player_width + 11, 1, "TOPRIGHT", "oUF_Target", "BOTTOMRIGHT", 5, -5)
	HorizontalTargetLine:RegisterEvent("PLAYER_TARGET_CHANGED")
	HorizontalTargetLine:SetScript("OnEvent", function(self)
		local _, class = UnitClass("target")
		local color = (canaccessvalue(class) and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class])
		if color then
			self:SetBackdropBorderColor(color.r, color.g, color.b)
		else
			self:SetBackdropBorderColor(unpack(C.media.border_color))
		end
	end)

	local VerticalTargetLine = CreateFrame("Frame", "VerticalTargetLine", oUF_Target)
	VerticalTargetLine:CreatePanel("ClassColor", 1, 98 + T.extraHeight + (C.unitframe.extra_health_height / 2), "TOPLEFT", "oUF_Target", "TOPRIGHT", 5, 30)
	VerticalTargetLine:RegisterEvent("PLAYER_TARGET_CHANGED")
	VerticalTargetLine:SetScript("OnEvent", function(self)
		local _, class = UnitClass("target")
		local color = (canaccessvalue(class) and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class])
		if color then
			self:SetBackdropBorderColor(color.r, color.g, color.b)
		else
			self:SetBackdropBorderColor(unpack(C.media.border_color))
		end
	end)
end

----------------------------------------------------------------------------------------
--	Auto reposition heal raid frame
----------------------------------------------------------------------------------------
local function adjustAnchor(offset)
	if C.unitframe.castbar_icon then
		if oUF_Player_Castbar then
			oUF_Player_Castbar:SetPoint(C.position.unitframes.player_castbar[1], C.position.unitframes.player_castbar[2], C.position.unitframes.player_castbar[3], C.position.unitframes.player_castbar[4] + 11, C.position.unitframes.player_castbar[5] + offset)
		end
	else
		if oUF_Player_Castbar then
			oUF_Player_Castbar:SetPoint(C.position.unitframes.player_castbar[1], C.position.unitframes.player_castbar[2], C.position.unitframes.player_castbar[3], C.position.unitframes.player_castbar[4], C.position.unitframes.player_castbar[5] + offset)
		end
	end

	player:SetPoint(C.position.unitframes.player[1], C.position.unitframes.player[2], C.position.unitframes.player[3], C.position.unitframes.player[4], C.position.unitframes.player[5] + offset)
	target:SetPoint(C.position.unitframes.target[1], C.position.unitframes.target[2], C.position.unitframes.target[3], C.position.unitframes.target[4], C.position.unitframes.target[5] + offset)
end

if C.raidframe.auto_position == "DYNAMIC" then
	local prevNum = 5
	local function Reposition(self, event)
		if (C.raidframe.layout == "HEAL" or C.raidframe.layout == "AUTO") and not C.raidframe.raid_groups_vertical then
			if C.raidframe.raid_groups > 5 then
				if InCombatLockdown() then
					self:RegisterEvent("PLAYER_REGEN_ENABLED")
					return
				end

				local maxGroup = 5
				local num = GetNumGroupMembers()
				if num > 5 then
					local _, _, subgroup = GetRaidRosterInfo(num)
					if subgroup and subgroup > maxGroup then
						maxGroup = subgroup
					end
				end
				if maxGroup >= C.raidframe.raid_groups then
					maxGroup = C.raidframe.raid_groups
				end
				if C.raidframe.layout == "AUTO" and not T.IsHealerSpec() then maxGroup = 5 end
				if prevNum ~= maxGroup then
					local offset = (maxGroup - 5) * (C.raidframe.heal_raid_height + 7) + ((maxGroup - ((maxGroup - 5))) * (C.raidframe.heal_raid_height - 26))
					-- local offset = (maxGroup - 5) * (C.raidframe.heal_raid_height + 7)
					if C.raidframe.layout == "AUTO" and not T.IsHealerSpec() then offset = 0 end
					adjustAnchor(offset)
					prevNum = maxGroup
				end

				if event == "PLAYER_REGEN_ENABLED" then
					self:UnregisterEvent("PLAYER_REGEN_ENABLED")
				end
			elseif C.raidframe.raid_groups == 5 and C.raidframe.heal_raid_height > 26 then
				local offset = (C.raidframe.raid_groups - 5) * (C.raidframe.heal_raid_height + 7) + ((C.raidframe.raid_groups - ((C.raidframe.raid_groups - 5))) * (C.raidframe.heal_raid_height - 26))
				if C.raidframe.layout == "AUTO" and not T.IsHealerSpec() then offset = 0 end
				adjustAnchor(offset)
				self:UnregisterEvent("GROUP_ROSTER_UPDATE")
			else
				self:UnregisterAllEvents()
			end
		else
			self:UnregisterAllEvents()
		end
	end

	local frame = CreateFrame("Frame")
	frame:RegisterEvent("PLAYER_LOGIN")
	frame:RegisterEvent("GROUP_ROSTER_UPDATE")
	if C.raidframe.layout == "AUTO" then
		frame:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")
	end
	frame:SetScript("OnEvent", Reposition)
elseif C.raidframe.auto_position == "STATIC" then
	local function Reposition(self)
		if (C.raidframe.layout == "HEAL" or C.raidframe.layout == "AUTO") and not C.raidframe.raid_groups_vertical and C.raidframe.raid_groups >= 5 then
			local offset = (C.raidframe.raid_groups - 5) * (C.raidframe.heal_raid_height + 7) + ((C.raidframe.raid_groups - ((C.raidframe.raid_groups - 5))) * (C.raidframe.heal_raid_height - 26))
			-- local offset = (C.raidframe.raid_groups - 5) * (C.raidframe.heal_raid_height + 7)
			if C.raidframe.layout == "AUTO" and not T.IsHealerSpec() then offset = 0 end
			adjustAnchor(offset)
		else
			self:UnregisterAllEvents()
		end
	end

	local frame = CreateFrame("Frame")
	frame:RegisterEvent("PLAYER_LOGIN")
	if C.raidframe.layout == "AUTO" then
		frame:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")
	end
	frame:SetScript("OnEvent", Reposition)
end