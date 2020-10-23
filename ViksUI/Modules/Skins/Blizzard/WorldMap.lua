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
	WorldMapFrame.backdrop:SetPoint("TOPLEFT", WorldMapFrame, "TOPLEFT", -8, 0)
	WorldMapFrame.backdrop:SetPoint("BOTTOMRIGHT", WorldMapFrame, "BOTTOMRIGHT", 0, -9)	
	
	WorldMapFrameHomeButton:SkinButton(true)
	WorldMapFrame.NavBar.homeButton.xoffset = 1	
	WorldMapFrame.NavBar.homeButton.text:SetFont(C.media.normal_font, 14)

	-- Quest Frames
	local QuestMapFrame = _G["QuestMapFrame"]
	QuestMapFrame.VerticalSeparator:Hide()
	
	QuestMapFrame.DetailsFrame:StripTextures(true)
	QuestMapFrame.DetailsFrame:CreateBackdrop()
	QuestMapFrame.DetailsFrame.backdrop:Point('TOPLEFT', 0, 0)
	QuestMapFrame.DetailsFrame.backdrop:Point('BOTTOMRIGHT', QuestMapFrame.DetailsFrame.RewardsFrame, 'TOPRIGHT', 0, 1)
	QuestMapFrame.DetailsFrame.RewardsFrame:StripTextures()
	QuestMapFrame.DetailsFrame.RewardsFrame:CreateBackdrop()

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
	QuestScrollFrame.DetailFrame:CreateBackdrop()
	QuestScrollFrame.DetailFrame.backdrop:SetFrameLevel(1)
	QuestScrollFrame.DetailFrame.backdrop:Point('TOPLEFT', QuestScrollFrame.DetailFrame, 'TOPLEFT', 3, 1)
	QuestScrollFrame.DetailFrame.backdrop:Point('BOTTOMRIGHT', QuestScrollFrame.DetailFrame, 'BOTTOMRIGHT', -2, -7)

	SkinHeaders(QuestScrollFrame.Contents.StoryHeader)
	T.SkinScrollBar(QuestScrollFrameScrollBar, 3, 3)
	QuestScrollFrameScrollBar:Point('TOPLEFT', QuestScrollFrame.DetailFrame, 'TOPRIGHT', 1, -15)
	QuestScrollFrameScrollBar:Point('BOTTOMLEFT', QuestScrollFrame.DetailFrame, 'BOTTOMRIGHT', 6, 10)

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

	local CampaignOverview = QuestMapFrame.CampaignOverview
	SkinHeaders(CampaignOverview.Header)
	CampaignOverview.ScrollFrame:StripTextures()
	T.SkinScrollBar(_G.QuestMapFrameScrollBar)


	QuestMapFrame.QuestsFrame.StoryTooltip:SetTemplate('Transparent')

	QuestMapFrame.DetailsFrame.CompleteQuestFrame:StripTextures()

	T:HandleNextPrevButton(WorldMapFrame.SidePanelToggle.CloseButton, nil, true)
	T:HandleNextPrevButton(WorldMapFrame.SidePanelToggle.OpenButton)

	T.SkinCloseButton(WorldMapFrameCloseButton)
	T:HandleMaxMinFrame(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame)

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

	-- Add a hook to adjust the OverlayFrames
	hooksecurefunc(WorldMapFrame, "AddOverlayFrame", T.WorldMapMixin_AddOverlayFrame)

	-- Elements
	WorldMapFloorNavigationDropDown(WorldMapFrame.overlayFrames[1])
	WorldMapTrackingOptionsButton(WorldMapFrame.overlayFrames[3])

	WorldMapFrame.overlayFrames[2]:StripTextures()
	WorldMapFrame.overlayFrames[2].Icon:SetTexture([[Interface\Minimap\Tracking\None]])
	WorldMapFrame.overlayFrames[2]:SetHighlightTexture([[Interface\Minimap\Tracking\None]], 'ADD')
	WorldMapFrame.overlayFrames[2]:GetHighlightTexture():SetAllPoints(WorldMapFrame.overlayFrames[2].Icon)
	
	-- 8.2.5 Party Sync | Credits Aurora/Shestak
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
	
		hooksecurefunc('QuestLogQuests_Update', function()
		for header in QuestScrollFrame.campaignHeaderFramePool:EnumerateActive() do
			SkinHeaders(header)
		end
	end)
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)