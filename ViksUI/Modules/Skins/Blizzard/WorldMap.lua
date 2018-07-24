local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

local _G = _G
local function LoadSkin()
	local WorldMapFrame = _G["WorldMapFrame"]
	WorldMapFrame:StripTextures()
	WorldMapFrame.BorderFrame:StripTextures()
	WorldMapFrame.BorderFrame:SetFrameStrata(WorldMapFrame:GetFrameStrata())
	WorldMapFrame.NavBar:StripTextures()
	WorldMapFrame.NavBar.overlay:StripTextures()
	WorldMapFrame.NavBar:SetPoint("TOPLEFT", 1, -40)

	WorldMapFrame.ScrollContainer:CreateBackdrop()
	WorldMapFrame:CreateBackdrop("Transparent")

	WorldMapFrameHomeButton:StripTextures()
	WorldMapFrameHomeButton:SetHeight(25)
	WorldMapFrameHomeButton:CreateBackdrop("Default", true)
	WorldMapFrameHomeButton.backdrop:SetPoint("TOPLEFT", WorldMapFrameHomeButton, "TOPLEFT", 0, 0)
	WorldMapFrameHomeButton.backdrop:SetPoint("BOTTOMRIGHT", WorldMapFrameHomeButton, "BOTTOMRIGHT", -15, 0)
	WorldMapFrameHomeButton:SetFrameLevel(1)

	-- Quest Frames
	local QuestMapFrame = _G["QuestMapFrame"]
	QuestMapFrame.VerticalSeparator:Hide()

	local QuestScrollFrame = _G["QuestScrollFrame"]
	QuestScrollFrame.DetailFrame:StripTextures()
	QuestScrollFrame.Background:SetAlpha(0)
	QuestScrollFrame.Contents.Separator.Divider:Hide()
	QuestScrollFrame.Contents.StoryHeader:StripTextures()
	
	QuestScrollFrame.Contents.StoryHeader:CreateBackdrop("Invisible")
	QuestScrollFrame.Contents.StoryHeader.backdrop:SetBackdropBorderColor(1, 1, 1, 0)
	QuestScrollFrame.Contents.StoryHeader.backdrop:SetBackdropColor(.1,.1,.1, 1)
	QuestScrollFrame.Contents.StoryHeader.backdrop:SetPoint("TOPLEFT", QuestScrollFrame.Contents.StoryHeader, "TOPLEFT", 6, -16)
	QuestScrollFrame.Contents.StoryHeader.backdrop:SetPoint("BOTTOMRIGHT", QuestScrollFrame.Contents.StoryHeader, "BOTTOMRIGHT", -6, 6)
	
	QuestMapFrame.DetailsFrame:StripTextures()
	QuestMapFrame.DetailsFrame.RewardsFrame:StripTextures()

	QuestScrollFrame.DetailFrame:CreateBackdrop("Default")

	QuestScrollFrame.DetailFrame.backdrop:SetPoint("TOPLEFT", QuestScrollFrame.DetailFrame, "TOPLEFT", 1, -3)
	QuestScrollFrame.DetailFrame.backdrop:SetPoint("BOTTOMRIGHT", QuestScrollFrame.DetailFrame, "BOTTOMRIGHT", -1, 1)

	T:HandleScrollBar(QuestScrollFrameScrollBar)

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
		T:HandleWorldMapDropDownMenu(Frame)
	end

	-- Tracking Button
	local function WorldMapTrackingOptionsButton(Button)
		local shadow = Button:GetRegions()
		shadow:Hide()

		Button.Background:Hide()
		Button.IconOverlay:SetAlpha(0)
		Button.Border:Hide()

		local tex = Button:GetHighlightTexture()
		tex:SetTexture([[Interface\Minimap\Tracking\None]], "ADD")
		tex:SetAllPoints(Button.Icon)
	end

	-- Bounty Board
	local function WorldMapBountyBoard(Frame)
		T.SkinCloseButton(Frame.TutorialBox.CloseButton)
	end

	-- Add a hook to adjust the OverlayFrames
	hooksecurefunc(WorldMapFrame, "AddOverlayFrame", T.WorldMapMixin_AddOverlayFrame)

	-- Elements
	WorldMapFloorNavigationDropDown(WorldMapFrame.overlayFrames[1])
	WorldMapTrackingOptionsButton(WorldMapFrame.overlayFrames[2])
	WorldMapBountyBoard(WorldMapFrame.overlayFrames[3])

end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)