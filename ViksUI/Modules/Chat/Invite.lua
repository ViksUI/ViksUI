local T, C, L, _ = unpack(select(2, ...))
if C.chat.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Alt Click to Invite player
----------------------------------------------------------------------------------------
hooksecurefunc("SetItemRef", function(link) --Secure hook to avoid taint
	if IsAltKeyDown() then
		local name = strsub(link, 8);
		if (name and (strlen(name) > 0)) then
			local begin, nend = string.find(name, "%s*[^%s:]+");
			if (begin) then
				name = strsub(name, begin, nend);
			end
			local ChatFrameEditBox = ChatEdit_ChooseBoxForSend()
			--local player = link:match("^player:([^:]+)")
			InviteToGroup(name)
			ChatEdit_OnEscapePressed(ChatFrameEditBox) -- Secure hook opens whisper, so closing it.
		end
	end
end)
