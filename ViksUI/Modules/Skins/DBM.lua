local T, C, L = unpack(ViksUI)
if C.skins.dbm ~= true then return end

----------------------------------------------------------------------------------------
--	DBM skin(by Affli)
----------------------------------------------------------------------------------------
local backdrop = {
	bgFile = C.media.blank,
	insets = {left = 0, right = 0, top = 0, bottom = 0},
}

local DBMSkin = CreateFrame("Frame")
DBMSkin:RegisterEvent("PLAYER_LOGIN")
DBMSkin:RegisterEvent("ADDON_LOADED")
DBMSkin:SetScript("OnEvent", function()
	if C_AddOns.IsAddOnLoaded("DBM-Core") then
		local function SkinBars(self)
			for bar in self:GetBarIterator() do
				if not bar.injected then
					bar.ApplyStyle = function()
						local frame = bar.frame
						local tbar = _G[frame:GetName().."Bar"]
						local spark = _G[frame:GetName().."BarSpark"]
						local icon1 = _G[frame:GetName().."BarIcon1"]
						local icon2 = _G[frame:GetName().."BarIcon2"]
						local name = _G[frame:GetName().."BarName"]
						local timer = _G[frame:GetName().."BarTimer"]

						if icon1.overlay then
							icon1.overlay = _G[icon1.overlay:GetName()]
						else
							icon1.overlay = CreateFrame("Frame", "$parentIcon1Overlay", tbar)
							icon1.overlay:SetWidth(25)
							icon1.overlay:SetHeight(25)
							icon1.overlay:SetFrameStrata("BACKGROUND")
							icon1.overlay:SetPoint("BOTTOMRIGHT", tbar, "BOTTOMLEFT", -5, -2)
							icon1.overlay:SetTemplate("Transparent")
						end

						if icon2.overlay then
							icon2.overlay = _G[icon2.overlay:GetName()]
						else
							icon2.overlay = CreateFrame("Frame", "$parentIcon2Overlay", tbar)
							icon2.overlay:SetWidth(25)
							icon2.overlay:SetHeight(25)
							icon2.overlay:SetFrameStrata("BACKGROUND")
							icon2.overlay:SetPoint("BOTTOMLEFT", tbar, "BOTTOMRIGHT", 5, -2)
							icon2.overlay:SetTemplate("Transparent")
						end

						Mixin(tbar, BackdropTemplateMixin)
						if bar.color then
							tbar:SetStatusBarColor(bar.color.r, bar.color.g, bar.color.b)
							tbar:SetBackdrop(backdrop)
							tbar:SetBackdropColor(bar.color.r, bar.color.g, bar.color.b, 0.15)
						else
							tbar:SetStatusBarColor(DBT.Options.StartColorR, DBT.Options.StartColorG, DBT.Options.StartColorB)
							tbar:SetBackdrop(backdrop)
							tbar:SetBackdropColor(DBT.Options.StartColorR, DBT.Options.StartColorG, DBT.Options.StartColorB, 0.15)
						end

						if bar.enlarged then
							frame:SetWidth(DBT.Options.HugeWidth)
							tbar:SetWidth(DBT.Options.HugeWidth)
						else
							frame:SetWidth(DBT.Options.Width)
							tbar:SetWidth(DBT.Options.Width)
						end

						if not frame.styled then
							frame:SetScale(1)
							frame:SetHeight(19)
							frame:SetTemplate("Default")
							frame.styled = true
						end

						if not spark.killed then
							spark:SetAlpha(0)
							spark:SetTexture(nil)
							spark.killed = true
						end

						if not icon1.styled then
							icon1:SetTexCoord(0.1, 0.9, 0.1, 0.9)
							icon1:ClearAllPoints()
							icon1:SetPoint("TOPLEFT", icon1.overlay, 2, -2)
							icon1:SetPoint("BOTTOMRIGHT", icon1.overlay, -2, 2)
							icon1.styled = true
						end

						if not icon2.styled then
							icon2:SetTexCoord(0.1, 0.9, 0.1, 0.9)
							icon2:ClearAllPoints()
							icon2:SetPoint("TOPLEFT", icon2.overlay, 2, -2)
							icon2:SetPoint("BOTTOMRIGHT", icon2.overlay, -2, 2)
							icon2.styled = true
						end

						if not tbar.styled then
							tbar:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
							tbar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
							tbar.styled = true
						end

						if not name.styled then
							name:ClearAllPoints()
							name:SetPoint("LEFT", frame, "LEFT", 4, 0)
							name:SetWidth(165)
							name:SetHeight(8)
							name:SetFont(C.font.stylization_font, C.font.stylization_font_size, C.font.stylization_font_style)
							name:SetShadowOffset(C.font.stylization_font_shadow and 1 or 0, C.font.stylization_font_shadow and -1 or 0)
							name:SetJustifyH("LEFT")
							name.SetFont = T.dummy
							name.styled = true
						end

						if not timer.styled then
							timer:ClearAllPoints()
							timer:SetPoint("RIGHT", frame, "RIGHT", -1, 0)
							timer:SetFont(C.font.stylization_font, C.font.stylization_font_size, C.font.stylization_font_style)
							timer:SetShadowOffset(C.font.stylization_font_shadow and 1 or 0, C.font.stylization_font_shadow and -1 or 0)
							timer:SetJustifyH("RIGHT")
							timer.SetFont = T.dummy
							timer.styled = true
						end

						if DBT.Options.IconLeft then icon1:Show() icon1.overlay:Show() else icon1:Hide() icon1.overlay:Hide() end
						if DBT.Options.IconRight then icon2:Show() icon2.overlay:Show() else icon2:Hide() icon2.overlay:Hide() end
						tbar:SetAlpha(1)
						frame:SetAlpha(1)
						frame:Show()
						bar:Update(0)
						bar.injected = true
					end
					bar:ApplyStyle()
				end
			end
		end
		if DBM then
			hooksecurefunc(DBT, "CreateBar", SkinBars)

			hooksecurefunc(DBM.RangeCheck, "Show", function()
				if DBMRangeCheck then
					DBMRangeCheck:SetTemplate("Transparent")
				end
				if DBMRangeCheckRadar then
					DBMRangeCheckRadar:SetTemplate("Transparent")
				end
			end)

			hooksecurefunc(DBM.InfoFrame, "Show", function()
				if DBMInfoFrame then
					DBMInfoFrame:SetTemplate("Transparent")
				end
			end)
		end
		local replace = string.gsub
		local old = RaidNotice_AddMessage
		RaidNotice_AddMessage = function(noticeFrame, textString, colorInfo)
			if textString:find(" |T") then
				textString = replace(textString, "(:12:12)", ":13:13:0:0:64:64:5:59:5:59")
			end
			return old(noticeFrame, textString, colorInfo)
		end
	end
	if C_AddOns.IsAddOnLoaded("DBM-GUI") then
		tinsert(UISpecialFrames, "DBM_GUI_OptionsFrame")
		_G["DBM_GUI_OptionsFrame"]:StripTextures()
		_G["DBM_GUI_OptionsFrame"]:SetTemplate("Transparent")
		_G["DBM_GUI_OptionsFramePanelContainer"]:SetTemplate("Overlay")

		_G["DBM_GUI_OptionsFrameTab1"]:ClearAllPoints()
		_G["DBM_GUI_OptionsFrameTab1"]:SetPoint("TOPLEFT", _G["DBM_GUI_OptionsFrameList"], "TOPLEFT", 10, 30)
		_G["DBM_GUI_OptionsFrameTab2"]:ClearAllPoints()
		_G["DBM_GUI_OptionsFrameTab2"]:SetPoint("TOPLEFT", _G["DBM_GUI_OptionsFrameTab1"], "TOPRIGHT", 6, 0)

		_G["DBM_GUI_OptionsFrameList"]:HookScript("OnShow", function(self) self:SetTemplate("Overlay") end)
		_G["DBM_GUI_OptionsFrameDBMOptions"]:HookScript("OnShow", function(self) self:SetTemplate("Overlay") end)

		if DBM_GUI_OptionsFrameClosePanelButton then
			T.SkinCloseButton(DBM_GUI_OptionsFrameClosePanelButton)
		end

		local buttons = {
			"DBM_GUI_OptionsFrameWebsiteButton",
			"DBM_GUI_OptionsFrameOkay"
		}

		for i = 1, #buttons do
			local button = _G[buttons[i]]
			if button and not button.overlay then
				button:SkinButton(true)
			end
		end

		DBM_GUI_OptionsFrameTab1:SetPoint("TOPLEFT", DBM_GUI_OptionsFrameList, "TOPLEFT", 10, 38)

		local tabs = {
			"DBM_GUI_OptionsFrameTab1",
			"DBM_GUI_OptionsFrameTab2",
			"DBM_GUI_OptionsFrameTab3",
			"DBM_GUI_OptionsFrameTab4",
			"DBM_GUI_OptionsFrameTab5"
		}

		for i = 1, #tabs do
			local tab = _G[tabs[i]]
			if tab then
				T.SkinTab(tab, true)
			end
		end

		local scrollBars = {
			DBM_GUI_OptionsFrameListScrollBar,
			DBM_GUI_OptionsFramePanelContainerFOVScrollBar
		}

		for i = 1, #scrollBars do
			local scrollBar = scrollBars[i]
			if scrollBar then
				T.SkinScrollBar(scrollBar)
			end
		end
	end
end)

----------------------------------------------------------------------------------------
--	DBM settings(by ALZA and help from Affli)
----------------------------------------------------------------------------------------
function T.UploadDBM()
	if C_AddOns.IsAddOnLoaded("DBM-Core") then
		DBM_UseDualProfile = false
		DBM_AllSavedOptions["Default"].Enabled = true
		DBM_AllSavedOptions["Default"].ShowMinimapButton = true
		DBM_AllSavedOptions["Default"].WarningIconLeft = false
		DBM_AllSavedOptions["Default"].WarningIconRight = false
		DBM_AllSavedOptions["Default"].WarningColors = {
			{["b"] = T.color.b, ["g"] = T.color.g, ["r"] = T.color.r,},
			{["b"] = T.color.b, ["g"] = T.color.g, ["r"] = T.color.r,},
			{["b"] = T.color.b, ["g"] = T.color.g, ["r"] = T.color.r,},
			{["b"] = T.color.b, ["g"] = T.color.g, ["r"] = T.color.r,},
		}
		DBM_AllSavedOptions["Default"].RangeFrameX = 244
		DBM_AllSavedOptions["Default"].RangeFramePoint = "LEFT"
		DBM_AllSavedOptions["Default"].ShowSpecialWarnings = true
		DBM_AllSavedOptions["Default"].SpecialWarningFont = C.media.normal_font
		DBM_AllSavedOptions["Default"].SpecialWarningFontSize = 50
		DBM_AllSavedOptions["Default"].SpecialWarningX = 0
		DBM_AllSavedOptions["Default"].SpecialWarningY = 75
		DBM_AllSavedOptions["Default"].InfoFrameX = -268
		DBM_AllSavedOptions["Default"].RangeFrameX = 244
		DBM_AllSavedOptions["Default"].RangeFrameY = 101
		DBM_AllSavedOptions["Default"].SpecialWarningFlashAlph3 = 0.4
		DBM_AllSavedOptions["Default"].InfoFramePoint = "RIGHT"
		DBM_AllSavedOptions["Default"].InfoFrameY = 123
		DBM_AllSavedOptions["Default"].RangeFrameRadarPoint = "RIGHT"
		DBM_AllSavedOptions["Default"].RangeFrameRadarX = -389
		DBM_AllSavedOptions["Default"].HPFrameMaxEntries = 5
		DBM_AllSavedOptions["Default"].RangeFramePoint = "LEFT"
		DBM_AllSavedOptions["Default"].RangeFrameRadarY = 76
		DBM_AllSavedOptions["Default"].RangeFrameFrames = "radar"
		
		DBT_AllPersistentOptions["Default"]["DBM"].StartColorR = T.color.r
		DBT_AllPersistentOptions["Default"]["DBM"].StartColorG = T.color.g
		DBT_AllPersistentOptions["Default"]["DBM"].StartColorB = T.color.b
		DBT_AllPersistentOptions["Default"]["DBM"].EndColorR = T.color.r
		DBT_AllPersistentOptions["Default"]["DBM"].EndColorG = T.color.g
		DBT_AllPersistentOptions["Default"]["DBM"].EndColorB = T.color.b
		DBT_AllPersistentOptions["Default"]["DBM"].Scale = 1
		DBT_AllPersistentOptions["Default"]["DBM"].HugeScale = 1
		DBT_AllPersistentOptions["Default"]["DBM"].BarXOffset = 0
		DBT_AllPersistentOptions["Default"]["DBM"].BarYOffset = 10
		DBT_AllPersistentOptions["Default"]["DBM"].Font = C.font.stylization_font
		DBT_AllPersistentOptions["Default"]["DBM"].FontSize = C.font.stylization_font_size
		DBT_AllPersistentOptions["Default"]["DBM"].Width = 189
		DBT_AllPersistentOptions["Default"]["DBM"].TimerX = -180
		DBT_AllPersistentOptions["Default"]["DBM"].TimerPoint = "BOTTOMRIGHT"
		DBT_AllPersistentOptions["Default"]["DBM"].FillUpBars = true
		DBT_AllPersistentOptions["Default"]["DBM"].IconLeft = true
		DBT_AllPersistentOptions["Default"]["DBM"].ExpandUpwardsLarge = true
		DBT_AllPersistentOptions["Default"]["DBM"].ExpandUpwards = true
		DBT_AllPersistentOptions["Default"]["DBM"].Texture = C.media.texture
		DBT_AllPersistentOptions["Default"]["DBM"].IconRight = false
		DBT_AllPersistentOptions["Default"]["DBM"].HugeBarXOffset = 0
		DBT_AllPersistentOptions["Default"]["DBM"].HugeBarsEnabled = true
		DBT_AllPersistentOptions["Default"]["DBM"].HugeWidth = 268
		DBT_AllPersistentOptions["Default"]["DBM"].HugeTimerX = 14
		DBT_AllPersistentOptions["Default"]["DBM"].HugeTimerPoint = "CENTER"
		DBT_AllPersistentOptions["Default"]["DBM"].HugeBarYOffset = 12

		DBM_AllSavedOptions["Default"].RangeFrameY = 101
		DBT_AllPersistentOptions["Default"]["DBM"].TimerY = 190
		DBT_AllPersistentOptions["Default"]["DBM"].HugeTimerY = -226
	end	
		DBM_AllSavedOptions["Default"].InstalledBars = 2
end

StaticPopupDialogs.SETTINGS_DBM = {
	text = L_POPUP_SETTINGS_DBM,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() T.UploadDBM() ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

----------------------------------------------------------------------------------------
--	On logon function
----------------------------------------------------------------------------------------
local OnLogon = CreateFrame("Frame")
OnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
OnLogon:SetScript("OnEvent", function(self)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	if C_AddOns.IsAddOnLoaded("DBM-Core") then
		if DBM_AllSavedOptions["Default"].InstalledBars ~= 2 then
			StaticPopup_Show("SETTINGS_DBM")
		end
	end
end)
