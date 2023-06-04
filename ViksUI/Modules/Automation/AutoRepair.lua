local T, C, L = unpack(ViksUI)
GetContainerNumSlots = _G.GetContainerNumSlots or C_Container.GetContainerNumSlots
GetContainerItemLink = _G.GetContainerItemLink or C_Container.GetContainerItemLink
UseContainerItem = _G.UseContainerItem or C_Container.UseContainerItem
GetContainerItemID = _G.GetContainerItemID or C_Container.GetContainerItemID
----------------------------------------------------------------------------------------
-- Vendor Crap and Auto Repair
----------------------------------------------------------------------------------------
local filter = {
	[6289]  = true, -- Raw Longjaw Mud Snapper
	[6291]  = true, -- Raw Brilliant Smallfish
	[6308]  = true, -- Raw Bristle Whisker Catfish
	[6309]  = true, -- 17 Pound Catfish
	[6310]  = true, -- 19 Pound Catfish
	[41808] = true, -- Bonescale Snapper
	[42336] = true, -- Bloodstone Band
	[42337] = true, -- Sun Rock Ring
	[43244] = true, -- Crystal Citrine Necklace
	[43571] = true, -- Sewer Carp
	[43572] = true, -- Magic Eater
}

local f = CreateFrame("Frame", "ViksUIMerchant")
f:SetScript("OnEvent", function()
	--[[Sell grey and misc items]]--
	if C["automation"]["vendor"] or C["automation"]["vendor_misc"] then
		local c = 0
		local SoldCount = 0
		for b = 0, 4 do
			for s = 1, GetContainerNumSlots(b) do
				local l, lid = GetContainerItemLink(b, s), GetContainerItemID(b, s)
				if l and lid then
					local p = 0
					local mult1, mult2 = select(11, GetItemInfo(l)), select(2, GetContainerItemInfo(b, s))
					if mult1 and mult2 then p = mult1 * mult2 end
					if C["automation"]["vendor"] and select(3, GetItemInfo(l)) == 0 and p > 0 then
						UseContainerItem(b, s)
						SoldCount = SoldCount + 1
						c = c + p
					end
					if C["automation"]["vendor_misc"] and filter[lid] then
						UseContainerItem(b, s)
						SoldCount = SoldCount + 1
						c = c + p
					end
				end
			end
		end
		if c > 0 then
			local g, s, c = math.floor(c / 10000) or 0, math.floor((c%10000) / 100) or 0, c%100
			DEFAULT_CHAT_FRAME:AddMessage("Sold " .. SoldCount .. " items for " .. " |cffffffff" .. g .. "|cffffd700g|r" .. " |cffffffff" .. s .. "|cffc7c7cfs|r" .. " |cffffffff" .. c .. "|cffeda55fc|r" .. ".", 255, 255, 0)
		end
	end

	--[[Autorepair]]--
	if CanMerchantRepair() and C["automation"]["AutoRepair"] then
		local cost, possible = GetRepairAllCost()
		local c = cost % 100
		local s = math.floor((cost % 10000) / 100)
		local g = math.floor(cost / 10000)

		if cost > 0 then
			if IsInGuild() and C["automation"]["AutoRepairG"] then
				local CanGuildRepair = (CanGuildBankRepair() and (cost <= GetGuildBankWithdrawMoney()))
				if CanGuildRepair then
					RepairAllItems(1)
					DEFAULT_CHAT_FRAME:AddMessage("Your items have been repaired by guild funds for" .. " (" .. GUILD .. ") |cffffffff" .. g .. "|cffffd700g|r" .. " |cffffffff" .. s .. "|cffc7c7cfs|r" .. " |cffffffff" .. c .. "|cffeda55fc|r" .. ".", 255, 255, 0)
					return
				end
			end

			if possible then
				RepairAllItems()
				DEFAULT_CHAT_FRAME:AddMessage("Your items have been repaired for" .. " |cffffffff" .. g .. "|cffffd700g|r" .. " |cffffffff" .. s .. "|cffc7c7cfs|r" .. " |cffffffff" .. c .. "|cffeda55fc|r" .. ".", 255, 255, 0)
			else
				DEFAULT_CHAT_FRAME:AddMessage("You don't have enough money for repair!", 255, 0, 0)
			end
		end
	end
end)
f:RegisterEvent("MERCHANT_SHOW")

--[[Buy MaxStack]]--
local savedautomationItemButton_OnModifiedClick = automationItemButton_OnModifiedClick
function automationItemButton_OnModifiedClick(self, ...)
	if IsAltKeyDown() then
		local maxStack = select(8, GetItemInfo(GetautomationItemLink(self:GetID())))
		if maxStack and maxStack > 1 then BuyautomationItem(self:GetID(), GetautomationItemMaxStack(self:GetID())) end
	end
	savedautomationItemButton_OnModifiedClick(self, ...)
end
