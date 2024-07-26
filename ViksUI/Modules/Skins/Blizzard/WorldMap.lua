local T, C, L = unpack(ViksUI)
if C.skins.blizzard_frames ~= true then return end


local _G = _G
local hooksecurefunc = hooksecurefunc

local function SkinHeaders(header, isCalling)
	if header.IsSkinned then return end

	if header.Background then header.Background:SetAlpha(.7) end
	if header.TopFiligree then header.TopFiligree:Hide() end
	if header.Divider then header.Divider:Hide() end

	header.HighlightTexture:SetAllPoints(header.Background)
	header.HighlightTexture:SetAlpha(0)

	local collapseButton = isCalling and header or header.CollapseButton
	if collapseButton then
		collapseButton:GetPushedTexture():SetAlpha(0)
		collapseButton:GetHighlightTexture():SetAlpha(0)
		T.SkinExpandOrCollapse(collapseButton, true)
	end

	header.IsSkinned = true
end

local function QuestLogQuests()
	for button in _G.QuestScrollFrame.headerFramePool:EnumerateActive() do
		if button.ButtonText and not button.IsSkinned then
			button:StripTextures()
			button.ButtonText:SetFont(C.media.normal_font, 16)
			button.IsSkinned = true
		end
	end

	for button in _G.QuestScrollFrame.titleFramePool:EnumerateActive() do
		if not button.IsSkinned then
			--FIX ME 11.0
			if button.Checkbox then
				button.Checkbox:DisableDrawLayer('BACKGROUND')
				button.Checkbox:CreateBackdrop()
			end

			button.IsSkinned = true
		end
	end

	for header in _G.QuestScrollFrame.campaignHeaderFramePool:EnumerateActive() do
		if header.Text and not header.IsSkinned then
			header.Text:SetFont(C.media.normal_font, 16)
			header.Progress:SetFont(C.media.normal_font, 16)

			header.IsSkinned = true
		end
	end

	for header in _G.QuestScrollFrame.campaignHeaderMinimalFramePool:EnumerateActive() do
		if header.CollapseButton and not header.IsSkinned then
			header:StripTextures()
			header.Background:CreateBackdrop('Transparent')

			local r, g, b = unpack(C.media.border_color)
			header.Highlight:SetColorTexture(0, .38, .651, 1)

			header.IsSkinned = true
		end
	end
end

WorldMapFrame.Header = CreateFrame("Frame", nil, WorldMapFrame)

local function LoadSkin()
	local WorldMapFrame = _G["WorldMapFrame"]
	WorldMapFrame:StripTextures()
	WorldMapFramePortrait:SetAlpha(0)
	WorldMapFrame.BorderFrame:StripTextures()
	WorldMapFrame.BorderFrame:SetFrameStrata(WorldMapFrame:GetFrameStrata())
	WorldMapFrame.BorderFrame.NineSlice:Hide()									   
	WorldMapFrame.NavBar:StripTextures()
	WorldMapFrame.NavBar.overlay:StripTextures()

	WorldMapFrame.ScrollContainer:CreateBackdrop()
	WorldMapFrame:CreateBackdrop("Transparent")
	WorldMapFrame.backdrop:SetPoint("TOPLEFT", WorldMapFrame, "TOPLEFT", -2, 0)
	WorldMapFrame.backdrop:SetPoint("BOTTOMRIGHT", WorldMapFrame, "BOTTOMRIGHT", 0, -9)	
	
	WorldMapFrameHomeButton:SkinButton(true)
	WorldMapFrame.NavBar.homeButton.xoffset = 1	
	WorldMapFrame.NavBar.homeButton.text:SetFont(C.media.normal_font, 14)

	-- Quest Frames
	local QuestMapFrame = _G.QuestMapFrame
	QuestMapFrame.VerticalSeparator:Hide()
	QuestMapFrame:SetScript('OnHide', T.WorldMap_QuestMapHide)
	
	local DetailsFrame = QuestMapFrame.DetailsFrame
	T:HandleButton(DetailsFrame.BackFrame.BackButton, true)
	T:HandleButton(DetailsFrame.AbandonButton, true)
	DetailsFrame.ShareButton:StripTextures() -- strip the Blizz Art around from it
	T:HandleButton(DetailsFrame.ShareButton, true)
	T:HandleButton(DetailsFrame.TrackButton, true)
	
	DetailsFrame:StripTextures()
	DetailsFrame.BackFrame:StripTextures()
	DetailsFrame.BackFrame.BackButton:SetFrameLevel(5)
	DetailsFrame.AbandonButton:SetFrameLevel(5)
	DetailsFrame.ShareButton:SetFrameLevel(5)
	DetailsFrame.TrackButton:SetFrameLevel(5)
	DetailsFrame.TrackButton:Width(95)

	QuestMapFrame.DetailsFrame:StripTextures()
	QuestMapFrame.DetailsFrame.RewardsFrameContainer.RewardsFrame:StripTextures()
	QuestMapFrame.DetailsFrame.Bg:Hide()
	
	if QuestMapFrame.Background then
		QuestMapFrame.Background:SetAlpha(0)
	end

	if QuestMapFrame.DetailsFrame.SealMaterialBG then
		QuestMapFrame.DetailsFrame.SealMaterialBG:SetAlpha(0)
	end
		
	local QuestScrollFrame = _G.QuestScrollFrame
	QuestScrollFrame.Edge:SetAlpha(0)
	QuestScrollFrame.BorderFrame:SetAlpha(0)
	QuestScrollFrame.Background:SetAlpha(0)
	QuestScrollFrame.Contents.Separator.Divider:Hide()
	SkinHeaders(QuestScrollFrame.Contents.StoryHeader)
	T.SkinEditBox(QuestScrollFrame.SearchBox)

	local QuestScrollBar = _G.QuestScrollFrame.ScrollBar
	T.SkinScrollBar(QuestScrollBar)
	QuestScrollBar:SetPoint('TOPLEFT', _G.QuestDetailFrame, 'TOPRIGHT', 4, -15)
	QuestScrollBar:SetPoint('BOTTOMLEFT', _G.QuestDetailFrame, 'BOTTOMRIGHT', 9, 10)
	
	local CampaignOverview = QuestMapFrame.CampaignOverview
	SkinHeaders(CampaignOverview.Header)
	CampaignOverview:StripTextures()
	CampaignOverview.ScrollFrame:StripTextures()
	T.SkinScrollBar(CampaignOverview.ScrollFrame.ScrollBar)
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
		frame.Divider:SetAlpha(0)
		frame.backdrop.overlay:SetVertexColor(1, 1, 1, 0.2)
	end
	
	QuestMapFrame.QuestsFrame.StoryTooltip:SetTemplate('Transparent')									 

	QuestMapFrame.QuestsFrame.StoryTooltip:SetTemplate('Transparent')
	
	T.SkinScrollBar(_G.QuestMapDetailsScrollFrame.ScrollBar)

	T:HandleNextPrevButton(WorldMapFrame.SidePanelToggle.CloseButton, nil, true)
	T:HandleNextPrevButton(WorldMapFrame.SidePanelToggle.OpenButton)

	T.SkinCloseButton(WorldMapFrameCloseButton)
	T:HandleMaxMinFrame(WorldMapFrame.BorderFrame.MaximizeMinimizeFrame)
	WorldMapFrame.BorderFrame.MaximizeMinimizeFrame:ClearAllPoints()
	WorldMapFrame.BorderFrame.MaximizeMinimizeFrame:Point('RIGHT', WorldMapFrame.BorderFrame.CloseButton, 'LEFT', 12, 0)															 

	WorldMapFrame.BorderFrame.Tutorial:Kill()

	do -- Add a hook to adjust the OverlayFrames
		hooksecurefunc(WorldMapFrame, 'AddOverlayFrame', T.WorldMapMixin_AddOverlayFrame)

		local Dropdown, Tracking, Pin = unpack(WorldMapFrame.overlayFrames)
		T.SkinDropDownBox(Dropdown)

		Tracking:StripTextures()
		Tracking.Icon:SetTexture(136460) -- Interface\Minimap\Tracking/None
		Tracking:SetHighlightTexture(136460, 'ADD')

		local TrackingHighlight = Tracking:GetHighlightTexture()
		TrackingHighlight:SetAllPoints(Tracking.Icon)

		Pin:StripTextures()
		Pin.Icon:SetAtlas('Waypoint-MapPin-Untracked')
		Pin.ActiveTexture:SetAtlas('Waypoint-MapPin-Tracked')
		Pin.ActiveTexture:SetAllPoints(Pin.Icon)
		Pin:SetHighlightTexture(3500068, 'ADD') -- Interface\Waypoint\WaypoinMapPinUI

		local PinHighlight = Pin:GetHighlightTexture()
		PinHighlight:SetAllPoints(Pin.Icon)
		PinHighlight:SetTexCoord(0.3203125, 0.5546875, 0.015625, 0.484375)
	end
	
	local MapLegend = QuestMapFrame.MapLegend
	T:HandleButton(MapLegend.BackButton)
	MapLegend.BorderFrame:SetAlpha(0)

	local MapLegendScroll = MapLegend.ScrollFrame
	MapLegendScroll:StripTextures()
	MapLegendScroll:SetTemplate()
	T.SkinScrollBar(MapLegendScroll.ScrollBar)
	
	local function HandyNotesButton(button)
		local shadow = button:GetRegions()
		shadow:Hide()

		button.Background:Hide()
		button.IconOverlay:SetAlpha(0)
		button.Border:Hide()

		local tex = button:GetHighlightTexture()
		tex:SetAtlas(button.Icon:GetTexture())
		tex:SetAllPoints(button.Icon)
	end


	WorldMapFrame.overlayFrames[2]:StripTextures()
	WorldMapFrame.overlayFrames[2].Icon:SetTexture([[Interface\Minimap\Tracking\None]])
	WorldMapFrame.overlayFrames[2]:SetHighlightTexture([[Interface\Minimap\Tracking\None]], 'ADD')
	WorldMapFrame.overlayFrames[2]:GetHighlightTexture():SetAllPoints(WorldMapFrame.overlayFrames[2].Icon)

	for i = 1, 10 do
		local button = _G["Krowi_WorldMapButtons"..i]
		if button then
			HandyNotesButton(button)
		end
	end

	for i = 3, #WorldMapFrame.overlayFrames do
		local frame = WorldMapFrame.overlayFrames[i]
		if frame.BountyDropdownButton then
			T.SkinNextPrevButton(frame.BountyDropdownButton)
			break
		end
	end

	-- QuestSessionManagement skin (based on skin from Aurora)
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
		self.ExecuteSessionCommand:SetNormalTexture(0)
		self.ExecuteSessionCommand:SetPushedTexture(0)
		self.ExecuteSessionCommand:SetDisabledTexture(0)

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
	hooksecurefunc('QuestLogQuests_Update', QuestLogQuests)
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)