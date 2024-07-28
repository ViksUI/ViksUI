local T, C, L = unpack(ViksUI)

if C.datatext.Profession and C.datatext.Profession > 0 then

local GetProfessionName = _G["GetProfessionName"]
local GetProfessionInfo = _G["GetProfessionInfo"]
local GetProfessions = _G["GetProfessions"]
local IsShiftKeyDown = _G["IsShiftKeyDown"]
local CastSpellByName = _G["CastSpellByName"]

local format = string.format
local join = string.join

local lastPanel
local profValues = {}
local displayString = ""
local tooltipString = ""

local function GetProfessionName(index)
	if not index then return end
	local name, texture, rank, maxRank, _, _, _, _, _, _, currentLevelName = GetProfessionInfo(index)
	return name
end

local Stat = CreateFrame("Frame", "DataTextProfession", UIParent)

Stat:EnableMouse(true)
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)

local Text  = Stat:CreateFontString(nil, "OVERLAY")

if C.datatext.Profession >= 9 then
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end

PP(C.datatext.Profession, Text)
	
local function OnEvent(self, event, ...)
	local prof1, prof2, archy, fishing, cooking = GetProfessions()
	lastPanel = self
	if prof == "prof1" then
		
		if prof1 ~= nil then
			local name, _, rank, maxRank, _, _, _, _ = GetProfessionInfo(prof1)
			self.text:SetFormattedText(displayString, name, rank, maxRank)
		else
			self.text:SetText("No Profession")
		end
	
	elseif prof == "prof2" then
	
		if prof2 ~= nil then
			local name, _, rank, maxRank, _, _, _, _ = GetProfessionInfo(prof2)
			self.text:SetFormattedText(displayString, name, rank, maxRank)
		else
			self.text:SetText("No Profession")
		end
	
	elseif prof == "archy" then
	
		if archy ~= nil then
			local name, _, rank, maxRank, _, _, _, _ = GetProfessionInfo(archy)
			self.text:SetFormattedText(displayString, name, rank, maxRank)
		else
			self.text:SetText("No Profession")
		end
	
	elseif prof == "fishing" then
	
		if fishing ~= nil then
			local name, _, rank, maxRank, _, _, _, _ = GetProfessionInfo(fishing)
			self.text:SetFormattedText(displayString, name, rank, maxRank)
		else
			self.text:SetText("No Profession")
		end
	
	elseif prof == "cooking" then
	
		if cooking ~= nil then
			local name, _, rank, maxRank, _, _, _, _ = GetProfessionInfo(cooking)
			self.text:SetFormattedText(displayString, name, rank, maxRank)
		else
			self.text:SetText("No Profession")
		end
	
	end
end

local function Click(self, button)
	local prof1, prof2, archy, _, cooking = GetProfessions()
	if button == "LeftButton" then
		if IsShiftKeyDown() and archy ~= nil then
		local name, _, _, _, _, _, _, _ = GetProfessionInfo(IsShiftKeyDown() and archy)
		CastSpellByName(name == "Mining" and "Smelting" or name)
		elseif prof1 == nil then return end
		ToggleProfessionsBook()
	elseif button == "RightButton" then
		if IsShiftKeyDown() and cooking == nil then return
		elseif not IsShiftKeyDown() and prof2 == nil then return end
		local name, _, _, _, _, _, _, _ = GetProfessionInfo(IsShiftKeyDown() and cooking or prof2)
		CastSpellByName(name == "Mining" and "Smelting" or name)
	end
end

local function OnEvent(self)
	Text:SetText(TRADE_SKILLS)
	self:SetAllPoints(Text)
	self:SetScript("OnEnter", function()
	
	local prof1, prof2, archy, fishing, cooking = GetProfessions()
	local professions = {}
	
	if prof1 ~= nil then
		local name, texture, rank, maxRank, _, _, _, _ = GetProfessionInfo(prof1)
		professions[#professions + 1] = {
			name	= name,
			texture	= ("|T%s:12:12:1:0|t"):format(texture),
			rank	= rank,
			maxRank	= maxRank
		}
	end
	
	if prof2 ~= nil then
		local name, texture, rank, maxRank, _, _, _, _ = GetProfessionInfo(prof2)
		professions[#professions + 1] = {
			name	= name,
			texture	= ("|T%s:12:12:1:0|t"):format(texture),
			rank	= rank,
			maxRank	= maxRank
		}
	end
	
	if archy ~= nil then
		local name, texture, rank, maxRank, _, _, _, _ = GetProfessionInfo(archy)
		professions[#professions + 1] = {
			name	= name,
			texture	= ("|T%s:12:12:1:0|t"):format(texture),
			rank	= rank,
			maxRank	= maxRank
		}
	end
	
	if fishing ~= nil then
		local name, texture, rank, maxRank, _, _, _, _ = GetProfessionInfo(fishing)
		professions[#professions + 1] = {
			name	= name,
			texture	= ("|T%s:12:12:1:0|t"):format(texture),
			rank	= rank,
			maxRank	= maxRank
		}
	end
	
	if cooking ~= nil then
		local name, texture, rank, maxRank, _, _, _, _ = GetProfessionInfo(cooking)
		professions[#professions + 1] = {
			name	= name,
			texture	= ("|T%s:12:12:1:0|t"):format(texture),
			rank	= rank,
			maxRank	= maxRank
		}
	end
	
	if #professions == 0 then return end	
	sort(professions, function(a, b) return a["name"] < b["name"] end)
	GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6);
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
	GameTooltip:ClearLines()	

	for i = 1, #professions do
		GameTooltip:AddDoubleLine(join("", professions[i].texture, "  ", professions[i].name), join("", professions[i].rank, " / ", professions[i].rank), 1, 1, 1, 1, 1, 1)
	end
	
	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine("Left Click:", "Open Profession page", 1, 1, 1, 1, 1, 0)
	GameTooltip:AddDoubleLine("Right Click:", "Open " .. GetProfessionName(prof2), 1, 1, 1, 1, 1, 0)
	GameTooltip:AddDoubleLine("Shift + Left Click:", "Open Archaeology", 1, 1, 1, 1, 1, 0)
	GameTooltip:AddDoubleLine("Shift + Right Click:", "Open Cooking", 1, 1, 1, 1, 1, 0)
	
	GameTooltip:Show()
	end)
	self:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:RegisterEvent("CHAT_MSG_SKILL")
Stat:RegisterEvent("TRADE_SKILL_LIST_UPDATE")
Stat:RegisterEvent("TRADE_SKILL_DETAILS_UPDATE")
Stat:SetScript("OnEvent", OnEvent)
Stat:SetScript("OnMouseDown", Click)


C["profdt"] = {
	["prof"] = "prof1",
	["hint"] = true,
}
end
