local T, C, L, _ = unpack(select(2, ...))

if C.misc.WatchFrame then
----------------------------------------------------------------------------------------
--	Move ObjectiveTrackerFrame
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame", "WatchFrameAnchor", oUF_PetBattleFrameHider)
frame:SetPoint("TOPRIGHT", DataTextQuests, "BOTTOMLEFT", 0, 10)
frame:SetHeight(150)
frame:SetWidth(224)

ObjectiveTrackerFrame:ClearAllPoints()
ObjectiveTrackerFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
ObjectiveTrackerFrame:SetHeight(T.screenHeight / 1.6)
ObjectiveTrackerFrame:SetWidth(180)

hooksecurefunc(ObjectiveTrackerFrame, "SetPoint", function(_, _, parent)
	if parent ~= frame then
		ObjectiveTrackerFrame:ClearAllPoints()
		ObjectiveTrackerFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -20)
	end
end)

local ObjectiveTracker = CreateFrame("Frame", "ViksUIObjectiveTracker", UIParent)


-- Lib Globals
local _G = _G
local unpack = unpack
local select = select

-- WoW Globals
local ObjectiveTrackerFrame = ObjectiveTrackerFrame
local ObjectiveTrackerFrameHeaderMenuMinimizeButton = ObjectiveTrackerFrame.HeaderMenu.MinimizeButton
local SCENARIO_CONTENT_TRACKER_MODULE = SCENARIO_CONTENT_TRACKER_MODULE
local QUEST_TRACKER_MODULE = QUEST_TRACKER_MODULE
local WORLD_QUEST_TRACKER_MODULE = WORLD_QUEST_TRACKER_MODULE
local DEFAULT_OBJECTIVE_TRACKER_MODULE = DEFAULT_OBJECTIVE_TRACKER_MODULE
local BONUS_OBJECTIVE_TRACKER_MODULE = BONUS_OBJECTIVE_TRACKER_MODULE
local SCENARIO_TRACKER_MODULE = SCENARIO_TRACKER_MODULE

-- Locals
local Class = select(2, UnitClass("player"))
local CustomClassColor = T.Colors.class[Class]
local PreviousPOI
local qfont = C.media.fontcombat
function ObjectiveTracker:Disable()
	ObjectiveTrackerFrameHeaderMenuMinimizeButton:Hide()
end
BONUS_OBJECTIVE_TRACKER_MODULE.Header.Background:Hide()
WORLD_QUEST_TRACKER_MODULE.Header.Background:Hide()
ObjectiveTrackerBlocksFrame.UIWidgetsHeader.Background:Hide()

ObjectiveTrackerFrame.HeaderMenu.Title:SetAlpha(0)

function ObjectiveTracker:OnEnter()
	self:SetFadeInTemplate(1, 1)
end

function ObjectiveTracker:OnLeave()
	self:SetFadeOutTemplate(1, 0)
end

function ObjectiveTracker:OnClick()
	if (ObjectiveTrackerFrame:IsVisible()) then
		ObjectiveTrackerFrame:Hide()

		self.Toggle:SetText("<")
	else
		ObjectiveTrackerFrame:Show()

		self.Toggle:SetText(">")
	end
end

function ObjectiveTracker:Skin()
	local Frame = ObjectiveTrackerFrame.MODULES

	if (Frame) then
		for i = 1, #Frame do

			local Modules = Frame[i]
			if (Modules) then
				local Header = Modules.Header

				local Background = Modules.Header.Background
				Background:SetAtlas(nil)

				local Text = Modules.Header.Text
				Text:SetFont(C.media.pxfontHeader, 16)
				Text:SetDrawLayer("OVERLAY", 7)
				Text:SetParent(Header)

				if not (Modules.IsSkinned) then
					local HeaderPanel = CreateFrame("Frame", nil, Header)
					HeaderPanel:SetFrameLevel(Header:GetFrameLevel() - 1)
					HeaderPanel:SetFrameStrata("BACKGROUND")
					HeaderPanel:SetOutside(Header, 1, 1)
					

					local HeaderBar = CreateFrame("StatusBar", nil, HeaderPanel)
					HeaderBar:Size(263, 2)
					HeaderBar:SetPoint("CENTER", HeaderPanel, 0, -9)
					HeaderBar:SetStatusBarTexture(C.media.blank)
					HeaderBar:SetStatusBarColor(unpack(CustomClassColor))
					HeaderBar:SetTemplate()

					HeaderBar:CreateShadow()
					local Minimize = Header.MinimizeButton
					Minimize.SetCollapsed = function() return end
					Minimize:StripTextures()
					Minimize:ClearAllPoints()
					Minimize:SetAllPoints(HeaderBar)								 

					Modules.IsSkinned = true
				end
			end
		end
	end
end

ObjectiveTrackerFrame.HeaderMenu.Title:SetAlpha(0)

function ObjectiveTracker:SkinScenario()
	local StageBlock = _G["ScenarioStageBlock"]

	StageBlock.NormalBG:SetTexture("")
	StageBlock.FinalBG:SetTexture("")
	StageBlock.Stage:SetFont(C.media.pxfontHeader, 17)
	StageBlock.GlowTexture:SetTexture("")
end

function ObjectiveTracker:UpdateQuestItem(block)
	local QuestItemButton = block.itemButton

	if (QuestItemButton) then
		local Icon = QuestItemButton.icon
		local Count = QuestItemButton.Count
		local HotKey = QuestItemButton.HotKey									   

		if not (QuestItemButton.IsSkinned) then
			QuestItemButton:Size(26, 26)
			QuestItemButton:CreateBackdrop()
			QuestItemButton:CreateShadow()
			QuestItemButton:StyleButton()
			QuestItemButton:SetNormalTexture(nil)

			if (Icon) then
				Icon:SetInside()
				Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end

			if (Count) then
				Count:ClearAllPoints()
				Count:SetPoint("BOTTOMRIGHT", QuestItemButton, 0, 3)
				Count:SetFont(C.media.pxfontHeader, 12)
			end
			
			if HotKey then
				HotKey:SetText("")
				HotKey:SetAlpha(0)
			end
			QuestItemButton.IsSkinned = true
		end
	end
end

function ObjectiveTracker:UpdateProgressBar(_, line)
	local Progress = line.ProgressBar
	local Bar = Progress.Bar

	if (Bar) then
		local Label = Bar.Label
		local Icon = Bar.Icon
		local IconBG = Bar.IconBG
		local Backdrop = Bar.BarBG
		local Glow = Bar.BarGlow
		local Sheen = Bar.Sheen
		local Frame = Bar.BarFrame
		local Frame2 = Bar.BarFrame2
		local Frame3 = Bar.BarFrame3
		local BorderLeft = Bar.BorderLeft
		local BorderRight = Bar.BorderRight
		local BorderMid = Bar.BorderMid
		local Texture = C["media"].texture
		Bar:SetStatusBarTexture(Texture)

		if not (Bar.IsSkinned) then
			if (Backdrop) then Backdrop:Hide() Backdrop:SetAlpha(0) end
			if (IconBG) then IconBG:Hide() IconBG:SetAlpha(0) end
			if (Glow) then Glow:Hide() end
			if (Sheen) then Sheen:Hide() end
			if (Frame) then Frame:Hide() end
			if (Frame2) then Frame2:Hide() end
			if (Frame3) then Frame3:Hide() end
			if (BorderLeft) then BorderLeft:SetAlpha(0) end
			if (BorderRight) then BorderRight:SetAlpha(0) end
			if (BorderMid) then BorderMid:SetAlpha(0) end

			Bar:Height(20)
			Bar:SetStatusBarTexture(Texture)
			--Bar:CreateBackdrop(nil, Texture)
			--Bar.Backdrop:CreateShadow()
			--Bar.Backdrop:SetFrameStrata("BACKGROUND")
			--Bar.Backdrop:SetFrameLevel(1)
			--Bar.Backdrop:SetOutside(Bar)							   

			if (Label) then
				Label:ClearAllPoints()
				Label:SetPoint("CENTER", Bar, 0, 0)
				Label:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
			end

			if (Icon) then
				Icon:Size(20, 20)
				Icon:SetMask("")
				Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				Icon:ClearAllPoints()
				Icon:SetPoint("RIGHT", Bar, 26, 0)

				if not (Bar.NewBorder) then
					Bar.NewBorder = CreateFrame("Frame", nil, Bar)
					Bar.NewBorder:CreateBackdrop()
					Bar.NewBorder:SetFrameLevel(Bar:GetFrameLevel() - 1)
					Bar.NewBorder:CreateShadow()
					Bar.NewBorder:SetOutside(Icon)
					Bar.NewBorder:SetShown(Icon:IsShown())
				end
			end
		
			BonusObjectiveTrackerProgressBar_PlayFlareAnim = T.dummy
			Bar.IsSkinned = true
		elseif (Icon and Bar.NewBorder) then
			Bar.NewBorder:SetShown(Icon:IsShown())
		end
	end
end

function ObjectiveTracker:UpdateProgressBarColors(Min)
	if (self.Bar and Min) then
		local R, G, B = T.ColorGradient(Min, 100, 0.8, 0, 0, 0.8, 0.8, 0, 0, 0.8, 0)
		self.Bar:SetStatusBarColor(R, G, B)
	end
end

function ObjectiveTracker:UpdatePopup()
	for i = 1, GetNumAutoQuestPopUps() do
		local ID, type = GetAutoQuestPopUp(i)
		local Title = C_QuestLog.GetTitleForQuestID(ID)

		if Title and Title ~= "" then
			local Block = self:GetBlock(ID, "ScrollFrame", "AutoQuestPopUpBlockTemplate")

			if Block then
				local Frame = Block.ScrollChild

				if not Frame.Backdrop then
					Frame:CreateBackdrop("Transparent")

					Frame.Backdrop:SetPoint("TOPLEFT", Frame, 40, -4)
					Frame.Backdrop:SetPoint("BOTTOMRIGHT", Frame, 0, 4)
					Frame.Backdrop:SetFrameLevel(0)
					Frame.Backdrop:CreateShadow()

					Frame.FlashFrame.IconFlash:Hide()
					
					Frame.Shine:ClearAllPoints()
					Frame.Shine:SetParent(T.Hider)
					
					Frame.IconShine:ClearAllPoints()
					Frame.IconShine:SetParent(T.Hider)
				end

				if  type == "COMPLETE" then
					Frame.QuestIconBg:SetAlpha(0)
					Frame.QuestIconBadgeBorder:SetAlpha(0)
					Frame.QuestionMark:ClearAllPoints()
					Frame.QuestionMark:SetPoint("CENTER", Frame.Backdrop, "LEFT", 10, 0)
					Frame.QuestionMark:SetParent(Frame.Backdrop)
					Frame.QuestionMark:SetDrawLayer("OVERLAY", 7)
					Frame.IconShine:Hide()
				elseif type == "OFFER" then
					Frame.QuestIconBg:SetAlpha(0)
					Frame.QuestIconBadgeBorder:SetAlpha(0)
					test = Frame
					Frame.Exclamation:ClearAllPoints()
					Frame.Exclamation:SetPoint("CENTER", Frame.Backdrop, "LEFT", 10, 0)
					Frame.Exclamation:SetParent(Frame.Backdrop)
					Frame.Exclamation:SetDrawLayer("OVERLAY", 7)
				end

				Frame.FlashFrame:Hide()
				Frame.Bg:Hide()

				for _, v in pairs({Frame.BorderTopLeft, Frame.BorderTopRight, Frame.BorderBotLeft, Frame.BorderBotRight, Frame.BorderLeft, Frame.BorderRight, Frame.BorderTop, Frame.BorderBottom}) do
					v:Hide()
				end
			end
		end
	end
end

local function SkinGroupFindButton(block)
	local HasGroupFinderButton = block.hasGroupFinderButton
	local GroupFinderButton = block.groupFinderButton

	if (HasGroupFinderButton and GroupFinderButton) then
		if not (GroupFinderButton.IsSkinned) then
			GroupFinderButton:SkinButton()
			GroupFinderButton:Size(18)
			GroupFinderButton:CreateShadow()

			GroupFinderButton.IsSkinned = true
		end
	end
end

local function UpdatePositions(block)
	local GroupFinderButton = block.groupFinderButton
	local ItemButton = block.itemButton

	if (ItemButton) then
		local PointA, PointB, PointC, PointD, PointE = ItemButton:GetPoint()
		ItemButton:SetPoint(PointA, PointB, PointC, -6, -1)
	end

	if (GroupFinderButton) then
		local GPointA, GPointB, GPointC, GPointD, GPointE = GroupFinderButton:GetPoint()
		GroupFinderButton:SetPoint(GPointA, GPointB, GPointC, -262, -4)
	end
end

function ObjectiveTracker:SkinPOI(questID, style, index)
	local Incomplete = self.poiTable["numeric"]
	local Complete = self.poiTable["completed"]

	for i = 1, #Incomplete do
		local Button = ObjectiveTrackerBlocksFrame.poiTable["numeric"][i]

		if Button and not Button.IsSkinned then
			Button:SetNormalTexture("")
			Button:SetPushedTexture("")
			Button.HighlightTexture:SetTexture("")
			Button.Glow:SetAlpha(0)
			Button:SetSize(20, 20)
			Button:StripTextures()
			Button:SetTemplate()
			Button:StyleButton()
			Button:CreateShadow()

			Button.IsSkinned = true
		end
		if Button.NormalTexture then
			Button.NormalTexture:SetAlpha(0)
		end
		if Button.style == "numeric" then
		Button.Display:SetNumber(Button.index)
		end
	end

	for i = 1, #Complete do
		local Button = ObjectiveTrackerBlocksFrame.poiTable["completed"][i]

		if Button and not Button.IsSkinned then
			Button:SetNormalTexture("")
			Button:SetPushedTexture("")
			Button.HighlightTexture:SetTexture("")
			Button.Glow:SetAlpha(0)
			Button:SetSize(20, 20)
			Button:StripTextures()
			Button:SetTemplate()
			Button:StyleButton()
			Button:CreateShadow()

			Button.IsSkinned = true
		end
		if Button.NormalTexture then
			Button.NormalTexture:SetAlpha(0)
		end
	end
	
end

function ObjectiveTracker:SelectPOI(color)
	local Shadow = self.Shadow

	if Shadow then
		local ID = C_QuestLog.GetQuestLogIndexByID(self.questID)
		local Level = select(2, GetQuestLogTitle(ID))
		local Color = C_QuestLog.GetQuestDifficultyColor(Level) or {r = 1, g = 1, b = 0, a = 1}
		local Number = self.Number

		if PreviousPOI then
			PreviousPOI:SetBackdropColor(unpack(C.media.backdrop_color))
			PreviousPOI.Shadow:SetBackdropBorderColor(unpack(C.media.border_color))
		end

		Shadow:SetBackdropBorderColor(Color.r, Color.g, Color.b)

		self:SetBackdropColor(0/255, 152/255, 34/255, 1)

		PreviousPOI = self
	end
end

function ObjectiveTracker:ShowObjectiveTrackerLevel()
	for i = 1, C_QuestLog.GetNumQuestWatches() do
		local questID, title, questLogIndex = C_QuestLog.GetQuestWatchInfo(i)
		
		if ( not questID ) then
			break
		end
		
		local block = QUEST_TRACKER_MODULE:GetExistingBlock(questID)
		
		if block then
			local title, level = C_QuestLog.GetQuestLogTitle(questLogIndex)
			local color = C_QuestLog.GetQuestDifficultyColor(level)
			local hex = T.RGBToHex(color.r, color.g, color.b) or OBJECTIVE_TRACKER_COLOR["Header"]
			local text = hex.."["..level.."]|r "..title

			block.HeaderText:SetText(text)
		end
	end
end

function ObjectiveTracker:SkinRewards()
	local rewardsFrame = self.module.rewardsFrame
	
	rewardsFrame:StripTextures()
	
	if rewardsFrame.id then
		for i = 1, 6 do
			local rewardItem = rewardsFrame.Rewards[i]
			
			if rewardItem then
				local Icon = rewardItem.ItemIcon
				local Border = rewardItem.ItemBorder
				local Label = rewardItem.Label
				local ItemOverlay = rewardItem.ItemOverlay
				
				if Icon then
					--Icon:Size(18)
					Icon:SetTexCoord(.08, .92, .08, .92)
				end
				
				if Border then
					Border:SetTexture("")
				end
			end
		end
	end
end

function ObjectiveTracker:SkinWorldQuestsPOI(worldQuestType, rarity, isElite, tradeskillLineIndex, inProgress, selected, isCriteria, isSpellTarget, isEffectivelyTracked)
	if not self.IsSkinned then
		self:SetTemplate()
		self:CreateShadow()
		self.Underlay:SetAlpha(0)
		self.Glow:SetAlpha(0)
		self.SelectedGlow:SetAlpha(0)

		self.IsSkinned = true
	end

	self:SetNormalTexture("")
	self:SetPushedTexture("")
	self:SetHighlightTexture("")

	if selected then
		self:SetBackdropColor(0/255, 152/255, 34/255, 1)
	else
		self:SetBackdropColor(unpack(C.media.backdrop_color))
	end

	if PreviousPOI and PreviousPOI.IsSkinned then
		PreviousPOI:SetBackdropColor(unpack(C.media.backdrop_color))
		PreviousPOI.Shadow:SetBackdropBorderColor(unpack(C.media.border_color))
	end
end

function ObjectiveTracker:AddHooks()
	hooksecurefunc("ObjectiveTracker_Update", self.Skin)
	hooksecurefunc("ScenarioBlocksFrame_OnLoad", self.SkinScenario)
	hooksecurefunc(SCENARIO_CONTENT_TRACKER_MODULE, "Update", self.SkinScenario)
	hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", self.UpdateQuestItem)
	hooksecurefunc(WORLD_QUEST_TRACKER_MODULE, "AddObjective", self.UpdateQuestItem)
	hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", self.UpdateProgressBar)
	hooksecurefunc(BONUS_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", self.UpdateProgressBar)
	hooksecurefunc(WORLD_QUEST_TRACKER_MODULE, "AddProgressBar", self.UpdateProgressBar)
	hooksecurefunc(SCENARIO_TRACKER_MODULE, "AddProgressBar", self.UpdateProgressBar)
	hooksecurefunc("BonusObjectiveTrackerProgressBar_SetValue", self.UpdateProgressBarColors)
	hooksecurefunc("ObjectiveTrackerProgressBar_SetValue", self.UpdateProgressBarColors)
	hooksecurefunc("ScenarioTrackerProgressBar_SetValue", self.UpdateProgressBarColors)
	hooksecurefunc("QuestObjectiveSetupBlockButton_FindGroup", SkinGroupFindButton)
	hooksecurefunc("QuestObjectiveSetupBlockButton_AddRightButton", UpdatePositions)																			 
	hooksecurefunc("AutoQuestPopupTracker_Update", self.UpdatePopup)
	hooksecurefunc("QuestPOI_GetButton", self.SkinPOI)
	hooksecurefunc("QuestPOI_SelectButton", self.SelectPOI)
	hooksecurefunc("BonusObjectiveTracker_AnimateReward", self.SkinRewards)																	
	hooksecurefunc(QuestUtil, "SetupWorldQuestButton", self.SkinWorldQuestsPOI)					   
end

function ObjectiveTracker:Enable()
	OBJECTIVE_TRACKER_COLOR["Header"] = {r = CustomClassColor[1], g = CustomClassColor[2], b = CustomClassColor[3]}
	OBJECTIVE_TRACKER_COLOR["HeaderHighlight"] = {r = CustomClassColor[1]*1.2, g = CustomClassColor[2]*1.2, b = CustomClassColor[3]*1.2}
	OBJECTIVE_TRACKER_COLOR["Complete"] = { r = 0, g = 1, b = 0 }
	OBJECTIVE_TRACKER_COLOR["Normal"] = { r = 1, g = 1, b = 1 }
	self:AddHooks()
	self:Disable()
	self:SkinScenario()
end

ObjectiveTracker:Enable()
end