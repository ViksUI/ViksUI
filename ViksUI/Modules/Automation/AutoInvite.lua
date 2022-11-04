local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	Accept invites from guild members or friend list(by ALZA)
----------------------------------------------------------------------------------------
if C.automation.accept_invite == true then
	local function CheckFriend(inviterGUID)
		if C_BattleNet.GetAccountInfoByGUID(inviterGUID) or C_FriendList.IsFriend(inviterGUID) or IsGuildMember(inviterGUID) then
			return true
		end
	end

	local ai = CreateFrame("Frame")
	ai:RegisterEvent("PARTY_INVITE_REQUEST")
	ai:SetScript("OnEvent", function(_, _, name, _, _, _, _, _, inviterGUID)
		if QueueStatusMinimapButton:IsShown() or GetNumGroupMembers() > 0 then return end
		if CheckFriend(inviterGUID) then
			RaidNotice_AddMessage(RaidWarningFrame, L_INFO_INVITE..name, {r = 0.41, g = 0.8, b = 0.94}, 3)
			print(format("|cffffff00"..L_INFO_INVITE..name..".|r"))
			AcceptGroup()
			for i = 1, STATICPOPUP_NUMDIALOGS do
				local frame = _G["StaticPopup"..i]
				if frame:IsVisible() and frame.which == "PARTY_INVITE" then
					frame.inviteAccepted = 1
					StaticPopup_Hide("PARTY_INVITE")
					return
				elseif frame:IsVisible() and frame.which == "PARTY_INVITE_XREALM" then
					frame.inviteAccepted = 1
					StaticPopup_Hide("PARTY_INVITE_XREALM")
					return
				end
			end
		end
	end)
end

----------------------------------------------------------------------------------------
--	Auto invite by whisper(by Tukz)
----------------------------------------------------------------------------------------
if T.client == "ruRU" then
	C.misc.invite_keyword = "инв inv +"
end

local list_keyword = {}
for word in gmatch(C.misc.invite_keyword, "%S+") do
	list_keyword[word] = true
end

local autoinvite = CreateFrame("Frame")
autoinvite:RegisterEvent("CHAT_MSG_WHISPER")
autoinvite:RegisterEvent("CHAT_MSG_BN_WHISPER")
autoinvite:SetScript("OnEvent", function(_, event, arg1, arg2, ...)
	if not C.misc.whisper_invite then return end
	if ((not UnitExists("party1") or UnitIsGroupLeader("player") or UnitIsGroupAssistant("player"))) and not QueueStatusMinimapButton:IsShown() then
		for word in pairs(list_keyword) do
			if arg1:lower():match(word) then
				if event == "CHAT_MSG_WHISPER" then
					C_PartyInfo.InviteUnit(arg2)
				elseif event == "CHAT_MSG_BN_WHISPER" then
					local bnetIDAccount = select(11, ...)
					local accountInfo = C_BattleNet.GetAccountInfoByID(bnetIDAccount)
					BNInviteFriend(accountInfo.gameAccountInfo.gameAccountID)
				end
			end
		end
	end
end)

SlashCmdList.AUTOINVITE = function(msg)
	if msg == "" then
		if ViksUISettingsPerChar.AutoInvite == true then
			ViksUISettingsPerChar.AutoInvite = false
			print("|cffffff00"..L_INVITE_DISABLE..".|r")
		else
			ViksUISettingsPerChar.AutoInvite = true
			print("|cffffff00"..L_INVITE_ENABLE..C.misc.invite_keyword..".|r")
			C.misc.invite_keyword = C.misc.invite_keyword
		end
	else
		ViksUISettingsPerChar.AutoInvite = true
		print("|cffffff00"..L_INVITE_ENABLE..msg..".|r")
		C.misc.invite_keyword = msg
	end
end
SLASH_AUTOINVITE1 = "/ainv"
SLASH_AUTOINVITE2 = "/фштм"
