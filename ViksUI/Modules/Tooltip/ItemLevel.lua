local T, C, L = unpack(ViksUI)
if C.tooltip.enable ~= true or C.tooltip.average_lvl ~= true then return end

----------------------------------------------------------------------------------------
--	Equipped average item level(AverageItemLevel by Semlar)
----------------------------------------------------------------------------------------
local F, Events = CreateFrame("frame"), {}

local function Raise(_, event, ...)
	if Events[event] then
		for module in pairs(Events[event]) do
			module[event](module, ...)
		end
	end
end

local function RegisterEvent(module, event, func)
	if func then
		rawset(module, event, func)
	end
	if not Events[event] then
		Events[event] = {}
	end
	Events[event][module] = true
	if strmatch(event, "^[%u_]+$") then
		pcall(function() return F:RegisterEvent(event) end)
	end
	return module
end

local function UnregisterEvent(module, event)
	if Events[event] then
		Events[event][module] = nil
		if not next(Events[event]) and strmatch(event, "^[%u_]+$") then
			F:UnregisterEvent(event)
		end
	end
	return module
end

local Module = {
	__newindex = RegisterEvent,
	__call = Raise,
	__index = {
		RegisterEvent = RegisterEvent,
		UnregisterEvent = UnregisterEvent,
		Raise = Raise,
	},
}

T.Eve = setmetatable({}, {
	__call = function(eve)
		local module = setmetatable({}, Module)
		eve[ #eve + 1 ] = module
		return module
	end,
})

F:SetScript("OnEvent", Raise)

local E = T:Eve()

local CACHE_TIMEOUT = 5
local GuidCache = {}
local ActiveGUID
local ScannedGUID
local INSPECT_TIMEOUT = 1.5

local function ColorDiff(p, t)
	local diff = t - p
	local r, g, b
	if diff >= 10 then
		r, g, b = 1, 0.1, 0.1
	elseif diff >= 5 then
		r, g, b = 1, 0.5, 0.25
	elseif diff >= -5 then
		r, g, b = 1, 1, 0
	elseif diff >= -10 then
		r, g, b = 0.25, 0.75, 0.25
	else
		r, g, b = 0.7, 0.7, 0.7
	end
	return r, g, b
end

local ItemLevelPattern1 = ITEM_LEVEL:gsub("%%d", "(%%d+)")
local ItemLevelPattern2 = ITEM_LEVEL_ALT:gsub("([()])", "%%%1"):gsub("%%d", "(%%d+)")

local TwoHanders = {
	["INVTYPE_RANGED"] = true,
	["INVTYPE_RANGEDRIGHT"] = true,
	["INVTYPE_2HWEAPON"] = true,
}

local InventorySlots = {}
for i = 1, 17 do
	if i ~= 4 then -- ignore shirt, tabard is 19
		tinsert(InventorySlots, i)
	end
end

local function IsArtifact(itemLink)
	return itemLink:find("|cffe6cc80") -- this is probably a horrible way to find whether it"s an artifact
end

local function IsCached(itemLink) -- we can"t get the correct level of an artifact until all of its relics have been cached
	local cached = true
	-- local _, itemID, _, relic1, relic2, relic3 = strsplit(":", itemLink)
	local itemID, _, relic1, relic2, relic3 = itemLink:match("item:(%d+)")

	if not C_Item.GetDetailedItemLevelInfo(itemID) then cached = false end
	if IsArtifact(itemLink) then
		if relic1 and relic1 ~= "" and not C_Item.GetDetailedItemLevelInfo(relic1) then cached = false end
		if relic2 and relic2 ~= "" and not C_Item.GetDetailedItemLevelInfo(relic2) then cached = false end
		if relic3 and relic3 ~= "" and not C_Item.GetDetailedItemLevelInfo(relic3) then cached = false end
	end

	return cached
end

local Sekret = "|Hilvl|h"
local function AddLine(sekret, leftText, rightText, prefixColor, detailColor, dontShow)
	leftText = sekret..leftText
	for i = 2, GameTooltip:NumLines() do
		local line = _G["GameTooltipTextLeft"..i]
		local text = line and line:IsShown() and line:GetText()
		if text and text:find(sekret) then
			line:SetText(prefixColor..leftText..detailColor..rightText)
			GameTooltip:Show()
			return
		end
	end
	if not dontShow or GameTooltip:IsShown() then
		GameTooltip:AddLine(prefixColor..leftText..detailColor..rightText)
		GameTooltip:Show()
	end
end

local SlotCache = {} -- [slot] = itemLevel or false
local ItemCache = {} -- [slot] = itemLink
local TestTips = {}
for _, slot in pairs(InventorySlots) do
	local tip = CreateFrame("GameTooltip", "AverageItemLevelTooltip"..slot, nil, "GameTooltipTemplate")
	tip:SetOwner(WorldFrame, "ANCHOR_NONE")
	TestTips[slot] = tip
	tip.slot = slot
end

local function OnTooltipSetItem(self)
	-- if self ~= GameTooltip then return end

	local slot = self.slot
	if(not slot) then
		return
	end
	local _, itemLink = self:GetItem()
	local tipName = self:GetName()
	if self.itemLink then
		itemLink = self.itemLink
	end
	if itemLink then
		local isCached = IsCached(itemLink)
		if isCached then
			for i = 2, self:NumLines() do
				local str = _G[tipName.."TextLeft"..i]
				local text = str and str:GetText()
				if text then
					local ilevel = text:match(ItemLevelPattern1)
					if not ilevel then
						ilevel = text:match(ItemLevelPattern2)
					end
					if ilevel then
						SlotCache[slot] = tonumber(ilevel)
						ItemCache[slot] = itemLink
					end
				end
			end
		end
	end

	local finished = true
	local totalItemLevel = 0
	for slot, ilevel in pairs(SlotCache) do
		if not ilevel then
			finished = false
			break
		else
			if slot ~= 16 and slot ~= 17 then
				totalItemLevel = totalItemLevel + ilevel
			end
		end
	end

	if finished then
		local weaponLevel = 0
		local isDual = false
		if SlotCache[16] and SlotCache[17] then -- we have 2 weapons
			isDual = true
			if IsArtifact(ItemCache[16]) or IsArtifact(ItemCache[17]) then -- take the higher of the 2 weapons and double it
				local ilevelMain = SlotCache[16]
				local ilevelOff = SlotCache[17]
				weaponLevel = ilevelMain > ilevelOff and ilevelMain or ilevelOff
				totalItemLevel = totalItemLevel + (weaponLevel * 2)
			else
				local ilevelMain = SlotCache[16]
				local ilevelOff = SlotCache[17]
				totalItemLevel = totalItemLevel + ilevelMain + ilevelOff
				if ilevelMain > ilevelOff then
					weaponLevel = ilevelMain
				else
					weaponLevel = ilevelOff
				end
			end
		elseif SlotCache[16] then -- main hand only
			local _, _, _, weaponType = C_Item.GetItemInfoInstant(ItemCache[16])
			local ilevelMain = SlotCache[16]
			weaponLevel = ilevelMain
			if TwoHanders[weaponType] then -- 2 handed, count it twice
				totalItemLevel = totalItemLevel + (ilevelMain * 2)
			else
				totalItemLevel = totalItemLevel + ilevelMain
			end
		elseif SlotCache[17] then -- off hand only?
			local ilevelOff = SlotCache[17]
			totalItemLevel = totalItemLevel + ilevelOff
			weaponLevel = ilevelOff
		end

		if weaponLevel >= 900 and ScannedGUID ~= UnitGUID("player") then
			weaponLevel = weaponLevel + 15
			if isDual then
				totalItemLevel = totalItemLevel + 15
			else
				totalItemLevel = totalItemLevel + 30
			end
		end

		local averageItemLevel = totalItemLevel / 16

		-- should we just return the cache for this GUID?
		local guid = ScannedGUID
		if not GuidCache[guid] then
			GuidCache[guid] = {}
		end

		GuidCache[guid].ilevel = averageItemLevel
		GuidCache[guid].weaponLevel = weaponLevel
		GuidCache[guid].timestamp = GetTime()

		E("ItemScanComplete", guid, GuidCache[guid])
	end
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)

local function GetTooltipGUID()
	local _, unitID = GameTooltip:GetUnit()
	local guid = unitID and UnitGUID(unitID)
	if UnitIsPlayer(unitID) and CanInspect(unitID) then
		return guid
	end
end

local f = CreateFrame("frame", nil, GameTooltip)
local ShouldInspect = false
lastInspectRequest = 0
local FailTimeout = 1
f:SetScript("OnUpdate", function()
	local _, unitID = GameTooltip:GetUnit()
	local guid = unitID and UnitGUID(unitID)
	if not guid or (InspectFrame and InspectFrame:IsVisible()) then return end
	local timeSince = GetTime() - lastInspectRequest
	if ShouldInspect and (ActiveGUID == guid or (timeSince >= INSPECT_TIMEOUT)) then
		ShouldInspect = false
		if ActiveGUID ~= guid then
			local cache = GuidCache[guid]
			if cache and GetTime() - cache.timestamp <= CACHE_TIMEOUT then
			elseif CanInspect(unitID) then
				NotifyInspect(unitID)
			end
		end
	elseif ShouldInspect and (timeSince < INSPECT_TIMEOUT) then
		if unitID and UnitIsPlayer(unitID) and CanInspect(unitID) and not GuidCache[guid] then
			AddLine(Sekret, QUEUED_STATUS_WAITING..": ", format("%.1fs", INSPECT_TIMEOUT - (GetTime() - lastInspectRequest)), "|cff9A9A9A", "|cff9A9A9A")
		end
	else
		if ActiveGUID then
			if guid == ActiveGUID then
				if timeSince <= FailTimeout then
					AddLine(Sekret, SEARCH, "...", "|cff9A9A9A", "|cff9A9A9A")
				else
					AddLine(Sekret, SEARCH..": ", FAILED, "|cff9A9A9A", "|cff9A9A9A")
					ActiveGUID = nil
				end
			else
				ActiveGUID = nil
				if timeSince > FailTimeout and CanInspect(unitID) then
					NotifyInspect(unitID)
				end
			end
		end
	end
end)

hooksecurefunc("NotifyInspect", function(unitID)
	if not GuidCache[UnitGUID(unitID)] then
		ActiveGUID = UnitGUID(unitID)
	end
	lastInspectRequest = GetTime()
end)

hooksecurefunc("ClearInspectPlayer", function()
	ActiveGUID = nil
end)

local function DoInspect()
	ShouldInspect = true
end

local function DecorateTooltip(guid, isInspect)
	local cache = GuidCache[guid]
	if not cache then return end
	if GetTooltipGUID() == guid or (isInspect and guid == UnitGUID("target")) then
		local _, ourEquippedItemLevel = GetAverageItemLevel()
		local averageItemLevel = cache.ilevel or 0
		if averageItemLevel == 0 then
			DoInspect()
			ActiveGUID = nil
			return
		end
		local r1, g1, b1 = ColorDiff(ourEquippedItemLevel, averageItemLevel)

		local levelText = format("|cff%2x%2x%2x%.1f|r", r1 * 255, g1 * 255, b1 * 255, averageItemLevel)

		if isInspect and averageItemLevel > 0 then
			InspectFrameiLvL:SetText(levelText)
		end

		AddLine(Sekret, STAT_AVERAGE_ITEM_LEVEL..": ", levelText, "|cffF9D700", "|cffffffff")
	end
end

local function ScanUnit(unitID)
	ScannedGUID = UnitGUID(unitID)
	wipe(SlotCache)
	wipe(ItemCache)
	local numEquipped = 0
	for _, slot in pairs(InventorySlots) do
		if GetInventoryItemTexture(unitID, slot) then
			SlotCache[slot] = false
			numEquipped = numEquipped + 1
		end
	end

	if numEquipped > 0 then
		for slot in pairs(SlotCache) do
			TestTips[slot].itemLink = GetInventoryItemLink(unitID, slot)
			TestTips[slot]:SetOwner(WorldFrame, "ANCHOR_NONE")
			TestTips[slot]:SetInventoryItem(unitID, slot)
		end
	else
		local guid = ScannedGUID
		if not GuidCache[guid] then GuidCache[guid] = {} end
		GuidCache[guid].ilevel = 0
		GuidCache[guid].weaponLevel = 0
		GuidCache[guid].timestamp = GetTime()
		E("ItemScanComplete", guid, GuidCache[guid])
	end
end

function E:INSPECT_READY(guid)
	ActiveGUID = nil
	local unitID = UnitTokenFromGUID(guid)
	if unitID then
		if not GuidCache[guid] then
			GuidCache[guid] = {
				ilevel = 0,
				weaponLevel = 0,
				timestamp = 0,
			}
		end

		ScanUnit(unitID)
		C_Timer.After(0.5, function() E("ItemScanComplete", guid, GuidCache[guid]) end)
	end
end

local function InspectLevel()
	if not InspectFrameiLvL then
		local text = InspectModelFrame:CreateFontString("InspectFrameiLvL", "OVERLAY", "SystemFont_Outline_Small")
		text:SetPoint("BOTTOM", 5, 20)
		text:Hide()
		InspectPaperDollFrame:HookScript("OnShow", function()
			text:Show()
			DecorateTooltip(UnitGUID("target"), true)
		end)
		InspectPaperDollFrame:HookScript("OnHide", function()
			text:Hide()
		end)
	end
end

function E:ADDON_LOADED(addon)
	if addon == "Blizzard_InspectUI" then
		InspectLevel()
	end
end

function E:ItemScanComplete(guid)
	DecorateTooltip(guid)
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, function(self)
	if self ~= GameTooltip or self:IsForbidden() then return end
	if C.tooltip.show_shift and not IsShiftKeyDown() then return end
	local _, unitID = self:GetUnit()
	local guid = unitID and UnitGUID(unitID)
	if guid and UnitIsPlayer(unitID) then
		local cache = GuidCache[guid]
		if cache then
			DecorateTooltip(guid)
		end
		if CanInspect(unitID) then
			DoInspect()
		end
	end
end)

----------------------------------------------------------------------------------------
--	Character Info Sheet
----------------------------------------------------------------------------------------
MIN_PLAYER_LEVEL_FOR_ITEM_LEVEL_DISPLAY = 1
hooksecurefunc("PaperDollFrame_SetItemLevel", function(self, unit)
	if unit ~= "player" then return end

	local total, equip = GetAverageItemLevel()
	if total > 0 then total = string.format("%.1f", total) end
	if equip > 0 then equip = string.format("%.1f", equip) end

	local ilvl = equip
	if equip ~= total then
		ilvl = equip.." / "..total
	end

	self.Value:SetText(ilvl)

	self.tooltip = "|cffffffff"..STAT_AVERAGE_ITEM_LEVEL..": "..ilvl
end)