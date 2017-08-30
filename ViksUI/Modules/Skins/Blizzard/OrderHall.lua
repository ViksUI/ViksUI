local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

local OrderHallFollower = CreateFrame("Frame")
OrderHallFollower:RegisterEvent("ADDON_LOADED")
OrderHallFollower:SetScript("OnEvent", function(self, event, addon)
	if (event == "ADDON_LOADED" and addon == "Blizzard_OrderHallUI") then
		OrderHallFollower:RegisterEvent("DISPLAY_SIZE_CHANGED")
		OrderHallFollower:RegisterEvent("UI_SCALE_CHANGED")
		OrderHallFollower:RegisterEvent("GARRISON_FOLLOWER_CATEGORIES_UPDATED")
		OrderHallFollower:RegisterEvent("GARRISON_FOLLOWER_ADDED")
		OrderHallFollower:RegisterEvent("GARRISON_FOLLOWER_REMOVED")

	elseif event ~= "ADDON_LOADED" then
		local bar = OrderHallCommandBar

		local index = 1
		C_Timer.After(0.8, function() -- Give it a bit more time to collect.
			local last
			for i, child in ipairs({bar:GetChildren()}) do
				if child.Icon and child.Count and child.TroopPortraitCover then
					child:ClearAllPoints()
					child:SetPoint("LEFT", bar.AreaName, "RIGHT", 50 + (index - 1) * 120, 0)
					child:SetWidth(60)

					child.TroopPortraitCover:Hide()
					child.Icon:ClearAllPoints()
					child.Icon:SetPoint("LEFT", child, "LEFT", 0, 0)
					child.Icon:SetSize(32, 16)

					child.Count:ClearAllPoints()
					child.Count:SetPoint("LEFT", child.Icon, "RIGHT", 5, 0)
					child.Count:SetTextColor(.9, .9, .9)
					child.Count:SetShadowOffset(.75, -.75)

					last = child.Count

					index = index + 1
				end
			end
		end)
	end
end)

----------------------------------------------------------------------------------------
--	OrderHallUI skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	OrderHallCommandBar:StripTextures()
	OrderHallCommandBar:SetTemplate("Transparent")
	OrderHallCommandBar:ClearAllPoints()
	OrderHallCommandBar:SetPoint("TOP", CPTopp, "BOTTOM", 0, -2)
	OrderHallCommandBar:SetWidth(580)
	OrderHallCommandBar.ClassIcon:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
	OrderHallCommandBar.ClassIcon:SetSize(46, 20)
	OrderHallCommandBar.CurrencyIcon:SetAtlas("legionmission-icon-currency", false)
	OrderHallCommandBar.AreaName:ClearAllPoints()
	OrderHallCommandBar.AreaName:SetPoint("LEFT", OrderHallCommandBar.CurrencyIcon, "RIGHT", 10, 0)
	OrderHallCommandBar.AreaName:SetVertexColor(T.color.r, T.color.g, T.color.b)
	OrderHallCommandBar.WorldMapButton:Kill()
	
	OrderHallMissionFrame.ClassHallIcon:Kill()
	OrderHallMissionFrame:StripTextures()
	OrderHallMissionFrame:CreateBackdrop("Transparent")
	T.SkinCloseButton(OrderHallMissionFrame.CloseButton)

	for i = 1, 3 do
		T.SkinTab(_G["OrderHallMissionFrameTab" .. i])
	end

	OrderHallMissionFrame.GarrCorners:StripTextures()
	OrderHallMissionFrameMissions:StripTextures()
	OrderHallMissionFrameMissionsListScrollFrame:StripTextures()
	T.SkinScrollBar(OrderHallMissionFrameMissionsListScrollFrameScrollBar)
	OrderHallMissionFrameMissions.CombatAllyUI:StripTextures()
	OrderHallMissionFrameMissions.CombatAllyUI.InProgress.Unassign:SkinButton()
	OrderHallMissionFrameMissions.MaterialFrame:StripTextures()
	OrderHallMissionFrame.MissionTab:StripTextures()
	OrderHallMissionFrame.MissionTab.ZoneSupportMissionPage:StripTextures()
	T.SkinCloseButton(OrderHallMissionFrame.MissionTab.ZoneSupportMissionPage.CloseButton)
	OrderHallMissionFrame.MissionTab.ZoneSupportMissionPage.StartMissionButton:SkinButton()

	for i = 1, 2 do
		_G["OrderHallMissionFrameMissionsTab" .. i]:StripTextures()
		_G["OrderHallMissionFrameMissionsTab" .. i]:SkinButton()
		_G["OrderHallMissionFrameMissionsTab" .. i]:SetHeight(_G["GarrisonMissionFrameMissionsTab" .. i]:GetHeight() - 10)
	end

	for i, v in ipairs(OrderHallMissionFrame.MissionTab.MissionList.listScroll.buttons) do
		local Button = _G["OrderHallMissionFrameMissionsListScrollFrameButton" .. i]
		if Button and not Button.skinned then
			Button:StripTextures()
			Button:SetTemplate()
			Button:SkinButton()
			Button:SetBackdropBorderColor(0, 0, 0, 0)
			Button.LocBG:Hide()
			for i = 1, #Button.Rewards do
				local Texture = Button.Rewards[i].Icon:GetTexture()

				Button.Rewards[i]:StripTextures()
				Button.Rewards[i]:StyleButton()
				Button.Rewards[i]:CreateBackdrop()
				Button.Rewards[i].Icon:SetTexture(Texture)
				Button.Rewards[i].backdrop:ClearAllPoints()
				Button.Rewards[i].Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end
			Button.isSkinned = true
		end
	end

	local Follower = OrderHallMissionFrameFollowers
	Follower:StripTextures()
	T.SkinEditBox(Follower.SearchBox)
	Follower.MaterialFrame:StripTextures()
	T.SkinScrollBar(OrderHallMissionFrameFollowersListScrollFrameScrollBar)
	OrderHallMissionFrame.MissionTab.MissionPage:StripTextures()
	T.SkinCloseButton(OrderHallMissionFrame.MissionTab.MissionPage.CloseButton)
	OrderHallMissionFrame.MissionTab.MissionPage.StartMissionButton:SkinButton()

	local FollowerList = OrderHallMissionFrame.FollowerTab
	FollowerList:StripTextures()
	FollowerList.ModelCluster:StripTextures()
	FollowerList.Class:SetSize(50, 43)
	FollowerList.XPBar:StripTextures()
	FollowerList.XPBar:SetStatusBarTexture(C["media"].texture)
	FollowerList.XPBar:CreateBackdrop()

	local Mission = OrderHallMissionFrameMissions
	Mission.CompleteDialog:StripTextures()
	Mission.CompleteDialog:SetTemplate("Transparent")
	Mission.CompleteDialog.BorderFrame.ViewButton:SkinButton()
	OrderHallMissionFrame.MissionComplete.NextMissionButton:SkinButton()

	OrderHallTalentFrame:StripTextures()
	OrderHallTalentFrame:SetTemplate("Transparent")
	T.SkinCloseButton(OrderHallTalentFrameCloseButton)
	ClassHallTalentInset:StripTextures()
	OrderHallTalentFrame.Currency:SetFont(C["media"].normal_font, 16)
	OrderHallTalentFrame.CurrencyIcon:SetAtlas("legionmission-icon-currency", false)
	
end

T.SkinFuncs["Blizzard_OrderHallUI"] = LoadSkin
