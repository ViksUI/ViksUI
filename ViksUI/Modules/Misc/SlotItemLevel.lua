local T, C, L = unpack(ViksUI)
if C.misc.item_level ~= true then return end

----------------------------------------------------------------------------------------
--	Item level on slot buttons in Character/InspectFrame(iLevel by Sanex)
----------------------------------------------------------------------------------------
local minItemLevel = 590 -- For missing enchant and gems checking (NOTE: need to update every expansion)
local _G = getfenv(0)
local equiped = {} -- Table to store equiped items

local f = CreateFrame("Frame", nil, _G.PaperDollFrame) -- iLvel number frame
local g -- iLvel number for Inspect frame
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")

local fontObject = CreateFont("iLvLFont")
fontObject:SetFontObject("SystemFont_Outline_Small")

-- Tooltip and scanning by Phanx @ http://www.wowinterface.com/forums/showthread.php?p=271406
local itemLevelString = "^"..gsub(ITEM_LEVEL, "%%d", "")
local function _getRealItemLevel(slotId, unit)
	local data = C_TooltipInfo.GetInventoryItem(unit, slotId)
	if not data then return nil end -- With this we don't get ilvl for offhand if we equip 2h weapon
	local realItemLevel

	for i = 2, #data.lines do
		local lineData = data.lines[i]
		local text = lineData and lineData.leftText
		if text then
			local found = strfind(text, itemLevelString)
			if found then
				local level = strmatch(text, "(%d+)%)?$")
				if level and (tonumber(level) > 0) then
					realItemLevel = level
					break
				end
			end
		end
	end

	return realItemLevel
end

-- local function checkSpecID(unit)
	-- local i = 0
	-- local specID
	-- if unit == "player" then
		-- specID = GetSpecializationInfo(GetSpecialization())
	-- else
		-- specID = GetInspectSpecialization("target")
	-- end

	-- if specID then
		-- if specID == 250 or specID == 251 or specID == 252 or specID == 66 or specID == 70 or specID == 71 or specID == 72 or specID == 73 then
			-- i = INVSLOT_HAND
		-- elseif specID == 577 or specID == 581 or specID == 103 or specID == 104 or specID == 253 or specID == 254 or specID == 255
			-- or specID == 268 or specID == 269 or specID == 259 or specID == 260 or specID == 261 or specID == 263 then
			-- i = INVSLOT_FEET
		-- else
			-- i = INVSLOT_WRIST
		-- end
	-- end
	-- return i
-- end

local function _updateItems(unit, frame)
	-- local itemSlot = checkSpecID(unit)
	for i = 1, 17 do -- Only check changed player items or items without ilvl text, skip the shirt (4) and always update Inspects
		local itemLink = GetInventoryItemLink(unit, i)
		if i ~= 4 and ((frame == f and (equiped[i] ~= itemLink or frame[i]:GetText() == nil or itemLink == nil and frame[i]:GetText() ~= "")) or frame == g) then
			if frame == f then
				equiped[i] = itemLink
			end

			local realItemLevel = _getRealItemLevel(i, unit)
			realItemLevel = realItemLevel or ""
			if realItemLevel and tonumber(realItemLevel) == 1 then
				realItemLevel = ""
			end

			local color = "|cffFFFF00"

			-- Check missing enchants and gems
			if itemLink and (realItemLevel ~= "" and tonumber(realItemLevel) > minItemLevel) then
				local _, _, enchant, gem1, gem2, gem3 = strsplit(":", itemLink)
				if i == INVSLOT_BACK or i == INVSLOT_CHEST or i == INVSLOT_MAINHAND or i == INVSLOT_FINGER1 or i == INVSLOT_FINGER2 or i == INVSLOT_WRIST or i == INVSLOT_FEET or i == INVSLOT_LEGS then
					if enchant and enchant == "" then
						color = "|cffFF0000"
					end
				end

				local info = C_Item.GetItemStats(itemLink)
				local numSocket = info["EMPTY_SOCKET_PRISMATIC"] or 0
				local numGem = 0

				if gem1 and gem1 ~= "" then
					numGem = numGem + 1
				end
				if gem2 and gem2 ~= "" then
					numGem = numGem + 1
				end
				if gem3 and gem3 ~= "" then
					numGem = numGem + 1
				end
				if numGem < numSocket then
					color = "|cffFF00CC"
				end
			end

			frame[i]:SetText(color..realItemLevel)
		end
	end
end

local function _createStrings()
	local function _stringFactory(parent)
		local s = f:CreateFontString(nil, "OVERLAY", "iLvLFont")
		s:SetPoint("TOP", parent, "TOP", 0, -2)

		return s
	end

	f:SetFrameLevel(_G.CharacterHeadSlot:GetFrameLevel())

	f[1] = _stringFactory(_G.CharacterHeadSlot)
	f[2] = _stringFactory(_G.CharacterNeckSlot)
	f[3] = _stringFactory(_G.CharacterShoulderSlot)
	f[15] = _stringFactory(_G.CharacterBackSlot)
	f[5] = _stringFactory(_G.CharacterChestSlot)
	f[9] = _stringFactory(_G.CharacterWristSlot)

	f[10] = _stringFactory(_G.CharacterHandsSlot)
	f[6] = _stringFactory(_G.CharacterWaistSlot)
	f[7] = _stringFactory(_G.CharacterLegsSlot)
	f[8] = _stringFactory(_G.CharacterFeetSlot)
	f[11] = _stringFactory(_G.CharacterFinger0Slot)
	f[12] = _stringFactory(_G.CharacterFinger1Slot)
	f[13] = _stringFactory(_G.CharacterTrinket0Slot)
	f[14] = _stringFactory(_G.CharacterTrinket1Slot)

	f[16] = _stringFactory(_G.CharacterMainHandSlot)
	f[17] = _stringFactory(_G.CharacterSecondaryHandSlot)

	f:Hide()
end

local function _createGStrings()
	local function _stringFactory(parent)
		local s = g:CreateFontString(nil, "OVERLAY", "iLvLFont")
		s:SetPoint("TOP", parent, "TOP", 0, -2)

		return s
	end

	g:SetFrameLevel(_G.InspectHeadSlot:GetFrameLevel())

	g[1] = _stringFactory(_G.InspectHeadSlot)
	g[2] = _stringFactory(_G.InspectNeckSlot)
	g[3] = _stringFactory(_G.InspectShoulderSlot)
	g[15] = _stringFactory(_G.InspectBackSlot)
	g[5] = _stringFactory(_G.InspectChestSlot)
	g[9] = _stringFactory(_G.InspectWristSlot)

	g[10] = _stringFactory(_G.InspectHandsSlot)
	g[6] = _stringFactory(_G.InspectWaistSlot)
	g[7] = _stringFactory(_G.InspectLegsSlot)
	g[8] = _stringFactory(_G.InspectFeetSlot)
	g[11] = _stringFactory(_G.InspectFinger0Slot)
	g[12] = _stringFactory(_G.InspectFinger1Slot)
	g[13] = _stringFactory(_G.InspectTrinket0Slot)
	g[14] = _stringFactory(_G.InspectTrinket1Slot)

	g[16] = _stringFactory(_G.InspectMainHandSlot)
	g[17] = _stringFactory(_G.InspectSecondaryHandSlot)

	g:Hide()
end

local function OnEvent(self, event, ...)
	if event == "ADDON_LOADED" and (...) == "Blizzard_InspectUI" then
		self:UnregisterEvent(event)

		if not InspectFrameiLvL and not C.tooltip.average_lvl then
			local text = InspectModelFrame:CreateFontString("InspectFrameiLvL", "OVERLAY", "SystemFont_Outline_Small")
			text:SetPoint("BOTTOM", 5, 20)
			text:Hide()
			InspectPaperDollFrame:HookScript("OnShow", function()
				local avgilvl = C_PaperDollInfo.GetInspectItemLevel("target")
				if avgilvl and tonumber(avgilvl) > 0 then
					text:SetText("|cFFFFFF00"..avgilvl)
					text:Show()
				end
			end)
			InspectPaperDollFrame:HookScript("OnHide", function()
				text:Hide()
			end)
		end

		g = CreateFrame("Frame", nil, _G.InspectPaperDollFrame) -- iLevel number frame for Inspect
		_createGStrings()
		_createGStrings = nil

		_G.InspectPaperDollFrame:HookScript("OnShow", function()
			g:SetFrameLevel(_G.InspectHeadSlot:GetFrameLevel())
			f:RegisterEvent("INSPECT_READY")
			f:RegisterEvent("UNIT_INVENTORY_CHANGED")
			_updateItems("target", g)
			g:Show()
		end)

		_G.InspectPaperDollFrame:HookScript("OnHide", function()
			f:UnregisterEvent("INSPECT_READY")
			f:UnregisterEvent("UNIT_INVENTORY_CHANGED")
			g:Hide()
		end)
	elseif event == "PLAYER_LOGIN" then
		self:UnregisterEvent(event)

		_createStrings()
		_createStrings = nil

		_G.PaperDollFrame:HookScript("OnShow", function()
			f:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
			f:RegisterEvent("ARTIFACT_UPDATE")
			f:RegisterEvent("SOCKET_INFO_UPDATE")
			f:RegisterEvent("COMBAT_RATING_UPDATE")
			_updateItems("player", f)
			f:Show()
		end)

		_G.PaperDollFrame:HookScript("OnHide", function()
			f:UnregisterEvent("PLAYER_EQUIPMENT_CHANGED")
			f:UnregisterEvent("ARTIFACT_UPDATE")
			f:UnregisterEvent("SOCKET_INFO_UPDATE")
			f:UnregisterEvent("COMBAT_RATING_UPDATE")
			f:Hide()
		end)
	elseif event == "PLAYER_EQUIPMENT_CHANGED" or event == "ARTIFACT_UPDATE" or event == "SOCKET_INFO_UPDATE" or event == "COMBAT_RATING_UPDATE" then
		if (...) == 16 then
			equiped[16] = nil
			equiped[17] = nil
		end
		_updateItems("player", f)
	elseif event == "INSPECT_READY" or event == "UNIT_INVENTORY_CHANGED" then
		_updateItems("target", g)
	end
end
f:SetScript("OnEvent", OnEvent)

----------------------------------------------------------------------------------------
--	Item level on flyout buttons (by Merathilis)
----------------------------------------------------------------------------------------
local ItemDB = {}

local function _getRealItemLevel(link, bag, slot)
	if ItemDB[link] then return ItemDB[link] end

	local realItemLevel
	if bag and type(bag) == "string" then
		realItemLevel = C_Item.GetCurrentItemLevel(ItemLocation:CreateFromEquipmentSlot(slot))
	else
		realItemLevel = C_Item.GetCurrentItemLevel(ItemLocation:CreateFromBagAndSlot(bag, slot))
	end

	ItemDB[link] = tonumber(realItemLevel)
	return realItemLevel
end

local function SetupFlyoutLevel(button, bag, slot)
	if not button.iLvl then
		button.iLvl = button:CreateFontString(nil, "OVERLAY", "iLvLFont")
		button.iLvl:SetPoint("TOP", 0, -2)
	end

	local link, level
	if bag then
		link = C_Container.GetContainerItemLink(bag, slot)
		level = _getRealItemLevel(link, bag, slot)
	else
		link = GetInventoryItemLink("player", slot)
		level = _getRealItemLevel(link, "player", slot)
	end

	level = level or ""
	if level and tonumber(level) == 1 then
		level = ""
	end

	button.iLvl:SetText("|cFFFFFF00"..level)
end

hooksecurefunc("EquipmentFlyout_DisplayButton", function(button)
	local location = button.location

	if not location or location >= EQUIPMENTFLYOUT_FIRST_SPECIAL_LOCATION then
		if button.iLvl then button.iLvl:SetText("") end
		return
	end

	local _, _, bags, voidStorage, slot, bag = EquipmentManager_UnpackLocation(location)
	if voidStorage then return end

	if bags then
		SetupFlyoutLevel(button, bag, slot)
	else
		SetupFlyoutLevel(button, nil, slot)
	end
end)

	-- Helper Functions for Upgrade Icons
local function GetUpgradeIcon(itemLink)
	if not itemLink then return nil end

	local itemUpgradeData = C_Item.GetItemUpgradeInfo(itemLink)
	if not itemUpgradeData then return nil end

	-- Define icons for upgrade categories
	local categoryIcons = {
		[970] = "|TInterface\\AddOns\\ViksUI\\Media\\Other\\GrayArrow.png:18:18|t", 	-- Explorer
		[971] = "|TInterface\\AddOns\\ViksUI\\Media\\Other\\GrayArrow.png:18:18|t", 	-- Adventurer
		[972] = "|TInterface\\AddOns\\ViksUI\\Media\\Other\\WhiteArrow.png:18:18|t", 	-- Veteran
		[973] = "|TInterface\\AddOns\\ViksUI\\Media\\Other\\GreenArrow.png:18:18|t", 	-- Champion
		[974] = "|TInterface\\AddOns\\ViksUI\\Media\\Other\\BlueArrow.png:18:18|t", 	-- Hero
		[978] = "|TInterface\\AddOns\\ViksUI\\Media\\Other\\EpicArrow.png:18:18|t", 	-- Myth
	}

	return categoryIcons[itemUpgradeData.trackStringID]
end

-- Fallback for INVSLOT_NAMES if it is not defined
if not _G.INVSLOT_NAMES then
    _G.INVSLOT_NAMES = {
        [1] = "HeadSlot",
        [2] = "NeckSlot",
        [3] = "ShoulderSlot",
        [15] = "BackSlot",
        [5] = "ChestSlot",
        [9] = "WristSlot",
        [10] = "HandsSlot",
        [6] = "WaistSlot",
        [7] = "LegsSlot",
        [8] = "FeetSlot",
        [11] = "Finger0Slot",
        [12] = "Finger1Slot",
        [13] = "Trinket0Slot",
        [14] = "Trinket1Slot",
        [16] = "MainHandSlot",
        [17] = "SecondaryHandSlot",
    }
end

local function UpdateSlotIcon(slot, slotNumber)
    if not slot then return end

    -- Create or update the upgrade icon for the slot
    if not slot.UpgradeIcon then
        slot.UpgradeIcon = slot:CreateFontString(nil, "OVERLAY", "GameTooltipText")
    end
	
	local slotNumber = slot and slot:GetID()
	if not slotNumber then
		return -- Exit early if slotNumber is nil
	end
	
    -- Determine the position based on slot number
    if (slotNumber >= 1 and slotNumber <= 5) or slotNumber == 9 or slotNumber == 15 then
        -- Grouped position for slots 1 to 5 and 9
        slot.UpgradeIcon:SetPoint("BOTTOMLEFT", slot, "BOTTOMRIGHT", 6, 2)
	elseif (slotNumber >= 6 and slotNumber <= 8) or (slotNumber >= 10 and slotNumber <= 14)then
        -- Grouped position for slots 1 to 5 and 9
        slot.UpgradeIcon:SetPoint("BOTTOMRIGHT", slot, "BOTTOMLEFT", -6, 2)
	elseif slotNumber == 16 or slotNumber == 17 then
        -- Grouped position for slots 1 to 5 and 9
        slot.UpgradeIcon:SetPoint("BOTTOM", slot, "TOP", 0, 6)
    else
        -- Default position for other slots
        slot.UpgradeIcon:SetPoint("TOPRIGHT", slot, "TOPRIGHT", -2, -2)
    end

    -- Update the icon text
    local itemLink = GetInventoryItemLink("player", slot:GetID())
    local icon = GetUpgradeIcon(itemLink)

    if icon then
        slot.UpgradeIcon:SetText(icon)
        slot.UpgradeIcon:Show()
    else
        slot.UpgradeIcon:Hide()
    end
end

local function UpdateEquipmentSlots()
	local slots = _G.INVSLOT_NAMES

	for _, slotName in pairs(slots) do
		local slot = _G["Character" .. slotName]
		UpdateSlotIcon(slot)
	end
end

-- Hook Events to Update Icons Dynamically
local function HookSlotEvents()
	-- Update slots whenever the character frame is shown
	CharacterFrame:HookScript("OnShow", UpdateEquipmentSlots)

	-- Update slots when equipment changes
	EventRegistry:RegisterFrameEventAndCallback("PLAYER_EQUIPMENT_CHANGED", function(_, slotIndex)
		local slot = _G["Character" .. (slotIndex and _G.INVSLOT_NAMES[slotIndex] or "")]
		UpdateSlotIcon(slot)
	end)
end

EventRegistry:RegisterFrameEventAndCallback("PLAYER_EQUIPMENT_CHANGED", function(_, slotIndex)
    if not _G.INVSLOT_NAMES then
        return
    end

    local slotName = _G.INVSLOT_NAMES[slotIndex]
    if slotName then
        local slot = _G["Character" .. slotName]
        UpdateSlotIcon(slot)
    else
        print("Error: Invalid slotIndex or slotName is nil.")
    end
end)

-- Initialize the functionality
HookSlotEvents()