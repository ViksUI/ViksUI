local T, C, L = unpack(ViksUI)
if C.loot.faster_loot ~= true then return end

----------------------------------------------------------------------------------------
--	Faster auto looting
----------------------------------------------------------------------------------------
local addonName, addonTable = ...

local majorVersion = select(4, GetBuildInfo())

local tDelay = 0
local LOOT_DELAY = 0.3

local IsBagFull

if majorVersion >= 10 then
    IsBagFull = function()
        for bag = 0, 4 do
            local numSlots = C_Container.GetContainerNumSlots(bag)
            for slot = 1, numSlots do
                if not C_Container.GetContainerItemInfo(bag, slot) then
                    return false
                end
            end
        end
        return true
    end
else
    IsBagFull = function()
        for bag = 0, 4 do
            for slot = 1, GetContainerNumSlots(bag) do
                if not GetContainerItemID(bag, slot) then
                    return false
                end
            end
        end
        return true
    end
end

local EventFrame = CreateFrame('Frame')

local function OnEvent(self, event, ...)
    if event == 'ADDON_LOADED' then
        local name = ...
        if name == addonName then
            if not GetCVarBool("autoLootDefault") then
                SetCVar("autoLootDefault", "1")
                print("Auto loot has been enabled.")
            end
            self:UnregisterEvent('ADDON_LOADED')
        end
    elseif event == 'LOOT_OPENED' or event == 'LOOT_READY' then
        if GetCVarBool("autoLootDefault") and (GetTime() - tDelay) >= LOOT_DELAY then
            for i = GetNumLootItems(), 1, -1 do
                if LootSlotHasItem(i) then
                    LootSlot(i)
                end
            end
            tDelay = GetTime()

            if event == 'LOOT_OPENED' and not IsBagFull() then
                LootFrame:Hide()
            end
        end
    end
end

EventFrame:RegisterEvent('ADDON_LOADED')
EventFrame:RegisterEvent('LOOT_OPENED')
EventFrame:RegisterEvent('LOOT_READY')
EventFrame:SetScript('OnEvent', OnEvent)