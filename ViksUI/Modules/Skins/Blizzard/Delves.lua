local T, C, L = unpack(ViksUI)
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Delves skin
----------------------------------------------------------------------------------------
local function LoadFirstSkin()
	local frame = _G.DelvesCompanionConfigurationFrame
	T.SkinFrame(frame)
	frame.CompanionConfigShowAbilitiesButton:SkinButton()
	frame.CompanionPortraitFrame:SetFrameLevel(10)
	frame.CompanionPortraitFrame.Border:SetAlpha(0)
	frame.CompanionPortraitFrame:SetScale(0.6)
	frame.CompanionPortraitFrame:ClearAllPoints()
	frame.CompanionPortraitFrame:SetPoint("TOP", frame, "TOP", 0, -40)
	frame.CompanionExperienceRingFrame:SetScale(0.6)

	local function SkinOptionSlot(frame, skip)
		local option = frame.OptionsList
		option:StripTextures()
		option:SetTemplate("Transparent")
		if not skip then
			hooksecurefunc(option.ScrollBox, "Update", function(self)
				self:ForEachFrame(function(button)
					if not button.styled then
						if button.Border then button.Border:SetAlpha(0) end
						if button.Icon then button.Icon:SkinIcon() end
						button.styled = true
					end
				end)
			end)
		end
	end

	if not T.newPatch then
		SkinOptionSlot(frame.CompanionCombatRoleSlot, true)
		SkinOptionSlot(frame.CompanionUtilityTrinketSlot)
		SkinOptionSlot(frame.CompanionCombatTrinketSlot)
	end

	local abilityFrame = _G.DelvesCompanionAbilityListFrame
	T.SkinFrame(abilityFrame)
	T.SkinDropDownBox(abilityFrame.DelvesCompanionRoleDropdown)
	T.SkinNextPrevButton(abilityFrame.DelvesCompanionAbilityListPagingControls.PrevPageButton, true)
	T.SkinNextPrevButton(abilityFrame.DelvesCompanionAbilityListPagingControls.NextPageButton)

	hooksecurefunc(abilityFrame, "UpdatePaginatedButtonDisplay", function(self)
		for _, button in pairs(self.buttons) do
			if not button.styled then
				if button.Icon then button.Icon:SkinIcon() end
				button.styled = true
			end
		end
	end)
end

T.SkinFuncs["Blizzard_DelvesCompanionConfiguration"] = LoadFirstSkin

local function LoadSecondSkin()
	local frame = _G.DelvesDifficultyPickerFrame
	T.SkinFrame(frame)

	-- 12.1: Blizzard's Delves difficulty dropdown now uses the newer
	-- DropdownButton/Menu system. ViksUI's legacy SkinDropDownBox changes
	-- frame level/arrow/background state and is not needed for the menu itself.
	-- Leave the native dropdown untouched to avoid interfering with menu
	-- generation/selection state.
	frame.EnterDelveButton:SkinButton()

	local function skinReward(rewardFrame)
		if not rewardFrame.styled then
			rewardFrame.NameFrame:SetAlpha(0)
			rewardFrame.Icon:SkinIcon()
			rewardFrame.IconBorder:SetAlpha(0)
			rewardFrame.styled = true
		end
	end

	hooksecurefunc(frame.DelveRewardsContainerFrame.ScrollBox, "Update", function(self)
		self:ForEachFrame(skinReward)
	end)
end

T.SkinFuncs["Blizzard_DelvesDifficultyPicker"] = LoadSecondSkin

local function LoadThirdSkin()
	local frame = _G.DelvesDashboardFrame
	frame.DashboardBackground:SetAlpha(0)
	frame.ButtonPanelLayoutFrame.CompanionConfigButtonPanel.CompanionConfigButton:SkinButton(nil, "Button")
	frame.ButtonPanelLayoutFrame.CompanionConfigButtonPanel.CompanionConfigButton:SetMovePoint(nil, 29)

	for _, panel in pairs({frame.ButtonPanelLayoutFrame.CompanionConfigButtonPanel, frame.ButtonPanelLayoutFrame.GreatVaultButtonPanel}) do
		panel.ButtonPanelBackground:SetAlpha(0)
		panel:CreateBackdrop("Overlay")
		panel.backdrop:SetInside(panel.ButtonPanelBackground, 6, 6)
	end
end

T.SkinFuncs["Blizzard_DelvesDashboardUI"] = LoadThirdSkin