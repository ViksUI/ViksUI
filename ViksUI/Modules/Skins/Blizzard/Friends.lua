local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

--Cache global variables
--Lua functions
local _G = _G
local pairs, select, unpack = pairs, select, unpack
--WoW API / Variables
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local BNFeaturesEnabled = BNFeaturesEnabled
local RaiseFrameLevel = RaiseFrameLevel
local BNConnected = BNConnected
--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: FriendsFrameBroadcastInput_UpdateDisplay, FriendsFrame_CheckBattlenetStatus
-- GLOBALS: WhoFrameColumn_SetWidth, FRIENDS_TO_DISPLAY, MAX_DISPLAY_CHANNEL_BUTTONS

--Tab Regions
local tabs = {
	"LeftDisabled",
	"MiddleDisabled",
	"RightDisabled",
	"Left",
	"Middle",
	"Right",
}

--Social Frame
local function SkinSocialHeaderTab(tab)
	if not tab then return end
	for _, object in pairs(tabs) do
		local tex = _G[tab:GetName()..object]
		tex:SetTexture(nil)
	end
	tab:GetHighlightTexture():SetTexture(nil)
	tab.backdrop = CreateFrame("Frame", nil, tab)
	tab.backdrop:SetTemplate("Default")
	tab.backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
	tab.backdrop:SetPoint("TOPLEFT", 3, -8)
	tab.backdrop:SetPoint("BOTTOMRIGHT", -6, 0)
end

local function LoadSkin()

	T:HandleScrollBar(FriendsFrameFriendsScrollFrameScrollBar, 5)
	T:HandleScrollBar(WhoListScrollFrameScrollBar, 5)
	T:HandleScrollBar(FriendsFriendsScrollFrameScrollBar)

	local StripAllTextures = {
		"ScrollOfResurrectionSelectionFrame",
		"ScrollOfResurrectionSelectionFrameList",
		"FriendsListFrame",
		"FriendsTabHeader",
		"FriendsFrameFriendsScrollFrame",
		"WhoFrameColumnHeader1",
		"WhoFrameColumnHeader2",
		"WhoFrameColumnHeader3",
		"WhoFrameColumnHeader4",
		"AddFriendFrame",
		"AddFriendNoteFrame",
	}

	local KillTextures = {
		"FriendsFrameBroadcastInputLeft",
		"FriendsFrameBroadcastInputRight",
		"FriendsFrameBroadcastInputMiddle",
	}

	FriendsFrameInset:StripTextures()
	FriendsFrameInset.NineSlice:Hide()
	FriendsFrame.NineSlice:Hide()
	WhoFrameListInset:StripTextures()
	WhoFrameListInset.NineSlice:Hide()
	WhoFrameEditBoxInset:StripTextures()
	WhoFrameEditBoxInset.NineSlice:Hide()
	LFRQueueFrameListInset:StripTextures()
	LFRQueueFrameRoleInset:StripTextures()
	LFRQueueFrameCommentInset:StripTextures()

	local buttons = {
		"FriendsFrameAddFriendButton",
		"FriendsFrameSendMessageButton",
		"WhoFrameWhoButton",
		"WhoFrameAddFriendButton",
		"WhoFrameGroupInviteButton",
		"FriendsFrameIgnorePlayerButton",
		"FriendsFrameUnsquelchButton",
		"AddFriendEntryFrameAcceptButton",
		"AddFriendEntryFrameCancelButton",
		"AddFriendInfoFrameContinueButton",
		"ScrollOfResurrectionSelectionFrameAcceptButton",
		"ScrollOfResurrectionSelectionFrameCancelButton",
	}

	for _, button in pairs(buttons) do
		T:HandleButton(_G[button])
	end

	for _, texture in pairs(KillTextures) do
		_G[texture]:Kill()
	end

	for _, object in pairs(StripAllTextures) do
		_G[object]:StripTextures()
	end

	for i=1, FriendsFrame:GetNumRegions() do
		local region = select(i, FriendsFrame:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetTexture(nil)
			region:SetAlpha(0)
		end
	end

	FriendsFrame:SetTemplate('Transparent')

	T:HandleEditBox(FriendsFriendsList)
	T:HandleDropDownBox(FriendsFriendsFrameDropDown,150)

	FriendsTabHeaderSoRButton:SetTemplate('Default')
	FriendsTabHeaderSoRButton:StyleButton()
	FriendsTabHeaderSoRButtonIcon:SetDrawLayer('OVERLAY')
	FriendsTabHeaderSoRButtonIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	FriendsTabHeaderSoRButtonIcon:SetPoint("TOPLEFT", 2, -2)
	FriendsTabHeaderSoRButtonIcon:SetPoint("BOTTOMRIGHT", -2, 2)
	FriendsTabHeaderSoRButton:SetPoint('TOPRIGHT', FriendsTabHeader, 'TOPRIGHT', -8, -56)

	local SoRBg = CreateFrame("Frame", nil, FriendsTabHeaderSoRButton)
	SoRBg:SetPoint("TOPLEFT", -1, 1)
	SoRBg:SetPoint("BOTTOMRIGHT", 1, -1)

	FriendsTabHeaderRecruitAFriendButton:SetTemplate("Default")
	FriendsTabHeaderRecruitAFriendButton:StyleButton()
	FriendsTabHeaderRecruitAFriendButtonIcon:SetDrawLayer("OVERLAY")
	FriendsTabHeaderRecruitAFriendButtonIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	FriendsTabHeaderRecruitAFriendButtonIcon:SetPoint("TOPLEFT", 2, -2)
	FriendsTabHeaderRecruitAFriendButtonIcon:SetPoint("BOTTOMRIGHT", -2, 2)

	T:HandleScrollBar(FriendsFrameIgnoreScrollFrameScrollBar, 4)
	T:HandleDropDownBox(FriendsFrameStatusDropDown, 70)

	FriendsFrameStatusDropDown:ClearAllPoints()
	FriendsFrameStatusDropDown:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", -13, -28)

	FriendsFrameBattlenetFrame:StripTextures()
	FriendsFrameBattlenetFrame:GetRegions():Hide()

	FriendsFrameBattlenetFrame.UnavailableInfoFrame:SetPoint("TOPLEFT", FriendsFrame, "TOPRIGHT", 1, -18)

	FriendsFrameBattlenetFrame.Tag:SetParent(FriendsListFrame)
	FriendsFrameBattlenetFrame.Tag:SetPoint("TOP", FriendsFrame, "TOP", 0, -8)

	FriendsFrameBroadcastInput:CreateBackdrop("Default")
	FriendsFrameBroadcastInput:SetWidth(259)

	hooksecurefunc("FriendsFrame_CheckBattlenetStatus", function()
		if BNFeaturesEnabled() then
			local frame = FriendsFrameBattlenetFrame

			frame.BroadcastButton:Hide()

			if BNConnected() then
				frame:Hide()
				FriendsFrameBroadcastInput:Show()
				FriendsFrameBroadcastInput_UpdateDisplay()
			end
		end
	end)
	--FriendsFrame_CheckBattlenetStatus()

	hooksecurefunc("FriendsFrame_Update", function()
		if FriendsFrame.selectedTab == 1 and FriendsTabHeader.selectedTab == 1 and FriendsFrameBattlenetFrame.Tag:IsShown() then
			FriendsFrameTitleText:Hide()
		else
			FriendsFrameTitleText:Show()
		end
	end)

	T:HandleEditBox(AddFriendNameEditBox)
	AddFriendFrame:SetTemplate("Transparent")
	ScrollOfResurrectionSelectionFrame:SetTemplate('Transparent')
	ScrollOfResurrectionSelectionFrameList:SetTemplate('Default')
	T:HandleScrollBar(ScrollOfResurrectionSelectionFrameListScrollFrameScrollBar, 4)
	T:HandleEditBox(ScrollOfResurrectionSelectionFrameTargetEditBox)
	RaiseFrameLevel(ScrollOfResurrectionSelectionFrameTargetEditBox)

	--Pending invites
	T:HandleButton(FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton)
	local function SkinFriendRequest(frame)
		if frame.isSkinned then return; end
		T:HandleButton(frame.DeclineButton, nil, true)
		T:HandleButton(frame.AcceptButton)
		frame.isSkinned = true
	end
	hooksecurefunc(FriendsFrameFriendsScrollFrame.invitePool, "Acquire", function()
		for object in pairs(FriendsFrameFriendsScrollFrame.invitePool.activeObjects) do
			SkinFriendRequest(object)
		end
	end)

	--Who Frame
	local function UpdateWhoSkins()
		WhoListScrollFrame:StripTextures()
	end

	WhoFrame:HookScript("OnShow", UpdateWhoSkins)
	hooksecurefunc("FriendsFrame_OnEvent", UpdateWhoSkins)

	--Increase width of Level column slightly
	WhoFrameColumn_SetWidth(WhoFrameColumnHeader3, 37) --Default is 32
	for i = 1, 17 do
		local level = _G["WhoFrameButton"..i.."Level"]
		if level then
			level:SetWidth(level:GetWidth() + 5)
		end
	end

	T.SkinCloseButton(FriendsFrameCloseButton,FriendsFrame.backdrop)
	T:HandleDropDownBox(WhoFrameDropDown,150)

	--Bottom Tabs
	for i = 1, 4 do
		T.SkinTab(_G["FriendsFrameTab"..i])
	end

	for i=1, 3 do
		SkinSocialHeaderTab(_G["FriendsTabHeaderTab"..i])
	end

	--View Friends BN Frame
	FriendsFriendsFrame:CreateBackdrop("Transparent")

	StripAllTextures = {
		"FriendsFriendsFrame",
		"FriendsFriendsList",
	}

	buttons = {
		"FriendsFriendsSendRequestButton",
		"FriendsFriendsCloseButton",
	}

	for _, object in pairs(StripAllTextures) do
		_G[object]:StripTextures()
	end

	for _, button in pairs(buttons) do
		T:HandleButton(_G[button])
	end

	IgnoreListFrame:StripTextures()

	ScrollOfResurrectionFrame:StripTextures()
	T:HandleButton(ScrollOfResurrectionFrameAcceptButton)
	T:HandleButton(ScrollOfResurrectionFrameCancelButton)

	ScrollOfResurrectionFrameTargetEditBoxLeft:SetTexture(nil)
	ScrollOfResurrectionFrameTargetEditBoxMiddle:SetTexture(nil)
	ScrollOfResurrectionFrameTargetEditBoxRight:SetTexture(nil)
	ScrollOfResurrectionFrameNoteFrame:StripTextures()
	ScrollOfResurrectionFrameNoteFrame:SetTemplate()
	ScrollOfResurrectionFrameTargetEditBox:SetTemplate()
	ScrollOfResurrectionFrame:SetTemplate('Transparent')

	RecruitAFriendFrame:StripTextures()
	RecruitAFriendFrame:SetTemplate("Transparent")
	--x RecruitAFriendFrame.MoreDetails.Text:FontTemplate()
	T.SkinCloseButton(RecruitAFriendFrameCloseButton)
	T:HandleButton(RecruitAFriendFrameSendButton)
	T:HandleEditBox(RecruitAFriendNameEditBox)
	RecruitAFriendNoteFrame:StripTextures()
	T:HandleEditBox(RecruitAFriendNoteFrame)

	RecruitAFriendSentFrame:StripTextures()
	RecruitAFriendSentFrame:SetTemplate("Transparent")
	T.SkinCloseButton(RecruitAFriendSentFrameCloseButton)
	T:HandleButton(RecruitAFriendSentFrame.OKButton)
	hooksecurefunc("RecruitAFriend_Send", function()
		RecruitAFriendSentFrame:ClearAllPoints()
		RecruitAFriendSentFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
	end)

	--Quick join
	T:HandleScrollBar(QuickJoinScrollFrameScrollBar, 5)
	T:HandleButton(QuickJoinFrame.JoinQueueButton)
	QuickJoinFrame.JoinQueueButton:SetSize(131, 21)  --Match button on other tab
	QuickJoinFrame.JoinQueueButton:ClearAllPoints()
	QuickJoinFrame.JoinQueueButton:SetPoint("BOTTOMRIGHT", QuickJoinFrame, "BOTTOMRIGHT", -6, 4)
	QuickJoinScrollFrameTop:SetTexture(nil)
	QuickJoinScrollFrameBottom:SetTexture(nil)
	QuickJoinScrollFrameMiddle:SetTexture(nil)
	QuickJoinRoleSelectionFrame:StripTextures()
	QuickJoinRoleSelectionFrame:SetTemplate("Transparent")
	T:HandleButton(QuickJoinRoleSelectionFrame.AcceptButton)
	T:HandleButton(QuickJoinRoleSelectionFrame.CancelButton)
	T.SkinCloseButton(QuickJoinRoleSelectionFrame.CloseButton)
	T:HandleCheckBox(QuickJoinRoleSelectionFrame.RoleButtonTank.CheckButton)
	T:HandleCheckBox(QuickJoinRoleSelectionFrame.RoleButtonHealer.CheckButton)
	T:HandleCheckBox(QuickJoinRoleSelectionFrame.RoleButtonDPS.CheckButton)

	-- GameIcons
	for i = 1, FRIENDS_TO_DISPLAY do
		local button = _G["FriendsFrameFriendsScrollFrameButton"..i]
		local icon = _G["FriendsFrameFriendsScrollFrameButton"..i.."GameIcon"]

		icon:Size(22, 22)
		icon:SetTexCoord(.15, .85, .15, .85)

		icon:ClearAllPoints()
		icon:SetPoint("RIGHT", button, "RIGHT", -24, 0)
		icon.SetPoint = T.noop
	end

	--Tutorial
	T.SkinCloseButton(FriendsTabHeader.FriendsFrameQuickJoinHelpTip.CloseButton)
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)