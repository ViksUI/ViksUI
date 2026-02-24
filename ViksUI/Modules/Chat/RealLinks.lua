local T, C, L = unpack(ViksUI)
if C.chat.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Colors links in Battle.net whispers(RealLinks by p3lim) — fixed to avoid calling removed globals
----------------------------------------------------------------------------------------
local queuedMessages = {}

-- localize commonly used functions for speed/safety
local gmatch = string.gmatch
local gsub = string.gsub
local unpack = unpack or table.unpack
local tinsert = table.insert
local ipairs = ipairs

local function GetLinkColor(data)
	local type, arg1, arg2, arg3 = string.split(":", data)
	if type == "item" then
		local _, _, quality = C_Item.GetItemInfo(arg1)
		if quality then
			local _, _, _, color = C_Item.GetItemQualityColor(quality)
			return "|c"..color
		else
			-- item info not available yet; queue the whole message for later
			return nil, true
		end
	elseif type == "quest" then
		if arg2 then
			-- GetQuestDifficultyColor expects a level; keep original behavior
			return ConvertRGBtoColorString(GetQuestDifficultyColor(arg2))
		else
			return "|cffffd100"
		end
	elseif type == "currency" then
		-- trying to obtain a color from currency links is fragile across versions;
		-- use a sensible default color instead of attempting a fragile gsub
		return "|cffffffff"
	elseif type == "battlepet" then
		if arg3 ~= -1 then
			local _, _, _, color = C_Item.GetItemQualityColor(arg3)
			return "|c"..color
		else
			return "|cffffd200"
		end
	elseif type == "garrfollower" then
		local _, _, _, color = C_Item.GetItemQualityColor(arg2)
		return "|c"..color
	elseif type == "spell" then
		return "|cff71d5ff"
	elseif type == "achievement" or type == "garrmission" then
		return "|cffffff00"
	elseif type == "trade" or type == "enchant" then
		return "|cffffd000"
	elseif type == "instancelock" then
		return "|cffff8000"
	elseif type == "glyph" or type == "journal" then
		return "|cff66bbff"
	elseif type == "talent" or type == "battlePetAbil" or type == "garrfollowerability" then
		return "|cff4e96f7"
	elseif type == "levelup" then
		return "|cffff4e00"
	else
		return "|cffffff00"
	end
end

local function MessageFilter(self, event, message, ...)
	-- iterate over links and color them where possible, else queue the message
	for link, data in gmatch(message, "(|H(.-)|h.-|h)") do
		local color, queue = GetLinkColor(data)
		if queue then
			tinsert(queuedMessages, {self, event, message, ...})
			-- returning true prevents the original message from being shown now
			return true
		elseif color then
			local matchLink = "|H"..data.."|h.-|h"
			message = gsub(message, matchLink, color..link.."|r", 1)
		end
	end

	-- return false to allow default handling, and pass the (possibly modified) message
	return false, message, ...
end

local Handler = CreateFrame("Frame")
Handler:RegisterEvent("GET_ITEM_INFO_RECEIVED")
Handler:SetScript("OnEvent", function()
	if #queuedMessages > 0 then
		-- replay queued messages. We call the frame's own OnEvent handler if present,
		-- instead of relying on the removed global ChatFrame_MessageEventHandler.
		for i = 1, #queuedMessages do
			local data = queuedMessages[i]
			if data and type(data) == "table" then
				local frame = data[1]
				-- frame:GetScript may not exist on some objects; guard access
				if frame and frame.GetScript then
					local onEvent = frame:GetScript("OnEvent")
					if type(onEvent) == "function" then
						-- call with the original arguments (frame, event, ...)
						onEvent(unpack(data))
					end
				end
				queuedMessages[i] = nil
			end
		end
		-- compact the queue table
		for i = #queuedMessages, 1, -1 do
			if queuedMessages[i] == nil then
				table.remove(queuedMessages, i)
			end
		end
	end
end)

ChatFrameUtil.AddMessageEventFilter("CHAT_MSG_BN_WHISPER", MessageFilter)
ChatFrameUtil.AddMessageEventFilter("CHAT_MSG_BN_WHISPER_INFORM", MessageFilter)