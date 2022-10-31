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
	if decimals and decimals > 0 then
		local mult = 10 ^ decimals
		return floor(number * mult + 0.5) / mult
	end
	return floor(number + 0.5)
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
--	Move functions
----------------------------------------------------------------------------------------
T.CalculateMoverPoints = function(mover)
	local centerX, centerY = UIParent:GetCenter()
	local width = UIParent:GetRight()
	local x, y = mover:GetCenter()

	local point = "BOTTOM"
	if y >= centerY then
		point = "TOP"
		y = -(UIParent:GetTop() - mover:GetTop())
	else
		y = mover:GetBottom()
	end

	if x >= (width * 2 / 3) then
		point = point.."RIGHT"
		x = mover:GetRight() - width
	elseif x <= (width / 3) then
		point = point.."LEFT"
		x = mover:GetLeft()
	else
		x = x - centerX
	end

	return x, y, point
end

------------------------------------------------------------------------------------------
-- Overlay Function (Buttons) --Different then in API
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
	btn:SetNormalTexture(0)
	btn:SetPushedTexture(0)
	btn:SetHighlightTexture(0)
	btn:SetDisabledTexture(0)

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
				Mixin(button, BackdropTemplateMixin)
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