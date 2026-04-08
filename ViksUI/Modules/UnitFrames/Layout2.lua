local T, C, L = unpack(ViksUI)
if C.unitframe.enable ~= true or C.layout2.enable ~= true then return end

--print("|cff00ff00Layout2.lua: Starting to load...|r")

local _, ns = ...
local oUF = ns.oUF

if not oUF then
	print("|cffff0000Layout2.lua: oUF not found!|r")
	return
end

-- Store reference to CreateShadow from Layout.lua
local CreateShadow

C.unitframe.lines = false -- Disable auto height adjustment for Layout2 frames
C.unitframe.extra_height_auto = false -- Disable auto height adjustment for Layout2 frames

-- Update C.media.texture to use Layout2 texture
C.media.texture = C.layout2.health_texture

----------------------------------------------------------------------------------------
--	LAYOUT2 POSITIONS
--	Update positions for some elements for this layout.
----------------------------------------------------------------------------------------
C["position"].unitframes["target_target"] = {"TOPRIGHT", "oUF_Target", "BOTTOMRIGHT", -8, -28}
C["position"].unitframes["pet"] = {"TOPLEFT", "oUF_Player", "BOTTOMLEFT", 8, -28}
C["position"].unitframes["focus"] = {"TOPRIGHT", "oUF_Player", "BOTTOMRIGHT", 4, -28}
C["position"].unitframes["focus_target"] = {"TOPLEFT", "oUF_Target", "BOTTOMLEFT", -4, -28}
C["position"].unitframes["party_heal"] = {"TOPLEFT", "oUF_Player", "BOTTOMRIGHT", 11, -49}
C["position"].unitframes["raid_heal"] = {"TOPLEFT", "oUF_Player", "BOTTOMRIGHT", 11, -12}
C["position"].unitframes["tank"] = {"BOTTOM", UIParent, "BOTTOM", -C.raidframe.heal_raid_width/2, 300}

----------------------------------------------------------------------------------------
--	LAYOUT2 OPTIONS
--	Customize Layout2 behavior with these easy-to-toggle options
----------------------------------------------------------------------------------------

local Layout2Options = {
	-- Use portrait-style borders for secondary frames (pet, target's target, focus, etc.)
	-- Set to true to use SetTemplate("Invisible") + SetBackdropColor like portrait
	-- Set to false to use default SetTemplate("Default") borders
	use_portrait_borders = true,
}

----------------------------------------------------------------------------------------
--	TAG CONFIGURATION
--	Configure which tags appear on player and target frames
--	Set enable = false to hide a tag
--	Modify the "tag" field to change what information is displayed
----------------------------------------------------------------------------------------

local Layout2Tags = {
	player = {
		health_bar = {
			enable = true,
			top_left = {
				enable = C.layout2.player_health_top_left_enable,
				tag = C.layout2.player_health_top_left_tag,
				font_type = "name_font",
				font = nil,
				size = nil,
				style = nil,
				x = 2,
				y = -1,
				justify = "LEFT",
			},
			top_center = {
				enable = C.layout2.player_health_top_center_enable,
				tag = C.layout2.player_health_top_center_tag,
				font_type = "name_font",
				font = nil,
				size = nil,
				style = nil,
				x = 0,
				y = -1,
				justify = "CENTER",
			},
			top_right = {
				enable = C.layout2.player_health_top_right_enable,
				tag = C.layout2.player_health_top_right_tag,
				font_type = "number_font",
				font = nil,
				size = 24,
				style = nil,
				x = -2,
				y = -1,
				justify = "RIGHT",
			},
			bottom_right = {
				enable = C.layout2.player_health_bottom_right_enable,
				tag = C.layout2.player_health_bottom_right_tag,
				font_type = "number_font",
				font = nil,
				size = nil,
				style = nil,
				x = -2,
				y = 1,
				justify = "RIGHT",
			},
		},
		text_bar = {
			enable = true,
			bottom_left = {
				enable = C.layout2.player_text_bar_bottom_left_enable,
				tag = C.layout2.player_text_bar_bottom_left_tag,
				font_type = "number_font",
				font = nil,
				size = nil,
				style = nil,
				x = 2,
				y = 1,
				justify = "LEFT",
			},
			bottom_center = {
				enable = C.layout2.player_text_bar_bottom_center_enable,
				tag = C.layout2.player_text_bar_bottom_center_tag,
				font_type = "name_font",
				font = nil,
				size = nil,
				style = nil,
				x = 0,
				y = 1,
				justify = "CENTER",
			},
			bottom_right = {
				enable = C.layout2.player_text_bar_bottom_right_enable,
				tag = C.layout2.player_text_bar_bottom_right_tag,
				font_type = "number_font",
				font = nil,
				size = nil,
				style = nil,
				x = -2,
				y = 1,
				justify = "RIGHT",
			},
		},
	},
	
	target = {
		health_bar = {
			enable = true,
			top_left = {
				enable = C.layout2.target_health_top_left_enable,
				tag = C.layout2.target_health_top_left_tag,
				font_type = "name_font",
				font = nil,
				size = nil,
				style = nil,
				x = 2,
				y = -1,
				justify = "LEFT",
			},
			top_center = {
				enable = C.layout2.target_health_top_center_enable,
				tag = C.layout2.target_health_top_center_tag,
				font_type = "name_font",
				font = nil,
				size = nil,
				style = nil,
				x = 0,
				y = -1,
				justify = "CENTER",
			},
			top_right = {
				enable = C.layout2.target_health_top_right_enable,
				tag = C.layout2.target_health_top_right_tag,
				font_type = "number_font",
				font = nil,
				size = nil,
				style = nil,
				x = -2,
				y = -1,
				justify = "RIGHT",
			},
			bottom_right = {
				enable = C.layout2.target_health_bottom_right_enable,
				tag = C.layout2.target_health_bottom_right_tag,
				font_type = "number_font",
				font = nil,
				size = nil,
				style = nil,
				x = -2,
				y = 1,
				justify = "RIGHT",
			},
		},
		text_bar = {
			enable = true,
			bottom_left = {
				enable = C.layout2.target_text_bar_bottom_left_enable,
				tag = C.layout2.target_text_bar_bottom_left_tag,
				font_type = "number_font",
				font = nil,
				size = nil,
				style = nil,
				x = 2,
				y = 1,
				justify = "LEFT",
			},
			bottom_center = {
				enable = C.layout2.target_text_bar_bottom_center_enable,
				tag = C.layout2.target_text_bar_bottom_center_tag,
				font_type = "number_font",
				font = nil,
				size = nil,
				style = nil,
				x = 0,
				y = 1,
				justify = "CENTER",
			},
			bottom_right = {
				enable = C.layout2.target_text_bar_bottom_right_enable,
				tag = C.layout2.target_text_bar_bottom_right_tag,
				font_type = "number_font",
				font = nil,
				size = nil,
				style = nil,
				x = -2,
				y = 1,
				justify = "RIGHT",
			},
		},
	},
}

-- Font Configuration
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

----------------------------------------------------------------------------------------
--	SHADOW CONFIGURATION
--	Controls drop shadows on text for better readability
--	Set enable = false to disable shadows
--	offset_x: horizontal shadow distance (positive = right, negative = left)
--	offset_y: vertical shadow distance (positive = up, negative = down)
----------------------------------------------------------------------------------------

local Layout2Shadow = {
	name_shadow = {
		enable = true,
		color = {0, 0, 0, 1},
		offset_x = 1,
		offset_y = -2,
	},
	number_shadow = {
		enable = false,
		color = {0, 0, 0, 1},
		offset_x = 1,
		offset_y = -1,
	},
}

----------------------------------------------------------------------------------------
--	LAYOUT2 CONFIGURATION
--	Main configuration for all Layout2 frame sizes, positions, and offsets
--	
--	TIPS FOR EDITING:
--	- layout2_w and layout2_h: Main frame dimensions (from Config)
--	- offset_x/offset_y: Position adjustments relative to parent frame
--	- frame_level: Drawing order (higher = on top)
--	- centerbar_true / no_centerbar: Sub-frame and castbar position config blocks
----------------------------------------------------------------------------------------

local Layout2Config = {
	-- Player frame
	player = {
		width = C.layout2.player_width,
		height = C.layout2.player_height,
	},
	
	-- Target frame
	target = {
		width = C.layout2.target_width,
		height = C.layout2.target_height,
	},
	
	-- Pet frame
	pet = {
		width = C.layout2.pet_width,
		height = C.layout2.pet_height,
	},
	
	-- Target's target frame
	targettarget = {
		width = C.layout2.targettarget_width,
		height = C.layout2.targettarget_height,
	},
	
	-- Focus frame
	focus = {
		width = C.layout2.focus_width,
		height = C.layout2.focus_height,
	},
	
	-- Focus target frame
	focustarget = {
		width = C.layout2.focustarget_width,
		height = C.layout2.focustarget_height,
	},
	
	-- Arena frame
	arena = {
		width = C.layout2.arena_width,
		height = C.layout2.arena_height,
	},
	
	-- Boss frame
	boss = {
		width = C.layout2.boss_width,
		height = C.layout2.boss_height,
	},
	
	-- Health frame styling
	health = {
		width = C.layout2.player_width,
		height = C.layout2.player_height,
		texture = C.layout2.health_texture,
		backdrop_color = C.media.border_color,
		frame_level = 6,
	},
	
	-- Power frame (mana, rage, energy, etc.) styling and size
	power = {
		width = C.layout2.player_width,
		height = C.layout2.player_height,
		texture = C.layout2.power_texture,
		backdrop_color = C.media.border_color,
		frame_level = 5,
		offset_x = -6,  -- Position relative to health frame
		offset_y = -7,  -- Position relative to health frame
	},
	
	-- Text bar (below health/power) for additional info
	text_bar = {
		width = C.layout2.player_width,
		height = C.layout2.player_height,
		texture = C.layout2.textbar_texture,
		texture_color = {0.125, 0.125, 0.125, 1},
		frame_level = 4,
		offset_x = 6,   -- Horizontal offset from health frame
		offset_y = 13,  -- Vertical offset below health frame
	},
	
	-- Portrait frame (player/target face)
	portrait = {
		size = C.layout2.portrait_size,
		frame_level = 5,
		backdrop_color = C.media.border_color,
		texcoord = {0.15, 0.85, 0.15, 0.85},
	},

	-- -----------------------------------------------------------------------
	-- CENTERBAR = TRUE  (C.layout2.centerbar = true)
	--   Player castbar : TOP edge = portrait TOP,  X = screen centre
	--   Target castbar : BOTTOM edge = portrait BOTTOM, X = screen centre
	--   Pet            : TOPLEFT  4 px below textFrame BOTTOMLEFT  (left anchor)
	--   Focus          : TOPRIGHT 4 px below textFrame BOTTOMRIGHT (right anchor)
	--   FocusTarget    : TOPLEFT  4 px below target textFrame BOTTOMLEFT
	--   TargetTarget   : TOPRIGHT 4 px below target textFrame BOTTOMRIGHT
	--   Sub-frame width = (textFrame.width / 2) - pair_inner_margin
	--   → pair_inner_margin 6 px each side = 12 px gap between the pair
	-- -----------------------------------------------------------------------
	centerbar_true = {
		castbar_width_offset   = -4,   -- Castbar width  = textFrame.width + this
		sub_frame_gap          = -4,   -- Y gap: sub-frame TOP below textFrame BOTTOM
		pair_inner_margin      = 6,    -- Removed from each sub-frame width (12 px total gap)
		sub_frame_height       = C.layout2.pet_height,  -- Height shared by pet/focus/tt/ft
	},

	-- -----------------------------------------------------------------------
	-- CENTERBAR = FALSE  (C.layout2.centerbar = false)
	--   Player castbar  : TOPLEFT  6 px below textFrame BOTTOMLEFT, full width
	--   Target castbar  : TOPRIGHT 6 px below textFrame BOTTOMRIGHT, full width
	--   Pet             : same slot as player castbar in centerbar=true
	--                     (screen-centred, TOP = portrait TOP)
	--   TargetTarget    : same slot as target castbar in centerbar=true
	--                     (screen-centred, BOTTOM = portrait BOTTOM)
	--   Focus           : TOPRIGHT 6 px below player castbar BOTTOMRIGHT
	--   FocusTarget     : TOPLEFT  6 px below target castbar BOTTOMLEFT
	-- -----------------------------------------------------------------------
	no_centerbar = {
		castbar_gap            = -6,   -- Y gap: castbar TOP below textFrame BOTTOM
		castbar_width_offset   = 0,    -- Castbar width  = textFrame.width + this (full)
		focus_gap              = -6,   -- Y gap: focus TOP below player castbar BOTTOM
		focustarget_gap        = -6,   -- Y gap: focustarget TOP below target castbar BOTTOM
	},

	-- Experience and Reputation bars (beside portrait)
	bars = {
		width = 3,      -- Width of experience/reputation bars
		spacing = -6,   -- Space between bars
		frame_level = 8, -- Behind health/power/text frames
	},
}

----------------------------------------------------------------------------------------
--	HELPER FUNCTIONS
----------------------------------------------------------------------------------------
-- Get frame dimensions based on unit type
local function GetFrameDimensions(unitType)
	if unitType == "player" or unitType == "target" then
		return C.layout2.player_width, C.layout2.player_height
	elseif unitType == "arena" or unitType == "boss" then
		return C.layout2.arena_width, C.layout2.arena_height
	else
		-- Pet, focus, focustarget, targettarget
		return C.layout2.pet_width, C.layout2.pet_height
	end
end

local function GetCreateShadow()
	if CreateShadow then return CreateShadow end
	
	if _G.CreateShadow then
		CreateShadow = _G.CreateShadow
		return CreateShadow
	end
	
	CreateShadow = function(f)
		if f.shadow then return end
		local shadow = CreateFrame("Frame", nil, f, "BackdropTemplate")
		shadow:SetFrameLevel(1)
		shadow:SetFrameStrata(f:GetFrameStrata())
		shadow:SetPoint("TOPLEFT", -4, 4)
		shadow:SetPoint("BOTTOMRIGHT", 4, -4)
		shadow:SetBackdrop({
			edgeFile = "Interface\\AddOns\\ViksUI\\Media\\Other\\glowTex",
			edgeSize = 4,
			insets = { left = 3, right = 3, top = 3, bottom = 3 }
		})
		shadow:SetBackdropColor(0, 0, 0, 0)
		shadow:SetBackdropBorderColor(0, 0, 0, 1)
		f.shadow = shadow
		return shadow
	end
	
	return CreateShadow
end

-- Create a single tag (text) on a frame
local function CreateTag(self, parent, tagConfig, point)
	if not tagConfig or not tagConfig.enable or tagConfig.tag == "" then
		return nil
	end
	
	local fontType = tagConfig.font_type or "name_font"
	local fontDefaults = Layout2Fonts[fontType]
	if not fontDefaults then
		fontDefaults = Layout2Fonts.name_font
	end
	
	-- Use tag-specific font settings, or fall back to defaults
	local font = tagConfig.font or fontDefaults.font
	local size = tagConfig.size or fontDefaults.size
	local style = tagConfig.style or fontDefaults.style
	
	local fontString = T.SetFontString(parent, font, size, style)
	fontString:SetJustifyH(tagConfig.justify or "LEFT")
	fontString:SetPoint(point, parent, point, tagConfig.x or 0, tagConfig.y or 0)
	
	-- Apply shadow based on font type
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

-- Apply all configured health bar tags
local function ApplyHealthBarTags(self, unit)
	if not Layout2Tags[unit] or not Layout2Tags[unit].health_bar then return end
	if not Layout2Tags[unit].health_bar.enable then return end
	
	local config = Layout2Tags[unit].health_bar
	if not self.Health then return end
	
	if config.top_left and config.top_left.enable then
		self.Health.TagTopLeft = CreateTag(self, self.Health, config.top_left, "TOPLEFT")
	end
	
	if config.top_center and config.top_center.enable then
		self.Health.TagTopCenter = CreateTag(self, self.Health, config.top_center, "TOP")
	end
	
	if config.top_right and config.top_right.enable then
		self.Health.TagTopRight = CreateTag(self, self.Health, config.top_right, "TOPRIGHT")
	end

    if config.bottom_right and config.bottom_right.enable then
        self.Health.TagBottomRight = CreateTag(self, self.Health, config.bottom_right, "BOTTOMRIGHT")
    end
	
	if config.show_missing_hp then
		self.Health.TagMissingHP = T.SetFontString(self.Health, Layout2Fonts.number_font.font, Layout2Fonts.number_font.size, Layout2Fonts.number_font.style)
		self.Health.TagMissingHP:SetPoint("CENTER", self.Health, "CENTER", 0, -8)
		self.Health.TagMissingHP:SetJustifyH("CENTER")
		
		if Layout2Shadow.number_shadow.enable then
			self.Health.TagMissingHP:SetShadowColor(unpack(Layout2Shadow.number_shadow.color))
			self.Health.TagMissingHP:SetShadowOffset(Layout2Shadow.number_shadow.offset_x, Layout2Shadow.number_shadow.offset_y)
		end
		
		self:Tag(self.Health.TagMissingHP, "[MissingHP]")
	end
end

-- Apply all configured text bar tags
local function ApplyTextBarTags(self, textFrame, unit)
	if not Layout2Tags[unit] or not Layout2Tags[unit].text_bar then return end
	if not Layout2Tags[unit].text_bar.enable then return end
	
	local config = Layout2Tags[unit].text_bar
	
	if config.bottom_left and config.bottom_left.enable then
		CreateTag(self, textFrame, config.bottom_left, "BOTTOMLEFT")
	end
	
	if config.bottom_center and config.bottom_center.enable then
		CreateTag(self, textFrame, config.bottom_center, "BOTTOM")
	end
	
	if config.bottom_right and config.bottom_right.enable then
		CreateTag(self, textFrame, config.bottom_right, "BOTTOMRIGHT")
	end
end

----------------------------------------------------------------------------------------
--	PLAYER FRAME PORTRAIT REFERENCE
--	Stored for use when positioning pet and target's target frames
----------------------------------------------------------------------------------------

local playerFramePortrait = nil

----------------------------------------------------------------------------------------
--	SECONDARY FRAME TEMPLATE APPLIER
--	Applies portrait-style borders to secondary frames (pet, target's target, etc.)
--	if use_portrait_borders option is enabled
----------------------------------------------------------------------------------------

local function ApplySecondaryFrameTemplate(frame)
	if Layout2Options.use_portrait_borders then
		frame:SetTemplate("Invisible")
		frame:SetBackdropColor(unpack(C.media.border_color))
		CreateShadow(frame)
	else
		frame:SetTemplate("Default")
	end
end

----------------------------------------------------------------------------------------
--	MAIN HOOK - RegisterStyle
--	This hooks into oUF's RegisterStyle function to apply Layout2 modifications
--	to the "Viks" style frames after they are created
----------------------------------------------------------------------------------------

local originalRegisterStyle = oUF.RegisterStyle

function oUF:RegisterStyle(styleName, sharedFunc)
	if styleName == "Viks" then
		local OriginalShared = sharedFunc
		CreateShadow = GetCreateShadow()
		
		local function SharedWithLayout2(self, unit)
			-- Call original Layout.lua function first
			OriginalShared(self, unit)
			
			-- Only apply Layout2 if enabled in config
			if not C.layout2.enable then
				return self
			end
			
			local unitType = (unit and unit:find("arena%dtarget")) and "arenatarget"
				or (unit and unit:find("arena%d")) and "arena"
				or (unit and unit:find("boss%d")) and "boss" or unit
			
			-- Only modify player and target frames for Layout2 styling
			-- Secondary frames (pet, targettarget, focus, etc.) use ApplySecondaryFrameTemplate
			if unitType ~= "player" and unitType ~= "target" then
				-- Apply portrait-style borders to secondary frames if enabled
				if Layout2Options.use_portrait_borders and self.backdrop then
					ApplySecondaryFrameTemplate(self)
				end
				return self
			end
			
			-- ========== BACKDROP SETUP ==========
			-- Remove borders from main frame backdrop
			if self.backdrop then
				self.backdrop:SetBackdrop({edgeFile = nil})
				self.backdrop:SetBackdropBorderColor(0, 0, 0, 0)
			end
			
			-- ========== PORTRAIT SETUP ==========
			-- Remove existing portrait if present
			if self.Portrait and self.Portrait:GetParent() == self and not self.Portrait.isLayout2 then
				self.Portrait:Hide()
				self.Portrait = nil
			end

			-- Create new Layout2 portrait based on portrait type from config
			if C.unitframe.portrait_type == "3D" or C.unitframe.portrait_type == "OVERLAY" then
				self.Portrait = CreateFrame("PlayerModel", self:GetName().."_Portrait", self)
			else
				self.Portrait = CreateFrame("Frame", self:GetName().."_Portrait", self, "BackdropTemplate")
			end
			self.Portrait.isLayout2 = true

			-- Set size and position
			self.Portrait:SetSize(Layout2Config.portrait.size, Layout2Config.portrait.size)
			if unitType == "player" then
				self.Portrait:SetPoint("TOPLEFT", self, "TOPRIGHT", 12, 0)
			elseif unitType == "target" then
				self.Portrait:SetPoint("TOPRIGHT", self, "TOPLEFT", -12, 0)
			end
			self.Portrait:SetFrameLevel(Layout2Config.portrait.frame_level)

			-- Setup backdrop and shadow (only for non-PlayerModel frames)
			if C.unitframe.portrait_type ~= "OVERLAY" and C.unitframe.portrait_type ~= "3D" then
				self.Portrait:SetTemplate("Default")
				self.Portrait:SetBackdropColor(unpack(C.media.border_color))
				CreateShadow(self.Portrait)
				
				if C.unitframe.portrait_type == "ICONS" then
					self.Portrait.classIcons = true
				end
				
				-- Create portrait texture
				self.Portrait.Icon = self.Portrait:CreateTexture(nil, "ARTWORK")
				self.Portrait.Icon:SetAllPoints()
				self.Portrait.Icon:SetTexCoord(unpack(Layout2Config.portrait.texcoord))
			else
				-- For 3D and OVERLAY types, create a background frame with colored backdrop
				if C.unitframe.portrait_type == "3D" or C.unitframe.portrait_type == "ICONS" then
					local bgFrame = CreateFrame("Frame", nil, self, "BackdropTemplate")  -- Parent is self, not self.Portrait
					bgFrame:SetFrameLevel(self.Portrait:GetFrameLevel() - 1)
					bgFrame:SetTemplate("Invisible")
					bgFrame:SetBackdropColor(unpack(C.media.backdrop_color))
					CreateShadow(bgFrame)
					
					-- Position background frame to match portrait with 1px inset
					if unitType == "player" then
						bgFrame:SetPoint("TOPLEFT", self, "TOPRIGHT", 12, 1)
					elseif unitType == "target" then
						bgFrame:SetPoint("TOPRIGHT", self, "TOPLEFT", -12, 1)
					end
					bgFrame:SetSize(Layout2Config.portrait.size, Layout2Config.portrait.size)
					
					-- Inset portrait 1px into the background frame
					self.Portrait:ClearAllPoints()
					self.Portrait:SetPoint("TOPLEFT", bgFrame, "TOPLEFT", 1, -1)
					self.Portrait:SetPoint("BOTTOMRIGHT", bgFrame, "BOTTOMRIGHT", -1, 1)
					
					self.Portrait.backgroundFrame = bgFrame
				end
				
				if C.unitframe.portrait_type ~= "OVERLAY" then
					self.Portrait.Icon = self.Portrait:CreateTexture(nil, "ARTWORK")
					self.Portrait.Icon:SetAllPoints()
					self.Portrait.Icon:SetTexCoord(unpack(Layout2Config.portrait.texcoord))
				end
			end

			-- Add fake .backdrop property for ALL frame types (for Layout.lua compatibility)
			self.Portrait.backdrop = {
				SetBackdropBorderColor = function(...) end
			}

			-- Store player portrait reference AFTER creation for compatibility
			if unitType == "player" then
				playerFramePortrait = self.Portrait
			end

			-- Apply class color to portrait backdrop if enabled (only for non-3D/OVERLAY)
			-- if C.unitframe.portrait_classcolor_border == true and C.unitframe.portrait_type ~= "3D" and C.unitframe.portrait_type ~= "OVERLAY" then
				-- if unitType == "player" then
					-- self.Portrait:SetBackdropColor(T.color.r, T.color.g, T.color.b)
				-- elseif unitType == "target" then
					-- self.Portrait:RegisterEvent("PLAYER_TARGET_CHANGED")
					-- self.Portrait:SetScript("OnEvent", function()
						-- local _, class = UnitClass("target")
						-- local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
						-- if color then
							-- self.Portrait:SetBackdropColor(color.r, color.g, color.b)
						-- else
							-- self.Portrait:SetBackdropColor(unpack(C.media.border_color))
						-- end
					-- end)
				-- end
			-- end

			-- OVERLAY specific positioning adjustments
			if C.unitframe.portrait_type == "OVERLAY" and self.Health then
				local healthTex = self.Health:GetStatusBarTexture()
				self.Portrait:ClearAllPoints()
				self.Portrait:SetPoint("TOPLEFT", healthTex, "TOPLEFT", 0, 0)
				self.Portrait:SetPoint("BOTTOMRIGHT", healthTex, "BOTTOMRIGHT", 0, 1)
				self.Portrait:SetFrameLevel(self.Health:GetFrameLevel())
				self.Portrait:SetAlpha(0.5)
			end
						
			-- ========== HEALTH FRAME SETUP ==========
			local healthFrame = CreateFrame("Frame", self:GetName().."_HealthFrame", self, "BackdropTemplate")
			healthFrame:SetSize(Layout2Config.health.width, Layout2Config.health.height)
			healthFrame:SetPoint("LEFT", self, "LEFT", 0, 2)
			healthFrame:SetFrameLevel(Layout2Config.health.frame_level)
			healthFrame:SetTemplate("Invisible")
			healthFrame:SetBackdropColor(unpack(C.media.border_color))
			CreateShadow(healthFrame)
			
			-- Move health bar into health frame
			if self.Health then
				self.Health:SetParent(healthFrame)
				self.Health:ClearAllPoints()
				self.Health:SetAllPoints()
				self.Health:SetStatusBarTexture(C.layout2.health_texture)
				self.Health:SetFrameLevel(Layout2Config.health.frame_level+1)
				if C.unitframe.own_color == true then
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
				if C.unitframe.plugins_smooth_bar == true then
					self.Health.smoothing = Enum.StatusBarInterpolation.ExponentialEaseOut or 1
				end

				self.Health.PostUpdate = T.PostUpdateHealth
				self.Health.PostUpdateColor = T.PostUpdateHealthColor
				
				if not self.Health.bg then
					self.Health.bg = self.Health:CreateTexture(nil, "BORDER")
					self.Health.bg:SetAllPoints()
					self.Health.bg:SetTexture(C.layout2.health_texture)
					if C.unitframe.own_color == true then
						self.Health.bg:SetVertexColor(unpack(C.unitframe.uf_color_bg))
					else
						self.Health.bg.multiplier = 0.2
					end
				end
			end
			
			-- Hide original health bar tags
			if self.Health and self.Health.value then self.Health.value:Hide() end
			if self.Health and self.Health.short_value then self.Health.short_value:Hide() end
			if self.Info then self.Info:Hide() end
			if self.Level then self.Level:Hide() end
			
			if C.unitframe.portrait_type == "OVERLAY" then
				local healthTex = self.Health:GetStatusBarTexture()
				self.Portrait:ClearAllPoints()
				self.Portrait:SetPoint("TOPLEFT", healthTex, "TOPLEFT", 0, 0)
				self.Portrait:SetPoint("BOTTOMRIGHT", healthTex, "BOTTOMRIGHT", 0, 1)
				self.Portrait:SetFrameLevel(self.Health:GetFrameLevel())
				-- self.Portrait.backdrop:Hide()
				self.Portrait:SetAlpha(0.5)
			end
			
			-- Apply custom health bar tags from Layout2Tags
			ApplyHealthBarTags(self, unitType)

			-- ========== PLAYER FRAME INDICATORS (Layout2 adjustments) ==========
			if unitType == "player" then
				-- Low mana warning
				if T.class ~= "DEATHKNIGHT" and T.class ~= "DEMONHUNTER" and T.class ~= "HUNTER" and T.class ~= "ROGUE" and T.class ~= "WARRIOR" then
					self.LowMana = CreateFrame("Frame", self:GetName().."_LowMana", self)
					self.LowMana:SetScript("OnUpdate", T.UpdateManaLevel)
					self.LowMana:SetFrameLevel(self.Health:GetFrameLevel() + 1)
					self.LowMana:SetAllPoints(self.Health)

					-- Mana level text - centered on health bar
					self.LowMana.Text = T.SetFontString(self.LowMana, C.layout2.UFNamefont or C.font.unit_frames_font, C.layout2.name_font_size, C.layout2.name_font_style)
					self.LowMana.Text:SetText("|cffaf5050"..MANA_LOW.."|r")
					self.LowMana.Text:SetPoint("CENTER", 0, 0)
					self.LowMana.Text:SetAlpha(0)
				
					-- Optional: Add shadow to mana text for better readability
					if Layout2Shadow.name_shadow.enable then
						self.LowMana.Text:SetShadowColor(unpack(Layout2Shadow.name_shadow.color))
						self.LowMana.Text:SetShadowOffset(Layout2Shadow.name_shadow.offset_x, Layout2Shadow.name_shadow.offset_y)
					end
				end

				-- Combat icon - reposition for Layout2
				if self.CombatIndicator then
					self.CombatIndicator:SetSize(20, 24)
					self.CombatIndicator:ClearAllPoints()
					self.CombatIndicator:SetPoint("TOPRIGHT", self.Health, "TOPRIGHT", -2, -2)
					self.CombatIndicator:SetTexture("Interface\\AddOns\\ViksUI\\Media\\Other\\combat2")
				end

				-- Resting icon - reposition for Layout2
				if self.RestingIndicator then
					self.RestingIndicator:SetSize(18, 18)
					self.RestingIndicator:ClearAllPoints()
					self.RestingIndicator:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", -4, -4)
					self.RestingIndicator:SetTexture("Interface\\AddOns\\ViksUI\\Media\\Other\\resting")
				end

				-- Leader icon - reposition for Layout2
				if self.LeaderIndicator then
					self.LeaderIndicator:SetSize(14, 14)
					self.LeaderIndicator:ClearAllPoints()
					self.LeaderIndicator:SetPoint("TOPLEFT", self.Health, "TOPLEFT", 2, -18)
				end

				-- Assistant icon - reposition for Layout2
				if self.AssistantIndicator then
					self.AssistantIndicator:SetSize(12, 12)
					self.AssistantIndicator:ClearAllPoints()
					self.AssistantIndicator:SetPoint("TOPLEFT", self.Health, "TOPLEFT", 2, -32)
				end

				-- LFD role icon - reposition for Layout2
				if self.GroupRoleIndicator then
					self.GroupRoleIndicator:SetSize(12, 12)
					self.GroupRoleIndicator:ClearAllPoints()
					self.GroupRoleIndicator:SetPoint("TOPRIGHT", self.Health, "TOPRIGHT", -16, -2)
				end
			end
			
			-- ========== POWER FRAME SETUP ==========
			if self.Power then
				local powerFrame = CreateFrame("Frame", self:GetName().."_PowerFrame", self, "BackdropTemplate")
				powerFrame:SetSize(Layout2Config.power.width, Layout2Config.power.height)
				
				if unitType == "player" then
					powerFrame:SetPoint("TOPLEFT", self.Health, "TOPLEFT", Layout2Config.power.offset_x, Layout2Config.power.offset_y)
				elseif unitType == "target" then
					powerFrame:SetPoint("TOPRIGHT", self.Health, "TOPRIGHT", -Layout2Config.power.offset_x, Layout2Config.power.offset_y)
				end
				
				powerFrame:SetFrameLevel(Layout2Config.power.frame_level)
				powerFrame:SetTemplate("Default")
				powerFrame:SetBackdropColor(unpack(C.media.border_color))
				CreateShadow(powerFrame)
				
				-- Move power bar into power frame
				self.Power:SetParent(powerFrame)
				self.Power:ClearAllPoints()
				self.Power:SetAllPoints()
				self.Power:SetStatusBarTexture(C.layout2.power_texture)
				self.Power:SetFrameLevel(Layout2Config.power.frame_level)
				self.Power.colorClass = true
				
				if not self.Power.bg then
					self.Power.bg = self.Power:CreateTexture(nil, "BORDER")
					self.Power.bg:SetAllPoints()
					self.Power.bg:SetTexture(C.layout2.power_texture)
					self.Power.bg:SetVertexColor(0.1, 0.1, 0.1, 0.2)
				end
				
				-- Hide original power bar tags
				if self.Power.value then self.Power.value:Hide() end
				if self.Power.short_value then self.Power.short_value:Hide() end
			end
			
			-- ========== TEXT BAR SETUP ==========
			if unitType == "player" or unitType == "target" then
				local textFrame = CreateFrame("Frame", self:GetName().."_TextFrame", self, "BackdropTemplate")
				textFrame:SetSize(Layout2Config.text_bar.width, Layout2Config.text_bar.height)
				
				if unitType == "player" then
					textFrame:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", Layout2Config.text_bar.offset_x, Layout2Config.text_bar.offset_y)
				elseif unitType == "target" then
					textFrame:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", -Layout2Config.text_bar.offset_x, Layout2Config.text_bar.offset_y)
				end
				
				textFrame:SetFrameLevel(Layout2Config.text_bar.frame_level)
				textFrame:SetTemplate("Default")
				
				local textBarTexture = textFrame:CreateTexture(nil, "BACKGROUND")
				textBarTexture:SetAllPoints()
				textBarTexture:SetTexture(C.layout2.textbar_texture)
				textBarTexture:SetVertexColor(unpack(Layout2Config.text_bar.texture_color))
				
				-- Apply custom text bar tags from Layout2Tags
				ApplyTextBarTags(self, textFrame, unitType)

				-- Store reference for later use by ApplyLayout2Positions
				self.Layout2TextFrame = textFrame

				-- ========== CASTBAR REPOSITIONING ==========
				if self.Castbar then
					self.Castbar:ClearAllPoints()
					local tfWidth = Layout2Config.text_bar.width
					if C.layout2.centerbar then
						-- centerbar = true
						-- Player : TOP of castbar = TOP of portrait, centred at screen
						-- Target : BOTTOM of castbar = BOTTOM of portrait, centred at screen
						local cbWidth = tfWidth + Layout2Config.centerbar_true.castbar_width_offset
						self.Castbar:SetWidth(cbWidth)
						if unitType == "player" then
							self.Castbar:SetPoint("TOP",  self.Portrait, "TOP",    0, 0)
							self.Castbar:SetPoint("LEFT", UIParent,      "CENTER", -cbWidth / 2, 0)
						elseif unitType == "target" then
							self.Castbar:SetPoint("BOTTOM", self.Portrait, "BOTTOM", 0, 0)
							self.Castbar:SetPoint("LEFT",   UIParent,      "CENTER", -cbWidth / 2, 0)
						end
					else
						-- centerbar = false
						-- Both castbars go straight below their textFrame
						local cbWidth = tfWidth + Layout2Config.no_centerbar.castbar_width_offset
						self.Castbar:SetWidth(cbWidth)
						if unitType == "player" then
							self.Castbar:SetPoint("TOPLEFT",  textFrame, "BOTTOMLEFT",  0, Layout2Config.no_centerbar.castbar_gap)
						elseif unitType == "target" then
							self.Castbar:SetPoint("TOPRIGHT", textFrame, "BOTTOMRIGHT", 0, Layout2Config.no_centerbar.castbar_gap)
						end
					end
				end
			end
			
				-- ========== PLAYER DEBUFFS REPOSITIONING ==========
			if C.layout2.player_bigdebuff then
				if self.Debuffs and unitType == "player" then
					self.Debuffs.size = C.layout2.player_debuff_size
					self.Debuffs:ClearAllPoints()
					self.Debuffs:SetPoint("BOTTOMRIGHT", DeBuffsAnchor, "BOTTOMRIGHT", 0, 0)
					self.Debuffs.initialAnchor = "BOTTOMRIGHT"
					self.Debuffs["growth-x"] = "LEFT"
					self.Debuffs["growth-y"] = "DOWN"
					self.Debuffs.spacing = C.layout2.debuff_spacing
				end
			end
			
			-- ========== TARGET AURAS REPOSITIONING ==========
			if unitType == "target" and self.Auras then
				if C.aura.target_auras then
					-- Hook the PostUpdate callback which runs after the aura element updates
					local originalPostUpdate = self.Auras.PostUpdate
					self.Auras.PostUpdate = function(auras, unit)
						if originalPostUpdate then
							originalPostUpdate(auras, unit)
						end
						
						-- Force reposition after every update
						C_Timer.After(0, function()
							if auras and auras:GetParent() then
								auras:ClearAllPoints()
								auras:SetPoint("BOTTOMLEFT", auras:GetParent(), "TOPLEFT", -1, 5)
								auras:SetWidth(C.layout2.player_width - 6)
							end
						end)
					end
				end
			end

			-- ========== EXPERIENCE & REPUTATION BARS REPOSITIONING ==========
			if self.Experience then
				self.Experience:ClearAllPoints()
				if unitType == "player" then
					self.Experience:SetPoint("TOPRIGHT", self.Portrait, "TOPLEFT", -2, -4)
					self.Experience:SetSize(Layout2Config.bars.width, Layout2Config.portrait.size-14)
					self.Experience:SetFrameLevel(Layout2Config.bars.frame_level)
				end
			end
			
			if self.Reputation then
				self.Reputation:ClearAllPoints()
				if unitType == "player" then
					self.Reputation:SetPoint("TOPRIGHT", self.Experience, "TOPLEFT", Layout2Config.bars.spacing, 0)
					self.Reputation:SetSize(Layout2Config.bars.width, Layout2Config.portrait.size-14)
					self.Reputation:SetFrameLevel(Layout2Config.bars.frame_level)
				end
			end
			
			-- ========== CLASS BARS REPOSITIONING ==========
			-- Adjust all class-specific bars (ComboPoints, Runes, Chi, etc.) to match Layout2 width
			if unitType == "player" then
				-- Runes (Death Knight)
				if self.Runes then
					self.Runes:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.Runes:SetSize((C.layout2.player_width - 3), 7)
					
					for i = 1, 6 do
						if self.Runes[i] then
							self.Runes[i]:SetSize(((C.layout2.player_width - 3) - 5) / 6, 7)
						end
						if i == 1 then
							self.Runes[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
						end
					end
				end
				
				-- ComboPoints (Rogue, Druid)
				if self.ComboPoints then
					self.ComboPoints:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.ComboPoints:SetSize((C.layout2.player_width - 3), 7)
					
					for i = 1, 7 do
						if self.ComboPoints[i] then
							self.ComboPoints[i]:SetSize(((C.layout2.player_width - 3) - 5) / 7, 7)
						end
						if i == 1 then
							self.ComboPoints[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
						end
					end
				end
				
				-- HarmonyBar / Chi (Monk)
				if self.HarmonyBar then
					self.HarmonyBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.HarmonyBar:SetSize((C.layout2.player_width - 3), 7)
					
					for i = 1, 6 do
						if self.HarmonyBar[i] then
							self.HarmonyBar[i]:SetSize(((C.layout2.player_width - 3) - 5) / 6, 7)
						end
						if i == 1 then
							self.HarmonyBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
						end
					end
				end
				
				-- Stagger (Monk)
				if self.Stagger then
					self.Stagger:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.Stagger:SetSize((C.layout2.player_width - 3), 7)
				end
				
				-- HolyPower (Paladin)
				if self.HolyPower then
					self.HolyPower:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.HolyPower:SetSize((C.layout2.player_width - 3), 7)
					
					for i = 1, 5 do
						if self.HolyPower[i] then
							self.HolyPower[i]:SetSize(((C.layout2.player_width - 3) - 4) / 5, 7)
						end
						if i == 1 then
							self.HolyPower[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
						end
					end
				end
				
				-- SoulShards (Warlock)
				if self.SoulShards then
					self.SoulShards:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.SoulShards:SetSize((C.layout2.player_width - 3), 7)
					
					for i = 1, 5 do
						if self.SoulShards[i] then
							self.SoulShards[i]:SetSize(((C.layout2.player_width - 3) - 4) / 5, 7)
						end
						if i == 1 then
							self.SoulShards[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
						end
					end
				end
				
				-- ArcaneCharge (Mage)
				if self.ArcaneCharge then
					self.ArcaneCharge:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.ArcaneCharge:SetSize((C.layout2.player_width - 3), 7)
					
					for i = 1, 4 do
						if self.ArcaneCharge[i] then
							self.ArcaneCharge[i]:SetSize(((C.layout2.player_width - 3) - 3) / 4, 7)
						end
						if i == 1 then
							self.ArcaneCharge[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
						end
					end
				end
				
				-- Essence (for new content)
				if self.Essence then
					self.Essence:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.Essence:SetSize((C.layout2.player_width - 3), 7)
					
					for i = 1, 6 do
						if self.Essence[i] then
							self.Essence[i]:SetSize(((C.layout2.player_width - 3) - 5) / 6, 7)
						end
						if i == 1 then
							self.Essence[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
						end
					end
				end
				
				-- SoulFragments (Demon Hunter)
				if self.SoulFragments then
					self.SoulFragments:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.SoulFragments:SetSize((C.layout2.player_width - 3), 7)
				end
				
				-- TotemBar (Shaman)
				if self.TotemBar then
					self.TotemBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
					self.TotemBar:SetSize((C.layout2.player_width - 2), 7)
					
					for i = 1, 4 do
						if self.TotemBar[i] then
							self.TotemBar[i]:SetSize(((C.layout2.player_width - 2) - 3) / 4, 7)
						end
						if i == 1 then
							self.TotemBar[i]:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 1, 7)
						end
					end
				end
			end
			
			-- ========== PET & TARGET'S TARGET POSITIONING ==========
			-- Initial positioning is handled by ApplyLayout2Positions.
			-- This early C_Timer ensures frames are placed before the first screen render
			-- in case ApplyLayout2Positions has not fired yet.
			if unitType == "player" then
				C_Timer.After(0.1, function()
					local player  = _G.oUF_Player
					local target  = _G.oUF_Target
					local pet     = _G.oUF_Pet
					local tt      = _G.oUF_TargetTarget
					local tfWidth = Layout2Config.text_bar.width

					if C.layout2.centerbar then
						-- ---- centerbar = true ----
						-- Pet  : TOPLEFT  sub_frame_gap below player textFrame BOTTOMLEFT
						-- TT   : TOPRIGHT sub_frame_gap below target textFrame BOTTOMRIGHT
						local subW = (tfWidth / 2) - Layout2Config.centerbar_true.pair_inner_margin
						local subH = Layout2Config.centerbar_true.sub_frame_height
						local gap  = Layout2Config.centerbar_true.sub_frame_gap

						local playerTF = player and _G[player:GetName().."_TextFrame"]
						if pet and playerTF then
							pet:ClearAllPoints()
							pet:SetPoint("TOPLEFT", playerTF, "BOTTOMLEFT", 0, gap)
							pet:SetSize(subW, subH)
						end

						local targetTF = target and _G[target:GetName().."_TextFrame"]
						if tt and targetTF then
							tt:ClearAllPoints()
							tt:SetPoint("TOPRIGHT", targetTF, "BOTTOMRIGHT", 0, gap)
							tt:SetSize(subW, subH)
						end
					else
						-- ---- centerbar = false ----
						-- Pet  : same slot as player castbar in centerbar=true
						--        (screen-centred, TOP = portrait TOP)
						local cbWidth = tfWidth + Layout2Config.centerbar_true.castbar_width_offset
						if pet and player then
							pet:ClearAllPoints()
							pet:SetWidth(cbWidth)
							pet:SetHeight(C.layout2.pet_height)
							pet:SetPoint("TOP",  player.Portrait, "TOP",    0, 0)
							pet:SetPoint("LEFT", UIParent,        "CENTER", -cbWidth / 2, 0)
						end

						-- TT : same slot as target castbar in centerbar=true
						--      (screen-centred, BOTTOM = portrait BOTTOM)
						if tt and target then
							tt:ClearAllPoints()
							tt:SetWidth(cbWidth)
							tt:SetHeight(C.layout2.targettarget_height)
							tt:SetPoint("BOTTOM", target.Portrait, "BOTTOM", 0, 0)
							tt:SetPoint("LEFT",   UIParent,        "CENTER", -cbWidth / 2, 0)
						end
					end
				end)
			end
			
			return self
		end
		
		-- Re-register oUF style with Layout2 modifications
		return originalRegisterStyle(self, styleName, SharedWithLayout2)
	else
		return originalRegisterStyle(self, styleName, sharedFunc)
	end
end

--print("|cff00ff00Layout2.lua: Hook registered|r")

----------------------------------------------------------------------------------------
--	API FUNCTIONS
--	Use these functions to modify Layout2 settings at runtime via console commands
----------------------------------------------------------------------------------------

-- Update a specific tag's display text
-- Example: T.UpdateLayout2Tag("player", "health_bar", "top_left", "[PercentHP]")
function T.UpdateLayout2Tag(unit, section, position, newTag)
	if Layout2Tags[unit] and Layout2Tags[unit][section] and Layout2Tags[unit][section][position] then
		Layout2Tags[unit][section][position].tag = newTag
		--print("|cff00ff00Layout2: Updated tag|r")
	end
end

-- Enable or disable a specific tag
-- Example: T.SetLayout2TagEnabled("player", "health_bar", "top_right", true)
function T.SetLayout2TagEnabled(unit, section, position, enabled)
	if Layout2Tags[unit] and Layout2Tags[unit][section] and Layout2Tags[unit][section][position] then
		Layout2Tags[unit][section][position].enable = enabled
	end
end

-- Update font properties
-- Example: T.UpdateLayout2Font("name_font", "size", 28)
function T.UpdateLayout2Font(fontType, key, value)
	if Layout2Fonts[fontType] then
		Layout2Fonts[fontType][key] = value
		--print("|cff00ff00Layout2: Updated font|r")
	end
end

-- Update shadow properties
-- Example: T.UpdateLayout2Shadow("name_shadow", "enable", false)
function T.UpdateLayout2Shadow(shadowType, key, value)
	if Layout2Shadow[shadowType] then
		Layout2Shadow[shadowType][key] = value
		--print("|cff00ff00Layout2: Updated shadow|r")
	end
end

-- Retrieve all tag configurations
function T.GetLayout2Tags() return Layout2Tags end

-- Retrieve all font configurations
function T.GetLayout2Fonts() return Layout2Fonts end

-- Retrieve all shadow configurations
function T.GetLayout2Shadow() return Layout2Shadow end

----------------------------------------------------------------------------------------
--	LAYOUT2 AUTO-POSITION HOOK
--	Hook into Layout.lua's auto-position logic to apply Layout2 positions in raids
----------------------------------------------------------------------------------------

if C.layout2.enable then
	local function ApplyLayout2Positions()
		if InCombatLockdown() then return end
		
		C_Timer.After(0.1, function()
			local player      = _G.oUF_Player
			local target      = _G.oUF_Target
			local pet         = _G.oUF_Pet
			local targettarget = _G.oUF_TargetTarget
			local focus       = _G.oUF_Focus
			local focustarget = _G.oUF_FocusTarget

			-- Resize main frames
			if player then player:SetSize(C.layout2.player_width, C.layout2.player_height) end
			if target then target:SetSize(C.layout2.target_width, C.layout2.target_height) end

			-- Shared references
			local tfWidth     = Layout2Config.text_bar.width
			local playerTF    = player and _G[player:GetName().."_TextFrame"]
			local targetTF    = target and _G[target:GetName().."_TextFrame"]

			if C.layout2.centerbar then
				-- ================================================================
				-- CENTERBAR = TRUE
				-- Sub-frames sit in pairs below the textFrame.
				-- Pet / Focus below player textFrame (left / right).
				-- FocusTarget / TargetTarget below target textFrame (left / right).
				-- ================================================================
				local subW = (tfWidth / 2) - Layout2Config.centerbar_true.pair_inner_margin
				local subH = Layout2Config.centerbar_true.sub_frame_height
				local gap  = Layout2Config.centerbar_true.sub_frame_gap

				-- Pet (left, under player textFrame)
				if pet and C.unitframe.show_pet and playerTF then
					pet:ClearAllPoints()
					pet:SetPoint("TOPLEFT", playerTF, "BOTTOMLEFT", 0, gap)
					pet:SetSize(subW, subH)
				end

				-- Focus (right, under player textFrame)
				if focus and C.unitframe.show_focus and playerTF then
					focus:ClearAllPoints()
					focus:SetPoint("TOPRIGHT", playerTF, "BOTTOMRIGHT", 0, gap)
					focus:SetSize(subW, subH)
				end

				-- FocusTarget (left, under target textFrame)
				if focustarget and C.unitframe.show_focus and targetTF then
					focustarget:ClearAllPoints()
					focustarget:SetPoint("TOPLEFT", targetTF, "BOTTOMLEFT", 0, gap)
					focustarget:SetSize(subW, subH)
				end

				-- TargetTarget (right, under target textFrame)
				if targettarget and C.unitframe.show_target_target and targetTF then
					targettarget:ClearAllPoints()
					targettarget:SetPoint("TOPRIGHT", targetTF, "BOTTOMRIGHT", 0, gap)
					targettarget:SetSize(subW, subH)
				end
			else
				-- ================================================================
				-- CENTERBAR = FALSE
				-- Pet / TargetTarget take the castbar slots from centerbar=true
				-- (screen-centred, portrait-aligned).
				-- Focus / FocusTarget sit below their respective castbars.
				-- ================================================================
				local cbWidth = tfWidth + Layout2Config.centerbar_true.castbar_width_offset

				-- Pet : screen-centred, TOP = player portrait TOP
				if pet and C.unitframe.show_pet and player then
					pet:ClearAllPoints()
					pet:SetWidth(Layout2Config.pet.width)
					pet:SetHeight(C.layout2.pet_height)
					local portraitTop = player.Portrait:GetTop()
					local petHalfH = pet:GetHeight() / 2
					local y = (portraitTop - petHalfH) - (UIParent:GetHeight() / 2)
					pet:SetPoint("CENTER", UIParent, "CENTER", 0, y)
				end

				-- TargetTarget : screen-centred, BOTTOM = target portrait BOTTOM
				if targettarget and C.unitframe.show_target_target and target then
					targettarget:ClearAllPoints()
					targettarget:SetWidth(Layout2Config.targettarget.width)
					targettarget:SetHeight(C.layout2.targettarget_height)
					local portraitBottom = target.Portrait:GetBottom()
					local uiCenterY = UIParent:GetTop() - (UIParent:GetHeight() / 2)
					local yOffset = (portraitBottom + targettarget:GetHeight() / 2) - uiCenterY

					targettarget:SetPoint("CENTER", UIParent, "CENTER", 0, yOffset)
				end

				-- Focus : TOPRIGHT below player castbar BOTTOMRIGHT
				if focus and C.unitframe.show_focus and player and player.Castbar then
					focus:ClearAllPoints()
					focus:SetPoint("TOPRIGHT", player.Castbar, "BOTTOMRIGHT", 0, Layout2Config.no_centerbar.focus_gap)
					focus:SetSize(C.layout2.focus_width, C.layout2.focus_height)
				end

				-- FocusTarget : TOPLEFT below target castbar BOTTOMLEFT
				if focustarget and C.unitframe.show_focus and target and target.Castbar then
					focustarget:ClearAllPoints()
					focustarget:SetPoint("TOPLEFT", target.Castbar, "BOTTOMLEFT", 0, Layout2Config.no_centerbar.focustarget_gap)
					focustarget:SetSize(C.layout2.focustarget_width, C.layout2.focustarget_height)
				end
			end

			if C.raidframe.layout == "HEAL" or C.raidframe.layout == "AUTO" then
				-- Reposition party anchor with layout2 offsets (12px right, 8px down vs default)
				if _G["PartyAnchor"] and player then
					_G["PartyAnchor"]:ClearAllPoints()
					_G["PartyAnchor"]:SetPoint(unpack(C.position.unitframes.party_heal_layout2))
				end
				-- Reposition RaidAnchor1 with layout2 offsets
				local raidAnchor1 = _G["RaidAnchor1"]
				if raidAnchor1 and player then
					raidAnchor1:ClearAllPoints()
					raidAnchor1:SetPoint(unpack(C.position.unitframes.raid_heal_layout2))
				end
			end
		end)

		-- Lets move the raid and party frames if using bartender 4 default viks layout
		local f = CreateFrame("Frame")
		f:RegisterEvent("GROUP_ROSTER_UPDATE")

		f:SetScript("OnEvent", function()
			if InCombatLockdown() then return end
			if not (C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded("Bartender4")) then return end

			local members = GetNumGroupMembers()

			local raidHeight = C.raidframe.heal_raid_height or 40
			local spacing = T and T.Scale and T.Scale(7) or 7

			local baseOffset = (members >= 21) and math.floor(raidHeight * 0.75) or 0

			local extraRows = 0
			if members >= 26 then
				extraRows = math.floor((members - 26) / 5) + 1
			end

			local extraOffset = extraRows * (raidHeight + spacing)

			local extraY = baseOffset + extraOffset

			local function MoveFrame(frame, extra)
				if not frame then return end

				local point, relFrame, relPoint, x, y = frame:GetPoint()

				-- Save original Y once
				if not frame.originalY then
					frame.originalY = y
				end

				frame:ClearAllPoints()
				frame:SetPoint(point, relFrame, relPoint, x, frame.originalY + extraY + (extra or 0))
			end

			MoveFrame(_G.oUF_Player)
			MoveFrame(_G.oUF_Target)
			
			-- Move castbars too
			if _G.oUF_Player and _G.oUF_Player.Castbar then
				MoveFrame(_G.oUF_Player.Castbar, 150)
			end

			if _G.oUF_Target and _G.oUF_Target.Castbar then
				MoveFrame(_G.oUF_Target.Castbar, 150)
			end

		end)
	end
	
	-- Hook into group roster updates
	local layout2RepositionFrame = CreateFrame("Frame")
	layout2RepositionFrame:RegisterEvent("PLAYER_LOGIN")
	layout2RepositionFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
	layout2RepositionFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	layout2RepositionFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
	if C.raidframe.layout == "AUTO" then
		layout2RepositionFrame:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")
	end
	
	layout2RepositionFrame:SetScript("OnEvent", function(self, event)
		ApplyLayout2Positions()
	end)
end

-- print("|cff00ff00Layout2.lua loaded successfully|r")