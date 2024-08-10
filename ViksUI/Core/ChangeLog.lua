local T, C, L = unpack(ViksUI)

local ChangeLog = CreateFrame("frame")
local ChangeLogData = {
"Changes:",
	"Update 11.12 for Wow 11 TWW ",
	"• Skinned Spellbook",
	"• Updated font file/added symbols",
	"• Statspanel above char frame enabled/updated (wowhead)",
	"• Debuff tracking for Tww Dungeons and Raid added",
	"• Actionbars updated",
	"• Bigger restyling of Objective Frame",
	"• ^ Restyling in /config under Quest",
	"• ^ Quest title color changes if not trivial difficulty",
	"• ^ Added quality color for world quest for rare/epic",
	"• ^ Ctrl+Click to abandon a quest or Alt+Click to share a quest",
	"• ^ Ctrl+Click to expand all Headers or Alt+Click to Collapse all header",
	"• ^ Click to expand/collapse a header",
	"• Check Github for full changelog",

" ",
"EXTRA:",
"Added Wow gift button and buymeacoffee button here on /changelog",
"Patreon helps me keep subscription while not playing",
	"",
"PATREON's: Wiggy and nAyu",
"But thanks to all who have used the addon and those supported my work",

}

--// TODO LIST
-- Make a global function for Cords

local function ModifiedString(string)
	local count = string.find(string, ":")
	local newString = string
	
	if count then
		local prefix = string.sub(string, 0, count)
		local suffix = string.sub(string, count + 1)
		local subHeader = string.find(string, "•")
		
		if subHeader then newString = tostring("|cFFFFFF00".. prefix .. "|r" .. suffix) else newString = tostring("|cffC41F3B" .. prefix .. "|r" .. suffix) end
	end

	for pattern in gmatch(string, "('.*')") do newString = newString:gsub(pattern, "|cFFFF8800" .. pattern:gsub("'", "") .. "|r") end
	return newString
end

local function GetChangeLogInfo(i)
	for line, info in pairs(ChangeLogData) do
		if line == i then return info end
	end
end

_G.StaticPopupDialogs["WoW_Gift"] = {
	text = "Send me a Gift in WoW. My BTag is:",
	button1 = OKAY,
	timeout = 0,
	whileDead = true,
	hasEditBox = true,
	editBoxWidth = 325,
	OnShow = function(self, ...) 
		self.editBox:SetFocus()
		self.editBox:SetText("VikingPower#2226")
		self.editBox:HighlightText()
	end,
	EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
}

_G.StaticPopupDialogs["BuyCoffee"] = {
	text = "Help pay subscription to wow",
	button1 = OKAY,
	timeout = 0,
	whileDead = true,
	hasEditBox = true,
	editBoxWidth = 325,
	OnShow = function(self, ...) 
		self.editBox:SetFocus()
		self.editBox:SetText("https://www.buymeacoffee.com/ViksUI")
		self.editBox:HighlightText()
	end,
	EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
}

_G.StaticPopupDialogs["DISCORD"] = {
	text = "Discord channel to ViksUI",
	button1 = OKAY,
	timeout = 0,
	whileDead = true,
	hasEditBox = true,
	editBoxWidth = 325,
	OnShow = function(self, ...) 
		self.editBox:SetFocus()
		self.editBox:SetText("https://discord.gg/pDEnZSV")
		self.editBox:HighlightText()
	end,
	EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
}

_G.StaticPopupDialogs["DONATE"] = {
	text = "Support my work by donating on Paypal",
	button1 = OKAY,
	timeout = 0,
	whileDead = true,
	hasEditBox = true,
	editBoxWidth = 325,
	OnShow = function(self, ...) 
		self.editBox:SetFocus()
		self.editBox:SetText("https://www.paypal.me/Tryllemann")
		self.editBox:HighlightText()
	end,
	EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
}

_G.StaticPopupDialogs["PATRON"] = {
	text = "Support my work on Patreon",
	button1 = OKAY,
	timeout = 0,
	whileDead = true,
	hasEditBox = true,
	editBoxWidth = 325,
	OnShow = function(self, ...) 
		self.editBox:SetFocus()
		self.editBox:SetText("https://www.patreon.com/user?u=9534738")
		self.editBox:HighlightText()
	end,
	EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
}

function ChangeLog:CreateChangelog()
	local frame = CreateFrame("Frame", "ViksUIChangeLog", UIParent)
	frame:SetPoint("TOP",0,-50)
	frame:SetSize(445, 550)
	frame:SetTemplate("Transparent")
	frame:SetFrameLevel(4)
	
	local icon = CreateFrame("Frame", nil, frame)
	icon:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 0, 3)
	icon:SetSize(20, 20)
	icon:SetTemplate("Transparent")
	icon.bg = icon:CreateTexture(nil, "ARTWORK")
	icon.bg:SetPoint("TOPLEFT", 2, -2)
	icon.bg:SetPoint("BOTTOMRIGHT", -2, 2)
	icon.bg:SetTexture([[Interface\AddOns\ViksUI\Media\Textures\viksicon.blp]])
	
	local title = CreateFrame("Frame", nil, frame)
	title:SetPoint("LEFT", icon, "RIGHT", 3, 0)
	title:SetSize(422, 20)
	title:SetTemplate("Transparent")
	title.text = title:CreateFontString(nil, "OVERLAY")
	title.text:SetPoint("CENTER", title, 0, -1)
	title.text:SetFont(C["media"].normal_font, 15)
	title.text:SetText("|cffC41F3BViksUI|r - ChangeLog " .. T.version)
	
	T["CreateBtn"]("close", frame, 65, 19, "Close Changelog", "Close", frame)
	close:SetPoint("BOTTOMRIGHT", frame, -5, 5)
	close:SetScript("OnClick", function(self) frame:Hide() end)
	
	T["CreateBtn"]("bReport", frame, 65, 19, "Send me a gift on wow", "WoW Gift", frame)
	bReport:SetPoint("BOTTOMLEFT", frame, 5, 5)
	bReport:SetScript("OnClick", function(self) StaticPopup_Show("WoW_Gift") end)
	
	T["CreateBtn"]("bTwitch", frame, 65, 19, "Help pay wow Sub", "BuyCoffee", frame)
	bTwitch:SetPoint("BOTTOMLEFT", bReport, "BOTTOMRIGHT", 5, 0)
	bTwitch:SetScript("OnClick", function(self) StaticPopup_Show("BuyCoffee") end)
	
	T["CreateBtn"]("bDiscord", frame, 65, 19, "Discord", "Discord", frame)
	bDiscord:SetPoint("BOTTOMLEFT", bTwitch, "BOTTOMRIGHT", 5, 0)
	bDiscord:SetScript("OnClick", function(self) StaticPopup_Show("DISCORD") end)
	
	T["CreateBtn"]("bDonate", frame, 65, 19, "Donate", "Donate", frame)
	bDonate:SetPoint("BOTTOMLEFT", bDiscord, "BOTTOMRIGHT", 5, 0)
	bDonate:SetScript("OnClick", function(self) StaticPopup_Show("DONATE") end)
	
	T["CreateBtn"]("bPatreon", frame, 65, 19, "Patreon", "Patreon", frame)
	bPatreon:SetPoint("BOTTOMLEFT", bDonate, "BOTTOMRIGHT", 5, 0)
	bPatreon:SetScript("OnClick", function(self) StaticPopup_Show("PATRON") end)
	
	local offset = 4
	for i = 1, #ChangeLogData do
		local button = CreateFrame("Frame", "Button"..i, frame)
		button:SetSize(375, 16)
		button:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -offset)
		
		if i <= #ChangeLogData then
			local string = ModifiedString(GetChangeLogInfo(i))
			
			button.Text = button:CreateFontString(nil, "OVERLAY")
			button.Text:SetFont(C["media"].normal_font, 11)
			button.Text:SetText(string)
			button.Text:SetPoint("LEFT", 0, 0)
		end
		offset = offset + 16
	end
end

function ViksUI_ToggleChangeLog()
	ChangeLog:CreateChangelog()
end

if ViksUISettingsPerChar == nil then ViksUISettingsPerChar = {} end

function ChangeLog:OnCheckVersion(self)
	if ViksUISettingsPerChar.Install and ViksUISettings["version"] ~= T.version then
		ViksUISettings["version"] = T.version
		ChangeLog:CreateChangelog()
	end
end

ChangeLog:RegisterEvent("ADDON_LOADED")
ChangeLog:RegisterEvent("PLAYER_ENTERING_WORLD")
ChangeLog:SetScript("OnEvent", function(self, event, ...)
	if ViksUISettings == nil then ViksUISettings = {} end
	ChangeLog:OnCheckVersion()
end)

SLASH_CHANGELOG1 = "/changelog"
SlashCmdList.CHANGELOG = function() ViksUI_ToggleChangeLog() end
