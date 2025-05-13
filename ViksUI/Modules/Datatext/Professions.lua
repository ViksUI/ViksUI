-- Professions.lua
local T, C, L = unpack(ViksUI)

-- Ensure the module is enabled
if not (C.datatext.Profession and C.datatext.Profession > 0) then
    return
end

-- Constants and Utilities
local GetProfessionInfo = _G["GetProfessionInfo"]
local GetProfessions = _G["GetProfessions"]
local C_TradeSkillUI = _G["C_TradeSkillUI"]
local GameTooltip = _G["GameTooltip"]
local Utils = {} -- Utility table for helper functions

-- Utility Functions
function Utils.ToggleTradeSkill(skillLineID)
    if C_TradeSkillUI.IsTradeSkillReady() or C_TradeSkillUI.IsTradeSkillLinked() then
        C_TradeSkillUI.CloseTradeSkill()
    else
        C_TradeSkillUI.OpenTradeSkill(skillLineID)
    end
end

function Utils.CacheProfession(professionID, professions)
    if not professionID then return end
    local name, texture, rank, maxRank = GetProfessionInfo(professionID)
	if not name then return end -- Skip invalid professions
    if name then
        professions[#professions + 1] = {
            name = name,
            texture = texture,
            rank = rank,
            maxRank = maxRank
        }
    end
end

function Utils.SortProfessions(professions)
    table.sort(professions, function(a, b) return a.name < b.name end)
end

function Utils.AddProfessionsToTooltip(professions)
    if #professions == 0 then return end
    Utils.SortProfessions(professions)

    for _, profession in ipairs(professions) do
        GameTooltip:AddDoubleLine(
            string.format("|T%s:12:12:1:0|t  %s", profession.texture, profession.name),
            string.format("%d / %d", profession.rank, profession.maxRank),
            1, 1, 1, 1, 1, 1
        )
    end
end

-- UI Setup
local function SetupStatFrame()
    local Stat = CreateFrame("Frame", "DataTextProfession", UIParent)
    Stat:EnableMouse(true)
    Stat:SetFrameStrata("BACKGROUND")
    Stat:SetFrameLevel(3)

    local Text = Stat:CreateFontString(nil, "OVERLAY")
    Stat.text = Text

    if C.datatext.Profession >= 9 then
        Text:SetTextColor(unpack(C.media.pxcolor1))
        Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
    else
        Text:SetTextColor(unpack(C.media.pxcolor1))
        Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
    end

    PP(C.datatext.Profession, Text)
    return Stat, Text
end

-- Event Handlers
local function OnEvent(self)
    self.text:SetText(TRADE_SKILLS) -- Tooltip holder
    self:SetAllPoints(self.text)
end

local function OnClick(self, button)
    local prof1, prof2, archy, fishing, cooking = GetProfessions()

    if button == "LeftButton" then
        if IsControlKeyDown() then
            ToggleProfessionsBook()
        elseif IsShiftKeyDown() and archy then
            Utils.ToggleTradeSkill(select(7, GetProfessionInfo(archy)))
        elseif prof1 then
            Utils.ToggleTradeSkill(select(7, GetProfessionInfo(prof1)))
        end
    elseif button == "RightButton" then
        if IsShiftKeyDown() and cooking then
            Utils.ToggleTradeSkill(select(7, GetProfessionInfo(cooking)))
        elseif IsControlKeyDown() and fishing then
            Utils.ToggleTradeSkill(select(7, GetProfessionInfo(fishing)))
        elseif prof2 then
            Utils.ToggleTradeSkill(select(7, GetProfessionInfo(prof2)))
        end
    end
end

local function OnEnter(self)
    local prof1, prof2, archy, fishing, cooking = GetProfessions()
    local professions = {}

    -- Cache professions
    Utils.CacheProfession(prof1, professions)
    Utils.CacheProfession(prof2, professions)
    Utils.CacheProfession(archy, professions)
    Utils.CacheProfession(fishing, professions)
    Utils.CacheProfession(cooking, professions)
    
	-- Tooltip setup
    GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6)
    GameTooltip:ClearLines()
    if #professions == 0 then
        -- Debug: No professions found
        print("No professions found")
        GameTooltip:AddLine("No professions available.", 1, 0.5, 0.5)
    else
        -- Add professions to tooltip
        Utils.AddProfessionsToTooltip(professions)
    end

    -- Add dynamic tooltips
    GameTooltip:AddLine(" ")
    if prof1 then
        GameTooltip:AddDoubleLine("Left Click:", string.format("Open %s", select(1, GetProfessionInfo(prof1))), 1, 1, 1, 1, 1, 0)
    end
    if prof2 then
        GameTooltip:AddDoubleLine("Right Click:", string.format("Open %s", select(1, GetProfessionInfo(prof2))), 1, 1, 1, 1, 1, 0)
    end
    if archy then
        GameTooltip:AddDoubleLine("Shift + Left Click:", "Open Archaeology", 1, 1, 1, 1, 1, 0)
    end
    if cooking then
        GameTooltip:AddDoubleLine("Shift + Right Click:", "Open Cooking", 1, 1, 1, 1, 1, 0)
    end
    if fishing then
        GameTooltip:AddDoubleLine("Control + Right Click:", "Open Fishing", 1, 1, 1, 1, 1, 0)
    end
    GameTooltip:AddDoubleLine("Control + Left Click:", "Open Professions Book", 1, 1, 1, 1, 1, 0)

    GameTooltip:Show()
end

local function OnLeave(self)
    GameTooltip:Hide()
end

-- Main Logic
local Stat, Text = SetupStatFrame()
Stat:SetScript("OnEvent", OnEvent)
Stat:SetScript("OnMouseDown", OnClick)
Stat:SetScript("OnEnter", OnEnter)
Stat:SetScript("OnLeave", OnLeave)
Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:RegisterEvent("CHAT_MSG_SKILL")
Stat:RegisterEvent("TRADE_SKILL_LIST_UPDATE")
Stat:RegisterEvent("TRADE_SKILL_DETAILS_UPDATE")