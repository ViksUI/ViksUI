local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

--Cache global variables
--Lua functions
local _G = _G
local pairs = pairs
local select = select
local unpack = unpack
--WoW API / Variables
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS:

local function StyleScrollFrame(scrollFrame, widthOverride, heightOverride, inset)
	scrollFrame:SetTemplate()
	scrollFrame.spellTex = scrollFrame:CreateTexture(nil, 'ARTWORK')
	scrollFrame.spellTex:SetTexture([[Interface\QuestFrame\QuestBG]])
	if inset then
		scrollFrame.spellTex:Point("TOPLEFT", 2, -2)
	else
		scrollFrame.spellTex:Point("TOPLEFT")
	end
	scrollFrame.spellTex:Size(widthOverride or 506, heightOverride or 615)
	scrollFrame.spellTex:SetTexCoord(0, 1, 0.02, 1)
end

local function LoadSkin()
	T.SkinScrollBar(QuestDetailScrollFrameScrollBar)
	T.SkinScrollBar(QuestProgressScrollFrameScrollBar)
	T.SkinScrollBar(QuestRewardScrollFrameScrollBar)
	T.SkinScrollBar(QuestGreetingScrollFrameScrollBar)
	T.SkinScrollBar(QuestNPCModelTextScrollFrameScrollBar)

	--T:HandleScrollBar(QuestProgressScrollFrameScrollBar)
	--T:HandleScrollBar(QuestRewardScrollFrameScrollBar)

	--T:HandleScrollBar(QuestDetailScrollFrameScrollBar)
	QuestProgressScrollFrame:StripTextures()

	QuestGreetingScrollFrame:StripTextures()
	--T:HandleScrollBar(QuestGreetingScrollFrameScrollBar)

	QuestInfoSkillPointFrame:StripTextures()
	QuestInfoSkillPointFrame:StyleButton()
	QuestInfoSkillPointFrame:Width(QuestInfoSkillPointFrame:GetWidth() - 4)
	QuestInfoSkillPointFrame:SetFrameLevel(QuestInfoSkillPointFrame:GetFrameLevel() + 2)
	QuestInfoSkillPointFrameIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	QuestInfoSkillPointFrameIconTexture:SetDrawLayer("OVERLAY")
	QuestInfoSkillPointFrameIconTexture:Point("TOPLEFT", 2, -2)
	QuestInfoSkillPointFrameIconTexture:Size(QuestInfoSkillPointFrameIconTexture:GetWidth() - 2, QuestInfoSkillPointFrameIconTexture:GetHeight() - 2)
	--QuestInfoSkillPointFrame:CreateBackdrop("Default")
	QuestInfoSkillPointFrameCount:SetDrawLayer("OVERLAY")

	QuestInfoItemHighlight:StripTextures()
	QuestInfoItemHighlight:SetTemplate("Default", nil, true)
	QuestInfoItemHighlight:SetBackdropBorderColor(1, 1, 0)
	QuestInfoItemHighlight:SetBackdropColor(0, 0, 0, 0)
	--QuestInfoItemHighlight.backdropTexture:SetAlpha(0)
	QuestInfoItemHighlight:Size(142, 40)

	hooksecurefunc("QuestInfoItem_OnClick", function(self)
		QuestInfoItemHighlight:ClearAllPoints()
		QuestInfoItemHighlight:SetOutside(self.Icon)

		self.Name:SetTextColor(1, 1, 0)

		local parent = self:GetParent()
		for i=1, #parent.RewardButtons do
			local questItem = QuestInfoRewardsFrame.RewardButtons[i]
			if(questItem ~= self) then
				questItem.Name:SetTextColor(1, 1, 1)
			end
		end
	end)

	QuestRewardScrollFrame:HookScript('OnShow', function(self)
		if not self.backdrop then
			self:CreateBackdrop("Default")
			--StyleScrollFrame(self, 509, 630, false)
			self:Height(self:GetHeight() - 2)
		end
		--self.spellTex:Height(self:GetHeight() + 217)
	end)

	hooksecurefunc("QuestInfo_Display", function()
		for i = 1, #QuestInfoRewardsFrame.RewardButtons do
			local questItem = QuestInfoRewardsFrame.RewardButtons[i]
			if not questItem:IsShown() then break end

			local point, relativeTo, relativePoint, _, y = questItem:GetPoint()
			if point and relativeTo and relativePoint then
				if i == 1 then
					questItem:Point(point, relativeTo, relativePoint, 0, y)
				elseif relativePoint == "BOTTOMLEFT" then
					questItem:Point(point, relativeTo, relativePoint, 0, -4)
				else
					questItem:Point(point, relativeTo, relativePoint, 4, 0)
				end
			end

			questItem.Name:SetTextColor(1, 1, 1)
		end
	end)

	local rewardFrames = {
		["MoneyFrame"] = true,
		["XPFrame"] = true,
		["SkillPointFrame"] = true, -- this may have extra textures.. need to check on it when possible
		["HonorFrame"] = true,
		["ArtifactXPFrame"] = true,
		["TitleFrame"] = true,
	}

	local function HandleReward(frame)
		if frame.backdrop then return end
		frame.NameFrame:SetAlpha(0)
		frame.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		frame:CreateBackdrop()
		frame.backdrop:SetOutside(frame.Icon)
		--frame.Name:FontTemplate()
		frame.Count:ClearAllPoints()
		frame.Count:Point("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, 0)

		if(frame.CircleBackground) then
			frame.CircleBackground:SetAlpha(0)
			frame.CircleBackgroundGlow:SetAlpha(0)
		end
	end

	for frame, _ in pairs(rewardFrames) do
		HandleReward(MapQuestInfoRewardsFrame[frame])
	end

	-- Hook for WorldQuestRewards / QuestLogRewards
	hooksecurefunc("QuestInfo_GetRewardButton", function(rewardsFrame, index)
		local rewardButton = rewardsFrame.RewardButtons[index]
		local mapButton = MapQuestInfoRewardsFrame.RewardButtons[index]

		if(mapButton and not mapButton.IsSkinned) then
			HandleReward(mapButton)
			mapButton.IsSkinned = true
		end

		if(rewardButton and not rewardButton.skinned) then
			rewardButton.NameFrame:Hide()
			rewardButton.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			rewardButton.IconBorder:SetAlpha(0)
			rewardButton:CreateBackdrop("Default")
			rewardButton.backdrop:SetOutside(rewardButton.Icon)
			rewardButton.Icon:SetDrawLayer("OVERLAY")
			rewardButton.Count:SetDrawLayer("OVERLAY")

			hooksecurefunc(rewardButton.IconBorder, "SetVertexColor", function(self, r, g, b)
				self:GetParent().backdrop:SetBackdropBorderColor(r, g, b)
				self:SetTexture("")
			end)
			hooksecurefunc(rewardButton.IconBorder, "Hide", function(self)
				self:GetParent().backdrop:SetBackdropBorderColor(unpack(C.media.border_color))
			end)

			rewardButton.skinned = true
		end
	end)

	--Reward: Title
	QuestInfoPlayerTitleFrame.FrameLeft:SetTexture(nil)
	QuestInfoPlayerTitleFrame.FrameCenter:SetTexture(nil)
	QuestInfoPlayerTitleFrame.FrameRight:SetTexture(nil)
	QuestInfoPlayerTitleFrame.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	QuestInfoPlayerTitleFrame:CreateBackdrop("Default")
	QuestInfoPlayerTitleFrame.backdrop:SetOutside(QuestInfoPlayerTitleFrame.Icon)

	--Quest Frame
	QuestFrame:StripTextures(true)
	QuestFrameInset:Kill()
	QuestFrameDetailPanel:StripTextures(true)
	QuestDetailScrollFrame:StripTextures(true)
	QuestDetailScrollFrame:SetTemplate()
	--StyleScrollFrame(QuestDetailScrollFrame, 506, 615, true)

	QuestProgressScrollFrame:SetTemplate()
	--StyleScrollFrame(QuestProgressScrollFrame, 506, 615, true)

	QuestGreetingScrollFrame:SetTemplate()
	--StyleScrollFrame(QuestGreetingScrollFrame, 506, 615, true)

	QuestFrameGreetingPanel:StripTextures(true)
	T:HandleButton(QuestFrameGreetingGoodbyeButton, true)
	QuestGreetingFrameHorizontalBreak:Kill()

	QuestDetailScrollChildFrame:StripTextures(true)
	QuestRewardScrollFrame:StripTextures(true)
	QuestRewardScrollChildFrame:StripTextures(true)
	QuestFrameProgressPanel:StripTextures(true)
	QuestFrameRewardPanel:StripTextures(true)
	QuestFrame:CreateBackdrop("Transparent")
	T:HandleButton(QuestFrameAcceptButton, true)
	T:HandleButton(QuestFrameDeclineButton, true)
	T:HandleButton(QuestFrameCompleteButton, true)
	T:HandleButton(QuestFrameGoodbyeButton, true)
	T:HandleButton(QuestFrameCompleteQuestButton, true)
	T.SkinCloseButton(QuestFrameCloseButton, QuestFrame.backdrop)

	for i=1, 6 do
		local button = _G["QuestProgressItem"..i]
		local icon = _G["QuestProgressItem"..i.."IconTexture"]
		icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		icon:Point("TOPLEFT", 2, -2)
		icon:Size(icon:GetWidth() -3, icon:GetHeight() -3)
		button:Width(button:GetWidth() -4)
		button:StripTextures()
		button:SetFrameLevel(button:GetFrameLevel() +1)

		local frame = CreateFrame("Frame", nil, button)
		frame:SetFrameLevel(button:GetFrameLevel() -1)
		frame:SetTemplate("Transparent", nil, true)
		frame:SetBackdropBorderColor(unpack(C.media.border_color))
		frame:SetBackdropColor(0, 0, 0, 0)
		frame:SetOutside(icon)
		button.backdrop = frame

		local hover = button:CreateTexture()
		hover:SetColorTexture(1, 1, 1, 0.3)
		hover:SetAllPoints(icon)
		button:SetHighlightTexture(hover)
		button.hover = hover
	end

	QuestNPCModel:StripTextures()
	QuestNPCModel:CreateBackdrop("Transparent")
	QuestNPCModel:Point("TOPLEFT", QuestLogDetailFrame, "TOPRIGHT", 4, -34)
	QuestNPCModelTextFrame:StripTextures()
	QuestNPCModelTextFrame:CreateBackdrop("Default")
	QuestNPCModelTextFrame.backdrop:Point("TOPLEFT", QuestNPCModel.backdrop, "BOTTOMLEFT", 0, -2)
	--QuestLogDetailFrame:StripTextures()
	--QuestLogDetailFrame:SetTemplate("Transparent")
	--QuestLogDetailScrollFrame:StripTextures()
	--T:HandleCloseButton(QuestLogDetailFrameCloseButton)

	hooksecurefunc("QuestFrame_ShowQuestPortrait", function(QuestFrame, parentFrame, portrait, text, name, x, y)
		QuestNPCModel:ClearAllPoints();
		QuestNPCModel:SetPoint("TOPLEFT", QuestFrame, "TOPRIGHT", x + 10, y)
	end)

	QuestLogPopupDetailFrame:StripTextures()
	QuestLogPopupDetailFrameInset:StripTextures()
	T:HandleButton(QuestLogPopupDetailFrameAbandonButton)
	T:HandleButton(QuestLogPopupDetailFrameShareButton)
	T:HandleButton(QuestLogPopupDetailFrameTrackButton)
	QuestLogPopupDetailFrameScrollFrame:StripTextures()
	--T:HandleScrollBar(QuestLogPopupDetailFrameScrollFrameScrollBar)
	QuestLogPopupDetailFrame:SetTemplate("Transparent")

	--QuestLogPopupDetailFrameScrollFrame:HookScript('OnShow', function(self)
		--if not QuestLogPopupDetailFrameScrollFrame.backdrop then
			--QuestLogPopupDetailFrameScrollFrame:CreateBackdrop("Default")
			--StyleScrollFrame(QuestLogPopupDetailFrameScrollFrame, 509, 630, false)
			--QuestLogPopupDetailFrameScrollFrame:Height(self:GetHeight() - 2)
		--end
		--QuestLogPopupDetailFrameScrollFrame.spellTex:Height(self:GetHeight() + 217)
	--end)

	T.SkinCloseButton(QuestLogPopupDetailFrameCloseButton)
	--T:HandleScrollBar(QuestMapDetailsScrollFrameScrollBar)

	QuestLogPopupDetailFrame.ShowMapButton:StripTextures()
	T:HandleButton(QuestLogPopupDetailFrame.ShowMapButton)
	QuestLogPopupDetailFrame.ShowMapButton.Text:ClearAllPoints()
	QuestLogPopupDetailFrame.ShowMapButton.Text:Point("CENTER")
	QuestLogPopupDetailFrame.ShowMapButton:Size(QuestLogPopupDetailFrame.ShowMapButton:GetWidth() - 20, QuestLogPopupDetailFrame.ShowMapButton:GetHeight(), - 45)

	-- Skin the +/- buttons in the QuestLog
	hooksecurefunc("QuestLogQuests_Update", function()
		local tex, texture
		for i = 6, QuestMapFrame.QuestsFrame.Contents:GetNumChildren() do
			local child = select(i, QuestMapFrame.QuestsFrame.Contents:GetChildren())
			if child and child.ButtonText and not child.Text then
				if not child.buttonSized then
					child:Size(16, 16)
					child.buttonSized = true
				end

				tex = select(2, child:GetRegions())
				if tex and tex.GetTexture then
					texture = tex:GetTexture()
					if texture then
						if texture:find("PlusButton") then
							tex:SetTexture("Interface\\AddOns\\ViksUI\\Media\\textures\\PlusButton")
						else
							tex:SetTexture("Interface\\AddOns\\ViksUI\\Media\\textures\\MinusButton")
						end
					end
				end
			end
		end
	end)
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)
