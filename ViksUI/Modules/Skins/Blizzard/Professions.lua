local T, C, L = unpack(ViksUI)
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Professions skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = ProfessionsFrame
	T.SkinFrame(frame)

	T.SkinMaxMinFrame(frame.MaximizeMinimize, frame.CloseButton)
	T.SkinEditBox(frame.CraftingPage.MinimizedSearchBox, nil, 16)

	ProfessionsFrame.CraftingPage.TutorialButton.Ring:Hide()
	ProfessionsFrame.CraftingPage.TutorialButton:SetPoint("TOPLEFT", frame, "TOPLEFT", -5, 10)

	T.SkinEditBox(frame.CraftingPage.RecipeList.SearchBox, nil, 16)

	T.SkinFilter(frame.CraftingPage.RecipeList.FilterDropdown)
	frame.CraftingPage.RecipeList.FilterDropdown:SetHeight(20)
	frame.CraftingPage.RecipeList.FilterDropdown:SetPoint("TOPRIGHT", ProfessionsFrame.CraftingPage.RecipeList, "TOPRIGHT", -8, -6)

	frame.CraftingPage.ConcentrationDisplay.Icon:SkinIcon()

	local RankBar = frame.CraftingPage.RankBar
	RankBar.Border:Hide()
	RankBar.Background:Hide()
	RankBar:CreateBackdrop("Overlay")
	RankBar.backdrop:SetOutside(RankBar.Fill)

	if RankBar.ExpansionDropdownButton then
		local arrow = RankBar.ExpansionDropdownButton:CreateTexture(nil, "ARTWORK")
		arrow:SetSize(14, 15)
		arrow:SetPoint("CENTER")
		arrow:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
		arrow:SetTexCoord(0.3, 0.29, 0.3, 0.81, 0.65, 0.29, 0.65, 0.81)

		RankBar.ExpansionDropdownButton:SetSize(18, 18)
		RankBar.ExpansionDropdownButton:SetPoint("RIGHT", RankBar, "RIGHT", -7, -3)
		RankBar.ExpansionDropdownButton:SkinButton()
		RankBar.ExpansionDropdownButton.Texture:Hide()
	end

	local LinkButton = frame.CraftingPage.LinkButton
	LinkButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
	LinkButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
	LinkButton:GetHighlightTexture():Kill()
	LinkButton:CreateBackdrop("Overlay")
	LinkButton:SetSize(17, 14)
	LinkButton:SetPoint("LEFT", ProfessionsFrame.CraftingPage.RankBar, "RIGHT", 1, -3)

	for _, name in pairs({"Prof0ToolSlot", "Prof0Gear0Slot", "Prof0Gear1Slot", "Prof1ToolSlot", "Prof1Gear0Slot", "Prof1Gear1Slot", "CookingToolSlot", "CookingGear0Slot", "FishingToolSlot", "FishingGear0Slot", "FishingGear1Slot"}) do
		local button = frame.CraftingPage[name]
		if button then
			button:StripTextures()
			button.icon:SkinIcon()
			T.SkinIconBorder(button.IconBorder, button.icon:GetParent().backdrop)
			button:SetNormalTexture(0)
			button:SetPushedTexture(0)
		end
	end

	hooksecurefunc(_G.ProfessionsFrame.CraftingPage.RecipeList.ScrollBox, "Update", function(frame)
		for _, child in next, {frame.ScrollTarget:GetChildren()} do
			if child.CenterPiece and not child.isSkinned then
				child:DisableDrawLayer("BACKGROUND")
				child:CreateBackdrop("Overlay")
				child.backdrop:SetPoint("TOPLEFT", child, 6, 0)
				child.backdrop:SetPoint("BOTTOMRIGHT", child, -6, 4)
				child.isSkinned = true
			end
		end
	end)

	local RecipeList = frame.CraftingPage.RecipeList
	RecipeList:StripTextures()
	RecipeList.BackgroundNineSlice:Hide()
	T.SkinScrollBar(RecipeList.ScrollBar)

	local SchematicForm = frame.CraftingPage.SchematicForm
	SchematicForm:StripTextures()
	SchematicForm:CreateBackdrop("Overlay")
	SchematicForm.backdrop:SetInside(nil, 5, 5)

	SchematicForm.backdrop:SetPoint("TOPLEFT", 3, -6)
	SchematicForm.backdrop:SetPoint("BOTTOMRIGHT", -3, 5)

	SchematicForm.Background:SetInside(SchematicForm.backdrop, 1, 1)
	SchematicForm.MinimalBackground:SetAlpha(0)

	T.SkinCheckBox(SchematicForm.TrackRecipeCheckbox, 24)
	T.SkinCheckBox(SchematicForm.AllocateBestQualityCheckbox, 24)

	local ConcentrateToggleButton = SchematicForm.Details.CraftingChoicesContainer.ConcentrateContainer.ConcentrateToggleButton
	ConcentrateToggleButton:CreateBackdrop()
	ConcentrateToggleButton.backdrop:SetAllPoints()
	ConcentrateToggleButton.Icon:CropIcon()
	ConcentrateToggleButton:StyleButton()
	ConcentrateToggleButton.NormalTexture:SetAlpha(0)

	local function skinDetails(frame)
		frame:SetFrameLevel(frame:GetFrameLevel() + 1)
		frame:StripTextures()
		frame.backdrop = CreateFrame("Frame", nil, frame)
		frame.backdrop:SetFrameLevel(frame:GetFrameLevel() - 1)
		frame.backdrop:SetTemplate("Overlay")
		frame.backdrop:SetBackdropColor(C.media.backdrop_color[1], C.media.backdrop_color[2], C.media.backdrop_color[3], C.media.backdrop_alpha)
		frame.backdrop.overlay:SetVertexColor(0.1, 0.1, 0.1, 0.5)
		frame.backdrop:SetPoint("TOPLEFT", -2, -15)
		frame.backdrop:SetPoint("BOTTOMRIGHT", 2, 15)
	end

	skinDetails(SchematicForm.Details)

	local OutputIcon = SchematicForm.OutputIcon
	if OutputIcon then
		OutputIcon.Icon:SkinIcon()
		T.SkinIconBorder(OutputIcon.IconBorder, OutputIcon.Icon:GetParent().backdrop)
		OutputIcon:GetHighlightTexture():Hide()
		OutputIcon.CircleMask:Hide()
		if OutputIcon.CountShadow then OutputIcon.CountShadow:SetAlpha(0) end
	end

	local qualityDialog = SchematicForm.QualityDialog
	qualityDialog:StripTextures()
	qualityDialog:SetTemplate("Transparent")
	T.SkinCloseButton(qualityDialog.ClosePanelButton)
	qualityDialog.AcceptButton:SkinButton()
	qualityDialog.CancelButton:SkinButton()

	local function ReskinQualityContainer(container)
		local button = container.Button
		button:StripTextures()
		button:SetNormalTexture(0)
		button:SetPushedTexture(0)
		button:GetHighlightTexture():Hide()
		button.Icon:SkinIcon()
		T.SkinIconBorder(button.IconBorder, button.Icon:GetParent().backdrop)

		local box = container.EditBox
		box:DisableDrawLayer("BACKGROUND")
		T.SkinEditBox(box, nil, 18)
		T.SkinNextPrevButton(box.DecrementButton, true)
		T.SkinNextPrevButton(box.IncrementButton)
		box.DecrementButton:SetSize(22, 22)
		box.IncrementButton:SetSize(22, 22)
		box.IncrementButton:SetPoint("LEFT", box, "RIGHT", 6, 0)
	end

	ReskinQualityContainer(qualityDialog.Container1)
	ReskinQualityContainer(qualityDialog.Container2)
	ReskinQualityContainer(qualityDialog.Container3)

	local function skinReagentIcon(button)
		if button and not button.styled then
			button.Icon:SkinIcon()
			button:SetNormalTexture(0)
			button:SetPushedTexture(0)
			button:GetHighlightTexture():Hide()
			T.SkinIconBorder(button.IconBorder, button.Icon:GetParent().backdrop)
			if button.SlotBackground then
				button.SlotBackground:Hide()
			end
			button.styled = true
		end

		if button then
			button:SetNormalTexture(0)
			button:SetPushedTexture(0)
			button:GetHighlightTexture():Hide()
		end
	end

	hooksecurefunc(SchematicForm, "Init", function(frame)
		for slot in frame.reagentSlotPool:EnumerateActive() do
			skinReagentIcon(slot.Button)
		end

		local slot = SchematicForm.salvageSlot
		if slot then
			skinReagentIcon(slot.Button)
		end

		local slot = SchematicForm.enchantSlot
		if slot then
			skinReagentIcon(slot.Button)
		end
	end)

	hooksecurefunc("OpenProfessionsItemFlyout", T.SkinProfessionsFlyout)

	frame.CraftingPage.CreateAllButton:SkinButton()
	frame.CraftingPage.CreateButton:SkinButton()
	T.SkinEditBox(ProfessionsFrame.CraftingPage.CreateMultipleInputBox, nil, 18)
	T.SkinNextPrevButton(ProfessionsFrame.CraftingPage.CreateMultipleInputBox.DecrementButton, true)
	T.SkinNextPrevButton(ProfessionsFrame.CraftingPage.CreateMultipleInputBox.IncrementButton)
	ProfessionsFrame.CraftingPage.CreateMultipleInputBox.IncrementButton:SetPoint("LEFT", ProfessionsFrame.CraftingPage.CreateMultipleInputBox, "RIGHT", 5, 0)
	ProfessionsFrame.CraftingPage.CreateMultipleInputBox.IncrementButton:SetSize(22, 22)
	ProfessionsFrame.CraftingPage.CreateMultipleInputBox.DecrementButton:SetSize(22, 22)

	for _, tab in next, {frame.TabSystem:GetChildren()} do
		T.SkinTab(tab)
	end

	local function HandleOutputButtons(frame)
		for _, child in next, {frame.ScrollTarget:GetChildren()} do
			if not child.isSkinned then
				local itemContainer = child.ItemContainer
				if itemContainer then
					local item = itemContainer.Item
					item:SetNormalTexture(0)
					item:SetPushedTexture(0)
					item:SetHighlightTexture(0)

					local icon = item:GetRegions()
					icon:SkinIcon()
					item.IconBorder:Kill()

					itemContainer.CritFrame:SetAlpha(0)
					itemContainer.BorderFrame:Hide()
					itemContainer.HighlightNameFrame:SetAlpha(0)
					itemContainer.PushedNameFrame:SetAlpha(0)
					itemContainer.NameFrame:Hide()
				end

				local bonus = child.CreationBonus
				if bonus then
					local item = bonus.Item
					item:StripTextures()
					local icon = item:GetRegions()
					icon:SkinIcon()
				end

				child.isSkinned = true
			end

			local itemContainer = child.ItemContainer
			if itemContainer then
				itemContainer.Item.IconBorder:Hide()
				itemContainer.Item.IconBorder:SetAlpha(0)
			end
		end
	end

	local function ReskinOutputLog(frame)
		frame:StripTextures()
		frame:SetTemplate("Transparent")

		T.SkinCloseButton(frame.ClosePanelButton)
		T.SkinScrollBar(frame.ScrollBar)

		hooksecurefunc(frame.ScrollBox, "Update", HandleOutputButtons)
	end

	ReskinOutputLog(frame.CraftingPage.CraftingOutputLog)

	-- Guild
	frame.CraftingPage.ViewGuildCraftersButton:SkinButton()
	local GuildFrame = frame.CraftingPage.GuildFrame
	GuildFrame:StripTextures()
	GuildFrame:CreateBackdrop("Transparent")
	GuildFrame.Container:StripTextures()
	GuildFrame.Container:CreateBackdrop("Overlay")

	-- Spec page
	local specPage = frame.SpecPage
	specPage.TreeView:StripTextures()
	specPage.TreeView.Background:Hide()
	specPage.PanelFooter:StripTextures()
	specPage.TopDivider:Hide()
	specPage.VerticalDivider:Hide()

	local specPageButtons = {
		specPage.ApplyButton,
		specPage.UnlockTabButton,
		specPage.ViewTreeButton,
		specPage.BackToPreviewButton,
		specPage.ViewPreviewButton,
		specPage.BackToFullTreeButton
	}

	for i = 1, #specPageButtons do
		local button = specPageButtons[i]
		if button then
			button:SkinButton()
		end
	end

	hooksecurefunc(specPage, "UpdateTabs", function(self)
		for tab in self.tabsPool:EnumerateActive() do
			if not tab.styled then
				tab.styled = true
				tab:DisableDrawLayer("BACKGROUND")
				tab:StripTextures()
				tab.backdrop = CreateFrame("Frame", nil, tab)
				tab.backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
				tab.backdrop:SetTemplate("Overlay")
				tab.backdrop:SetPoint("TOPLEFT", 6, -2)
				tab.backdrop:SetPoint("BOTTOMRIGHT", -6, 2)
			end
		end
	end)

	local DetailedView = specPage.DetailedView
	DetailedView:StripTextures()
	DetailedView.UnlockPathButton:SkinButton()
	DetailedView.SpendPointsButton:SkinButton()
	DetailedView.UnspentPoints.Icon:SkinIcon()

	-- Order page
	local Orders = ProfessionsFrame.OrdersPage

	local tabs = {
		Orders.BrowseFrame.PublicOrdersButton,
		Orders.BrowseFrame.GuildOrdersButton,
		Orders.BrowseFrame.PersonalOrdersButton,
		Orders.BrowseFrame.NpcOrdersButton
	}

	for i = 1, #tabs do
		local tab = tabs[i]
		tab:DisableDrawLayer("BACKGROUND")
		tab:StripTextures()
		tab.backdrop = CreateFrame("Frame", nil, tab)
		tab.backdrop:SetFrameLevel(tab:GetFrameLevel() - 1)
		tab.backdrop:SetTemplate("Overlay")
		tab.backdrop:SetPoint("TOPLEFT", 6, -2)
		tab.backdrop:SetPoint("BOTTOMRIGHT", -6, 2)
	end

	local BrowseFrame = Orders.BrowseFrame
	BrowseFrame.OrdersRemainingDisplay:StripTextures()
	BrowseFrame.OrdersRemainingDisplay:CreateBackdrop("Overlay")
	BrowseFrame.FavoritesSearchButton:SkinButton()
	BrowseFrame.FavoritesSearchButton:SetSize(22, 22)
	BrowseFrame.FavoritesSearchButton:SetPoint("BOTTOMLEFT", Orders.BrowseFrame.RecipeList, "TOPLEFT", 11, 0)
	BrowseFrame.SearchButton:SkinButton()
	BrowseFrame.SearchButton:SetPoint("LEFT", BrowseFrame.FavoritesSearchButton, "RIGHT", 3, 0)

	local BrowseList = Orders.BrowseFrame.RecipeList
	BrowseList:StripTextures()
	T.SkinScrollBar(BrowseList.ScrollBar)
	T.SkinEditBox(BrowseList.SearchBox, nil, 16)
	T.SkinCloseButton(BrowseList.FilterDropdown.ResetButton)

	T.SkinFilter(BrowseList.FilterDropdown)
	BrowseList.FilterDropdown:SetHeight(20)
	BrowseList.FilterDropdown:SetPoint("TOPRIGHT", BrowseList, "TOPRIGHT", -8, -6)
	BrowseList.BackgroundNineSlice:Hide()

	local OrderList = Orders.BrowseFrame.OrderList
	OrderList:StripTextures()
	T.SkinScrollBar(OrderList.ScrollBar)
	OrderList.HeaderContainer:SetPoint("TOPLEFT", OrderList, "TOPLEFT", 3, -6)

	hooksecurefunc(Orders, "SetupTable", function()
		local maxHeaders = OrderList.HeaderContainer:GetNumChildren()
		for i = 1, maxHeaders do
			local header = select(i, OrderList.HeaderContainer:GetChildren())
			if not header.styled then
				header:DisableDrawLayer("BACKGROUND")
				header:GetHighlightTexture():Hide()
				header:CreateBackdrop("Overlay")
				header.backdrop:SetPoint("TOPLEFT", 2, 0)
				header.backdrop:SetPoint("BOTTOMRIGHT", -2, 0)

				header.styled = true
			end
		end
	end)
	Orders:SetupTable() -- init header

	local OrderView = Orders.OrderView
	OrderView.ConcentrationDisplay.Icon:SkinIcon()
	local OrderRankBar = OrderView.RankBar
	OrderRankBar.Border:Hide()
	OrderRankBar.Background:Hide()
	OrderRankBar:CreateBackdrop("Overlay")
	OrderRankBar.backdrop:SetOutside(OrderRankBar.Fill)

	if OrderRankBar.ExpansionDropdownButton then
		local arrow = OrderRankBar.ExpansionDropdownButton:CreateTexture(nil, "ARTWORK")
		arrow:SetSize(14, 15)
		arrow:SetPoint("CENTER")
		arrow:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
		arrow:SetTexCoord(0.3, 0.29, 0.3, 0.81, 0.65, 0.29, 0.65, 0.81)

		OrderRankBar.ExpansionDropdownButton:SetSize(18, 18)
		OrderRankBar.ExpansionDropdownButton:SetPoint("RIGHT", OrderRankBar, "RIGHT", -7, -3)
		OrderRankBar.ExpansionDropdownButton:SkinButton()
		OrderRankBar.ExpansionDropdownButton.Texture:Hide()
	end

	ReskinOutputLog(OrderView.CraftingOutputLog)

	OrderView.CreateButton:SkinButton()
	OrderView.StartRecraftButton:SkinButton()
	OrderView.CompleteOrderButton:SkinButton()

	local OrderInfo = OrderView.OrderInfo
	OrderInfo:StripTextures()
	OrderInfo.BackButton:SkinButton()
	OrderInfo.StartOrderButton:SkinButton()
	OrderInfo.DeclineOrderButton:SkinButton()
	OrderInfo.ReleaseOrderButton:SkinButton()

	local RewardsFrame = OrderInfo.NPCRewardsFrame
	if RewardsFrame then
		RewardsFrame.Background:SetAlpha(0)
		RewardsFrame.Background:CreateBackdrop("Overlay")

		skinReagentIcon(RewardsFrame.RewardItem1)
		skinReagentIcon(RewardsFrame.RewardItem2)
	end

	local NoteBox = OrderInfo.NoteBox
	NoteBox:StripTextures()
	NoteBox:CreateBackdrop("Overlay")
	NoteBox.Background:Hide()

	local OrderDetails = OrderView.OrderDetails
	OrderDetails:StripTextures()
	OrderDetails:CreateBackdrop("Overlay")
	OrderDetails.backdrop:SetPoint("BOTTOMRIGHT", -2, 0)
	OrderDetails.Background:ClearAllPoints()
	OrderDetails.Background:SetInside(OrderDetails.backdrop, 1, 1)

	local OrderSchematicForm = OrderDetails.SchematicForm
	T.SkinCheckBox(OrderSchematicForm.AllocateBestQualityCheckbox)
	skinDetails(OrderSchematicForm.Details)
	T.SkinCheckBox(OrderSchematicForm.TrackRecipeCheckbox)

	local ConcentrateToggleButton = OrderSchematicForm.Details.CraftingChoicesContainer.ConcentrateContainer.ConcentrateToggleButton
	ConcentrateToggleButton:CreateBackdrop()
	ConcentrateToggleButton.backdrop:SetAllPoints()
	ConcentrateToggleButton.Icon:CropIcon()
	ConcentrateToggleButton:StyleButton()
	ConcentrateToggleButton.NormalTexture:SetAlpha(0)

	hooksecurefunc(OrderSchematicForm, "Init", function(frame)
		for slot in frame.reagentSlotPool:EnumerateActive() do
			skinReagentIcon(slot.Button)
		end

		local slot = OrderSchematicForm.salvageSlot
		if slot then
			skinReagentIcon(slot.Button)
		end
	end)

	local OutputIcon = OrderSchematicForm.OutputIcon
	if OutputIcon then
		OutputIcon.Icon:SkinIcon()
		T.SkinIconBorder(OutputIcon.IconBorder, OutputIcon.Icon:GetParent().backdrop)
		OutputIcon:GetHighlightTexture():Hide()
		OutputIcon.CircleMask:Hide()
		if OutputIcon.CountShadow then OutputIcon.CountShadow:SetAlpha(0) end
	end

	local FulfillmentForm = OrderDetails.FulfillmentForm
	local NoteBox = FulfillmentForm.NoteEditBox
	NoteBox:StripTextures()
	NoteBox:CreateBackdrop("Overlay")

	local OutputIcon = OrderDetails.FulfillmentForm.ItemIcon
	if OutputIcon then
		OutputIcon.Icon:SkinIcon()
		T.SkinIconBorder(OutputIcon.IconBorder, OutputIcon.Icon:GetParent().backdrop)
		OutputIcon:GetHighlightTexture():Hide()
		OutputIcon.CircleMask:Hide()
		if OutputIcon.CountShadow then OutputIcon.CountShadow:SetAlpha(0) end
	end
end

T.SkinFuncs["Blizzard_Professions"] = LoadSkin