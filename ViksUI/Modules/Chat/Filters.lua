local T, C, L = unpack(ViksUI)
if C.chat.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Systems spam filter
----------------------------------------------------------------------------------------
if C.chat.filter == true then
	ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_SAY", function() if IsResting() then return true end end)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_YELL", function() if IsResting() then return true end end)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_JOIN", function() return true end)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE", function() return true end)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_NOTICE", function() return true end)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", function() return true end)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", function() return true end)
	DUEL_WINNER_KNOCKOUT = ""
	DUEL_WINNER_RETREAT = ""
	DRUNK_MESSAGE_ITEM_OTHER1 = ""
	DRUNK_MESSAGE_ITEM_OTHER2 = ""
	DRUNK_MESSAGE_ITEM_OTHER3 = ""
	DRUNK_MESSAGE_ITEM_OTHER4 = ""
	DRUNK_MESSAGE_OTHER1 = ""
	DRUNK_MESSAGE_OTHER2 = ""
	DRUNK_MESSAGE_OTHER3 = ""
	DRUNK_MESSAGE_OTHER4 = ""
	DRUNK_MESSAGE_ITEM_SELF1 = ""
	DRUNK_MESSAGE_ITEM_SELF2 = ""
	DRUNK_MESSAGE_ITEM_SELF3 = ""
	DRUNK_MESSAGE_ITEM_SELF4 = ""
	DRUNK_MESSAGE_SELF1 = ""
	DRUNK_MESSAGE_SELF2 = ""
	DRUNK_MESSAGE_SELF3 = ""
	DRUNK_MESSAGE_SELF4 = ""
	ERR_PET_LEARN_ABILITY_S = ""
	ERR_PET_LEARN_SPELL_S = ""
	ERR_PET_SPELL_UNLEARNED_S = ""
	ERR_LEARN_ABILITY_S = ""
	ERR_LEARN_SPELL_S = ""
	ERR_LEARN_PASSIVE_S = ""
	ERR_SPELL_UNLEARNED_S = ""

	-- Prevent empty line
	local function systemFilter(_, _, text)
		if text and text == "" then
			return true
		end
	end

	ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", systemFilter)
end

----------------------------------------------------------------------------------------
--	Players spam filter(by Evl, Elv22 and Affli)
----------------------------------------------------------------------------------------
if C.chat.spam == true then
	-- Repeat spam filter
	local function repeatMessageFilter(self, _, text, sender)
		sender = Ambiguate(sender, "guild")
		if sender == T.name or UnitIsInMyGuild(sender) then return end
		if not self.repeatMessages or self.repeatCount > 20 then
			self.repeatCount = 0
			self.repeatMessages = {}
		end
		local lastMessage = self.repeatMessages[sender]
		if lastMessage == text then
			return true
		end
		self.repeatMessages[sender] = text
		self.repeatCount = self.repeatCount + 1
	end

	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", repeatMessageFilter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", repeatMessageFilter)

	-- Gold/portals spam filter
	local SpamList = T.ChatSpamList
	local function tradeFilter(_, _, text, sender)
		sender = Ambiguate(sender, "guild")
		if sender == T.name or UnitIsInMyGuild(sender) then return end
		for _, value in pairs(SpamList) do
			if text:lower():match(value) then
				return true
			end
		end
	end

	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", tradeFilter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", tradeFilter)
end