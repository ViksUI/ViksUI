local T, C, L = unpack(ViksUI)
if C.actionbar.enable ~= true or addon == "bartender" then return end

----------------------------------------------------------------------------------------
--	Hide Blizzard ActionBars stuff(by Tukz)
----------------------------------------------------------------------------------------
local MainMenuBar = MainMenuBar and MainMenuBar or MainActionBar -- BETA
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
	MainMenuBar:SetScale(0.00001)
	MainMenuBar:EnableMouse(false)
	OverrideActionBar:SetScale(0.00001)
	OverrideActionBar:EnableMouse(false)
	PetActionBar:EnableMouse(false)
	PetActionBar:UnregisterAllEvents()
	StanceBar:EnableMouse(false)
	StanceBar:UnregisterAllEvents()
	MicroButtonAndBagsBar:SetScale(0.00001)
	MicroButtonAndBagsBar:EnableMouse(false)
	MicroButtonAndBagsBar:ClearAllPoints()
	MicroButtonAndBagsBar:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, -99) -- Prevent scaling for right panels
	BagsBar:Hide()
	BagsBar:UnregisterAllEvents()

	if not C.actionbar.micromenu then
		MicroMenu:Hide()
		PlayerSpellsMicroButton:ClearAllPoints()
		PlayerSpellsMicroButton:SetPoint("TOP", UIParent, "TOP", 0, 100) -- hide missing talent alert
	end

	MainMenuBar:SetMovable(true)
	MainMenuBar:SetUserPlaced(true)
	MainMenuBar.ignoreFramePositionManager = true
	MainMenuBar:SetAttribute("ignoreFramePositionManager", true)

	EditModeUtil.GetRightActionBarWidth = function() return 100 end -- prevent error in GetRightContainerAnchor, abs is nil
	-- EditModeUtil.GetBottomActionBarHeight = function() return 225 end

	local elements = {
		MainMenuBar, MainMenuBarArtFrame, OverrideActionBar, PossessBarFrame,
		MultiBarBottomLeft.QuickKeybindGlow, MultiBarLeft.QuickKeybindGlow, MultiBarBottomRight.QuickKeybindGlow, MultiBarRight.QuickKeybindGlow,
		StatusTrackingBarManager
	}

	if not C_ClassTrial.IsClassTrialCharacter() then
		tinsert(elements, IconIntroTracker)
	end

	for _, element in pairs(elements) do
		if element.UnregisterAllEvents then
			element:UnregisterAllEvents()
		end

		if element ~= MainMenuBar then
			element:Hide()
		end
		element:SetAlpha(0)
	end

	for i = 1, 6 do
		local b = _G["OverrideActionBarButton"..i]
		b:UnregisterAllEvents()
		b:SetAttribute("statehidden", true)
		b:SetAttribute("showgrid", 1)
	end

	hooksecurefunc("TalentFrame_LoadUI", function()
		PlayerTalentFrame:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	end)

	-- Fixed SetPointBase and ShowBase taints after finish Pet Battle, entering new combat and summon Hunter pet.
	--FIXME ActionBarController:UnregisterEvent("UPDATE_VEHICLE_ACTIONBAR")
	-- ActionBarController:UnregisterEvent("UPDATE_OVERRIDE_ACTIONBAR")
end)

----------------------------------------------------------------------------------------
--	Set mouseover for bars
----------------------------------------------------------------------------------------
function RightBarMouseOver(alpha)
	RightActionBarAnchor:SetAlpha(alpha)
	PetActionBarAnchor:SetAlpha(alpha)
	StanceBarAnchor:SetAlpha(alpha)

	if MultiBarLeft:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBarLeftButton"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBarLeftButton"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
		MultiBarLeft:SetAlpha(alpha)
	end

	if MultiBarRight:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBarRightButton"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBarRightButton"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
		MultiBarRight:SetAlpha(alpha)
	end

	if C.actionbar.rightbars > 2 then
		if MultiBar5:IsShown() then
			for i = 1, 12 do
				local b = _G["MultiBar5Button"..i]
				b:SetAlpha(alpha)
				local c = _G["MultiBar5Button"..i.."Cooldown"]
				T.HideSpiral(c, alpha)
			end
			MultiBar5:SetAlpha(alpha)
		end
	end

	if C.actionbar.petbar_horizontal == false and C.actionbar.petbar_hide == false then
		if PetHolder:IsShown() then
			for i = 1, NUM_PET_ACTION_SLOTS do
				local b = _G["PetActionButton"..i]
				b:SetAlpha(alpha)
				local c = _G["PetActionButton"..i.."Cooldown"]
				T.HideSpiral(c, alpha)
			end
			PetHolder:SetAlpha(alpha)
		end
	end

	if C.actionbar.stancebar_horizontal == false and C.actionbar.stancebar_hide == false then
		if StanceHolder:IsShown() then
			for i = 1, 10 do
				local b = _G["StanceButton"..i]
				b:SetAlpha(alpha)
				local c = _G["StanceButton"..i.."Cooldown"]
				T.HideSpiral(c, alpha)
			end
			StanceHolder:SetAlpha(alpha)
		end
	end
end

function StanceBarMouseOver(alpha)
	for i = 1, 10 do
		local b = _G["StanceButton"..i]
		b:SetAlpha(alpha)
		local c = _G["StanceButton"..i.."Cooldown"]
		T.HideSpiral(c, alpha)
	end
	StanceHolder:SetAlpha(alpha)
end

function PetBarMouseOver(alpha)
	for i = 1, NUM_PET_ACTION_SLOTS do
		local b = _G["PetActionButton"..i]
		b:SetAlpha(alpha)
		local c = _G["PetActionButton"..i.."Cooldown"]
		T.HideSpiral(c, alpha)
	end
	PetHolder:SetAlpha(alpha)
end

if C.actionbar.rightbars_mouseover == true then
	RightActionBarAnchor:SetAlpha(0)
	RightActionBarAnchor:SetScript("OnEnter", function() RightBarMouseOver(1) end)
	RightActionBarAnchor:SetScript("OnLeave", function() if not HoverBind.enabled then RightBarMouseOver(0) end end)
end

function BottomBarMouseOver(alpha)
	for i = 1, 12 do
		local b = _G["ActionButton"..i]
		b:SetAlpha(alpha)
		local c = _G["ActionButton"..i.."Cooldown"]
		T.HideSpiral(c, alpha)
	end

	if C.actionbar.bottombars > 1 and MultiBarBottomLeft:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBarBottomLeftButton"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBarBottomLeftButton"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
	end

	if C.actionbar.bottombars > 2 and MultiBarBottomRight:IsShown() then
		if C.actionbar.toggle_mode == true and ViksUISettingsPerChar.BottomBars == 1 then
			for i = 4, 6 do
				local b = _G["MultiBarBottomRightButton"..i]
				b:SetAlpha(alpha)
				local c = _G["MultiBarBottomRightButton"..i.."Cooldown"]
				T.HideSpiral(c, alpha)
			end

			for i = 10, 12 do
				local b = _G["MultiBarBottomRightButton"..i]
				b:SetAlpha(alpha)
				local c = _G["MultiBarBottomRightButton"..i.."Cooldown"]
				T.HideSpiral(c, alpha)
			end
		else
			for i = 1, 12 do
				local b = _G["MultiBarBottomRightButton"..i]
				b:SetAlpha(alpha)
				local c = _G["MultiBarBottomRightButton"..i.."Cooldown"]
				T.HideSpiral(c, alpha)
			end
		end
	end
end

if C.actionbar.bottombars_mouseover then
	ActionBarAnchor:SetScript("OnEnter", function() BottomBarMouseOver(1) end)
	ActionBarAnchor:SetScript("OnLeave", function() if not HoverBind.enabled then BottomBarMouseOver(0) end end)

	if C.actionbar.split_bars == true then
		SplitBarLeft:SetScript("OnEnter", function() BottomBarMouseOver(1) end)
		SplitBarLeft:SetScript("OnLeave", function() if not HoverBind.enabled then BottomBarMouseOver(0) end end)

		SplitBarRight:SetScript("OnEnter", function() BottomBarMouseOver(1) end)
		SplitBarRight:SetScript("OnLeave", function() if not HoverBind.enabled then BottomBarMouseOver(0) end end)
	end
end

function Bar1MouseOver(alpha)
	for i = 1, 12 do
		local b = _G["ActionButton"..i]
		b:SetAlpha(alpha)
		local c = _G["ActionButton"..i.."Cooldown"]
		T.HideSpiral(c, alpha)
	end
end

function Bar2MouseOver(alpha)
	if MultiBarBottomLeft:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBarBottomLeftButton"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBarBottomLeftButton"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
	end
end

function Bar3MouseOver(alpha)
	if MultiBarLeft:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBarLeftButton"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBarLeftButton"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
	end
end

function Bar4MouseOver(alpha)
	if MultiBarRight:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBarRightButton"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBarRightButton"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
	end
end

function Bar5MouseOver(alpha)
	if MultiBarBottomRight:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBarBottomRightButton"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBarBottomRightButton"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
	end
end

function Bar6MouseOver(alpha)
	if MultiBar5:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBar6Button"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBar6Button"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
	end
end

function Bar7MouseOver(alpha)
	if MultiBar6:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBar6Button"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBar6Button"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
	end
end

function Bar8MouseOver(alpha)
	if MultiBar7:IsShown() then
		for i = 1, 12 do
			local b = _G["MultiBar7Button"..i]
			b:SetAlpha(alpha)
			local c = _G["MultiBar7Button"..i.."Cooldown"]
			T.HideSpiral(c, alpha)
		end
	end
end

----------------------------------------------------------------------------------------
--	Fix cooldown spiral alpha (WoD bug)
----------------------------------------------------------------------------------------
function T.HideSpiral(f, alpha)
	f:SetSwipeColor(0, 0, 0, alpha * 0.8)
	f:SetDrawBling(alpha == 1)
end

local EventSpiral = CreateFrame("Frame")
EventSpiral:RegisterEvent("PLAYER_ENTERING_WORLD")
EventSpiral:SetScript("OnEvent", function()
	if C.actionbar.rightbars_mouseover == true then
		RightBarMouseOver(0)
	end

	if C.actionbar.petbar_mouseover == true and C.actionbar.petbar_horizontal == true and C.actionbar.petbar_hide ~= true then
		PetBarMouseOver(0)
	end

	if C.actionbar.stancebar_mouseover == true and C.actionbar.stancebar_horizontal == true and C.actionbar.stancebar_hide ~= true then
		StanceBarMouseOver(C.actionbar.stancebar_mouseover_alpha)
	end

	if C.actionbar.bottombars_mouseover then
		BottomBarMouseOver(0)
	end

	if C.actionbar.editor then
		if C.actionbar.bar1_mouseover then
			Bar1MouseOver(0)
		end

		if C.actionbar.bar2_mouseover then
			Bar2MouseOver(0)
		end

		if C.actionbar.bar3_mouseover then
			Bar3MouseOver(0)
		end

		if C.actionbar.bar4_mouseover then
			Bar4MouseOver(0)
		end

		if C.actionbar.bar5_mouseover then
			Bar5MouseOver(0)
		end

		if C.actionbar.bar6_mouseover then
			Bar6MouseOver(0)
		end
	end

	if C.actionbar.bar7_mouseover then
		Bar7MouseOver(0)
	end

	if C.actionbar.bar8_mouseover then
		Bar8MouseOver(0)
	end

	EventSpiral:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)

if (C.actionbar.rightbars_mouseover == true and C.actionbar.petbar_horizontal == false and C.actionbar.petbar_hide == false) or (C.actionbar.petbar_mouseover == true and C.actionbar.petbar_horizontal == true and C.actionbar.petbar_hide == false) then
	local EventPetSpiral = CreateFrame("Frame")
	EventPetSpiral:RegisterEvent("PET_BAR_UPDATE_COOLDOWN")
	EventPetSpiral:SetScript("OnEvent", function()
		for i = 1, NUM_PET_ACTION_SLOTS do
			local c = _G["PetActionButton"..i.."Cooldown"]
			T.HideSpiral(c, 0)
		end
		EventPetSpiral:UnregisterEvent("PET_BAR_UPDATE_COOLDOWN")
	end)
end

----------------------------------------------------------------------------------------
--	Show grid function
----------------------------------------------------------------------------------------
if not C.actionbar.show_grid then
	local allButtons = {}
	for i = 1, 12 do
		local button = _G[format("ActionButton%d", i)]
		tinsert(allButtons, button)

		local button = _G[format("MultiBarRightButton%d", i)]
		tinsert(allButtons, button)

		button = _G[format("MultiBarBottomRightButton%d", i)]
		tinsert(allButtons, button)

		button = _G[format("MultiBarLeftButton%d", i)]
		tinsert(allButtons, button)

		button = _G[format("MultiBarBottomLeftButton%d", i)]
		tinsert(allButtons, button)

		button = _G[format("MultiBar5Button%d", i)]
		tinsert(allButtons, button)

		button = _G[format("MultiBar6Button%d", i)]
		tinsert(allButtons, button)

		button = _G[format("MultiBar7Button%d", i)]
		tinsert(allButtons, button)
	end

	local frame = CreateFrame("Frame")
	frame:RegisterEvent("ACTIONBAR_SHOWGRID")
	frame:RegisterEvent("ACTIONBAR_HIDEGRID")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:RegisterEvent("ACTIONBAR_PAGE_CHANGED")
	frame:RegisterEvent("ACTIONBAR_UPDATE_STATE")
	frame:RegisterEvent("UPDATE_VEHICLE_ACTIONBAR")
	frame:SetScript("OnEvent", function(_, event)
		if event == "ACTIONBAR_SHOWGRID" then
			for i = 1, #allButtons do
				allButtons[i]:SetAlpha(1)
			end
		elseif event == "ACTIONBAR_PAGE_CHANGED" or event == "ACTIONBAR_UPDATE_STATE" or event == "UPDATE_VEHICLE_ACTIONBAR" then
			C_Timer.After(0.02, function()
				for i = 1, #allButtons do
					local button = allButtons[i]
					button:SetAlpha(1)
					if not button:HasAction() then
						button:SetAlpha(0)
					end
				end
			end)
		else
			C_Timer.After(0.05, function()
				for i = 1, #allButtons do
					local button = allButtons[i]
					if not button:HasAction() then
						button:SetAlpha(0)
					end
				end
			end)
		end
	end)
end

----------------------------------------------------------------------------------------
--	Pet/StanceBar style functions
----------------------------------------------------------------------------------------
T.ShiftBarUpdate = function()
	local numForms = GetNumShapeshiftForms()
	local texture, isActive, isCastable
	local button, icon, cooldown
	local start, duration, enable
	for i = 1, 10 do
		button = _G["StanceButton"..i]
		icon = _G["StanceButton"..i.."Icon"]
		if i <= numForms then
			texture, isActive, isCastable = GetShapeshiftFormInfo(i)
			icon:SetTexture(texture)

			cooldown = _G["StanceButton"..i.."Cooldown"]
			if texture then
				cooldown:SetAlpha(1)
			else
				cooldown:SetAlpha(0)
			end

			start, duration, enable = GetShapeshiftFormCooldown(i)
			CooldownFrame_Set(cooldown, start, duration, enable)

			if isActive then
				button:SetChecked(true)
			else
				button:SetChecked(false)
			end

			if isCastable then
				icon:SetVertexColor(1.0, 1.0, 1.0)
			else
				icon:SetVertexColor(0.4, 0.4, 0.4)
			end
		end
	end
end

T.PetBarUpdate = function()
	local petActionButton, petActionIcon, petAutoCastOverlay
	for i = 1, NUM_PET_ACTION_SLOTS, 1 do
		local buttonName = "PetActionButton"..i
		petActionButton = _G[buttonName]
		petActionIcon = _G[buttonName.."Icon"]
		petAutoCastOverlay = _G["PetActionButton"..i].AutoCastOverlay
		local name, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i)

		if not isToken then
			petActionIcon:SetTexture(texture)
			petActionButton.tooltipName = name
		else
			petActionIcon:SetTexture(_G[texture])
			petActionButton.tooltipName = _G[name]
		end

		petActionButton.isToken = isToken

		if isActive and name ~= "PET_ACTION_FOLLOW" then
			petActionButton:SetChecked(true)
			if IsPetAttackAction(i) then
				petActionButton:StartFlash()
				petActionButton:GetCheckedTexture():SetAlpha(0.5)
			end
		else
			petActionButton:SetChecked(false)
			if IsPetAttackAction(i) then
				petActionButton:StopFlash()
				petActionButton:GetCheckedTexture():SetAlpha(1.0)
			end
		end

		if petAutoCastOverlay then
			petAutoCastOverlay:SetShown(autoCastAllowed)
			petAutoCastOverlay:ShowAutoCastEnabled(autoCastEnabled)
		end

		if name then
			if not C.actionbar.show_grid then
				petActionButton:SetAlpha(1)
			end
		else
			if not C.actionbar.show_grid then
				petActionButton:SetAlpha(0)
			end
		end

		if texture then
			if GetPetActionSlotUsable(i) then
				SetDesaturation(petActionIcon, nil)
			else
				SetDesaturation(petActionIcon, 1)
			end
			petActionIcon:Show()
		else
			petActionIcon:Hide()
		end

		if not PetHasActionBar() and texture and name ~= "PET_ACTION_FOLLOW" then
			petActionButton:StopFlash()
			SetDesaturation(petActionIcon, 1)
			petActionButton:SetChecked(false)
		end
	end
end