local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end


local _G = _G
local function WorldMapBountyBoard(Frame)
	Frame.BountyName:FontTemplate()

	T.SkinCloseButton(Frame.TutorialBox.CloseButton)
end
local function LoadSkin()
	local WorldMapFrame = _G["WorldMapFrame"]
	WorldMapFrame:StripTextures()
	WorldMapFrame.BorderFrame:StripTextures()
	WorldMapFrame.BorderFrame:SetFrameStrata(WorldMapFrame:GetFrameStrata())
	WorldMapFrame.BorderFrame.NineSlice:Hide()									   
	WorldMapFrame.NavBar:StripTextures()
	WorldMapFrame.NavBar.overlay:StripTextures()
	WorldMapFrame.NavBar:SetPoint("TOPLEFT", 1, -40)

	WorldMapFrame.ScrollContainer:CreateBackdrop()
	WorldMapFrame:CreateBackdrop("Transparent")
	WorldMapFrame.backdrop:SetPoint("TOPLEFT", WorldMapFrame, "TOPLEFT", -8, 0)
	WorldMapFrame.backdrop:SetPoint("BOTTOMRIGHT", WorldMapFrame, "BOTTOMRIGHT", 0, -9)																

	WorldMapFrameHomeButton:StripTextures()
	WorldMapFrameHomeButton:SetHeight(25)
	WorldMapFrameHomeButton:CreateBackdrop("Default", true)
	WorldMapFrameHomeButton.backdrop:SetPoint("TOPLEFT", WorldMapFrameHomeButton, "TOPLEFT", 0, 0)
	WorldMapFrameHomeButton.backdrop:SetPoint("BOTTOMRIGHT", WorldMapFrameHomeButton, "BOTTOMRIGHT", -15, 0)
	WorldMapFrameHomeButton:SetFrameLevel(1)

	-- Quest Frames
	local QuestMapFrame = _G["QuestMapFrame"]
	QuestMapFrame.VerticalSeparator:Hide()
	WorldMapFrame.BorderFrame.NineSlice:Hide()
	local QuestScrollFrame = _G["QuestScrollFrame"]
	QuestScrollFrame.DetailFrame:StripTextures()
	QuestScrollFrame.DetailFrame.BottomDetail:Hide()
	QuestScrollFrame.Background:SetAlpha(0)
	QuestScrollFrame.Contents.Separator.Divider:Hide()
	QuestScrollFrame.Contents.StoryHeader:StripTextures()
	
	local QuestScrollFrameScrollBar = _G.QuestScrollFrameScrollBar
	QuestScrollFrame.DetailFrame:CreateBackdrop("Default")
	QuestScrollFrame.DetailFrame.backdrop:SetFrameLevel(1)
	QuestScrollFrame.DetailFrame.backdrop:Point("TOPLEFT", QuestScrollFrame.DetailFrame, "TOPLEFT", 3, 1)
	QuestScrollFrame.DetailFrame.backdrop:Point("BOTTOMRIGHT", QuestScrollFrame.DetailFrame, "BOTTOMRIGHT", -2, -7)
	QuestScrollFrame.Background:SetInside(QuestScrollFrame.DetailFrame.backdrop)
	QuestScrollFrame.Contents.StoryHeader.Background:Width(251)
	QuestScrollFrame.Contents.StoryHeader.Background:SetPoint("TOP", 0, -9)
	QuestScrollFrame.Contents.StoryHeader.Text:SetPoint("TOPLEFT", 18, -20)
	QuestScrollFrame.Contents.StoryHeader.HighlightTexture:SetAllPoints(QuestScrollFrame.Contents.StoryHeader.Background)
	QuestScrollFrame.Contents.StoryHeader.HighlightTexture:SetAlpha(0)
	
	QuestMapFrame.DetailsFrame:StripTextures()
	QuestMapFrame.DetailsFrame.RewardsFrame:StripTextures()

	T.SkinScrollBar(QuestScrollFrameScrollBar)

	local QuestMapFrame = _G["QuestMapFrame"]
	T:HandleButton(QuestMapFrame.DetailsFrame.BackButton)
	T:HandleButton(QuestMapFrame.DetailsFrame.AbandonButton)
	T:HandleButton(QuestMapFrame.DetailsFrame.ShareButton, true)
	T:HandleButton(QuestMapFrame.DetailsFrame.TrackButton)
	T:HandleButton(QuestMapFrame.DetailsFrame.CompleteQuestFrame.CompleteButton, true)

	QuestMapFrame.QuestsFrame.StoryTooltip:SetTemplate("Transparent")
	QuestScrollFrame.WarCampaignTooltip:SetTemplate("Transparent")

	QuestMapFrame.DetailsFrame.CompleteQuestFrame:StripTextures()

	T:HandleNextPrevButton(WorldMapFrame.SidePanelToggle.CloseButton, nil, true)
	T:HandleNextPrevButton(WorldMapFrame.SidePanelToggle.OpenButton)

	T.SkinCloseButton(WorldMapFrameCloseButton)
	T:HandleMaxMinFrame(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame)

	WorldMapFrame.BorderFrame.Tutorial:Kill()

	-- Floor Dropdown
	local function WorldMapFloorNavigationDropDown(Frame)
		Frame:SetFrameLevel(WorldMapFrame:GetFrameLevel()+3)
		T:HandleWorldMapDropDownMenu(Frame)
	end

	-- Tracking Button
	local function WorldMapTrackingOptionsButton(Button)
		local shadow = Button:GetRegions()
		shadow:Hide()

		Button.Background:Hide()
		Button.IconOverlay:SetAlpha(0)
		Button.Border:Hide()

		Button:SetFrameLevel(WorldMapFrame:GetFrameLevel()+2)

		local tex = Button:GetHighlightTexture()
		tex:SetTexture([[Interface\Minimap\Tracking\None]], "ADD")
		tex:SetAllPoints(Button.Icon)
	end

	-- Bounty Board
	local function WorldMapBountyBoard(Frame)
		Frame:SetFrameLevel(WorldMapFrame:GetFrameLevel()+2)
		T.SkinCloseButton(Frame.TutorialBox.CloseButton)
	end

	-- Add a hook to adjust the OverlayFrames
	hooksecurefunc(WorldMapFrame, "AddOverlayFrame", T.WorldMapMixin_AddOverlayFrame)

	-- Elements
	WorldMapFloorNavigationDropDown(WorldMapFrame.overlayFrames[1])
	WorldMapTrackingOptionsButton(WorldMapFrame.overlayFrames[2])
	WorldMapBountyBoard(WorldMapFrame.overlayFrames[3])

	WorldMapBountyBoard(WorldMapFrame.overlayFrames[3]) -- BountyBoard
	QuestMapFrame.QuestSessionManagement:StripTextures()

	local ExecuteSessionCommand = QuestMapFrame.QuestSessionManagement.ExecuteSessionCommand
	ExecuteSessionCommand:SetTemplate("Default")
	ExecuteSessionCommand:StyleButton()

	local icon = ExecuteSessionCommand:CreateTexture(nil, "ARTWORK")
	icon:SetPoint("TOPLEFT", 0, 0)
	icon:SetPoint("BOTTOMRIGHT", 0, 0)
	ExecuteSessionCommand.normalIcon = icon

	local sessionCommandToButtonAtlas = { -- Skin from Aurora
		[_G.Enum.QuestSessionCommand.Start] = "QuestSharing-DialogIcon",
		[_G.Enum.QuestSessionCommand.Stop] = "QuestSharing-Stop-DialogIcon"
	}

	hooksecurefunc(QuestMapFrame.QuestSessionManagement, "UpdateExecuteCommandAtlases", function(self, command)
		self.ExecuteSessionCommand:SetNormalTexture("")
		self.ExecuteSessionCommand:SetPushedTexture("")
		self.ExecuteSessionCommand:SetDisabledTexture("")

		local atlas = sessionCommandToButtonAtlas[command]
		if atlas then
			self.ExecuteSessionCommand.normalIcon:SetAtlas(atlas)
		end
	end)

	hooksecurefunc(QuestSessionManager, "NotifyDialogShow", function(_, dialog)
		if not dialog.isSkinned then
			dialog:StripTextures()
			dialog:SetTemplate("Transparent")
			dialog.ButtonContainer.Confirm:SkinButton()
			dialog.ButtonContainer.Decline:SkinButton()
			if dialog.MinimizeButton then
				T.SkinCloseButton(dialog.MinimizeButton, nil, "-")
			end
			dialog.isSkinned = true
		end
	end)
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)