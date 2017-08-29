local T, C, L, _ = unpack(select(2, ...))
if C.bag.enable ~= true then return end
local LibItemUpgrade = LibStub('LibItemUpgradeInfo-1.0')
----------------------------------------------------------------------------------------
--	Based on Stuffing(by Hungtar, editor Tukz)
----------------------------------------------------------------------------------------
local BAGS_BACKPACK = {0, 1, 2, 3, 4}
local BAGS_BANK = {-1, 5, 6, 7, 8, 9, 10, 11}
local ST_NORMAL = 1
local ST_FISHBAG = 2
local ST_SPECIAL = 3
local bag_bars = 0
local unusable

StuffingDB = {}
if T.class == "DEATHKNIGHT" then
	unusable = {{LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND}, {LE_ITEM_ARMOR_SHIELD}} -- weapons, armor, dual wield
elseif T.class == "DEMONHUNTER" then
	unusable = {{LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND}, {LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}}
elseif T.class == "DRUID" then
	unusable = {{LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND}, {LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}, true}
elseif T.class == "HUNTER" then
	unusable = {{LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_WAND}, {LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}}
elseif T.class == "MAGE" then
	unusable = {{LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW}, {LE_ITEM_ARMOR_LEATHER, LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD,}, true}
elseif T.class == "MONK" then
	unusable = {{LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND}, {LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}}
elseif T.class == "PALADIN" then
	unusable = {{LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND}, {}, true}
elseif T.class == "PRIEST" then
	unusable = {{LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW}, {LE_ITEM_ARMOR_LEATHER, LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}, true}
elseif T.class == "ROGUE" then
	unusable = {{LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_WAND}, {LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}}
elseif T.class == "SHAMAN" then
	unusable = {{LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND}, {LE_ITEM_ARMOR_PLATEM}}
elseif T.class == "WARLOCK" then
	unusable = {{LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW}, {LE_ITEM_ARMOR_LEATHER, LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}, true}
elseif T.class == "WARRIOR" then
	unusable = {{LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_WAND}, {}}
else
	unusable = {{}, {}}
end

local subs = {}
for k = 0, 20 do
	subs[k + 1] = GetItemSubClassInfo(LE_ITEM_CLASS_WEAPON, k)
end

for i, subclass in ipairs(unusable[1]) do
	unusable[subs[subclass+1]] = true
end

subs = {}
for k = 0, 11 do
	subs[k + 1] = GetItemSubClassInfo(LE_ITEM_CLASS_ARMOR, k)
end

for i, subclass in ipairs(unusable[2]) do
	unusable[subs[subclass + 1]] = true
end


local function IsClassUnusable(subclass, slot)
	if subclass then
		return slot ~= "" and unusable[subclass] or slot == "INVTYPE_WEAPONOFFHAND" and unusable[3]
	end
end

local function IsItemUnusable(...)
	if ... then
		local subclass, _, slot = select(7, GetItemInfo(...))
		return IsClassUnusable(subclass, slot)
	end
end

StaticPopupDialogs.BUY_BANK_SLOT = {
	text = CONFIRM_BUY_BANK_SLOT,
	button1 = YES,
	button2 = NO,
	OnAccept = function(self)
		PurchaseSlot()
	end,
	OnShow = function(self)
		MoneyFrame_Update(self.moneyFrame, GetBankSlotCost())
	end,
	hasMoneyFrame = 1,
	timeout = 0,
	hideOnEscape = 1,
	preferredIndex = 5,
}

StaticPopupDialogs.CANNOT_BUY_BANK_SLOT = {
	text = L_BAG_NO_SLOTS,
	button1 = ACCEPT,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 5,
}

-- Hide bags options in default interface
--InterfaceOptionsDisplayPanelShowFreeBagSpace:Hide()

Stuffing = CreateFrame("Frame", nil, UIParent)
Stuffing:RegisterEvent("ADDON_LOADED")
Stuffing:RegisterEvent("PLAYER_ENTERING_WORLD")
Stuffing:SetScript("OnEvent", function(this, event, ...)
	if IsAddOnLoaded("AdiBags") or IsAddOnLoaded("ArkInventory") or IsAddOnLoaded("cargBags_Nivaya") or IsAddOnLoaded("cargBags") or IsAddOnLoaded("Bagnon") or IsAddOnLoaded("Combuctor") or IsAddOnLoaded("TBag") or IsAddOnLoaded("BaudBag") then return end
	Stuffing[event](this, ...)
end)

-- Drop down menu stuff from Postal
local Stuffing_DDMenu = CreateFrame("Frame", "StuffingDropDownMenu")
Stuffing_DDMenu.displayMode = "MENU"
Stuffing_DDMenu.info = {}
Stuffing_DDMenu.HideMenu = function()
	if UIDROPDOWNMENU_OPEN_MENU == Stuffing_DDMenu then
		CloseDropDownMenus()
	end
end

local function Print (x)
	DEFAULT_CHAT_FRAME:AddMessage("|cFFFF6633ViksBags:|r " .. x)
end

local function Stuffing_OnShow()
	Stuffing:PLAYERBANKSLOTS_CHANGED(29)

	for i = 0, #BAGS_BACKPACK - 1 do
		Stuffing:BAG_UPDATE(i)
	end

	Stuffing:Layout()
	Stuffing:SearchReset()

	PlaySound(PlaySoundKitID and "igBackPackOpen" or SOUNDKIT.IG_BACKPACK_OPEN)
	collectgarbage("collect")
end

local function StuffingBank_OnHide()
	CloseBankFrame()
	if Stuffing.frame:IsShown() then
		Stuffing.frame:Hide()
	end

	PlaySound(PlaySoundKitID and "igBackPackClose" or SOUNDKIT.IG_BACKPACK_CLOSE)
end

local function Stuffing_OnHide()
	if Stuffing.bankFrame and Stuffing.bankFrame:IsShown() then
		Stuffing.bankFrame:Hide()
	end

	PlaySound(PlaySoundKitID and "igBackPackClose" or SOUNDKIT.IG_BACKPACK_CLOSE)
end

local function Stuffing_Open()
	if not Stuffing.frame:IsShown() then
		Stuffing.frame:Show()
	end
end

local function Stuffing_Close()
	Stuffing.frame:Hide()
end

local function Stuffing_Toggle()
	if Stuffing.frame:IsShown() then
		Stuffing.frame:Hide()
	else
		Stuffing.frame:Show()
	end
end

local function Stuffing_ToggleBag(id)
	if id == -2 then
		ToggleKeyRing()
		return
	end
	Stuffing_Toggle()
end



local function StartMoving(self)
	self:StartMoving()
	local n = self:GetName()
end


local function StopMoving(self)
	self:StopMovingOrSizing()
	self:SetUserPlaced(false)

	local n = self:GetName()
	local x, y = self:GetCenter()
	StuffingDB[n .. "PosX"] = x
	StuffingDB[n .. "PosY"] = y
end
-- Bag slot stuff
local trashButton = {}
local trashBag = {}

local upgrades = {
	["1"] = 8, ["373"] = 4, ["374"] = 8, ["375"] = 4, ["376"] = 4, ["377"] = 4,
	["379"] = 4, ["380"] = 4, ["446"] = 4, ["447"] = 8, ["452"] = 8, ["454"] = 4,
	["455"] = 8, ["457"] = 8, ["459"] = 4, ["460"] = 8, ["461"] = 12, ["462"] = 16,
	["466"] = 4, ["467"] = 8, ["469"] = 4, ["470"] = 8, ["471"] = 12, ["472"] = 16,
	["477"] = 4, ["478"] = 8, ["480"] = 8, ["492"] = 4, ["493"] = 8, ["495"] = 4,
	["496"] = 8, ["497"] = 12, ["498"] = 16, ["504"] = 12, ["505"] = 16, ["506"] = 20,
	["507"] = 24, ["530"] = 5, ["531"] = 10, ["535"] = 15, ["536"] = 30, ["537"] = 45
}

local function BOALevel(level, id)
	if level > 97 then
		if id == 133585 or id == 133595 or id == 133596 or id == 133597 or id == 133598 then
			level = 815 - (110 - level) * 10
		else
			level = 605 - (100 - level) * 5
		end
	elseif level > 90 then
		level = 590 - (97 - level) * 10
	elseif level > 85 then
		level = 463 - (90 - level) * 19.75
	elseif level > 80 then
		level = 333 - (85 - level) * 13.5
	elseif level > 67 then
		level = 187 - (80 - level) * 4
	elseif level > 57 then
		level = 105 - (67 - level) * 2.88
	elseif level > 5 then
		level = level + 5
	else
		level = 10
	end

	return floor(level + 0.5)
end

local timewarped = {
	["615"] = 660, -- Dungeon drops
	["692"] = 675, -- Timewarped badge vendors
	["656"] = 675, -- Warforged Dungeon drops
}

function Stuffing:SlotUpdate(b)
	local texture, count, locked, quality = GetContainerItemInfo(b.bag, b.slot)
	local clink = GetContainerItemLink(b.bag, b.slot)
	local isQuestItem, questId = GetContainerItemQuestInfo(b.bag, b.slot)
	local isArtifactPower = IsArtifactPowerItem(GetContainerItemID(b.bag, b.slot))

	-- Set all slot color to default ViksUI on update
	if not b.frame.lock then
		b.frame:SetBackdropBorderColor(unpack(C.media.border_color))
	end

	if C.bag.ilvl == true then
		b.frame.text:SetText("")
	end

	if b.cooldown and StuffingFrameBags and StuffingFrameBags:IsShown() then
		local start, duration, enable = GetContainerItemCooldown(b.bag, b.slot)
		CooldownFrame_Set(b.cooldown, start, duration, enable)
	end

	if clink then
		b.name, _, _, b.itemlevel, b.level, _, _, _, _, _, _, b.itemClassID = GetItemInfo(clink)

		if C.bag.ilvl == true and b.itemlevel and quality > 1 and (b.itemClassID == 2 or b.itemClassID == 4) then
			if quality == 7 and b.itemlevel == 1 then
				local id = tonumber(strmatch(clink, "item:(%d+)"))
				b.frame.text:SetText(BOALevel(T.level, id))
			elseif b.itemlevel > 1 then
				local tid = strmatch(clink, ".+:512:22.+:(%d+):100")
				if timewarped[tid] then
					b.itemlevel = timewarped[tid]
				end

				local upgradeTypeID = select(12, strsplit(":", clink))
				if upgradeTypeID and upgradeTypeID ~= "" then
					local uid = clink:match("[-:%d]+:([-%d]+)")
					if upgrades[uid] then
						b.itemlevel = b.itemlevel + upgrades[uid]
					end
				end

				local numBonusIDs = tonumber(strmatch(clink, ".+:%d+:512:%d*:(%d+).+"))
				if numBonusIDs or quality == 6 then
					b.itemlevel = GetDetailedItemLevelInfo(clink) or b.itemlevel
				end

				b.frame.text:SetText(b.itemlevel)
			end
		end

		if (IsItemUnusable(clink) or b.level and b.level > T.level) and not locked then
			_G[b.frame:GetName().."IconTexture"]:SetVertexColor(1, 0.1, 0.1)
		else
			_G[b.frame:GetName().."IconTexture"]:SetVertexColor(1, 1, 1)
		end

		-- Color slot according to item quality
		if not b.frame.lock and quality and quality > 1 and not (isQuestItem or questId or isArtifactPower) then
			b.frame:SetBackdropBorderColor(GetItemQualityColor(quality))
		elseif isQuestItem or questId then
			b.frame:SetBackdropBorderColor(1, 1, 0)
		elseif isArtifactPower then
			b.frame:SetBackdropBorderColor(.9, .8, .5)
		end
	else
		b.name, b.level = nil, nil
	end

	SetItemButtonTexture(b.frame, texture)
	SetItemButtonCount(b.frame, count)
	SetItemButtonDesaturated(b.frame, locked)

	b.frame:Show()
end

function Stuffing:BagSlotUpdate(bag)
	if not self.buttons then
		return
	end

	for _, v in ipairs(self.buttons) do
		if v.bag == bag then
			self:SlotUpdate(v)
		end
	end
end

function CreateReagentContainer()
	ReagentBankFrame:StripTextures()

	local Reagent = CreateFrame("Frame", "StuffingFrameReagent", UIParent)
	local SwitchBankButton = CreateFrame("Button", nil, Reagent)
	local NumButtons = ReagentBankFrame.size
	local NumRows, LastRowButton, NumButtons, LastButton = 0, ReagentBankFrameItem1, 1, ReagentBankFrameItem1
	local Deposit = ReagentBankFrame.DespositButton

	Reagent:SetWidth(((C.bag.button_size + C.bag.button_space) * C.bag.bank_columns) + 17)
	Reagent:SetPoint("TOPLEFT", _G["StuffingFrameBank"], "TOPLEFT", 0, 0)
	Reagent:SetTemplate("Transparent")
	Reagent:SetFrameStrata(_G["StuffingFrameBank"]:GetFrameStrata())
	Reagent:SetFrameLevel(_G["StuffingFrameBank"]:GetFrameLevel() + 5)
	Reagent:EnableMouse(true)
	Reagent:SetMovable(true)
	Reagent:SetClampedToScreen(true)
	Reagent:SetClampRectInsets(0, 0, 0, -20)
	Reagent:SetScript("OnMouseDown", function(self, button)
		if IsShiftKeyDown() and button == "LeftButton" then
			self:StartMoving()
		end
	end)
	Reagent:SetScript("OnMouseUp", Reagent.StopMovingOrSizing)

	SwitchBankButton:SetSize(80, 20)
	SwitchBankButton:SkinButton()
	SwitchBankButton:SetPoint("TOPLEFT", 10, -4)
	SwitchBankButton:FontString("text", C.font.bags_font, C.font.bags_font_size, C.font.bags_font_style)
	SwitchBankButton.text:SetPoint("CENTER")
	SwitchBankButton.text:SetText(BANK)
	SwitchBankButton:SetScript("OnClick", function()
		Reagent:Hide()
		_G["StuffingFrameBank"]:Show()
		_G["StuffingFrameBank"]:SetAlpha(1)
		BankFrame_ShowPanel(BANK_PANELS[1].name)

		PlaySound(PlaySoundKitID and "igBackPackOpen" or SOUNDKIT.IG_BACKPACK_OPEN)
	end)

	Deposit:SetParent(Reagent)
	Deposit:ClearAllPoints()
	Deposit:SetSize(170, 20)
	Deposit:SetPoint("TOPLEFT", SwitchBankButton, "TOPRIGHT", 3, 0)
	Deposit:SkinButton()
	Deposit:FontString("text", C.font.bags_font, C.font.bags_font_size, C.font.bags_font_style)
	Deposit.text:SetShadowOffset(C.font.bags_font_shadow and 1 or 0, C.font.bags_font_shadow and -1 or 0)
	Deposit.text:SetTextColor(1, 1, 1)
	Deposit.text:SetText(REAGENTBANK_DEPOSIT)
	Deposit:SetFontString(Deposit.text)

	-- Close button
	local Close = CreateFrame("Button", "StuffingCloseButtonReagent", Reagent, "UIPanelCloseButton")
	T.SkinCloseButton(Close, nil, nil, true)
	Close:SetSize(15, 15)
	Close:RegisterForClicks("AnyUp")
	Close:SetScript("OnClick", function(self, btn)
		if btn == "RightButton" then
			if Stuffing_DDMenu.initialize ~= Stuffing.Menu then
				CloseDropDownMenus()
				Stuffing_DDMenu.initialize = Stuffing.Menu
			end
			ToggleDropDownMenu(nil, nil, Stuffing_DDMenu, self:GetName(), 0, 0)
			return
		else
			StuffingBank_OnHide()
		end
	end)

	for i = 1, 98 do
		local button = _G["ReagentBankFrameItem" .. i]
		local icon = _G[button:GetName() .. "IconTexture"]
		local count = _G[button:GetName().."Count"]

		ReagentBankFrame:SetParent(Reagent)
		ReagentBankFrame:ClearAllPoints()
		ReagentBankFrame:SetAllPoints()

		button:StyleButton()
		button:SetTemplate("Default")
		button:SetNormalTexture(nil)
		button.IconBorder:SetAlpha(0)

		button:ClearAllPoints()
		button:SetSize(C.bag.button_size, C.bag.button_size)

		local _, _, _, quality = GetContainerItemInfo(-3, i)
		local clink = GetContainerItemLink(-3, i)
		if clink then
			if quality and quality > 1 then
				button:SetBackdropBorderColor(GetItemQualityColor(quality))
			end
		end

		if i == 1 then
			button:SetPoint("TOPLEFT", Reagent, "TOPLEFT", 10, -27)
			LastRowButton = button
			LastButton = button
		elseif NumButtons == C.bag.bank_columns then
			button:SetPoint("TOPRIGHT", LastRowButton, "TOPRIGHT", 0, -(C.bag.button_space + C.bag.button_size))
			button:SetPoint("BOTTOMLEFT", LastRowButton, "BOTTOMLEFT", 0, -(C.bag.button_space + C.bag.button_size))
			LastRowButton = button
			NumRows = NumRows + 1
			NumButtons = 1
		else
			button:SetPoint("TOPRIGHT", LastButton, "TOPRIGHT", (C.bag.button_space + C.bag.button_size), 0)
			button:SetPoint("BOTTOMLEFT", LastButton, "BOTTOMLEFT", (C.bag.button_space + C.bag.button_size), 0)
			NumButtons = NumButtons + 1
		end

		icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		icon:SetPoint("TOPLEFT", 2, -2)
		icon:SetPoint("BOTTOMRIGHT", -2, 2)

		count:SetFont(C.font.bags_font, C.font.bags_font_size, C.font.bags_font_style)
		count:SetShadowOffset(C.font.bags_font_shadow and 1 or 0, C.font.bags_font_shadow and -1 or 0)
		count:SetPoint("BOTTOMRIGHT", 1, 1)

		LastButton = button
	end
	Reagent:SetHeight(((C.bag.button_size + C.bag.button_space) * (NumRows + 1) + 40) - C.bag.button_space)
	MoneyFrame_Update(ReagentBankFrame.UnlockInfo.CostMoneyFrame, GetReagentBankCost())
	ReagentBankFrameUnlockInfo:StripTextures()
	ReagentBankFrameUnlockInfo:SetAllPoints(Reagent)
	ReagentBankFrameUnlockInfo:SetTemplate("Overlay")
	ReagentBankFrameUnlockInfo:SetFrameStrata("FULLSCREEN")
	ReagentBankFrameUnlockInfoPurchaseButton:SkinButton()
end

function Stuffing:BagFrameSlotNew(p, slot)
	for _, v in ipairs(self.bagframe_buttons) do
		if v.slot == slot then
			return v, false
		end
	end

	local ret = {}
	if slot > 3 then
		ret.slot = slot
		slot = slot - 4
		ret.frame = CreateFrame("CheckButton", "StuffingBBag"..slot.."Slot", p, "BankItemButtonBagTemplate")
		ret.frame:StripTextures()
		ret.frame:SetID(slot)
		table.insert(self.bagframe_buttons, ret)

		BankFrameItemButton_Update(ret.frame)
		BankFrameItemButton_UpdateLocked(ret.frame)

		if not ret.frame.tooltipText then
			ret.frame.tooltipText = ""
		end
	else
		ret.frame = CreateFrame("CheckButton", "StuffingFBag"..slot.."Slot", p, "BagSlotButtonTemplate")
		ret.frame:StripTextures()
		ret.slot = slot
		table.insert(self.bagframe_buttons, ret)
	end

	ret.frame:SetTemplate("Default")
	ret.frame:StyleButton()
	ret.frame:SetNormalTexture("")
	ret.frame:SetCheckedTexture("")

	ret.icon = _G[ret.frame:GetName().."IconTexture"]
	ret.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	ret.icon:SetPoint("TOPLEFT", ret.frame, 2, -2)
	ret.icon:SetPoint("BOTTOMRIGHT", ret.frame, -2, 2)

	return ret
end

function Stuffing:SlotNew(bag, slot)
	for _, v in ipairs(self.buttons) do
		if v.bag == bag and v.slot == slot then
			v.lock = false
			return v, false
		end
	end

	local tpl = "ContainerFrameItemButtonTemplate"

	if bag == -1 then
		tpl = "BankItemButtonGenericTemplate"
	end

	local ret = {}

	if #trashButton > 0 then
		local f = -1
		for i, v in ipairs(trashButton) do
			local b, s = v:GetName():match("(%d+)_(%d+)")

			b = tonumber(b)
			s = tonumber(s)

			if b == bag and s == slot then
				f = i
				break
			else
				v:Hide()
			end
		end

		if f ~= -1 then
			ret.frame = trashButton[f]
			table.remove(trashButton, f)
			ret.frame:Show()
		end
	end

	if not ret.frame then
		ret.frame = CreateFrame("Button", "StuffingBag"..bag.."_"..slot, self.bags[bag], tpl)
		ret.frame:StyleButton()
		ret.frame:SetTemplate("Default")
		ret.frame:SetNormalTexture(nil)

		ret.icon = _G[ret.frame:GetName().."IconTexture"]
		ret.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		ret.icon:SetPoint("TOPLEFT", ret.frame, 2, -2)
		ret.icon:SetPoint("BOTTOMRIGHT", ret.frame, -2, 2)

		ret.count = _G[ret.frame:GetName().."Count"]
		ret.count:SetFont(C.font.bags_font, C.font.bags_font_size, C.font.bags_font_style)
		ret.count:SetShadowOffset(C.font.bags_font_shadow and 1 or 0, C.font.bags_font_shadow and -1 or 0)
		ret.count:SetPoint("BOTTOMRIGHT", 1, 1)

		if C.bag.ilvl == true then
			ret.frame:FontString("text", C.font.bags_font, C.font.bags_font_size, C.font.bags_font_style)
			ret.frame.text:SetPoint("TOP", 1, -1)
			ret.frame.text:SetTextColor(1, 1, 0)
		end

		local Battlepay = _G[ret.frame:GetName()].BattlepayItemTexture
		if Battlepay then
			Battlepay:SetAlpha(0)
		end
	end

	ret.bag = bag
	ret.slot = slot
	ret.frame:SetID(slot)

	ret.cooldown = _G[ret.frame:GetName().."Cooldown"]
	ret.cooldown:Show()

	self:SlotUpdate(ret)

	return ret, true
end

-- From OneBag
local BAGTYPE_PROFESSION = 0x0008 + 0x0010 + 0x0020 + 0x0040 + 0x0080 + 0x0200 + 0x0400 + 0x10000
local BAGTYPE_FISHING = 32768

function Stuffing:BagType(bag)
	local bagType = select(2, GetContainerNumFreeSlots(bag))

	if bagType and bit.band(bagType, BAGTYPE_FISHING) > 0 then
		return ST_FISHBAG
	elseif bagType and bit.band(bagType, BAGTYPE_PROFESSION) > 0 then
		return ST_SPECIAL
	end

	return ST_NORMAL
end

function Stuffing:BagNew(bag, f)
	for i, v in pairs(self.bags) do
		if v:GetID() == bag then
			v.bagType = self:BagType(bag)
			return v
		end
	end

	local ret

	if #trashBag > 0 then
		local f = -1
		for i, v in pairs(trashBag) do
			if v:GetID() == bag then
				f = i
				break
			end
		end

		if f ~= -1 then
			ret = trashBag[f]
			table.remove(trashBag, f)
			ret:Show()
			ret.bagType = self:BagType(bag)
			return ret
		end
	end

	ret = CreateFrame("Frame", "StuffingBag"..bag, f)
	ret.bagType = self:BagType(bag)

	ret:SetID(bag)
	return ret
end

function Stuffing:SearchUpdate(str)
	str = string.lower(str)

	for _, b in ipairs(self.buttons) do
		if b.frame and not b.name then
			b.frame:SetAlpha(0.2)
		end
		if b.name then
			local _, setName = GetContainerItemEquipmentSetInfo(b.bag, b.slot)
			setName = setName or ""
			local ilink = GetContainerItemLink(b.bag, b.slot)
			local class, subclass, _, equipSlot = select(6, GetItemInfo(ilink))
			local minLevel = select(5, GetItemInfo(ilink))
			equipSlot = _G[equipSlot] or ""
			if not string.find(string.lower(b.name), str) and not string.find(string.lower(setName), str) and not string.find(string.lower(class), str) and not string.find(string.lower(subclass), str) and not string.find(string.lower(equipSlot), str) then
				if IsItemUnusable(b.name) or minLevel > T.level then
					_G[b.frame:GetName().."IconTexture"]:SetVertexColor(0.5, 0.5, 0.5)
				end
				SetItemButtonDesaturated(b.frame, true)
				b.frame:SetAlpha(0.2)
			else
				if IsItemUnusable(b.name) or minLevel > T.level then
					_G[b.frame:GetName().."IconTexture"]:SetVertexColor(1, 0.1, 0.1)
				end
				SetItemButtonDesaturated(b.frame, false)
				b.frame:SetAlpha(1)
			end
		end
	end
end

function Stuffing:SearchReset()
	for _, b in ipairs(self.buttons) do
		if IsItemUnusable(b.name) or (b.level and b.level > T.level) then
			_G[b.frame:GetName().."IconTexture"]:SetVertexColor(1, 0.1, 0.1)
		end
		b.frame:SetAlpha(1)
		SetItemButtonDesaturated(b.frame, false)
	end
end

function Stuffing:CreateBagFrame(w)
	local n = "StuffingFrame"..w
	local f = CreateFrame("Frame", n, UIParent)
	f:EnableMouse(true)
	f:SetMovable(true)
	f:SetFrameStrata("DIALOG")
	f:SetFrameLevel(5)
	f:SetScript("OnMouseDown", function(self, button)
		if IsShiftKeyDown() and button == "LeftButton" then
			self:StartMoving()
		end
	end)
	f:SetScript("OnMouseUp", f.StopMovingOrSizing)

	if w == "Bank" then
		f:SetPoint("BOTTOMLEFT", LChatTab, "BOTTOMLEFT", 20, 20)
		f:SetScript("OnMouseDown", StartMoving)
		f:SetScript("OnMouseUp", StopMoving)
	else
		f:SetPoint("BOTTOMRIGHT", RChatTab, "BOTTOMRIGHT", -40, 20)
		f:SetScript("OnMouseDown", StartMoving)
		f:SetScript("OnMouseUp", StopMoving)
	end

	if w == "Bank" then
		-- Reagent button
		f.b_reagent = CreateFrame("Button", "StuffingReagentButton"..w, f)
		f.b_reagent:SetSize(105, 20)
		f.b_reagent:SetPoint("TOPLEFT", 10, -4)
		f.b_reagent:RegisterForClicks("AnyUp")
		f.b_reagent:SkinButton()
		f.b_reagent:SetScript("OnClick", function()
			BankFrame_ShowPanel(BANK_PANELS[2].name)

			PlaySound(PlaySoundKitID and "igBackPackOpen" or SOUNDKIT.IG_BACKPACK_OPEN)
			if not ReagentBankFrame.isMade then
				CreateReagentContainer()
				ReagentBankFrame.isMade = true
			else
				_G["StuffingFrameReagent"]:Show()
			end
			_G["StuffingFrameBank"]:SetAlpha(0)
		end)
		f.b_reagent:FontString("text", C.font.bags_font, C.font.bags_font_size, C.font.bags_font_style)
		f.b_reagent.text:SetPoint("CENTER")
		f.b_reagent.text:SetText(REAGENT_BANK)
		f.b_reagent:SetFontString(f.b_reagent.text)
		-- Buy button
		f.b_purchase = CreateFrame("Button", "StuffingPurchaseButton"..w, f)
		f.b_purchase:SetSize(80, 20)
		f.b_purchase:SetPoint("TOPLEFT", f.b_reagent, "TOPRIGHT", 3, 0)
		f.b_purchase:RegisterForClicks("AnyUp")
		f.b_purchase:SkinButton()
		f.b_purchase:SetScript("OnClick", function(self) StaticPopup_Show("CONFIRM_BUY_BANK_SLOT") end)
		f.b_purchase:FontString("text", C.font.bags_font, C.font.bags_font_size, C.font.bags_font_style)
		f.b_purchase.text:SetPoint("CENTER")
		f.b_purchase.text:SetText(BANKSLOTPURCHASE)
		f.b_purchase:SetFontString(f.b_purchase.text)
		local _, full = GetNumBankSlots()
		if full then
			f.b_purchase:Hide()
		else
			f.b_purchase:Show()
		end
	end

	-- Close button
	f.b_close = CreateFrame("Button", "StuffingCloseButton"..w, f, "UIPanelCloseButton")
	T.SkinCloseButton(f.b_close, nil, nil, true)
	f.b_close:SetSize(15, 15)
	f.b_close:SetScript("OnClick", function(self, btn)
		if btn == "RightButton" then
			if Stuffing_DDMenu.initialize ~= Stuffing.Menu then
				CloseDropDownMenus()
				Stuffing_DDMenu.initialize = Stuffing.Menu
			end
			ToggleDropDownMenu(nil, nil, Stuffing_DDMenu, self:GetName(), 0, 0)
			return
		end
		self:GetParent():Hide()
	end)
	f.b_close:RegisterForClicks("AnyUp")

	-- Create the bags frame
	local fb = CreateFrame("Frame", n.."BagsFrame", f)
	fb:SetPoint("BOTTOMLEFT", f, "TOPLEFT", 0, 3)
	fb:SetFrameStrata("MEDIUM")
	f.bags_frame = fb

	return f
end

function Stuffing:InitBank()
	if self.bankFrame then
		return
	end

	local f = self:CreateBagFrame("Bank")
	f:SetScript("OnHide", StuffingBank_OnHide)
	self.bankFrame = f
end

local parent_startmoving = function(self)
	StartMoving(self:GetParent())
end

local parent_stopmovingorsizing = function (self)
	StopMoving(self:GetParent())
end

function Stuffing:InitBags()
	if self.frame then return end

	self.buttons = {}
	self.bags = {}
	self.bagframe_buttons = {}

	local f = self:CreateBagFrame("Bags")
	f:SetScript("OnShow", Stuffing_OnShow)
	f:SetScript("OnHide", Stuffing_OnHide)

	-- Search editbox (tekKonfigAboutPanel.lua)
	local editbox = CreateFrame("EditBox", nil, f)
	editbox:Hide()
	editbox:SetAutoFocus(true)
	editbox:SetHeight(32)
	editbox:CreateBackdrop("Default")
	editbox.backdrop:SetPoint("TOPLEFT", -2, 1)
	editbox.backdrop:SetPoint("BOTTOMRIGHT", 2, -1)

	local resetAndClear = function(self)
		self:GetParent().detail:Show()
		self:ClearFocus()
		Stuffing:SearchReset()
	end

	local updateSearch = function(self, t)
		if t == true then
			Stuffing:SearchUpdate(self:GetText())
		end
	end

	editbox:SetScript("OnEscapePressed", resetAndClear)
	editbox:SetScript("OnEnterPressed", resetAndClear)
	editbox:SetScript("OnEditFocusLost", editbox.Hide)
	editbox:SetScript("OnEditFocusGained", editbox.HighlightText)
	editbox:SetScript("OnTextChanged", updateSearch)
	editbox:SetText(SEARCH)

	local detail = f:CreateFontString(nil, "ARTWORK", "GameFontHighlightLarge")
	detail:SetPoint("TOPLEFT", f, 11, -10)
	detail:SetPoint("RIGHT", f, -140, -10)
	detail:SetHeight(13)
	detail:SetShadowColor(0, 0, 0, 0)
	detail:SetJustifyH("LEFT")
	detail:SetText("|cff9999ff"..SEARCH.."|r")
	editbox:SetAllPoints(detail)

	local button = CreateFrame("Button", nil, f)
	button:EnableMouse(true)
	button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	button:SetAllPoints(detail)
	button.ttText = L_BAG_RIGHT_CLICK_SEARCH
	button:SetScript("OnClick", function(self, btn)
		if btn == "RightButton" then
			self:GetParent().detail:Hide()
			self:GetParent().editbox:Show()
			self:GetParent().editbox:HighlightText()
		else
			if self:GetParent().editbox:IsShown() then
				self:GetParent().editbox:Hide()
				self:GetParent().editbox:ClearFocus()
				self:GetParent().detail:Show()
				Stuffing:SearchReset()
			end
		end
	end)

	local tooltip_hide = function()
		GameTooltip:Hide()
	end

	local tooltip_show = function(self)
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
		GameTooltip:ClearLines()
		GameTooltip:SetText(self.ttText)
		--GameTooltip:SetText(L_BAG_RIGHT_CLICK_SEARCH)
	end

	button:SetScript("OnEnter", tooltip_show)
	button:SetScript("OnLeave", tooltip_hide)
	
	if C.bag.bag_buttons then
		-- Deposit Button
		f.depositButton = CreateFrame("Button", nil, f)
		f.depositButton:SetSize(18, 18)
		f.depositButton:SetTemplate()
		f.depositButton:StyleButton(true)
		f.depositButton:SetPoint("TOPRIGHT", f, -25, -4)
		f.depositButton:SetNormalTexture("Interface\\ICONS\\misc_arrowdown")
		f.depositButton:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
		f.depositButton:GetNormalTexture():SetPoint("TOPLEFT", 2, -2)
		f.depositButton:GetNormalTexture():SetPoint("BOTTOMRIGHT", -2, 2)
		f.depositButton.ttText = L_BAG_BUTTONS_DEPOSIT
		f.depositButton:SetScript("OnEnter", tooltip_show)
		f.depositButton:SetScript("OnLeave", tooltip_hide)
		f.depositButton:SetScript("OnClick", function(self, btn)
			PlaySound(PlaySoundKitID and "igMainMenuOption" or SOUNDKIT.IG_MAINMENU_OPTION)
			DepositReagentBank()
		end)

		-- Sort Button
		f.sortButton = CreateFrame("Button", nil, f)
		f.sortButton:SetSize(18, 18)
		f.sortButton:SetTemplate()
		f.sortButton:StyleButton(true)
		f.sortButton:SetPoint("TOPRIGHT", f.depositButton, -25, 0)
		f.sortButton:SetNormalTexture("Interface\\ICONS\\INV_Pet_Broom")
		f.sortButton:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
		f.sortButton:GetNormalTexture():SetPoint("TOPLEFT", 2, -2)
		f.sortButton:GetNormalTexture():SetPoint("BOTTOMRIGHT", -2, 2)
		f.sortButton.ttText = L_BAG_BUTTONS_SORT
		f.sortButton:SetScript("OnEnter", tooltip_show)
		f.sortButton:SetScript("OnLeave", tooltip_hide)
		f.sortButton:SetScript("OnMouseUp", function(self, btn)
			if btn == "RightButton" then
				SetSortBagsRightToLeft(true)
				SortBags()
			else
				Stuffing:SetBagsForSorting("d")
				Stuffing:SortBags()
			end
		end)
	
		if T.level >= 100 then
			-- Artifact Button
			f.ArtifactButton = CreateFrame("Button", nil, f, "BankItemButtonGenericTemplate")
			f.ArtifactButton:SetSize(18, 18)
			f.ArtifactButton:SetTemplate()
			f.ArtifactButton:StyleButton(true)
			f.ArtifactButton:SetPoint("TOPRIGHT", f.sortButton, -25, 0)
			f.ArtifactButton:SetNormalTexture("Interface\\Icons\\Achievement_doublejeopardy")
			f.ArtifactButton:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
			f.ArtifactButton:GetNormalTexture():SetPoint("TOPLEFT", 2, -2)
			f.ArtifactButton:GetNormalTexture():SetPoint("BOTTOMRIGHT", -2, 2)
			f.ArtifactButton:SetPushedTexture("Interface\\Icons\\Achievement_doublejeopardy")
			f.ArtifactButton:GetPushedTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
			f.ArtifactButton:GetPushedTexture():SetPoint("TOPLEFT", 2, -2)
			f.ArtifactButton:GetPushedTexture():SetPoint("BOTTOMRIGHT", -2, 2)
			f.ArtifactButton:RegisterForClicks("RightButtonUp")
			f.ArtifactButton.ttText = L_BAG_BUTTONS_ARTIFACT
			f.ArtifactButton.UpdateTooltip = nil
			f.ArtifactButton:SetScript("OnEnter", tooltip_show)
			f.ArtifactButton:SetScript("OnLeave", tooltip_hide)
			f.ArtifactButton:SetScript("PreClick", function(self)
				for bag = 0, 4 do
					for slot = 1, GetContainerNumSlots(bag) do
						if IsArtifactPowerItem(GetContainerItemID(bag, slot)) then
							self:GetParent():SetID(bag)
							self:SetID(slot)
							return
						end
					end
				end
			end)
		end
	end
	f.editbox = editbox
	f.detail = detail
	f.button = button
	self.frame = f
	f:Hide()
end

function Stuffing:Layout(isBank)
	local slots = 0
	local rows = 0
	local off = 20
	local cols, f, bs

	if isBank then
		bs = BAGS_BANK
		cols = C.bag.bank_columns
		f = self.bankFrame
		f:SetAlpha(1)
	else
		bs = BAGS_BACKPACK
		cols = C.bag.bag_columns
		f = self.frame

		f.editbox:SetFont(C.media.normal_font, C.font.bags_font_size + 3)
		f.detail:SetFont(C.font.bags_font, C.font.bags_font_size, C.font.bags_font_style)
		f.detail:SetShadowOffset(C.font.bags_font_shadow and 1 or 0, C.font.bags_font_shadow and -1 or 0)

		f.detail:ClearAllPoints()
		f.detail:SetPoint("TOPLEFT", f, 12, -8)
		f.detail:SetPoint("RIGHT", f, -140, 0)
	end

	f:SetClampedToScreen(1)
	f:SetTemplate("Transparent")

	-- Bag frame stuff
	local fb = f.bags_frame
	if bag_bars == 1 then
		fb:SetClampedToScreen(1)
		fb:SetTemplate("Transparent")

		local bsize = C.bag.button_size
		
		local w = 2 * 10
		w = w + ((#bs - 1) * bsize)
		w = w + ((#bs - 2) * 4)

		fb:SetHeight(2 * 10 + bsize)
		fb:SetWidth(w)
		fb:Show()
	else
		fb:Hide()
	end

	local idx = 0
	for _, v in ipairs(bs) do
		if (not isBank and v <= 3 ) or (isBank and v ~= -1) then
			local bsize = C.bag.button_size
			local b = self:BagFrameSlotNew(fb, v)
			local xoff = 10

			xoff = xoff + (idx * bsize)
			xoff = xoff + (idx * 4)

			b.frame:ClearAllPoints()
			b.frame:SetPoint("LEFT", fb, "LEFT", xoff, 0)
			b.frame:SetSize(bsize, bsize)

			local btns = self.buttons
			b.frame:HookScript("OnEnter", function(self)
				local bag
				if isBank then bag = v else bag = v + 1 end

				for ind, val in ipairs(btns) do
					if val.bag == bag then
						val.frame:SetAlpha(1)
					else
						val.frame:SetAlpha(0.2)
					end
				end
			end)

			b.frame:HookScript("OnLeave", function(self)
				for _, btn in ipairs(btns) do
					btn.frame:SetAlpha(1)
				end
			end)

			b.frame:SetScript("OnClick", nil)

			idx = idx + 1
		end
	end

	for _, i in ipairs(bs) do
		local x = GetContainerNumSlots(i)
		if x > 0 then
			if not self.bags[i] then
				self.bags[i] = self:BagNew(i, f)
			end

			slots = slots + GetContainerNumSlots(i)
		end
	end

	rows = floor(slots / cols)
	if (slots % cols) ~= 0 then
		rows = rows + 1
	end

	f:SetWidth(cols * C.bag.button_size + (cols - 1) * C.bag.button_space + 10 * 2)
	f:SetHeight(rows * C.bag.button_size + (rows - 1) * C.bag.button_space + off + 10 * 2)

	local idx = 0
	for _, i in ipairs(bs) do
		local bag_cnt = GetContainerNumSlots(i)
		local specialType = select(2, GetContainerNumFreeSlots(i))
		if bag_cnt > 0 then
			self.bags[i] = self:BagNew(i, f)
			local bagType = self.bags[i].bagType

			self.bags[i]:Show()
			for j = 1, bag_cnt do
				local b, isnew = self:SlotNew(i, j)
				local xoff
				local yoff
				local x = (idx % cols)
				local y = floor(idx / cols)

				if isnew then
					table.insert(self.buttons, idx + 1, b)
				end

				xoff = 10 + (x * C.bag.button_size) + (x * C.bag.button_space)
				yoff = off + 10 + (y * C.bag.button_size) + ((y - 1) * C.bag.button_space)
				yoff = yoff * -1

				b.frame:ClearAllPoints()
				b.frame:SetPoint("TOPLEFT", f, "TOPLEFT", xoff, yoff)
				b.frame:SetSize(C.bag.button_size, C.bag.button_size)
				b.frame.lock = false
				b.frame:SetAlpha(1)

				if bagType == ST_FISHBAG then
					b.frame:SetBackdropBorderColor(1, 0, 0)	-- Tackle
					b.frame.lock = true
				elseif bagType == ST_SPECIAL then
					if specialType == 0x0008 then			-- Leatherworking
						b.frame:SetBackdropBorderColor(0.8, 0.7, 0.3)
					elseif specialType == 0x0010 then		-- Inscription
						b.frame:SetBackdropBorderColor(0.3, 0.3, 0.8)
					elseif specialType == 0x0020 then		-- Herbs
						b.frame:SetBackdropBorderColor(0.3, 0.7, 0.3)
					elseif specialType == 0x0040 then		-- Enchanting
						b.frame:SetBackdropBorderColor(0.6, 0, 0.6)
					elseif specialType == 0x0080 then		-- Engineering
						b.frame:SetBackdropBorderColor(0.9, 0.4, 0.1)
					elseif specialType == 0x0200 then		-- Gems
						b.frame:SetBackdropBorderColor(0, 0.7, 0.8)
					elseif specialType == 0x0400 then		-- Mining
						b.frame:SetBackdropBorderColor(0.4, 0.3, 0.1)
					elseif specialType == 0x10000 then		-- Cooking
						b.frame:SetBackdropBorderColor(0.9, 0, 0.1)
					end
					b.frame.lock = true
				end

				idx = idx + 1
			end
		end
	end
end

local function Stuffing_Sort(args)
	if not args then
		args = ""
	end
	if _G["StuffingFrameReagent"] and _G["StuffingFrameReagent"]:IsShown() then
		SortReagentBankBags()
		return
	end
	Stuffing.itmax = 0
	Stuffing:SetBagsForSorting(args)
	Stuffing:SortBags()
end

function Stuffing:SetBagsForSorting(c)
	Stuffing_Open()

	self.sortBags = {}

	local cmd = ((c == nil or c == "") and {"d"} or {strsplit("/", c)})

	for _, s in ipairs(cmd) do
		if s == "c" then
			self.sortBags = {}
		elseif s == "d" then
			if not self.bankFrame or not self.bankFrame:IsShown() then
				for _, i in ipairs(BAGS_BACKPACK) do
					if self.bags[i] and self.bags[i].bagType == ST_NORMAL then
						table.insert(self.sortBags, i)
					end
				end
			elseif not _G["StuffingFrameReagent"] or not _G["StuffingFrameReagent"]:IsShown() then
				for _, i in ipairs(BAGS_BANK) do
					if self.bags[i] and self.bags[i].bagType == ST_NORMAL then
						table.insert(self.sortBags, i)
					end
				end
			end
		elseif s == "p" then
			if not self.bankFrame or not self.bankFrame:IsShown() then
				for _, i in ipairs(BAGS_BACKPACK) do
					if self.bags[i] and self.bags[i].bagType == ST_SPECIAL then
						table.insert(self.sortBags, i)
					end
				end
			else
				for _, i in ipairs(BAGS_BANK) do
					if self.bags[i] and self.bags[i].bagType == ST_SPECIAL then
						table.insert(self.sortBags, i)
					end
				end
			end
		else
			table.insert(self.sortBags, tonumber(s))
		end
	end

	local bids = L_BAG_BAGS_BIDS
	for _, i in ipairs(self.sortBags) do
		bids = bids..i.." "
	end

	Print(bids)
end


-- Slash command handler
local function StuffingSlashCmd(Cmd)
	local cmd, args = strsplit(" ", Cmd:lower(), 2)

	if cmd == "config" then
		Stuffing_OpenConfig()
	elseif cmd == "sort" then
		Stuffing_Sort(args)
	elseif cmd == "psort" then
		Stuffing_Sort("c/p")
	elseif cmd == "stack" then

		Stuffing:SetBagsForSorting(args)
		Stuffing:Restack()
	elseif cmd == "test" then
		Stuffing:SetBagsForSorting(args)
	elseif cmd == "purchase" then

		if Stuffing.bankFrame and Stuffing.bankFrame:IsShown() then
			local cnt, full = GetNumBankSlots()
			if full then

				Print(L_BAG_NO_SLOTS)
				return
			end

			if args == "yes" then
				PurchaseSlot()
				return
			end

			Print(string.format(L_BAG_COSTS, GetBankSlotCost() / 10000))

			Print(L_BAG_BUY_SLOTS)
		else

			Print(L_BAG_OPEN_BANK)
		end
	else

		Print("/bags sort - "..L_BAG_SORT)
		Print("/bags stack - "..L_BAG_STACK)
		Print("/bags purchase - "..L_BAG_BUY_BANKS_SLOT)
	end
end


function Stuffing:ADDON_LOADED(addon)

	if addon ~= "ViksUI" then return nil end


	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("ITEM_LOCK_CHANGED")

	self:RegisterEvent("BANKFRAME_OPENED")
	self:RegisterEvent("BANKFRAME_CLOSED")
	self:RegisterEvent("GUILDBANKFRAME_OPENED")
	self:RegisterEvent("GUILDBANKFRAME_CLOSED")
	self:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
	self:RegisterEvent("PLAYERBANKBAGSLOTS_CHANGED")
	self:RegisterEvent("PLAYERREAGENTBANKSLOTS_CHANGED")
	self:RegisterEvent("BAG_CLOSED")
	self:RegisterEvent("BAG_UPDATE_COOLDOWN")
	--self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

	SlashCmdList.STUFFING = StuffingSlashCmd
	SLASH_STUFFING1 = "/bags"
	SLASH_STUFFING2 = "/ифпы"
	self:InitBags()

	tinsert(UISpecialFrames, "StuffingFrameBags")
	tinsert(UISpecialFrames, "StuffingFrameReagent")

	ToggleBackpack = Stuffing_Toggle
	ToggleBag = Stuffing_Toggle
	ToggleAllBags = Stuffing_Toggle
	OpenAllBags = Stuffing_Open
	OpenBackpack = Stuffing_Open
	CloseAllBags = Stuffing_Close
	CloseBackpack = Stuffing_Close

	--BankFrame:UnregisterAllEvents()
	BankFrame:SetScale(0.00001)
	BankFrame:SetAlpha(0)
	BankFrame:SetPoint("TOPLEFT")
end

function Stuffing:PLAYER_ENTERING_WORLD()
	Stuffing:UnregisterEvent("PLAYER_ENTERING_WORLD")
	ToggleBackpack()
	ToggleBackpack()
end

function Stuffing:PLAYERBANKSLOTS_CHANGED(id)
	if id > 28 then
		for _, v in ipairs(self.bagframe_buttons) do
			if v.frame and v.frame.GetInventorySlot then

				BankFrameItemButton_Update(v.frame)
				BankFrameItemButton_UpdateLocked(v.frame)

				if not v.frame.tooltipText then
					v.frame.tooltipText = ""
				end
			end
		end
	end

	if self.bankFrame and self.bankFrame:IsShown() then
		self:BagSlotUpdate(-1)
	end
end

function Stuffing:PLAYERREAGENTBANKSLOTS_CHANGED()
	for i = 1, 98 do
		local button = _G["ReagentBankFrameItem" .. i]
		if not button then return end
		local _, _, _, quality = GetContainerItemInfo(-3, i)
		local clink = GetContainerItemLink(-3, i)
		button:SetBackdropBorderColor(unpack(C.media.border_color))

		if clink then
			if quality and quality > 1 then
				button:SetBackdropBorderColor(GetItemQualityColor(quality))
			end
		end
	end
end

function Stuffing:BAG_UPDATE(id)
	self:BagSlotUpdate(id)
end

function Stuffing:ITEM_LOCK_CHANGED(bag, slot)
	if slot == nil then return end
	for _, v in ipairs(self.buttons) do
		if v.bag == bag and v.slot == slot then
			self:SlotUpdate(v)
			break
		end
	end
end

function Stuffing:BANKFRAME_OPENED()
	if not self.bankFrame then
		self:InitBank()
	end
	self:Layout(true)
	for _, x in ipairs(BAGS_BANK) do
		self:BagSlotUpdate(x)
	end

	self.bankFrame:Show()
	Stuffing_Open()
end

function Stuffing:BANKFRAME_CLOSED()
	if StuffingFrameReagent then
		StuffingFrameReagent:Hide()
	end
	if self.bankFrame then
		self.bankFrame:Hide()
	end
end

function Stuffing:GUILDBANKFRAME_OPENED()
	Stuffing_Open()
end

function Stuffing:GUILDBANKFRAME_CLOSED()
	Stuffing_Close()
end

function Stuffing:BAG_CLOSED(id)
	local b = self.bags[id]
	if b then
		table.remove(self.bags, id)
		b:Hide()
		table.insert(trashBag, #trashBag + 1, b)
	end

	while true do
		local changed = false

		for i, v in ipairs(self.buttons) do
			if v.bag == id then
				v.frame:Hide()
				v.frame.lock = false

				table.insert(trashButton, #trashButton + 1, v.frame)
				table.remove(self.buttons, i)

				v = nil
				changed = true
			end
		end

		if not changed then
			break
		end
	end
end

function Stuffing:BAG_UPDATE_COOLDOWN()
	for i, v in pairs(self.buttons) do
		self:SlotUpdate(v)
	end
end

function Stuffing:SortOnUpdate(e)
	if not self.elapsed then
		self.elapsed = 0
	end

	if not self.itmax then
		self.itmax = 0
	end


	self.elapsed = self.elapsed + e

	if self.elapsed < 0.1 then
		return
	end

	self.elapsed = 0
	self.itmax = self.itmax + 1

	local changed, blocked = false, false


	if self.sortList == nil or next(self.sortList, nil) == nil then
		-- Wait for all item locks to be released
		local locks = false

		for i, v in pairs(self.buttons) do
			local _, _, l = GetContainerItemInfo(v.bag, v.slot)
			if l then
				locks = true
			else
				v.block = false
			end
		end

		if locks then
			-- Something still locked
			return
		else
			-- All unlocked. get a new table
			self:SetScript("OnUpdate", nil)
			self:SortBags()

			if self.sortList == nil then
				return
			end
		end
	end

	-- Go through the list and move stuff if we can
	for i, v in ipairs(self.sortList) do
		repeat
			if v.ignore then
				blocked = true
				break
			end

			if v.srcSlot.block then
				changed = true
				break
			end

			if v.dstSlot.block then
				changed = true
				break
			end

			local _, _, l1 = GetContainerItemInfo(v.dstSlot.bag, v.dstSlot.slot)
			local _, _, l2 = GetContainerItemInfo(v.srcSlot.bag, v.srcSlot.slot)

			if l1 then
				v.dstSlot.block = true
			end

			if l2 then
				v.srcSlot.block = true
			end

			if l1 or l2 then
				break
			end

			if v.sbag ~= v.dbag or v.sslot ~= v.dslot then
				if v.srcSlot.name ~= v.dstSlot.name then
					v.srcSlot.block = true
					v.dstSlot.block = true
					PickupContainerItem(v.sbag, v.sslot)
					PickupContainerItem(v.dbag, v.dslot)
					changed = true
					break
				end
			end
		until true
	end

	self.sortList = nil

	if (not changed and not blocked) or self.itmax > 250 then
		self:SetScript("OnUpdate", nil)
		self.sortList = nil
		Print(L_BAG_SORTING_BAGS)
	end
end

local function InBags(x)
	if not Stuffing.bags[x] then
		return false
	end

	for _, v in ipairs(Stuffing.sortBags) do
		if x == v then
			return true
		end
	end
	return false
end


function Stuffing:SortBags()
	local free
	local total = 0
	local bagtypeforfree

	if StuffingFrameBank and StuffingFrameBank:IsShown() then
		for i = 5, 11 do
			free, bagtypeforfree = GetContainerNumFreeSlots(i)
			if bagtypeforfree == 0 then
				total = free + total
			end
		end
		total = GetContainerNumFreeSlots(-1) + total
	else
		for i = 0, 4 do
			free, bagtypeforfree = GetContainerNumFreeSlots(i)
			if bagtypeforfree == 0 then
				total = free + total
			end
		end
	end

	if total == 0 then
		print("|cffff0000"..ERROR_CAPS.." - "..ERR_INV_FULL.."|r")
		return
	end

	local bs = self.sortBags
	if #bs < 1 then
		Print(L_BAG_NOTHING_SORT)
		return
	end

	local st = {}
	local bank = false

	Stuffing_Open()

	for i, v in pairs(self.buttons) do
		if InBags(v.bag) then
			self:SlotUpdate(v)

			if v.name then
				local _, cnt, _, _, _, _, clink = GetContainerItemInfo(v.bag, v.slot)
				local n, _, q, iL, rL, c1, c2, _, Sl = GetItemInfo(clink)
				if n == GetItemInfo(6948) then c1 = "1" end	-- Hearthstone
				if n == GetItemInfo(110560) then c1 = "12" end	-- Garrison Hearthstone
				if n == GetItemInfo(64488) then c1 = "1" end	-- The Innkeeper's Daughter
				table.insert(st, {srcSlot = v, sslot = v.slot, sbag = v.bag, sort = q..c1..c2..rL..n..iL..Sl..(#self.buttons - i)})
			end
		end
	end

	-- Sort them
	table.sort(st, function(a, b)
		return a.sort > b.sort
	end)

	-- For each button we want to sort, get a destination button
	if C.bag.SortTop == true then
		--Use this part for sorting from top and down:
		local st_idx = 1
		local dbag = bs[st_idx]
		local dslot = 1
		local max_dslot = GetContainerNumSlots(dbag)

		for i, v in ipairs(st) do
			v.dbag = dbag
			v.dslot = dslot
			v.dstSlot = self:SlotNew(dbag, dslot)

			dslot = dslot + 1
			if dslot > max_dslot then
				dslot = 1
				while true do
					st_idx = st_idx + 1
					if st_idx > #bs then
						break
					end
					dbag = bs[st_idx]
					if Stuffing:BagType(dbag) == ST_NORMAL or dbag > 4 then
						break
					end
				end
				max_dslot = GetContainerNumSlots(dbag)
			end
		end
	else
		-- Next code will sort from bottom up if whanted
		local st_idx = #bs
		local dbag = bs[st_idx]
		local dslot = GetContainerNumSlots(dbag)

		for i, v in ipairs(st) do
			v.dbag = dbag
			v.dslot = dslot
			v.dstSlot = self:SlotNew(dbag, dslot)

			dslot = dslot - 1

			if dslot == 0 then
				while true do
					st_idx = st_idx - 1

					if st_idx < 0 then
						break
					end

					dbag = bs[st_idx]

					if Stuffing:BagType(dbag) == ST_NORMAL or Stuffing:BagType(dbag) == ST_SPECIAL or dbag < 1 then
						break
					end
				end

				dslot = GetContainerNumSlots(dbag)
			end
		end
	end	
	-- Throw various stuff out of the search list
	local changed = true
	while changed do
		changed = false
		-- XXX why doesn't this remove all x->x moves in one pass?

		for i, v in ipairs(st) do
			-- Source is same as destination
			if (v.sslot == v.dslot) and (v.sbag == v.dbag) then
				table.remove(st, i)
				changed = true
			end
		end
	end

	-- Kick off moving of stuff, if needed
	if st == nil or next(st, nil) == nil then
		self:SetScript("OnUpdate", nil)
	else
		self.sortList = st
		self:SetScript("OnUpdate", Stuffing.SortOnUpdate)
	end
end

function Stuffing:RestackOnUpdate(e)
	if not self.elapsed then
		self.elapsed = 0
	end

	self.elapsed = self.elapsed + e

	if self.elapsed < 0.1 then return end

	self.elapsed = 0
	self:Restack()
end

function Stuffing:Restack()
	local st = {}

	Stuffing_Open()

	for i, v in pairs(self.buttons) do
		if InBags(v.bag) then
			local _, cnt, _, _, _, _, clink = GetContainerItemInfo(v.bag, v.slot)
			if clink then
				local n, _, _, _, _, _, _, s = GetItemInfo(clink)

				if n and cnt ~= s then
					if not st[n] then
						st[n] = {{item = v, size = cnt, max = s}}
					else
						table.insert(st[n], {item = v, size = cnt, max = s})
					end
				end
			end
		end
	end

	local did_restack = false

	for i, v in pairs(st) do
		if #v > 1 then
			for j = 2, #v, 2 do
				local a, b = v[j - 1], v[j]
				local _, _, l1 = GetContainerItemInfo(a.item.bag, a.item.slot)
				local _, _, l2 = GetContainerItemInfo(b.item.bag, b.item.slot)

				if l1 or l2 then
					did_restack = true
				else
					PickupContainerItem(a.item.bag, a.item.slot)
					PickupContainerItem(b.item.bag, b.item.slot)
					did_restack = true
				end
			end
		end
	end

	if did_restack then
		self:SetScript("OnUpdate", Stuffing.RestackOnUpdate)
	else
		self:SetScript("OnUpdate", nil)
		Print(L_BAG_STACK_END)
	end
end

function Stuffing:PLAYERBANKBAGSLOTS_CHANGED()
	if not StuffingPurchaseButtonBank then return end
	local _, full = GetNumBankSlots()
	if full then
		StuffingPurchaseButtonBank:Hide()
	else
		StuffingPurchaseButtonBank:Show()
	end
end

function Stuffing.Menu(self, level)
	if not level then return end

	local info = self.info

	wipe(info)

	if level ~= 1 then return end

	wipe(info)
	info.text = BAG_FILTER_CLEANUP.." Blizzard"
	info.notCheckable = 1
	info.func = function()
		if _G["StuffingFrameReagent"] and _G["StuffingFrameReagent"]:IsShown() then
 			SortReagentBankBags()
 		elseif Stuffing.bankFrame and Stuffing.bankFrame:IsShown() then
 			SortBankBags()
 		else
 			SortBags()
 		end
	end
	UIDropDownMenu_AddButton(info, level)

	wipe(info)
	info.text = BAG_FILTER_CLEANUP
	info.notCheckable = 1
	info.func = function()
		Stuffing_Sort("d")
	end
	UIDropDownMenu_AddButton(info, level)

	wipe(info)
	info.text = L_BAG_STACK_MENU
	info.notCheckable = 1
	info.func = function()
		Stuffing:SetBagsForSorting("d")
		Stuffing:Restack()
	end
	UIDropDownMenu_AddButton(info, level)

	wipe(info)
	info.text = L_BAG_SHOW_BAGS
	info.checked = function()
		return bag_bars == 1
	end

	info.func = function()
		if bag_bars == 1 then
			bag_bars = 0
		else
			bag_bars = 1
		end
		Stuffing:Layout()
		if Stuffing.bankFrame and Stuffing.bankFrame:IsShown() then
			Stuffing:Layout(true)
		end
	end
	UIDropDownMenu_AddButton(info, level)

	wipe(info)
	info.disabled = nil
	info.notCheckable = 1
	info.text = CLOSE
	info.func = self.HideMenu
	info.tooltipTitle = CLOSE
	UIDropDownMenu_AddButton(info, level)
end
