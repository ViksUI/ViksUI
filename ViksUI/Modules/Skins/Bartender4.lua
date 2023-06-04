local T, C, L = unpack(ViksUI)
if C.skins.blizzard_frames ~= true or C.skins.bartender ~= true then return end
--[[ --// UNDER CONSTRUCTION
----------------------------------------------------------------------------------------
--	Bartender skin
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, addon)
	if not IsAddOnLoaded("Bartender4") then return end
	
	local function StyleNormalButton(self)
		local name = self:GetName()
		--if name:match("ExtraActionButton") then return end
		local button = self
		local icon = _G[name.."Icon"]
		local count = _G[name.."Count"]
		local flash = _G[name.."Flash"]
		local hotkey = _G[name.."HotKey"]
		local border = _G[name.."Border"]
		local btname = _G[name.."Name"]
		local normal = _G[name.."NormalTexture"]

		flash:SetTexture("")
		button:SetNormalTexture("")

		if border then
			border:Hide()
			border = T.dummy
		end

		if count then
		count:ClearAllPoints()
		count:SetPoint("BOTTOMRIGHT", 0, 2)
		count:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
		count:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)
		end

		if btname then
				btname:ClearAllPoints()
				btname:SetPoint("BOTTOM", 0, 0)
				btname:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
				btname:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)
		end

		if hotkey then
			hotkey:ClearAllPoints()
			hotkey:SetPoint("TOPRIGHT", 0, 0)
			hotkey:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
			hotkey:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)
			hotkey:SetWidth(button:GetWidth() - 1)
		end

		if not button.isSkinned then
			button:CreateBackdrop("Default")
			button.backdrop:SetAllPoints()
			icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			icon:SetPoint("TOPLEFT", button, 2, -2)
			icon:SetPoint("BOTTOMRIGHT", button, -2, 2)

			button.isSkinned = true
		end
	
		if normal then
			normal:ClearAllPoints()
			normal:SetPoint("TOPLEFT")
			normal:SetPoint("BOTTOMRIGHT")
		end
	end

	
	local function StyleSmallButton(button, icon, name, hotkey, pet)
		if not button then return end
		local flash = _G[name.."Flash"]
		button:StyleButton()
		button:SetNormalTexture("")

		if flash then
			flash:SetColorTexture(0.8, 0.8, 0.8, 0.5)
			flash:SetPoint("TOPLEFT", button, 2, -2)
			flash:SetPoint("BOTTOMRIGHT", button, -2, 2)
		end

		if hotkey then
			hotkey:ClearAllPoints()
			hotkey:SetPoint("TOPRIGHT", 0, 0)
			hotkey:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
			hotkey:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)
			hotkey:SetWidth(button:GetWidth() - 1)
		end

		if not button.isSkinned then
			button:CreateBackdrop("Default")
			button.backdrop:SetAllPoints()

			icon:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			icon:ClearAllPoints()
			icon:SetPoint("TOPLEFT", button, 2, -2)
			icon:SetPoint("BOTTOMRIGHT", button, -2, 2)

			if pet then
				local autocast = _G[name.."AutoCastable"]
				autocast:SetSize((button:GetWidth() * 2) - 10, (button:GetWidth() * 2) - 10)
				autocast:ClearAllPoints()
				autocast:SetPoint("CENTER", button, 0, 0)

				local shine = _G[name.."Shine"]
				shine:SetSize(button:GetWidth(), button:GetWidth())

				local cooldown = _G[name.."Cooldown"]
				cooldown:SetSize(button:GetWidth() - 2, button:GetWidth() - 2)
			end

			button.isSkinned = true
		end
	end	
		
	do	
		for i = 1, 10 do
			if _G['BT4Bar'..i] and _G['BT4Bar'..i].buttons then
				for k, button in pairs(_G['BT4Bar'..i].buttons) do
					StyleNormalButton(button)
				end
			end
			if _G['BT4StanceButton'..i] then
				StyleNormalButton(_G['BT4StanceButton'..i])
			end
		end
	end	
hooksecurefunc("ActionButton_Update", StyleNormalButton)
end)
]]--
