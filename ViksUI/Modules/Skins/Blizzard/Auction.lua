local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

--Lua functions
local _G = _G
local pairs, select, unpack = pairs, select, unpack
local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor
--WoW API / Variables
local hooksecurefunc = hooksecurefunc

--[[
TO DO:
	* Skin Multisell .ProgressBar
]]

-- Credits: siweia (AuroraClassic)

local function SkinEditBoxes(Frame)
	T.SkinEditBox(Frame.MinLevel)
	T.SkinEditBox(Frame.MaxLevel)
end

local function SkinFilterButton(Button)
	SkinEditBoxes(Button.LevelRangeFrame)

	T.SkinCloseButton(Button.ClearFiltersButton)
	Button:SkinButton(true)
end

local function HandleSearchBarFrame(Frame)
	SkinFilterButton(Frame.FilterButton)

	Frame.SearchButton:SkinButton(true)
	T.SkinEditBox(Frame.SearchBox)
	Frame.FavoritesSearchButton:SkinButton(true)
	Frame.FavoritesSearchButton:SetSize(22, 22)
end

local function HandleListIcon(frame)
	if not frame.tableBuilder then return end

	for i = 1, 22 do
		local row = frame.tableBuilder.rows[i]
		if row then
			for j = 1, 4 do
				local cell = row.cells and row.cells[j]
				if cell and cell.Icon then
					if not cell.IsSkinned then
						cell.Icon:SkinIcon()
						if cell.IconBorder then cell.IconBorder:SetAlpha(0) end

						cell.IsSkinned = true
					end
				end
			end
		end
	end
end

local function HandleSummaryIcons(frame)
	for i = 1, 23 do
		local child = select(i, frame.ScrollFrame.scrollChild:GetChildren())

		if child and child.Icon then
			if not child.IsSkinned then
				child.Icon:SkinIcon()

				child.IsSkinned = true
			end
		end
	end
end

local function SkinItemDisplay(frame)
	local ItemDisplay = frame.ItemDisplay
	ItemDisplay:StripTextures()
	ItemDisplay:CreateBackdrop("Transparent")
	ItemDisplay.backdrop:SetPoint("TOPLEFT", 3, -3)
	ItemDisplay.backdrop:SetPoint("BOTTOMRIGHT", -3, 0)

	local ItemButton = ItemDisplay.ItemButton
	ItemButton.CircleMask:Hide()

	-- We skin the new IconBorder from the AH, it looks really cool tbh.
	ItemButton.Icon:SetTexCoord(.08, .92, .08, .92)
	ItemButton.Icon:SetSize(44, 44)
	ItemButton.IconBorder:SetTexCoord(.08, .92, .08, .92)
end

local function HandleHeaders(frame)
	local maxHeaders = frame.HeaderContainer:GetNumChildren()
	for i = 1, maxHeaders do
		local header = select(i, frame.HeaderContainer:GetChildren())
		if header and not header.IsSkinned then
			header:DisableDrawLayer("BACKGROUND")
			if not header.backdrop then
				header:CreateBackdrop("Transparent")
			end

			header.IsSkinned = true
		end

		if header.backdrop then
			header.backdrop:SetPoint("BOTTOMRIGHT", i < maxHeaders and -5 or 0, -2)
		end
	end

	HandleListIcon(frame)
end

local function HandleAuctionButtons(button)
	button:SkinButton(true)
	button:SetSize(22,22)
end

local function HandleSellFrame(frame)
	frame:StripTextures()

	local ItemDisplay = frame.ItemDisplay
	ItemDisplay:StripTextures()
	ItemDisplay:CreateBackdrop("Transparent")

	local ItemButton = ItemDisplay.ItemButton
	if ItemButton.IconMask then ItemButton.IconMask:Hide() end
	if ItemButton.IconBorder then ItemButton.IconBorder:SetAlpha(0) end

	ItemButton.EmptyBackground:Hide()
	ItemButton:SetPushedTexture("")
	ItemButton.Highlight:SetColorTexture(1, 1, 1, .25)
	ItemButton.Highlight:SetAllPoints(ItemButton.Icon)

	ItemButton.Icon:SkinIcon(true)
	--hooksecurefunc(ItemButton.IconBorder, "SetVertexColor", function(_, r, g, b) ItemButton.Icon.backdrop:SetBackdropBorderColor(r, g, b) end)
	--hooksecurefunc(ItemButton.IconBorder, "Hide", function() ItemButton.Icon.backdrop:SetBackdropBorderColor(0, 0, 0) end)

	T.SkinEditBox(frame.QuantityInput.InputBox)
	frame.QuantityInput.MaxButton:SkinButton(true)
	T.SkinEditBox(frame.PriceInput.MoneyInputFrame.GoldBox)
	T.SkinEditBox(frame.PriceInput.MoneyInputFrame.SilverBox)

	if frame.SecondaryPriceInput then
		T.SkinEditBox(frame.SecondaryPriceInput.MoneyInputFrame.GoldBox)
		T.SkinEditBox(frame.SecondaryPriceInput.MoneyInputFrame.SilverBox)
	end

	T.SkinDropDownBox(frame.DurationDropDown.DropDown)
	frame.PostButton:SkinButton(true)

	if frame.BuyoutModeCheckButton then
		T.SkinCheckBox(frame.BuyoutModeCheckButton)
		frame.BuyoutModeCheckButton:SetSize(20, 20)
	end
end

local function HandleSellList(frame, hasHeader)
	frame:StripTextures()

	if frame.RefreshFrame then
		HandleAuctionButtons(frame.RefreshFrame.RefreshButton)
	end

	T.SkinScrollBar(frame.ScrollFrame.scrollBar)

	if hasHeader then
		frame.ScrollFrame:CreateBackdrop("Transparent")
		hooksecurefunc(frame, "RefreshScrollFrame", HandleHeaders)
	else
		hooksecurefunc(frame, "RefreshScrollFrame", HandleSummaryIcons)
	end
end

local function LoadSkin()

	--[[ Main Frame | TAB 1]]--
	local Frame = _G.AuctionHouseFrame
	T:HandlePortraitFrame(Frame)

	local Tabs = {
		_G.AuctionHouseFrameBuyTab,
		_G.AuctionHouseFrameSellTab,
		_G.AuctionHouseFrameAuctionsTab,
	}

	for _, tab in pairs(Tabs) do
		if tab then
			T.SkinTab(tab)
		end
	end

	_G.AuctionHouseFrameBuyTab:ClearAllPoints()
	_G.AuctionHouseFrameBuyTab:SetPoint("BOTTOMLEFT", Frame, "BOTTOMLEFT", 0, -32)

	-- SearchBar Frame
	HandleSearchBarFrame(Frame.SearchBar)

	Frame.MoneyFrameBorder:StripTextures()
	Frame.MoneyFrameInset:StripTextures()

	--[[ Categorie List ]]--
	local Categories = Frame.CategoriesList
	Categories.ScrollFrame:StripTextures()
	Categories.Background:Hide()
	Categories.NineSlice:Hide()

	T.SkinScrollBar(_G.AuctionHouseFrameScrollBar)

	for i = 1, _G.NUM_FILTERS_TO_DISPLAY do
		local button = Categories.FilterButtons[i]

		button:StripTextures(true)
		button:StyleButton()

		button.SelectedTexture:SetAlpha(0)
	end

	--[[ Browse Frame ]]--
	local Browse = Frame.BrowseResultsFrame

	local ItemList = Browse.ItemList
	ItemList:StripTextures()
	hooksecurefunc(ItemList, "RefreshScrollFrame", HandleHeaders)

	T.SkinScrollBar(ItemList.ScrollFrame.scrollBar)

	--[[ BuyOut Frame]]
	local CommoditiesBuyFrame = Frame.CommoditiesBuyFrame
	CommoditiesBuyFrame.BuyDisplay:StripTextures()
	CommoditiesBuyFrame.BackButton:SkinButton(true)

	local ItemList = Frame.CommoditiesBuyFrame.ItemList
	ItemList:StripTextures()
	ItemList:CreateBackdrop("Transparent")
	ItemList.RefreshFrame.RefreshButton:SkinButton(true)
	T.SkinScrollBar(ItemList.ScrollFrame.scrollBar)

	local BuyDisplay = Frame.CommoditiesBuyFrame.BuyDisplay
	T.SkinEditBox(BuyDisplay.QuantityInput.InputBox)
	BuyDisplay.BuyButton:SkinButton(true)

	SkinItemDisplay(BuyDisplay)

	--[[ ItemBuyOut Frame]]
	local ItemBuyFrame = Frame.ItemBuyFrame
	ItemBuyFrame.BackButton:SkinButton(true)
	ItemBuyFrame.BuyoutFrame.BuyoutButton:SkinButton(true)

	SkinItemDisplay(ItemBuyFrame)

	local ItemList = ItemBuyFrame.ItemList
	ItemList:StripTextures()
	ItemList:CreateBackdrop("Transparent")
	T.SkinScrollBar(ItemList.ScrollFrame.scrollBar)
	ItemList.RefreshFrame.RefreshButton:SkinButton(true)
	hooksecurefunc(ItemList, "RefreshScrollFrame", HandleHeaders)

	local EditBoxes = {
		_G.AuctionHouseFrameGold,
		_G.AuctionHouseFrameSilver,
	}

	for _, EditBox in pairs(EditBoxes) do
		T.SkinEditBox(EditBox)
		EditBox:SetTextInsets(1, 1, -1, 1)
	end

	ItemBuyFrame.BidFrame.BidButton:SkinButton(true)
	ItemBuyFrame.BidFrame.BidButton:ClearAllPoints()
	ItemBuyFrame.BidFrame.BidButton:SetPoint("LEFT", ItemBuyFrame.BidFrame.BidAmount, "RIGHT", 2, -2)
	ItemBuyFrame.BidFrame.BidButton:SkinButton(true)

	--[[ Item Sell Frame | TAB 2 ]]--
	local SellFrame = Frame.ItemSellFrame
	HandleSellFrame(SellFrame)

	local ItemList = Frame.ItemSellList
	HandleSellList(ItemList, true)

	local CommoditiesSellFrame = Frame.CommoditiesSellFrame
	HandleSellFrame(CommoditiesSellFrame)

	local ItemList = Frame.CommoditiesSellList
	HandleSellList(ItemList, true)

	--[[ Auctions Frame | TAB 3 ]]--
	local AuctionsFrame = _G.AuctionHouseFrameAuctionsFrame
	AuctionsFrame:StripTextures()

	SkinItemDisplay(AuctionsFrame)

	local CommoditiesList = AuctionsFrame.CommoditiesList
	HandleSellList(CommoditiesList, true)
	CommoditiesList.RefreshFrame.RefreshButton:SkinButton(true)

	local ItemList = AuctionsFrame.ItemList
	HandleSellList(ItemList, true)
	ItemList.RefreshFrame.RefreshButton:SkinButton(true)

	local Tabs = {
		_G.AuctionHouseFrameAuctionsFrameAuctionsTab,
		_G.AuctionHouseFrameAuctionsFrameBidsTab,
	}

	for _, tab in pairs(Tabs) do
		if tab then
			T.SkinTab(tab)
		end
	end

	local SummaryList = AuctionsFrame.SummaryList
	HandleSellList(SummaryList)
	AuctionsFrame.CancelAuctionButton:SkinButton(true)

	local AllAuctionsList = AuctionsFrame.AllAuctionsList
	HandleSellList(AllAuctionsList, true)
	AllAuctionsList.RefreshFrame.RefreshButton:SkinButton(true)

	local BidsList = AuctionsFrame.BidsList
	HandleSellList(BidsList, true)
	BidsList.RefreshFrame.RefreshButton:SkinButton(true)
	T.SkinEditBox(_G.AuctionHouseFrameAuctionsFrameGold)
	T.SkinEditBox(_G.AuctionHouseFrameAuctionsFrameSilver)
	AuctionsFrame.BidFrame.BidButton:SkinButton(true)

	--[[ ProgressBars ]]--

	--[[ WoW Token Category ]]--
	local TokenFrame = Frame.WoWTokenResults
	TokenFrame:StripTextures()
	TokenFrame.Buyout:SkinButton(true)
	T.SkinScrollBar(TokenFrame.DummyScrollBar) --MONITOR THIS

	local Token = TokenFrame.TokenDisplay
	Token:StripTextures()
	Token:CreateBackdrop("Transparent")

	local ItemButton = Token.ItemButton
	ItemButton.Icon:SkinIcon(true)
	local _, _, itemRarity = GetItemInfo(_G.WOW_TOKEN_ITEM_ID)
	local r, g, b
	if itemRarity then
		r, g, b = GetItemQualityColor(itemRarity)
	end

	ItemButton.IconBorder:SetAlpha(0)

	--WoW Token Tutorial Frame
	local WowTokenGameTimeTutorial = Frame.WoWTokenResults.GameTimeTutorial
	WowTokenGameTimeTutorial.TitleBg:SetAlpha(0)
	WowTokenGameTimeTutorial:CreateBackdrop("Transparent")
	T.SkinCloseButton(WowTokenGameTimeTutorial.CloseButton)
	WowTokenGameTimeTutorial.RightDisplay.StoreButton:SkinButton(true)
	WowTokenGameTimeTutorial.Bg:SetAlpha(0)

	--[[ Dialogs ]]--
	Frame.BuyDialog:StripTextures()
	Frame.BuyDialog:CreateBackdrop("Transparent")
	Frame.BuyDialog.BuyNowButton:SkinButton(true)
	Frame.BuyDialog.CancelButton:SkinButton(true)
end

T.SkinFuncs["Blizzard_AuctionHouseUI"] = LoadSkin