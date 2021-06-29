local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end


local _G = _G
local hooksecurefunc = hooksecurefunc

local function SkinHeaders(header)
	if not header.IsSkinned then
		if header.TopFiligree then header.TopFiligree:Hide() end

		header:SetAlpha(.8)

		header.HighlightTexture:SetAllPoints(header.Background)
		header.HighlightTexture:SetAlpha(0)

		header.IsSkinned = true
	end
end
WorldMapFrame.Header = CreateFrame("Frame", nil, WorldMapFrame)
local function LoadSkin()
	local WorldMapFrame = _G["WorldMapFrame"]
	WorldMapFrame:StripTextures()
	WorldMapFrame.BorderFrame:StripTextures()
	WorldMapFrame.BorderFrame:SetFrameStrata(WorldMapFrame:GetFrameStrata())
	WorldMapFrame.BorderFrame.NineSlice:Hide()									   
	WorldMapFrame.NavBar:StripTextures()
	WorldMapFrame.NavBar.overlay:StripTextures()
	--WorldMapFrame.NavBar:SetPoint("TOPLEFT", 1, -42)

	WorldMapFrame.ScrollContainer:CreateBackdrop()
	WorldMapFrame:CreateBackdrop("Transparent")
	WorldMapFrame.backdrop:SetPoint("TOPLEFT", WorldMapFrame, "TOPLEFT", -2, 0)
	WorldMapFrame.backdrop:SetPoint("BOTTOMRIGHT", WorldMapFrame, "BOTTOMRIGHT", 0, -9)	
	
	WorldMapFrameHomeButton:SkinButton(true)
	WorldMapFrame.NavBar.homeButton.xoffset = 1	
	WorldMapFrame.NavBar.homeButton.text:SetFont(C.media.normal_font, 14)

	-- Quest Frames
	local QuestMapFrame = _G["QuestMapFrame"]
	QuestMapFrame.VerticalSeparator:Hide()
	QuestMapFrame:SetScript('OnHide', nil)
	QuestMapFrame.DetailsFrame:StripTextures(true)
	QuestMapFrame.DetailsFrame:CreateBackdrop()
	--QuestMapFrame.DetailsFrame.backdrop:Point('TOPLEFT', 2, 2)
	--QuestMapFrame.DetailsFrame.backdrop:Point('BOTTOMRIGHT', QuestMapFrame.DetailsFrame.RewardsFrame, 'TOPRIGHT', -2, 1)
	QuestMapFrame.DetailsFrame.RewardsFrame:StripTextures()
	--QuestMapFrame.DetailsFrame.RewardsFrame:CreateBackdrop()

	if QuestMapFrame.Background then
		QuestMapFrame.Background:SetAlpha(0)
	end

	if QuestMapFrame.DetailsFrame.SealMaterialBG then
		QuestMapFrame.DetailsFrame.SealMaterialBG:SetAlpha(0)
	end
		
	local QuestScrollFrame = _G.QuestScrollFrame
	QuestScrollFrame.DetailFrame:StripTextures()
	QuestScrollFrame.DetailFrame.BottomDetail:Hide()
	QuestScrollFrame.Contents.Separator.Divider:Hide()

	local QuestScrollFrameScrollBar = _G.QuestScrollFrame.ScrollBar
	QuestScrollFrame.DetailFrame:CreateBackdrop(nil, nil, nil, nil, nil, nil, nil, 1)
	QuestScrollFrame.DetailFrame.backdrop:SetFrameLevel(1)
	QuestScrollFrame.DetailFrame.backdrop:Point('TOPLEFT', QuestScrollFrame.DetailFrame, 'TOPLEFT', 0, 1)
	QuestScrollFrame.DetailFrame.backdrop:Point('BOTTOMRIGHT', QuestScrollFrame.DetailFrame, 'BOTTOMRIGHT', 2, -4)
	QuestMapFrame.Background:SetInside(QuestScrollFrame.DetailFrame.backdrop)

	SkinHeaders(QuestScrollFrame.Contents.StoryHeader)
	T.SkinScrollBar(QuestScrollFrameScrollBar, 3, 3)
	QuestScrollFrameScrollBar:Point('TOPLEFT', QuestScrollFrame.DetailFrame, 'TOPRIGHT', 5, -15)
	QuestScrollFrameScrollBar:Point('BOTTOMLEFT', QuestScrollFrame.DetailFrame, 'BOTTOMRIGHT', 6, 8)

	T:HandleButton(QuestMapFrame.DetailsFrame.BackButton, true)
	QuestMapFrame.DetailsFrame.BackButton:SetFrameLevel(5)
	T:HandleButton(QuestMapFrame.DetailsFrame.AbandonButton, true)
	QuestMapFrame.DetailsFrame.AbandonButton:SetFrameLevel(5)
	T:HandleButton(QuestMapFrame.DetailsFrame.ShareButton, true)
	QuestMapFrame.DetailsFrame.ShareButton:SetFrameLevel(5)
	T:HandleButton(QuestMapFrame.DetailsFrame.TrackButton, true)
	QuestMapFrame.DetailsFrame.TrackButton:SetFrameLevel(5)
	QuestMapFrame.DetailsFrame.TrackButton:Width(95)
	T:HandleButton(QuestMapFrame.DetailsFrame.CompleteQuestFrame.CompleteButton, true)
	if T.newPatch then
		QuestMapFrame.DetailsFrame.Bg:Hide()
	end
	local CampaignOverview = QuestMapFrame.CampaignOverview
	CampaignOverview:StripTextures()
	CampaignOverview.ScrollFrame:StripTextures()
	T.SkinScrollBar(QuestMapFrameScrollBar)
	CampaignOverview:CreateBackdrop("Overlay")
	CampaignOverview.backdrop:SetPoint("TOPLEFT", CampaignOverview.Header, "TOPLEFT",  8, -5)
	CampaignOverview.backdrop:SetPoint("BOTTOMRIGHT", CampaignOverview.Header, "BOTTOMRIGHT", -4, 10)
	CampaignOverview.backdrop.overlay:SetVertexColor(1, 1, 1, 0.2)
	CampaignOverview.Header.Background:SetAlpha(0)
	CampaignOverview.Header.TopFiligree:Hide()

	do
		local frame = QuestScrollFrame.Contents.StoryHeader
		frame:CreateBackdrop("Overlay")
		frame.backdrop:SetPoint("TOPLEFT", 6, -9)
		frame.backdrop:SetPoint("BOTTOMRIGHT", -6, 11)
		frame.HighlightTexture:Hide()
		frame.Background:SetAlpha(0)
		frame.backdrop.overlay:SetVertexColor(1, 1, 1, 0.2)
	end

	QuestMapFrame.QuestsFrame.StoryTooltip:SetTemplate('Transparent')									 

	QuestMapFrame.QuestsFrame.StoryTooltip:SetTemplate('Transparent')
	
	T.SkinScrollBar(_G.QuestMapDetailsScrollFrame.ScrollBar)
	QuestMapFrame.DetailsFrame.CompleteQuestFrame:StripTextures()

	T:HandleNextPrevButton(WorldMapFrame.SidePanelToggle.CloseButton, nil, true)
	T:HandleNextPrevButton(WorldMapFrame.SidePanelToggle.OpenButton)

	T.SkinCloseButton(WorldMapFrameCloseButton)
	T:HandleMaxMinFrame(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame)
	WorldMapFrame.BorderFrame.MaximizeMinimizeFrame:ClearAllPoints()
	WorldMapFrame.BorderFrame.MaximizeMinimizeFrame:Point('RIGHT', WorldMapFrame.BorderFrame.CloseButton, 'LEFT', 12, 0)															 

	WorldMapFrame.BorderFrame.Tutorial:Kill()

	-- Add a hook to adjust the OverlayFrames
	hooksecurefunc(WorldMapFrame, 'AddOverlayFrame', T.WorldMapMixin_AddOverlayFrame)
	
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

	-- Tracking Pin
	local function WorldMapTrackingPinButton(button)
		local shadow = button:GetRegions()
		shadow:Hide()

		button.Background:Hide()
		button.IconOverlay:SetAlpha(0)
		button.Border:Hide()
		button.Icon:SetTexture([[Interface\AddOns\ViksUI\Media\menuicons\trackingmap.tga]])

		local tex = button:GetHighlightTexture()
		tex:SetAtlas([[Interface\AddOns\ViksUI\Media\menuicons\trackingmap.tga]])
		tex:SetAllPoints(button.Icon)
	end
	
	-- Add a hook to adjust the OverlayFrames
	hooksecurefunc(WorldMapFrame, "AddOverlayFrame", T.WorldMapMixin_AddOverlayFrame)

	-- Elements
	WorldMapFloorNavigationDropDown(WorldMapFrame.overlayFrames[1])
	WorldMapTrackingOptionsButton(WorldMapFrame.overlayFrames[2])
	WorldMapTrackingPinButton(WorldMapFrame.overlayFrames[3])

	WorldMapFrame.overlayFrames[2]:StripTextures()
	WorldMapFrame.overlayFrames[2].Icon:SetTexture([[Interface\Minimap\Tracking\None]])
	WorldMapFrame.overlayFrames[2]:SetHighlightTexture([[Interface\Minimap\Tracking\None]], 'ADD')
	WorldMapFrame.overlayFrames[2]:GetHighlightTexture():SetAllPoints(WorldMapFrame.overlayFrames[2].Icon)
	
	-- 8.2.5 Party Sync | Credits Aurora/Shestak
	QuestMapFrame.QuestSessionManagement:StripTextures()

	local ExecuteSessionCommand = QuestMapFrame.QuestSessionManagement.ExecuteSessionCommand
	ExecuteSessionCommand:CreateBackdrop()
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
	
		hooksecurefunc('QuestLogQuests_Update', function()
		for header in QuestScrollFrame.campaignHeaderFramePool:EnumerateActive() do
			SkinHeaders(header)
		end
	end)
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)