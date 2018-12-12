local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

local _G = _G
local select, unpack, pairs = select, unpack, pairs
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc

local function LoadSkin()

	local EJ = _G["EncounterJournal"]
	EJ:StripTextures(true)
	EJ.NineSlice:Hide()
	EJ.inset:StripTextures(true)
	EncounterJournalInset.NineSlice:Hide()
	EJ:CreateBackdrop("Transparent")

	EJ.navBar:StripTextures(true)
	EJ.navBar.overlay:StripTextures(true)

	EJ.navBar:CreateBackdrop("Default")
	EJ.navBar.backdrop:SetPoint("TOPLEFT", -2, 0)
	EJ.navBar.backdrop:SetPoint("BOTTOMRIGHT")
	T:HandleButton(EJ.navBar.home, true)

	T.SkinEditBox(EJ.searchBox)
	T.SkinCloseButton(EncounterJournalCloseButton)

	--Instance Selection Frame
	local InstanceSelect = EJ.instanceSelect
	InstanceSelect.bg:Kill()
	T.SkinDropDownBox(EncounterJournalInstanceSelectTierDropDown)
	T:HandleScrollBar(InstanceSelect.scroll.ScrollBar, 4)
	T.SkinTab(InstanceSelect.suggestTab)
	T.SkinTab(InstanceSelect.dungeonsTab)
	T.SkinTab(InstanceSelect.raidsTab)
	T.SkinTab(InstanceSelect.LootJournalTab)
	InstanceSelect.suggestTab.backdrop:SetTemplate("Default", true)
	InstanceSelect.dungeonsTab.backdrop:SetTemplate("Default", true)
	InstanceSelect.raidsTab.backdrop:SetTemplate("Default", true)
	InstanceSelect.suggestTab:SetWidth(InstanceSelect.suggestTab:GetWidth() + 24)
	InstanceSelect.dungeonsTab:SetWidth(InstanceSelect.dungeonsTab:GetWidth() + 10)
	InstanceSelect.dungeonsTab:ClearAllPoints()
	InstanceSelect.dungeonsTab:SetPoint("BOTTOMLEFT", InstanceSelect.suggestTab, "BOTTOMRIGHT", 0, 0)
	InstanceSelect.raidsTab:ClearAllPoints()
	InstanceSelect.raidsTab:SetPoint("BOTTOMLEFT", InstanceSelect.dungeonsTab, "BOTTOMRIGHT", 0, 0)
	InstanceSelect.LootJournalTab:ClearAllPoints()
	InstanceSelect.LootJournalTab:SetPoint("BOTTOMLEFT", InstanceSelect.raidsTab, "BOTTOMRIGHT", 0, 0)

	--Skin the tab text
	for i = 1, #InstanceSelect.Tabs do
		local tab = InstanceSelect.Tabs[i]
		local text = tab:GetFontString()
		text:SetPoint("CENTER")
	end

	--Encounter Info Frame
	local EncounterInfo = EJ.encounter.info
	EncounterJournalEncounterFrameInfoBG:Kill()
	EncounterInfo.leftShadow:Kill()
	EncounterInfo.rightShadow:Kill()
	EncounterInfo.model.dungeonBG:Kill()
	EncounterJournalEncounterFrameInfoModelFrameShadow:Kill()

	EncounterInfo.instanceButton:ClearAllPoints()
	EncounterInfo.instanceButton:SetPoint("TOPLEFT", EncounterInfo, "TOPLEFT", 0, 15)
	EncounterInfo.instanceTitle:ClearAllPoints()
	EncounterInfo.instanceTitle:SetPoint("BOTTOM", EncounterInfo.bossesScroll, "TOP", 10, 15)

	T:HandleButton(EncounterJournalEncounterFrameInfoLootScrollFrameSlotFilterToggle, true)
	EncounterInfo.difficulty:StripTextures()
	EncounterInfo.reset:StripTextures()
	T:HandleButton(EncounterInfo.reset)
	T:HandleButton(EncounterInfo.difficulty)
	EncounterInfo.difficulty:ClearAllPoints()
	EncounterInfo.difficulty:SetPoint("BOTTOMRIGHT", EncounterJournalEncounterFrameInstanceFrame, "TOPRIGHT", 1, 5)
	EncounterInfo.reset:ClearAllPoints()
	EncounterInfo.reset:SetPoint("TOPRIGHT", EncounterInfo.difficulty, "TOPLEFT", -10, 0)
	EncounterJournalEncounterFrameInfoResetButtonTexture:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
	EncounterJournalEncounterFrameInfoResetButtonTexture:SetTexCoord(0.90625000, 0.94726563, 0.00097656, 0.02050781)

	EncounterInfo.bossesScroll:CreateBackdrop("Transparent")
	EncounterInfo.bossesScroll.backdrop:SetPoint("TOPLEFT", EncounterInfo.bossesScroll, "TOPLEFT", -25, 1)
	T:HandleScrollBar(EncounterInfo.bossesScroll.ScrollBar, 4)

	local scrollFrames = {
		EncounterInfo.overviewScroll,
		EncounterInfo.lootScroll,
		EncounterInfo.detailsScroll,
	}

	for _, scrollFrame in pairs(scrollFrames) do
		scrollFrame:CreateBackdrop("Transparent")
		scrollFrame:SetHeight(EncounterInfo.overviewScroll:GetHeight() - (2 + 1))
		scrollFrame:SetWidth(370)
		scrollFrame:ClearAllPoints()
		scrollFrame:SetPoint("BOTTOMRIGHT", EncounterJournalEncounterFrame, "BOTTOMRIGHT", -1, 5)
		scrollFrame.backdrop:SetPoint("TOPLEFT", EncounterInfo.bossesScroll.backdrop, "TOPRIGHT", 5, 0)
		scrollFrame.backdrop:SetPoint("BOTTOMLEFT", EncounterInfo.bossesScroll.backdrop, "BOTTOMRIGHT", 5, 0)
	end

	T:HandleScrollBar(EncounterInfo.overviewScroll.ScrollBar, 4)
	T:HandleScrollBar(EncounterInfo.detailsScroll.ScrollBar, 4)
	T:HandleScrollBar(EncounterInfo.lootScroll.scrollBar, 4)

	EncounterInfo.lootScroll.filter:StripTextures()
	T:HandleButton(EncounterInfo.lootScroll.filter)
	EncounterInfo.lootScroll.filter:ClearAllPoints()
	EncounterInfo.lootScroll.filter:SetPoint("BOTTOMLEFT", EncounterInfo.lootScroll.backdrop, "TOPLEFT", 0, 5)
	EncounterInfo.lootScroll.classClearFilter:ClearAllPoints()
	EncounterInfo.lootScroll.classClearFilter:SetPoint("BOTTOM", EncounterInfo.lootScroll, "TOP", -10, -8)

	EncounterInfo.detailsScroll.child.description:SetTextColor(1, 1, 1)
	EncounterInfo.overviewScroll.child.loreDescription:SetTextColor(1, 1, 1)
	EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetTextColor(1, 1, 1)
	EncounterInfo.overviewScroll.child.overviewDescription.Text:SetTextColor(1, 1, 1)

	EncounterInfo.overviewTab:SetPoint('TOPLEFT', EncounterInfo, 'TOPRIGHT', 0, -35)
	EncounterInfo.overviewTab.SetPoint = T.noop
	EncounterInfo.overviewTab:GetNormalTexture():SetTexture(nil)
	EncounterInfo.overviewTab:GetPushedTexture():SetTexture(nil)
	EncounterInfo.overviewTab:GetDisabledTexture():SetTexture(nil)
	EncounterInfo.overviewTab:GetHighlightTexture():SetTexture(nil)
	EncounterInfo.overviewTab:CreateBackdrop('Default', true)
	EncounterInfo.overviewTab.backdrop:SetPoint('TOPLEFT', 11, -8)
	EncounterInfo.overviewTab.backdrop:SetPoint('BOTTOMRIGHT', -6, 8)

	EncounterInfo.lootTab:GetNormalTexture():SetTexture(nil)
	EncounterInfo.lootTab:GetPushedTexture():SetTexture(nil)
	EncounterInfo.lootTab:GetDisabledTexture():SetTexture(nil)
	EncounterInfo.lootTab:GetHighlightTexture():SetTexture(nil)
	EncounterInfo.lootTab:CreateBackdrop('Default')
	EncounterInfo.lootTab.backdrop:SetPoint('TOPLEFT', 11, -8)
	EncounterInfo.lootTab.backdrop:SetPoint('BOTTOMRIGHT', -6, 8)

	EncounterInfo.bossTab:GetNormalTexture():SetTexture(nil)
	EncounterInfo.bossTab:GetPushedTexture():SetTexture(nil)
	EncounterInfo.bossTab:GetDisabledTexture():SetTexture(nil)
	EncounterInfo.bossTab:GetHighlightTexture():SetTexture(nil)
	EncounterInfo.bossTab:CreateBackdrop('Default')
	EncounterInfo.bossTab.backdrop:SetPoint('TOPLEFT', 11, -8)
	EncounterInfo.bossTab.backdrop:SetPoint('BOTTOMRIGHT', -6, 8)

	EncounterInfo.modelTab:GetNormalTexture():SetTexture(nil)
	EncounterInfo.modelTab:GetPushedTexture():SetTexture(nil)
	EncounterInfo.modelTab:GetDisabledTexture():SetTexture(nil)
	EncounterInfo.modelTab:GetHighlightTexture():SetTexture(nil)
	EncounterInfo.modelTab:CreateBackdrop('Default')
	EncounterInfo.modelTab.backdrop:SetPoint('TOPLEFT', 11, -8)
	EncounterInfo.modelTab.backdrop:SetPoint('BOTTOMRIGHT', -6, 8)

	--Encounter Instance Frame
	local EncounterInstance = EJ.encounter.instance
	EncounterInstance:CreateBackdrop("Transparent")
	EncounterInstance:SetHeight(EncounterInfo.bossesScroll:GetHeight())
	EncounterInstance:ClearAllPoints()
	EncounterInstance:SetPoint("BOTTOMRIGHT", EncounterJournalEncounterFrame, "BOTTOMRIGHT", -1, 3)
	EncounterInstance.loreBG:SetSize(325, 280)
	EncounterInstance.loreBG:ClearAllPoints()
	EncounterInstance.loreBG:SetPoint("TOP", EncounterInstance, "TOP", 0, 0)
	EncounterInstance.mapButton:ClearAllPoints()
	EncounterInstance.mapButton:SetPoint("BOTTOMLEFT", EncounterInstance.loreBG, "BOTTOMLEFT", 25, 35)
	T:HandleScrollBar(EncounterInstance.loreScroll.ScrollBar, 4)
	EncounterInstance.loreScroll.child.lore:SetTextColor(1, 1, 1)

	--Loot Frame
	T:HandleScrollBar(EncounterJournalScrollBar)
	T:HandleButton(EncounterJournal.LootJournal.ItemSetsFrame.ClassButton, true)

	--Suggestions
	for i = 1, AJ_MAX_NUM_SUGGESTIONS do
		local suggestion = EncounterJournal.suggestFrame["Suggestion"..i];
		if i == 1 then
			T:HandleButton(suggestion.button)
			T:HandleNextPrevButton(suggestion.prevButton)
			T:HandleNextPrevButton(suggestion.nextButton)
		else
			T:HandleButton(suggestion.centerDisplay.button)
		end
	end

	--Suggestion Reward Tooltips
		local tooltip = EncounterJournalTooltip
		local item1 = tooltip.Item1
		local item2 = tooltip.Item2
		tooltip:SetTemplate("Transparent")
		T:HandleIcon(item1.icon)
		T:HandleIcon(item2.icon)
		item1.IconBorder:SetTexture(nil)
		item2.IconBorder:SetTexture(nil)

	--Dungeon/raid selection buttons (From AddOnSkins)
	local function SkinDungeons()
		local b1 = EncounterJournalInstanceSelectScrollFrameScrollChildInstanceButton1
		if b1 and not b1.isSkinned then
			T:HandleButton(b1)
			b1.bgImage:SetPoint("TOPLEFT", 2, -2)
			b1.bgImage:SetPoint("BOTTOMRIGHT", -2, 2)
			b1.bgImage:SetTexCoord(.08, .6, .08, .6)
			b1.bgImage:SetDrawLayer("ARTWORK")
			b1.isSkinned = true
		end

		for i = 1, 100 do
			local b = _G["EncounterJournalInstanceSelectScrollFrameinstance"..i]
			if b and not b.isSkinned then
				T:HandleButton(b)
				b.bgImage:SetPoint("TOPLEFT", 2, -2)
				b.bgImage:SetPoint("BOTTOMRIGHT", -2, 2)
				b.bgImage:SetTexCoord(0.08,.6,0.08,.6)
				b.bgImage:SetDrawLayer("ARTWORK")
				b.isSkinned = true
			end
		end
	end
	hooksecurefunc("EncounterJournal_ListInstances", SkinDungeons)
	EncounterJournal_ListInstances()

	--Boss selection buttons
	local function SkinBosses()
		local bossIndex = 1;
		local _, _, bossID = EJ_GetEncounterInfoByIndex(bossIndex);
		local bossButton;

		while bossID do
			bossButton = _G["EncounterJournalBossButton"..bossIndex];
			if bossButton and not bossButton.isSkinned then
				T:HandleButton(bossButton)
				bossButton.creature:ClearAllPoints()
				bossButton.creature:SetPoint("TOPLEFT", 1, -4)
				bossButton.isSkinned = true
			end

			bossIndex = bossIndex + 1;
			_, _, bossID = EJ_GetEncounterInfoByIndex(bossIndex);
		end
	end
	hooksecurefunc("EncounterJournal_DisplayInstance", SkinBosses)

	-- Loot buttons
	local items = EncounterJournal.encounter.info.lootScroll.buttons
	for i = 1, #items do
		local item = items[i]

		item.bossTexture:SetAlpha(0)
		item.bosslessTexture:SetAlpha(0)

		item.icon:SetSize(32, 32)
		item.icon:SetPoint("TOPLEFT", 4, -(8))
		item.icon:SetDrawLayer("ARTWORK")
		item.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		item.IconBackdrop = CreateFrame("Frame", nil, item)
		item.IconBackdrop:SetFrameLevel(item:GetFrameLevel())
		item.IconBackdrop:SetPoint("TOPLEFT", item.icon, -1, 1)
		item.IconBackdrop:SetPoint("BOTTOMRIGHT", item.icon, 1, -1)
		item.IconBackdrop:SetTemplate("Default")

		item.name:ClearAllPoints()
		item.name:SetPoint("TOPLEFT", item.icon, "TOPRIGHT", 6, -2)
		item.boss:SetTextColor(1, 1, 1)
		item.boss:ClearAllPoints()
		item.boss:SetPoint("BOTTOMLEFT", 4, 6)
		item.slot:ClearAllPoints()
		item.slot:SetPoint("TOPLEFT", item.name, "BOTTOMLEFT", 0, -3)
		item.slot:SetTextColor(1, 1, 1)
		item.armorType:SetTextColor(1, 1, 1)
		item.armorType:ClearAllPoints()
		item.armorType:SetPoint("RIGHT", item, "RIGHT", -10, 0)

		hooksecurefunc(item.IconBorder, "SetVertexColor", function(self, r, g, b)
			self:GetParent().IconBackdrop:SetBackdropBorderColor(r, g, b)
			self:SetTexture("")
		end)

		item:CreateBackdrop("Transparent")
		item.backdrop:SetPoint("TOPLEFT", 0, -4)
		item.backdrop:SetPoint("BOTTOMRIGHT", 0, 0)

		if i == 1 then
			item:ClearAllPoints()
			item:SetPoint("TOPLEFT", EncounterInfo.lootScroll.scrollChild, "TOPLEFT", 5, 0)
		end
	end

	--Overview Info (From Aurora)
	local function SkinOverviewInfo(self, _, index)
		local header = self.overviews[index]
		if not header.isSkinned then

			header.descriptionBG:SetAlpha(0)
			header.descriptionBGBottom:SetAlpha(0)
			for i = 4, 18 do
				select(i, header.button:GetRegions()):SetTexture("")
			end

			T:HandleButton(header.button)

			header.button.expandedIcon:SetTextColor(1, 1, 1)
			header.isSkinned = true
		end
	end
	hooksecurefunc("EncounterJournal_SetUpOverview", SkinOverviewInfo)

	--Overview Info Bullets (From Aurora)
	local function SkinOverviewInfoBullets(object)
		local parent = object:GetParent()

		if parent.Bullets then
			for _, bullet in pairs(parent.Bullets) do
				if not bullet.styled then
					bullet.Text:SetTextColor(1, 1, 1)
					bullet.styled = true
				end
			end
		end
	end
	hooksecurefunc("EncounterJournal_SetBullets", SkinOverviewInfoBullets)

	--Abilities Info (From Aurora)
	local function SkinAbilitiesInfo()
		local index = 1
		local header = _G["EncounterJournalInfoHeader"..index]
		while header do
			if not header.isSkinned then
				header.flashAnim.Play = T.noop

				header.descriptionBG:SetAlpha(0)
				header.descriptionBGBottom:SetAlpha(0)
				for i = 4, 18 do
					select(i, header.button:GetRegions()):SetTexture("")
				end

				header.description:SetTextColor(1, 1, 1)
				header.button.title.SetTextColor = T.noop
				header.button.expandedIcon:SetTextColor(1, 1, 1)
				header.button.expandedIcon.SetTextColor = T.noop

				T:HandleButton(header.button)

				header.button.bg = CreateFrame("Frame", nil, header.button)
				header.button.bg:SetTemplate("Default")
				header.button.bg:SetFrameLevel(header.button.bg:GetFrameLevel() - 1)
				header.button.abilityIcon:SetTexCoord(.08, .92, .08, .92)

				header.isSkinned = true
			end

			if header.button.abilityIcon:IsShown() then
				header.button.bg:Show()
			else
				header.button.bg:Hide()
			end

			index = index + 1
			header = _G["EncounterJournalInfoHeader"..index]
		end
	end
	hooksecurefunc("EncounterJournal_ToggleHeaders", SkinAbilitiesInfo)

	-- Search
	EncounterJournalSearchResults:StripTextures()
	EncounterJournalSearchResults:SetTemplate("Default")
	EncounterJournalSearchBox.searchPreviewContainer:StripTextures()
	EncounterJournal.LootJournal:StripTextures()
	EncounterJournal.LootJournal.ItemSetsFrame.ClassButton:StripTextures()

	T.SkinCloseButton(EncounterJournalSearchResultsCloseButton)
	T:HandleScrollBar(EncounterJournalSearchResultsScrollFrameScrollBar)
end

T.SkinFuncs["Blizzard_EncounterJournal"] = LoadSkin