local T, C, L = unpack(ViksUI)
if C.misc.XPBar ~= true then return end

local ExperienceEnable = true
local Experience = CreateFrame("Frame", nil, UIParent)
local Menu = CreateFrame("Frame", "ViksUIExperienceMenu", UIParent, "UIDropDownMenuTemplate")
local HideTooltip = GameTooltip_Hide
local Panels = CreateFrame("Frame")
local BarSelected
local Bars = 20
local barTex = C.media.texture
local MaxRenown = 80
local GetWatchedFactionInfo = (C_Reputation and C_Reputation.GetWatchedFactionData) or GetWatchedFactionInfo
local ExperienceMenu

Experience.NumBars = 2
Experience.RestedColor = {75 / 255, 175 / 255, 76 / 255}
Experience.XPColor = {0 / 255, 144 / 255, 255 / 255}
Experience.AZColor = {229 / 255, 204 / 255, 127 / 255}
Experience.HNColor = {222 / 255, 22 / 255, 22 / 255}
Experience.AnimaColor = {153 / 255, 204 / 255, 255 / 255}

Experience.Menu = {
	{
		text = XP,
		func = function()
			BarSelected.BarType = "XP"
			Experience:Update()
			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true
	},
	{
		text = HONOR,
		func = function()
			BarSelected.BarType = "HONOR"
			Experience:Update()
			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true
	},
	{
		text = "Azerite",
		func = function()
			BarSelected.BarType = "AZERITE"
			Experience:Update()
			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true,
		disabled = true,
	},
	{
		text = REPUTATION,
		func = function()
			BarSelected.BarType = "REP"
			Experience:Update()
			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true,
		disabled = true,
	},
	{
		text = ANIMA_DIVERSION_CURRENCY_TOOLTIP_TITLE,
		func = function()
			BarSelected.BarType = "ANIMA"
			Experience:Update()
			ViksUISettingsPerChar.experiencebar[BarSelected:GetName()] = BarSelected.BarType
		end,
		notCheckable = true,
		disabled = true,
	},
}

Experience.Standing = {
    [0] = UNKNOWN,
    [1] = FACTION_STANDING_LABEL1,
    [2] = FACTION_STANDING_LABEL2,
    [3] = FACTION_STANDING_LABEL3,
    [4] = FACTION_STANDING_LABEL4,
    [5] = FACTION_STANDING_LABEL5,
    [6] = FACTION_STANDING_LABEL6,
    [7] = FACTION_STANDING_LABEL7,
    [8] = FACTION_STANDING_LABEL8,
}

function Experience:SetTooltip()
	local BarType = self.BarType
	local Current, Max, Pts

	if (self == Experience.XPBar1) then
		GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", -1, 5)
	else
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT", 1, 5)
	end

	if BarType == "XP" then
		local Rested = GetXPExhaustion()
		local IsRested = GetRestState()
		Current, Max = Experience:GetExperience()
		if Max == 0 then return end
		GameTooltip:AddLine("Experience:")
		GameTooltip:AddLine("Current experience and rested state", 1, 1, 1, 1, 1, 1)
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("|cffA335EE"..XP..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "% - " .. floor(Bars - (Bars * (Max - Current) / Max)) .. "/" .. Bars .. ")|r")
		if (IsRested == 1 and Rested) then
			GameTooltip:AddLine("|cff0090FF"..TUTORIAL_TITLE26..": +" .. Rested .." (" .. floor(Rested / Max * 100) .. "%)|r")
		end
	elseif BarType == "ANIMA" then
		Current, Max = Experience:GetAnima()
		if Max == 0 then return end
		local Level = C_CovenantSanctumUI.GetRenownLevel()
		GameTooltip:AddDoubleLine("|cffFF3333"..COVENANT_SANCTUM_TAB_RENOWN.." "..LEVEL..": ", Level)
		GameTooltip:AddDoubleLine("|cff99CCFF"..ANIMA_DIVERSION_CURRENCY_TOOLTIP_TITLE..": ", Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "%)")
	elseif BarType == "AZERITE" then
		Current, Max, Level, Items = Experience:GetAzerite()
		if Max == 0 then return end
		local RemainingXP = Max - Current
		local AzeriteItem = Item:CreateFromItemLocation(Items)
		local ItemName = AzeriteItem:GetItemName()
		GameTooltip:AddDoubleLine(ItemName..' ('..Level..')', format(ISLANDS_QUEUE_WEEKLY_QUEST_PROGRESS, Current, Max), 0.90, 0.80, 0.50)
		GameTooltip:AddLine(' ')
		GameTooltip:AddLine(AZERITE_POWER_TOOLTIP_BODY:format(ItemName))
	elseif BarType == "REP" then
		local Current, Max, Standing = Experience:GetReputation()
		local Name, ID, Faction
		if T.Retail then
			local watched = GetWatchedFactionInfo()
			Name = watched and watched.name or nil
			ID = watched and watched.reaction or nil
			Faction = watched and watched.factionID or nil
		else
			Name, ID, Faction = select(1, GetWatchedFactionInfo()), select(2, GetWatchedFactionInfo()), select(2, GetWatchedFactionInfo())
		end
		if not Name then return end
		local Colors = FACTION_BAR_COLORS
		local Hex = T.RGBToHex(Colors[ID].r, Colors[ID].g, Colors[ID].b)
		local majorFactionData = (Faction and C_MajorFactions and C_MajorFactions.GetMajorFactionData(Faction)) or nil
		GameTooltip:AddLine(Name)
		GameTooltip:AddLine("|cffffffff" .. Current .. " / " .. Max .. "|r")
		if C_Reputation and Faction and C_Reputation.IsFactionParagon(Faction) then
			local cur, nextThreshold, _, hasRewardPending = C_Reputation.GetFactionParagonInfo(Faction)
			if(cur) then
				Value = cur % nextThreshold
				Min = 0
				Max = nextThreshold
				pendingReward = hasRewardPending
				Standing = MAX_REPUTATION_REACTION + 1 -- force paragon's color
				standingText = PARAGON
			end
			GameTooltip:AddLine(Hex .. Value .. " / " .. Max .. "|r")
		elseif C_Reputation and Faction and C_Reputation.IsMajorFaction(Faction) and majorFactionData then
			GameTooltip:AddLine(RENOWN_LEVEL_LABEL .. majorFactionData.renownLevel .. "|r")
		else
			GameTooltip:AddLine(Hex .. Standing .. "|r")
		end
	else
		local Level = UnitHonorLevel("player")
		Current, Max = Experience:GetHonor()
		if Max == 0 then
			GameTooltip:AddLine(PVP_HONOR_PRESTIGE_AVAILABLE)
			GameTooltip:AddLine(PVP_HONOR_XP_BAR_CANNOT_PRESTIGE_HERE)
		else
			GameTooltip:AddDoubleLine("|cffee2222"..HONOR..":|r", Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "%)")
			GameTooltip:AddDoubleLine("|cffee2222"..RANK..":|r", Level)
		end
	end
	GameTooltip:Show()
end

function Experience:GetExperience()
	return UnitXP("player"), UnitXPMax("player")
end

function Experience:GetAzerite()
	local AzeriteItems = C_AzeriteItem.FindActiveAzeriteItem()
	local InBank = AzeriteUtil.IsAzeriteItemLocationBankBag(AzeriteItems)
	local XP, TotalXP, Level
	if InBank then
		XP, TotalXP = 0, 0
		Level = 0
	else
		XP, TotalXP = C_AzeriteItem.GetAzeriteItemXPInfo(AzeriteItems)
		Level = C_AzeriteItem.GetPowerLevel(AzeriteItems)
	end
	return XP, TotalXP, Level, AzeriteItems
end

function Experience:GetHonor()
	return UnitHonor("player"), UnitHonorMax("player")
end

local paragonStrings = {
	deDE = 'Huldigend',
	esES = 'Baluarte',
	frFR = 'Parangon',
	itIT = 'Eccellenza',
	ptBR = 'Parag\195\163o',
	ruRU = '\208\152\208\180\208\181\208\176\208\187',
	koKR = '\235\182\136\235\169\184\236\157\152 \235\143\153\235\167\185',
	zhCN = '\229\183\133\229\179\176',
}
paragonStrings.esMX = paragonStrings.esES
paragonStrings.zhTW = paragonStrings.zhCN
_G.PARAGON = paragonStrings[GetLocale()] or 'Paragon'

function Experience:GetReputation()
	local pendingReward, standingText
	local Name = GetWatchedFactionInfo()
	if not Name then return 0, 1, "" end

	local Standing, Min, Max, Value, FactionID
	if Name.currentReactionThreshold then
		Min = Name.currentReactionThreshold
		Max = Name.nextReactionThreshold
		Value = Name.currentStanding
		FactionID = Name.factionID
		Standing = Name.reaction
		local reputationInfo = C_GossipInfo.GetFriendshipReputation(FactionID)
		local friendshipID = reputationInfo and reputationInfo.friendshipFactionID

		if C_Reputation and C_Reputation.IsFactionParagon(FactionID) then
			local cur, nextThreshold, _, hasRewardPending = C_Reputation.GetFactionParagonInfo(FactionID)
			if(cur) then
				Value = cur % nextThreshold
				Min = 0
				Max = nextThreshold
				pendingReward = hasRewardPending
				Standing = MAX_REPUTATION_REACTION + 1 -- force paragon's color
				standingText = PARAGON
			end
		elseif C_Reputation and C_Reputation.IsMajorFaction(FactionID) then
			local majorFactionData = C_MajorFactions.GetMajorFactionData(FactionID)
			Min, Max = 0, majorFactionData.renownLevelThreshold
			Value = C_MajorFactions.HasMaximumRenown(FactionID) and majorFactionData.renownLevelThreshold or majorFactionData.renownReputationEarned or 0
		elseif friendshipID and friendshipID > 0 then
			local repInfo = C_GossipInfo.GetFriendshipReputation(FactionID)
			standingText = repInfo.reaction
			if repInfo.nextThreshold then
				Min, Max, Value = repInfo.reactionThreshold, repInfo.nextThreshold, repInfo.standing
			else
				Min, Max, Value = 0, 1, 1 -- force a full bar when maxed out
			end
			Standing = 5 -- force friends' color
		end
	else
		-- Classic fallback
		local _, standingID, min, max, value, factionID = GetWatchedFactionInfo()
		Min, Max, Value, FactionID, Standing = min, max, value, factionID, standingID
	end

	local BarMax = Max - Min
	local BarValue = Value - Min
	local BarStanding = Experience.Standing[Standing]
	standingText = standingText or GetText('FACTION_STANDING_LABEL' .. Standing, UnitSex('player'))
	return BarValue, BarMax, BarStanding
end

function Experience:GetAnima()
	local CurrencyID, MaxDisplayableValue = C_CovenantSanctumUI.GetAnimaInfo()
	local CurrencyInfo = C_CurrencyInfo.GetCurrencyInfo(CurrencyID)
	local Current = CurrencyInfo.quantity
	local Max = CurrencyInfo.maxQuantity
	return Current, Max
end

function Experience:VerifyMenu()
	local AzeriteItem = T.Retail and C_AzeriteItem.FindActiveAzeriteItem()
	local Honor = T.Retail and UnitHonorLevel
	local WatchedFaction = GetWatchedFactionInfo()
	local AnimaCurrency = T.Retail and C_CovenantSanctumUI.GetAnimaInfo()
	local AnimaCurrencyInfo = AnimaCurrency and C_CurrencyInfo.GetCurrencyInfo(AnimaCurrency)

	-- Honor always enabled
	Experience.Menu[2].disabled = false

	-- Azerite
	if AzeriteItem then
		Experience.Menu[3].disabled = false
	else
		Experience.Menu[3].disabled = true
	end

	-- Reputation
	if WatchedFaction then
		Experience.Menu[4].disabled = false
	else
		Experience.Menu[4].disabled = true
	end

	-- Anima
	if AnimaCurrency and AnimaCurrencyInfo.quantity ~= 0 and AnimaCurrencyInfo.maxQuantity ~= 0 then
		Experience.Menu[5].disabled = false
	else
		Experience.Menu[5].disabled = true
	end
end

function Experience:Update()
	local Current, Max
	local Rested = GetXPExhaustion()
	local IsRested = GetRestState()
	local AnimaCurrency = T.Retail and C_CovenantSanctumUI.GetAnimaInfo()
	local AnimaCurrencyInfo = AnimaCurrency and C_CurrencyInfo.GetCurrencyInfo(AnimaCurrency)
	local RenownLevel = T.Retail and C_CovenantSanctumUI.GetRenownLevel()
	local AzeriteItem = T.Retail and C_AzeriteItem.FindActiveAzeriteItem()
	local WatchedFaction = GetWatchedFactionInfo()

	for i = 1, self.NumBars do
		local Bar = self["XPBar"..i]
		local RestedBar = self["RestedBar"..i]
		local R, G, B

		if (Bar.BarType == "AZERITE" and not AzeriteItem) or (Bar.BarType == "REP" and not WatchedFaction) or (Bar.BarType == "ANIMA" and (not AnimaCurrency or not AnimaCurrencyInfo or AnimaCurrencyInfo.quantity == 0 or AnimaCurrencyInfo.maxQuantity == 0)) then
			Bar.BarType = "XP"
		end

		if Bar.BarType == "HONOR" then
			Current, Max = self:GetHonor()
			R, G, B = unpack(self.HNColor)
		elseif Bar.BarType == "ANIMA" then
			Current = RenownLevel
			Max = MaxRenown
			R, G, B = unpack(self.AnimaColor)
		elseif Bar.BarType == "AZERITE" then
			Current, Max = self:GetAzerite()
			R, G, B = unpack(self.AZColor)
		elseif Bar.BarType == "REP" then
			Current, Max = self:GetReputation()
			local Colors = FACTION_BAR_COLORS
			local ID = (T.Retail and WatchedFaction and WatchedFaction.reaction) or select(2, GetWatchedFactionInfo())
			R, G, B = Colors[ID].r, Colors[ID].g, Colors[ID].b
		else
			Current, Max = self:GetExperience()
			R, G, B = unpack(self.XPColor)
		end

		Bar:SetMinMaxValues(0, Max)
		Bar:SetValue(Current)

		if (Bar.BarType == "XP" and IsRested == 1 and Rested) then
			RestedBar:Show()
			RestedBar:SetMinMaxValues(0, Max)
			RestedBar:SetValue(Rested + Current)
		else
			RestedBar:Hide()
		end

		Bar:SetStatusBarColor(R, G, B)
	end
end

function Experience:DisplayMenu()
	BarSelected = self
	Experience:VerifyMenu()
	EasyMenu(Experience.Menu, Menu, "cursor", 0, 0, "MENU")
end

function Experience:Create()
	for i = 1, self.NumBars do
		local XPBar = CreateFrame("StatusBar", "ViksUIExperienceBar" .. i, UIParent)
		local RestedBar = CreateFrame("StatusBar", nil, XPBar)
		local Data = ViksUISettingsPerChar
		XPBar:SetStatusBarTexture(barTex)
		XPBar:EnableMouse()
		XPBar:SetFrameStrata("MEDIUM")
		XPBar:SetFrameLevel(2)
		XPBar:CreateBackdrop()
		XPBar:SetScript("OnEnter", Experience.SetTooltip)
		XPBar:SetScript("OnLeave", HideTooltip)
		XPBar:SetScript("OnMouseUp", Experience.DisplayMenu)

		RestedBar:SetStatusBarTexture(barTex)
		RestedBar:SetFrameStrata("MEDIUM")
		RestedBar:SetStatusBarColor(unpack(self.RestedColor))
		RestedBar:SetAllPoints(XPBar)
		RestedBar:SetOrientation("HORIZONTAL")
		RestedBar:SetFrameLevel(XPBar:GetFrameLevel() - 1)
		RestedBar:SetAlpha(.5)
		RestedBar:SetReverseFill(i == 2 and true)
		if C.panels.NoPanels == true then
			XPBar:SetSize(i == 1 and (LEFTChatline:GetWidth()-4) or (RIGHTChatline:GetWidth()-4), 6)
			XPBar:Point("BOTTOMLEFT", i == 1 and LEFTChatline or RIGHTChatline, "TOPLEFT", 2, 6)
		else
			XPBar:SetSize(i == 1 and (LChat:GetWidth()-4) or (RChat:GetWidth()-4), 6)
			XPBar:Point("BOTTOMLEFT", i == 1 and LChatTab or RChatTab, "TOPLEFT", 2, 4)
		end
		XPBar.backdrop:SetFrameLevel(XPBar:GetFrameLevel() - 2)
		XPBar.backdrop:SetOutside()
		XPBar:SetReverseFill(i == 2 and true)
		-- Default settings
		if ViksUISettingsPerChar.experiencebar["ViksUIExperienceBar" .. i] ~= nil then
			XPBar.BarType = ViksUISettingsPerChar.experiencebar["ViksUIExperienceBar" .. i]
		else
			XPBar.BarType = (i == 1) and "XP" or "HONOR"
		end

		self["XPBar"..i] = XPBar
		self["RestedBar"..i] = RestedBar
	end

	self:RegisterEvent("PLAYER_XP_UPDATE")
	self:RegisterEvent("UPDATE_FACTION")
	self:RegisterEvent("PLAYER_LEVEL_UP")
	self:RegisterEvent("UPDATE_EXHAUSTION")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_UPDATE_RESTING")
	self:RegisterEvent("HONOR_XP_UPDATE")
	self:RegisterEvent("HONOR_LEVEL_UPDATE")
	self:RegisterEvent("AZERITE_ITEM_EXPERIENCE_CHANGED")
	self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
	self:RegisterEvent("PLAYER_MONEY")
	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
	self:RegisterEvent("ADDON_LOADED")

	self:SetScript("OnEvent", self.Update)
end

function Experience:Enable()
	if not ExperienceEnable then
		return
	end

	if not self.XPBar1 then
		self:Create()
	end

	for i = 1, self.NumBars do
		if not self["XPBar"..i]:IsShown() then
			self["XPBar"..i]:Show()
		end

		if not self["RestedBar"..i]:IsShown() then
			self["RestedBar"..i]:Show()
		end
	end
end

function Experience:Disable()
	for i = 1, self.NumBars do
		if self["XPBar"..i]:IsShown() then
			self["XPBar"..i]:Hide()
		end

		if self["RestedBar"..i]:IsShown() then
			self["RestedBar"..i]:Hide()
		end
	end
end

-- Force update after login
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
	Experience:Enable()
	Experience:Update()
end)

C.Experience = Experience