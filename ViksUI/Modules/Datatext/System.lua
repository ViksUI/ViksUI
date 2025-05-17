local T, C, L = unpack(ViksUI)
--------------------------------------------------------------------
-- System Stats
--------------------------------------------------------------------
-- Exit early if system datatext is not enabled
if not C.datatext.System or C.datatext.System <= 0 then return end

-- Color definitions
local COLOR_GOOD = "|cff0CD809"
local COLOR_WARNING = "|cffE8DA0F"
local COLOR_BAD = "|cffD80909"
local COLOR_WHITE = "|cffffffff"
local COLOR_RESET = "|r"

-- Frame and Font Setup
local Stat = CreateFrame("Frame", "DataTextSystem", UIParent)
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)
Stat:EnableMouse(true)

local Text = Stat:CreateFontString(nil, "OVERLAY")
if C.datatext.Talents and C.datatext.Talents >= 9 then
    Text:SetTextColor(unpack(C.media.pxcolor1))
    Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
    Text:SetTextColor(unpack(C.media.pxcolor1))
    Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
PP(C.datatext.System, Text)

-- Helper function to format memory usage nicely
--- Formats memory in KiB/MiB with optional color.
-- @param memory (number) memory usage in KiB
-- @param color (boolean) whether to apply color
-- @return (string) formatted memory string
local function formatMem(memory, color)
    local statColor = color and { COLOR_WHITE, COLOR_RESET } or { "", "" }
    local mult = 10 ^ 1
    if memory > 999 then
        local mem = math.floor((memory / 1024) * mult + 0.5) / mult
        return mem .. (mem % 1 == 0 and string.format(".0 %sMib%s", unpack(statColor))
            or string.format(" %sMib%s", unpack(statColor)))
    else
        local mem = math.floor(memory * mult + 0.5) / mult
        return mem .. (mem % 1 == 0 and string.format(".0 %sKib%s", unpack(statColor))
            or string.format(" %sKib%s", unpack(statColor)))
    end
end

-- Caches for memory info
local TotalMemory, AddonMemoryTable, MemoryText

--- Refresh addon memory usage and update caches.
-- @param self (frame) reference to Stat frame
local function RefreshMem(self)
    if not AddonMemoryTable then AddonMemoryTable = {} end
    wipe(AddonMemoryTable)
    UpdateAddOnMemoryUsage()
    local Total = 0
    for i = 1, C_AddOns.GetNumAddOns() do
        local name = select(2, C_AddOns.GetAddOnInfo(i))
        local Mem = GetAddOnMemoryUsage(i)
        AddonMemoryTable[i] = { name, Mem, C_AddOns.IsAddOnLoaded(i) }
        Total = Total + Mem
    end

    TotalMemory = Total
    MEMORY_TEXT = formatMem(Total, true)
    table.sort(AddonMemoryTable, function(a, b)
        if a and b then
            return a[2] > b[2]
        end
    end)
    self:SetAllPoints(Text)
end

-- Timers for update throttling
local memoryUpdateInterval, displayUpdateInterval = 10, 1

--- Updates the displayed framerate, latency, and memory.
-- @param self (frame)
-- @param elapsed (number) time since last update
local function Update(self, elapsed)
    memoryUpdateInterval = memoryUpdateInterval - elapsed
    displayUpdateInterval = displayUpdateInterval - elapsed

    -- Only update memory stats every 10s if fps_ms is false
    if C.datatext.fps_ms == false and memoryUpdateInterval < 0 then
        RefreshMem(self)
        memoryUpdateInterval = 10
    end

    if displayUpdateInterval < 0 then
        local framerate = math.floor(GetFramerate())
        local _, _, _, latencyWorld = GetNetStats()
        local latencyColor = latencyWorld < 300 and COLOR_GOOD or (latencyWorld < 500 and COLOR_WARNING or COLOR_BAD)
        local fpsColor = framerate >= 30 and COLOR_GOOD or (framerate > 15 and COLOR_WARNING or COLOR_BAD)

        if C.datatext.fps_ms == false then
            Text:SetText(string.format("%s%d%sfps %s%d%sms %s%smb", fpsColor, framerate, COLOR_RESET, latencyColor, latencyWorld, COLOR_RESET, fpsColor, formatMem(TotalMemory)))
        else
            Text:SetText(string.format("%s%d%sfps %s%d%sms", fpsColor, framerate, COLOR_RESET, latencyColor, latencyWorld, COLOR_RESET))
        end
        displayUpdateInterval = 0.8
    end
end

-- Tooltip helper
local function ShowSystemTooltip(self)
    if InCombatLockdown() then return end
    local _, _, latencyHome, latencyWorld = GetNetStats()

    GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
    GameTooltip:ClearAllPoints()
    GameTooltip:SetPoint("CENTER", self, "CENTER", 0, 0)
    GameTooltip:ClearLines()

    local latencyString = format(MAINMENUBAR_LATENCY_LABEL, latencyHome, latencyWorld)
    GameTooltip:AddLine(COLOR_GOOD .. latencyString .. COLOR_RESET)
    GameTooltip:AddLine(" ")
    if C.datatext.fps_ms == false then
        GameTooltip:AddDoubleLine("Total Memory Usage:", formatMem(TotalMemory) .. COLOR_RESET, 0, 0.6, 1, 1, 1, 1)
        GameTooltip:AddLine(" ")
        for i = 1, #AddonMemoryTable do
            local addon = AddonMemoryTable[i]
            if addon and addon[3] then -- Is loaded
                local red = addon[2] / TotalMemory * 2
                local green = 1 - red
                GameTooltip:AddDoubleLine(addon[1], formatMem(addon[2], false), 1, 1, 1, red, green + 1, 0)
            end
        end
    end
    GameTooltip:AddLine("Click to collect garbage and reset CPU usage")
    GameTooltip:Show()
end

-- Mouse and update scripts
Stat:SetScript("OnMouseDown", function()
    collectgarbage('collect')
    ResetCPUUsage()
end)

Stat:SetScript("OnEnter", ShowSystemTooltip)
Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
Stat:SetScript("OnUpdate", Update)
Update(Stat, 20) -- Initial update