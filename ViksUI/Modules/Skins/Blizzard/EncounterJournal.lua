local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	EncounterJournal skin
----------------------------------------------------------------------------------------
local LoadTootlipSkin = CreateFrame("Frame")
LoadTootlipSkin:RegisterEvent("ADDON_LOADED")
LoadTootlipSkin:SetScript("OnEvent", function(self, _, addon)
	if C_AddOns.IsAddOnLoaded("Skinner") or C_AddOns.IsAddOnLoaded("Aurora") or not C.tooltip.enable then
		self:UnregisterEvent("ADDON_LOADED")
		return
	end

	if addon == "Blizzard_EncounterJournal" then
		local tooltip = EncounterJournalTooltip
		local item1 = tooltip.Item1
		local item2 = tooltip.Item2
		tooltip.NineSlice:SetTemplate("Transparent")

		local b = CreateFrame("Frame", "$parentBackdrop", item1)
		b:SetPoint("TOPLEFT", item1.icon, -2, 2)
		b:SetPoint("BOTTOMRIGHT", item1.icon, 2, -2)
		b:SetFrameLevel(1)
		b:SetTemplate("Default")

		local c = CreateFrame("Frame", "$parentBackdrop", item2)
		c:SetPoint("TOPLEFT", item2.icon, -2, 2)
		c:SetPoint("BOTTOMRIGHT", item2.icon, 2, -2)
		c:SetFrameLevel(1)
		c:SetTemplate("Default")

		item1.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		item2.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		item1.IconBorder:SetAlpha(0)
		item2.IconBorder:SetAlpha(0)
	end
end)

if C.skins.blizzard_frames ~= true then return end
local function LoadSkin()
	EncounterJournal:StripTextures(true)
	EncounterJournal.inset:StripTextures(true)
	EncounterJournal:CreateBackdrop("Transparent")
	EncounterJournal.backdrop:SetPoint("TOPLEFT", -3, 0)
	EncounterJournal.backdrop:SetPoint("BOTTOMRIGHT", 0, -2)
	EncounterJournalPortrait:SetAlpha(0)

	EncounterJournalNavBar:StripTextures(true)
	EncounterJournalNavBar.overlay:StripTextures(true)

	EncounterJournalNavBar:CreateBackdrop("Transparent")
	EncounterJournalNavBar.backdrop:SetPoint("TOPLEFT", -3, 1)
	EncounterJournalNavBar.backdrop:SetPoint("BOTTOMRIGHT", 0, -1)
	EncounterJournalNavBarHomeButton:SkinButton(true, "Name")
	T.SkinDropDownBox(EncounterJournalEncounterFrameInfo.LootContainer.filter)
	T.SkinDropDownBox(EncounterJournalEncounterFrameInfo.LootContainer.slotFilter)
	EncounterJournalEncounterFrameInfoClassFilterClearFrame:GetRegions():SetAlpha(0)
	T.SkinDropDownBox(EncounterJournalEncounterFrameInfoDifficulty)

	local monthlyActivities = EncounterJournalMonthlyActivitiesFrame
	if monthlyActivities then
		EncounterJournalMonthlyActivitiesFrame:StripTextures()
		EncounterJournalMonthlyActivitiesFrame.FilterList:StripTextures()
		EncounterJournalMonthlyActivitiesFrame.FilterList:SetTemplate("Overlay")
		EncounterJournalMonthlyActivitiesFrame.ThemeContainer:StripTextures(true) -- force to kill
		T.SkinScrollBar(EncounterJournalMonthlyActivitiesFrame.ScrollBar)
		monthlyActivities.HelpButton.Ring:Hide()
		monthlyActivities.HelpButton:SetPoint("TOPLEFT", EncounterJournalMonthlyActivitiesFrame, "TOPLEFT", -15, 70)
	end

	local mainTabs = {
		EncounterJournalMonthlyActivitiesTab,
		EncounterJournalSuggestTab,
		EncounterJournalDungeonTab,
		EncounterJournalRaidTab,
		EncounterJournalLootJournalTab,
	}

	for _, tab in pairs(mainTabs) do
		T.SkinTab(tab)
	end

	-- TutorialsFrame
	if T.newPatch then
		T.SkinTab(EncounterJournal.TutorialsTab)

		EncounterJournal.TutorialsFrame.Contents.StartButton:SkinButton()
	end


	mainTabs[1]:ClearAllPoints()
	mainTabs[1]:SetPoint("TOPLEFT", EncounterJournal, "BOTTOMLEFT", 11, 0)

	T.SkinEditBox(EncounterJournalSearchBox)
	T.SkinCloseButton(EncounterJournalCloseButton)
	T.SkinDropDownBox(EncounterJournalInstanceSelect.ExpansionDropdown )

	EncounterJournalInstanceSelectBG:SetAlpha(0)
	EncounterJournalInstanceSelect.bg:SetAlpha(0)
	EncounterJournalEncounterFrameInfoBG:SetAlpha(0)
	EncounterJournal.encounter.info.leftShadow:SetAlpha(0)
	EncounterJournal.encounter.info.rightShadow:SetAlpha(0)
	EncounterJournal.encounter.info.model.dungeonBG:SetAlpha(0)
	EncounterJournalEncounterFrameInfoModelFrameShadow:SetAlpha(0)
	EncounterJournal.encounter.info.instanceButton:ClearAllPoints()
	EncounterJournal.encounter.info.instanceButton:SetPoint("TOPLEFT", EncounterJournal.encounter.info, "TOPLEFT", 0, 15)
	EncounterJournal.encounter.info.instanceTitle:ClearAllPoints()
	EncounterJournal.encounter.info.instanceTitle:SetPoint("BOTTOM", EncounterJournal.encounter.info.bossesScroll, "TOP", 10, 15)
	EncounterJournal.encounter.info.detailsScroll.child.description:SetTextColor(1, 1, 1)
	EncounterJournal.encounter.info.overviewScroll.child.loreDescription:SetTextColor(1, 1, 1)
	EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildHeader:SetAlpha(0)
	EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetFont(C.media.normal_font, 16, "")
	EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetTextColor(1, 1, 1)
	EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChild.overviewDescription.Text:SetTextColor("P", 1, 1, 1)

	local tabs = {
		EncounterJournalEncounterFrameInfoOverviewTab,
		EncounterJournalEncounterFrameInfoLootTab,
		EncounterJournalEncounterFrameInfoBossTab,
		EncounterJournalEncounterFrameInfoModelTab
	}
	for _, tab in pairs(tabs) do
		tab:CreateBackdrop("Overlay")
		tab.backdrop:SetPoint("TOPLEFT", 3, -3)
		tab.backdrop:SetPoint("BOTTOMRIGHT", 0, 2)
		tab:SetNormalTexture(0)
		tab:SetPushedTexture(0)
		tab:SetDisabledTexture(C.media.blank)

		local hl = tab:GetHighlightTexture()
		hl:SetColorTexture(1, 1, 1, 0.2)
		hl:SetInside(tab.backdrop)

		local d = tab:GetDisabledTexture()
		d:SetVertexColor(0.8, 0, 0, 0.1)
		d:SetInside(tab.backdrop)
	end

	EncounterJournalEncounterFrameInfoOverviewTab:SetPoint("TOPLEFT", EncounterJournalEncounterFrameInfo, "TOPRIGHT", 8, -40)
	EncounterJournalEncounterFrameInfoOverviewTab.SetPoint = T.dummy

	T.SkinScrollBar(EncounterJournalInstanceSelect.ScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInfo.BossesScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar)
	T.SkinScrollBar(EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar)

	for i = 1, AJ_MAX_NUM_SUGGESTIONS do
		local suggestion = EncounterJournal.suggestFrame["Suggestion"..i]
		suggestion.bg:Hide()
		suggestion.centerDisplay.title.text:SetTextColor(1, 1, 1)
		suggestion.centerDisplay.description.text:SetTextColor(1, 1, 1)
		suggestion.reward.iconRing:Hide()
		suggestion.reward.iconRingHighlight:SetTexture("")

		suggestion.icon.b = CreateFrame("Frame", nil, suggestion)
		suggestion.icon.b:SetTemplate("Default")
		suggestion.icon.b:SetPoint("TOPLEFT", suggestion.icon, "TOPLEFT", -2, 2)
		suggestion.icon.b:SetPoint("BOTTOMRIGHT", suggestion.icon, "BOTTOMRIGHT", 2, -2)
		suggestion.icon.b:SetFrameLevel(1)

		suggestion.reward:CreateBackdrop("Default")
		suggestion.reward.backdrop:SetFrameLevel(suggestion.reward:GetFrameLevel())
		suggestion.reward.backdrop:SetPoint("TOPLEFT", suggestion.reward.icon, -2, 2)
		suggestion.reward.backdrop:SetPoint("BOTTOMRIGHT", suggestion.reward.icon, 2, -2)
		suggestion:CreateBackdrop("Overlay")
		suggestion.backdrop:SetFrameLevel(0)

		if i == 1 then
			suggestion.icon:SetPoint("TOPLEFT", 135, -15)
			suggestion.button:SkinButton(nil, "Text")
			suggestion.reward.text:SetTextColor(1, 1, 1)
			suggestion.backdrop:SetPoint("TOPLEFT", -2, -2)
			T.SkinNextPrevButton(suggestion.prevButton)
			T.SkinNextPrevButton(suggestion.nextButton)
		else
			suggestion.icon:SetPoint("TOPLEFT", 10, -10)
			suggestion.centerDisplay:SetPoint("TOPLEFT", 85, -10)
			suggestion.centerDisplay.button:SkinButton()
		end
	end

	EncounterJournalEncounterFrameInstanceFrame.titleBG:SetAlpha(0)
	EncounterJournalEncounterFrameInstanceFrameBG:SetTexCoord(0.69, 0.06, 0.58, 0.09)
	EncounterJournalEncounterFrameInstanceFrameBG:SetRotation(rad(180))
	EncounterJournalEncounterFrameInstanceFrame:CreateBackdrop("Default")
	EncounterJournalEncounterFrameInstanceFrame.backdrop:SetOutside(EncounterJournalEncounterFrameInstanceFrameBG)
	EncounterJournalEncounterFrameInstanceFrameBG:SetSize(325, 240)
	EncounterJournalEncounterFrameInstanceFrameBG:ClearAllPoints()
	EncounterJournalEncounterFrameInstanceFrameBG:SetPoint("TOP", EncounterJournalEncounterFrameInstanceFrame, "TOP", 0, -45)
	EncounterJournalEncounterFrameInstanceFrameMapButton:ClearAllPoints()
	EncounterJournalEncounterFrameInstanceFrameMapButton:SetPoint("BOTTOMLEFT", EncounterJournalEncounterFrameInstanceFrameBG, "BOTTOMLEFT", 5, 5)
	EncounterJournalEncounterFrameInstanceFrame.LoreScrollingFont:SetHeight(EncounterJournalEncounterFrameInstanceFrame.LoreScrollingFont:GetHeight() + 25)

	for _, child in next, { _G.EncounterJournalEncounterFrameInstanceFrame.LoreScrollingFont.ScrollBox.ScrollTarget:GetChildren() } do
		if child.FontString then
			child.FontString:SetTextColor(1, 1, 1)
		end
	end

	hooksecurefunc(_G.EncounterJournal.instanceSelect.ScrollBox, "Update", function(frame)
		for _, b in next, {frame.ScrollTarget:GetChildren()} do
			if not b.isSkinned then
				b:SkinButton()
				if b.bgImage then
					b.bgImage:SetPoint("TOPLEFT", 2, -2)
					b.bgImage:SetPoint("BOTTOMRIGHT", -2, 2)
					b.bgImage:SetTexCoord(0.08, 0.6, 0.08, 0.6)
					b.bgImage:SetDrawLayer("ARTWORK")
				end

				b.isSkinned = true
			end
		end
	end)

	hooksecurefunc(_G.EncounterJournal.encounter.info.BossesScrollBox, "Update", function(frame)
		for _, child in next, {frame.ScrollTarget:GetChildren()} do
			if not child.isSkinned then
				child:SkinButton()
				local hl = child:GetHighlightTexture()
				hl:SetColorTexture(1, 1, 1, 0.2)
				hl:SetInside(child)
				child.isSkinned = true
			end
		end
	end)

	hooksecurefunc(_G.EncounterJournal.encounter.info.LootContainer.ScrollBox, "Update", function(frame)
		for _, child in next, {frame.ScrollTarget:GetChildren()} do
			if not child.isSkinned then
				if child.bossTexture then child.bossTexture:SetAlpha(0) end
				if child.bosslessTexture then child.bosslessTexture:SetAlpha(0) end

				if child.boss then
					child.boss:ClearAllPoints()
					child.boss:SetPoint("BOTTOMLEFT", 4, 4)
					child.boss:SetTextColor(1, 1, 1)
				end

				if child.slot then
					child.slot:ClearAllPoints()
					child.slot:SetPoint("BOTTOMLEFT", child.icon, "BOTTOMRIGHT", 7, -2)
					child.slot:SetTextColor(1, 1, 1)
				end

				if child.armorType then
					child.armorType:ClearAllPoints()
					child.armorType:SetPoint("BOTTOMRIGHT", child.name, "TOPLEFT", 264, -25)
					child.armorType:SetTextColor(1, 1, 1)
				end

				if child.icon then
					child.icon:SetSize(30, 30)
					child.icon:SetPoint("TOPLEFT", T.mult*6, -(T.mult*10))
					child.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
					child.icon:SetDrawLayer("ARTWORK")

					if not child.IconBackdrop then
						child.IconBackdrop = CreateFrame("Frame", nil, child)
						child.IconBackdrop:SetFrameLevel(child:GetFrameLevel())
						child.IconBackdrop:SetPoint("TOPLEFT", child.icon, -2, 2)
						child.IconBackdrop:SetPoint("BOTTOMRIGHT", child.icon, 2, -2)
						child.IconBackdrop:SetTemplate("Default")

						hooksecurefunc(child.IconBorder, "SetVertexColor", function(self, r, g, b)
							self:GetParent().IconBackdrop:SetBackdropBorderColor(r, g, b)
							self:SetTexture("")
						end)
					end
				end

				if not child.backdrop and not child.TipButton then
					child:CreateBackdrop("Overlay")
					child.backdrop:SetPoint("TOPLEFT", 0, -4)
					child.backdrop:SetPoint("BOTTOMRIGHT", -5, 0)
				end

				child.isSkinned = true
			end
		end
	end)

	local SkinOverviewInfo
	do -- this prevents a taint trying to force a color lock by setting it to T.dummy
		local LockColors = {}
		local function LockValue(button, r, g, b)
			if r ~= 1 or g ~= 1 or b ~= 0 then
				button:SetTextColor(1, 1, 0)
			end
		end

		local function LockWhite(button, r, g, b)
			if r ~= 1 or g ~= 1 or b ~= 1 then
				button:SetTextColor(1, 1, 1)
			end
		end

		local function LockColor(button, valuecolor)
			if LockColors[button] then return end

			hooksecurefunc(button, 'SetTextColor', (valuecolor and LockValue) or LockWhite)

			LockColors[button] = true
		end

		SkinOverviewInfo = function(frame, _, index)
			local header = frame.overviews[index]
			if not header.isSkinned then
				for i = 4, 18 do
					select(i, header.button:GetRegions()):SetTexture()
				end

				header.button:SkinButton()

				LockColor(header.button.title, true)
				LockColor(header.button.expandedIcon)

				header.descriptionBG:SetAlpha(0)
				header.descriptionBGBottom:SetAlpha(0)
				header.description:SetTextColor(1, 1, 1)

				header.isSkinned = true
			end
		end
	end
	hooksecurefunc("EncounterJournal_SetUpOverview", SkinOverviewInfo)

	local function SkinOverviewInfoBullets(object)
		local parent = object:GetParent()

		if parent.Bullets then
			for _, bullet in pairs(parent.Bullets) do
				if not bullet.styled then
					bullet.Text:SetTextColor("P", 1, 1, 1)
					bullet.styled = true
				end
			end
		end
	end
	hooksecurefunc("EncounterJournal_SetBullets", SkinOverviewInfoBullets)

	local function SkinAbilitiesInfo()
		local index = 1
		local header = _G["EncounterJournalInfoHeader"..index]
		while header do
			if not header.isSkinned then
				header.flashAnim.Play = T.dummy

				header.descriptionBG:SetAlpha(0)
				header.descriptionBGBottom:SetAlpha(0)
				for i = 4, 18 do
					select(i, header.button:GetRegions()):SetTexture("")
				end

				header.description:SetTextColor(1, 1, 1)
				header.button.title:SetTextColor(1, 1, 0)
				header.button.title.SetTextColor = T.dummy
				header.button.expandedIcon:SetTextColor(1, 1, 1)
				header.button.expandedIcon.SetTextColor = T.dummy

				header.button:SkinButton()
				header.button.abilityIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

				header.isSkinned = true
			end

			index = index + 1
			header = _G["EncounterJournalInfoHeader"..index]
		end
	end
	hooksecurefunc("EncounterJournal_ToggleHeaders", SkinAbilitiesInfo)

	hooksecurefunc("EJSuggestFrame_RefreshDisplay", function()
		local self = EncounterJournal.suggestFrame

		if #self.suggestions > 0 then
			local suggestion = self.Suggestion1
			local data = self.suggestions[1]

			suggestion.iconRing:Hide()

			if data.iconPath then
				suggestion.icon:SetMask("")
				suggestion.icon:SetTexture(data.iconPath)
				suggestion.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end
		end

		if #self.suggestions > 1 then
			for i = 2, #self.suggestions do
				local suggestion = self["Suggestion"..i]
				if not suggestion then break end

				local data = self.suggestions[i]

				suggestion.iconRing:Hide()

				if data.iconPath then
					suggestion.icon:SetMask("")
					suggestion.icon:SetTexture(data.iconPath)
					suggestion.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				end
			end
		end
	end)

	hooksecurefunc("EJSuggestFrame_UpdateRewards", function(suggestion)
		local rewardData = suggestion.reward.data
		if rewardData then
			local texture = rewardData.itemIcon or rewardData.currencyIcon or [[Interface\Icons\achievement_guildperk_mobilebanking]]
			suggestion.reward.icon:SetMask("")
			suggestion.reward.icon:SetTexture(texture)
			suggestion.reward.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		end
	end)

	local LootJournal = EncounterJournal.LootJournal
	LootJournal:DisableDrawLayer("BACKGROUND")

	T.SkinDropDownBox(EncounterJournal.LootJournalViewDropdown)
	T.SkinDropDownBox(EncounterJournal.LootJournal.RuneforgePowerDropdown)
	T.SkinDropDownBox(EncounterJournal.LootJournal.ClassDropdown)

	EncounterJournal.LootJournalItems:DisableDrawLayer("BACKGROUND")

	local itemSetsFrame = EncounterJournal.LootJournalItems.ItemSetsFrame
	T.SkinDropDownBox(EncounterJournal.LootJournalItems.ItemSetsFrame.ClassDropdown)

	T.SkinScrollBar(itemSetsFrame.ScrollBar)

	hooksecurefunc(itemSetsFrame.ScrollBox, "Update", function(self)
		self:ForEachFrame(function(bar)
			if not bar.styled then
				bar.ItemLevel:SetTextColor(1, 1, 1)
				bar.Background:Hide()
				bar:CreateBackdrop("Overlay")
				bar.backdrop:SetPoint("TOPLEFT", 0, 2)
				bar.backdrop:SetPoint("BOTTOMRIGHT", -2, -2)

				bar.styled = true
			end

			local itemButtons = bar.ItemButtons
			for i = 1, #itemButtons do
				local button = itemButtons[i]
				if not button.styled then
					button:CreateBackdrop("Overlay")
					button.backdrop:SetPoint("TOPLEFT", button.Border, 5, -5)
					button.backdrop:SetPoint("BOTTOMRIGHT", button.Border, -4, 3)
					button.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
					T.SkinIconBorder(button.Border, button.backdrop, true)
					button.Border:SetAtlas(button.Border:GetAtlas()) -- force to update border as it call before we can skin
					button.styled = true
				end
			end
		end)
	end)

	T.SkinScrollBar(EncounterJournal.LootJournal.ScrollBar)

	hooksecurefunc(_G.EncounterJournal.LootJournal.ScrollBox, "Update", function(frame)
		for _, btn in next, {frame.ScrollTarget:GetChildren()} do
			if not btn.isSkinned then
				btn.Background:SetAlpha(0)
				btn.BackgroundOverlay:SetAlpha(0)
				btn.CircleMask:Hide()
				btn.Icon:SetSize(50, 50)
				btn.Icon:SkinIcon(true)

				btn:CreateBackdrop("Overlay")
				btn.backdrop:SetPoint("TOPLEFT", 2, -2)
				btn.backdrop:SetPoint("BOTTOMRIGHT", 2, 2)

				btn.isSkinned = true
			end
		end
	end)
end

T.SkinFuncs["Blizzard_EncounterJournal"] = LoadSkin