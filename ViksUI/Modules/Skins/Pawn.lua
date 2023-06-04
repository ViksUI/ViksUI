local T, C, L = unpack(ViksUI)
if C.skins.blizzard_frames ~= true or C.skins.pawn ~= true or IsAddOnLoaded('Pawn') ~= true then return end

local function LoadSkin()
	if addon == 'Blizzard_InspectUI' or IsAddOnLoaded('Blizzard_InspectUI') then
		InspectFrame:HookScript('OnShow', function() PawnUI_InspectPawnButton:SkinButton(true) PawnUI_InspectPawnButton:SetFormattedText(" Pawn ") PawnUI_InspectPawnButton:ClearAllPoints() PawnUI_InspectPawnButton:Point('RIGHT', InspectFrameCloseButton, 'LEFT', -8, -4) PawnUI_InspectPawnButton:Size(66, 20)end)
	end

	-- General
	PawnUIFrame:StripTextures()
	PawnUIFrame:SetTemplate("Overlay")
	T.SkinCloseButton(PawnUIFrame_TinyCloseButton)
	T.SkinScrollBar(PawnUIScaleSelectorScrollFrameScrollBar)
	PawnUIStringDialogMultiLine:StripTextures()
	PawnUIValuesTabPage:StripTextures()
	PawnUIFrame_StatsList:StripTextures()
	PawnUIFrame_StatsListScrollChildFrame:Hide()
	PawnUIStringDialogMultiLine:SetTemplate("Overlay")
	PawnUIFrame_StatsList:SetTemplate("Default")
	T.SkinEditBox(PawnUIStringDialogMultiLine_TextBox)
	PawnUIStringDialogMultiLine.OKButton:SkinButton(true)
	PawnUIStringDialogMultiLine.CancelButton:SkinButton(true)

	PawnUI_InventoryPawnButton:SkinButton(true)
	PawnUI_InventoryPawnButton:SetFormattedText(" Pawn ")


	for i = 1, PawnUIFrame.numTabs do
		T.SkinTab(_G["PawnUIFrameTab"..i])
	end

	-- Scale
	PawnUIFrame_RenameScaleButton:SkinButton(true)
	PawnUIFrame_DeleteScaleButton:SkinButton(true)
	T.SkinCheckBox(PawnUIFrame_ShowScaleCheck)
	PawnUIFrame_ImportScaleButton:SkinButton(true)
	PawnUIFrame_ExportScaleButton:SkinButton(true)
	PawnUIFrame_CopyScaleButton:SkinButton(true)
	PawnUIFrame_NewScaleFromDefaultsButton:SkinButton(true)
	PawnUIFrame_NewScaleButton:SkinButton(true)
	PawnUIFrame_AutoSelectScalesOnButton:SkinButton(true)
	PawnUIFrame_AutoSelectScalesOffButton:SkinButton(true)
	PawnUIFrame_ScaleColorSwatch:SkinButton(true)

	-- Weights
	T.SkinScrollBar(PawnUIFrame_StatsListScrollBar)
	T.SkinCheckBox(PawnUIFrame_NormalizeValuesCheck)
	T.SkinEditBox(PawnUIFrame_StatValueBox)
	PawnUIFrame_ClearValueButton:SkinButton(true)

	-- Compare
	PawnUIFrame_CompareSwapButton:SkinButton(true)
	T.SkinScrollBar(PawnUICompareScrollFrameScrollBar)
	PawnUICompareItemIcon1:CreateBackdrop("Overlay")
	PawnUICompareItemIcon2:CreateBackdrop("Overlay")

	-- Gems
	T.SkinEditBox(PawnUIFrame_GemQualityLevelBox, 40, 20)
	T.SkinScrollBar(PawnUIGemScrollFrameScrollBar)
	T.SkinCheckBox(PawnUIFrame_BestGemsRadio)
	T.SkinCheckBox(PawnUIFrame_GemsForItemLevelRadio)
	PawnUIFrame_BestGemsRadio:Size(20,20)
	PawnUIFrame_GemsForItemLevelRadio:Size(20,20)

	-- Options
	PawnUIFrame_ResetUpgradesButton:SkinButton(true)
	T.SkinCheckBox(PawnUIFrame_EnchantedValuesCheck)
	T.SkinCheckBox(PawnUIFrame_ShowIconsCheck)
	T.SkinCheckBox(PawnUIFrame_ShowSpecIconsCheck)
	T.SkinCheckBox(PawnUIFrame_AlignRightCheck)
	T.SkinCheckBox(PawnUIFrame_ColorTooltipBorderCheck)
	T.SkinCheckBox(PawnUIFrame_ShowBagUpgradeAdvisorCheck)
	T.SkinCheckBox(PawnUIFrame_ShowLootUpgradeAdvisorCheck)
	T.SkinCheckBox(PawnUIFrame_ShowQuestUpgradeAdvisorCheck)
	T.SkinCheckBox(PawnUIFrame_ShowSocketingAdvisorCheck)
	T.SkinCheckBox(PawnUIFrame_IgnoreGemsWhileLevelingCheck)
	T.SkinCheckBox(PawnUIFrame_DebugCheck)
	T.SkinCheckBox(PawnUIFrame_ShowItemIDsCheck)
	T.SkinCheckBox(PawnUIFrame_ShowItemLevelUpgradesCheck)
	T.SkinCheckBox(PawnUIFrame_TooltipUpgradeOnRadio)
	T.SkinCheckBox(PawnUIFrame_TooltipUpgradeOnUpgradesOnlyRadio)
	T.SkinCheckBox(PawnUIFrame_TooltipUpgradeOffRadio)
	T.SkinCheckBox(PawnUIFrame_UpgradeTrackingOffRadio)
	T.SkinCheckBox(PawnUIFrame_UpgradeTrackingOnRadio)
	T.SkinCheckBox(PawnUIFrame_ButtonRightRadio)
	T.SkinCheckBox(PawnUIFrame_ButtonLeftRadio)
	T.SkinCheckBox(PawnUIFrame_ButtonOffRadio)
	PawnUIFrame_TooltipUpgradeOnRadio:Size(20,20)
	PawnUIFrame_TooltipUpgradeOnUpgradesOnlyRadio:Size(20,20)
	PawnUIFrame_TooltipUpgradeOffRadio:Size(20,20)
	PawnUIFrame_UpgradeTrackingOffRadio:Size(20,20)
	PawnUIFrame_UpgradeTrackingOnRadio:Size(20,20)
	PawnUIFrame_ButtonRightRadio:Size(20,20)
	PawnUIFrame_ButtonLeftRadio:Size(20,20)
	PawnUIFrame_ButtonOffRadio:Size(20,20)

	--Resize Buttons
	PawnUI_InventoryPawnButton:Size(80, 20)
	
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)
