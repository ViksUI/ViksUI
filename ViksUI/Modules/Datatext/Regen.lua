local T, C, L = unpack(ViksUI)

if not C.datatext.Regen or C.datatext.Regen <= 0 then 
    return 
end

local _, class = UnitClass("player")
local classcolor = RAID_CLASS_COLORS[class]
local qColor = ("|cff%.2x%.2x%.2x"):format(classcolor.r * 255, classcolor.g * 255, classcolor.b * 255)
local qColor2 = ("|cff%.2x%.2x%.2x"):format(unpack(C.media.border_color, 1, 3)) or "|cff006bb3"

local Stat = CreateFrame("Frame", "DataTextRegen", UIParent)
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)

local Text = Stat:CreateFontString(nil, "OVERLAY")
if C.datatext.Regen >= 6 then
    Text:SetTextColor(unpack(C.media.pxcolor1))
    Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
    Text:SetTextColor(unpack(C.media.pxcolor1))
    Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
PP(C.datatext.Regen, Text)

local updateTimer = 0
local lastValidValue = ""
local lastValidText = ""

local function IsInMythicPlus()
    local _, _, _, _, _, _, _, instanceType = GetInstanceInfo()
    return instanceType == "party" and IsInGroup() and not IsInRaid()
end

local function GetSafeRegen()
    if IsInMythicPlus() then
        return lastValidValue ~= "" and lastValidValue or "N/A"
    end
    
    local success, baseMana, castingMana = pcall(GetManaRegen)
    
    if not success then
        return "N/A"
    end
    
    if InCombatLockdown() then
        if type(castingMana) == "number" and castingMana > 0 then
            return floor(castingMana * 5)
        end
    else
        if type(baseMana) == "number" and baseMana > 0 then
            return floor(baseMana * 5)
        end
    end
    
    return "N/A"
end

local function UpdateRegen()
    if IsInMythicPlus() then
        if lastValidText ~= "" then
            Text:SetText(lastValidText)
        end
        return
    end
    
    local regenValue = GetSafeRegen()
    if regenValue ~= lastValidValue then
        if C.datatext.Regen >= 6 then
            lastValidText = "|cffFFFFFF"..regenValue..qColor2.." "..MANA_REGEN_ABBR
        else
            lastValidText = qColor..regenValue..qColor2.." "..MANA_REGEN_ABBR
        end
        Text:SetText(lastValidText)
        lastValidValue = regenValue
    end
end

Stat:SetScript("OnUpdate", function(self, elapsed)
    updateTimer = updateTimer + elapsed
    if updateTimer >= 0.5 then
        updateTimer = 0
        UpdateRegen()
    end
end)

Stat:RegisterEvent("PLAYER_REGEN_ENABLED")
Stat:RegisterEvent("PLAYER_REGEN_DISABLED")
Stat:RegisterEvent("UNIT_POWER_UPDATE")
Stat:RegisterEvent("ZONE_CHANGED_NEW_AREA")
Stat:RegisterEvent("ZONE_CHANGED")
Stat:SetScript("OnEvent", function(self, event)
    if event == "ZONE_CHANGED_NEW_AREA" or event == "ZONE_CHANGED" then
        UpdateRegen()
    elseif event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_REGEN_DISABLED" then
        UpdateRegen()
    elseif event == "UNIT_POWER_UPDATE" and arg1 == "player" then
        UpdateRegen()
    end
end)

UpdateRegen()