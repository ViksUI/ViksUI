local T, C, L = unpack(ViksUI)
if C.trade.disenchanting ~= true then return end

----------------------------------------------------------------------------------------
--	One-click Milling, Prospecting and Disenchanting(Molinari by p3lim)
----------------------------------------------------------------------------------------

-- AutoCastShine was removed from the game in 11.x, this is just a fork
local sparkles = CreateFrame("Frame")
sparkles:Hide()
sparkles.orbs = {}

for _ = 1, 4 do
	for mult = 3, 0, -1 do
		local orb = sparkles:CreateTexture(nil, "OVERLAY")
		orb:SetPoint("CENTER")
		orb:SetSize(12 + (9 * mult), 12 + (9 * mult)) -- 3x larger than the original template
		orb:SetTexture([[Interface\ItemSocketingFrame\UI-ItemSockets]])
		orb:SetTexCoord(0.3984375, 0.4453125, 0.40234375, 0.44921875)
		orb:SetBlendMode("ADD")
		table.insert(sparkles.orbs, orb)
	end
end

local timers = {0, 0, 0, 0}
local speeds = {2, 4, 6, 8}
sparkles:SetScript("OnUpdate", function(self, elapsed)
	for index in next, timers do
		timers[index] = timers[index] + elapsed

		if timers[index] > speeds[index] * 4 then
			timers[index] = 0
		end
	end

	local parent = self:GetParent()
	local distance = parent:GetWidth()
	for index = 1, 4 do
		local timer = timers[index]
		local speed = speeds[index]

		if timer <= speed then
			local position = timer / speed * distance
			self.orbs[0 + index]:SetPoint("CENTER", parent, "TOPLEFT", position, 0)
			self.orbs[4 + index]:SetPoint("CENTER", parent, "BOTTOMRIGHT", -position, 0)
			self.orbs[8 + index]:SetPoint("CENTER", parent, "TOPRIGHT", 0, -position)
			self.orbs[12 + index]:SetPoint("CENTER", parent, "BOTTOMLEFT", 0, position)
		elseif timer <= speed * 2 then
			local position = (timer - speed) / speed * distance
			self.orbs[0 + index]:SetPoint("CENTER", parent, "TOPRIGHT", 0, -position)
			self.orbs[4 + index]:SetPoint("CENTER", parent, "BOTTOMLEFT", 0, position)
			self.orbs[8 + index]:SetPoint("CENTER", parent, "BOTTOMRIGHT", -position, 0)
			self.orbs[12 + index]:SetPoint("CENTER", parent, "TOPLEFT", position, 0)
		elseif timer <= speed * 3 then
			local position = (timer - speed * 2) / speed * distance
			self.orbs[0 + index]:SetPoint("CENTER", parent, "BOTTOMRIGHT", -position, 0)
			self.orbs[4 + index]:SetPoint("CENTER", parent, "TOPLEFT", position, 0)
			self.orbs[8 + index]:SetPoint("CENTER", parent, "BOTTOMLEFT", 0, position)
			self.orbs[12 + index]:SetPoint("CENTER", parent, "TOPRIGHT", 0, -position)
		else
			local position = (timer - speed * 3) / speed * distance
			self.orbs[0 + index]:SetPoint("CENTER", parent, "BOTTOMLEFT", 0, position)
			self.orbs[4 + index]:SetPoint("CENTER", parent, "TOPRIGHT", 0, -position)
			self.orbs[8 + index]:SetPoint("CENTER", parent, "TOPLEFT", position, 0)
			self.orbs[12 + index]:SetPoint("CENTER", parent, "BOTTOMRIGHT", -position, 0)
		end
	end
end)

local function StartSparkles(parent, r, g, b)
	sparkles:SetParent(parent)
	sparkles:SetAllPoints()

	for _, orb in next, sparkles.orbs do
		orb:SetVertexColor(r, g, b)
	end

	sparkles:Show()
end

local function StopSparkles()
	sparkles:Hide()
end

local button = CreateFrame("Button", "OneClickMPD", UIParent, "SecureActionButtonTemplate")
button:RegisterForClicks("AnyUp", "AnyDown")
button:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
button:RegisterEvent("PLAYER_LOGIN")

local enchantingItems = {
	[137195] = true, -- Highmountain Armor
	[137221] = true, -- Enchanted Raven Sigil
	[137286] = true, -- Fel-Crusted Rune
	[181991] = true, -- Antique Stalker's Bow
	[182021] = true, -- Antique Kyrian Javelin
	[182043] = true, -- Antique Necromancer's Staff
	[182067] = true, -- Antique Duelist's Rapier
	[198675] = true, -- Lava-Infused Seed
	[198689] = true, -- Stormbound Horn
	[198694] = true, -- Enriched Earthen Shard
	[198798] = true, -- Flashfrozen Scroll
	[198799] = true, -- Forgotten Arcane Tome
	[198800] = true, -- Fractured Titanic Sphere
	[200479] = true, -- Sophic Amalgamation
	[200939] = true, -- Chromatic Pocketwatch
	[200940] = true, -- Everflowing Inkwell
	[200941] = true, -- Seal of Order
	[200942] = true, -- Vibrant Emulsion
	[200943] = true, -- Whispering Band
	[200945] = true, -- Valiant Hammer
	[200946] = true, -- Thunderous Blade
	[200947] = true, -- Carving of Awakening
	[201356] = true, -- Glimmer of Fire
	[201357] = true, -- Glimmer of Frost
	[201358] = true, -- Glimmer of Air
	[201359] = true, -- Glimmer of Earth
	[201360] = true, -- Glimmer of Order
	[204990] = true, -- Lava-Drenched Shadow Crystal
	[204999] = true, -- Shimmering Aqueous Orb
	[205001] = true, -- Resonating Arcane Crystal
}

function button:PLAYER_LOGIN()
	local disenchanter, rogue

	if C_SpellBook.IsSpellKnown(13262) then
		disenchanter = true
	end

	if C_SpellBook.IsSpellKnown(1804) then
		rogue = ITEM_MIN_SKILL:gsub("%%s", (T.client == "ruRU" and "Взлом замков" or GetSpellInfo(1809))):gsub("%%d", "%(.*%)")
	end

	local function OnTooltipSetUnit(self, data)
		if self ~= GameTooltip or self:IsForbidden() then return end
		local _, link = TooltipUtil.GetDisplayedItem(self)

		if link and not InCombatLockdown() and IsAltKeyDown() and not (AuctionHouseFrame and AuctionHouseFrame:IsShown()) then
			local itemID = GetItemInfoFromHyperlink(link)
			if not itemID then return end
			local spell, r, g, b
			if disenchanter then
				if enchantingItems[itemID] then
					spell, r, g, b = GetSpellInfo(13262), 0.5, 0.5, 1
				else
					local _, _, quality, _, _, _, _, _, _, _, _, class, subClass = C_Item.GetItemInfo(link)
					if quality and ((quality >= Enum.ItemQuality.Uncommon and quality <= Enum.ItemQuality.Epic)
						and C_Item.GetItemInventoryTypeByID(itemID) ~= Enum.InventoryType.IndexBodyType
						and (class == Enum.ItemClass.Weapon
							or (class == Enum.ItemClass.Armor and subClass ~= Enum.ItemClass.Cosmetic)
							or (class == Enum.ItemClass.Gem and subClass == 11)
							or class == Enum.ItemClass.Profession)) then
						spell, r, g, b = GetSpellInfo(13262), 0.5, 0.5, 1
					end
				end
			elseif rogue then
				for index = 1, self:NumLines() do
					if string.match(_G["GameTooltipTextLeft"..index]:GetText() or "", rogue) then
						spell, r, g, b = GetSpellInfo(1804), 0, 1, 1
					end
				end
			end

			if data.guid then
				local location = C_Item.GetItemLocation(data.guid)
				if location and location:IsBagAndSlot() then
					local bagID, slotID = location:GetBagAndSlot()
					if spell and C_Container.GetContainerItemLink(bagID, slotID) == link then
						button:SetAttribute("macrotext", string.format("/cast %s\n/use %s %s", spell, bagID, slotID))
						local slot = self:GetOwner()
						button:SetPoint("TOPLEFT", slot, "TOPLEFT", 2, 0)
						button:SetPoint("BOTTOMRIGHT", slot, "BOTTOMRIGHT", 2, 0)
						button:Show()
						StartSparkles(button, r, g, b)
					end
				end
			end
		end
	end

	TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetUnit)

	self:SetFrameStrata("TOOLTIP")
	self:SetAttribute("*type1", "macro")
	self:SetScript("OnLeave", self.MODIFIER_STATE_CHANGED)

	self:RegisterEvent("MODIFIER_STATE_CHANGED")
	self:Hide()
end

function button:MODIFIER_STATE_CHANGED(key)
	if not self:IsShown() and not key and key ~= "LALT" and key ~= "RALT" then return end

	if InCombatLockdown() then
		self:SetAlpha(0)
		self:RegisterEvent("PLAYER_REGEN_ENABLED")
	else
		self:ClearAllPoints()
		self:SetAlpha(1)
		self:Hide()
		StopSparkles(self)
	end
end

function button:PLAYER_REGEN_ENABLED()
	self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	self:MODIFIER_STATE_CHANGED()
end