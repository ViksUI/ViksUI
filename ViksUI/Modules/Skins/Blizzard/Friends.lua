local T, C, L = unpack(ViksUI)
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Friends skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local StripAllTextures = {
		FriendsFrame,
		FriendsListFrame,
		FriendsTabHeader,
		WhoFrameColumnHeader1,
		WhoFrameColumnHeader2,
		WhoFrameColumnHeader3,
		WhoFrameColumnHeader4,
		AddFriendFrame,
		FriendsFriendsFrame,
		IgnoreListFrame,
		FriendsFrameInset,
		WhoFrameListInset,
		WhoFrameEditBoxInset,
		LFRQueueFrameListInset,
		LFRQueueFrameRoleInset,
		LFRQueueFrameCommentInset,
		FriendsFrameBattlenetFrame,
		BattleTagInviteFrame,
		QuickJoinRoleSelectionFrame,
		FriendsFrameBattlenetFrame.BroadcastFrame,
		FriendsFrameBattlenetFrame.UnavailableInfoFrame,
		RecruitAFriendFrame.RecruitList.Header,
		RecruitAFriendFrame.RecruitList.ScrollFrameInset,
		RecruitAFriendFrame.RewardClaiming,
		RecruitAFriendRecruitmentFrame,
		RecruitAFriendRewardsFrame
	}

	for i = 1, #StripAllTextures do
		local frame = StripAllTextures[i]
		if frame then
			frame:StripTextures()
		end
	end

	local KillTextures = {
		FriendsFrameIcon
	}

	for i = 1, #KillTextures do
		KillTextures[i]:Kill()
	end

	local buttons = {
		FriendsFrameAddFriendButton,
		FriendsFrameSendMessageButton,
		WhoFrameWhoButton,
		WhoFrameAddFriendButton,
		WhoFrameGroupInviteButton,
		FriendsFrameIgnorePlayerButton,
		FriendsFrameUnsquelchButton,
		AddFriendEntryFrameAcceptButton,
		AddFriendEntryFrameCancelButton,
		QuickJoinFrame.JoinQueueButton,
		QuickJoinRoleSelectionFrame.AcceptButton,
		QuickJoinRoleSelectionFrame.CancelButton,
		FriendsFrameBattlenetFrame.BroadcastFrame.CancelButton,
		FriendsFrameBattlenetFrame.BroadcastFrame.UpdateButton,
		RecruitAFriendFrame.RewardClaiming.ClaimOrViewRewardButton,
		RecruitAFriendFrame.RecruitmentButton,
		RecruitAFriendFrame.SplashFrame.OKButton,
		RecruitAFriendRecruitmentFrame.GenerateOrCopyLinkButton,
		FriendsFriendsFrame.SendRequestButton,
		FriendsFriendsFrame.CloseButton
	}

	for i = 1, #buttons do
		local button = buttons[i]
		if button then
			button:SkinButton()
		end
	end

	local scrollbars = {
		FriendsListFrame.ScrollBar,
		WhoFrame.ScrollBar,
		QuickJoinFrame.ScrollBar,
		RecruitAFriendFrame.RecruitList.ScrollBar,
		FriendsFriendsFrame.ScrollBar
	}

	for i = 1, #scrollbars do
		T.SkinScrollBar(scrollbars[i], true)
	end

	if not T.newPatch then
		T.SkinScrollBar(IgnoreListFrame.ScrollBar)
	end

	-- Reposition buttons
	WhoFrameWhoButton:SetPoint("RIGHT", WhoFrameAddFriendButton, "LEFT", -3, 0)
	WhoFrameAddFriendButton:SetPoint("RIGHT", WhoFrameGroupInviteButton, "LEFT", -3, 0)
	WhoFrameGroupInviteButton:SetPoint("BOTTOMRIGHT", WhoFrame, "BOTTOMRIGHT", -4, 4)
	FriendsFrameAddFriendButton:SetPoint("BOTTOMLEFT", FriendsFrame, "BOTTOMLEFT", 4, 4)
	FriendsFrameSendMessageButton:SetPoint("BOTTOMRIGHT", FriendsFrame, "BOTTOMRIGHT", -4, 4)
	if not T.newPatch then
		FriendsFrameIgnorePlayerButton:SetPoint("BOTTOMLEFT", FriendsFrame, "BOTTOMLEFT", 4, 4)
		FriendsFrameUnsquelchButton:SetPoint("BOTTOMRIGHT", FriendsFrame, "BOTTOMRIGHT", -4, 4)
	end

	-- Resize Buttons
	WhoFrameWhoButton:SetSize(WhoFrameWhoButton:GetWidth() + 7, WhoFrameWhoButton:GetHeight())
	WhoFrameAddFriendButton:SetSize(WhoFrameAddFriendButton:GetWidth() - 4, WhoFrameAddFriendButton:GetHeight())
	WhoFrameGroupInviteButton:SetSize(WhoFrameGroupInviteButton:GetWidth() - 4, WhoFrameGroupInviteButton:GetHeight())
	T.SkinEditBox(WhoFrameEditBox, WhoFrameEditBox:GetWidth() + 30, WhoFrameEditBox:GetHeight() - 15)
	WhoFrameEditBox:SetPoint("BOTTOM", WhoFrame, "BOTTOM", 0, 31)
	WhoFrameEditBox.backdrop:SetOutside(nil, 2, -2)

	T.SkinEditBox(AddFriendNameEditBox)
	AddFriendNameEditBox:SetHeight(AddFriendNameEditBox:GetHeight() - 5)
	T.SkinFrame(AddFriendFrame)
	FriendsFriendsFrame:SetTemplate("Transparent")

	-- Ignore
	if T.newPatch then
		T.SkinFrame(FriendsFrame.IgnoreListWindow)
		FriendsFrame.IgnoreListWindow.UnignorePlayerButton:SkinButton()
		T.SkinScrollBar(FriendsFrame.IgnoreListWindow.ScrollBar)
	end

	-- Recruit a Friend
	local SplashFrame = RecruitAFriendFrame.SplashFrame
	SplashFrame:CreateBackdrop("Overlay")
	SplashFrame.backdrop:SetPoint("TOPLEFT", 2, -2)
	SplashFrame.backdrop:SetPoint("BOTTOMRIGHT", -1, -1)

	SplashFrame.Picture.b = CreateFrame("Frame", nil, SplashFrame)
	SplashFrame.Picture.b:SetTemplate("Default")
	SplashFrame.Picture.b:SetPoint("TOPLEFT", SplashFrame.Picture, "TOPLEFT", -2, 2)
	SplashFrame.Picture.b:SetPoint("BOTTOMRIGHT", SplashFrame.Picture, "BOTTOMRIGHT", 2, -2)
	SplashFrame.Picture:SetParent(SplashFrame.Picture.b)

	RecruitAFriendFrame.SplashFrame.Description:SetTextColor(1, 1, 1)

	SplashFrame.Background:Hide()
	SplashFrame.PictureFrame:Hide()

	SplashFrame.Bracket_TopLeft:Hide()
	SplashFrame.Bracket_TopRight:Hide()
	SplashFrame.Bracket_BottomRight:Hide()
	SplashFrame.Bracket_BottomLeft:Hide()
	SplashFrame.PictureFrame_Bracket_TopLeft:Hide()
	SplashFrame.PictureFrame_Bracket_TopRight:Hide()
	SplashFrame.PictureFrame_Bracket_BottomRight:Hide()
	SplashFrame.PictureFrame_Bracket_BottomLeft:Hide()

	RecruitAFriendRewardsFrame:SetTemplate("Transparent")
	T.SkinCloseButton(RecruitAFriendRewardsFrame.CloseButton)

	RecruitAFriendRewardsFrame:HookScript("OnShow", function(self)
		for i = 1, self:GetNumChildren() do
			local child = select(i, self:GetChildren())
			local button = child and child.Button
			if button and not button.styled then
				button.Icon:SkinIcon()
				button.IconBorder:SetAlpha(0)
				button:StyleButton(true, 0)

				button.styled = true
			end
		end
	end)

	RecruitAFriendFrame.RewardClaiming.NextRewardButton.Icon:SkinIcon()
	RecruitAFriendFrame.RewardClaiming.NextRewardButton.CircleMask:Hide()
	RecruitAFriendFrame.RewardClaiming.NextRewardButton.IconBorder:SetAlpha(0)

	RecruitAFriendRecruitmentFrame:SetTemplate("Transparent")
	T.SkinCloseButton(RecruitAFriendRecruitmentFrame.CloseButton)
	T.SkinEditBox(RecruitAFriendRecruitmentFrame.EditBox, nil, 18)
	RecruitAFriendRecruitmentFrame.EditBox:SetPoint("RIGHT", RecruitAFriendRecruitmentFrame.GenerateOrCopyLinkButton, "LEFT", -10, 0)

	-- Quick Join Frame
	QuickJoinRoleSelectionFrame:SetTemplate("Transparent")
	T.SkinCloseButton(QuickJoinRoleSelectionFrame.CloseButton)
	T.SkinCheckBox(QuickJoinRoleSelectionFrame.RoleButtonTank.CheckButton)
	T.SkinCheckBox(QuickJoinRoleSelectionFrame.RoleButtonHealer.CheckButton)
	T.SkinCheckBox(QuickJoinRoleSelectionFrame.RoleButtonDPS.CheckButton)

	-- Pending invites
	hooksecurefunc("FriendsFrame_UpdateFriendInviteButton", function(button)
		if not button.IsSkinned then
			button.AcceptButton:SkinButton()
			button.DeclineButton:SkinButton()

			button.IsSkinned = true
		end
	end)

	-- BNet Frame
	if not T.newPatch then
		FriendsFrameBattlenetFrame.BroadcastButton:SetAlpha(0)
		FriendsFrameBattlenetFrame.BroadcastButton:ClearAllPoints()
		FriendsFrameBattlenetFrame.BroadcastButton:SetAllPoints(FriendsFrameBattlenetFrame)
	end

	if T.newPatch then
		local b = FriendsFrameBattlenetFrame.ContactsMenuButton
		b:SkinButton()
		b:SetSize(25, 25)
	end

	FriendsFrameBattlenetFrame.BroadcastFrame:CreateBackdrop("Transparent")
	FriendsFrameBattlenetFrame.BroadcastFrame.backdrop:SetPoint("TOPLEFT", 6, 1)
	FriendsFrameBattlenetFrame.BroadcastFrame.backdrop:SetPoint("BOTTOMRIGHT", -4, 1)

	T.SkinEditBox(FriendsFrameBattlenetFrame.BroadcastFrame.EditBox, nil, 18)

	FriendsFrameBattlenetFrame.UnavailableInfoFrame:CreateBackdrop("Transparent")
	FriendsFrameBattlenetFrame.UnavailableInfoFrame.backdrop:SetPoint("TOPLEFT", 4, -4)
	FriendsFrameBattlenetFrame.UnavailableInfoFrame.backdrop:SetPoint("BOTTOMRIGHT", -4, 4)

	BattleTagInviteFrame:SetTemplate("Transparent")
	for i = 1, BattleTagInviteFrame:GetNumChildren() do
		local child = select(i, BattleTagInviteFrame:GetChildren())
		if child:GetObjectType() == "Button" then
			child:SkinButton()
		end
	end

	FriendsFrame:SetTemplate("Transparent")

	local function ReskinFriendButton(button)
		if button.styled then return end
		local icon = button.gameIcon

		icon.b = CreateFrame("Frame", nil, button)
		icon.b:SetTemplate("Default")
		icon.b:SetPoint("TOPLEFT", icon, "TOPLEFT", -2, 2)
		icon.b:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 2, -2)

		icon:SetParent(icon.b)
		icon:SetSize(22, 22)
		icon:SetTexCoord(.17, .83, .17, .83)
		icon:ClearAllPoints()
		icon:SetPoint("RIGHT", button, "RIGHT", -27, 0)
		icon.SetPoint = T.dummy

		button.travelPassButton:SetSize(20, 30)
		button.travelPassButton:SkinButton()
		button.travelPassButton.NormalTexture:SetAlpha(0)
		button.travelPassButton.PushedTexture:SetAlpha(0)
		button.travelPassButton.DisabledTexture:SetAlpha(0)
		button.travelPassButton:SetPoint("TOPRIGHT", -1, -2)

		button.inv = button.travelPassButton:CreateTexture(nil, "OVERLAY", nil, 7)
		button.inv:SetTexture([[Interface\FriendsFrame\PlusManz-PlusManz]])
		button.inv:SetPoint("TOPRIGHT", 1, -4)
		button.inv:SetSize(22, 22)

		button.background:Hide()
		button.styled = true
	end

	hooksecurefunc("FriendsFrame_UpdateFriendButton", function(button)
		if button.gameIcon then
			ReskinFriendButton(button)
		end

		if button.buttonType == FRIENDS_BUTTON_TYPE_BNET and button.travelPassButton then
			local isEnabled = button.travelPassButton:IsEnabled()
			button.travelPassButton:SetAlpha(isEnabled and 1 or 0.4)
		end

		if button.gameIcon.b then
			button.gameIcon.b:SetShown(button.gameIcon:IsShown())
		end
	end)

	T.SkinCloseButton(FriendsFrameCloseButton)
	T.SkinDropDownBox(WhoFrameDropdown, 150)
	WhoFrameColumnHeader2:SetHeight(20)
	T.SkinDropDownBox(FriendsFrameStatusDropdown, 70)
	T.SkinDropDownBox(FriendsFriendsFrameDropdown)

	FriendsFrameStatusDropdown:ClearAllPoints()
	FriendsFrameStatusDropdown:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", 22, -27)
	FriendsFrameStatusDropdown.Text:SetFont(C.media.normal_font, 12, "")

	-- Bottom Tabs
	for i = 1, 4 do
		T.SkinTab(_G["FriendsFrameTab"..i])
	end

	for i = 1, 3 do
		T.SkinTab(_G["FriendsTabHeaderTab"..i], true)
	end

	if T.newPatch then
		for _, tab in next, {FriendsTabHeader.TabSystem:GetChildren()} do
			tab:StripTextures()
		end
	end
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)