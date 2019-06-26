local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

--Cache global variables
--Lua functions
local _G = _G
local ipairs, pairs, select, unpack = ipairs, pairs, select, unpack
--WoW API / Variables
local C_CreatureInfo_GetClassInfo = C_CreatureInfo.GetClassInfo
local FRIENDS_BNET_BACKGROUND_COLOR = FRIENDS_BNET_BACKGROUND_COLOR
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS:
	
local function LoadSkin()

	local CommunitiesFrame = _G["CommunitiesFrame"]
	CommunitiesFrame:StripTextures()
	CommunitiesFrame:CreateBackdrop("Transparent")
	CommunitiesFrameInset.NineSlice:Hide()
	CommunitiesFrameInset.Bg:Hide()
	CommunitiesFrame.PortraitOverlay:Kill()
	CommunitiesFrame.NineSlice:Hide()
	CommunitiesFrame.PortraitOverlay.Portrait:Hide()

	local CommunitiesFrameCommunitiesList = _G["CommunitiesFrameCommunitiesList"]
	CommunitiesFrameCommunitiesList.InsetFrame.NineSlice:Hide()
	CommunitiesFrameCommunitiesList.FilligreeOverlay:Hide()
	CommunitiesFrameCommunitiesList.Bg:Hide()
	CommunitiesFrameCommunitiesList.TopFiligree:Hide()
	CommunitiesFrameCommunitiesList.BottomFiligree:Hide()
	CommunitiesFrameCommunitiesListListScrollFrame:StripTextures()

	hooksecurefunc(CommunitiesListEntryMixin, "SetClubInfo", function(self, clubInfo)
		if clubInfo then
			self:SetSize(166, 67)

			--select(13, self:GetRegions()):Hide() -- Hide the mouseover texture
			self.Background:Hide()
			self:SetFrameLevel(self:GetFrameLevel()+5)

			T:CropIcon(self.Icon)
			self.Icon:RemoveMaskTexture(self.CircleMask)
			self.Icon:SetDrawLayer("OVERLAY", 1)
			self.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			self.IconRing:Hide()

			if not self.bg then
				self.bg = CreateFrame("Frame", nil, self)
				self.bg:CreateBackdrop("Overlay")
				self.bg:SetFrameLevel(self:GetFrameLevel() -2)
				self.bg:Point("TOPLEFT", 4, -3)
				self.bg:Point("BOTTOMRIGHT", -1, 3)
			end

			local isGuild = clubInfo.clubType == Enum.ClubType.Guild
			if isGuild then
				self.Selection:SetInside(self.bg)
				self.Selection:SetColorTexture(0, 1, 0, 0.2)
			else
				self.Selection:SetInside(self.bg)
				self.Selection:SetColorTexture(FRIENDS_BNET_BACKGROUND_COLOR.r, FRIENDS_BNET_BACKGROUND_COLOR.g, FRIENDS_BNET_BACKGROUND_COLOR.b, 0.2)
			end

			local highlight = self:GetHighlightTexture()
			highlight:SetColorTexture(1, 1, 1, 0.3)
			highlight:SetInside(self.bg)
		end
	end)

	hooksecurefunc(CommunitiesListEntryMixin, "SetAddCommunity", function(self)
		self:SetSize(166, 67)

		--select(13, self:GetRegions()):Hide() -- Hide the mouseover texture (needs some love)
		self.Background:Hide()
		self:SetFrameLevel(self:GetFrameLevel()+5)
		T:CropIcon(self.Icon)
		self.CircleMask:Hide()
		self.Icon:SetDrawLayer("OVERLAY", 1)
		self.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		self.IconRing:Hide()

		if not self.bg then
			self.bg = CreateFrame("Frame", nil, self)
			self.bg:CreateBackdrop("Overlay")
			self.bg:SetFrameLevel(self:GetFrameLevel() -2)
			self.bg:Point("TOPLEFT", 4, -3)
			self.bg:Point("BOTTOMRIGHT", -1, 3)
		end

		local highlight = self:GetHighlightTexture()
		highlight:SetColorTexture(1, 1, 1, 0.3)
		highlight:SetInside(self.bg)
	end)

	local function SkinTab(tab)
		local normTex = tab:GetNormalTexture()
		if normTex then
			normTex:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			normTex:SetInside()
		end

		if not tab.isSkinned then
			for i = 1, tab:GetNumRegions() do
				local region = select(i, tab:GetRegions())
				if region:GetObjectType() == "Texture" then
					if region:GetTexture() == "Interface\\SpellBook\\SpellBook-SkillLineTab" then
						region:Kill()
					end
				end
			end

			tab.pushed = true;
			tab:CreateBackdrop("Default")
			tab.backdrop:Point("TOPLEFT", -2, 2)
			tab.backdrop:Point("BOTTOMRIGHT", 2, -2)
			tab:StyleButton(true)
			tab.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

			hooksecurefunc(tab:GetHighlightTexture(), "SetTexture", function(self, texPath)
				if texPath ~= nil then
					self:SetPushedTexture(nil);
				end
			end)

			hooksecurefunc(tab:GetCheckedTexture(), "SetTexture", function(self, texPath)
				if texPath ~= nil then
					self:SetHighlightTexture(nil);
				end
			end)

			--local point, relatedTo, point2, _, y = tab:GetPoint()
			--tab:SetPoint(point, relatedTo, point2, 1, y)
		end

		tab.isSkinned = true
	end
	SkinTab(CommunitiesFrame.ChatTab)
	SkinTab(CommunitiesFrame.RosterTab)
	SkinTab(CommunitiesFrame.GuildBenefitsTab)
	SkinTab(CommunitiesFrame.GuildInfoTab)

	T:HandleInsetFrameTemplate(CommunitiesFrame.CommunitiesList)
	T:HandleMaxMinFrame(CommunitiesFrame.MaximizeMinimizeFrame)
	T.SkinCloseButton(CommunitiesFrameCloseButton)
	T:HandleButton(CommunitiesFrame.InviteButton)
	CommunitiesFrame.AddToChatButton:ClearAllPoints()
	CommunitiesFrame.AddToChatButton:SetPoint("BOTTOM", CommunitiesFrame.ChatEditBox, "BOTTOMRIGHT", -5, -30) -- needs probably adjustment
	T:HandleButton(CommunitiesFrame.AddToChatButton)
	T:HandleButton(CommunitiesFrame.GuildFinderFrame.FindAGuildButton)

	T:HandleScrollSlider(CommunitiesFrame.MemberList.ListScrollFrame.scrollBar)

	T:HandleScrollSlider(CommunitiesFrame.Chat.MessageFrame.ScrollBar)
	T:HandleScrollSlider(CommunitiesFrameCommunitiesListListScrollFrame.ScrollBar)

	T:HandleDropDownFrame(CommunitiesFrame.StreamDropDownMenu)
	T:HandleDropDownFrame(CommunitiesFrame.CommunitiesListDropDownMenu)

	-- [[ CHAT TAB ]]
	CommunitiesFrame.MemberList:StripTextures()
	CommunitiesFrame.MemberList.InsetFrame:Hide()
	CommunitiesFrame.MemberList.WatermarkFrame:Hide()
	CommunitiesFrame.MemberList.InsetFrame.NineSlice:Hide()

	CommunitiesFrame.Chat.InsetFrame:StripTextures()
	CommunitiesFrame.Chat.InsetFrame.NineSlice:Hide()
	CommunitiesFrame.Chat.InsetFrame:SetTemplate("Transparent")

	CommunitiesFrame.GuildFinderFrame:StripTextures()
	CommunitiesFrame.GuildFinderFrame.InsetFrame:StripTextures()
	CommunitiesFrame.GuildFinderFrame.InsetFrame.NineSlice:Hide()

	T:HandleEditBox(CommunitiesFrame.ChatEditBox)
	CommunitiesFrame.ChatEditBox:SetSize(120, 20)

	-- Member Details
	CommunitiesFrame.GuildMemberDetailFrame:StripTextures()
	CommunitiesFrame.GuildMemberDetailFrame:CreateBackdrop("Transparent")

	CommunitiesFrame.GuildMemberDetailFrame.NoteBackground:SetTemplate("Transparent")
	CommunitiesFrame.GuildMemberDetailFrame.OfficerNoteBackground:SetTemplate("Transparent")
	T.SkinCloseButton(CommunitiesFrame.GuildMemberDetailFrame.CloseButton)
	T:HandleButton(CommunitiesFrame.GuildMemberDetailFrame.RemoveButton)
	T:HandleButton(CommunitiesFrame.GuildMemberDetailFrame.GroupInviteButton)
	T:HandleDropDownFrame(CommunitiesFrame.GuildMemberDetailFrame.RankDropdown)

	-- [[ ROSTER TAB ]]
	local MemberList = CommunitiesFrame.MemberList
	local ColumnDisplay = MemberList.ColumnDisplay
	ColumnDisplay:StripTextures()
	ColumnDisplay.InsetBorderLeft:Hide()
	ColumnDisplay.InsetBorderBottomLeft:Hide()
	ColumnDisplay.InsetBorderTopLeft:Hide()
	ColumnDisplay.InsetBorderTop:Hide()

	T:HandleInsetFrameTemplate(CommunitiesFrame.MemberList.InsetFrame)
	T:HandleDropDownFrame(CommunitiesFrame.GuildMemberListDropDownMenu)
	T:HandleButton(CommunitiesFrame.CommunitiesControlFrame.GuildControlButton)
	T:HandleButton(CommunitiesFrame.CommunitiesControlFrame.GuildRecruitmentButton)
	T:HandleButton(CommunitiesFrame.CommunitiesControlFrame.CommunitiesSettingsButton)
	T.SkinCheckBox(CommunitiesFrame.MemberList.ShowOfflineButton)

	local function UpdateNames(self)
		if not self.expanded then return end

		local memberInfo = self:GetMemberInfo()
		if memberInfo and memberInfo.classID then
			local classInfo = C_CreatureInfo_GetClassInfo(memberInfo.classID)
			if classInfo then
				local tcoords = CLASS_ICON_TCOORDS[classInfo.classFile]
				self.Class:SetTexCoord(tcoords[1] + .022, tcoords[2] - .025, tcoords[3] + .022, tcoords[4] - .025)
			end
		end
	end

	hooksecurefunc(CommunitiesFrame.MemberList, "RefreshListDisplay", function(self)
		for i = 1, self.ColumnDisplay:GetNumChildren() do
			local child = select(i, self.ColumnDisplay:GetChildren())
			if not child.IsSkinned then
				child:StripTextures()
				child:SetTemplate("Transparent")

				child.IsSkinned = true
			end
		end

		for _, button in ipairs(self.ListScrollFrame.buttons or {}) do
			if button and not button.hooked then
				hooksecurefunc(button, "RefreshExpandedColumns", UpdateNames)
				if button.ProfessionHeader then
					local header = button.ProfessionHeader
					for i = 1, 3 do
						select(i, header:GetRegions()):Hide()
					end
					header:SetTemplate("Transparent")
				end

				button.hooked = true
			end
			if button and button.bg then
				button.bg:SetShown(button.Class:IsShown())
			end
		end
	end)

	-- [[ PERKS TAB ]]
	local GuildBenefitsFrame = CommunitiesFrame.GuildBenefitsFrame
	GuildBenefitsFrame.InsetBorderLeft:Hide()
	GuildBenefitsFrame.InsetBorderRight:Hide()
	GuildBenefitsFrame.InsetBorderBottomRight:Hide()
	GuildBenefitsFrame.InsetBorderBottomLeft:Hide()
	GuildBenefitsFrame.InsetBorderTopRight:Hide()
	GuildBenefitsFrame.InsetBorderTopLeft:Hide()
	GuildBenefitsFrame.InsetBorderLeft2:Hide()
	GuildBenefitsFrame.InsetBorderBottomLeft2:Hide()
	GuildBenefitsFrame.InsetBorderTopLeft2:Hide()

	GuildBenefitsFrame.Perks:StripTextures()
	--x GuildBenefitsFrame.Perks.TitleText:FontTemplate(nil, 14)

	for i = 1, 5 do
		local button = _G["CommunitiesFrameContainerButton"..i]
		button:DisableDrawLayer("BACKGROUND")
		button:DisableDrawLayer("BORDER")
		button:CreateBackdrop("Default")

		button.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	end

	--x GuildBenefitsFrame.Rewards.TitleText:FontTemplate(nil, 14)

	GuildBenefitsFrame.Rewards.Bg:Hide()

	T:HandleScrollSlider(CommunitiesFrameRewards.scrollBar)

	hooksecurefunc("CommunitiesGuildRewards_Update", function(self)
		local scrollFrame = self.RewardsContainer
		local offset = HybridScrollFrame_GetOffset(scrollFrame)
		local buttons = scrollFrame.buttons
		local button, index
		local numButtons = #buttons

		for i = 1, numButtons do
			button = buttons[i]
			index = offset + i

			if not button.backdrop then
				button:CreateBackdrop("Default")
			end

			button:SetNormalTexture("")
			button:SetHighlightTexture("")

			if not button.hover then
				local hover = button:CreateTexture()
				hover:SetColorTexture(1, 1, 1, 0.3)
				hover:SetInside()
				button.hover = hover
				button:SetHighlightTexture(hover)
			end

			button.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

			button.index = index
		end
	end)

	-- Guild Reputation Bar TO DO: Adjust me!
	local StatusBar = CommunitiesFrame.GuildBenefitsFrame.FactionFrame.Bar
	StatusBar.Middle:Hide()
	StatusBar.Right:Hide()
	StatusBar.Left:Hide()
	StatusBar.BG:Hide()
	StatusBar.Shadow:Hide()
	StatusBar.Progress:SetTexture("\\Interface\\AddOns\\ViksUI\\Media\\textures\\normTex.tga")
	StatusBar.Progress:SetAllPoints()

	local bg = CreateFrame("Frame", nil, StatusBar)
	bg:SetPoint("TOPLEFT", 0, -3)
	bg:SetPoint("BOTTOMRIGHT", 0, 1)
	bg:SetFrameLevel(StatusBar:GetFrameLevel())
	bg:CreateBackdrop("Default")

	-- [[ INFO TAB ]]
	local GuildDetails = _G["CommunitiesFrameGuildDetailsFrame"]
	GuildDetails.InsetBorderLeft:Hide()
	GuildDetails.InsetBorderRight:Hide()
	GuildDetails.InsetBorderBottomRight:Hide()
	GuildDetails.InsetBorderBottomLeft:Hide()
	GuildDetails.InsetBorderTopRight:Hide()
	GuildDetails.InsetBorderTopLeft:Hide()
	GuildDetails.InsetBorderLeft2:Hide()
	GuildDetails.InsetBorderBottomLeft2:Hide()
	GuildDetails.InsetBorderTopLeft2:Hide()

	local striptextures = {
		"CommunitiesFrameGuildDetailsFrameInfo",
		"CommunitiesFrameGuildDetailsFrameNews",
		"CommunitiesGuildNewsFiltersFrame",
	}

	for _, frame in pairs(striptextures) do
		_G[frame]:StripTextures()
	end

	hooksecurefunc("GuildNewsButton_SetNews", function(button, news_id)
		local newsInfo = C_GuildInfo_GetGuildNewsInfo(news_id)
		if newsInfo then
			if button.header:IsShown() then
				button.header:SetAlpha(0)
			end
		end
	end)

	T:HandleScrollBar(CommunitiesFrameGuildDetailsFrameInfoScrollBar)
	T:HandleScrollSlider(CommunitiesFrameGuildDetailsFrameNewsContainer.ScrollBar)
	T:HandleButton(CommunitiesFrame.GuildLogButton)

	-- Filters Frame
	local FiltersFrame = _G["CommunitiesGuildNewsFiltersFrame"]
	FiltersFrame:CreateBackdrop("Transparent")
	T.SkinCheckBox(FiltersFrame.GuildAchievement)
	T.SkinCheckBox(FiltersFrame.Achievement)
	T.SkinCheckBox(FiltersFrame.DungeonEncounter)
	T.SkinCheckBox(FiltersFrame.EpicItemLooted)
	T.SkinCheckBox(FiltersFrame.EpicItemCrafted)
	T.SkinCheckBox(FiltersFrame.EpicItemPurchased)
	T.SkinCheckBox(FiltersFrame.LegendaryItemLooted)
	T.SkinCloseButton(FiltersFrame.CloseButton)
	
	-- Guild Message EditBox
	local EditFrame = _G["CommunitiesGuildTextEditFrame"]
	EditFrame:StripTextures()
	EditFrame:SetTemplate("Transparent")
	EditFrame.Container:SetTemplate("Transparent")
	T:HandleScrollBar(CommunitiesGuildTextEditFrameScrollBar)
	T:HandleButton(CommunitiesGuildTextEditFrameAcceptButton)
	local closeButton = select(4, CommunitiesGuildTextEditFrame:GetChildren())
	T:HandleButton(closeButton)
	T.SkinCloseButton(CommunitiesGuildTextEditFrameCloseButton)

	-- Guild Log
	local GuildLogFrame = _G["CommunitiesGuildLogFrame"]
	GuildLogFrame:StripTextures()
	GuildLogFrame.Container:StripTextures()
	GuildLogFrame:CreateBackdrop("Transparent")

	T:HandleScrollBar(CommunitiesGuildLogFrameScrollBar, 4)
	T.SkinCloseButton(CommunitiesGuildLogFrameCloseButton)
	local closeButton = select(3, CommunitiesGuildLogFrame:GetChildren())
	T:HandleButton(closeButton)

	-- Recruitment Info
	local RecruitmentFrame = _G["CommunitiesGuildRecruitmentFrame"]
	RecruitmentFrame:StripTextures()
	RecruitmentFrame:CreateBackdrop("Transparent")
	CommunitiesGuildRecruitmentFrameInset:StripTextures(false)

	-- CheckBoxes
	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.QuestButton)
	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.DungeonButton)
	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.RaidButton)
	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.PvPButton)
	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.InterestFrame.RPButton)

	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.AvailabilityFrame.WeekdaysButton)
	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.AvailabilityFrame.WeekendsButton)

	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.RolesFrame.TankButton.checkButton)
	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.RolesFrame.HealerButton.checkButton)
	T.SkinCheckBox(CommunitiesGuildRecruitmentFrameRecruitment.RolesFrame.DamagerButton.checkButton)

	T.SkinCloseButton(CommunitiesGuildRecruitmentFrameCloseButton)

	T:HandleButton(CommunitiesGuildRecruitmentFrameRecruitment.ListGuildButton)

	-- Tabs
	for i = 1, 2 do
		T.SkinTab(_G["CommunitiesGuildRecruitmentFrameTab"..i])
	end

	CommunitiesGuildRecruitmentFrameRecruitment.CommentFrame.CommentInputFrame:StripTextures()
	T.SkinEditBox(CommunitiesGuildRecruitmentFrameRecruitment.CommentFrame.CommentInputFrame)

	-- Recruitment Request
	T:HandleButton(CommunitiesGuildRecruitmentFrameApplicants.InviteButton)
	T:HandleButton(CommunitiesGuildRecruitmentFrameApplicants.MessageButton)
	T:HandleButton(CommunitiesGuildRecruitmentFrameApplicants.DeclineButton)

	for i = 1, 5 do
		local bu = _G["CommunitiesGuildRecruitmentFrameApplicantsContainerButton"..i]
		bu:SetBackdrop(nil)
	end

	-- Notification Settings Dialog
	local NotificationSettings = _G["CommunitiesFrame"].NotificationSettingsDialog
	NotificationSettings:StripTextures()
	NotificationSettings:CreateBackdrop("Transparent")
	NotificationSettings.backdrop:SetAllPoints()

	T:HandleDropDownFrame(CommunitiesFrame.NotificationSettingsDialog.CommunitiesListDropDownMenu)
	T.SkinCheckBox(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.Child.QuickJoinButton)
	T:HandleButton(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.Child.AllButton)
	T:HandleButton(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.Child.NoneButton)
	T:HandleButton(CommunitiesFrame.NotificationSettingsDialog.OkayButton)
	T:HandleButton(CommunitiesFrame.NotificationSettingsDialog.CancelButton)
	T:HandleScrollBar(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar) -- Adjust me

	-- Create Channel Dialog
	local EditStreamDialog = CommunitiesFrame.EditStreamDialog
	EditStreamDialog:StripTextures()
	EditStreamDialog:CreateBackdrop("Transparent")
	EditStreamDialog.backdrop:SetAllPoints()

	T.SkinEditBox(EditStreamDialog.NameEdit)
	EditStreamDialog.NameEdit:SetSize(280, 20)
	T.SkinEditBox(EditStreamDialog.Description)
	T.SkinCheckBox(EditStreamDialog.TypeCheckBox)

	T:HandleButton(EditStreamDialog.Accept)
	T:HandleButton(EditStreamDialog.Cancel)

	-- Communities Settings
	local Settings = _G["CommunitiesSettingsDialog"]
	Settings:StripTextures()
	Settings:CreateBackdrop("Transparent")
	Settings.backdrop:SetAllPoints()

	Settings.IconPreview:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	Settings.IconPreviewRing:Hide()

	T.SkinEditBox(Settings.NameEdit)
	T.SkinEditBox(Settings.ShortNameEdit)
	T.SkinEditBox(Settings.Description)
	T.SkinEditBox(Settings.MessageOfTheDay)

	T:HandleButton(Settings.ChangeAvatarButton)
	T:HandleButton(Settings.Accept)
	T:HandleButton(Settings.Delete)
	T:HandleButton(Settings.Cancel)

	-- Avatar Picker
	local Avatar = _G["CommunitiesAvatarPickerDialog"]
	Avatar:StripTextures()
	Avatar:CreateBackdrop("Transparent")
	Avatar.backdrop:SetAllPoints()

	Avatar.ScrollFrame:StripTextures()
	T:HandleScrollBar(CommunitiesAvatarPickerDialogScrollBar)

	T:HandleButton(Avatar.OkayButton)
	T:HandleButton(Avatar.CancelButton)

	-- Invite Frame
	local TicketManager = _G["CommunitiesTicketManagerDialog"]
	TicketManager:StripTextures()
	TicketManager.InviteManager.ArtOverlay:Hide()
	TicketManager.InviteManager.ColumnDisplay:StripTextures()
	TicketManager.InviteManager.ColumnDisplay.InsetBorderLeft:Hide()
	TicketManager.InviteManager.ColumnDisplay.InsetBorderBottomLeft:Hide()
	-- TO DO: Fix the Tabs
	TicketManager.InviteManager.ListScrollFrame:StripTextures()

	TicketManager:CreateBackdrop("Transparent")
	TicketManager.backdrop:SetAllPoints()

	T:HandleButton(TicketManager.LinkToChat)
	T:HandleButton(TicketManager.Copy)
	T:HandleButton(TicketManager.Close)
	T:HandleButton(TicketManager.GenerateLinkButton)

	T:HandleDropDownFrame(TicketManager.ExpiresDropDownMenu)
	T:HandleDropDownFrame(TicketManager.UsesDropDownMenu)

	T:HandleScrollSlider(TicketManager.InviteManager.ListScrollFrame.scrollBar)
	T:HandleButton(TicketManager.MaximizeButton)
end

T.SkinFuncs["Blizzard_Communities"] = LoadSkin
