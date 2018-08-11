local T, C, L, _ = unpack(select(2, ...))
if C.XPBar.enable ~= true then return end

local ExperienceEnable = true
local Experience = CreateFrame("Frame", nil, UIParent)
local HideTooltip = GameTooltip_Hide
local Panels = CreateFrame("Frame")
local Bars = 20
local barTex = C.media.texture

Experience.NumBars = 2
Experience.RestedColor = {75 / 255, 175 / 255, 76 / 255}
Experience.XPColor = {0 / 255, 144 / 255, 255 / 255}
Experience.AZColor = {229 / 255, 204 / 255, 127 / 255}
Experience.HNColor = {222 / 255, 22 / 255, 22 / 255}

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

		if Max == 0 then
			return
		end

		GameTooltip:AddLine("|cff0090FF"..XP..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "% - " .. floor(Bars - (Bars * (Max - Current) / Max)) .. "/" .. Bars .. ")|r")

		if (IsRested == 1 and Rested) then
			GameTooltip:AddLine("|cff4BAF4C"..TUTORIAL_TITLE26..": +" .. Rested .." (" .. floor(Rested / Max * 100) .. "%)|r")
		end
	elseif BarType == "AZERITE" then
		Current, Max, Level, Items = Experience:GetAzerite()
		
		if Max == 0 then
			return
		end
		
		local RemainingXP = Max - Current
		local AzeriteItem = Item:CreateFromItemLocation(Items)
		local ItemName = AzeriteItem:GetItemName()

		GameTooltip:AddDoubleLine(ItemName..' ('..Level..')', format(ISLANDS_QUEUE_WEEKLY_QUEST_PROGRESS, Current, Max), 0.90, 0.80, 0.50)
		GameTooltip:AddLine(' ')
		GameTooltip:AddLine(AZERITE_POWER_TOOLTIP_BODY:format(ItemName))

		GameTooltip:Show()
	else
		local Level = UnitHonorLevel("player")

		Current, Max = Experience:GetHonor()

		if Max == 0 then
			GameTooltip:AddLine(PVP_HONOR_PRESTIGE_AVAILABLE)
			GameTooltip:AddLine(PVP_HONOR_XP_BAR_CANNOT_PRESTIGE_HERE)
		else
			GameTooltip:AddLine("|cffee2222"..HONOR..": " .. Current .. " / " .. Max .. " (" .. floor(Current / Max * 100) .. "% - " .. floor(Bars - (Bars * (Max - Current) / Max)) .. "/" .. Bars .. ")|r")
			GameTooltip:AddLine("|cffcccccc"..RANK..": " .. Level .. "|r")
		end
	end

	GameTooltip:Show()
end

function Experience:GetExperience()
	return UnitXP("player"), UnitXPMax("player")
end

function Experience:GetAzerite()
	local AzeriteItems = C_AzeriteItem.FindActiveAzeriteItem()
	local XP, TotalXP = C_AzeriteItem.GetAzeriteItemXPInfo(AzeriteItems)
	local Level = C_AzeriteItem.GetPowerLevel(AzeriteItems)

	return XP, TotalXP, Level, AzeriteItems
end

function Experience:GetHonor()
	return UnitHonor("player"), UnitHonorMax("player")
end

function Experience:Update(event, owner)
	if (event == "UNIT_INVENTORY_CHANGED" and owner ~= "player") then
		return
	end

	local AzeriteItem = C_AzeriteItem.FindActiveAzeriteItem()
	local PlayerLevel = UnitLevel("player")

	local Current, Max = self:GetExperience()
	local Rested = GetXPExhaustion()
	local IsRested = GetRestState()

	for i = 1, self.NumBars do
		local Bar = self["XPBar"..i]
		local RestedBar = self["RestedBar"..i]
		local r, g, b
		local InstanceType = select(2, IsInInstance())

		Bar.BarType = "XP"

		if (i == 1 and PlayerLevel == MAX_PLAYER_LEVEL) then
			Current, Max = self:GetHonor()

			Bar.BarType = "HONOR"
		elseif (i == 2) then
			if AzeriteItem and InstanceType ~= "pvp" and InstanceType ~= "arena" then
				Current, Max = self:GetAzerite()

				Bar.BarType = "AZERITE"
			else
				Current, Max = self:GetHonor()

				Bar.BarType = "HONOR"
			end
		end

		local BarType = Bar.BarType

		Bar:SetMinMaxValues(0, Max)
		Bar:SetValue(Current)

		if (BarType == "XP" and IsRested == 1 and Rested) then
			RestedBar:Show()
			RestedBar:SetMinMaxValues(0, Max)
			RestedBar:SetValue(Rested + Current)
		else
			RestedBar:Hide()
		end

		if BarType == "XP" then
			r, g, b = unpack(self.XPColor)
		elseif BarType == "AZERITE" then
			r, g, b = unpack(self.AZColor)
		else
			r, g, b = unpack(self.HNColor)
		end

		Bar:SetStatusBarColor(r, g, b)
	end
end

function Experience:Create()
	for i = 1, self.NumBars do
		local XPBar = CreateFrame("StatusBar", nil, UIParent)
		local RestedBar = CreateFrame("StatusBar", nil, XPBar)

		XPBar:SetStatusBarTexture(barTex)
		XPBar:EnableMouse()
		XPBar:SetFrameStrata("MEDIUM")
		XPBar:SetFrameLevel(2)
		XPBar:CreateBackdrop()
		XPBar:SetScript("OnEnter", Experience.SetTooltip)
		XPBar:SetScript("OnLeave", HideTooltip)

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
		XPBar:SetReverseFill(i == 2 and true)
		
		self["XPBar"..i] = XPBar
		self["RestedBar"..i] = RestedBar
	end

	self:RegisterEvent("PLAYER_XP_UPDATE")
	self:RegisterEvent("PLAYER_LEVEL_UP")
	self:RegisterEvent("UPDATE_EXHAUSTION")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_UPDATE_RESTING")
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:RegisterEvent("HONOR_XP_UPDATE")
	self:RegisterEvent("HONOR_LEVEL_UPDATE")
	self:RegisterEvent("AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED")
	self:RegisterEvent("RESPEC_AZERITE_EMPOWERED_ITEM_CLOSED")
	self:RegisterEvent("PLAYER_MONEY")

	self:SetScript("OnEvent", self.Update)
end

function Experience:Enable()
	if not ExperienceEnable then
		return
	end
	
	if not self.IsCreated then
		self:Create()

		self.IsCreated = true
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
Experience:Enable()
C.Experience = Experience
