local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	PvP skin
----------------------------------------------------------------------------------------

if C.skins.blizzard_frames ~= true then return end
local function LoadSkin()

	_G["PVPUIFrame"]:StripTextures()

	for i = 1, 2 do
		T.SkinTab(_G["PVPUIFrameTab"..i])
	end

	for i = 1, 3 do
		local bu = _G["PVPQueueFrameCategoryButton"..i]

		bu.Ring:Kill()
		bu.Background:Kill()

		bu:SetTemplate()
		bu:StyleButton()

		bu.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		bu.Icon:Point("LEFT", bu, "LEFT")
		bu.Icon:SetDrawLayer("OVERLAY")
		bu.Icon:Size(45)
		bu.Icon:ClearAllPoints()
		bu.Icon:Point("LEFT", 10, 0)
		bu.border = CreateFrame("Frame", nil, bu)
		bu.border:SetTemplate("Default")
		bu.border:SetOutside(bu.Icon)
		bu.Icon:SetParent(bu.border)
	end
--[[
	local PVPQueueFrame = _G["PVPQueueFrame"]
	PVPQueueFrameBg:Hide()
	PVPQueueFrameInsetRightBorder:Hide()
	PVPQueueFrameInsetLeftBorder:Hide()
	PVPQueueFrameInsetTopBorder:Hide()
	PVPQueueFrameInsetBottomBorder:Hide()
	PVPQueueFrameInsetBotLeftCorner:Hide()
	PVPQueueFrameInsetBotRightCorner:Hide()
	PVPQueueFrameInsetTopRightCorner:Hide()
	PVPQueueFrameInsetTopLeftCorner:Hide()

	PVPQueueFrame.HonorInset:StripTextures()
]]--
	local SeasonReward = PVPQueueFrame.HonorInset.RatedPanel.SeasonRewardFrame
	SeasonReward.CircleMask:Hide()
	SeasonReward.Ring:Hide()
	SeasonReward.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	local RewardFrameBorder = CreateFrame("Frame", nil, SeasonReward)
	RewardFrameBorder:SetTemplate("Default")
	RewardFrameBorder:SetOutside(SeasonReward.Icon)
	SeasonReward.Icon:SetParent(RewardFrameBorder)
	SeasonReward.Icon:SetDrawLayer("OVERLAY")
--[[
	-- Honor Frame
	local HonorFrame = _G["HonorFrame"]
	local Inset = HonorFrame.Inset

	for i = 1, 9 do
		select(i, Inset:GetRegions()):Hide()
	end
]]--
	T:HandleScrollBar(HonorFrameSpecificFrameScrollBar)
	T:HandleButton(HonorFrameQueueButton, true)
	T.SkinDropDownBox(HonorFrameTypeDropDown, 165)

	local BonusFrame = HonorFrame.BonusFrame
	BonusFrame:StripTextures()
	BonusFrame.ShadowOverlay:Hide()
	BonusFrame.WorldBattlesTexture:Hide()

	for _, bonusButton in pairs({"RandomBGButton", "Arena1Button", "RandomEpicBGButton", "BrawlButton"}) do
		local bu = BonusFrame[bonusButton]
		local reward = bu.Reward

		bu:StripTextures()
		bu:CreateBackdrop("Overlay")
		bu:StyleButton()
		bu.SelectedTexture:SetInside()
		bu.SelectedTexture:SetColorTexture(1, 1, 0, 0.1)

		reward:StripTextures()
		reward:SetTemplate("Default")
		reward:SetSize(40, 40)
		reward:SetPoint("RIGHT", bu, "RIGHT", -8, 0)

		reward.Icon:SetAllPoints()
		reward.Icon:SetPoint("TOPLEFT", 2, -2)
		reward.Icon:SetPoint("BOTTOMRIGHT", -2, 2)
		reward.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		reward.EnlistmentBonus:StripTextures()
		reward.EnlistmentBonus:SetTemplate("Default")
		reward.EnlistmentBonus:SetSize(20, 20)
		reward.EnlistmentBonus:SetPoint("TOPRIGHT", 2, 2)

		local EnlistmentBonusIcon = reward.EnlistmentBonus:CreateTexture(nil, nil, self)
		EnlistmentBonusIcon:SetPoint("TOPLEFT", reward.EnlistmentBonus, "TOPLEFT", 2, -2)
		EnlistmentBonusIcon:SetPoint("BOTTOMRIGHT", reward.EnlistmentBonus, "BOTTOMRIGHT", -2, 2)
		EnlistmentBonusIcon:SetTexture("Interface\\Icons\\achievement_guildperk_honorablemention_rank2")
		EnlistmentBonusIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	end

	-- Honor Frame Specific Buttons
	for _, bu in pairs(HonorFrame.SpecificFrame.buttons) do
		bu.Bg:Hide()
		bu.Border:Hide()

		bu:StripTextures()
		bu:CreateBackdrop("Overlay")
		bu:StyleButton()
		bu.SelectedTexture:SetInside()

		bu.SelectedTexture:SetColorTexture(1, 1, 0, 0.1)
		bu.Icon:SetDrawLayer("OVERLAY")
		bu:SetNormalTexture("")
		bu:SetHighlightTexture("")

		bu.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		bu.Icon:SetPoint("TOPLEFT", 5, -3)
	end

	hooksecurefunc("LFG_PermanentlyDisableRoleButton", function(self)
		if self.bg then
			self.bg:SetDesaturated(true)
		end
	end)

	-- New tiny Role icons in Bfa
	HonorFrame.TankIcon:StripTextures()
	HonorFrame.TankIcon:DisableDrawLayer("ARTWORK")
	HonorFrame.TankIcon:DisableDrawLayer("OVERLAY")

	HonorFrame.TankIcon.bg = HonorFrame.TankIcon:CreateTexture(nil, 'BACKGROUND')
	HonorFrame.TankIcon.bg:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")
	HonorFrame.TankIcon.bg:SetTexCoord(LFDQueueFrameRoleButtonTank.background:GetTexCoord())
	HonorFrame.TankIcon.bg:SetPoint("CENTER")
	HonorFrame.TankIcon.bg:SetSize(40, 40)
	HonorFrame.TankIcon.bg:SetAlpha(0.6)
	T.SkinCheckBox(HonorFrame.TankIcon.checkButton)

	HonorFrame.HealerIcon:StripTextures()
	HonorFrame.HealerIcon:DisableDrawLayer("ARTWORK")
	HonorFrame.HealerIcon:DisableDrawLayer("OVERLAY")

	HonorFrame.HealerIcon.bg = HonorFrame.HealerIcon:CreateTexture(nil, 'BACKGROUND')
	HonorFrame.HealerIcon.bg:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")
	HonorFrame.HealerIcon.bg:SetTexCoord(LFDQueueFrameRoleButtonHealer.background:GetTexCoord())
	HonorFrame.HealerIcon.bg:SetPoint("CENTER")
	HonorFrame.HealerIcon.bg:SetSize(40, 40)
	HonorFrame.HealerIcon.bg:SetAlpha(0.6)
	T.SkinCheckBox(HonorFrame.HealerIcon.checkButton)

	HonorFrame.DPSIcon:StripTextures()
	HonorFrame.DPSIcon:DisableDrawLayer("ARTWORK")
	HonorFrame.DPSIcon:DisableDrawLayer("OVERLAY")

	HonorFrame.DPSIcon.bg = HonorFrame.DPSIcon:CreateTexture(nil, 'BACKGROUND')
	HonorFrame.DPSIcon.bg:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")
	HonorFrame.DPSIcon.bg:SetTexCoord(LFDQueueFrameRoleButtonDPS.background:GetTexCoord())
	HonorFrame.DPSIcon.bg:SetPoint("CENTER")
	HonorFrame.DPSIcon.bg:SetSize(40, 40)
	HonorFrame.DPSIcon.bg:SetAlpha(0.6)
	T.SkinCheckBox(HonorFrame.DPSIcon.checkButton)

	-- Conquest Frame
	local ConquestFrame = _G["ConquestFrame"]
	local Inset = ConquestFrame.Inset

	ConquestFrame:StripTextures()
	ConquestFrame.ShadowOverlay:Hide()

	--for i = 1, 9 do
		--select(i, Inset:GetRegions()):Hide()
	--end

	T:HandleButton(ConquestJoinButton, true)

	-- New tiny Role icons in Bfa
	ConquestFrame.TankIcon:StripTextures()
	ConquestFrame.TankIcon:DisableDrawLayer("ARTWORK")
	ConquestFrame.TankIcon:DisableDrawLayer("OVERLAY")

	ConquestFrame.TankIcon.bg = ConquestFrame.TankIcon:CreateTexture(nil, 'BACKGROUND')
	ConquestFrame.TankIcon.bg:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")
	ConquestFrame.TankIcon.bg:SetTexCoord(LFDQueueFrameRoleButtonTank.background:GetTexCoord())
	ConquestFrame.TankIcon.bg:SetPoint("CENTER")
	ConquestFrame.TankIcon.bg:SetSize(40,40)
	ConquestFrame.TankIcon.bg:SetAlpha(0.6)
	T.SkinCheckBox(ConquestFrame.TankIcon.checkButton)

	ConquestFrame.HealerIcon:StripTextures()
	ConquestFrame.HealerIcon:DisableDrawLayer("ARTWORK")
	ConquestFrame.HealerIcon:DisableDrawLayer("OVERLAY")

	ConquestFrame.HealerIcon.bg = ConquestFrame.HealerIcon:CreateTexture(nil, 'BACKGROUND')
	ConquestFrame.HealerIcon.bg:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")
	ConquestFrame.HealerIcon.bg:SetTexCoord(LFDQueueFrameRoleButtonHealer.background:GetTexCoord())
	ConquestFrame.HealerIcon.bg:SetPoint("CENTER")
	ConquestFrame.HealerIcon.bg:SetSize(40, 40)
	ConquestFrame.HealerIcon.bg:SetAlpha(0.6)
	T.SkinCheckBox(ConquestFrame.HealerIcon.checkButton)

	ConquestFrame.DPSIcon:StripTextures()
	ConquestFrame.DPSIcon:DisableDrawLayer("ARTWORK")
	ConquestFrame.DPSIcon:DisableDrawLayer("OVERLAY")

	ConquestFrame.DPSIcon.bg = ConquestFrame.DPSIcon:CreateTexture(nil, 'BACKGROUND')
	ConquestFrame.DPSIcon.bg:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")
	ConquestFrame.DPSIcon.bg:SetTexCoord(LFDQueueFrameRoleButtonDPS.background:GetTexCoord())
	ConquestFrame.DPSIcon.bg:SetPoint("CENTER")
	ConquestFrame.DPSIcon.bg:SetSize(40, 40)
	ConquestFrame.DPSIcon.bg:SetAlpha(0.6)
	T.SkinCheckBox(ConquestFrame.DPSIcon.checkButton)

	for _, bu in pairs({ConquestFrame.Arena2v2, ConquestFrame.Arena3v3, ConquestFrame.RatedBG}) do
		local reward = bu.Reward

		bu:StripTextures()
		bu:CreateBackdrop("Overlay")
		bu:StyleButton()
		bu.SelectedTexture:SetInside()
		bu.SelectedTexture:SetColorTexture(1, 1, 0, 0.1)

		reward:StripTextures()
		reward:SetTemplate("Default")
		reward:SetSize(40, 40)
		reward:SetPoint("RIGHT", bu, "RIGHT", -8, 0)

		reward.Icon:SetAllPoints()
		reward.Icon:SetPoint("TOPLEFT", 2, -2)
		reward.Icon:SetPoint("BOTTOMRIGHT", -2, 2)
		reward.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	end

	ConquestFrame.Arena3v3:Point("TOP", ConquestFrame.Arena2v2, "BOTTOM", 0, -2)
	ConquestTooltip:SetTemplate("Transparent")
	
	-- Honor Frame StatusBar
	HonorFrame.ConquestBar:StripTextures()
	HonorFrame.ConquestBar:SetStatusBarTexture(C.media.texture)
	HonorFrame.ConquestBar:SetFrameLevel(HonorFrame.ConquestBar:GetFrameLevel() + 2)
	HonorFrame.ConquestBar:CreateBackdrop("Default")

	-- Icon
	HonorFrame.ConquestBar.Reward.Ring:Hide()
	HonorFrame.ConquestBar.Reward.CircleMask:Hide()
	HonorFrame.ConquestBar.Reward.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	-- Conquest Frame StatusBar
	ConquestFrame.ConquestBar:StripTextures()
	ConquestFrame.ConquestBar:SetStatusBarTexture(C.media.texture)
	ConquestFrame.ConquestBar:SetFrameLevel(ConquestFrame.ConquestBar:GetFrameLevel() + 2)
	ConquestFrame.ConquestBar:CreateBackdrop("Default")

	-- Icon
	ConquestFrame.ConquestBar.Reward.Ring:Hide()
	ConquestFrame.ConquestBar.Reward.CircleMask:Hide()
	ConquestFrame.ConquestBar.Reward.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	--Tutorials
	T.SkinCloseButton(PremadeGroupsPvPTutorialAlert.CloseButton)
	T.SkinCloseButton(HonorFrame.BonusFrame.BrawlHelpBox.CloseButton)
end

T.SkinFuncs["Blizzard_PVPUI"] = LoadSkin

local function LoadSecondarySkin()
	--PVP QUEUE FRAME
	PVPReadyDialog:StripTextures()
	PVPReadyDialog:SetTemplate("Transparent")
	T:HandleButton(PVPReadyDialogEnterBattleButton)
	T:HandleButton(PVPReadyDialogLeaveQueueButton)
	T.SkinCloseButton(PVPReadyDialogCloseButton)
	PVPReadyDialogRoleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")
	PVPReadyDialogRoleIcon.texture:SetAlpha(0.5)
		hooksecurefunc("PVPReadyDialog_Display", function(self, _, _, _, queueType, _, role)
		if role == "DAMAGER" then
			PVPReadyDialogRoleIcon.texture:SetTexCoord(LFDQueueFrameRoleButtonDPS.background:GetTexCoord())
		elseif role == "TANK" then
			PVPReadyDialogRoleIcon.texture:SetTexCoord(LFDQueueFrameRoleButtonTank.background:GetTexCoord())
		elseif role == "HEALER" then
			PVPReadyDialogRoleIcon.texture:SetTexCoord(LFDQueueFrameRoleButtonHealer.background:GetTexCoord())
		end

		if queueType == "ARENA" then
			self:Height(100)
		end

		self.background:Hide()
	end)
	
end

tinsert(T.SkinFuncs["ViksUI"], LoadSecondarySkin)