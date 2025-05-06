local T, C, L = unpack(ViksUI)

if C.misc.InfoPanel_Stats ~= true then return end

----------------------------------------------------------------------------------------
-- Stats Panel with info currently from Wowhead
----------------------------------------------------------------------------------------

-- Load InfoStats from the filter file
local InfoStats = InfoStats -- The table is now globally available because it was loaded via the .toc file
local ViksUI_StatTable = InfoStats

local ViksUI_STATS = CreateFrame("Frame", "ViksUI_STATS", UIParent)

-- Helper function to perform string replacements
local function ReplaceStatStrings(s)
    local replacements = {
        ["Agility"] = "AGI",
        ["Intellect"] = "INT",
        ["Critical Strike"] = "CRIT",
        ["Single Target:"] = "|cFFFFFF00ST:|r",
        ["Multiple Target:"] = "|cFFFFFF00AoE:|r",
        ["Item Level"] = "iLvL",
        ["Haste"] = "HAST",
        ["Versatility"] = "VERS",
        ["Mastery"] = "MAST",
        ["Strength"] = "STR",
        ["Myth+:"] = "|cFFFFFF00M+:|r",
        ["Raid:"] = "|cFFFFFF00Raid:|r",
        ["Weapon Damage"] = "WDMG",
    }

    for original, replacement in pairs(replacements) do
        s = gsub(s, original, replacement)
    end
    return s
end

-- Create the stats window
function ViksUI_STATS:CreateWin()
    if PaperDollFrame:IsVisible() then
        if not ViksUI_STATSwin then
            local f = CreateFrame("Frame", "ViksUI_STATSwin", ViksUI_STATS)
            f:SetParent(CharacterFrame)
            f:SetTemplate("Overlay")
            f:SetFrameStrata("TOOLTIP")
            f:ClearAllPoints()
            f:SetPoint("BOTTOMRIGHT", CharacterFrame, "TOPRIGHT", 0, 3)
            f:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 0, 30)

            local ft = f:CreateFontString(nil, "OVERLAY")
            ft:SetFont(C.media.pxfontHeader, C.media.pxfontHsize or 12)
            ft:ClearAllPoints()
            ft:SetAllPoints(f)
            ft:SetJustifyH("CENTER")
            ft:SetJustifyV("MIDDLE")
            ViksUI_STATStxt = ft

            f:Show()
        end
        return true
    end
    return false
end

-- Update the stats window with the player's current stats
function ViksUI_STATS:Update()
    if ViksUI_STATS:CreateWin() then
        local _, className = UnitClass("player")
        local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
        local classcolor = T.RGBToHex(unpack(C.media.border_color))
        local statcolor = T.RGBToHex(class.r, class.g, class.b)
        local sId, specName = GetSpecializationInfo(GetSpecialization())
		local specIndex = GetSpecialization()
		if specIndex == 5 or nil then
            ViksUI_STATStxt:SetText(classcolor .. "No Specialization Selected")
            ViksUI_STATS:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 0, 30)
            return
        end
        local s = ViksUI_StatTable[className .. "-" .. sId]
		
        if s then
            -- Perform string replacements
            s = ReplaceStatStrings(s)

            -- Update the stats text
            ViksUI_STATStxt:SetText(classcolor .. specName .. ": " .. statcolor .. s)

            -- Adjust the position based on the string length
            if strlen(s) > 70 then
                ViksUI_STATS:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 0, 48)
            else
                ViksUI_STATS:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 0, 30)
            end
        else
            -- Log a warning if no stats are found for the player's class and spec
            print("Warning: No stats found for", className, sId)
        end
    end
end

-- Event handling
local f = ViksUI_STATS
f:RegisterEvent("SPELLS_CHANGED")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, ...)
    ViksUI_STATS:Update()
    PaperDollFrame:HookScript("OnShow", function() ViksUI_STATS:Update() end)
    if event == "SPELLS_CHANGED" then
        ViksUI_STATS:Update()
    end
end)