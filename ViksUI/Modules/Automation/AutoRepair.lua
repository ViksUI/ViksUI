local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
-- Vendor Crap and Auto Repair
----------------------------------------------------------------------------------------
function Viks:Print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text, 1.0, 0.85, 0.0)
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function()
			local Total = 0
			local SoldCount = 0
			local Rarity = 0
			local ItemPrice = 0
			local ItemCount = 0
			local CurrentItemLink
	if C.automation.vendor then
			for BagID = 0,4 do
				for BagSlot = 1, GetContainerNumSlots(BagID) do
					CurrentItemLink = GetContainerItemLink(BagID, BagSlot)
					if CurrentItemLink then
						_, _, Rarity, _, _, _, _, _, _, _, ItemPrice = GetItemInfo(CurrentItemLink)
						_, ItemCount = GetContainerItemInfo(BagID, BagSlot)
						if Rarity == 0 and ItemPrice ~= 0 then
							Total = Total + (ItemPrice * ItemCount)
							SoldCount = SoldCount + 1
							UseContainerItem(BagID, BagSlot)
						end
					end
				end
			end
		if Total ~= 0 then
		Viks:Print("Sold " .. SoldCount .. " grey items for " .. GetCoinTextureString(Total) .. ".")
	end	
	end

	if C.automation.AutoRepair then
			cost, possible = GetRepairAllCost()
			if cost>0 then
				if possible then
					local c = cost%100
					local s = math.floor((cost%10000)/100)
					local g = math.floor(cost/10000)
						if C.automation.AutoRepairG then 
						RepairAllItems(1)
					DEFAULT_CHAT_FRAME:AddMessage("Your items have been repaired by Guild Funds for".." |cffffffff"..g.."|cffffd700g|r".." |cffffffff"..s.."|cffc7c7cfs|r".." |cffffffff"..c.."|cffeda55fc|r"..".",255,255,0)
						else
						RepairAllItems()
					DEFAULT_CHAT_FRAME:AddMessage("Your items have been repaired for".." |cffffffff"..g.."|cffffd700g|r".." |cffffffff"..s.."|cffc7c7cfs|r".." |cffffffff"..c.."|cffeda55fc|r"..".",255,255,0)
					end
				else
					DEFAULT_CHAT_FRAME:AddMessage("You don't have enough money for repair!",255,0,0)
				end
			end
	end		
end)
f:RegisterEvent("MERCHANT_SHOW")
local savedMerchantItemButton_OnModifiedClick = MerchantItemButton_OnModifiedClick
function MerchantItemButton_OnModifiedClick(self, ...)
	if ( IsAltKeyDown() ) then
		local maxStack = select(8, GetItemInfo(GetMerchantItemLink(self:GetID())))
		local name, texture, price, quantity, numAvailable, isUsable, extendedCost = GetMerchantItemInfo(self:GetID())
		if ( maxStack and maxStack > 1 ) then
			BuyMerchantItem(self:GetID(), floor(maxStack / quantity))
		end
	end
	savedMerchantItemButton_OnModifiedClick(self, ...)
end


-----------------------------------