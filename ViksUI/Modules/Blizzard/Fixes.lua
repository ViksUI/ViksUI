local T, C, L = unpack(ViksUI)


----------------------------------------------------------------------------------------
--	Fix DeclensionFrame strata
----------------------------------------------------------------------------------------
if T.client == "ruRU" then
	_G["DeclensionFrame"]:SetFrameStrata("HIGH")
end

----------------------------------------------------------------------------------------
--	Fix ShouldShowMawBuffs taint
--	Wrap ShouldShowMawBuffs to prevent GetAuraDataByIndex from being called when
--	auras are secret (M+ start/end, Delves), avoiding the tainted access error.
----------------------------------------------------------------------------------------
if ScenarioObjectiveTracker and ScenarioObjectiveTracker.MawBuffsBlock then
	local MawBuffsBlock = ScenarioObjectiveTracker.MawBuffsBlock

	-- Wrap ShouldShowMawBuffs to return false when auras are secret
	if ShouldShowMawBuffs and type(ShouldShowMawBuffs) == "function" then
		local origShouldShow = ShouldShowMawBuffs
		ShouldShowMawBuffs = function(...)
			if C_Secrets and C_Secrets.ShouldAurasBeSecret and C_Secrets.ShouldAurasBeSecret() then
				return false
			end
			return origShouldShow(...)
		end
	end

	-- Also wrap MawBuffsBlock.Update as a fallback
	local origUpdate = MawBuffsBlock.Update
	MawBuffsBlock.Update = function(self, ...)
		if C_Secrets and C_Secrets.ShouldAurasBeSecret and C_Secrets.ShouldAurasBeSecret() then
			self:Hide()
			return
		end
		return origUpdate(self, ...)
	end
end

----------------------------------------------------------------------------------------
-- !!NoTaint2 (Code by warbaby 2022-11 http://abyui.top https://github.com/aby-ui)
----------------------------------------------------------------------------------------
if not NoTaint2_Proc_ResetActionButtonAction then
	NoTaint2_Proc_ResetActionButtonAction = 1

	-- use /run ActionButton2.action = 2 ActionButton2:UpdateAction() to test

	function NoTaint2_ResetActionButtonAction(self)
		local ok = issecurevariable(self, "action")
		if not ok and not InCombatLockdown() then
			self.action=nil
			self:SetAttribute("_aby", "action")
		end
	end

	for _, v in ipairs(ActionBarButtonEventsFrame.frames) do
		hooksecurefunc(v, "UpdateAction", NoTaint2_ResetActionButtonAction)
	end

	local f1 = CreateFrame("Frame")
	f1:RegisterEvent("PLAYER_REGEN_ENABLED")
	f1:SetScript("OnEvent", function()
		for _, v in ipairs(ActionBarButtonEventsFrame.frames) do
			NoTaint2_ResetActionButtonAction(v)
		end
	end)
end

if not NoTaint2_CleanStaticPopups then
	--code since !NoTaint, test: /run StaticPopup_Show('PARTY_INVITE',"a") /dump issecurevariable(StaticPopup1, "which")
	function NoTaint2_CleanStaticPopups()
		for index = 1, 4, 1 do
			local frame = _G["StaticPopup"..index];
			if not issecurevariable(frame, "which") then
				if frame:IsShown() then
					local info = StaticPopupDialogs[frame.which];
					if info and not issecurevariable(info, "OnCancel") then
						info.OnCancel()
					end
					frame:Hide()
				end
				frame.which = nil
			end
		end
	end

	function NoTaint2_CleanDropDownList()
		local frameToShow = LFDQueueFrameTypeDropDown
		if not frameToShow then return end
		local parent = frameToShow:GetParent()
		frameToShow:SetParent(nil) --to show
		--RequestLFDPlayerLockInfo() --to trigger LFG_LOCK_INFO_RECEIVED
		frameToShow:SetParent(parent)
	end

	local global_obj_name = {
		UIDROPDOWNMENU_MAXBUTTONS = 1,
		UIDROPDOWNMENU_MAXLEVELS = 1,
		UIDROPDOWNMENU_OPEN_MENU = 1,
		UIDROPDOWNMENU_INIT_MENU = 1,
		OBJECTIVE_TRACKER_UPDATE_REASON = 1,
	}

	function NoTaint2_CleanGlobal()
		for k, _ in pairs(global_obj_name) do
			if not issecurevariable(k) then
				--print("clean", k, issecurevariable(k))
				_G[k] = nil
			end
		end
		--ObjectiveTrackerFrame.lastMapID = nil
	end

	hooksecurefunc(EditModeManagerFrame, "ClearActiveChangesFlags", function(self)
		for _, systemFrame in ipairs(self.registeredSystemFrames) do
			systemFrame:SetHasActiveChanges(nil);
		end
		self:SetHasActiveChanges(nil);
	end)

	-- not sure if this is of any use. PetFrame and ActionBar call it.
	hooksecurefunc(EditModeManagerFrame, "HideSystemSelections", function(self)
		if self.editModeActive == false then
			self.editModeActive = nil
		end
	end)

	hooksecurefunc(EditModeManagerFrame, "IsEditModeLocked", function()
		NoTaint2_CleanGlobal()
	end)

	local function cleanAll()
		NoTaint2_CleanDropDownList()
		NoTaint2_CleanStaticPopups()
		NoTaint2_CleanGlobal()
	end

	local Origin_IsShown = EditModeManagerFrame.IsShown
	hooksecurefunc(EditModeManagerFrame, "IsShown", function(self)
		if Origin_IsShown(self) then return end
		local stack = debugstack(4)
		--call from UIParent.lua if ( not frame or frame:IsShown() ) then
		--different when hooked
		if stack and stack:find('[string "=[C]"]: in function `ShowUIPanel\'\n', 1, true) then
			cleanAll()
		end
	end)
end

if not NoTaint2_Proc_StopEnterWorldLayout then
	NoTaint2_Proc_StopEnterWorldLayout = 1
	local f2 = CreateFrame("Frame")
	f2:RegisterEvent("PLAYER_LEAVING_WORLD")
	f2:RegisterEvent("PLAYER_ENTERING_WORLD")
	f2:SetScript("OnEvent", function(_, event, ...)
		if event == "PLAYER_ENTERING_WORLD" then
			local login, reload = ...
			if not login and not reload then
				NoTaint2_CleanDropDownList()
				NoTaint2_CleanStaticPopups()
				NoTaint2_CleanGlobal()
			end
			EditModeManagerFrame:RegisterEvent("EDIT_MODE_LAYOUTS_UPDATED")
		elseif event == "PLAYER_LEAVING_WORLD" then
			EditModeManagerFrame:UnregisterEvent("EDIT_MODE_LAYOUTS_UPDATED")
		end
	end)
end

if not NoTaint2_Proc_CleanActionButtonFlyout then
	NoTaint2_Proc_CleanActionButtonFlyout = 1
	--[[------------------------------------------------------------
	this is totally magic, thanks god ObjectiveTrackerFrame is after the ActionBars
	---------------------------------------------------------------]]
	local barsToUpdate = { MainMenuBar, MultiBarBottomLeft, MultiBarBottomRight, StanceBar, PetActionBar, PossessActionBar, MultiBarRight, MultiBarLeft, MultiBar5, MultiBar6, MultiBar7 }
	for _, bar in ipairs(barsToUpdate) do
		hooksecurefunc(bar, "UpdateSpellFlyoutDirection", function(self)
			if not issecurevariable(self, "flyoutDirection") then
				self.flyoutDirection = nil
			end
			if not issecurevariable(self, "snappedToFrame") then
				self.snappedToFrame = nil
			end
		end)
	end

	hooksecurefunc("SetClampedTextureRotation", function(texture)
		local parent = texture and texture:GetParent()
		if parent and parent.FlyoutArrowPushed and parent.FlyoutArrowHighlight then
			if not issecurevariable(texture, "rotationDegrees") then
				texture.rotationDegrees = nil
			end
		end
	end)
end

----------------------------------------------------------------------------------------
--	Fix WorldMap SetPassThroughButtons taint during combat
--	ViksUI skinning taints WorldMapFrame, and when combat starts while the map is
--	open, AcquirePin -> CheckMouseButtonPassthrough tries to call the protected
--	SetPassThroughButtons(). Replace with a wrapper that skips during combat.
----------------------------------------------------------------------------------------
if MapCanvas_DataProviderBase and MapCanvas_DataProviderBase.CheckMouseButtonPassthrough then
	local origCheck = MapCanvas_DataProviderBase.CheckMouseButtonPassthrough
	function MapCanvas_DataProviderBase:CheckMouseButtonPassthrough(...)
		if InCombatLockdown() then return end
		return origCheck(self, ...)
	end
end

----------------------------------------------------------------------------------------
--	Fix UIWidgetTemplateTextWithState taint from WorldMap skin
--	ViksUI's WorldMap skin taints the frame hierarchy. When GameTooltip_AddWidgetSet
--	runs for AreaPOI tooltips, UIWidgetTemplateTextWithState.Setup tries to do
--	arithmetic on a tainted textHeight. Wrap to catch and suppress the error.
----------------------------------------------------------------------------------------
if UIWidgetTemplateTextWithState and UIWidgetTemplateTextWithState.Setup then
	local origWidgetSetup = UIWidgetTemplateTextWithState.Setup
	function UIWidgetTemplateTextWithState:Setup(widgetInfo, ...)
		local ok = pcall(origWidgetSetup, self, widgetInfo, ...)
		if not ok then
			self:SetHeight(0)
			self:Hide()
		end
	end
end

----------------------------------------------------------------------------------------
--	Fix blizzard ui error (from NDui)
----------------------------------------------------------------------------------------
--	SetupTextureCoordinates taint fix is now handled per-frame in Core/API.lua.
--	SafeSetupTextureCoordinates is applied to each BackdropTemplate frame created
--	by SetTemplate, CreatePanel, CreateBorder, and CreateShadow, avoiding the global
--	mixin override that previously tainted all BackdropTemplate frames including
--	ObjectiveTracker.