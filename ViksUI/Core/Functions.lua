local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	Number value function
----------------------------------------------------------------------------------------
-- Add comma's to a number
T.Comma = function(num)
	local Left, Number, Right = match(num, "^([^%d]*%d)(%d*)(.-)$")
	
	return 	Left .. reverse(gsub(reverse(Number), "(%d%d%d)", "%1,")) .. Right
end

T.Round = function(number, decimals)
	if not decimals then decimals = 0 end
	return (("%%.%df"):format(decimals)):format(number)
end

T.ShortValue = function(value)
	if value >= 1e11 then
		return ("%.0fb"):format(value / 1e9)
	elseif value >= 1e10 then
		return ("%.1fb"):format(value / 1e9):gsub("%.?0+([km])$", "%1")
	elseif value >= 1e9 then
		return ("%.2fb"):format(value / 1e9):gsub("%.?0+([km])$", "%1")
	elseif value >= 1e8 then
		return ("%.0fm"):format(value / 1e6)
	elseif value >= 1e7 then
		return ("%.1fm"):format(value / 1e6):gsub("%.?0+([km])$", "%1")
	elseif value >= 1e6 then
		return ("%.2fm"):format(value / 1e6):gsub("%.?0+([km])$", "%1")
	elseif value >= 1e5 then
		return ("%.0fk"):format(value / 1e3)
	elseif value >= 1e3 then
		return ("%.1fk"):format(value / 1e3):gsub("%.?0+([km])$", "%1")
	else
		return value
	end
end

T.RGBToHex = function(r, g, b)
	r = tonumber(r) <= 1 and tonumber(r) >= 0 and tonumber(r) or 0
	g = tonumber(g) <= tonumber(g) and tonumber(g) >= 0 and tonumber(g) or 0
	b = tonumber(b) <= 1 and tonumber(b) >= 0 and tonumber(b) or 0
	return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
end

----------------------------------------------------------------------------------------
--	Chat channel check
----------------------------------------------------------------------------------------
T.CheckChat = function(warning)
	if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
		return "INSTANCE_CHAT"
	elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
		if warning and (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") or IsEveryoneAssistant()) then
			return "RAID_WARNING"
		else
			return "RAID"
		end
	elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
		return "PARTY"
	end
	return "SAY"
end

----------------------------------------------------------------------------------------
--	Player's role check
----------------------------------------------------------------------------------------
local isCaster = {
	DEATHKNIGHT = {nil, nil, nil},
	DEMONHUNTER = {nil, nil},
	DRUID = {true},					-- Balance
	HUNTER = {nil, nil, nil},
	MAGE = {true, true, true},
	MONK = {nil, nil, nil},
	PALADIN = {nil, nil, nil},
	PRIEST = {nil, nil, true},		-- Shadow
	ROGUE = {nil, nil, nil},
	SHAMAN = {true},				-- Elemental
	WARLOCK = {true, true, true},
	WARRIOR = {nil, nil, nil}
}

local function CheckRole()
	local spec = GetSpecialization()
	local role = spec and GetSpecializationRole(spec)

	T.Spec = spec
	if role == "TANK" then
		T.Role = "Tank"
	elseif role == "HEALER" then
		T.Role = "Healer"
	elseif role == "DAMAGER" then
		if isCaster[T.class][spec] then
			T.Role = "Caster"
		else
			T.Role = "Melee"
		end
	end
end
local RoleUpdater = CreateFrame("Frame")
RoleUpdater:RegisterEvent("PLAYER_ENTERING_WORLD")
RoleUpdater:RegisterEvent("PLAYER_TALENT_UPDATE")
RoleUpdater:SetScript("OnEvent", CheckRole)

----------------------------------------------------------------------------------------
--	Player's buff check
----------------------------------------------------------------------------------------
T.CheckPlayerBuff = function(spell)
	for i = 1, 40 do
		local name, _, _, _, _, _, unitCaster = UnitBuff("player", i)
		if not name then break end
		if name == spell then
			return i, unitCaster
		end
	end
	return nil
end

----------------------------------------------------------------------------------------
--	Player's level check
----------------------------------------------------------------------------------------
local function CheckLevel(_, _, level)
	T.level = level
end
local LevelUpdater = CreateFrame("Frame")
LevelUpdater:RegisterEvent("PLAYER_LEVEL_UP")
LevelUpdater:SetScript("OnEvent", CheckLevel)

----------------------------------------------------------------------------------------
--	Pet Battle Hider
----------------------------------------------------------------------------------------
T_PetBattleFrameHider = CreateFrame("Frame", "ViksUI_PetBattleFrameHider", UIParent, "SecureHandlerStateTemplate")
T_PetBattleFrameHider:SetAllPoints()
T_PetBattleFrameHider:SetFrameStrata("LOW")
RegisterStateDriver(T_PetBattleFrameHider, "visibility", "[petbattle] hide; show")

----------------------------------------------------------------------------------------
--	UTF functions
----------------------------------------------------------------------------------------
T.UTF = function(string, i, dots)
	if not string then return end
	local bytes = string:len()
	if bytes <= i then
		return string
	else
		local len, pos = 0, 1
		while (pos <= bytes) do
			len = len + 1
			local c = string:byte(pos)
			if c > 0 and c <= 127 then
				pos = pos + 1
			elseif c >= 192 and c <= 223 then
				pos = pos + 2
			elseif c >= 224 and c <= 239 then
				pos = pos + 3
			elseif c >= 240 and c <= 247 then
				pos = pos + 4
			end
			if len == i then break end
		end
		if len == i and pos <= bytes then
			return string:sub(1, pos - 1)..(dots and "..." or "")
		else
			return string
		end
	end
end

----------------------------------------------------------------------------------------
--	Style functions
----------------------------------------------------------------------------------------
T.SkinFuncs = {}
T.SkinFuncs["ViksUI"] = {}

function T.SkinScrollBar(frame)
	local frameName = frame.GetName and frame:GetName()
	if frameName then
		if _G[frameName.."BG"] then
			_G[frameName.."BG"]:SetTexture(nil)
		end
		if _G[frameName.."Track"] then
			_G[frameName.."Track"]:SetTexture(nil)
		end
		if _G[frameName.."Top"] then
			_G[frameName.."Top"]:SetTexture(nil)
		end
		if _G[frameName.."Bottom"] then
			_G[frameName.."Bottom"]:SetTexture(nil)
		end
		if _G[frameName.."Middle"] then
			_G[frameName.."Middle"]:SetTexture(nil)
		end
	end

	if frame.Background then frame.Background:SetTexture(nil) end
	if frame.trackBG then frame.trackBG:SetTexture(nil) end
	if frame.Middle then frame.Middle:SetTexture(nil) end
	if frame.Top then frame.Top:SetTexture(nil) end
	if frame.Bottom then frame.Bottom:SetTexture(nil) end
	if frame.ScrollBarTop then frame.ScrollBarTop:SetTexture(nil) end
	if frame.ScrollBarBottom then frame.ScrollBarBottom:SetTexture(nil) end
	if frame.ScrollBarMiddle then frame.ScrollBarMiddle:SetTexture(nil) end

	local UpButton = frame.ScrollUpButton or frame.ScrollUp or frame.UpButton or _G[frameName and frameName.."ScrollUpButton"] or frame:GetParent().scrollUp
	local DownButton = frame.ScrollDownButton or frame.ScrollDown or frame.DownButton or _G[frameName and frameName.."ScrollDownButton"] or frame:GetParent().scrollDown
	local ThumbTexture = frame.ThumbTexture or frame.thumbTexture or _G[frameName and frameName.."ThumbTexture"]

	if UpButton and DownButton then
		if not UpButton.icon then
			T.SkinNextPrevButton(UpButton, nil, "Up")
			UpButton:SetSize(UpButton:GetWidth() + 7, UpButton:GetHeight() + 7)
		end

		if not DownButton.icon then
			T.SkinNextPrevButton(DownButton, nil, "Down")
			DownButton:SetSize(DownButton:GetWidth() + 7, DownButton:GetHeight() + 7)
		end

		if ThumbTexture then
			ThumbTexture:SetTexture(nil)
			if not frame.thumbbg then
				frame.thumbbg = CreateFrame("Frame", nil, frame)
				frame.thumbbg:SetPoint("TOPLEFT", ThumbTexture, "TOPLEFT", 0, -3)
				frame.thumbbg:SetPoint("BOTTOMRIGHT", ThumbTexture, "BOTTOMRIGHT", 0, 3)
				frame.thumbbg:SetTemplate("Overlay")

				frame:HookScript("OnShow", function()
					local _, maxValue = frame:GetMinMaxValues()
					if maxValue == 0 then
						frame:SetAlpha(0)
					else
						frame:SetAlpha(1)
					end
				end)

				frame:HookScript("OnMinMaxChanged", function()
					local _, maxValue = frame:GetMinMaxValues()
					if maxValue == 0 then
						frame:SetAlpha(0)
					else
						frame:SetAlpha(1)
					end
				end)

				frame:HookScript("OnDisable", function()
					frame:SetAlpha(0)
				end)

				frame:HookScript("OnEnable", function()
					frame:SetAlpha(1)
				end)
			end
		end
	end
end

local tabs = {
	"LeftDisabled",
	"MiddleDisabled",
	"RightDisabled",
	"Left",
	"Middle",
	"Right",
}

function T.SkinTab(tab, bg)
	if not tab then return end

	for _, object in pairs(tabs) do
		local tex = _G[tab:GetName()..object]
		if tex then
			tex:SetTexture(nil)
		end
	end

	if tab.GetHighlightTexture and tab:GetHighlightTexture() then
		tab:GetHighlightTexture():SetTexture(nil)
	else
		tab:StripTextures()
	end

	tab.backdrop = CreateFrame("Frame", nil, tab)
	tab.backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
	if bg then
		tab.backdrop:SetTemplate("Overlay")
		tab.backdrop:SetPoint("TOPLEFT", 3, -7)
		tab.backdrop:SetPoint("BOTTOMRIGHT", -3, 2)
	else
		tab.backdrop:SetTemplate("Transparent")
		tab.backdrop:SetPoint("TOPLEFT", 10, -3)
		tab.backdrop:SetPoint("BOTTOMRIGHT", -10, 3)
	end
end

function T.SkinNextPrevButton(btn, left, scroll)
	local normal, pushed, disabled
	local frameName = btn.GetName and btn:GetName()
	local isPrevButton = frameName and (string.find(frameName, "Left") or string.find(frameName, "Prev") or string.find(frameName, "Decrement") or string.find(frameName, "Back")) or left
	local isScrollUpButton = frameName and string.find(frameName, "ScrollUp") or scroll == "Up"
	local isScrollDownButton = frameName and string.find(frameName, "ScrollDown") or scroll == "Down"

	if btn:GetNormalTexture() then
		normal = btn:GetNormalTexture():GetTexture()
	end

	if btn:GetPushedTexture() then
		pushed = btn:GetPushedTexture():GetTexture()
	end

	if btn:GetDisabledTexture() then
		disabled = btn:GetDisabledTexture():GetTexture()
	end

	btn:StripTextures()

	if scroll == "Up" or scroll == "Down" or scroll == "Any" then
		normal = nil
		pushed = nil
		disabled = nil
	end

	if not normal then
		if isPrevButton then
			normal = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up"
		elseif isScrollUpButton then
			normal = "Interface\\ChatFrame\\UI-ChatIcon-ScrollUp-Up"
		elseif isScrollDownButton then
			normal = "Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up"
		else
			normal = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up"
		end
	end

	if not pushed then
		if isPrevButton then
			pushed = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down"
		elseif isScrollUpButton then
			pushed = "Interface\\ChatFrame\\UI-ChatIcon-ScrollUp-Down"
		elseif isScrollDownButton then
			pushed = "Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down"
		else
			pushed = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down"
		end
	end

	if not disabled then
		if isPrevButton then
			disabled = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled"
		elseif isScrollUpButton then
			disabled = "Interface\\ChatFrame\\UI-ChatIcon-ScrollUp-Disabled"
		elseif isScrollDownButton then
			disabled = "Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled"
		else
			disabled = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled"
		end
	end

	btn:SetNormalTexture(normal)
	btn:SetPushedTexture(pushed)
	btn:SetDisabledTexture(disabled)

	btn:SetTemplate("Overlay")
	btn:SetSize(btn:GetWidth() - 7, btn:GetHeight() - 7)

	if normal and pushed and disabled then
		btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.81, 0.65, 0.29, 0.65, 0.81)
		if btn:GetPushedTexture() then
			btn:GetPushedTexture():SetTexCoord(0.3, 0.35, 0.3, 0.81, 0.65, 0.35, 0.65, 0.81)
		end
		if btn:GetDisabledTexture() then
			btn:GetDisabledTexture():SetTexCoord(0.3, 0.29, 0.3, 0.75, 0.65, 0.29, 0.65, 0.75)
		end

		btn:GetNormalTexture():ClearAllPoints()
		btn:GetNormalTexture():SetPoint("TOPLEFT", 2, -2)
		btn:GetNormalTexture():SetPoint("BOTTOMRIGHT", -2, 2)
		if btn:GetDisabledTexture() then
			btn:GetDisabledTexture():SetAllPoints(btn:GetNormalTexture())
		end
		if btn:GetPushedTexture() then
			btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())
		end
		btn:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)
		btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
	end
end

function T.SkinRotateButton(btn)
	btn:SetTemplate("Default")
	btn:SetSize(btn:GetWidth() - 14, btn:GetHeight() - 14)

	btn:GetNormalTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)
	btn:GetPushedTexture():SetTexCoord(0.3, 0.29, 0.3, 0.65, 0.69, 0.29, 0.69, 0.65)

	btn:GetHighlightTexture():SetColorTexture(1, 1, 1, 0.3)

	btn:GetNormalTexture():ClearAllPoints()
	btn:GetNormalTexture():SetPoint("TOPLEFT", 2, -2)
	btn:GetNormalTexture():SetPoint("BOTTOMRIGHT", -2, 2)
	btn:GetPushedTexture():SetAllPoints(btn:GetNormalTexture())
	btn:GetHighlightTexture():SetAllPoints(btn:GetNormalTexture())
end

function T.SkinEditBox(frame, width, height)
	frame:DisableDrawLayer("BACKGROUND")

	frame:CreateBackdrop("Overlay")

	local frameName = frame.GetName and frame:GetName()
	if frameName and (frameName:find("Gold") or frameName:find("Silver") or frameName:find("Copper")) then
		if frameName:find("Gold") then
			frame.backdrop:SetPoint("TOPLEFT", -3, 1)
			frame.backdrop:SetPoint("BOTTOMRIGHT", -3, 0)
		else
			frame.backdrop:SetPoint("TOPLEFT", -3, 1)
			frame.backdrop:SetPoint("BOTTOMRIGHT", -13, 0)
		end
	end

	if width then frame:SetWidth(width) end
	if height then frame:SetHeight(height) end
end

function T.SkinDropDownBox(frame, width, pos)
	local frameName = frame.GetName and frame:GetName()
	local button = frame.Button or frameName and (_G[frameName.."Button"] or _G[frameName.."_Button"])
	local text = frameName and _G[frameName.."Text"] or frame.Text
	if not width then width = 155 end

	frame:StripTextures()
	frame:SetWidth(width)

	if text then
		text:ClearAllPoints()
		text:SetPoint("RIGHT", button, "LEFT", -2, 0)
		text:SetWidth(frame:GetWidth() / 1.5)
	end

	button:ClearAllPoints()
	if pos then
		button:SetPoint("TOPRIGHT", frame.Right, -20, -21)
	else
		button:SetPoint("RIGHT", frame, "RIGHT", -10, 3)
	end
	button.SetPoint = T.dummy
	T.SkinNextPrevButton(button, nil, "Down")

	frame:CreateBackdrop("Overlay")
	frame:SetFrameLevel(frame:GetFrameLevel() + 2)
	frame.backdrop:SetPoint("TOPLEFT", 20, -2)
	frame.backdrop:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)
end

function T.SkinCheckBox(frame, size)
	if size then
		frame:SetSize(size, size)
	end
	frame:SetNormalTexture("")
	frame:SetPushedTexture("")
	frame:CreateBackdrop("Overlay")
	frame:SetFrameLevel(frame:GetFrameLevel() + 2)
	frame.backdrop:SetPoint("TOPLEFT", 4, -4)
	frame.backdrop:SetPoint("BOTTOMRIGHT", -4, 4)

	if frame.SetHighlightTexture then
		local highligh = frame:CreateTexture()
		highligh:SetColorTexture(1, 1, 1, 0.3)
		highligh:SetPoint("TOPLEFT", frame, 6, -6)
		highligh:SetPoint("BOTTOMRIGHT", frame, -6, 6)
		frame:SetHighlightTexture(highligh)
	end

	if frame.SetCheckedTexture then
		local checked = frame:CreateTexture()
		checked:SetColorTexture(1, 0.82, 0, 0.8)
		checked:SetPoint("TOPLEFT", frame, 6, -6)
		checked:SetPoint("BOTTOMRIGHT", frame, -6, 6)
		frame:SetCheckedTexture(checked)
	end

	if frame.SetDisabledCheckedTexture then
		local disabled = frame:CreateTexture()
		disabled:SetColorTexture(0.6, 0.6, 0.6, 0.75)
		disabled:SetPoint("TOPLEFT", frame, 6, -6)
		disabled:SetPoint("BOTTOMRIGHT", frame, -6, 6)
		frame:SetDisabledCheckedTexture(disabled)
	end
end

function T.SkinCloseButton(f, point, text, pixel)
	f:StripTextures()
	f:SetTemplate("Overlay")
	f:SetSize(18, 18)

	if not text then text = "x" end
	if not f.text then
		if pixel then
			f.text = f:FontString(nil, C.media.pixel_font, 8)
			f.text:SetPoint("CENTER", 0, 0)
		else
			f.text = f:FontString(nil, C.media.normal_font, 17)
			f.text:SetPoint("CENTER", 0, 1)
		end
		f.text:SetText(text)
	end

	if point then
		f:SetPoint("TOPRIGHT", point, "TOPRIGHT", -4, -4)
	else
		f:SetPoint("TOPRIGHT", -4, -4)
	end

	f:HookScript("OnEnter", T.SetModifiedBackdrop)
	f:HookScript("OnLeave", T.SetOriginalBackdrop)
end

function T.SkinSlider(f)
	f:SetBackdrop(nil)

	local bd = CreateFrame("Frame", nil, f)
	bd:SetTemplate("Overlay")
	if f:GetOrientation() == "VERTICAL" then
		bd:SetPoint("TOPLEFT", -2, -6)
		bd:SetPoint("BOTTOMRIGHT", 2, 6)
	else
		bd:SetPoint("TOPLEFT", 14, -2)
		bd:SetPoint("BOTTOMRIGHT", -15, 3)
	end
	bd:SetFrameLevel(f:GetFrameLevel() - 1)

	f:SetThumbTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
	f:GetThumbTexture():SetBlendMode("ADD")
end

function T.SkinIconSelectionFrame(frame, numIcons, buttonNameTemplate, frameNameOverride)
	local frameName = frameNameOverride or frame:GetName()
	local scrollFrame = _G[frameName.."ScrollFrame"]
	local editBox = _G[frameName.."EditBox"]
	local okayButton = _G[frameName.."OkayButton"] or _G[frameName.."Okay"] or frame.BorderBox.OkayButton
	local cancelButton = _G[frameName.."CancelButton"] or _G[frameName.."Cancel"] or frame.BorderBox.CancelButton

	frame:StripTextures()
	frame.BorderBox:StripTextures()
	frame:CreateBackdrop("Transparent")
	frame.backdrop:SetPoint("TOPLEFT", 3, 1)
	frame:SetHeight(frame:GetHeight() + 13)

	scrollFrame:StripTextures()
	scrollFrame:CreateBackdrop("Overlay")
	scrollFrame.backdrop:SetPoint("TOPLEFT", 15, 5)
	scrollFrame.backdrop:SetPoint("BOTTOMRIGHT", 31, -8)
	scrollFrame:SetHeight(scrollFrame:GetHeight() + 12)

	okayButton:SkinButton()
	cancelButton:SkinButton()
	cancelButton:ClearAllPoints()
	cancelButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -5, 5)

	editBox:DisableDrawLayer("BACKGROUND")
	T.SkinEditBox(editBox)

	if buttonNameTemplate then
		for i = 1, numIcons do
			local button = _G[buttonNameTemplate..i]
			local icon = _G[button:GetName().."Icon"]

			button:StripTextures()
			button:StyleButton(true)
			button:SetTemplate("Default")

			icon:ClearAllPoints()
			icon:SetPoint("TOPLEFT", 2, -2)
			icon:SetPoint("BOTTOMRIGHT", -2, 2)
			icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		end
	end
end

function T.SkinMaxMinFrame(frame, point)
	frame:SetSize(18, 18)

	if point then
		frame:SetPoint("RIGHT", point, "LEFT", -2, 0)
	end

	for name, direction in pairs({ ["MaximizeButton"] = "up", ["MinimizeButton"] = "down"}) do
		local button = frame[name]
		if button then
			button:StripTextures()
			button:SetTemplate("Overlay")
			button:SetPoint("CENTER")
			button:SetHitRectInsets(1, 1, 1, 1)

			button.minus = button:CreateTexture(nil, "OVERLAY")
			button.minus:SetSize(7, 1)
			button.minus:SetPoint("CENTER")
			button.minus:SetTexture(C.media.blank)

			if direction == "up" then
				button.plus = button:CreateTexture(nil, "OVERLAY")
				button.plus:SetSize(1, 7)
				button.plus:SetPoint("CENTER")
				button.plus:SetTexture(C.media.blank)
			end

			button:HookScript("OnEnter", T.SetModifiedBackdrop)
			button:HookScript("OnLeave", T.SetOriginalBackdrop)
		end
	end
end

function T.SkinExpandOrCollapse(f)
	f:SetHighlightTexture("")
	f:SetPushedTexture("")

	local bg = CreateFrame("Frame", nil, f)
	bg:SetSize(13, 13)
	bg:SetPoint("TOPLEFT", f:GetNormalTexture(), 0, -1)
	bg:SetTemplate("Overlay")
	f.bg = bg

	bg.minus = bg:CreateTexture(nil, "OVERLAY")
	bg.minus:SetSize(5, 1)
	bg.minus:SetPoint("CENTER")
	bg.minus:SetTexture(C.media.blank)

	bg.plus = bg:CreateTexture(nil, "OVERLAY")
	bg.plus:SetSize(1, 5)
	bg.plus:SetPoint("CENTER")
	bg.plus:SetTexture(C.media.blank)
	bg.plus:Hide()

	hooksecurefunc(f, "SetNormalTexture", function(self, texture)
		if self.settingTexture then return end
		self.settingTexture = true
		self:SetNormalTexture("")

		if texture and texture ~= "" then
			if texture:find("Plus") then
				self.bg.plus:Show()
			elseif texture:find("Minus") then
				self.bg.plus:Hide()
			end
			self.bg:Show()
		else
			self.bg:Hide()
		end
		self.settingTexture = nil
	end)

	f:HookScript("OnEnter", function(self)
		self.bg:SetBackdropBorderColor(T.color.r, T.color.g, T.color.b)
		if self.bg.overlay then
			self.bg.overlay:SetVertexColor(T.color.r * 0.3, T.color.g * 0.3, T.color.b * 0.3, 1)
		end
	end)

	f:HookScript("OnLeave", function(self)
		self.bg:SetBackdropBorderColor(unpack(C.media.border_color))
		if self.bg.overlay then
			self.bg.overlay:SetVertexColor(0.1, 0.1, 0.1, 1)
		end
	end)
end

function T.SkinHelpBox(frame)
	frame:StripTextures()
	frame:SetTemplate("Transparent")
	if frame.CloseButton then
		T.SkinCloseButton(frame.CloseButton)
	end
	if frame.Arrow then
		frame.Arrow:Hide()
	end
end

local LoadBlizzardSkin = CreateFrame("Frame")
LoadBlizzardSkin:RegisterEvent("ADDON_LOADED")
LoadBlizzardSkin:SetScript("OnEvent", function(self, _, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") or not C.skins.blizzard_frames then
		self:UnregisterEvent("ADDON_LOADED")
		return
	end

	for _addon, skinfunc in pairs(T.SkinFuncs) do
		if type(skinfunc) == "function" then
			if _addon == addon then
				if skinfunc then
					skinfunc()
				end
			end
		elseif type(skinfunc) == "table" then
			if _addon == addon then
				for _, skinfunc in pairs(T.SkinFuncs[_addon]) do
					if skinfunc then
						skinfunc()
					end
				end
			end
		end
	end
end)

----------------------------------------------------------------------------------------
--	Unit frames functions
----------------------------------------------------------------------------------------
if C.unitframe.enable ~= true then return end
local _, ns = ...
local oUF = ns.oUF

T.UpdateAllElements = function(frame)
	for _, v in ipairs(frame.__elements) do
		v(frame, "UpdateElement", frame.unit)
	end
end

local SetUpAnimGroup = function(self)
	self.anim = self:CreateAnimationGroup()
	self.anim:SetLooping("BOUNCE")
	self.anim.fade = self.anim:CreateAnimation("Alpha")
	self.anim.fade:SetFromAlpha(1)
	self.anim.fade:SetToAlpha(0)
	self.anim.fade:SetDuration(0.6)
	self.anim.fade:SetSmoothing("IN_OUT")
end

local Flash = function(self)
	if not self.anim then
		SetUpAnimGroup(self)
	end

	if not self.anim:IsPlaying() then
		self.anim:Play()
	end
end

local StopFlash = function(self)
	if self.anim then
		self.anim:Finish()
	end
end

T.SetFontString = function(parent, fontName, fontHeight, fontStyle)
	local fs = parent:CreateFontString(nil, "ARTWORK")
	fs:SetFont(fontName, fontHeight, fontStyle)
	fs:SetShadowOffset(C.font.unit_frames_font_shadow and 1 or 0, C.font.unit_frames_font_shadow and -1 or 0)
	return fs
end

T.PostUpdateHealth = function(health, unit, min, max)
	if unit and unit:find("arena%dtarget") then return end
	if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
		health:SetValue(0)
		if not UnitIsConnected(unit) then
			health.value:SetText("|cffD7BEA5"..L_UF_OFFLINE.."|r")
		elseif UnitIsDead(unit) then
			health.value:SetText("|cffD7BEA5"..L_UF_DEAD.."|r")
		elseif UnitIsGhost(unit) then
			health.value:SetText("|cffD7BEA5"..L_UF_GHOST.."|r")
		end
	else
		local r, g, b
		if (C.unitframe.own_color ~= true and C.unitframe.enemy_health_color and unit == "target" and UnitIsEnemy(unit, "player") and UnitIsPlayer(unit)) or (C.unitframe.own_color ~= true and unit == "target" and not UnitIsPlayer(unit) and UnitIsFriend(unit, "player")) then
			local c = T.Colors.reaction[UnitReaction(unit, "player")]
			if c then
				r, g, b = c[1], c[2], c[3]
				health:SetStatusBarColor(r, g, b)
			else
				r, g, b = 0.3, 0.7, 0.3
				health:SetStatusBarColor(r, g, b)
			end
		end
		if unit == "pet" or unit == "vehicle" then
			local _, class = UnitClass("player")
			local r, g, b = unpack(T.Colors.class[class])
			if C.unitframe.own_color == true then
				health:SetStatusBarColor(unpack(C.unitframe.uf_color))
				health.bg:SetVertexColor(0.1, 0.1, 0.1)
			else
				if b then
					health:SetStatusBarColor(r, g, b)
					if health.bg and health.bg.multiplier then
						local mu = health.bg.multiplier
						health.bg:SetVertexColor(r * mu, g * mu, b * mu)
					end
				end
			end
		end
		if C.unitframe.bar_color_value == true and not UnitIsTapDenied(unit) then
			if C.unitframe.own_color == true then
				r, g, b = C.unitframe.uf_color[1], C.unitframe.uf_color[2], C.unitframe.uf_color[3]
			else
				r, g, b = health:GetStatusBarColor()
			end
			local newr, newg, newb = oUF:ColorGradient(min, max, 1, 0, 0, 1, 1, 0, r, g, b)

			health:SetStatusBarColor(newr, newg, newb)
			if health.bg and health.bg.multiplier then
				local mu = health.bg.multiplier
				health.bg:SetVertexColor(newr * mu, newg * mu, newb * mu)
			end
		end
		if min ~= max then
			r, g, b = oUF:ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
			if unit == "player" and health:GetAttribute("normalUnit") ~= "pet" then
				if C.unitframe.show_total_value == true then
					if C.unitframe.color_value == true then
						health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5-|r |cff559655%s|r", T.ShortValue(min), T.ShortValue(max))
					else
						health.value:SetFormattedText("|cffffffff%s - %s|r", T.ShortValue(min), T.ShortValue(max))
					end
				else
					if C.unitframe.color_value == true then
						health.value:SetFormattedText("|cffAF5050%d|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", min, r * 255, g * 255, b * 255, floor(min / max * 100))
					else
						health.value:SetFormattedText("|cffffffff%d - %d%%|r", min, floor(min / max * 100))
					end
				end
			elseif unit == "target" then
				if C.unitframe.show_total_value == true then
					if C.unitframe.color_value == true then
						health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5-|r |cff559655%s|r", T.ShortValue(min), T.ShortValue(max))
					else
						health.value:SetFormattedText("|cffffffff%s - %s|r", T.ShortValue(min), T.ShortValue(max))
					end
				else
					if C.unitframe.color_value == true then
						health.value:SetFormattedText("|cff%02x%02x%02x%d%%|r |cffD7BEA5-|r |cffAF5050%s|r", r * 255, g * 255, b * 255, floor(min / max * 100), T.ShortValue(min))
					else
						health.value:SetFormattedText("|cffffffff%d%% - %s|r", floor(min / max * 100), T.ShortValue(min))
					end
				end
			elseif unit and unit:find("boss%d") then
				if C.unitframe.color_value == true then
					health.value:SetFormattedText("|cff%02x%02x%02x%d%%|r |cffD7BEA5-|r |cffAF5050%s|r", r * 255, g * 255, b * 255, floor(min / max * 100), T.ShortValue(min))
				else
					health.value:SetFormattedText("|cffffffff%d%% - %s|r", floor(min / max * 100), T.ShortValue(min))
				end
			else
				if C.unitframe.color_value == true then
					health.value:SetFormattedText("|cff%02x%02x%02x%d%%|r", r * 255, g * 255, b * 255, floor(min / max * 100))
				else
					health.value:SetFormattedText("|cffffffff%d%%|r", floor(min / max * 100))
				end
			end
		else
			if unit == "player" and unit ~= "pet" then
				if C.unitframe.color_value == true then
					health.value:SetText("|cff559655"..max.."|r")
				else
					health.value:SetText("|cffffffff"..max.."|r")
				end
			else
				if C.unitframe.color_value == true then
					health.value:SetText("|cff559655"..T.ShortValue(max).."|r")
				else
					health.value:SetText("|cffffffff"..T.ShortValue(max).."|r")
				end
			end
		end
	end
end

T.PostUpdateRaidHealth = function(health, unit, min, max)
	local self = health:GetParent()
	local power = self.Power
	local border = self.backdrop
	if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
		health:SetValue(0)
		if not UnitIsConnected(unit) then
			health.value:SetText("|cffD7BEA5"..L_UF_OFFLINE.."|r")
		elseif UnitIsDead(unit) then
			health.value:SetText("|cffD7BEA5"..L_UF_DEAD.."|r")
		elseif UnitIsGhost(unit) then
			health.value:SetText("|cffD7BEA5"..L_UF_GHOST.."|r")
		end
	else
		local r, g, b
		if not UnitIsPlayer(unit) and UnitIsFriend(unit, "player") and C.unitframe.own_color ~= true then
			local c = T.Colors.reaction[5]
			local r, g, b = c[1], c[2], c[3]
			health:SetStatusBarColor(r, g, b)
			if health.bg and health.bg.multiplier then
				local mu = health.bg.multiplier
				health.bg:SetVertexColor(r * mu, g * mu, b * mu)
			end
		end
		if C.unitframe.bar_color_value == true and not UnitIsTapDenied(unit) then
			if C.unitframe.own_color == true then
				r, g, b = C.unitframe.uf_color[1], C.unitframe.uf_color[2], C.unitframe.uf_color[3]
			else
				r, g, b = health:GetStatusBarColor()
			end
			local newr, newg, newb = oUF:ColorGradient(min, max, 1, 0, 0, 1, 1, 0, r, g, b)

			health:SetStatusBarColor(newr, newg, newb)
			if health.bg and health.bg.multiplier then
				local mu = health.bg.multiplier
				health.bg:SetVertexColor(newr * mu, newg * mu, newb * mu)
			end
		end
		if min ~= max then
			r, g, b = oUF:ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
			if self:GetParent():GetName():match("oUF_PartyDPS") then
				if C.unitframe.color_value == true then
					health.value:SetFormattedText("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", T.ShortValue(min), r * 255, g * 255, b * 255, floor(min / max * 100))
				else
					health.value:SetFormattedText("|cffffffff%s - %d%%|r", T.ShortValue(min), floor(min / max * 100))
				end
			else
				if C.unitframe.color_value == true then
					if C.unitframe.deficit_health == true then
						health.value:SetText("|cffffffff".."-"..T.ShortValue(max - min))
					else
						health.value:SetFormattedText("|cff%02x%02x%02x%d%%|r", r * 255, g * 255, b * 255, floor(min / max * 100))
					end
				else
					if C.unitframe.deficit_health == true then
						health.value:SetText("|cffffffff".."-"..T.ShortValue(max - min))
					else
						health.value:SetFormattedText("|cffffffff%d%%|r", floor(min / max * 100))
					end
				end
			end
		else
			if C.unitframe.color_value == true then
				health.value:SetText("|cff559655"..T.ShortValue(max).."|r")
			else
				health.value:SetText("|cffffffff"..T.ShortValue(max).."|r")
			end
		end
		if C.unitframe.alpha_health == true then
			if min / max > 0.95 then
				health:SetAlpha(0.6)
				power:SetAlpha(0.6)
				border:SetAlpha(0.6)
			else
				health:SetAlpha(1)
				power:SetAlpha(1)
				border:SetAlpha(1)
			end
		end
	end
end

T.PreUpdatePower = function(power, unit)
	local _, pToken = UnitPowerType(unit)

	local color = T.Colors.power[pToken]
	if color then
		power:SetStatusBarColor(color[1], color[2], color[3])
	end
end

T.PostUpdatePower = function(power, unit, cur, _, max)
	if unit and unit:find("arena%dtarget") then return end
	local self = power:GetParent()
	local pType, pToken = UnitPowerType(unit)
	local color = T.Colors.power[pToken]

	if color then
		power.value:SetTextColor(color[1], color[2], color[3])
	end

	if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
		power:SetValue(0)
	end

	if unit == "focus" or unit == "focustarget" or unit == "targettarget" or (self:GetParent():GetName():match("oUF_RaidDPS")) then return end

	if not UnitIsConnected(unit) then
		power.value:SetText()
	elseif UnitIsDead(unit) or UnitIsGhost(unit) or max == 0 then
		power.value:SetText()
	else
		if cur ~= max then
			if pType == 0 and pToken ~= "POWER_TYPE_DINO_SONIC" then
				if unit == "target" then
					if C.unitframe.show_total_value == true then
						if C.unitframe.color_value == true then
							power.value:SetFormattedText("%s |cffD7BEA5-|r %s", T.ShortValue(max - (max - cur)), T.ShortValue(max))
						else
							power.value:SetFormattedText("|cffffffff%s - %s|r", T.ShortValue(max - (max - cur)), T.ShortValue(max))
						end
					else
						if C.unitframe.color_value == true then
							power.value:SetFormattedText("%d%% |cffD7BEA5-|r %s", floor(cur / max * 100), T.ShortValue(max - (max - cur)))
						else
							power.value:SetFormattedText("|cffffffff%d%% - %s|r", floor(cur / max * 100), T.ShortValue(max - (max - cur)))
						end
					end
				elseif (unit == "player" and power:GetAttribute("normalUnit") == "pet") or unit == "pet" then
					if C.unitframe.show_total_value == true then
						if C.unitframe.color_value == true then
							power.value:SetFormattedText("%s |cffD7BEA5-|r %s", T.ShortValue(max - (max - cur)), T.ShortValue(max))
						else
							power.value:SetFormattedText("%s |cffffffff-|r %s", T.ShortValue(max - (max - cur)), T.ShortValue(max))
						end
					else
						if C.unitframe.color_value == true then
							power.value:SetFormattedText("%d%%", floor(cur / max * 100))
						else
							power.value:SetFormattedText("|cffffffff%d%%|r", floor(cur / max * 100))
						end
					end
				elseif unit and (unit:find("arena%d") or unit:find("boss%d")) then
					if C.unitframe.color_value == true then
						power.value:SetFormattedText("|cffD7BEA5%d%% - %s|r", floor(cur / max * 100), T.ShortValue(max - (max - cur)))
					else
						power.value:SetFormattedText("|cffffffff%d%% - %s|r", floor(cur / max * 100), T.ShortValue(max - (max - cur)))
					end
				elseif self:GetParent():GetName():match("oUF_PartyDPS") then
					if C.unitframe.color_value == true then
						power.value:SetFormattedText("%s |cffD7BEA5-|r %d%%", T.ShortValue(max - (max - cur)), floor(cur / max * 100))
					else
						power.value:SetFormattedText("|cffffffff%s - %d%%|r", T.ShortValue(max - (max - cur)), floor(cur / max * 100))
					end
				else
					if C.unitframe.show_total_value == true then
						if C.unitframe.color_value == true then
							power.value:SetFormattedText("%s |cffD7BEA5-|r %s", T.ShortValue(max - (max - cur)), T.ShortValue(max))
						else
							power.value:SetFormattedText("|cffffffff%s - %s|r", T.ShortValue(max - (max - cur)), T.ShortValue(max))
						end
					else
						if C.unitframe.color_value == true then
							power.value:SetFormattedText("%d |cffD7BEA5-|r %d%%", max - (max - cur), floor(cur / max * 100))
						else
							power.value:SetFormattedText("|cffffffff%d - %d%%|r", max - (max - cur), floor(cur / max * 100))
						end
					end
				end
			else
				if C.unitframe.color_value == true then
					power.value:SetText(max - (max - cur))
				else
					power.value:SetText("|cffffffff"..max - (max - cur).."|r")
				end
			end
		else
			if unit == "pet" or unit == "target" or (unit and unit:find("arena%d")) or (self:GetParent():GetName():match("oUF_PartyDPS")) then
				if C.unitframe.color_value == true then
					power.value:SetText(T.ShortValue(cur))
				else
					power.value:SetText("|cffffffff"..T.ShortValue(cur).."|r")
				end
			else
				if C.unitframe.color_value == true then
					power.value:SetText(cur)
				else
					power.value:SetText("|cffffffff"..cur.."|r")
				end
			end
		end
	end
end

T.UpdateManaLevel = function(self, elapsed)
	self.elapsed = (self.elapsed or 0) + elapsed
	if self.elapsed < 0.2 then return end
	self.elapsed = 0

	if UnitPowerType("player") == 0 then
		local percMana = UnitPower("player", Enum.PowerType.Mana) / UnitPowerMax("player", Enum.PowerType.Mana) * 100
		if percMana <= 20 and not UnitIsDeadOrGhost("player") then
			self.ManaLevel:SetText("|cffaf5050"..MANA_LOW.."|r")
			Flash(self)
		else
			self.ManaLevel:SetText()
			StopFlash(self)
		end
	elseif T.class ~= "DRUID" and T.class ~= "PRIEST" and T.class ~= "SHAMAN" then
		self.ManaLevel:SetText()
		StopFlash(self)
	end
end

T.UpdateClassMana = function(self)
	if self.unit ~= "player" then return end

	if UnitPowerType("player") ~= 0 then
		local min = UnitPower("player", 0)
		local max = UnitPowerMax("player", 0)

		local percMana = min / max * 100
		if percMana <= 20 and not UnitIsDeadOrGhost("player") then
			self.FlashInfo.ManaLevel:SetText("|cffaf5050"..MANA_LOW.."|r")
			Flash(self.FlashInfo)
		else
			self.FlashInfo.ManaLevel:SetText()
			StopFlash(self.FlashInfo)
		end

		if min ~= max then
			if self.Power.value:GetText() then
				self.ClassMana:SetPoint("RIGHT", self.Power.value, "LEFT", -1, 0)
				self.ClassMana:SetFormattedText("%d%%|r |cffD7BEA5-|r", floor(min / max * 100))
				self.ClassMana:SetJustifyH("RIGHT")
			else
				self.ClassMana:SetPoint("LEFT", self.Power, "LEFT", 4, 0)
				self.ClassMana:SetFormattedText("%d%%", floor(min / max * 100))
			end
		else
			self.ClassMana:SetText()
		end

		self.ClassMana:SetAlpha(1)
	else
		self.ClassMana:SetAlpha(0)
	end
end

T.UpdatePvPStatus = function(self, elapsed)
	if self.elapsed and self.elapsed > 0.2 then
		local unit = self.unit
		local time = GetPVPTimer()

		local min = format("%01.f", floor((time / 1000) / 60))
		local sec = format("%02.f", floor((time / 1000) - min * 60))
		if self.Status then
			local factionGroup = UnitFactionGroup(unit)
			if UnitIsPVPFreeForAll(unit) then
				if time ~= 301000 and time ~= -1 then
					self.Status:SetText(PVP.." ".."["..min..":"..sec.."]")
				else
					self.Status:SetText(PVP)
				end
			elseif factionGroup and UnitIsPVP(unit) then
				if time ~= 301000 and time ~= -1 then
					self.Status:SetText(PVP.." ".."["..min..":"..sec.."]")
				else
					self.Status:SetText(PVP)
				end
			else
				self.Status:SetText("")
			end
		end
		self.elapsed = 0
	else
		self.elapsed = (self.elapsed or 0) + elapsed
	end
end

local ticks = {}

local setBarTicks = function(Castbar, numTicks)
	for _, v in pairs(ticks) do
		v:Hide()
	end
	if numTicks and numTicks > 0 then
		local delta = Castbar:GetWidth() / numTicks
		for i = 1, numTicks do
			if not ticks[i] then
				ticks[i] = Castbar:CreateTexture(nil, "OVERLAY")
				ticks[i]:SetTexture(C.media.texture)
				ticks[i]:SetVertexColor(unpack(C.media.border_color))
				ticks[i]:SetWidth(1)
				ticks[i]:SetHeight(Castbar:GetHeight())
				ticks[i]:SetDrawLayer("OVERLAY", 7)
			end
			ticks[i]:ClearAllPoints()
			ticks[i]:SetPoint("CENTER", Castbar, "RIGHT", -delta * i, 0)
			ticks[i]:Show()
		end
	end
end

T.PostCastStart = function(Castbar, unit)
	Castbar.channeling = false
	if unit == "vehicle" then unit = "player" end

	if unit == "player" and C.unitframe.castbar_latency == true and Castbar.Latency then
		local _, _, _, ms = GetNetStats()
		Castbar.Latency:SetText(("%dms"):format(ms))
		Castbar.SafeZone:SetDrawLayer("BORDER")
		Castbar.SafeZone:SetVertexColor(0.85, 0.27, 0.27)
	end

	if unit == "player" and C.unitframe.castbar_ticks == true then
		setBarTicks(Castbar, 0)
	end

	local r, g, b, color
	if UnitIsPlayer(unit) then
		local _, class = UnitClass(unit)
		color = T.Colors.class[class]
	else
		local reaction = T.Colors.reaction[UnitReaction(unit, "player")]
		if reaction then
			r, g, b = reaction[1], reaction[2], reaction[3]
		else
			r, g, b = 1, 1, 1
		end
	end

	if color then
		r, g, b = color[1], color[2], color[3]
	end

	if Castbar.notInterruptible and UnitCanAttack("player", unit) then
		Castbar:SetStatusBarColor(0.8, 0, 0)
		Castbar.bg:SetVertexColor(0.8, 0, 0, 0.2)
		Castbar.Overlay:SetBackdropBorderColor(0.8, 0, 0)
		if C.unitframe.castbar_icon == true and (unit == "target" or unit == "focus") then
			Castbar.Button:SetBackdropBorderColor(0.8, 0, 0)
		end
	else
		if unit == "pet" or unit == "vehicle" then
			local _, class = UnitClass("player")
			local r, g, b = unpack(T.Colors.class[class])
			if C.unitframe.own_color == true then
				Castbar:SetStatusBarColor(unpack(C.unitframe.uf_color))
				Castbar.bg:SetVertexColor(C.unitframe.uf_color[1], C.unitframe.uf_color[2], C.unitframe.uf_color[3], 0.2)
			else
				if b then
					Castbar:SetStatusBarColor(r, g, b)
					Castbar.bg:SetVertexColor(r, g, b, 0.2)
				end
			end
		else
			if C.unitframe.own_color == true then
				Castbar:SetStatusBarColor(unpack(C.unitframe.uf_color))
				Castbar.bg:SetVertexColor(C.unitframe.uf_color[1], C.unitframe.uf_color[2], C.unitframe.uf_color[3], 0.2)
			else
				Castbar:SetStatusBarColor(r, g, b)
				Castbar.bg:SetVertexColor(r, g, b, 0.2)
			end
		end
		Castbar.Overlay:SetBackdropBorderColor(unpack(C.media.border_color))
		if C.unitframe.castbar_icon == true and (unit == "target" or unit == "focus") then
			Castbar.Button:SetBackdropBorderColor(unpack(C.media.border_color))
		end
	end

	if Castbar.Time and Castbar.Text then
		local timeWidth = Castbar.Time:GetStringWidth()
		local textWidth = Castbar:GetWidth() - timeWidth - 5

		if timeWidth == 0 then
			C_Timer.After(0.05, function()
				textWidth = Castbar:GetWidth() - Castbar.Time:GetStringWidth() - 5
				if textWidth > 0 then
					Castbar.Text:SetWidth(textWidth)
				end
			end)
		else
			Castbar.Text:SetWidth(textWidth)
		end
	end
end

T.PostChannelStart = function(Castbar, unit)
	Castbar.channeling = true
	if unit == "vehicle" then unit = "player" end

	if unit == "player" and C.unitframe.castbar_latency == true and Castbar.Latency then
		local _, _, _, ms = GetNetStats()
		Castbar.Latency:SetText(("%dms"):format(ms))
		Castbar.SafeZone:SetDrawLayer("ARTWORK")
		Castbar.SafeZone:SetVertexColor(0.85, 0.27, 0.27, 0.75)
	end

	if unit == "player" and C.unitframe.castbar_ticks == true then
		local spell = UnitChannelInfo(unit)
		Castbar.channelingTicks = T.CastBarTicks[spell] or 0
		setBarTicks(Castbar, Castbar.channelingTicks)
	end

	local r, g, b, color
	if UnitIsPlayer(unit) then
		local _, class = UnitClass(unit)
		color = T.Colors.class[class]
	else
		local reaction = T.Colors.reaction[UnitReaction(unit, "player")]
		if reaction then
			r, g, b = reaction[1], reaction[2], reaction[3]
		else
			r, g, b = 1, 1, 1
		end
	end

	if color then
		r, g, b = color[1], color[2], color[3]
	end

	if Castbar.notInterruptible and UnitCanAttack("player", unit) then
		Castbar:SetStatusBarColor(0.8, 0, 0)
		Castbar.bg:SetVertexColor(0.8, 0, 0, 0.2)
		Castbar.Overlay:SetBackdropBorderColor(0.8, 0, 0)
		if C.unitframe.castbar_icon == true and (unit == "target" or unit == "focus") then
			Castbar.Button:SetBackdropBorderColor(0.8, 0, 0)
		end
	else
		if unit == "pet" or unit == "vehicle" then
			local _, class = UnitClass("player")
			local r, g, b = unpack(T.Colors.class[class])
			if C.unitframe.own_color == true then
				Castbar:SetStatusBarColor(unpack(C.unitframe.uf_color))
				Castbar.bg:SetVertexColor(C.unitframe.uf_color[1], C.unitframe.uf_color[2], C.unitframe.uf_color[3], 0.2)
			else
				if b then
					Castbar:SetStatusBarColor(r, g, b)
					Castbar.bg:SetVertexColor(r, g, b, 0.2)
				end
			end
		else
			if C.unitframe.own_color == true then
				Castbar:SetStatusBarColor(unpack(C.unitframe.uf_color))
				Castbar.bg:SetVertexColor(C.unitframe.uf_color[1], C.unitframe.uf_color[2], C.unitframe.uf_color[3], 0.2)
			else
				Castbar:SetStatusBarColor(r, g, b)
				Castbar.bg:SetVertexColor(r, g, b, 0.2)
			end
		end
		Castbar.Overlay:SetBackdropBorderColor(unpack(C.media.border_color))
		if C.unitframe.castbar_icon == true and (unit == "target" or unit == "focus") then
			Castbar.Button:SetBackdropBorderColor(unpack(C.media.border_color))
		end
	end

	if Castbar.Time and Castbar.Text then
		local timeWidth = Castbar.Time:GetStringWidth()
		local textWidth = Castbar:GetWidth() - timeWidth - 5

		if timeWidth == 0 then
			C_Timer.After(0.05, function()
				textWidth = Castbar:GetWidth() - Castbar.Time:GetStringWidth() - 5
				if textWidth > 0 then
					Castbar.Text:SetWidth(textWidth)
				end
			end)
		else
			Castbar.Text:SetWidth(textWidth)
		end
	end
end

T.CustomCastTimeText = function(self, duration)
	self.Time:SetText(("%.1f / %.1f"):format(self.channeling and duration or self.max - duration, self.max))
end

T.CustomCastDelayText = function(self, duration)
	self.Time:SetText(("%.1f |cffaf5050%s %.1f|r"):format(self.channeling and duration or self.max - duration, self.channeling and "-" or "+", abs(self.delay)))
end

local FormatTime = function(s)
	local day, hour, minute = 86400, 3600, 60
	if s >= day then
		return format("%dd", floor(s / day + 0.5)), s % day
	elseif s >= hour then
		return format("%dh", floor(s / hour + 0.5)), s % hour
	elseif s >= minute then
		return format("%dm", floor(s / minute + 0.5)), s % minute
	elseif s >= minute / 12 then
		return floor(s + 0.5), (s * 100 - floor(s * 100)) / 100
	end
	return format("%.1f", s), (s * 100 - floor(s * 100)) / 100
end

local CreateAuraTimer = function(self, elapsed)
	if self.timeLeft then
		self.elapsed = (self.elapsed or 0) + elapsed
		if self.elapsed >= 0.1 then
			if not self.first then
				self.timeLeft = self.timeLeft - self.elapsed
			else
				self.timeLeft = self.timeLeft - GetTime()
				self.first = false
			end
			if self.timeLeft > 0 then
				local time = FormatTime(self.timeLeft)
				self.remaining:SetText(time)
				self.remaining:SetTextColor(1, 1, 1)
			else
				self.remaining:Hide()
				self:SetScript("OnUpdate", nil)
			end
			self.elapsed = 0
		end
	end
end

T.AuraTrackerTime = function(self, elapsed)
	if self.active then
		self.timeleft = self.timeleft - elapsed
		if self.timeleft <= 5 then
			self.text:SetTextColor(1, 0, 0)
		else
			self.text:SetTextColor(1, 1, 1)
		end
		if self.timeleft <= 0 then
			self.icon:SetTexture("")
			self.text:SetText("")
		end
		self.text:SetFormattedText("%.1f", self.timeleft)
	end
end

T.HideAuraFrame = function(self)
	if self.unit == "player" then
		if not C.aura.player_auras then
			BuffFrame:UnregisterEvent("UNIT_AURA")
			BuffFrame:Hide()
			TemporaryEnchantFrame:Hide()
			self.Debuffs:Hide()
		end
	elseif self.unit == "pet" and not C.aura.pet_debuffs or self.unit == "focus" and not C.aura.focus_debuffs
	or self.unit == "focustarget" and not C.aura.fot_debuffs or self.unit == "targettarget" and not C.aura.tot_debuffs then
		self.Debuffs:Hide()
	elseif self.unit == "target" and not C.aura.target_auras then
		self.Auras:Hide()
	end
end

T.PostCreateIcon = function(element, button)
	button:SetTemplate("Default")

	button.remaining = T.SetFontString(button, C.font.auras_font, C.font.auras_font_size, C.font.auras_font_style)
	button.remaining:SetShadowOffset(C.font.auras_font_shadow and 1 or 0, C.font.auras_font_shadow and -1 or 0)
	button.remaining:SetPoint("CENTER", button, "CENTER", 1, 1)
	button.remaining:SetJustifyH("CENTER")

	button.cd.noCooldownCount = true

	button.icon:SetPoint("TOPLEFT", 2, -2)
	button.icon:SetPoint("BOTTOMRIGHT", -2, 2)
	button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	button.count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 1, 0)
	button.count:SetJustifyH("RIGHT")
	button.count:SetFont(C.font.auras_font, C.font.auras_font_size, C.font.auras_font_style)
	button.count:SetShadowOffset(C.font.auras_font_shadow and 1 or 0, C.font.auras_font_shadow and -1 or 0)

	if C.aura.show_spiral == true then
		element.disableCooldown = false
		button.cd:SetReverse(true)
		button.cd:SetPoint("TOPLEFT", button, "TOPLEFT", 2, -2)
		button.cd:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
		button.parent = CreateFrame("Frame", nil, button)
		button.parent:SetFrameLevel(button.cd:GetFrameLevel() + 1)
		button.count:SetParent(button.parent)
		button.remaining:SetParent(button.parent)
	else
		element.disableCooldown = true
	end
end

T.PostUpdateIcon = function(_, unit, button, _, _, duration, expiration, debuffType, isStealable)
	local playerUnits = {
		player = true,
		pet = true,
		vehicle = true,
	}

	if button.isDebuff then
		if not UnitIsFriend("player", unit) and not playerUnits[button.caster] then
			if not C.aura.player_aura_only then
				button:SetBackdropBorderColor(unpack(C.media.border_color))
				button.icon:SetDesaturated(true)
			end
		else
			if C.aura.debuff_color_type == true then
				local color = DebuffTypeColor[debuffType] or DebuffTypeColor.none
				button:SetBackdropBorderColor(color.r, color.g, color.b)
				button.icon:SetDesaturated(false)
			else
				button:SetBackdropBorderColor(1, 0, 0)
			end
		end
	else
		if (isStealable or ((T.class == "MAGE" or T.class == "PRIEST" or T.class == "SHAMAN" or T.class == "HUNTER") and debuffType == "Magic")) and not UnitIsFriend("player", unit) then
			button:SetBackdropBorderColor(1, 0.85, 0)
		else
			button:SetBackdropBorderColor(unpack(C.media.border_color))
		end
		button.icon:SetDesaturated(false)
	end

	if duration and duration > 0 and C.aura.show_timer == true then
		button.remaining:Show()
		button.timeLeft = expiration
		button:SetScript("OnUpdate", CreateAuraTimer)
	else
		button.remaining:Hide()
		button.timeLeft = math.huge
		button:SetScript("OnUpdate", nil)
	end

	button.first = true
end

T.CustomFilter = function(_, unit, button, _, _, _, _, _, _, caster)
	if C.aura.player_aura_only then
		if button.isDebuff then
			local playerUnits = {
				player = true,
				pet = true,
				vehicle = true,
			}
			if not UnitIsFriend("player", unit) and not playerUnits[caster] then
				return false
			end
		end
	end
	return true
end

T.CustomFilterBoss = function(_, unit, button, name, _, _, _, _, _, caster)
	if button.isDebuff then
		local playerUnits = {
			player = true,
			pet = true,
			vehicle = true,
		}
		if (playerUnits[caster] or caster == unit) then
			if (T.DebuffBlackList and not T.DebuffBlackList[name]) or not T.DebuffBlackList then
				return true
			end
		end
		return false
	end
	return true
end

T.UpdateThreat = function(self, _, unit)
	if self.unit ~= unit then return end
	local threat = UnitThreatSituation(self.unit)
	if threat and threat > 1 then
		local r, g, b = GetThreatStatusColor(threat)
		self.backdrop:SetBackdropBorderColor(r, g, b)
	else
		self.backdrop:SetBackdropBorderColor(unpack(C.media.border_color))
	end
end

local CountOffSets = {
	TOPLEFT = {9, 0},
	TOPRIGHT = {-8, 0},
	BOTTOMLEFT = {9, 0},
	BOTTOMRIGHT = {-8, 0},
	LEFT = {9, 0},
	RIGHT = {-8, 0},
	TOP = {0, 0},
	BOTTOM = {0, 0},
}

T.CreateAuraWatchIcon = function(_, icon)
	icon:SetTemplate("Default")
	icon.icon:SetPoint("TOPLEFT", icon, 1, -1)
	icon.icon:SetPoint("BOTTOMRIGHT", icon, -1, 1)
	icon.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	icon.icon:SetDrawLayer("ARTWORK")
	if icon.cd then
		icon.cd:SetReverse(true)
	end
	icon.overlay:SetTexture()
end

T.CreateAuraWatch = function(self)
	local auras = CreateFrame("Frame", nil, self)
	auras:SetPoint("TOPLEFT", self.Health, 0, 0)
	auras:SetPoint("BOTTOMRIGHT", self.Health, 0, 0)
	auras.icons = {}
	auras.PostCreateIcon = T.CreateAuraWatchIcon

	if not C.aura.show_timer then
		auras.hideCooldown = true
	end

	local buffs = {}

	if T.RaidBuffs["ALL"] then
		for _, value in pairs(T.RaidBuffs["ALL"]) do
			tinsert(buffs, value)
		end
	end

	if T.RaidBuffs[T.class] then
		for _, value in pairs(T.RaidBuffs[T.class]) do
			tinsert(buffs, value)
		end
	end

	if buffs then
		for _, spell in pairs(buffs) do
			local icon = CreateFrame("Frame", nil, auras)
			icon.spellID = spell[1]
			icon.anyUnit = spell[4]
			icon.strictMatching = spell[5]
			icon:SetWidth(7)
			icon:SetHeight(7)
			icon:SetPoint(spell[2], 0, 0)

			local tex = icon:CreateTexture(nil, "OVERLAY")
			tex:SetAllPoints(icon)
			tex:SetTexture(C.media.blank)
			if spell[3] then
				tex:SetVertexColor(unpack(spell[3]))
			else
				tex:SetVertexColor(0.8, 0.8, 0.8)
			end

			local count = T.SetFontString(icon, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
			count:SetPoint("CENTER", unpack(CountOffSets[spell[2]]))
			icon.count = count

			auras.icons[spell[1]] = icon
		end
	end

	self.AuraWatch = auras
end

T.CheckPlayerBuff = function(spell)
	for i = 1, 40 do
		local name, _, _, _, _, _, unitCaster = UnitBuff("player", i)
		if not name then break end
		if name == spell then
			return i, unitCaster
		end
	end
	return nil
end 
------------------------------------------------------------------------------------------
-- Overlay Function (Buttons)
------------------------------------------------------------------------------------------
local function CreateOverlayButton(f)
	if f.overlaybutton then return end

	local overlaybutton = f:CreateTexture(f:GetName() and f:GetName().."overlaybutton" or nil, "BORDER", f)
	overlaybutton:ClearAllPoints()
	overlaybutton:SetPoint("TOPLEFT", 2, -2)
	overlaybutton:SetPoint("BOTTOMRIGHT", -2, 2)
	overlaybutton:SetTexture("Interface\\AddOns\\ViksUI\\Media\\textures\\Minimalist.tga")
	overlaybutton:SetAlpha(1)
	overlaybutton:SetVertexColor(0.22, 0.22, 0.22)
	f.overlaybutton = overlaybutton
end
T.CreateBtn = function(buttonname, buttonparent, buttonwidth, buttonheight, tooltiptext, buttontext, tooltipanchor)
	local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]	
	-- basic button
	local button = CreateFrame("Button", buttonname, buttonparent, "SecureActionButtonTemplate")
	button:SetWidth(buttonwidth)
	button:SetHeight(buttonheight)
	button:SetTemplate()
	button:EnableMouse(true)

	-- button text
	button.text = button:CreateFontString(nil, "OVERLAY")
	--button.text:SetFont("Interface\\AddOns\\ViksUI\\media\\Fonts\\Movavi.ttf", 12, "OUTLINE")
	button.text:SetFontObject(CombatLogFont)
	button.text:SetText(buttontext)
	button.text:SetTextColor(1, 1, 1)
	button.text:SetPoint("CENTER", button, 'CENTER', 0, 0)
	button.text:SetJustifyH("CENTER")	

	-- button icon
	button.icon = button:CreateTexture(nil, "OVERLAY")
	button.icon:SetSize(17, 17)
	button.icon:SetPoint("CENTER", button, "CENTER", 0, 0)
	
	--button mouseaction (mousover or click)
	button:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(tooltipanchor, "ANCHOR_TOP", 0, 10)
		GameTooltip:AddLine(tooltiptext, 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
		button.text:SetTextColor(class.r, class.g, class.b)
		button:SetBackdropBorderColor(class.r, class.g, class.b)
		button.icon:SetVertexColor(class.r, class.g, class.b)
	end)
	
	button:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		button.text:SetTextColor(1, 1, 1)
		button:SetBackdropBorderColor(unpack(C["media"]["border_color"]))
		button.icon:SetVertexColor(1, 1, 1)
	end)

	-- set attributes
	button:SetAttribute("type1", "macro")

	-- Overlay texture
	button:CreateOverlay()
end

function T:HandleButton(f, strip, isDeclineButton)
	assert(f, "doesn't exist!")

	if f.Left then f.Left:SetAlpha(0) end
	if f.Middle then f.Middle:SetAlpha(0) end
	if f.Right then f.Right:SetAlpha(0) end
	if f.TopLeft then f.TopLeft:SetAlpha(0) end
	if f.TopMiddle then f.TopMiddle:SetAlpha(0) end
	if f.TopRight then f.TopRight:SetAlpha(0) end
	if f.MiddleLeft then f.MiddleLeft:SetAlpha(0) end
	if f.MiddleMiddle then f.MiddleMiddle:SetAlpha(0) end
	if f.MiddleRight then f.MiddleRight:SetAlpha(0) end
	if f.BottomLeft then f.BottomLeft:SetAlpha(0) end
	if f.BottomMiddle then f.BottomMiddle:SetAlpha(0) end
	if f.BottomRight then f.BottomRight:SetAlpha(0) end
	if f.LeftSeparator then f.LeftSeparator:SetAlpha(0) end
	if f.RightSeparator then f.RightSeparator:SetAlpha(0) end

	if f.SetNormalTexture then f:SetNormalTexture("") end
	if f.SetHighlightTexture then f:SetHighlightTexture("") end
	if f.SetPushedTexture then f:SetPushedTexture("") end
	if f.SetDisabledTexture then f:SetDisabledTexture("") end

	if strip then f:StripTextures() end

	-- used for a white X on decline buttons (more clear)
	if isDeclineButton then
		if f.Icon then f.Icon:Hide() end
		if not f.text then
			f.text = f:CreateFontString(nil, 'OVERLAY')
			f.text:SetFont([[Interface\AddOns\ViksUI\media\fonts\LinkinPark.ttf]], 16, 'OUTLINE')
			f.text:SetText('x')
			f.text:SetJustifyH('CENTER')
			f.text:SetPoint('CENTER', f, 'CENTER')
		end
	end

	f:SetTemplate("Default", true)
	f:HookScript("OnEnter", T.SetModifiedBackdrop)
	f:HookScript("OnLeave", T.SetOriginalBackdrop)
end
local find = string.find

function T:HandleScrollBar(frame, thumbTrim)
	if frame:GetName() then
		if frame.Background then frame.Background:SetTexture(nil) end
		if frame.trackBG then frame.trackBG:SetTexture(nil) end
		if frame.Middle then frame.Middle:SetTexture(nil) end
		if frame.Top then frame.Top:SetTexture(nil) end
		if frame.Bottom then frame.Bottom:SetTexture(nil) end
		if frame.ScrollBarTop then frame.ScrollBarTop:SetTexture(nil) end
		if frame.ScrollBarBottom then frame.ScrollBarBottom:SetTexture(nil) end
		if frame.ScrollBarMiddle then frame.ScrollBarMiddle:SetTexture(nil) end

		if _G[frame:GetName().."BG"] then _G[frame:GetName().."BG"]:SetTexture(nil) end
		if _G[frame:GetName().."Track"] then _G[frame:GetName().."Track"]:SetTexture(nil) end
		if _G[frame:GetName().."Top"] then _G[frame:GetName().."Top"]:SetTexture(nil) end
		if _G[frame:GetName().."Bottom"] then _G[frame:GetName().."Bottom"]:SetTexture(nil) end
		if _G[frame:GetName().."Middle"] then _G[frame:GetName().."Middle"]:SetTexture(nil) end

		if _G[frame:GetName().."ScrollUpButton"] and _G[frame:GetName().."ScrollDownButton"] then
			_G[frame:GetName().."ScrollUpButton"]:StripTextures()
			if not _G[frame:GetName().."ScrollUpButton"].icon then
				T:HandleNextPrevButton(_G[frame:GetName().."ScrollUpButton"])
				SquareButton_SetIcon(_G[frame:GetName().."ScrollUpButton"], 'UP')
				_G[frame:GetName().."ScrollUpButton"]:Size(_G[frame:GetName().."ScrollUpButton"]:GetWidth() + 7, _G[frame:GetName().."ScrollUpButton"]:GetHeight() + 7)
			end

			_G[frame:GetName().."ScrollDownButton"]:StripTextures()
			if not _G[frame:GetName().."ScrollDownButton"].icon then
				T:HandleNextPrevButton(_G[frame:GetName().."ScrollDownButton"])
				SquareButton_SetIcon(_G[frame:GetName().."ScrollDownButton"], 'DOWN')
				_G[frame:GetName().."ScrollDownButton"]:Size(_G[frame:GetName().."ScrollDownButton"]:GetWidth() + 7, _G[frame:GetName().."ScrollDownButton"]:GetHeight() + 7)
			end

			if not frame.trackbg then
				frame.trackbg = CreateFrame("Frame", nil, frame)
				frame.trackbg:SetPoint("TOPLEFT", _G[frame:GetName().."ScrollUpButton"], "BOTTOMLEFT", 0, -1)
				frame.trackbg:SetPoint("BOTTOMRIGHT", _G[frame:GetName().."ScrollDownButton"], "TOPRIGHT", 0, 1)
				frame.trackbg:SetTemplate("Transparent")
			end

			if frame:GetThumbTexture() then
				if not thumbTrim then thumbTrim = 3 end
				frame:GetThumbTexture():SetTexture(nil)
				if not frame.thumbbg then
					frame.thumbbg = CreateFrame("Frame", nil, frame)
					frame.thumbbg:SetPoint("TOPLEFT", frame:GetThumbTexture(), "TOPLEFT", 2, -thumbTrim)
					frame.thumbbg:SetPoint("BOTTOMRIGHT", frame:GetThumbTexture(), "BOTTOMRIGHT", -2, thumbTrim)
					frame.thumbbg:SetTemplate("Transparent", true, true)
					--frame.thumbbg.backdropTexture:SetVertexColor(0.6, 0.6, 0.6)
					if frame.trackbg then
						frame.thumbbg:SetFrameLevel(frame.trackbg:GetFrameLevel()+1)
					end
				end
			end
		end
	else
		if frame.Background then frame.Background:SetTexture(nil) end
		if frame.trackBG then frame.trackBG:SetTexture(nil) end
		if frame.Middle then frame.Middle:SetTexture(nil) end
		if frame.Top then frame.Top:SetTexture(nil) end
		if frame.Bottom then frame.Bottom:SetTexture(nil) end
		if frame.ScrollBarTop then frame.ScrollBarTop:SetTexture(nil) end
		if frame.ScrollBarBottom then frame.ScrollBarBottom:SetTexture(nil) end
		if frame.ScrollBarMiddle then frame.ScrollBarMiddle:SetTexture(nil) end

		if frame.ScrollUpButton and frame.ScrollDownButton then
			if not frame.ScrollUpButton.icon then
				T:HandleNextPrevButton(frame.ScrollUpButton, true, true)
				frame.ScrollUpButton:Size(frame.ScrollUpButton:GetWidth() + 7, frame.ScrollUpButton:GetHeight() + 7)
			end

			if not frame.ScrollDownButton.icon then
				T:HandleNextPrevButton(frame.ScrollDownButton, true)
				frame.ScrollDownButton:Size(frame.ScrollDownButton:GetWidth() + 7, frame.ScrollDownButton:GetHeight() + 7)
			end

			if not frame.trackbg then
				frame.trackbg = CreateFrame("Frame", nil, frame)
				frame.trackbg:SetPoint("TOPLEFT", frame.ScrollUpButton, "BOTTOMLEFT", 0, -1)
				frame.trackbg:SetPoint("BOTTOMRIGHT", frame.ScrollDownButton, "TOPRIGHT", 0, 1)
				frame.trackbg:SetTemplate("Transparent")
			end

			if frame.thumbTexture then
				if not thumbTrim then thumbTrim = 3 end
				frame.thumbTexture:SetTexture(nil)
				if not frame.thumbbg then
					frame.thumbbg = CreateFrame("Frame", nil, frame)
					frame.thumbbg:SetPoint("TOPLEFT", frame.thumbTexture, "TOPLEFT", 2, -thumbTrim)
					frame.thumbbg:SetPoint("BOTTOMRIGHT", frame.thumbTexture, "BOTTOMRIGHT", -2, thumbTrim)
					frame.thumbbg:SetTemplate("Default", true, true)
					frame.thumbbg.backdropTexture:SetVertexColor(0.6, 0.6, 0.6)
					if frame.trackbg then
						frame.thumbbg:SetFrameLevel(frame.trackbg:GetFrameLevel()+1)
					end
				end
			end
		end
	end
end

function T:HandleNextPrevButton(btn, useVertical, inverseDirection)
	inverseDirection = inverseDirection or btn:GetName() and (find(btn:GetName():lower(), 'left') or find(btn:GetName():lower(), 'prev') or find(btn:GetName():lower(), 'decrement') or find(btn:GetName():lower(), 'back'))

	btn:StripTextures()
	btn:SetNormalTexture(nil)
	btn:SetPushedTexture(nil)
	btn:SetHighlightTexture(nil)
	btn:SetDisabledTexture(nil)

	if not btn.icon then
		btn.icon = btn:CreateTexture(nil, 'ARTWORK')
		btn.icon:Size(13)
		btn.icon:SetPoint('CENTER')
		btn.icon:SetTexture([[Interface\Buttons\SquareButtonTextures]])
		btn.icon:SetTexCoord(0.01562500, 0.20312500, 0.01562500, 0.20312500)

		btn:HookScript('OnMouseDown', function(button)
			if button:IsEnabled() then
				button.icon:SetPoint("CENTER", -1, -1);
			end
		end)

		btn:HookScript('OnMouseUp', function(button)
			button.icon:SetPoint("CENTER", 0, 0);
		end)

		btn:HookScript('OnDisable', function(button)
			SetDesaturation(button.icon, true);
			button.icon:SetAlpha(0.5);
		end)

		btn:HookScript('OnEnable', function(button)
			SetDesaturation(button.icon, false);
			button.icon:SetAlpha(1.0);
		end)

		if not btn:IsEnabled() then
			btn:GetScript('OnDisable')(btn)
		end
	end

	if useVertical then
		if inverseDirection then
			SquareButton_SetIcon(btn, 'UP')
		else
			SquareButton_SetIcon(btn, 'DOWN')
		end
	else
		if inverseDirection then
			SquareButton_SetIcon(btn, 'LEFT')
		else
			SquareButton_SetIcon(btn, 'RIGHT')
		end
	end

	T:HandleButton(btn)
	btn:Size(btn:GetWidth() - 8, btn:GetHeight() - 8)
end

function T:HandleMaxMinFrame(frame)
	assert(frame, "does not exist.")

	frame:StripTextures()

	for _, name in next, {"MaximizeButton", "MinimizeButton"} do
		local button = frame[name]
		if button then
			button:SetSize(18, 18)
			button:ClearAllPoints()
			button:SetPoint("CENTER", -6 ,0)

			button:SetNormalTexture("Interface\\AddOns\\ViksUI\\Media\\textures\\vehicleexit")
			button:SetPushedTexture("Interface\\AddOns\\ViksUI\\Media\\textures\\vehicleexit")
			button:SetHighlightTexture("Interface\\AddOns\\ViksUI\\Media\\textures\\vehicleexit")

			if not button.backdrop then
				button:CreateBackdrop("Default", true)
				button.backdrop:SetPoint("TOPLEFT", button, 1, -1)
				button.backdrop:SetPoint("BOTTOMRIGHT", button, -1, 1)
				button:HookScript('OnEnter', T.SetModifiedBackdrop)
				button:HookScript('OnLeave', T.SetOriginalBackdrop)
				button:SetHitRectInsets(1, 1, 1, 1)
			end

			if name == "MaximizeButton" then
				button:GetNormalTexture():SetTexCoord(1, 1, 1, -1.2246467991474e-016, 1.1102230246252e-016, 1, 0, -1.144237745222e-017)
				button:GetPushedTexture():SetTexCoord(1, 1, 1, -1.2246467991474e-016, 1.1102230246252e-016, 1, 0, -1.144237745222e-017)
				button:GetHighlightTexture():SetTexCoord(1, 1, 1, -1.2246467991474e-016, 1.1102230246252e-016, 1, 0, -1.144237745222e-017)
			end
		end
	end
end

function T:HandleEditBox(frame)
	frame:CreateBackdrop("Default")

	if frame.TopLeftTex then frame.TopLeftTex:Kill() end
	if frame.TopRightTex then frame.TopRightTex:Kill() end
	if frame.TopTex then frame.TopTex:Kill() end
	if frame.BottomLeftTex then frame.BottomLeftTex:Kill() end
	if frame.BottomRightTex then frame.BottomRightTex:Kill() end
	if frame.BottomTex then frame.BottomTex:Kill() end
	if frame.LeftTex then frame.LeftTex:Kill() end
	if frame.RightTex then frame.RightTex:Kill() end
	if frame.MiddleTex then frame.MiddleTex:Kill() end
	if frame.Left then frame.Left:Kill() end
	if frame.Right then frame.Right:Kill() end
	if frame.Middle then frame.Middle:Kill() end
	if frame.Mid then frame.Mid:Kill() end

	local frameName = frame.GetName and frame:GetName()
	if frameName then
		if _G[frameName.."Left"] then _G[frameName.."Left"]:Kill() end
		if _G[frameName.."Middle"] then _G[frameName.."Middle"]:Kill() end
		if _G[frameName.."Right"] then _G[frameName.."Right"]:Kill() end
		if _G[frameName.."Mid"] then _G[frameName.."Mid"]:Kill() end

		if frameName:find("Silver") or frameName:find("Copper") then
			frame.backdrop:SetPoint("BOTTOMRIGHT", -12, -2)
		end
	end
end

function T:HandleDropDownBox(frame, width)
	local button = _G[frame:GetName().."Button"]
	if not button then return end

	if not width then width = 155 end

	frame:StripTextures()
	frame:SetWidth(width)

	local frameText = _G[frame:GetName().."Text"]
	if frameText then
		_G[frame:GetName().."Text"]:ClearAllPoints()
		_G[frame:GetName().."Text"]:SetPoint("RIGHT", button, "LEFT", -2, 0)
	end

	if button then
		button:ClearAllPoints()
		button:SetPoint("RIGHT", frame, "RIGHT", -10, 3)
		hooksecurefunc(button, "SetPoint", function(btn, _, _, _, _, _, noReset)
			if not noReset then
				btn:ClearAllPoints()
				btn:SetPoint("RIGHT", frame, "RIGHT", T:Scale(-10), T:Scale(3), true)
			end
		end)

		self:HandleNextPrevButton(button, true)
	end

	frame:CreateBackdrop("Default")
	frame.backdrop:SetPoint("TOPLEFT", 20, -2)
	frame.backdrop:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)
end

function T:HandleCheckBox(frame, noBackdrop, noReplaceTextures)
	assert(frame, 'does not exist.')

	frame:StripTextures()

	if noBackdrop then
		frame:SetTemplate("Default")
		frame:Size(16)
	else
		frame:CreateBackdrop('Default')
		--x frame.backdrop:SetInside(nil, 4, 4)
		frame.backdrop:SetPoint("TOPLEFT", nil, 6, -6)
		frame.backdrop:SetPoint("BOTTOMRIGHT", nil, -6, 6)
	end

	if not noReplaceTextures then
		if frame.SetCheckedTexture then
			frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
			if noBackdrop then
				--x frame:GetCheckedTexture():SetInside(nil, -4, -4)
				frame:GetCheckedTexture():SetPoint("TOPLEFT", nil, 6, -6)
				frame:GetCheckedTexture():SetPoint("BOTTOMRIGHT", nil, -6, 6)
			end
		end

		if frame.SetDisabledTexture then
			frame:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
			if noBackdrop then
				--x frame:GetDisabledTexture():SetInside(nil, -4, -4)
				frame:GetDisabledTexture():SetPoint("TOPLEFT", nil, 6, -6)
				frame:GetDisabledTexture():SetPoint("BOTTOMRIGHT", nil, -6, 6)
			end
		end

		frame:HookScript('OnDisable', function(checkbox)
			if not checkbox.SetDisabledTexture then return; end
			if checkbox:GetChecked() then
				checkbox:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
			else
				checkbox:SetDisabledTexture("")
			end
		end)

		hooksecurefunc(frame, "SetNormalTexture", function(checkbox, texPath)
			if texPath ~= "" then checkbox:SetNormalTexture("") end
		end)
		hooksecurefunc(frame, "SetPushedTexture", function(checkbox, texPath)
			if texPath ~= "" then checkbox:SetPushedTexture("") end
		end)
		hooksecurefunc(frame, "SetHighlightTexture", function(checkbox, texPath)
			if texPath ~= "" then checkbox:SetHighlightTexture("") end
		end)
	end
end
-- World Map related Skinning functions used for WoW 8.0
function T:WorldMapMixin_AddOverlayFrame(self, templateName, templateType, anchorPoint, relativeTo, relativePoint, offsetX, offsetY)
	T[templateName](self.overlayFrames[#self.overlayFrames])
end

function T:HandleWorldMapDropDownMenu(frame)
	local left = frame.Left
	local middle = frame.Middle
	local right = frame.Right
	if left then
		left:SetAlpha(0)
		left:SetSize(25, 64)
		left:SetPoint("TOPLEFT", 0, 17)
	end
	if middle then
		middle:SetAlpha(0)
		middle:SetHeight(64)
	end
	if right then
		right:SetAlpha(0)
		right:SetSize(25, 64)
	end

	local button = frame.Button
	if button then
		button:ClearAllPoints()
		button:SetPoint("RIGHT", frame, "RIGHT", -10, 3)
		button:SetSize(20, 20)

		button.NormalTexture:SetTexture("")
		button.PushedTexture:SetTexture("")
		button.HighlightTexture:SetTexture("")
		hooksecurefunc(button, "SetPoint", function(btn, _, _, _, _, _, noReset)
			if not noReset then
				btn:ClearAllPoints()
				btn:SetPoint("RIGHT", frame, "RIGHT", T:Scale(-10), T:Scale(3), true)
			end
		end)

		self:HandleNextPrevButton(button, true)
	end

	local disabled = button and button.DisabledTexture
	if disabled then
		disabled:SetAllPoints(button)
		disabled:SetColorTexture(0, 0, 0, .3)
		disabled:SetDrawLayer("OVERLAY")
	end

	if right and frame.Text then
		frame.Text:SetSize(0, 10)
		frame.Text:SetPoint("RIGHT", right, -43, 2)
	end

	if middle and (not frame.noResize) then
		frame:SetWidth(40)
		middle:SetWidth(115)
	end

	frame:SetHeight(20)
	frame:CreateBackdrop("Default")
	frame.backdrop:SetPoint("TOPLEFT", 20, -2)

	if button then
		frame.backdrop:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)
	end
end

function T.HandleIcon(icon, parent)
	parent = parent or icon:GetParent()

	parent:CreateBackdrop("Default")
	parent.backdrop:SetPoint("TOPLEFT", icon, -2, 2)
	parent.backdrop:SetPoint("BOTTOMRIGHT", icon, 2, -2)

	icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	icon:SetParent(parent)
end

function T:CropIcon(texture, parent)
	texture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	if parent then
		local layer, subLevel = texture:GetDrawLayer()
		local iconBorder = parent:CreateTexture(nil, layer, nil, subLevel - 1)
		iconBorder:SetPoint("TOPLEFT", texture, -1, 1)
		iconBorder:SetPoint("BOTTOMRIGHT", texture, 1, -1)
		iconBorder:SetColorTexture(0, 0, 0)
		return iconBorder
	end
end

function T:HandleInsetFrameTemplate(frame)
	if frame.InsetBorderTop then frame.InsetBorderTop:Hide() end
	if frame.InsetBorderTopLeft then frame.InsetBorderTopLeft:Hide() end
	if frame.InsetBorderTopRight then frame.InsetBorderTopRight:Hide() end

	if frame.InsetBorderBottom then frame.InsetBorderBottom:Hide() end
	if frame.InsetBorderBottomLeft then frame.InsetBorderBottomLeft:Hide() end
	if frame.InsetBorderBottomRight then frame.InsetBorderBottomRight:Hide() end

	if frame.InsetBorderLeft then frame.InsetBorderLeft:Hide() end
	if frame.InsetBorderRight then frame.InsetBorderRight:Hide() end

	if frame.Bg then frame.Bg:Hide() end
end

function T:SkinTalentListButtons(frame)
	local name = frame and frame.GetName and frame:GetName()
	if name then
		local bcl = _G[name.."BtnCornerLeft"]
		local bcr = _G[name.."BtnCornerRight"]
		local bbb = _G[name.."ButtonBottomBorder"]
		if bcl then bcl:SetTexture("") end
		if bcr then bcr:SetTexture("") end
		if bbb then bbb:SetTexture("") end
	end

	if frame.Inset then
		T:HandleInsetFrameTemplate(frame.Inset)

		frame.Inset:SetPoint("TOPLEFT", 4, -60)
		frame.Inset:SetPoint("BOTTOMRIGHT", -6, 26)
	end
end

function T:HandleInsetFrameTemplate(frame)
	if frame.InsetBorderTop then frame.InsetBorderTop:Hide() end
	if frame.InsetBorderTopLeft then frame.InsetBorderTopLeft:Hide() end
	if frame.InsetBorderTopRight then frame.InsetBorderTopRight:Hide() end

	if frame.InsetBorderBottom then frame.InsetBorderBottom:Hide() end
	if frame.InsetBorderBottomLeft then frame.InsetBorderBottomLeft:Hide() end
	if frame.InsetBorderBottomRight then frame.InsetBorderBottomRight:Hide() end

	if frame.InsetBorderLeft then frame.InsetBorderLeft:Hide() end
	if frame.InsetBorderRight then frame.InsetBorderRight:Hide() end

	if frame.Bg then frame.Bg:Hide() end
end

-- HybridScrollFrame (Taken from Aurora)
function T:HandleScrollSlider(Slider, thumbTrim)
	local parent = Slider:GetParent()
	Slider:SetPoint("TOPLEFT", parent, "TOPRIGHT", 0, -17)
	Slider:SetPoint("BOTTOMLEFT", parent, "BOTTOMRIGHT", 0, 17)

	if Slider.trackBG then Slider.trackBG:Hide() end
	if Slider.ScrollBarTop then Slider.ScrollBarTop:Hide() end
	if Slider.ScrollBarMiddle then Slider.ScrollBarMiddle:Hide() end
	if Slider.ScrollBarBottom then Slider.ScrollBarBottom:Hide() end

	if not Slider.trackbg then
		Slider.trackbg = CreateFrame("Frame", nil, Slider)
		Slider.trackbg:SetPoint("TOPLEFT", Slider.ScrollUp, "BOTTOMLEFT", 0, -1)
		Slider.trackbg:SetPoint("BOTTOMRIGHT", Slider.ScrollDown, "TOPRIGHT", 0, 1)
		--Slider.trackbg:SetTemplate("Overlay")
		Slider.trackBG:Hide()
		Slider.trackbg:SetAlpha(0)
	end

	if Slider.ScrollUp and Slider.ScrollDown then
		if not Slider.ScrollUp.icon then
			T:HandleNextPrevButton(Slider.ScrollUp, true, true)
			Slider.ScrollUp:SetSize(Slider.ScrollUp:GetWidth() + 7, Slider.ScrollUp:GetHeight() + 7)
		end

		if not Slider.ScrollDown.icon then
			T:HandleNextPrevButton(Slider.ScrollDown, true)
			Slider.ScrollDown:SetSize(Slider.ScrollDown:GetWidth() + 7, Slider.ScrollDown:GetHeight() + 7)
		end
	end

	if parent.scrollUp and parent.scrollDown then
		if not parent.scrollUp.icon then
			T:HandleNextPrevButton(parent.scrollUp, true, true)
			parent.scrollUp:SetSize(parent.scrollUp:GetWidth() + 9, parent.scrollUp:GetHeight() + 7) -- Not perfect
		end

		if not parent.scrollDown.icon then
			T:HandleNextPrevButton(parent.scrollDown, true)
			parent.scrollDown:SetSize(parent.scrollDown:GetWidth() + 9, parent.scrollDown:GetHeight() + 7) -- Not perfect
		end
	end

	if Slider.thumbTexture then
		if not thumbTrim then thumbTrim = 3 end
		Slider.thumbTexture:SetTexture(nil)
		if not Slider.thumbbg then
			Slider.thumbbg = CreateFrame("Frame", nil, Slider)
			Slider.thumbbg:SetPoint("TOPLEFT", Slider.thumbTexture, "TOPLEFT", 2, -thumbTrim)
			Slider.thumbbg:SetPoint("BOTTOMRIGHT", Slider.thumbTexture, "BOTTOMRIGHT", -2, thumbTrim)
			Slider.thumbbg:SetTemplate("Overlay", true, true)
			--Slider.thumbbg.backdropTexture:SetVertexColor(0.6, 0.6, 0.6)
			if Slider.trackbg then
				Slider.thumbbg:SetFrameLevel(Slider.trackbg:GetFrameLevel()+1)
				
			end
		end
	end
end
-- Color Gradient
T.ColorGradient = function(a, b, ...)
	local Percent

	if(b == 0) then
		Percent = 0
	else
		Percent = a / b
	end

	if (Percent >= 1) then
		local R, G, B = select(select("#", ...) - 2, ...)

		return R, G, B
	elseif (Percent <= 0) then
		local R, G, B = ...

		return R, G, B
	end

	local Num = (select("#", ...) / 3)
	local Segment, RelPercent = math.modf(Percent * (Num - 1))
	local R1, G1, B1, R2, G2, B2 = select((Segment * 3) + 1, ...)

	return R1 + (R2 - R1) * RelPercent, G1 + (G2 - G1) * RelPercent, B1 + (B2 - B1) * RelPercent
end

-- New BFA DropDown Template (Original Function Credits: Aurora) ~ was modified.
function T:HandleDropDownFrame(frame, width)
	if not width then width = 155 end

	local left = frame.Left
	local middle = frame.Middle
	local right = frame.Right
	if left then
		left:SetAlpha(0)
		left:SetSize(25, 64)
		left:SetPoint("TOPLEFT", 0, 17)
	end
	if middle then
		middle:SetAlpha(0)
		middle:SetHeight(64)
	end
	if right then
		right:SetAlpha(0)
		right:SetSize(25, 64)
	end

	local button = frame.Button
	if button then
		button:SetSize(24, 24)
		button:ClearAllPoints()
		button:Point("RIGHT", right, "RIGHT", -20, 0)

		button.NormalTexture:SetTexture("")
		button.PushedTexture:SetTexture("")
		button.HighlightTexture:SetTexture("")

		hooksecurefunc(button, "SetPoint", function(btn, _, _, _, _, _, noReset)
			if not noReset then
				btn:ClearAllPoints()
				btn:SetPoint("RIGHT", frame, "RIGHT", T:Scale(-20), T:Scale(0), true)
			end
		end)

		self:HandleNextPrevButton(button, true)
	end

	local disabled = button and button.DisabledTexture
	if disabled then
		disabled:SetAllPoints(button)
		disabled:SetColorTexture(0, 0, 0, .3)
		disabled:SetDrawLayer("OVERLAY")
	end

	if middle and (not frame.noResize) then
		frame:SetWidth(40)
		middle:SetWidth(width)
	end

	if right and frame.Text then
		frame.Text:SetSize(0, 10)
		frame.Text:SetPoint("RIGHT", right, -43, 2)
	end
	
	frame:CreateBackdrop("Default")
	frame.backdrop:Point("TOPLEFT", 20, -2)
	frame.backdrop:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)
end