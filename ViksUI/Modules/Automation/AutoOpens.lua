local T, C, L = unpack(ViksUI)
if C.automation.open_items ~= true then return end

----------------------------------------------------------------------------------------
--	Auto opening of items in bag (kAutoOpen by Kellett)
----------------------------------------------------------------------------------------
-- Check if currency max limit is close to avoid waste currency
local currencyInfo = C_CurrencyInfo.GetCurrencyInfo(3008)

if currencyInfo.quantity >= (currencyInfo.maxQuantity - 50) then
	PlaySound(SOUNDKIT.RAID_WARNING, "Master")
	RaidNotice_AddMessage(RaidWarningFrame, "Valorstone almost MAX! Auto Open Items canceled!", ChatTypeInfo["RAID_WARNING"])
	print(format("|cffff3300Valorstone almost max! Auto Open Items canceled|r"))
end

local frame, atBank, atMail, atMerchant = CreateFrame("Frame")
frame:SetScript("OnEvent", function(self, event, ...) self[event](...) end)

function frame:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

frame:Register("BANKFRAME_OPENED", function()
	atBank = true
end)

frame:Register("BANKFRAME_CLOSED", function()
	atBank = false
end)

frame:Register("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", function(...)
	local type = ...
	if type == 10 then	-- Guild bank
		atBank = true
	end
end)

frame:Register("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", function(...)
	local type = ...
	if type == 10 then	-- Guild bank
		atBank = false
	end
end)

frame:Register("MAIL_SHOW", function()
	atMail = true
end)

frame:Register("MAIL_CLOSED", function()
	atMail = false
end)

frame:Register("MERCHANT_SHOW", function()
	atMerchant = true
end)

frame:Register("MERCHANT_CLOSED", function()
	atMerchant = false
end)

frame:Register("BAG_UPDATE_DELAYED", function()
	if atBank or atMail or atMerchant then return end
	for bag = 0, 4 do
		for slot = 0, C_Container.GetContainerNumSlots(bag) do
			local _, _, locked, _, _, lootable, _, _, _, id = GetContainerItemInfo(bag, slot)
			if lootable and not locked and id and T.OpenItems[id] then
				if currencyInfo.quantity >= (currencyInfo.maxQuantity - 50) then
					PlaySound(SOUNDKIT.RAID_WARNING, "Master")
					RaidNotice_AddMessage(RaidWarningFrame, "Valorstone close to max! Auto Open Items canceled!", ChatTypeInfo["RAID_WARNING"])
					print(format("|cffff3300Valorstone close to max! Auto Open Items canceled|r"))
				else
					print("|cffff0000"..OPENING..": "..C_Container.GetContainerItemLink(bag, slot)..".|r")
					C_Container.UseContainerItem(bag, slot)
				end
				return
			end
		end
	end
end)