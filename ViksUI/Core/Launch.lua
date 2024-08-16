local T, C, L = unpack(ViksUI)

T.ChatSetup = function()
	local chats = _G.CHAT_FRAMES
	FCF_ResetChatWindows()

	-- force initialize the tts chat (it doesn't get shown unless you use it)
	local voiceChat = _G[chats[3]]
	FCF_ResetChatWindow(voiceChat, VOICE)
	FCF_DockFrame(voiceChat, 3)
	FCF_SetWindowName(ChatFrame1,"Party & Guild")

	local rightChat = FCF_OpenNewWindow(LOOT)
	FCF_UnDockFrame(rightChat)

	for id, name in next, chats do
		local frame = _G[name]

		if id == 1 then
			frame:ClearAllPoints()
			frame:SetWidth(LChat:GetWidth()-8)
			frame:SetHeight(LChat:GetHeight()-8)
			frame:SetPoint("BOTTOMLEFT",LChat,"BOTTOMLEFT",4,6)
			frame:SetPoint("TOPRIGHT",LChat,"TOPRIGHT",-4,-2)
		elseif id == 2 then
			FCF_SetWindowName(frame, GUILD_EVENT_LOG)
		elseif id == 3 then
			VoiceTranscriptionFrame_UpdateVisibility(frame)
			VoiceTranscriptionFrame_UpdateVoiceTab(frame)
			VoiceTranscriptionFrame_UpdateEditBox(frame)
		elseif id == 4 then
			frame:ClearAllPoints()
			frame:SetWidth(RChat:GetWidth()-8)
			frame:SetHeight(RChat:GetHeight()-8)
			frame:SetPoint("BOTTOMLEFT",RChat,"BOTTOMLEFT",4,4)
			frame:SetPoint("TOPRIGHT",RChat,"TOPRIGHT",-4,-2)
			FCF_SetWindowName(frame, LOOT..' / '..TRADE)
		end

		FCF_SetChatWindowFontSize(nil, frame, 12)
		FCF_SavePositionAndDimensions(frame)
		FCF_StopDragging(frame)
	end

	-- keys taken from `ChatTypeGroup` but doesnt add: 'OPENING', 'TRADESKILLS', 'PET_INFO', 'COMBAT_MISC_INFO', 'COMMUNITIES_CHANNEL', 'PET_BATTLE_COMBAT_LOG', 'PET_BATTLE_INFO', 'TARGETICONS'
	local chatGroup = { 'SYSTEM', 'CHANNEL', 'SAY', 'EMOTE', 'YELL', 'WHISPER', 'PARTY', 'PARTY_LEADER', 'RAID', 'RAID_LEADER', 'RAID_WARNING', 'INSTANCE_CHAT', 'INSTANCE_CHAT_LEADER', 'GUILD', 'OFFICER', 'MONSTER_SAY', 'MONSTER_YELL', 'MONSTER_EMOTE', 'MONSTER_WHISPER', 'MONSTER_BOSS_EMOTE', 'MONSTER_BOSS_WHISPER', 'ERRORS', 'AFK', 'DND', 'IGNORED', 'BG_HORDE', 'BG_ALLIANCE', 'BG_NEUTRAL', 'ACHIEVEMENT', 'GUILD_ACHIEVEMENT', 'BN_WHISPER', 'BN_INLINE_TOAST_ALERT' }
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame1)
	for _, v in next, chatGroup do
		ChatFrame_AddMessageGroup(_G.ChatFrame1, v)
	end

	-- keys taken from `ChatTypeGroup` which weren't added above to ChatFrame1 but keeping CHANNEL
	chatGroup = { WOW_PROJECT_MAINLINE and 'PING' or nil, 'CHANNEL', 'COMBAT_XP_GAIN', 'COMBAT_HONOR_GAIN', 'COMBAT_FACTION_CHANGE', 'SKILL', 'LOOT', 'CURRENCY', 'MONEY' }
	ChatFrame_RemoveAllMessageGroups(rightChat)
	for _, v in next, chatGroup do
		ChatFrame_AddMessageGroup(rightChat, v)
	end

	ChatFrame_AddChannel(_G.ChatFrame1, GENERAL)
	ChatFrame_RemoveChannel(_G.ChatFrame1, TRADE)
	ChatFrame_AddChannel(rightChat, TRADE)

	-- set the chat groups names in class color to enabled for all chat groups which players names appear
	chatGroup = { 'SAY', 'EMOTE', 'YELL', 'WHISPER', 'PARTY', 'PARTY_LEADER', 'RAID', 'RAID_LEADER', 'RAID_WARNING', 'INSTANCE_CHAT', 'INSTANCE_CHAT_LEADER', 'GUILD', 'OFFICER', 'ACHIEVEMENT', 'GUILD_ACHIEVEMENT', 'COMMUNITIES_CHANNEL' }
	for i = 1, _G.MAX_WOW_CHAT_CHANNELS do
		tinsert(chatGroup, 'CHANNEL'..i)
	end
	for _, v in next, chatGroup do
		ToggleChatColorNamesByClassGroup(true, v)
	end

	-- Adjust Chat Colors
	ChangeChatColor("CHANNEL1", 195/255, 230/255, 232/255)
	ChangeChatColor("CHANNEL2", 232/255, 158/255, 121/255)
	ChangeChatColor("CHANNEL3", 232/255, 228/255, 121/255)
	ChangeChatColor("CHANNEL4", 232/255, 228/255, 121/255)
	ChangeChatColor("CHANNEL5", 0/255, 228/255, 121/255)
	ChangeChatColor("CHANNEL6", 0/255, 228/255, 0/255)
end

local function cvarsetup()
	SetCVar("statusTextDisplay", "BOTH")
	SetCVar("screenshotQuality", 8)
	SetCVar("cameraDistanceMaxZoomFactor", 2.6)
	SetCVar("showTutorials", 0)
	SetCVar("gameTip", "0")
	SetCVar("UberTooltips", 1)
	SetCVar("chatMouseScroll", 1)
	SetCVar("removeChatDelay", 1)
	SetCVar("showVKeyCastbar", 1)
	SetCVar("chatStyle", "classic")
	SetCVar("WholeChatWindowClickable", 0)
	SetCVar("WhisperMode", "inline")
	SetCVar("colorblindMode", 0)
	SetCVar("lootUnderMouse", 0)
	SetCVar("autoLootDefault", 1)
	SetCVar("RotateMinimap", 0)
	SetCVar("autoQuestWatch", 1)
	SetCVar("autoQuestProgress", 1)
	SetCVar("scriptErrors", 1)
	SetCVar("taintLog", 0)
	SetCVar("countdownForCooldowns", 1)
	SetCVar("alwaysShowActionBars", 1)
	SetCVar("buffDurations", 1)
	SetCVar("autoOpenLootHistory", 0)
	SetCVar("violenceLevel", 5)
	SetCVar("lossOfControl", 0)
	SetCVar("threatWarning", 3)
	SetCVar('SpamFilter', 0)
	SetCVar("instantQuestText", 1)
	SetCVar("nameplateMotion", 0)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("nameplateShowAll", 1)
	SetCVar("nameplateShowEnemies", 1)
	SetCVar("nameplateShowEnemyMinions", 1)
	SetCVar("nameplateShowEnemyMinus", 1)
	SetCVar("nameplateShowFriends", 0)
	SetCVar("nameplateShowFriendlyMinions", 0)
	SetCVar("nameplateShowFriendlyNPCs", 1)
	SetCVar("nameplateMaxDistance", 60)
	SetCVar("nameplateResourceOnTarget", 0)
	SetCVar("nameplateShowSelf", 0)
	SetCVar("cameraSmoothStyle", 0)
	SetCVar('showQuestTrackingTooltips', 1)
	SetCVar("profanityFilter", 0)
	SetCVar('fstack_preferParentKeys', 0) --Add back the frame names via fstack!

	-- Reset saved variables on char
	ViksUISettingsPerChar = {}

	ViksUISettingsPerChar.Install = true
	ViksUISettingsPerChar.FogOfWar = true
	ViksUISettingsPerChar.Coords = true
	ViksUISettingsPerChar.AutoInvite = false
	ViksUISettingsPerChar.Archaeology = false
	ViksUISettingsPerChar.BarsLocked = false
	ViksUISettingsPerChar.SplitBars = true
	ViksUISettingsPerChar.RightBars = C.actionbar.rightbars
	ViksUISettingsPerChar.BottomBars = C.actionbar.bottombars

	-- Set to default layout of Blizzard Edit Mode
	C_EditMode.SetActiveLayout(1)
end

local UploadBartender = function()
	Bartender4DB = {
		["namespaces"] = {
			["StatusTrackingBar"] = {
			},
			["APBar"] = {
			},
			["ActionBars"] = {
				["profiles"] = {
					["ViksUIDruid"] = {
						["actionbars"] = {
							{
								["position"] = {
									["y"] = 125,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["padding"] = 8,
								["version"] = 3,
								["showgrid"] = true,
							}, -- [1]
							{
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["fadeoutalpha"] = 0.3,
								["showgrid"] = true,
								["position"] = {
									["y"] = 82,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["padding"] = 8,
								["version"] = 3,
								["states"] = {
									["enabled"] = true,
									["default"] = 2,
								},
							}, -- [2]
							{
								["hidemacrotext"] = true,
								["position"] = {
									["y"] = 180,
									["x"] = 624,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 6,
								["rows"] = 6,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [3]
							{
								["hidemacrotext"] = true,
								["position"] = {
									["y"] = 112.5,
									["x"] = -372,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 3,
								["rows"] = 2,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [4]
							{
								["hidemacrotext"] = true,
								["position"] = {
									["y"] = 113,
									["x"] = 279,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 3,
								["rows"] = 2,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [5]
							{
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 11,
								["rows"] = 6,
								["position"] = {
									["y"] = 144.5,
									["x"] = 351.5,
									["point"] = "CENTER",
								},
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [6]
							{
								["position"] = {
									["y"] = 120,
									["x"] = 466,
									["point"] = "CENTER",
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 11,
								["rows"] = 6,
								["visibility"] = {
									["custom"] = false,
									["customdata"] = "[mod:ctrl]show;hide",
								},
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [7]
							{
								["hidemacrotext"] = true,
								["position"] = {
									["y"] = 112.5,
									["x"] = -372,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 3,
								["rows"] = 2,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [8]
							{
								["hidemacrotext"] = true,
								["position"] = {
									["y"] = 180,
									["x"] = 624,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 6,
								["rows"] = 6,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [9]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 7,
								["version"] = 3,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["padding"] = 6,
								["hidemacrotext"] = true,
								["position"] = {
									["y"] = 180,
									["x"] = -654.5,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["buttons"] = 6,
							}, -- [10]
						},
					},
					["ViksUILine"] = {
						["actionbars"] = {
							{
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 8,
								["position"] = {
									["y"] = 125,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["states"] = {
									["stance"] = {
										["ROGUE"] = {
											["stealth"] = 3,
										},
									},
								},
							}, -- [1]
							{
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["fadeoutalpha"] = 0.3,
								["showgrid"] = true,
								["position"] = {
									["y"] = 82,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["padding"] = 8,
								["version"] = 3,
								["states"] = {
									["enabled"] = true,
									["default"] = 2,
								},
							}, -- [2]
							{
								["version"] = 3,
								["fadeout"] = true,
								["showgrid"] = true,
								["position"] = {
									["y"] = 116.5,
									["x"] = 0.4,
									["point"] = "LEFT",
									["scale"] = 0.8,
								},
								["padding"] = 9,
								["alpha"] = 0.5,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [3]
							{
								["version"] = 3,
								["fadeout"] = true,
								["showgrid"] = true,
								["position"] = {
									["y"] = 82,
									["x"] = 0.4,
									["point"] = "LEFT",
									["scale"] = 0.8,
								},
								["padding"] = 9,
								["alpha"] = 0.5,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [4]
							{
								["padding"] = 3,
								["position"] = {
									["y"] = 113,
									["x"] = 279,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["version"] = 3,
								["showgrid"] = true,
								["hidemacrotext"] = true,
								["rows"] = 2,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [5]
							{
								["padding"] = 8,
								["fadeout"] = true,
								["showgrid"] = true,
								["position"] = {
									["y"] = 201.4,
									["x"] = -35,
									["point"] = "RIGHT",
									["scale"] = 0.76,
								},
								["rows"] = 12,
								["version"] = 3,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [6]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 6,
								["fadeoutalpha"] = 0.3,
								["fadeout"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["position"] = {
									["y"] = 144.5,
									["x"] = 351.5,
									["point"] = "CENTER",
								},
								["padding"] = 11,
								["visibility"] = {
									["custom"] = false,
									["customdata"] = "[mod:ctrl]show;hide",
								},
								["version"] = 3,
							}, -- [7]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 2,
								["version"] = 3,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["hidemacrotext"] = true,
								["padding"] = 3,
								["position"] = {
									["y"] = 112.5,
									["x"] = -372,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["buttons"] = 6,
							}, -- [8]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 6,
								["hidemacrotext"] = true,
								["fadeout"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["position"] = {
									["y"] = 187,
									["x"] = 524,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["padding"] = 6,
								["version"] = 3,
								["buttons"] = 6,
							}, -- [9]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 7,
								["hidemacrotext"] = true,
								["fadeout"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["position"] = {
									["y"] = 188,
									["x"] = -557,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["padding"] = 6,
								["version"] = 3,
								["buttons"] = 6,
							}, -- [10]
						},
					},
					["ViksUIDruidLine"] = {
						["actionbars"] = {
							{
								["position"] = {
									["y"] = 125,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["padding"] = 8,
								["version"] = 3,
								["showgrid"] = true,
							}, -- [1]
							{
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["fadeoutalpha"] = 0.3,
								["showgrid"] = true,
								["position"] = {
									["y"] = 82,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["padding"] = 8,
								["version"] = 3,
								["states"] = {
									["enabled"] = true,
									["default"] = 2,
								},
							}, -- [2]
							{
								["showgrid"] = true,
								["rows"] = 6,
								["padding"] = 6,
								["fadeout"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["position"] = {
									["y"] = 188,
									["x"] = 524,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["hidemacrotext"] = true,
								["version"] = 3,
								["buttons"] = 6,
							}, -- [3]
							{
								["padding"] = 3,
								["position"] = {
									["y"] = 112.5,
									["x"] = -372,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["version"] = 3,
								["showgrid"] = true,
								["hidemacrotext"] = true,
								["rows"] = 2,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [4]
							{
								["padding"] = 3,
								["position"] = {
									["y"] = 113,
									["x"] = 279,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["version"] = 3,
								["showgrid"] = true,
								["hidemacrotext"] = true,
								["rows"] = 2,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [5]
							{
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 11,
								["rows"] = 6,
								["position"] = {
									["y"] = 144.5,
									["x"] = 351.5,
									["point"] = "CENTER",
								},
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [6]
							{
								["position"] = {
									["y"] = 144.5,
									["x"] = 351.5,
									["point"] = "CENTER",
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 11,
								["rows"] = 6,
								["visibility"] = {
									["custom"] = false,
									["customdata"] = "[mod:ctrl]show;hide",
								},
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [7]
							{
								["padding"] = 3,
								["position"] = {
									["y"] = 112.5,
									["x"] = -372,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["version"] = 3,
								["showgrid"] = true,
								["hidemacrotext"] = true,
								["rows"] = 2,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [8]
							{
								["padding"] = 6,
								["position"] = {
									["y"] = 180,
									["x"] = 624,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["version"] = 3,
								["showgrid"] = true,
								["hidemacrotext"] = true,
								["rows"] = 6,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [9]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 7,
								["padding"] = 6,
								["fadeout"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["position"] = {
									["y"] = 188,
									["x"] = -557,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["hidemacrotext"] = true,
								["version"] = 3,
								["buttons"] = 6,
							}, -- [10]
						},
					},
					["ViksUIRogue"] = {
						["actionbars"] = {
							{
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 8,
								["position"] = {
									["y"] = 125,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["states"] = {
									["stance"] = {
										["ROGUE"] = {
											["stealth"] = 3,
										},
									},
								},
							}, -- [1]
							{
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["fadeoutalpha"] = 0.3,
								["showgrid"] = true,
								["position"] = {
									["y"] = 82,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["padding"] = 8,
								["version"] = 3,
								["states"] = {
									["enabled"] = true,
									["default"] = 2,
								},
							}, -- [2]
							{
								["enabled"] = false,
								["version"] = 3,
								["showgrid"] = true,
								["position"] = {
									["y"] = 116.5,
									["x"] = 0.4,
									["point"] = "LEFT",
									["scale"] = 0.8,
								},
								["padding"] = 9,
								["alpha"] = 0.5,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [3]
							{
								["version"] = 3,
								["showgrid"] = true,
								["position"] = {
									["y"] = 82,
									["x"] = 0.4,
									["point"] = "LEFT",
									["scale"] = 0.8,
								},
								["padding"] = 9,
								["alpha"] = 0.5,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [4]
							{
								["hidemacrotext"] = true,
								["position"] = {
									["y"] = 113,
									["x"] = 279,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 3,
								["rows"] = 2,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [5]
							{
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 8,
								["rows"] = 12,
								["position"] = {
									["y"] = 201.4,
									["x"] = -35,
									["point"] = "RIGHT",
									["scale"] = 0.76,
								},
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [6]
							{
								["enabled"] = true,
								["position"] = {
									["y"] = 144.5,
									["x"] = 351.5,
									["point"] = "CENTER",
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 11,
								["rows"] = 6,
								["visibility"] = {
									["custom"] = false,
									["customdata"] = "[mod:ctrl]show;hide",
								},
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [7]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 2,
								["version"] = 3,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["hidemacrotext"] = true,
								["padding"] = 3,
								["position"] = {
									["y"] = 112.5,
									["x"] = -372,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["buttons"] = 6,
							}, -- [8]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 6,
								["version"] = 3,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["hidemacrotext"] = true,
								["padding"] = 6,
								["position"] = {
									["y"] = 180,
									["x"] = 624,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["buttons"] = 6,
							}, -- [9]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 7,
								["version"] = 3,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["hidemacrotext"] = true,
								["padding"] = 6,
								["position"] = {
									["y"] = 180,
									["x"] = -654.5,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["buttons"] = 6,
							}, -- [10]
						},
					},
					["ViksUI"] = {
						["actionbars"] = {
							{
								["showgrid"] = true,
								["version"] = 3,
								["position"] = {
									["y"] = 125,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["padding"] = 8,
								["states"] = {
									["stance"] = {
										["ROGUE"] = {
											["stealth"] = 3,
										},
									},
								},
							}, -- [1]
							{
								["showgrid"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["version"] = 3,
								["fadeoutalpha"] = 0.3,
								["position"] = {
									["y"] = 82,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["padding"] = 8,
								["states"] = {
									["enabled"] = true,
									["default"] = 2,
								},
							}, -- [2]
							{
								["showgrid"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["alpha"] = 0.5,
								["version"] = 3,
								["position"] = {
									["y"] = 116.5,
									["x"] = 0.4,
									["point"] = "LEFT",
									["scale"] = 0.8,
								},
								["padding"] = 9,
							}, -- [3]
							{
								["showgrid"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["alpha"] = 0.5,
								["version"] = 3,
								["position"] = {
									["y"] = 82,
									["x"] = 0.4,
									["point"] = "LEFT",
									["scale"] = 0.8,
								},
								["padding"] = 9,
							}, -- [4]
							{
								["showgrid"] = true,
								["rows"] = 2,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["buttons"] = 6,
								["hidemacrotext"] = true,
								["version"] = 3,
								["position"] = {
									["y"] = 113,
									["x"] = 279,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["padding"] = 3,
							}, -- [5]
							{
								["showgrid"] = true,
								["rows"] = 12,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["version"] = 3,
								["position"] = {
									["y"] = 201.4,
									["x"] = -35,
									["point"] = "RIGHT",
									["scale"] = 0.76,
								},
								["padding"] = 8,
							}, -- [6]
							{
								["showgrid"] = true,
								["rows"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["enabled"] = true,
								["version"] = 3,
								["position"] = {
									["y"] = 144.5,
									["x"] = 351.5,
									["point"] = "CENTER",
								},
								["padding"] = 11,
								["visibility"] = {
									["custom"] = false,
									["customdata"] = "[mod:ctrl]show;hide",
								},
							}, -- [7]
							{
								["showgrid"] = true,
								["rows"] = 2,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["enabled"] = true,
								["buttons"] = 6,
								["padding"] = 3,
								["version"] = 3,
								["position"] = {
									["y"] = 112.5,
									["x"] = -372,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["hidemacrotext"] = true,
							}, -- [8]
							{
								["showgrid"] = true,
								["rows"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["enabled"] = true,
								["buttons"] = 6,
								["padding"] = 6,
								["version"] = 3,
								["position"] = {
									["y"] = 180,
									["x"] = 624,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["hidemacrotext"] = true,
							}, -- [9]
							{
								["showgrid"] = true,
								["rows"] = 7,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["enabled"] = true,
								["buttons"] = 6,
								["padding"] = 6,
								["version"] = 3,
								["position"] = {
									["y"] = 180,
									["x"] = -654.5,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["hidemacrotext"] = true,
							}, -- [10]
						},
					},
					["ViksUIRogueLine"] = {
						["actionbars"] = {
							{
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 8,
								["position"] = {
									["y"] = 125,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["states"] = {
									["stance"] = {
										["ROGUE"] = {
											["stealth"] = 3,
										},
									},
								},
							}, -- [1]
							{
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["fadeoutalpha"] = 0.3,
								["showgrid"] = true,
								["position"] = {
									["y"] = 82,
									["x"] = -265.5,
									["point"] = "BOTTOM",
								},
								["padding"] = 8,
								["version"] = 3,
								["states"] = {
									["enabled"] = true,
									["default"] = 2,
								},
							}, -- [2]
							{
								["enabled"] = false,
								["version"] = 3,
								["showgrid"] = true,
								["position"] = {
									["y"] = 116.5,
									["x"] = 0.4,
									["point"] = "LEFT",
									["scale"] = 0.8,
								},
								["padding"] = 9,
								["alpha"] = 0.5,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [3]
							{
								["version"] = 3,
								["fadeout"] = true,
								["showgrid"] = true,
								["position"] = {
									["y"] = 82,
									["x"] = 0.4,
									["point"] = "LEFT",
									["scale"] = 0.8,
								},
								["padding"] = 9,
								["alpha"] = 0.5,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [4]
							{
								["hidemacrotext"] = true,
								["position"] = {
									["y"] = 113,
									["x"] = 279,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["version"] = 3,
								["showgrid"] = true,
								["padding"] = 3,
								["rows"] = 2,
								["buttons"] = 6,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [5]
							{
								["padding"] = 8,
								["fadeout"] = true,
								["showgrid"] = true,
								["position"] = {
									["y"] = 201.4,
									["x"] = -35,
									["point"] = "RIGHT",
									["scale"] = 0.76,
								},
								["rows"] = 12,
								["version"] = 3,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
							}, -- [6]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 6,
								["fadeoutalpha"] = 0.3,
								["fadeout"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["position"] = {
									["y"] = 144.5,
									["x"] = 351.5,
									["point"] = "CENTER",
								},
								["padding"] = 11,
								["visibility"] = {
									["custom"] = false,
									["customdata"] = "[mod:ctrl]show;hide",
								},
								["version"] = 3,
							}, -- [7]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 2,
								["version"] = 3,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["padding"] = 3,
								["hidemacrotext"] = true,
								["position"] = {
									["y"] = 112.5,
									["x"] = -372,
									["point"] = "BOTTOM",
									["scale"] = 0.75,
								},
								["buttons"] = 6,
							}, -- [8]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 6,
								["padding"] = 6,
								["fadeout"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["position"] = {
									["y"] = 188,
									["x"] = 524,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["hidemacrotext"] = true,
								["version"] = 3,
								["buttons"] = 6,
							}, -- [9]
							{
								["enabled"] = true,
								["showgrid"] = true,
								["rows"] = 7,
								["padding"] = 6,
								["fadeout"] = true,
								["skin"] = {
									["ID"] = "ViksUI: Buttons",
									["Backdrop"] = false,
								},
								["position"] = {
									["y"] = 188,
									["x"] = -557,
									["point"] = "BOTTOM",
									["scale"] = 0.7,
								},
								["hidemacrotext"] = true,
								["version"] = 3,
								["buttons"] = 6,
							}, -- [10]
						},
					},
				},
			},
			["LibDualSpec-1.0"] = {
			},
			["ExtraActionBar"] = {
				["profiles"] = {
					["ViksUIDruid"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["position"] = {
							["y"] = -45,
							["x"] = 340,
							["point"] = "CENTER",
							["scale"] = 1.5,
						},
					},
					["ViksUILine"] = {
						["position"] = {
							["y"] = -45,
							["x"] = 340,
							["point"] = "CENTER",
							["scale"] = 1.5,
						},
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUIDruidLine"] = {
						["position"] = {
							["y"] = -45,
							["x"] = 340,
							["point"] = "CENTER",
							["scale"] = 1.5,
						},
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUIRogue"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["position"] = {
							["y"] = -45,
							["x"] = 340,
							["point"] = "CENTER",
							["scale"] = 1.5,
						},
					},
					["ViksUI"] = {
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["position"] = {
							["y"] = -45,
							["x"] = 340,
							["point"] = "CENTER",
							["scale"] = 1.5,
						},
					},
					["ViksUIRogueLine"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["position"] = {
							["y"] = -45,
							["x"] = 340,
							["point"] = "CENTER",
							["scale"] = 1.5,
						},
					},
				},
			},
			["MicroMenu"] = {
				["profiles"] = {
					["ViksUIDruid"] = {
						["fadeoutdelay"] = 0.69,
						["fadeout"] = true,
						["position"] = {
							["y"] = 222,
							["x"] = -306,
							["point"] = "BOTTOMRIGHT",
						},
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["visibility"] = {
							["custom"] = false,
							["customdata"] = "[mod:ctrl-Shift]show;hide",
						},
						["fadeoutalpha"] = 0,
					},
					["ViksUILine"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 150,
							["x"] = -65,
							["point"] = "RIGHT",
							["scale"] = 0.800000011920929,
						},
						["rows"] = 11,
						["visibility"] = {
							["custom"] = true,
							["customdata"] = "[mod:ctrl-Shift]show;hide",
						},
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUIDruidLine"] = {
						["fadeoutdelay"] = 0.69,
						["fadeout"] = true,
						["fadeoutalpha"] = 0,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["position"] = {
							["y"] = 150,
							["x"] = -65,
							["point"] = "RIGHT",
						},
						["rows"] = 11,
						["visibility"] = {
							["custom"] = false,
							["customdata"] = "[mod:ctrl-Shift]show;hide",
						},
						["version"] = 3,
					},
					["ViksUIRogue"] = {
						["fadeoutdelay"] = 0,
						["fadeoutalpha"] = 0,
						["position"] = {
							["y"] = 222,
							["x"] = -306,
							["point"] = "BOTTOMRIGHT",
						},
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["fadeout"] = true,
						["visibility"] = {
							["custom"] = false,
							["customdata"] = "[mod:ctrl-Shift]show;hide",
						},
						["version"] = 3,
					},
					["ViksUI"] = {
						["position"] = {
							["y"] = 222,
							["x"] = -306,
							["point"] = "BOTTOMRIGHT",
						},
						["version"] = 3,
						["visibility"] = {
							["custom"] = true,
							["customdata"] = "[mod:ctrl-Shift]show;hide",
						},
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUIRogueLine"] = {
						["fadeoutalpha"] = 0,
						["version"] = 3,
						["fadeoutdelay"] = 0,
						["position"] = {
							["y"] = 150,
							["x"] = -65,
							["point"] = "RIGHT",
						},
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["rows"] = 11,
						["visibility"] = {
							["custom"] = false,
							["customdata"] = "[mod:ctrl-Shift]show;hide",
						},
						["fadeout"] = true,
					},
				},
			},
			["ZoneAbilityBar"] = {
				["profiles"] = {
					["ViksUIDruid"] = {
						["version"] = 3,
						["position"] = {
							["y"] = -40.7500305175781,
							["x"] = 181.750122070313,
							["point"] = "CENTER",
						},
					},
					["ViksUILine"] = {
						["version"] = 3,
						["position"] = {
							["y"] = -40.7499389648438,
							["x"] = 181.750122070313,
							["point"] = "CENTER",
						},
					},
					["ViksUIDruidLine"] = {
						["version"] = 3,
						["position"] = {
							["y"] = -40.7500305175781,
							["x"] = 181.750122070313,
							["point"] = "CENTER",
						},
					},
					["ViksUIRogue"] = {
						["version"] = 3,
						["position"] = {
							["y"] = -40.7500305175781,
							["x"] = 181.750122070313,
							["point"] = "CENTER",
						},
					},
					["ViksUI"] = {
						["position"] = {
							["y"] = -40.7499389648438,
							["x"] = 181.750122070313,
							["point"] = "CENTER",
						},
						["version"] = 3,
					},
					["ViksUIRogueLine"] = {
						["version"] = 3,
						["position"] = {
							["y"] = -40.7500305175781,
							["x"] = 181.750122070313,
							["point"] = "CENTER",
						},
					},
				},
			},
			["XPBar"] = {
				["profiles"] = {
					["ViksUI"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 57,
							["x"] = -516,
							["point"] = "BOTTOM",
						},
					},
					["ViksUIRogue"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 57,
							["x"] = -516,
							["point"] = "BOTTOM",
						},
					},
					["ViksUIDruid"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 57,
							["x"] = -516,
							["point"] = "BOTTOM",
						},
					},
				},
			},
			["MultiCast"] = {
				["profiles"] = {
					["ViksUI"] = {
						["enabled"] = false,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["position"] = {
							["y"] = 35.0000026671023,
							["x"] = 284.333404478858,
							["point"] = "BOTTOMLEFT",
						},
					},
				},
			},
			["BlizzardArt"] = {
				["profiles"] = {
					["ViksUIDruid"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 47,
							["x"] = -512,
							["point"] = "BOTTOM",
						},
					},
					["ViksUILine"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 47,
							["x"] = -512,
							["point"] = "BOTTOM",
						},
					},
					["ViksUIDruidLine"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 47,
							["x"] = -512,
							["point"] = "BOTTOM",
						},
					},
					["ViksUIRogue"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 47,
							["x"] = -512,
							["point"] = "BOTTOM",
						},
					},
					["ViksUI"] = {
						["position"] = {
							["y"] = 47,
							["x"] = -512,
							["point"] = "BOTTOM",
						},
						["version"] = 3,
					},
					["ViksUIRogueLine"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 47,
							["x"] = -512,
							["point"] = "BOTTOM",
						},
					},
				},
			},
			["StanceBar"] = {
				["profiles"] = {
					["ViksUIDruid"] = {
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["padding"] = 7,
						["visibility"] = {
							["custom"] = false,
							["customdata"] = "[mod:ctrl]show;hide",
							["always"] = false,
							["possess"] = false,
							["stance"] = {
								false, -- [1]
							},
						},
						["position"] = {
							["y"] = 209,
							["x"] = 335,
							["point"] = "BOTTOMLEFT",
							["scale"] = 0.75,
						},
					},
					["ViksUILine"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 238.249992370606,
							["x"] = 334.999969482422,
							["point"] = "BOTTOMLEFT",
							["scale"] = 0.75,
						},
						["padding"] = 7,
						["visibility"] = {
							["custom"] = false,
							["always"] = false,
							["customdata"] = "[mod:ctrl]show;hide",
							["possess"] = false,
							["stance"] = {
								false, -- [1]
							},
						},
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUIDruidLine"] = {
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["padding"] = 7,
						["visibility"] = {
							["custom"] = false,
							["customdata"] = "[mod:ctrl]show;hide",
							["possess"] = false,
							["always"] = false,
							["stance"] = {
								false, -- [1]
							},
						},
						["position"] = {
							["y"] = 209,
							["x"] = 335,
							["point"] = "BOTTOMLEFT",
							["scale"] = 0.75,
						},
					},
					["ViksUIRogue"] = {
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["padding"] = 7,
						["visibility"] = {
							["custom"] = false,
							["always"] = false,
							["customdata"] = "[mod:ctrl]show;hide",
							["possess"] = false,
							["stance"] = {
								false, -- [1]
							},
						},
						["position"] = {
							["y"] = 238.249992370606,
							["x"] = 334.999969482422,
							["point"] = "BOTTOMLEFT",
							["scale"] = 0.75,
						},
					},
					["ViksUI"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["padding"] = 7,
						["visibility"] = {
							["custom"] = false,
							["possess"] = false,
							["always"] = false,
							["customdata"] = "[mod:ctrl]show;hide",
							["stance"] = {
								false, -- [1]
							},
						},
						["position"] = {
							["y"] = 238.249992370606,
							["x"] = 334.999969482422,
							["point"] = "BOTTOMLEFT",
							["scale"] = 0.75,
						},
					},
					["ViksUIRogueLine"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 238.249992370606,
							["x"] = 334.999969482422,
							["point"] = "BOTTOMLEFT",
							["scale"] = 0.75,
						},
						["padding"] = 7,
						["visibility"] = {
							["custom"] = false,
							["always"] = false,
							["possess"] = false,
							["customdata"] = "[mod:ctrl]show;hide",
							["stance"] = {
								false, -- [1]
							},
						},
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
				},
			},
			["BagBar"] = {
				["profiles"] = {
					["ViksUIDruid"] = {
						["enabled"] = false,
						["version"] = 3,
						["position"] = {
							["y"] = 41.75,
							["x"] = 463.5,
							["point"] = "BOTTOM",
						},
						["onebag"] = true,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUILine"] = {
						["enabled"] = false,
						["version"] = 3,
						["position"] = {
							["y"] = 41.75,
							["x"] = 463.5,
							["point"] = "BOTTOM",
						},
						["onebag"] = true,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUIDruidLine"] = {
						["enabled"] = false,
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["onebag"] = true,
						["position"] = {
							["y"] = 41.75,
							["x"] = 463.5,
							["point"] = "BOTTOM",
						},
					},
					["ViksUIRogue"] = {
						["enabled"] = false,
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["onebag"] = true,
						["position"] = {
							["y"] = 41.75,
							["x"] = 463.5,
							["point"] = "BOTTOM",
						},
					},
					["ViksUI"] = {
						["enabled"] = false,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["onebag"] = true,
						["version"] = 3,
						["position"] = {
							["y"] = 41.75,
							["x"] = 463.5,
							["point"] = "BOTTOM",
						},
					},
					["ViksUIRogueLine"] = {
						["enabled"] = false,
						["version"] = 3,
						["position"] = {
							["y"] = 41.75,
							["x"] = 463.5,
							["point"] = "BOTTOM",
						},
						["onebag"] = true,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
				},
			},
			["Vehicle"] = {
				["profiles"] = {
					["ViksUIDruid"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["position"] = {
							["y"] = 144.500122070313,
							["x"] = 315.5,
							["point"] = "CENTER",
						},
					},
					["ViksUILine"] = {
						["position"] = {
							["y"] = 83.2500610351563,
							["x"] = 203.750122070313,
							["point"] = "CENTER",
						},
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUIDruidLine"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["position"] = {
							["y"] = 144.500122070313,
							["x"] = 315.5,
							["point"] = "CENTER",
						},
					},
					["ViksUIRogue"] = {
						["position"] = {
							["y"] = 83.2500610351563,
							["x"] = 203.750122070313,
							["point"] = "CENTER",
						},
						["version"] = 3,
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUI"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 83.2500610351563,
							["x"] = 203.750122070313,
							["point"] = "CENTER",
						},
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUIRogueLine"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["position"] = {
							["y"] = 83.2500610351563,
							["x"] = 203.750122070313,
							["point"] = "CENTER",
						},
					},
				},
			},
			["PetBar"] = {
				["profiles"] = {
					["ViksUIDruid"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["version"] = 3,
						["position"] = {
							["y"] = 43.4560381037409,
							["x"] = -133.200113630301,
							["point"] = "BOTTOM",
							["scale"] = 0.600000023841858,
						},
						["fadeoutalpha"] = 1,
						["padding"] = 15,
						["visibility"] = {
							["always"] = false,
							["possess"] = false,
						},
						["fadeoutdelay"] = 0.1,
					},
					["ViksUILine"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["fadeoutdelay"] = 0.1,
						["position"] = {
							["y"] = 43.4560381037409,
							["x"] = -133.200113630301,
							["point"] = "BOTTOM",
							["scale"] = 0.600000023841858,
						},
						["version"] = 3,
						["padding"] = 15,
						["visibility"] = {
							["always"] = false,
							["possess"] = false,
						},
						["fadeoutalpha"] = 1,
					},
					["ViksUIDruidLine"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["fadeoutdelay"] = 0.1,
						["position"] = {
							["y"] = 43.4560381037409,
							["x"] = -133.200113630301,
							["point"] = "BOTTOM",
							["scale"] = 0.600000023841858,
						},
						["version"] = 3,
						["padding"] = 15,
						["visibility"] = {
							["always"] = false,
							["possess"] = false,
						},
						["fadeoutalpha"] = 1,
					},
					["ViksUIRogue"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["fadeoutalpha"] = 1,
						["position"] = {
							["y"] = 43.4560381037409,
							["x"] = -133.200113630301,
							["point"] = "BOTTOM",
							["scale"] = 0.600000023841858,
						},
						["fadeoutdelay"] = 0.1,
						["padding"] = 15,
						["visibility"] = {
							["possess"] = false,
							["always"] = false,
						},
						["version"] = 3,
					},
					["ViksUI"] = {
						["fadeoutdelay"] = 0.1,
						["fadeoutalpha"] = 1,
						["position"] = {
							["y"] = 43.4560381037409,
							["x"] = -133.200113630301,
							["point"] = "BOTTOM",
							["scale"] = 0.600000023841858,
						},
						["version"] = 3,
						["padding"] = 15,
						["visibility"] = {
							["always"] = false,
							["possess"] = false,
						},
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
					},
					["ViksUIRogueLine"] = {
						["skin"] = {
							["ID"] = "ViksUI: Buttons",
							["Backdrop"] = false,
						},
						["fadeoutalpha"] = 1,
						["position"] = {
							["y"] = 43.4560381037409,
							["x"] = -133.200113630301,
							["point"] = "BOTTOM",
							["scale"] = 0.600000023841858,
						},
						["fadeoutdelay"] = 0.1,
						["padding"] = 15,
						["visibility"] = {
							["always"] = false,
							["possess"] = false,
						},
						["version"] = 3,
					},
				},
			},
			["RepBar"] = {
				["profiles"] = {
					["ViksUI"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 65,
							["x"] = -516,
							["point"] = "BOTTOM",
						},
					},
					["ViksUIRogue"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 65,
							["x"] = -516,
							["point"] = "BOTTOM",
						},
					},
					["ViksUIDruid"] = {
						["version"] = 3,
						["position"] = {
							["y"] = 65,
							["x"] = -516,
							["point"] = "BOTTOM",
						},
					},
				},
			},
		},

		["profiles"] = {
			["ViksUIDruid"] = {
				["onkeydown"] = false,
				["minimapIcon"] = {
					["hide"] = true,
				},
				["selfcastmodifier"] = false,
				["buttonlock"] = true,
			},
			["ViksUILine"] = {
				["onkeydown"] = false,
				["minimapIcon"] = {
					["hide"] = true,
				},
				["selfcastmodifier"] = false,
				["buttonlock"] = true,
			},
			["ViksUIDruidLine"] = {
				["onkeydown"] = false,
				["minimapIcon"] = {
					["hide"] = true,
				},
				["selfcastmodifier"] = false,
				["buttonlock"] = true,
			},
			["ViksUIRogue"] = {
				["onkeydown"] = true,
				["minimapIcon"] = {
					["hide"] = true,
				},
				["selfcastmodifier"] = false,
				["buttonlock"] = true,
			},
			["ViksUI"] = {
				["selfcastmodifier"] = false,
				["buttonlock"] = true,
				["onkeydown"] = false,
				["minimapIcon"] = {
					["hide"] = true,
				},
			},
			["ViksUIRogueLine"] = {
				["onkeydown"] = true,
				["minimapIcon"] = {
					["hide"] = true,
				},
				["selfcastmodifier"] = false,
				["buttonlock"] = true,
			},
		},
	}
end

local UploadSkada = function()
	if SkadaDB then table.wipe(SkadaDB) end
SkadaDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["hasUpgraded"] = true,
	["profileKeys"] = {
		["Mørk - Quel'Thalas"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["modeclicks"] = {
				["Deaths"] = 1,
				["Healing"] = 2,
				["Enemy damage taken"] = 1,
				["DPS"] = 1,
			},
			["columns"] = {
				["Healing_Percent"] = true,
				["Absorbs and healing_HPS"] = true,
				["Healing_HPS"] = false,
				["Healing_Healing"] = true,
			},
			["report"] = {
				["number"] = 6,
				["mode"] = "DPS",
				["channel"] = "raid",
			},
			["windows"] = {
				{
					["titleset"] = false,
					["barheight"] = 12,
					["spellschoolcolors"] = false,
					["barfontsize"] = 12,
					["classicons"] = false,
					["barslocked"] = true,
					["roleicons"] = true,
					["background"] = {
						["color"] = {
							["a"] = 0.2,
							["b"] = 0.5,
						},
						["bordertexture"] = "None",
						["borderthickness"] = -0,
						["height"] = 80,
					},
					["wipemode"] = "Overhealing",
					["bartexture"] = "Armory",
					["barwidth"] = 167,
					["x"] = -341.0006103515625,
					["name"] = "Threath",
					["y"] = 91.99999237060547,
					["barfont"] = "ViksUIStdFont",
					["title"] = {
						["color"] = {
							["a"] = 0.8,
							["g"] = 0.1,
							["r"] = 0.1,
						},
						["height"] = 10,
						["fontsize"] = 11,
						["texture"] = "Aluminium",
					},
					["enablebackground"] = true,
					["modeincombat"] = "Threat",
					["buttons"] = {
						["report"] = false,
						["menu"] = false,
						["stop"] = false,
						["mode"] = false,
						["segment"] = false,
						["reset"] = false,
					},
					["mode"] = "Threat",
					["point"] = "BOTTOMRIGHT",
				}, -- [1]
				{
					["barheight"] = 12,
					["barslocked"] = true,
					["modeincombat"] = "",
					["wipemode"] = "",
					["set"] = "total",
					["hidden"] = false,
					["y"] = 5.000000953674316,
					["barfont"] = "ViksUIStdFont",
					["title"] = {
						["fontsize"] = 11,
						["font"] = "Accidental Presidency",
						["borderthickness"] = 2,
						["color"] = {
							["a"] = 0.8,
							["r"] = 0.1,
							["g"] = 0.1,
							["b"] = 0.3,
						},
						["fontflags"] = "",
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Aluminium",
					},
					["display"] = "bar",
					["barfontflags"] = "",
					["point"] = "BOTTOMRIGHT",
					["barbgcolor"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["reversegrowth"] = false,
					["returnaftercombat"] = false,
					["barorientation"] = 1,
					["mode"] = "Healing",
					["version"] = 1,
					["classcolortext"] = false,
					["barcolor"] = {
						["a"] = 1,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.8,
					},
					["bartexture"] = "Armory",
					["barwidth"] = 167,
					["barspacing"] = -0,
					["snapto"] = true,
					["scale"] = 1,
					["enabletitle"] = true,
					["barfontsize"] = 11,
					["name"] = "Heal",
					["classcolorbars"] = false,
					["x"] = -341.0006103515625,
					["buttons"] = {
						["segment"] = true,
						["menu"] = true,
						["stop"] = true,
						["mode"] = true,
						["report"] = true,
						["reset"] = true,
					},
					["clickthrough"] = false,
					["background"] = {
						["borderthickness"] = -0,
						["color"] = {
							["a"] = 0.2,
							["r"] = -0,
							["g"] = -0,
							["b"] = 0.5,
						},
						["height"] = 66,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
				}, -- [2]
				{
					["barheight"] = 15,
					["barslocked"] = true,
					["enabletitle"] = true,
					["wipemode"] = "",
					["set"] = "current",
					["hidden"] = false,
					["y"] = 5.000000953674316,
					["barfont"] = "ViksUIStdFont",
					["title"] = {
						["fontsize"] = 11,
						["font"] = "Accidental Presidency",
						["borderthickness"] = 2,
						["color"] = {
							["a"] = 0.8,
							["r"] = 0.1,
							["g"] = 0.1,
							["b"] = 0.3,
						},
						["fontflags"] = "",
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Aluminium",
					},
					["display"] = "bar",
					["barfontflags"] = "",
					["classcolortext"] = false,
					["barbgcolor"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["reversegrowth"] = false,
					["returnaftercombat"] = false,
					["barorientation"] = 1,
					["snapto"] = true,
					["version"] = 1,
					["barcolor"] = {
						["a"] = 1,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.8,
					},
					["point"] = "BOTTOMLEFT",
					["bartexture"] = "BantoBar",
					["barwidth"] = 163,
					["barspacing"] = -0,
					["modeincombat"] = "DPS",
					["scale"] = 1,
					["mode"] = "DPS",
					["barfontsize"] = 11,
					["clickthrough"] = false,
					["classcolorbars"] = false,
					["name"] = "Dps",
					["buttons"] = {
						["segment"] = true,
						["menu"] = true,
						["stop"] = true,
						["mode"] = true,
						["report"] = true,
						["reset"] = true,
					},
					["x"] = 341.0003051757813,
					["background"] = {
						["borderthickness"] = -0,
						["color"] = {
							["a"] = 0.2,
							["r"] = -0,
							["g"] = -0,
							["b"] = 0.5,
						},
						["height"] = 162,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
				}, -- [3]
			},
			["versions"] = {
				["1.6.3"] = true,
				["1.6.4"] = true,
				["1.6.7"] = true,
			},
			["feed"] = "Damage: Raid DPS",
			["modulesBlocked"] = {
				["CC"] = true,
				["Power"] = true,
			},
		},
		["ViksUI_Line"] = {
			["modulesBlocked"] = {
				["CC"] = true,
				["Power"] = true,
			},
			["windows"] = {
				{
					["titleset"] = false,
					["barheight"] = 12,
					["classicons"] = false,
					["barslocked"] = true,
					["background"] = {
						["color"] = {
							["a"] = -0,
							["b"] = 0.5019607843137255,
						},
						["borderthickness"] = -0,
						["height"] = 70.99858856201172,
						["bordertexture"] = "None",
					},
					["wipemode"] = "Overhealing",
					["y"] = 100.0011672973633,
					["x"] = -13.9476318359375,
					["title"] = {
						["color"] = {
							["a"] = 0.8,
							["g"] = 0.1,
							["r"] = 0.1,
						},
						["fontsize"] = 11,
						["height"] = 10,
						["texture"] = "Aluminium",
					},
					["modeincombat"] = "Threat",
					["bartexture"] = "Armory",
					["point"] = "BOTTOMRIGHT",
					["spellschoolcolors"] = false,
					["barfontsize"] = 12,
					["roleicons"] = true,
					["mode"] = "Threat",
					["buttons"] = {
						["report"] = false,
						["menu"] = false,
						["stop"] = false,
						["mode"] = false,
						["segment"] = false,
						["reset"] = false,
					},
					["barwidth"] = 167.0000152587891,
					["name"] = "Threath",
					["enablebackground"] = true,
					["barfont"] = "ViksUIStdFont",
				}, -- [1]
				{
					["barheight"] = 12,
					["barslocked"] = true,
					["clickthrough"] = false,
					["wipemode"] = "",
					["set"] = "current",
					["hidden"] = false,
					["y"] = 21.00229644775391,
					["barfont"] = "ViksUIStdFont",
					["title"] = {
						["fontsize"] = 11,
						["font"] = "Accidental Presidency",
						["borderthickness"] = 2,
						["fontflags"] = "",
						["color"] = {
							["a"] = 0.8,
							["b"] = 0.3,
							["g"] = 0.1,
							["r"] = 0.1,
						},
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Aluminium",
					},
					["display"] = "bar",
					["barfontflags"] = "",
					["point"] = "BOTTOMRIGHT",
					["scale"] = 1,
					["reversegrowth"] = false,
					["barfontsize"] = 12,
					["barorientation"] = 1,
					["mode"] = "Healing",
					["x"] = -13.9486083984375,
					["modeincombat"] = "",
					["buttons"] = {
						["segment"] = true,
						["stop"] = true,
						["menu"] = true,
						["mode"] = true,
						["report"] = true,
						["reset"] = true,
					},
					["bartexture"] = "Armory",
					["barwidth"] = 167,
					["barspacing"] = -0,
					["name"] = "Heal",
					["barbgcolor"] = {
						["a"] = 0.6,
						["b"] = 0.3,
						["g"] = 0.3,
						["r"] = 0.3,
					},
					["enabletitle"] = true,
					["returnaftercombat"] = false,
					["background"] = {
						["borderthickness"] = -0,
						["color"] = {
							["a"] = -0,
							["b"] = 0.5019607843137255,
							["g"] = -0,
							["r"] = -0,
						},
						["height"] = 66,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
					["classcolorbars"] = false,
					["snapto"] = true,
					["barcolor"] = {
						["a"] = 1,
						["b"] = 0.8,
						["g"] = 0.3,
						["r"] = 0.3,
					},
					["classcolortext"] = false,
					["version"] = 1,
				}, -- [2]
				{
					["barheight"] = 15,
					["barslocked"] = true,
					["enabletitle"] = true,
					["wipemode"] = "",
					["set"] = "current",
					["hidden"] = false,
					["y"] = 23.00288009643555,
					["barfont"] = "ViksUIStdFont",
					["title"] = {
						["fontsize"] = 11,
						["font"] = "Accidental Presidency",
						["borderthickness"] = 2,
						["fontflags"] = "",
						["color"] = {
							["a"] = 0.8,
							["b"] = 0.3,
							["g"] = 0.1,
							["r"] = 0.1,
						},
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Aluminium",
					},
					["display"] = "bar",
					["barfontflags"] = "",
					["classcolortext"] = false,
					["scale"] = 1,
					["reversegrowth"] = false,
					["barfontsize"] = 11,
					["barorientation"] = 1,
					["snapto"] = true,
					["x"] = -181.1072998046875,
					["name"] = "Dps",
					["buttons"] = {
						["segment"] = true,
						["stop"] = true,
						["menu"] = true,
						["mode"] = true,
						["report"] = true,
						["reset"] = true,
					},
					["bartexture"] = "BantoBar",
					["barwidth"] = 222.0092926025391,
					["barspacing"] = -0,
					["clickthrough"] = false,
					["barbgcolor"] = {
						["a"] = 0.6,
						["b"] = 0.3,
						["g"] = 0.3,
						["r"] = 0.3,
					},
					["mode"] = "DPS",
					["returnaftercombat"] = false,
					["background"] = {
						["borderthickness"] = -0,
						["color"] = {
							["a"] = -0,
							["b"] = 0.5019607843137255,
							["g"] = -0,
							["r"] = -0,
						},
						["height"] = 143.9972076416016,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
					["classcolorbars"] = false,
					["modeincombat"] = "DPS",
					["point"] = "BOTTOMRIGHT",
					["barcolor"] = {
						["a"] = 1,
						["b"] = 0.8,
						["g"] = 0.3,
						["r"] = 0.3,
					},
					["version"] = 1,
				}, -- [3]
			},
			["feed"] = "Damage: Raid DPS",
			["report"] = {
				["number"] = 6,
				["channel"] = "raid",
				["mode"] = "Healing",
			},
			["columns"] = {
				["Absorbs and healing_HPS"] = true,
			},
			["versions"] = {
				["1.6.7"] = true,
				["1.6.4"] = true,
				["1.6.3"] = true,
			},
		},
	},
}
end

local UploadMasque = function()
MasqueDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["profiles"] = {
		["Default"] = {
			["Preload"] = true,
			["LDB"] = {
				["hide"] = false,
			},
			["Groups"] = {
				["Bartender4_StanceBar"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_Vehicle"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_1"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["ExtraActionButton1_"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_3"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_2"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_BagBar"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_4"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_10"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_9"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_5"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_PetBar"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Masque"] = {
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_7"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_MicroMenu"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_8"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_6"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
			},
			["Button"] = {
				["Bartender4_4"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_BagBar"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_StanceBar"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_9"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_Vehicle"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_8"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_7"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_10"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_PetBar"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_3"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_5"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_2"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_MicroMenu"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_1"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_6"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
			},
			["LDB"] = {
				["hide"] = false,
			},
		},
	},
}
end

local UploadDetails = function()
	ProfileNames = "Viks"
	
	local NoPanelsOne =
	"T3x2Ynossc(Xmpmvz2MzJ7J0S9bsjQmLLsuAfyw5uTLMGabbjrlqc2aGPswB16P9)yFz(gMFG6hB9JicCqWJS2Q6DhZM(qjjrC4Hh(D4EGh1FCYJbBkYNNMLGFSCz(lHrfjRJclYZsctJZx)40hd2wMewKeLvLUkz2Ms8NkGwopAg0M1qphR)ya8HXgpow7TgpwbJAw0UKIWzjvrPzLHVKUEw(l0Cehbtg2HPrfHvjFRABrYJbbpVllDn8HYNHbkyu2x)0144eLLfYJvjczHlkY3Urbti4UoDvuvA(6YhhcGvYM8IQWLaWgcJ3ZmSMSk)R8kyv48I8vHRJwLGnFvk07TRcHhxGZuC(QPrvH46earThds(AYA47frXpNuGGpGBMMLmdh255WJIZZYlyma()mO)As)1c)BLaRgdW6maDwbi2WnFDfoa4cU1aO9wDboKhe6FTW)1ehiAclxgHyYGX3nEK8Ns)fb4sFDEumGhVQi9xE9P)hBJMvevf96ttMiMWLjPlwwbT3PFqBdIyMxGyijjrvAvgHVkRWb7XGBU7Z4(x8ZZkY30Dj4BOwf0hnR)iVw8C8XLtwoGujmPeKm1G1WlPZQwcdGTg1ieKvujxYKtV(uqcqLMwT7XG8n0MFOeIRWEjidQYdFzz(JbiXzzv064KYWYKfRG90YqX0puXbewgbujBYjcjK8cifG1nsXTEg0VcGijCtub8jeO3aeKtNwK81uI8dxNbVKxKntsfLwIeoLljQ1nZIQGzytcmLx5AOz7A757Az47O5y9483yBdi088Nxfv8mTEL7QaJIIeN7Fiq1cd8xtYqSPf0X1BxLuKcmwHL7kRswb)ZQP5zLqx3wbRFIrLNBCRa6XSKOQLa(jh4P3apcMvemz20YJYzxJkb842W4S04NrmD(MesyHIxklbyWxN8s8s4RjRxWuqs0F0kaTwfonVeLoSjPKPGr8Ezs2CbrfmEaIlIgS1B3aBAlY3wH)CnySohy1NkKWqS7SKQqqufaJv)UzCzjHYoo8KmGEGaLDvltJdNTfwUW(vJjTmA1gKgJAQPGddwQvvPRxuEcwTn5Ww(JbtU7(McqfCkexZUhh)gDeb(nyJ6q8M82iZrkygnAWjoSMt0Ge4iOAH5gi(JYybrbe1z(85aSJd4Pe60ldkjghw4HlZHUadaq7UiAdb7ZsMhTndinwegLTzzeoT2SMG01H5G8abzknybepgSoxhdW6A4)tenjR3fwgNdAmwLuwgTiH0eGKmZIkaUzulZujRfSpacbZYQ)ffZgGSWLmsovTBtcTGNLwIBRHWwusv8swLcYlbA0Ojx8CeTgcuc4AnC62QkHsQvG(OIDHa(4XXaZFaiZnmQuOAdEoZ5i6iVVihsELZnTKjjlItcJIRs)kioK0CjLH3MhxsSaIvBknC7MnfacsiPcr)XzrW3rv)WJxby9hdUgjaWD4Vmy2S7wx(fHC4VaOkaZ(fQljQMl3X7rPFvpsZI(MuAMzxPhIvckflS8LOnOCMz7aT3apMOLkgAe(i(iuSei67d55GiNQ9Los8o4EhqpwGeoZtxG9BEe8uaVte9e5YFFlkBdSHjjMeXtcxaYEeYJdJJIxseBGaiy5vuvkTlPEjgfhdlSgBGTfqaDaaW4OnO6nYafeqqRxiraBsYYIbOInvPmgffY4Jc6FtwNuSyhn8r4ob8PQ9eXIQsvAer1PGKw7EetxLxSyPyY27HOyAcKiRZUfnBkklTSknMBCrkRHjllDMWqmL5IaY5LODLSHLe(k5fjHmjoCsTChDBVA5A6KfaG6dqtE00WKvtbMH2IY3PeeHI(A(fShKzEG2)sqsJI5HX5sl)AzX3EOLA1nKEjLqI4S8TGEEEFRg)dG5ZjGuFymWT51lizouVKstmAOYOb16yETkKmuTeiZwMNnJyja(4zaGes2Icn1egdsSE40DcR1RaAzwYrocNlttYMvYakYmhNNxmJMTp8PXtg9qB9bVvhiqewPHFI1lyJWZNh8WdxF3bBVOT6CJVFWndU86XhCWvJTPl1(Bh8(r1wnIpLnYWYtZYXZT)5y0Kt3fAc4UrD6Yh(01xQ6MPRUMp1cQVw(w6wAo9VKU9UXFu1r10z643Sl7TWUC0GjF4JJV(9FOxG9qDdq23C3fF8mb092RE4U3)PA8zduIr7bB)v5Ng)XXGvg7Vopec9(hUEuWKZCU2dqbKAWXic7mzdazkOYQdoDAGr0EUwE939rJhD7pFUZ1LJaGRnpIC32u03dT79bGfl5C376mTFA87F4UpD)93m4NBmXNEFy0pD3hB0bBntFEsOUDaA6Gpm42bJpdUOo7BvTSmJTReX(WsRw9gi6e(i6WEzT42GPf5rZIz1RnnjwQOQ2jGWNtsaBLskRc3aMCKxSI26hwljdM2EKK9whxXQWZua(w9jb7TUEsSJ0ZulZUCps3x9DKnrFp5vwYgjj78TiI1hgnEq4pp6MBumunDUqYc0)gULKAroTDfEPRiNeTqZQRuQwtMT)Heh56QyfKagHgcgDZvQg55RP7lPbn0TLOd(37in2SdW3dTMSfYM452N0hLVMc4ApboT9wtH0F)dJgvtw745O4EKdLV2(seG9nDD3Mog9wyX5u7eyxPY2sciBjw21)qIoCSubcPvBb7dkPqgaCoJh9Pjpm4M(iw6HfxIDSDDuuj(E9O9LiE5Mk5NDnzU4A7drZQbZDkz3jztEwueTbSqfz5ypROwXHqRh)JahhsxSam(vycVDT5)SFpjZsR6ZXF0IEOlOjFcRXa3)q3fxZru4fYSV8z5eSvenlLmtYrt4ak7nMUQV3Ndp2Wq(ys0rfz)0sW2u2OVA)EKMgJZD03oK1Ow21XJceoIdrRiKG2gYHib)uJyKKVoBh68c607IYM(ek9zKDhKWY5OZVTdLKrTHOZZIwWbRBzEf4qlyYpGw2KLmVIav1ItHG3aBrXHRYPh0YqCuffy1yurzRiOWRbyWcPOFnb9ObWEKVi7E8Q346z5AB6a)X1Xb(YJZFdWdh8ThVYXrx32W222WZ0WgKLapbddg8epnptndDhtpBtt(jqFw(4v2Aoo22MGEgxBFDnA0i(Ysq2opL46)BCioeH3adiOMgt)Ilzmsast3LecOD1a6fdNcfbntWpS4LOwktp0f(QSemKZyywwZUHVERSjmxJblI6nMOldZiN9H5d02v84va867BzAA7yO7B6BkIz38Tzztz8kr9CLTLMLPUVHPMlqncwLaTtqeI0lGlkcaNmpNnJxeAGJgmkr8fihZdPa2Fs3YB2LYqdvKRqcGWs0DWzPfcxBrei56kYTdU2TyD4kqvFAydSkI0cdFjQKI1hhyIYxsrYzKsfpYGY6ng29dGvg8MjF7ILYiKqqZEpSaJNZ0gBthlMVa0rr2bTia3ofmb7rbaU7UkTowvVbJpgTRZWaHVhIO7Hi2EiIShIYeG)4qgOSbJQ143yGbNls57OynZ(8rr8HcDhsYq8wdLIjcRJvxufaxWgnFOkIWaQjjMJLIc4nmM4tVf11XdKNo79OCPvh4mFdIaE6Jxz5ageAdw4PBPBBb2HaeMwnIu4(i83tr(wqLYtDx2anCuinnxbcjCbHe2Ug(6MGCcXtm7FMfMwQ4NZrYM1imOKg1WsX01OktAp(RrzBPt7a7lmVNzdnp3gADUn0(CBOZ52q3ZTHENBd9p3gcCgNBlp79g9ZEZr)S3D0p7Th9ZD)HLWVypcy5PY0GR6WNzqfFIOPRNNFSdsLIB45j8MAkpTcTXKHn3GkrOtkvCiSSWnsRnywajtPGTEb(ezLaDEa5GkMvcgoCCEqooIG2ou(ZeOtbACpXJvsqGXQHXBlRWiFJmTO030VH2dIYDpkIsSmAeQoSl768dyarrztIJFRH7FIa5dQVIMJEukrUQOaFim8pL(C5NU(l3cMKg9LRGw)LnaiN92QQ5y0FjfH1IN7O2amNkJWYB3aEMsMxbBjbyipl)YG40zdlO4TdppP49fjjRF7Tg4rR8sDR)mE8GFz0)29dghC9DJ1m(YL3D3LdUm4lxKNnlQOi6lxC3nxcUSoa854tbVDLHC(AEsi8y2G0M)bvt0LDQUjk0EZ9SG)N4(S()4TV(e9jZ)b9pg)JATc4c(CoIB1jq3aQ2xHYWOIHK2SxFYO(aT5(A1H(MPlph1EefBZTpjX8n4PASUmdmbGwVdBgN5AQSZHAzc32s5hEB1IiqKsxALRS8Tn9D0n1808TSyzig9UYqOH6pyfZZyqQrd(ZI21CfFfyTTUNVUNlynPVb4shmCKZQh6jMh8jwGaoY(DaeTmq9WwSfaQd6ujPQhY)wImiPPhXm0(XCs5BYucHmxSbEeC8ChBVunTJGCfrpua4vYeLT5H(KfnSpjipgGGfqb2uqfnfhKctX0quyR3UAkyT3WELFEo0PC3Afhl1G1hB5Rp9dc(XFSbZKAviH)LafDgrv3yN4QI0K1ZkVcpZ1V8PRFJ473Kww9Mpu3HEe0(7NBqsa3cuFFgEYrDq5nLRF8ZNM4VjRWN0VETKQxarTT0S0fdlKlQthuNuzbrYjiXBp7QDQPuw)aF9hADg385kwtH2z2a5UXuodPClncdMzP4CfRjClt2evevbR(G)BDj43BxGWd9C2B0Yywsze0zy0fP3qgOqap9P2gaHEwCsfZhTfv85Mwh)IApve(eHhDj7suxFXmuEJ7AIPh22fPCmIEPJxOK3PKXAI1JyORIw)SWOhqEvutNUz1IT8NSo4ZbvaYbzzcI(kF(H4(daKbxoAYGRVjimyYGjFky4GhcV)Mp9(RhhEbfXpb92HB29bJE)TJgxNJd4GF4wF59bydsl)q6SzCUYiIzZezMfGiQRiQSbXGjfjyEr86t3dSA4xI3XT4ItRqgB2a0lEcLIX)zIKEeFuGsFn(TF(28zI(D61AZvWW)5Scm)dzfCHimU)tbKn(oa5kH8Stq6u1micchLdAKCsQiueOykBKhzEazFlDm4zJ)pujDeMje85Zpuga1Mc7A2k6W8vn7CsJQMHytVwkB)Erupv8IsnXtxWUG0mIBYq51qer7aqPI0U5(sKSusK0W4AvNeuCGbjTgTLGMVMLCqjfhAgsvEozhhfpkzCvZxNLWr2wg3UQuYq61HrttbRrtXuWWe)EY6KvIVrhVMsooLBD4GTknUipuDMA1azR8dRLOV0186hdcnhYUY1uS1zpD5f2v2wEUGrQA(((EE((gnJtzDWvL(uGzSv0umknOtMKuyq7DcQ)MIiDtNru5Ihh(yhDFtllFDlDdxdWcumEVEu0JFJNLLTVJRHNNHPhyYm(iFv2Un8UjtU72hOZTQvgevss0PiBk83UgmfgH8hE0QQ6eGnoyVowE26EMUg6W)X2wIeBez5WzijQG23rgE5QUQXox3CulDHc9E1G2o(KTziqJiAyvDl12TBjfj44TfGubYKA5Xfiv93IT(ngUcM)QEIjm7NoEaVYOwWbirEus0wi8LhdUkceD1qDApb8NY928Y04O8))(JQOJTkK4kjQLwveB(eHcGPstoi)1FbWFBI2Sx2R2msa8ztbED66zJU8P76BBOjx1GqokZF67SHfNSpDcScNIVYtZWwdyg1beNd75OLJs(DaLBFzj0X8z0Ht7yQejFbov4UA4OwL8mXqY8UcGZ2HucQuLKmNVXGF9f3no4lxp(NcbHYPzHtW8lD1XIHbTpPo1bv8bm3t0R8eHipr79Sr6E2fTDLhiWCnnDD8brE(gEIGGBCWNyEWNaUYB747RP57zOdBAwSt(8X7w1O2mo45tQYN1qa9agIhXBPSVmOx2nYzSXognsjfDFBt9EYmLojlYyDlh36ZmVBgP8wzJD4w7y2iZzS7KPnDhASYaoNesdAO(rY)QUT14ijEt72cRnV6Z4x1A3dS4mSRxDYSwsVFyW6CZmpOT2hl3Y62ChNVJmrdg8JT3TFRBGnmn803hJSFx8pg8OYYjprZDo4o(ET1219yzqv39Mge39aiTZ3QX2E6hHoDVH26inUZiB4yFem(En25yKF716AeIcm8oCRpkP9EKHo(hI2E)26QDmaPBZB06dl2PlHLUMXHr6T52C1piK3bNORzE4nNodQXbju7qEGMtCyeDxboUMhd11zOB04EOP3Jm188Z4qaQTpcG0rCMJ(zM3LG8aNJWR0DtUMx5u5y84g8G7ZwTFco2WznzDtGPhud32C2poAWKPs2ktvodAksImzAU1C82GhyhQWDVS(bmehTu8aUwR9wFDxNUog0W0jjarjLPi7yPpAw)rgMy7eA6dhxLcFnTmV4C8QNS9rfYbHZoLX4bFjYIiS12AUV1v41JTiPafRXAxz6McHYm40ubSJTHjHYjJXUIJrddRxYRpfG14JeE40PHTHUnEZTlsRDPq62E)PkQyHClQoDnaIIpZT9d0)OcTryrsgSf(1e(iyf)kgVBo51yND4modDbB7uYbXAd8fLwgDSlCbGrHjc83zv06zI6CcBXHRYQZ3psrlp6PZj8HTeZ03EmHp4(r3CZW7U7JFHo)tSUfFZ9Gz8VrexKW65q6asWqoBu0rHfb3qKJUKPcbtA(LhA0SQA0cJqAfZx8edHnR0viwBvs1soEAY9KdfBFXJfXyqCU41R2AZEbB2TT90SSnm9m08mmTehygf(atdqLTHHf4TKVJPgB)nAZURJRLUPLURRPng6Jg2SRb2XO7Az7Rzag17Ro(nfP7X54AaJnf(41jrK9AuzF1LcBz8YKvrIYgKYnjWy)vBKUV71GwruOUVr3IdkvZQi7yzLLmfh5sKsKGJYc4CAr(ZcQomUdufvhMI1Qk7rzRk6uosKhzQtRAADPWq51fNvKm8H)yDUHplz625ZFmyZ2In45OWFRmn7Ryy)NtNfw2U5P4czwuXZ5fry5PYfEvWcuggY9LNrbVjyxcEGkQIScqPZevXyw(0Ol5CLiaKKh9m2bUoOWswIIpbLl7IkyNEcMQ7aixI1)PSq05s9cRdYumCAspYTTC11D1aDjoEwGN5ch7NIHbKNfPimWiVM)CToH2elAQIMqQeuZUzLGUzzuzsnCKwwhWXgJovVWNqjHi2cuVQhqralaNwn0mb3O8CD14KKexx0OJB6noGWwzYwh0Ky0Cb0emiEEoU(o1yP9WPKANZKzRdIqUHy5dE7OBQ74O76zkJiu3w3iQ8SQK(XOD6LSW3916z6ryxOiO52mjq8u14RlFkQTWgnHdMeLlRrK8C6UqUyn6Bb0cuQJe73rGEab4Yl7H9OPKjBnWBHf3yA8EOhld)dT1QkEzT9O7AUC3BKjdguJpySFt4Qn)J0opPvEsB8OieV)Yb183l7TIuSw5wnU8qhpow5(cdEvMWsZB39OtWxOMifVLBF7ZhLIFpK4zGHvPvpMe)9q0rcdN2cnUjA2m8KSXe1FpSBDgQ0Zu2GhCVNTp7upRBxlFmnASaL22A2o7H86tgL7b2Qft1HaeLjR93gbwZtVwFCrsmxUe8Pcis9Fe516ebHNLLopjuKucC9aakCP44Z18QR6SfI2UiCdOBlngpakgrlu5XfalUjd7ivf4vBaw54GHf8H9tfWfz5hxu00kjD1k(03c3cgiqHvmnktK)oOyNnXPZc5ZoBg3fCsUGoCcoX64FvEBkiYkrQMGtaZhkRaBmske1zB90HUxHhvfgLEs1lFUIyrXkRr5MWzgwU3vabtmAHoAFjt6b6)P63UeR7ex8eQC80W8gBBvErkFMdBxtf5VWyNXKjPPRH9SSnQF0dO2V6t3Ct4LJUz0KrHF(6XxE3NrmWv39W7hfo5ttU7HRhCd(lbF(6jx8HW7hmE0nHxD9dbtcV7(rJhDjNiljGLC09OGWc1PO8GPOSGP4KpTHJsnop5RhF1DQzrN0LRUPrKRfadXWviEm5HFAm(puBXAGg2WOLXD3p567ghiGVAitCmRHrRxd4Wyo12JRkYexpiCDj3CYgmzYdxp8ta6iaWkxmPn8jafQi5cVDWhVE8715t)Lo6eS8dWQsxvJHsI9xIkwJ3QePZOHrErSmlKSulR2BSgnuvlqACH1lVTFcRVdCWZESczR6ExgGNdL4aS4cKKldCrjFRGvc(YWIPcm5dOX5ZjLj7obXgEiAIZtR(MkOUScAF))GhQ(324RbMvVHTdgG7ebtC4KlUBydKy8s0OxQoSe3kg0bQO4IK8RiZBP6(Kan0gntgqEZWRIJva1oN4aGMtnH4Vq8Q4ybwj7YfzIab3)J)7Btk2jYtzrLGgkygzwuY(zzsatYTgQqGSyKdIaR7dBfofKekV4LLg6vEw622(6GBCg2MgE0bak8EQgEWfklXenVGV9woSIAJAv1Qi2a)QVvZ4VOqO7DVmHoWSiuwiDBIwNqsBArUDyYYQdUnqPLGwnTxpYe7fjIDCwhbZJ1BAbDWTaTgFZ207PX9cyPAivUQJLHiLQLXGbaTi4f5Y8Qd25pNeTbiihc8TAUYI5qySomcJw)10I81OgWxF6hUSaCbdOo)XEhUbuK82fgaEeMJOhzjFGdNxpdxa4QzYXhRlWe)gpUV7Ztlb4uZqwEi0G6P5XR0RsXCejldg1BtlkYlE9PRrgZFK99WemZYqwViyp9TSCf4iqpsIaGIlasayVUUxu8fhldYVTVJjVqUQiVSAk43(HNqlhz5KqDTN1)vrvPl2EamarleoOigiqdVfefFl52WozPNquh2EMMKzZb3VfDahewbJ7laf1Rp9VORGfdILJlefH7y9amzzhCRLbMBJwKghEfYzLuGTxvZk4G603GcBl)4HjC3IceVc5wWggSjfW)QQBHiJnS04Qkp4YKVcE6akric64NF9PBsaP(WKGhs8ZjvYvRd6ZRSWxObr3cVzEWbzmkgauodONrLGGZ4K97VTRNUJQEyiwbllhMr8M0Vc4OxFAiO8d6jOqau(ccn4(Ay6GfjRSaz4520LRwAEUNZ0OTMsOB6omiljp1n0Cft57ZIsXTZjG0sONYV(VyiHxdttEoDvDw3s36ODwFVolPtnnDfi8BaJBb73ZxbDK(xzFSm0y8JKm0TND(BI(A0XzTFy5U8mmyn)uEgqKN)i7DPIY2IRy0(OSn7szBO3OFCjN3x)m2RFgQ0hc(VSaH7GEnNtYxGkHUfGqrdGf8lfByWuyqfPpEvEjKN4PX3mFbFaRjyGSC03yJaeBXU2EesZWQEgXe26WZyhIRgtQK4Y2wZNXrG1yBbxmbwdGY6zCfF)YDL1IYW5N3OnKKywO)xmeN)sgtvdQZjbAGz2and50AT8mtt(GgLu2UEgCIjfmeS2TCdE7hbDEsBUjlltgOLeygoE((mf2hbPAG7uauNVnRBxDSXB5dQRkXD(o(In3BqMPxFkF(RpbcJE9PBJkQ2vGQOIAkf2byJOnAtTAW2tSrFdGB)xPsXmIKd0A6TCWBveQR6QUcAB4P)ZjtFbZdXcS)m0)(KvDhdaRBzQtJHsGMUHRPpZVSjDwYQ04dGWD0CicgtLymxFh(spiyiWoodOrgMMLSpk3rtOjxsQbWbyQr)71dYh1Dl2Sw4fMAmDb2g9qbJo1yxtB)Ay81N(a6s7S9bsdD(qenBqpPZjTdSXa8nfeyEpw9v8(8)wu2VeL(T9qY2w6A8qPiXCXmgKgQRxSMSQdPqwKG7wxb(iSh4OR77BYinF1GGz8Luk6SuSAcW(FBYmutjoKDbedmDaqBEKeBabZbzqdOZ3Rl7PvnXgyCitSbYhbdfWDAboDKuYqxqWgmQKjATmASm8S3FzmmA2IEODalEi7iTuuDgEowYDuWK88TavZhtr9V)W9G1)G(eXC7AzZBPwwnNB39N7rRa7Qx1dnbEmq0vdrZbqF)b461LPWgBupIBS1igoRguKEom)(fltrLVkzgpSThjw4UOlJcRPm1TedXd5vXfGP6if9pb7f5G51xMNTNWlDxqJUGyOMQuZNtcGGpdghxuUHWLD6OJVNRyjutjQR5YyHlYxhVKxcxccDF9PpVmf8WOyFbVw(Wojxl1Anxh2)Exh2nOmn9yliFaS0NfNmb8koPCVLJHUMPNbPaWUMIu3rUCIIJ2SmFD(wybCXsWnM9edJx5dKTrQe9Yc2GemMd3srAayQbVK)fuPP19Dn6yWmWx6(QayS2sNYdq4CQ)GpOjfwV9VTzbnHkZ)mSSme(VuSDdlo57DMse9SZCiP0n9Tn8fwqpLexXk4(b8Z7YrREXBU1ZBktMIL(i5XlohswbxqiJDtzZbKlQN1qYN8m2nHJTC6GjvmJkg5T0byUZNrJ98QZFOJOUHJ9CgOLCnw262omY)xNaSHafS270TW)N27KFs)D6g0F(vaL9qY8cSGvr6IblwG3aNP5cD6u3PX3xn(2Ecl3(1jGzHE226hF8)quXxtqxXyjrWhMLgxtSYUzQPCDW3sOcagEFlpnxZJp8b7qdaPsqdKsxK8cgfwwcl3DA81RhFd(yZPX31X36eG)i8UOEdo4bphvmBhqFDbDpUGta1FAcmu4hd8UISEbOBEQfaMCWSmQbzlIksXjyDSAjOZwzOsnkWcrtp1oa42STJZXNHla7gtkMc4guFAs6AES5U2kZKaQht(2ltH(p1yJ7UZi7J(L0NrUVph9TgOFNwjjfOUXvZrm(GmxGwY94J)K8vjmYHmHfPHapBZfsBnm99DALtPGsvhpRM4FBVtG)3wK8mG0)RGJi5vs1LSn1a5nRIvL3IWkW3rU)cutU2oghF8)P8ua)CpWIvIHoHP85osJSxdstoDZK4(tsAUAdAUhX5ErXUsQwXYRr(cst)6jW0Z5pCElvUrcepg(gIX3rdSr8uBUTenmcpShgTZ9TvIrcaVNHsUMnO234euMOxIX85aIEBev8MO38aOHapfpuZI0xpXG1kJjHDzh))mOtvPdPfgLxLCctDFnB)trhLb6bq5qGvDRIX7XCHyit8IwK2RDRdbJVVTvR96tqmnPibd5AbzBXe8UkGsRf1Enp(1mYGYrt54JNlP3ja)pJvMaJHat5XZkJ8KT2ShxYSfxNgIk4B8V)q2c4bGMHwSY(nfvyDcrfxKebwvKGXgk4LOIvlYIwpRwqnB4LBTQynmbbAkkY6eJF(6zBJfgTdYrz7vRNakfTg7wRl2qZuYWPBQzFYj4HKvRJwxvBr8Ak86KRau3PqWwZq76R45iaW5eBbbjrn9yGdcDIaf5cogXH7tL66O2st3MImm1pLUScYEjufzoIQ2vlYGJDGxntSUNtt5D6(Na8hmnbgDe)qbWDEEHiEuIEtdFTEyhpD9)VwIuxzqE1SWa07RgFlFDxVZrtZdjyECIuqxGVhnIKXEq3LH)AwydJwKNgNsFZGIO38XOcWnYGO4Pf5510(gSUgpf3RLlgnQgdU9jutsmuzGlniKpyBfwSu1YFWsIbhF3AKJNsxJTNVVP5jg)lwIHlAMq8ja8G3G3NjSeI6pnb1AJTTAPn2WY)u2X9mq7qAYWW0HcjguizU8bwhg9xRn2ZxRX2RN3PWqpe91e21Vpamvy4S2(l)sI0sAS)0zDuBkTPTzZ9xTtHIUfKjJx9p4AycE7IRK(Zih)ALXwgon1UyODcKZvum)gMSmzvE1sI4Czs9ea9NMaJgyFtR)4W(EAEKSz)MmVA2)jScSAI91Bzn3P9dyDsZy0EFrQu8MyaOzWUEgS0AzRU5PS0fCGzvEr0ZKk4Izn2FzStn3RPUr793tr6endZc8KeAl4w8m8ReHYxhvsX3aC1AE110TvkUCo5WFh)MHGomM7kKH1skzZGpLt)gkE9R9r13au9FcjZ41qdj0p6zw05G44cPOFQ)0euZ76A5Q3I88uBUpVdS4Pixixg(eSyAi9uCD4kkX5WKVTjSikDwDIajs)ONt2rEr0jHqO8VOBcGW3xby1RUmTsK3f4fndOf65u57oGKTH8b8Roy)VNmmPksCvzdam2AFCq1TO)As)1G(Ro9xnoJpwb(uKqPBxDTSu)AjsMnmy(nqvkQUmvn6MGwISjVUap0Rl7Bc5vNJwBWKmGkG3wVqEAunVTEPjiQLKHDAU49i2XFAJXS3oZ5hJr3zu9ZT60Hso4gLqrR2RQd(aofw4xapC1c72iPG4j9KTU1yFaquSUodiT1C)9UYetZ33c8q7fQDqXSGVKQwh381V10DuohXuprL0lvk62P(Cy8ee4ciUjnUQaUBn(hkzM4ueRD2Zqz)IK7CVS8QbK0IZTUEaOu6KZxWM5RLEpVjQ0ER8cxxEJH7lYyiFJ63bCCzaD5ORg8PBKdQ8Uzt8EPQ3xUEuYowwjs9lC1lFZv5OJzoQmbi)B5BlaF1BMKKcg)xaVvXbCWpdBb0RcTWg39r87JgsAhEwXns7s8NOQRykVDXBuYsNqM2G8BAkmk0LDk8)x4ZqalDee4xt39IiqSwuqjQR0IQgd3geQ3BSksuxeO1JfEV3lrpZI2bsoDu3ZWRXlxLikjtZJN18Tby7xzxsnjYkhrO)Gfww1cg47gDrQCQUbzM1TRQC9eF1lKSgvg)guml)umvt5pLlEOK2w2woPU7(R4HXGXIrKZTvuUoizKePbVoMLBiXRI3RdemTXSoTN5CAVZ4065JF1h1E9sVEIWSvgzk2UAnl7dbHvjH7)(ceFJRXVcdbN4tvKHIBjIs(AdHlQi6TAuNBpcP(AjfmDhMMju8FS17WFVR3kvoPcmFuvMs1b1sMTJpHNg3vTHkPusqaKVehM8vQwQuVZN2V5IlpEszmMt4ChOoxNr3Sitz(Krccl7DYxTjBBzJXHqAnFFGouoylswrMkvgQJhW)0gVjqXeNNFHhrVbSe50nGn2G5O6SlVI8dXqCUQM8fpQ4HKqzqcaf6b51dD(6jIebLauUAnrwxmJxcwbYexsLRB085PFdZhTGITCxarV(E(UEyLDfvGz0JHPS(Fbl360gqPq7FPIp8zVF)aQ(5cO(2g4HDFm4u2efyk(bgk1S)NauQRB5GP9XXrNI20aDY)svZRQJ)KbunhpxpZJdOY2udOIFPsE)QWVZ9AR1v9QFe5veC3iGzy(x0C(lgMV(KU)7S1ENL2VElYQeikzJ7wd(o)6t09zmgPKF91NIX8jLoGbYLubVmE4Ql4exlQs8OeSRkFxHL5BjMG(Mtc4UKz6UkDDA5YKz)WpsZhZ6sz6m9g)41N(VdJyXwoBE7oyME8cyc20l4xlNk4)Tujq0txgcJ(LG4Xi5I8zmykuPF(o676M0)mOmkIBWLyo18tyfM8TfPBMlE3I0AOTSFNHXXHgNE7Yzdny0)lWO)0pa52z0nHLR7XbiVE7Y5cqVVi)3(F)sszkakJkafBhcY87onwVZs)xV4ddU5MrJF)OWBV7Yr49m4dtOrq(AifMSvGv8Q3hYerbQ2KOjMdkisoojd90zj01aBoROq8cLHAIn9CHbyHQs3T7O3eealoxhIwN3Eoext5KH4nNbvdiGBgwnt09PNI5PzBO)iXYcu8Vat176bNQE41ZGh7G59e6LCBSS(7Sn)tM)wxV)j93hdUUX39OPQ87xIG)GjfiBsZB5BnR9gnTJZqOB1BFoxoIRWxizfPrfXlrq5VMdoUSDbV9oKmuFnS5LT83(pwMjEzd1A2Wd4Y8eqOtV95CHWHrBJxwgVCBz5bHQUcsmSENH9jGkVE7Z3buTAv02SdcsDLGO7bcppoizO1BFoxq6daq8Cw0wmH3(yrAYIYvjBRo4wPrxgbDdut3)LmUZwg3Ei12Y4mSPSBVRecnV3zA)NTrmM9pP)(eYzy1ZODcMEd7E7Z5slpAD18KYYKmK(9w8MIfJ(C1V9VxvRXEsk6V4M5BxMr58EN5Z8DANq0PHBV95CHXGn5GdNfBNJaZFfJYx0HaU2YA8ENniM(eg6y43BFoB56jzLGqZSTi1bDN0mmzo9EKp5aaPPw3j08Dw(hhin17TpNlq(B)VYW6OlHQZNVDiSNPr3jr7)sq13VXynWPTLtP7r3WvMDWYGP(2o)jlNY0Q)j93P3w29mAwNGc2P3(C(6ClYqViioSG4LRstksfMpDvrs6YO54Bxbt3UZI(jDe00R3(CUq2d0MIGZxAgqtqQR8ftBWEJt4BQwV95CbPlrdE)y0guo(6YNZxLwLShCz1vKIH)jnCYYO3(C2BIyrBNv(8V9VVP6FDnA8u0If7bxD5pmis1)FUuiDT)tJyif2SJ8hxmR)WlhedT)IMjJFbnXWE4F2odI3el9nP)(K)Gx2Z7nA6NG01T3(CAsxxHBizrphb84FCPiygdwVOiD(CbR)48NxUDgvHkDMgZ3PFkqZV3(CUG2KKemTRidqUnQy72Npm8jp5i1DKE6m6sT0hdMzu8YUNMvsg4ZCcF()HQZhIpBoS9YRch5b(VuK0UZW3RT4X3vuj6JiQJYRifCETACcyIqK2E6P5zjERoqxn04PImpTOKFD4YNWN8n3GCy4Rs(KyXL5xJlzM9pcTC80eQVm3uxBfC4BxrVsFnORbXq1l0c(yxPFH(H8qeipYv0fwS6emMwQUInslVP(1JG6vEGGtIo0A6LIlDXB2AI)pbV1BLVRlpe6dV7qZls)f8Adklax8tpfc1OFek(I3bpqi5G0pwTbA)uiyJdGG98nD0naeJbybhMG)8nlfGGXmV0eRdaBdSCjKOEabJ4oFxdFnntDDSoc5(SKVNQCX05hW8(UUIlV(ErWVvttt3WqZvJUtHBIUnRr3MNaDFiKRX3l160)iOwTn8TnSCXRVeSOmDQPwbeeqw67zyy577yAB0aB6zP5O5zzd4snhxJASz)p57HCLElyluNlFzM0wgjFBQO74dSqA64rUOK308yHB9o8S)JjV(9zHsA0ddU(YwIWijCGqVtj(IY5Hz8lUcz6Eulbwj)TKpmtXf7Os6ghk07M(3sIRUqEfEX7AulVt8ozHKVhWfcoRvFuew1KxVgVcENTLEder9q2ZpMStCovnoYQ(N4GTtNGlqSl0R9S9MSbzQXhtnUvttXmgV3bzm1zXSP2AB8gSV6Xh))8"
	local NoPanels =
	"T3x6YTnsAc(WmXgD3rS2bUp6)rzjzROKP0ksxURnCiyqYuuOfiahaqlRA72p773rMjsacEOY294zAhZ0UOiZZV7RmZBTVD6TtwxvExwUa)y5NevP55jZZfPvjfIhBkRwEFADZTNC7Kn1IKkrAEt2kXI113o72jvLpMCx6crswb09X23ob(WyNBhB9sNBBUDsDd0HvIQK5Lf3LTeNI7Grd(InRxK2iOb5)Ct28hswiAeZBYklOXvulAsQxlMNmpD(9c87kktsZfvnuFwKvNolxKS6PM7ZMNSytXsb3vCvMwKTkfhRK05Zf5WIhwl4(ADE6tIQ6K0krYYQYnRv9a3i6EvJ72kX6YQMK7HnCsEwXd8(vScareuyvYDvLRskGTh28vzqV3SkrdblxnlTjbHvaCX62j4NsAEATiPSkBzwrAocOutttzYJ3xE7eyNjsBUpjVCjme5Lv1imdxe3ozzLquC7KzBU7oaYMLdZeaoRYeflYF6USkb050QhkRsbGboqClxVPAnGDNmVSmFr5JWi8KipV8rS1RsXwwjwOaqzfjLfIKhZkGMIZDddFG9stUabzflsQfvWCNSoTc(ecwwdq0zZQeFkJGF3o292jpwwLVqbgYQtAQsRVNa3eMhrUW0sektMvw(WkyPN0i(mG2Z(DeMbetT4rQ1jaqggMpbyuOFE(aqTkfiDYAeRsYfFIW0ti6r9OB7RaPnW(VjBn8tWmHle5MCVeWzf1nPfZf1jRefBa(cKufqwLRfe12wmmZVh(tbIaGLsTyj0Tga6ScaCnjZkRRby7AGUNOjqiBTi)ogvJJx78P7BE58hG9cs0N2KsZuXM1ifs5MMU9rXvmdwl3NT8(C4)rnbGalqsQ8SvznWChGuta5FwXYK7b6XFVSObOZxMUg25MJiW0LNnJHu4a1BhbdveHfQVhzXNdi2c4)HTK2sjZEc51ksbmB6keKq7HzvLpaeqi2gj51SgehrpKoqmbutsKhYmOWJRs)mq1LLN1KHWtylHBBgssOsah6ghiXM0NC1FYd)uuiIInhV1cq8cTi6qo7qSGlKl5oZHTC8JTdLtan424ipdiozwg9cYwVGS1li72fe2lQdcK1PQayVqyw2NYQlRgyETPHWUDkrQ06KzlPf6guKWffG427sNl(WKRp7Ylp5QR(Lpmznibaz6EX1GaGxqCAZb6GK65OmMK1L1YPX3k8LH0u9cxFRx6JZHeuaKinBQbyEl0wbRvqA92ASpqsaOi4FcVDY7rrdtGUl(Yhb6eyvcJ6DajitZuruTDbVH9HTGizbiCMA6y7WUOXM0QLkmz2CKscfPa0oVNB7BO)tJEBxjYbm9Ne4OSw9TakOPKejuFpQDGj4rEGnZiHbpcC6RtxZ4iC5JZciXheuYS3GWVvPflKIrXwG4HBNCoWW9Lp()zt6IkGB4lFC6uuey1crpYxEVVfvf3snc(urtAwE9x(4jPvNq)2x(ORERvE3DGQ0EJOj4E)0tQTfVHKtT8l8aYT0pdsuGD9krZ9LliOf1L7tLcmKlJ1LGOBCaAAkxzqMckLQwij2o33pYYZ3XnYXkYX1Z727EHVhUUopY1XjW3XXlkc4wCTWFHOYopmi0Z21Zom01pWo2f)fFC9FUVLtGLDONFSLJRBympAnskIwOiTeqIJBi(yh7OqqNXL4Fyfgz7a)XuZ)4eJM10zRyk5jss4gj5fIK8cOwLMw7xqdKAMFpBlbscJ8tg23Gc)taJBqH1jZ2aqVcYqKvGHivpLubcvhh4j1KmVQmpNntHmQOgSCAvkHuuJhljNT9P20ULo2R4pGInu3f2bdnuBwVgmutPAhvCaTtnfkwonpQFeQYDrd0sxBIgSCnzTLShyJRNNsmpmVzpL)PFwP831WYtujiR5g)KHQ7oQ33zRqQ1eKTKm0IqM3o5xZEOE9Nph(jSjmiqIeafsaqyE6AK5JmeuBGgQWhfSoxAV8QS65O6o8ZPBQO)RaePV8jwriz81j8mKcGXw79EZ7gp9SB00sbHkIjLKvpI079JU5MlUQTDHkIUaBv7CX2D9OlhD6fJ1TtRdc5uO2fsT7TJE9z6g5z3JcoMyEgDZzJhL8BGMKRE)aIoaOkT0E34xFZvV76RVC0VzSr8KdPNA5Hn90BE3fN2tCVxSSfwutE7vJ)LoIWutMFmncNnA6B(LXx863mTfwOGz2oQfgThN8MrVD04UYdFPNAbXwem5SlpVLro2YowPyZX2xP1M)EO13C1RF3z9Tgq1kpBgA8lJ1GlKWtrakxzes6MloBY0bLgd)6zJp7T)wlc0Z2o0u7WlTugrqTg4DRjdxSjIKlV6vAW3l9vej(kGyOeicq5(eEEAJv602RpB6wk9vGqc9p(S3n9MrxoebcTB(1R(fJPrbp8dd0ugXrTuBV(MZoBCpIiBdsit705Mb8qjsRya)gRwXCPpD75Vi0kWZ3oYZnmkg0x4aAfaS)KpdAs89DcDTTDI8DIGFe)f0pMBphuJakFISd8ScSH(I)ciI8EOpHEw2wrW)6f76AtJgrcvd8Y8uI2G8zct8iSKTSW(n2XYIx33Nr(EOf)sgbRuI2ub2NxtA6DtyfPWqGU9G2yGw7IwMuW6dadsKnrc0L0IORIlilRr9VltQaTPEG2syZy55f4ydne0mcwfD3g0Oqdn8iYKxHGqtWsc5Q0W6EPcP9AcHuRwcP2Lc0GHnPJwS4QI6piTH5dzOmX6py2L6ehYYEqFdQtBb4NlhMaemro7VPbJmq2YIKvBatatmGDOG2eWqTAYHnw2D9JzOgxu5gOVe0JPb)snevPzli02PNnD0fxoj56lF3RVyCY0lg)BjtFZnG0gAp6AXYUbxcBUh0nS8ELgCADtw)0aRdakjyFDMIkaq9W8cHns6efgcM6TCVGKqDEay(tOLvGVRRtyCSH5prEEowEa5PNNNlqxl)ffSF(M6g0WcYrR)FySk(NsZzrf9vSVz4kGMy26udLFDAA(JPprBktN0Duw4jxVVWossf0P3SQpYceZL0SoZWSLS2qn192M4oral4SMNag(LaFny3jQ4ehdKmLcfr(MLGWa0cNh7rSq8imQHwSNGR0tqW4jie7e0UNtyVuaf5iSaC6rJMMr7iM2H1DxTlH10EcXPizlU1vMePSUXGUO19eKvLfhaFfHtKCbAQdG7D5o5EB3DaQA99PSvQuNMTZoHEOUOQCDlOEszoq9pXGgCh9LmlF4FXDN)INubalub57kKmgSqBf3bfvdulgHt)uA(gYdeSVW8EKn09yBO3X2q)JTHbhBddp2ggDSnm(yBiyd(X2YJg3yF0ih7Jg7yF0Oh7Jf)GUTLbElHbmddjCDIshPjB0UDpUH9)iR4osjpscFdQJedkbl9qm)iv1rnLNp2qfj3lnOxAoO4mYEZxZHbJJvhhTe8t5I74pi9YMz16S4sQHzixjW)YT)61IQ5IctdrY(mgiKHd7LPmpsG50HxpIMhXqx3UGsEsgxc8NLYEsAdxwIHdrkno9wShtKs0(2TlCbQQ7Dx8H3kwKL(buJ3hSFztZDymKj1gTsNvXrbuWbR4vLle5ewaCbg0Cr)ni7e9(R(dJMNT4KkkMZWVlQEngtTx(wG4kV8X2wtrb7dN93UE04jxC1ylNpC6vxD6OtN8HxvMViTQk9dV6Qlpf8XBeya)7M8YvoQ5tlG3xnMge98xOBITQtTnPPvWpUhoIWa1QT3yI06mS)YhVgitYvy3lt6A3b6eS9)8LF5J0NC)N0)X5FkrqTHxsIMBPm4qhJwPTlmb3LMQ0I68SgTvfDcmOK8644hrfUgXTDY2ZRbfBBm2ng3ZPmYuFEfyT1hE3fVq(3xMv38I302bAGbZxEaJaogTfqouVyif2n4NV0qbk4TdymC6DyQ0i7fK5XQvCcj)R1KB5FSScK2rMHmtjAygMdfyJn5ppiRyFW2uk2QGX16n4ekqWNKwPgXHT0Jrvd)BTszWz304dFp34ap7ylNOax74W2ycUJFPnABNhg7e4667Az7444sE0XraKxkKzAfBwnJTpL5y2rNgaYaENwHbHtTRhIM)lF8plj2)FRP()F9x6VFnf8zS1dcJSJITDSC9dIdIcKH20zN)I7o)fVokdOnofzQE2bpt1gclq7htQZTTh)0)u28MnRmKfC6RLahPGaZiBDIgun43(SLVxuQTvMiU3vSU5433vwcr1P0pWo9WU8O3(MRrLJkM6f4Cnw3KSUwMn7wEQAX60Q0gydmz8vJpRpqDlMQTCKScZ(6mob6OhhSN2TMPu)qwbm2Ih)YhFnWsRcaarc31gOYICr6NyL5SttKxjsPdWQPe3iLfcCXOvCIjig4XXXQFw12s1VHlTh0oHgPV8KLzn8ku6ufgd1D7tv)aI4OdisOLEiAslEyxdafMaYVdeuHBmY(KtuwSmBlCqBwpnJmIkIlgF3rqQQLrobWfu2gMZaCDqgMmD003n5Kr3Oc3WROW2jxD7UzxF61t0Hshh493YP6C4ovLWveCEoXfmAoy6IatfmOrVsGuBfZLc4E1HTsaB2imqmue6rN6NQmJe)PjDu0)BVLZx0E3Bto71V9SXt)x1Q2(BYQ(vY4T(VKLSZZyj3iP5pcaEtNuUxyMODx8VffIvY)QzGqQXgMGv6qNnIR8)VPdh7xza40b72DBPeEAPewyGaBlLIKK6I01VHcDAxpbLT5ekYjkROXYLiDggXc0TlwUmQ)CcMfKUsnYk49ci39jo8J4mH7mhzqybz7GYO0Jx4rVGe3UO4anPZd)S(fpqh3c0LXbhjCWqb74aRi)yllRixk01buGWFHNVLxqGxiykKFCSffV7iW3qohUNC10Px92BOST0jHD6fI2X42vQ0eIV5ruQrLcwPp0KZeNh6y5h6hfh65aBXapoQOsuXVIqdsj0aXie1RAy5ZcrnSNaunM)ruTXj9Jb4xjXBFcwUcD66Jth9JFLZhPfC(MkWyOo1oKYaJUbZ1jSnyUiSInKsLxwcdd)XTtopfmlXqhuZ2K59ZOq72adABzD280YF4ZwJrwwsOsPtkClqwHmdSTvMl0wSiDnpt61bqRAhbRpp3G4OaUmg8u5l)CVGWyFhh)aBFFGVmqcgmkEbKRYd2UGj)Wg02la4RHwf40Qazx)UhMFbxhay56BHseCCz(LgTF0Gtr(2bbam3h4SahJKWuj1cw5GOQfk38o9z2b5lH2HXUXqpdDGUXPOWzN)I7o)fpjGYp0YZjWYZIeB16txVcEA6OlbDzNFZO3E2hMT8fRbhXbFWLXZN0WHf9gxbt9mz(jKaLRquP3fMd8fV6QXt(WfJ)1eWK6S8KPyn0TAFrsPPtIn0HNiq65IHCgLN8BNlRzBNAKEbmy7el3wxzQiNVJ8Ig57BB5eg44bejooEFDCAazsOdqg774zb4klw5Yp65ffu6547B5ybuCE2bY0S9JCEr3PTl)rsm6qE58mZUz3m(TReC2gnXVF5NStmKSIc8a6tlNGqGSmO1CJqlNyBqGQpi2noY1vlbYerT7eCA457)AYU5FadT)6Y65jdK1Zz7o7jFJs05ZZ369N5ZDWuVDMphxwi6kcF757NjV8NjV8hGKxoKndhBIl7wCcZ(og3rDef7ePXUXG0i6K9J7OXyDWqqEmXD0mgHBf1XzhkcJBf1YJXxGEEtURQy6zePLFKIJ4Ziyv)nkguwhBiWmcIigoRMNYBdG2xxuepY18FSi31zxAesXVb7bDmfFga9JDbhSvaf7UG)(eEXDeQ99eXLEXkC2xFO)6eHV9uxGZ(Me)pV)7yPJ81MM7bZ44SUzC8NfDY)Eu0jpRAd57wfQ8DROtouoE)EvjkduDxF7lUKV2kd5zxkkBxnl)p7IlzN1kXZOSs2vvymy1)9SRXJ)afTcxQ6dv0k6FXDN)s3IwziOZ(liN)NC9KyuGB7lbHp7unE85p0lmciM9X4Q5yjdyC0)AYFyVfFtRBTMPc9iY23XM4WJQ2r2zEbN91LMVz9YA3j)WN1UFWYLaFSj2rCa)z66(z66EoPRBpNVOVtzTZDFNMXOq3ixqyLJvKxOBGMtBmqT)sqzQtuSvaEQ1bwSqWWJWylalffyh5yYIHyTyGGZb(AwShFcJ)biDDY4P58ZZX4xB66gmqVF3sh1SHdt925s671PL7BzsK(5XN7NzG6NzG6B4XNBhPt5BuEKo6SxTdR)(UMhQNTVaho5uFThZ8V2kK4)wEmZ7NpWU5QBhPN4NPQ77BQ6gnD6nxCY7MIxOktYQFt2IfcD8h7o6QX77qY66SUpmC7FdsCxlEPPxAZ(xAc72Fo6(37ZK9xRq8FMmTFEcU)b8eCh8ZtW9ppb3)8eCF4tW9SFEcU)V4tWDVAeANPs54QxObpyBb(b22X(r2oH4TKQmjg)xr()8D9IIDS8J9T8985JMLm)FajCuKtODOnN)bzGM)H98d(hk3HDQaSV6ee(hPk9DgSk9)V48hUZtKYZ5u)9dswnoMs8DV3jB)mlI)mlI)yKfXM(3OZR)06UVqbOicOb1SlMlefpLupNY6JOUgnSwfKm0VN3)LpQbm8ixLXV6c55zlilcaZYeva)DEs9t1nIv0WYV)g4B9bA9Xqx8ZYP4S8p9Ul4aU2MBLhEI87gV(Sf3LcWO2RDB8kWn2d6(87X8pc6HfGvHl6HJXVNEWoatI(SP7a1aqwF7yt5)3rLWvPwRPxDn2NCXY05O2VWqSqcazl(wUwEH8rjEYt6ge5cgW5GvCGBKJFKRK55r0QxFx)WGalllqhjxpdEsbFX2aNUtm0JGO4GyzN(SC(CI8CrtBbRLLZxlydL357hB7A547cJIVxGwTBncqYL310pzUVF0U328vNrxaWg70xeasicJ8bopViqmqSA9QAXyhBNxcBgpqNpFdPV3njEHSBBb7XOy)4qVO29OCMcS9aHsbGeDzNE(BsuXv7dvJmMYYOqRF4pq7dxTwP0lYWEih2V5xy7XfQE5gWGi(g)U9M7gMUhefjG8Vk8nOPyjXFqxb7QhUchd)JnUEXrVWB0xH7GDGcqdB(ckOyQhQdyylWhWaxNwg37YtxYIpGLe6P49zI8fYu7YM6kVm97DbIRKm43EfDZYgg6weVxJvxB9(dCrI3FCvdlFX4352e3XxFZEhyf7go4OBCRsVJ2JdT2wvZloC4x84RKF5fWTIyC7PX8Ye)LQ2dgCy0(E7KHUFX1lWH7s3Rz8DUD2ct05Q6EFBPEDT3nmUEBneCRZnnU5sYPZKo4Sm0T6(ENSrGcb0uZJB6m7zNR88(KADOdg4MlxIpd6EBX3bf9g0POJdwBoBMx377F30HQR3vEUpAWAGMSiOhLQTMuDYE4JnwwOLOvLPlMZVUwg68uV8dGeeTv5M5ZcTgARx7gTzbTVyrjpieRtMjq3Lbf)Ob7iADan9W)z1SY8A2VdqQDzJ0DsWXyYVOPS7aQ7Cl0EeW3513NnNILa9CcrgKWV3wuSD69Aqa2fTe8Is9Iq43(AsWVvgIfznd8GfHVDt1CIIJKp(fKZ2QpEDj(QX4GUoNUiJewhyPxTGrI8la1JKvgLlkBtNkbrA0zcthT(opIuQxnjF6PtzxpvgE(w6NkdViRTnER9TFISAfSLl5UQ0LDEz06MdCYFl(DEJ2)KAFm3cqxtRBn6DxbArdgxdiI5uaW5hAKwTSCmgApvPOgjzSlOmzCWa3sDrOBorau)y6AeNT4jWUnyILWbCgivKj0la2woyrQDpMOIJBxqN9JlWsPb2XaSCfhTJI(gyREBhustSL8QUThQe2jdzaJ6fACJqvn07)t33ZOGHxAek6omQTgx2cn58BnMz8i2BOwuoyIMNAzBhf44Afezh0AJwKNpyJPhWhawXfzrgIftEk)cp0upxWpCBwUxBnqDGtop)kxO8T0lYo2naCl3o0li2tzESoPFQx4P9vvAkgEfarA3h903GDUM4ZycrmQ6gginoWXq3SDmynPwwCR2zBT2psC8yWd6WT06fSLrdbCRdCBFJmc7BTq)HgWe9KYBpOkbOH2TuK618UARZ2wG032lB9ElQ9D)WzlD692CG93TVqkYDN9WRbVDTXgai4VN92wnpiyFTw3y3q5GVpC32T2aA4kTfOlez7UeVV1tOV(vNJBEWoX4B1wW7V9Gi3c3yqCpWcXn00MUX(r27HoDRH2BpnU3i7e4Vhi(wnoyFKFB16waIEzeT7wVxs7TiddI3fT92Tn0AFlK(n3O17wStFclWB5Dd07YTfAVZvEpyITL7Uro9guNDsO2J8W2YBpa6(cCcD3hOR3qB04bOP3Im1DF8lBbk83ZcPN4Sa7Dcm6t15hShEL(i5wELTg3TAQ3EyR6rXrMMunhm)FEt2Na1MurWPmLO7dJQ6XzZ3Q)VSpTWk7n5NS3wRnzd2nFv6KjGibnwCLO5pSrBS5Pgv44bm(cn0VZZe8w9D3MLvNUAnAYmns(dB8v)RdGNNfrT15KY6VaFT1)ONin6Nm3m0a6pLMZwDoS9pONglsRwKqXrDwNqLAw0jkl3)bcBmtcEtacPgkQ3hLrUuKz7BClNmNNWG4HgF)zUkM(JGyoPfXWVGCDijC3fYH8bufPvNdsNneUeZOCE5S0t588do4lsFaZdfhNDmEN0xJlu(BwNUybgjsKsLFkcX313m01BLH3(EH22HwUXbbrEorrsJ(ngenzyyNVUTeh66wKLsgKLseKLVjyei5QfTRJSAJly32rNEuMpa5gw(mnYE1oGsNzISaEfxWi2OWqmw0Y91s8bxmBE)Mp2ZjElqKCKcbqegm7OGqmtJQrAl4j9i4EKpJQ9acAVGIDWu5h4e7Af6gRtuE3wBWBT12Hxg163m3TNlLKKyRbwguN5U1M99bsQ2UR0QAzsz6dFmXZfCqJAy62A8rHMJtffThQAK2XIYK(JIVWH4CjkKTGse0rJ6TCLR2Uvkw3Z9ZWOBTKaRTOd3lHTAQ78tD5JuVjNQxos1BcTVFpabpIOCX2xC0HilBd9qlQD46uIFM0LMDOnKGM3(yN9ZJSfG3eOSdSIoOxbDwPAKr4qKi7L9zaYnkPFZu)eLeYA1p)ygyPtnQ3r9w(VfWUTGfhyBCeSNgeZdSlc9IJITcbrxGNMUQ744brAMqLbX8YPQpeBV4bngiYMZTkA6xLyohy0oNKemyLYibQROQ8S7ejYAuMJjyU4tu1LWpMWHTfW1MLjRRelYMJflodGLpdUCXpIluqjwtfAwa(8cxw1WN)fko0ujInpD(9SgYjzRwX1tEYgWwukgpzP5YYObL7SEE2Ie(GcTG7cojVIQGlUuF5VvzjISI6WGsFVyoWK1aMZkQKj3RD6WNjESqVWcjHiNyGbMoovoWnxN5G9baDNOyog9xSwWyT1G11GD5Zf1yyMdDCJSIIrcyywlRY46Hztb9eqlTREm9MBNva4S816Vme0LD(7U8YKtp7YZMEwY7Vy8PGbsaeG)ucL1MK3o6xUy8RXAlAc8dtF1BsUE04ZUm58lUzY0KRU(SXNDkxgLIQg2sKAJ7Rjz9fclHzgVN7gNAGlgF(vjtF30RU5Irxstd(eZVczG07Oz61eMPRK3ng)puBXyAdOnAZC11tV4QXtKRV2vM84dKKwuaqY58PaDEtfgxCmS8CErnNm95wizcaBE10URVZV6MxFM(R48JtHDgpLT4JETovjkQ)htRkaYHKSf0ail4oaDtwQL3ER8B0qDu)T43bAvmRtADMaTELtFDVAIdRrkzvxXVB4CUNL5zwVwP1xoM2eqmgqJZvSht2DaInmRcYshd4BUlBz3YXOBuSX782pVo2QrqzohKvaRBHKjoz6RU6edG487tlW8KxMOCkHkRgnxKIFfzER1UJIz)gRHna4TOSqKScO25m3dAUTKI9aURgXsm95QnPqcGh(N)p3iQEsEomKj0krYmknAc1jOo1cKCRt0aqwmYobGT9H1SiL00or4oGffIMnWU4SBfXoTQITdd0E1h7zuppTqQTsBWcXmqkRYDI1PfICU8omOJ2n9wZoHVuoZSAjQgqy3GqhSJl6jXDSTP1YtElqeXUsnyXw9iy4xc9oGpwfikQwNMmciY(YhX0lUZo)Er6AGs7eGH0kuDOMLgMdJWzfFkRQSa1N9Lp(NpTc8Tci7(ldoCJOd73tjt2C3DLi4rD0NXHlAGHBsoGZ3)y9k8mMGLY11Lz1W60YrDmPPbfGH8o98m8KUMNdJ6BZQQkR(YhVa54(lSFgUOvqQZnn2ZypVqjmcuqiKlO5vajaGRB7f9CNpwfkv)4axEJCEvzDZSY8MDpH0vWYyvCv9hy)FEAt2Yn7acq0cjJQMdeOjVfKX(wYHGNuhbBI6WpY1LmlEY1BYbz)GuiyCFeOO(Yh)pS1Rfhph9bYw661alM88DIA5fZBtxMnp5CKZsuHTxF2TXbnyObfql)LDt4UbL0DoYTGnCY6ma(RpL3ezmEJ2Wq8tfFcCSc0oqe0ZF4lF8sbiohMeSaaFq0O2TbOVTQdaoni2Eye7Wbzmkga03cGNZQbjIZfB3F)qmtFQZfoXk45fWmIxM9jag9LpEcOvd6jiPh0Nccn4(64gWHJIpO48C7ggf0o33X0ODMsOB2b8swrEA7aw7Yt5RZtZq05uqAj0t1F(F4OwVoUU8CgQ7STNT3E7S9wDwrN66gkb4xcwTcgKxUc6i9Fv9XZXIHpkYWWbW8xM(P09ZAFZ9pvMJEw8RL5arE5TSxJAkByA2fLTBFkBhBJ(Xp8)d1pNT6NJUILH)pwGWvqVUJpC7avcy()YNqrdGP53lryWu4yhFlhVlP8KilhgF9gmSHaz5zFM1UlrXH(reqZXRDg9dd2Zm2J4Yysvex((wXmmcmZAd4pdWAauwpG74RV)P6wrz48ZiAhfjMxmEhsrR4YhZzQAqpnjqdSFgOzipKALN56YPZrrzhg5W1b)KtadyRxJ5tg680UCtEEU8IwrG5eefhZuy)civdCCcw1LBY731aFm)5ux1I7IdILi3lrMPV8XY7(YhbHrF5JVnTQ5PkufvQPu4aGnIq0UwTl7ijI(sa2(NQPl6asoqNP3lWdlktSR26UcAB4P)9IzpI3Mcvy)5v)RfR6pgau3Z1MgdTanBhWpCMFzD2cXQS57aGhyfqemUAXyHXbbmg7eGDCbqJCswUyBqEGLutUIudwhbrwdJRhvEwFuSBRWlFSeB7Tyn6HEng0cDD9JBxJF5JVb9vDX2lshBovnUg0t28r)cqmaFtfTmVgpONmE(VLM)7PzFElGSVhMEkCO0KyH22SnItUyzbzvhsHSuGyRZbJ)3A5yBhh7YaTy9GGLAVsk6Im8KoH9)TIfOMsCi7VqCWKUI28Oi2acMDYGoHI)FF2tVwITil(e7mbKpcgkGyAjm9mLKH(lbFWOsMO1ZXyBe5V924K0flhG2bS4HSJ0tt15ef4PWOGj5LBaQMFjd1)(NVgmRh0NiN7qpFgL65zo3HBp3NTcSRE1a0eG0cAa8nha7ThGlkQZaeB6aIB8TigopdkYi(4Em5v3NHkF1YmUzZasSqSyidcBPmT9KdXnLnZRat1rk6FfWfLG51NwMVLWl7q8iLWedTuLwXCQwN8EW44Q61eSSxhdIJcLBHwkrBRqgk8QYI53ZBHtbHUF5JV)(mWdJQTf86fdys(ofYYCF4)hDF4Bqz6gXwqEdyPplozk4UROERTJJnwC)Kca)wks7a12jDE667llk3aBGxDp4gZwIH99KMZPlNgpabjzmpzdfcbGPgC)93rLMEx33OJrlaNKh6cmapg7Z4bi5oQ)GpOIkVx(3xVKMqT5FoEEos)xQ2SMfN8CNjHSN9MdfLUBSVtS0c6zK4kwb3Fg)8tLOvV1I87oUPumdp21KhV4COyfcbHm(MYMNqUOEudjfyr0kWfshB5IUrPygvmYO0ryciZPX(UMJFOtPUHJ9D8IwX145B7hWa))XuGneOGT(R2E4)V1Fv9j7)QTd9p)daKDJ4Ukmx(iDXOLlRahUZkL60PUtJFSE89JKwU9pMcMfI3mN7F8FtA1NeORySKi4dlYM3sSYUzAPDDi2tQcag(yViRq39p8tEcnamRUbv2EsL4rm8QSewU704B3o(o8zfNg)WGyVdS8pdlvY14Gp5H0Qfpb0xVIUUbXjG6pnbo6jikk2rnbGPBUUo7FcE19ODmi5fiTEvvzjiM66CEc4(3P2)88DCTnHq2UhccHhUmwi4O8LPvz4oOyUggzZMXe06(MVhxDjYzWXl(qZWdvPKTHNHwOI(onQQwQIjgeFf2PGuayuSvSIg1hGy(hagDdy7il17nLfc0sUn)oNS8XY(3P89aJODJ0ePrarCqWbqcGP1IQzv4f51KgrwHe(tD9wo316X23n2Kc9qi43kQe4L3bcFMIvUIM4uIAn4DDdc7q8FOLnYBTGSo93ZEaL99(0pBq8Zl94w)YDc8mrSwhaXEozQ(jI7fRkBU)prADeTBaO)DQbnWAIqRa5eaQubrfH7FcMwUsWKMKhk4mCQ4tLsLPoUXXbDQcnWMPGiZTa4a7bOn3ujEai5))c(zw2OSgIDzcKEXwqPlinp6SRQin9Id9doa29xlZaeW1Ge0AmYymnj3Xovzgk5PdxL1bL8SAnAnpjy(vvpvt3BtLTyxwYtylBBSBuW3CrNH(TuNoAjBbwGlahc52rY)zys6yWo3xAWB5yJJC0QT8bR6CoaPpgeG5CoirNjtREr6lUbmaalyf0WbLR8YbJMTqdjCUEF7KWfzfr2CfQ5K9ahi9)oWP1Qg2ki(7bNwulVmEQkvBbx7yl)4dXjKdgQmxQiBo41NqQN0fpyse1AKHI4yFVouRhGDyALaZjqfPgykE7(SkRXGALhFhtX02Dy3oSAYcHzmsUUkdVkxA53i(HOwfXG9HUQzapi5rhaa9ESe04ja8MfZdmP2V1Y)qIkkYZqCQD83mKmpa0m4BkUZuzMT3beN(krkyynXam5X0QvlZtlw0Akb77ruq74J1fLP4AVdm(Lfl2mx63kOmJDzRDcOtP)4OWwRHqTOsqKRL)bNGBeRkslAADkSGYWeXitDNg)wvYHXA5s0ci4aOGjIutNM58WiKGOWaqlaF9XgBypNBOPyvx7dzRsf5YaAexjcQEQvSkh(S4wZPD9S6yrH7Huxcg5UQSk9bIgTAHHXkeQnUvtSDuGP6g74dazgntalCe0tPh5UYkz0EL9MgEd(xBNU2QCiZSsxG1aPqqIPFlMF4gz0KX7(igSh3Y9ABz7RjCco4WF161KRryGXVQsfzfvG9C4eTf7zOaW2(RwFwFnyXMmUTUHf7aS2hy8XRzmcYN(aRqE085vk4p1FAcAvidyxdB0JTdJogdHUrG3ojK(l8qMLQaq2SpaXTQGd9cT7Oc(qYNF4jqIzvPCWHpbiJwfKS054wgxhNosECoK5wJQsFXVKwLcZu68zGFylmgCMTQ1q6qmw7gd(HCGHKvMxwTGG8BAWB6JwLxoK)lnTf0U4ZRtWNH)2k8rwxrpiEImZSxLEWxfg9QSdUqNXJJ79znYcQaVrSacThYKfqFUytcNGFDI9FoLostQ8O8clyS1X4GA7r)Rl9Vo0)At)RfxkhRaJofu501ED3otx1ZQYCbRVb8iPY1BOSQa6u5vYdMhFDtywQS4VHaV2IVAnwKbu9O3Pk1nQt8oFF7vByNVwExJ0E9hp0VURXu1z9q35sFyhZ4UkeyZ7xlZ2RV2LMW1MYNnEwYdnQ2h5KQ3iD(6doidTVoIvANj55UZKtZZBdUt8RXLCf(d4bmVGoP4Qt08SNOIjIPEsRFirDx2CmmEscC5k2KgxFE57m(7QkL4BVMUvpdv9lkUZTkFlJvsho32c9NQvtUqanlel7boEgwVmwD5filAOyzfdf7425UufRyVZh9UlvdQ6(SvEyn21DUdMsnznDH7E1X5iWgRruvLn(3l3uboZzw9Jsg)hbNbWbC0VbOG0kSypnUbRfuEHjPDyUInQNs8RqinvRHQk1QsDMiuvciF8lWOqx37CS8iNdb6o9gw8f018kUikOR5r1Lxo8PgJHBnUQ3ASQe6le)2X6SlpxdEwGxQ8yzyjFXmkWl6VuQ6rlNVW8WQ39CTO0KmVSmhr8s9h8vzGSsmpHps01yT2Iy(nRk26cDvx0M4X(ruG2)8cu4Q86emntwayLYFurrRAlx3W9)wmfmOl6YsOTHQWbf7JS02TXABtkWV)2axvaVC7jDQ3VJu6Ag1El8zgl2zdSuNn4cDw7YCMXXoNo9r8bRhCCjtt9jV7VQ5ROo(YAaH39VtWuQPveU09EAUuF)KSgXkCwPAfgRqsmEq7ArJnqswVJnWEaeifJXndq)TBJUWubgvALXpKdjArxRwNVPMV3brHFlfRi7uQtSXSRpJUdoM)qY9mtnN)iJxeI2bsT04XrvHzKOr(AGinFEc4tlwURYs9gVJ(5VGGLgxHedodYB8bY6GzTcaO7Rrf9fDch7kltFkZWDQeoO4s1x)Hz8na)8sqAvFXgICagkydTKwTOfcITxDMcuwwDVm8zlWBceuozLA5174UjNuTOgAN2xsdnp3J1flQvHOdVlRQMV6qyrPYJFNEy4RvsXC(Ub0SU93wwvjIKAVws0f(l)mYSIUytWdbZMzj63wckDxOLW)oEYbYNG3sP8v6oHZv)Dw9LA(C1lFSJ8zBkRwxTY0gKS7JVl8AlJC5vo)0lg)BjtFZnNnAQAHqRJYeSRML634UxL5yXiA(iEtqB6clb3sgBh2wGbU(jTcq3L9CdJIdSJD(6E(6cd9SSTIG)1l21LVmudFg3cLQNSNDHuCgcPSl4LQ2zheEDmysL1EgyYdbMD2by(hRxjq1dE03eWSZaNcWNdy(5bG3jD8pgxJQ8LpzblNJVFCN1xqmxE8Msfnnryx2vyiV04HBrjS7MrxCAhjKKauqM6HKos2UUGFGjuMT3kGxlEVMnpuEAY0cpznVxn7VlM38k1zSY4YV8k598mFpuYf0hhbYZsXQF5cWWKpLTyd9SFq9q1ZFr8K8c7sEZIIFC4jEYMztXni2fCQ3EYgLRhFm(mRMLHH9CWbzm1z5SPXO6NYdKO(2))p"
	local Panels =
	"T332YTnsYc(XCInMEIyTgu4oCe7dKsu2kSeLwr62tpHdbbscsIrGa8aakz1Bp6P9)48Y5By)b6FSnZSUGcGGxSpU7TNDum9ilrwxYkR8EMvv3XUB8DJwxKppjng)1YL5pfgveNffwKNghMmnp7Uj3nAA06QnfXHfXrPy7wI)BFO9RJttNgvwH)XQKYPZIQIWFpAtb9VXzXflEg)TzrRIwed)w1DJkGzzE0my8ZGrBi7UrWVm08UHgNyIFFzfmrRIlcHPFEYcCgNdtc8bBwdZqCjct)7BsM(q4S4Q4PvjCWSiUmUkeaQPHtJMUmg)SS8WO04IkQpZskJMaRRvpxTmzA4SnzlI5DDtzCyuwYQiCScJMonoLdRrPPHRtJEoUOeXmHlkY3Sw2JYPaAkLp1RZlQcretyAs2d009us2S8Nk5R18nvIfl(BAR2vjW8Uzvy(JXf4SnnF1KOQWQKvXqZnaK4JXzWFxen9H4ceza7pWQygofZZHVAAEAEbFWX)ZK(Pf9tB8NvIDwaAFAgGtRaOoC9JRWbaa24gdGXjmb0Xhe6FTX)1chiAclxgblS7gn86HdKFuYplax6pNhnn(UrNxK8ZVC))ZnrZkacJxUF8yXeUmozXsalWC7g0wJKmZlaIafzzvsvAmr0vHd2DJU86pD3Ojaszwr(6Mlb(cGd(cGNq1P5akKWBsaWYWa3NMvTe6JJb1ieaRI)csXF3OZIRIsslF5(rXaFrs1ZW(3AKib2wfWxfrtZjaQYdFAz(DJqs6YQOSPXLHLXlwb7GLH1tpUpNKfMdZKGiHgNrv55PvjRXfT4xdxf9LWOjjPjvjaH)qxCnx0AhZkWvSNr)ML63OLUVN2qtJ36yGFa6WOOjtkIFmHO6PpaiGNb8z4YVdYkJtcyEUA4vI2c3dq2ISz1KqkaIPaiwnaXfcaDiEgmlfGqcserYJjL5fhd5mGp3ugozr9(0fzG8bKQ7ZJUzWLx2)6R)WNhHINMKN)WBUbK98gG1d2qwcZaW3ghNfUoVumnogEN4rt1BSCmoXbNdbQa2fR2uc48ASTexlX0QL1qhyZf2IGF4D3OpLxKoBe09yG6bwMXs(hAbgwquGnrVETXTn5w8AUnwfvSqUtIIQ5mHaTZN4T990)uPw2fXPWo9JX4OSw(PWwqvojxIl9FfSVuH0OLBMGO5WNaI11rR57ri4JZIGDKy4bbwRIYMjiHXwSBU)j5fZIloa3kNQI3YTze7hv0N(UxU3sT0YNphK93Ae1r37NEsUS4liXul(aBGCl6ljRWv9Q4QL5ZiSf1fUCWjkWyDEsgb7vv5R0itNMddPGy7ChhFdBhtlFtdFtlB77M)ghBeUo33Y001X0023h4wSmWVHOYo3Z1ZMzzZ88SCCzbw434GW)5ogMUgmpBNadtllVa(OvjOiQXIeiGeh3s8XMmFphqik(hgE(mt4pgR)h91AwvJLIUKhFbHRVGxWxtCl0R1GsZgIyGDSNq2cPwUKsuXw5ssJkPCh1FdcjPXyeY8UkQ4bUajXgcXhlvvtToe0HcdZJGsBOF2a0tAldtQIxfMg)iPmFePgwn6mOvZIJQwgkzPkxdZ0w6T3HnkkT1PXG44S4NMKxwIZYwFX0LWFgNTGR8sQlGZNfI9cubSgfTJKEKvfXPZfO5jsymnxG5lv2FnAbkedWrBMphg4KuyIrLMjXzZsFEEcY0mdwr5fr4KddeVLR3uSgyDb228uyzcJWZGysuDUWgnqx2mCjIgZrlJSnRraaTBzIUInW2Q0KjCSfhuNhTjTcPsIsxVmcrwoiCcMmLKTie4qs(zGTbSrAr0AKdDBSvvEXILclkLMRH2dwnDjOWnFfTBHsJNqBYLlrJeNc0nzW)NSvLeUo5zHDSvGLKKfPefJUjB8Pembebpyf3FlYkGC1szFCyjqFrQmiBqabErfZclFiry6zukAXw4mGKhKs8nBOghQLDS)bn4YhynBynBO(KIwOa0tvva6V8aMsjKDn(6BGVyAejDxzBezN0ZG6rgsL(fAV7BY2R(12EzsguwgTAnIDPLJ1bnFKeeiK2J69ecnsq1)pgLY1h3TjARIxLx8Ci8rGoABoVMCFd2247sftbhbapkEem1JSbxAnQKyKtUZ9dGOfWHbeLbOuUrqa(UaOQdbPjWVr0P4Wu986yUM6Add3SEn4ZIueiItBkrsI8DmQxsc2TXYnPZ9DCC9Tc8mzoggUEMCLgvDiKm6lsHKOIZnGTQLpfTgTzD2ZzrRaAib7OUVs4(MKljCYgqXwwPIUe3Ni6ks9qN7yvcenABHeGObiBd4IxcSgclFgCUBfrUnnncWhOQla9Scbfnl76nB21zLFwyjWNtqPvLFM6sSQ5TKWYzrewNJwtvIwPnc2udJkfEZ1xBlkeKrTijdPKG9kI9gmK7tVCVcm4cTks4ktsttMrlhbDbanRwl4fEJVgZGjNj)nm7A3OaAEnS3q)TvSul2v(5ZtJwWDCs64ydhgrDF5Oe2TmTFAA(gqVl3v(AxYbRiFaSfguswGYrYwq2(rsjLsbHodsMLu(sJmvwL64xlMGrwDbQ8a4jAsy8QjXZAjje)8mKTeCs6lkwzdufw2cfdgPh2uyI(oKnbFjolCzzpbMcz7y5456Ayyy6XSrZNaRRaXwN)gVaMRTNzGVjWSe4IwjHMj8fOtEEgMM(2wMUww(UOLv2EiKb8ZrtFw0aBWQlW)qld474nyjAiNtaZYW0XcgChBxXG(SQR(wgwG5CoqhHj23I3GkSjAR7NyTwMNoy44b3(TTsrdbzgWc1pWjWZ2VEH(gxqoINVldmK0X1Wkq0P6vQOfWxAB77WmLT4iwQa5T5ja0awUAs2pssCbPzZqlxOiyae4wMBZ2d)ZQj5PLCjsezkAd0YK40zLC90OibLf0JE)hjStd1nNaZi3authHshcp)PE3E7fxVRglvprn9MEx27SlgURXvoSCRHVQ37gOSbgBd1y7axJalVoh9bJpu7XHwzgWz3(Xlot1dpBUD4cFWL44TNMRUE4hu9s2Epl923ALC2GEJF)hgEX7EFhay3DbqQxE9PF4OGUw7hJEFVR6n8GyIMD6Jd)WqWaLTwwDH3U52lgmQELupUMnG0oMLBV(DFCWr1Xgy8EGcauB(XnL6G6GHdU6N2f5wdAHbW2AtQE5EQRMrKT3MEp663XTjPpBFC47U96pEZnx27N0MV9I0h8Jx)b92cYwmCv7TUTOuzks1r7HpwB8R22Tj00fWsgUYDPLkG2r4xXG1wQPezzEfpetqNadnNxr6UaT3WxQpY1EIf(qCmyQtCzv4AqLFEXkAdEB)da72swSiUqAvLJ0LeY2QcWCZhPUXvLVOiAnyNo)d4I0K(Z1AZ11t6vTmet2Djn7epP33UskaBRT5YKSy2sx092scMnRLB8bKrk9UDWWEH)0GlVuX(XAqWz6SBkgB58kbT2I1ykEFrlmSBlcRj1DWUKx5jXxmtjGz1MLwfatz4iTz1lX3D7GbdBb5mD4ULYHtuH30rrVA1HOktvedeG1wIOA6fiU3n4YZRJUsGblqgTrW(EjSZ)8oef7iPiCKGVxWwYAGDxgZt3pTtmKbNDNcCCTvb0TXidMnwswycwPmCWhhFBVl7IuPdXesKdyhJIgjWVTYsRwKroTfiGSAGLXLCdLKEjXDxjEwcfiHjf5rZMYtHKMLOKb0ru02f)6n5y0unbJYkIMLG2KZCnuIlgLNnnfZ60tK9T5Z4XnLCjLeturEwr)n3DpcDw7WN0LehkKI7YGABN6Csy7BO56A1sWDXL5PZO5jpl9z07u0l3fnYVLmGjC31qmGMFUGCYNqrKuKgAf2gUN8ibbqJaMDsj(ctYg6W1wUEsbnM8qAq6JF8cEMjubSD0dpJ(B1y3AnibDA4QCo6uhO4XPegGs(3GYojVZxXd7d5XqFTChUZ8Pnlo75WsmE7HRaNRrFe19FIlmw4uVARHpuWkluAlEgUHsz7eTm233YeuF6faSHbo(2sBNV7CBpMJTvaALVBGPpzkogLtK0X5KapphH2qYmAlO5mp0DcxgJpmUegcq885c926l8qVic7cMAkddoDpsjIzos6ZNGkJhnAqDu2IsAhWkKhrAm4bO3TvPX4Mdg(hkEvuK9fnrWUYfP9g0RxKCFiHmbAIcWpgBpplxBW8EBxtgJHHyaCbA(gm9kAXkNc3hbIWEc4IJam1clNi(b7neyIi8rrbiKsn9bJbGExkj6WYWs0J)zjfI8dJyjklVOaJO0KfzHRaQ(Kqnuhsseg(ueqoUooJhTQYNsqwjK0bZjEzn2N7CcipaylZ3SyPm0KCGO9xwGj5BI2EX(sXiaDe9lAMaUNjfa1EBomnzvsD8WEdgCoARLddeAUpIL7Ji5(ioUpk(PpplvJkxJb0GVPlZLrLAnZdqafclkUHiDbXHwhUJAbbrvaCb7V8QgqsqiPyNYfdj3N4uySgKqhroHQxA1byoWKOsNStQuvykvi8Fm5HY(Przpiilf5LP7(t5LP7VXANFJTqLhNxajyYWzxjLrtjusgQcL2DFmkDdLckSVW8EKn06yBO9X2qNJTHUhBd9o2g6FSnm4yBiWtCST8O3Byh9Md7O3Dyh92d7y3F4cWxStwdn(PDNAcrb7KKnpFF1iev2nhN0AQP8PLRLvWntwoDjQ7GmCqOTNlCRKxte8SgXtDo(BKdDuYi4PCLZ2HJZTYXrey4jYpMwauHkvlECcUwNOkuM5rKodLyR5jFb92R7IIqdpjG)6q7rD55wFawjv11mrOMZGeESkc0BfnhTvvIBvXAVleCUgcM0p85EtNcYDW8S9Y93awmI)X0NpPQAoMe06LgjKULYdW0SucxVzn48lzQwkylhgOBCGtM1VGsrb89XfVdZa5jxzIz35P6wtf(WNh8xVP3WrxC9qdZpF21xFwVZg95tbBxJkkI(8PxF5zG3S9aVx(4OtwzkNp98gYhtnYC(hOAct2P6MO2dMUPSctwik0D0)lC3M9po5L7PFZ6Fq)J5)Ow3aUGpMQOINZnZMXZwQwHbyBGqjTr895fqaaLtPI4sAVwdkDof6XOaK3TQIOSYuqVpT80YOgMvajf2oyfrDFF8IpFf4Au0NhZBBP8xoPArKwPK0Ms(sbMUb2DIOdGTkpGH0hTZgCBOvDc41SaxorthPMzEI8FRepqvwrtrnDqZsF8IcWNgYyefJ(eQI5Gz4h6KVRncQp320p)P3FX4b(FXxomDVMBAmruHUqcCI0nSa9pW1Mfyy67AXc8Ql4JD8n1LsX5EbyEjCSmyMMMynDjlVd(gcjUkBZQj8YZHZBSJojwpnc(uF1N2bdZl3)dcoL)7kwN)B)52RuDrzAlAxpFMFaZ0Wc8lY13vuXkM78BS253yRjw)YoH)l3wyVKoCBZSp7pLmTAZQAIc(Ahj)KFYsGFkL4P0iqoNkTIYZXCk)5pEXBe)9LjLvV591DyB8cNi5DPyfI0LUPJHZplxPnIO33vbp1y4BKN27g1TEbn8GoMv5DW4U13gx9ew(jC3eXYZne8INNnEnDTXRJkIQGfNO0fAIY3IhKeYsruyy8tVC)7aMAX6DwCze0ty0fLtbwYky2khVDbrULE5wsR3BJf1FCD4tQDwr4wew9nCVIA7oMPYRBpdm6jBwKWJf1tTCeLCqLSAtSEedDf6uYeYUhqUx02ox3WLY6GCpIksrqm0OOh5jCfv3G1d0zdg37IlhfoACVXFCu)E3gEZLF8Dxmm8ukWHIT2D3SBo7MrQWQHd8(B5yvWEglR3beXC(bP)o9WAFXM1dDCNhLTKvXJ1vNosv)E4F9txXRtV9U2gn4Dxny44FVGA23fO(ureF)DbKn)ka5kH4HJaHxPhVaHNXJ0k6jrWi6lJffBBgxWNgdxpwGf4tJPDGPLOyjn353yTZVrUWBQeed54)qvYu45rGhY0(Yq(UxCTE3OaUQcJc9H80jPf)T3W4XU3QwGvx2CewBdQ2mmzb)0kOhrozO(0eT0m2vQq3BTTKmBLKmdmKy1fVfpWHKzgn9bnplnMNsoz4RKbZLmLRkpNQoYmUCP6i9jk39m9IC3c)74S4vI)IIQRs(Ficd8tCY0I8qvo)QbYg11wdrMjz81pg7CE0(kZOmaWDvw6BXwbAT(ladnNGH0b9fDs7YyVH3kQsJKhxxdrvyyyyyz4G1VbZseVyBvPF0)6XJV(QBP0BvhLDsNKOm0voIxdsctD(UhgRQwXCJi9o3Z0WXZXpWZ2mW1W1MZdPhr5qQSsBgwzlrCe0uRDew9Wd7OQc8Ni0C2Hg1MHSSjHoArHMrEnuJ3SLuWHNUPa4ZR0ZpG0uGMCSMEc5NvDeMyUh8ycLfk052QRsHmTfc)XDJopAwSUk2oc0poeRZltMgL)h3Ct0YOfP8hcNslhIVDSqlXePThKx71hYGMsveo0auBmFppBBl3aFxE5VBlts252UEbyzw5YG1PTNRabOv07iFHnSQaFkm89y2U(oyXn5AwRaCxFp4dg4lLPHlZYXai49LAnuNRc648OCchC(YH566544amkGdyIsLIxg6igSj7AGHHhd27cGgJi)A1y74BS253ylquoEg2MUg2gwMnCxS1bLzCVlbDXNFBVRg85jlEZAWDgWtgHQ3kzDeYp5lTK0)msAQkEsYXeTb(ItVE4OpFXWFme0eKKgogl87v7lcle9JkZi6HZOLmEzQPOafSD(B6i)kTceX2PKV(mjjd6(oYbONjd4L89n8Scca7hAXNzBHB4wUoCcqlEH6fWmWTetxKdKjRBoKOnW0Xd(HNpWe6X7Zoy3WcRdiKm8mSOJMHgZN1Rjg8pGjgKNx6IOeEXZkThwyf84lg(tHJF)Td6nMwHw8AM933mjUhNt)(NaXVf8XVvzC8ytiYRjy81em(AcgpCcg)MZG)RzC81mo(AghFnJJVMXXxZ44RzC81moE0zC047Dgh7kbJ7mhGTZo5EciUku3ncbEZGJRf28QwP1uBSoygopM0AURKokYN5yzN4HgXImxT6qj5upXLFlU5DurhChz981ui97ukK(Ju6L)kYH5FLsnPXXMzuTClJz5S65068Q(FTKlFKW83wcDBSk1Y083H1GkvZFfi9JfGD3kpZnb4FBY68xrgh3xgDglx2MySmOJ3VRwFALR1Vf5IFtjNLNnZ3ZpBt7i3OnYYzRKz(TL30JndH7mLQF1Pf8Ot665UGnD2EMEwMmBppMjpk7uIyDWldadquoZ0Y31X9p6jID7CHY3e(X9Mw0MP(SRSOVZmN(Tq2EmhqLDL)1DXu9TNu2V6SUUZ6U6RiDS)HonrF9zPxzeWRPO9Fwtr7K))Qu0ATVJPPHni00YYcOZm5AEe8EVb0cyd(6BHiDwGPHgZhAsVHxaZ20mWZ1OM5J)n(2omM8QvIFs8F94A(6X18pehxZ(VECnFnBQVMn1xpUMVM80xtE6Rjp91KN(AYtFn5PVM80xtE6VBjp9R)4A(9oVMVECn)xI8P1B84BVO)hhJ3OFJskFFYmyUK0UnhD549Bqg1Aa3hgV9VazxREF51t15)uEQoN8DUiw(xWt1PtGpZY2310YNz4425H68YbN)6z681Z05rEMo)dwImE9SD(AId)N8ehw)i9voDz8QiT3BemegApXadDn1UI6zbou(0fxdZQBaDM6(JNUgShcuwEBDFP7U11UVlV1Uw1xXXETVV9Bp04ltyZBZBwNxQ6qdz1VbFkyExT1C7lI)2VEbm1AZV(QG2CRBd(wlotN6vN8sNN1nmyVRfwhibN9S22Q5UU7R1QgB5jg89T3TDR1WgwIBs)MyKT7sW(Ghph1J1iV5U7ChFR2645TNnYT2B0iU7aqS80Fveg64Z2dD6wdT9EACRr201zpy8TAS7(i)2Q11iefy4V7wVxs7TidDd2fT92T1ZyFas7MR16Dl2PnHfZWC3i9MCBESDc5TWjmdRDV50Aqn3jHAlYdMH9Eq0Tf44zTpuxRHwRXDqtVfzQ1(4x2cv4ShaPL4mx2orgTP6CC3dVs7n5AELTg3TAQ9EyRArXv1(bhBFf5G8YLN)kllUA5NiEMaNuK)G416S5JFl5cb)wZhmveRtdQul4MJ)hOxlV(h8LNRXdvNt3ppXt(o)8e76u)6eBsHU9R49Ut(6lrfDc3IR69f5UjztMkA4K96lsZNeDgpJRJMaw9)a67h)XodFfQiVvOxhfX7In9n4ZdaqjvIV4GYlRF(7do(IpMGUrlTI2HUOzmScCD9Tn99f20pbx)8zrT(9A8X1XOVPHFgskDdjHUHJoIf8ZOmUgosk1kh66rNE)ppavhMkSkrVQhqHVk(gWMKfyQe4od(uyjwx0OJ4zTuV0OEyAHMeJMhGMW3tlFWdi3AS0w4u6vk(iFNBBHiKBiyrM6ZSaxByE(wg2c3AA1Anwf(lpC3y0w9ss(gy0X0JWU4DdwFBM8Y8qSm0grlSHoCWjr5pi8i55KNd5pbiDTaAak1XLPdpR6UgjOQKs8GxSnnL8X8a4TWxe)KPBHESnd21wR65Y0yl6o9L7wJm5bUA8bf66Wvt(h5RzJ89Lr(qD740ANHVCqbEDYERifRFlLRXLDN4r(lXRqPMsnfnVT3JoaFHAIu8wEDTpVxk(TqIhbgw9STGVumDq0rcdN0anUoA2mmzyOAKTWU1jlVJPuJhCRVBB2Pow3E2b(bmFmgcogQd9qN7s64Xo3Qft1Uae1lCE3TrG18z1MHuepL)C8WJrO4vJbrEnYIa8DPjZJdfLPb)bJjn(rkQE8NbtpvKgJ2SiCDr8SKPyqM5iAXdD8ekud4MmSJuvGMdGpjR5fv88fspjyu6mNgnDjxV6OKvR4rypCdyxef6GKOurbqGIDwpnzwip(4ZUt((NwCkfQsEH5W)uPfiIABIE2mJbZKkRatRIleVeN1th(O9JHOgdzhP6LN6b8Dsu(qKQdNPGzcaTyC2u8nhcdAhN0dS0lmAkyca(4g5zA5B46BGfD8MQ8IeEei3KrV6RcB8gsVa6jzWEw6A1h6du7N)XlVm8Sbxoy8GWpDXWZatEamW5xF77geo(JJV(2l6Dj(jJ(0fJp99H30B4Gldp)IBhno86BgmCWz8IGiUOIB5IOeyNOvJxWKpr7D1xltuxm88RvZcJ0LRETWLRfadXHRqmxBHFCi(puBXhw1Ss(Y46BgFX1dhjGVAitKkLWOSmahoLxGStRksfg0YFQk1NmvUWchbyLth3e(eGc9APfEvVpCXW3X4z4HIJkACm(eyREOLKe7pfvKHVF2jZOHr(0PplKSulT(X7xRHQ3AkdC0lIcPxeDu8SYSvmte8hv0w5LaJkTiC2Cdj5puSIhfwfSsWxk(E3bM8b0488JWj7oaXggsDr01b(M5jlA(OsPBYoz1B8xwhyuftVSUGScaUJfmXHJp96(AiXPlXx7C6bcu8gDtX8xXfj5xrMxIFLK8GMjJ5oaqEZYZIX3tErAbbnNgcXFH4Zm(c8D4sUiJfi4U)6)9nXfplQ2rXBlyOGzKZIs2plROqsUvFfcKlgzNiW6(WTcNceovJTYhjWZ9Tz4J2Ql9QTA6tXQw8S8xdp4cLlXenVG)EHVBf1M1QQzEUkFkdS1c0AncLQyg949IVa9lcL(QSokloL)Q3QrUTBYYQDUnqPE0OM2RdzIDIeXooRLG5HmDlOhDfqRXFxY7me4pbwQgsVBHdn1pa9J6b0IGZZlZR2zN)uC0AGGSpW3A4jlmC1jGB0GShtkYZqnGVC)pCwb4cgqD(N7C46rjz95WrBMpphrpYYhhho)ogUrGpHX7FSoflCumg73KNucWPHPSuZPb13WNVsppbZdCAkmQxLuuKx8Y9xGmM)zUVhwGzwMYAph7zGTTNahb6rIfa00cGea2RR7f9mvougipNaxl(c58I8YQj5Pv7EcPdi3qzu9C6y9FEuvYIn7adq0cH9kMceOHxbIIVICB4zzzStuho(wwKzZJUztkOOaewbJ7taf1l3)VXuWIjXYXlQDH7yDamPP7CRLdmxfTizA45iNvCb2Ev9VJdQBxdkST8N3nH7guG45i3c2WrRta8VQs5jYytBd(7l6OZIFe80buIqe0tF4L7VmgK6dtcMzMhIRKRwx0Nxzr0tdcZgF76XbzikgauodONbLGGZPXB3FhpFMRQ26jwbBBxoJ4Ljpc4OxUVpO8d6jOqau(ccn4910YLhFeEX2ZNBlpF365EoNgTXucDJ5Ybzj5jZ0WtmLVlnkb3ohdslHEk)Z)ntj8AAzXNtpvNz2m792z2wDwsNAz5jq4xcg3c2VNVc6i9VY(yBAWXpsYqVo25Vm6XO9ZAF7YNZtXG18J5ParE(DCVlvu2W0SlkBR2u2MmT(XFvr7QFMB1ptvXea)pUaHRHEnNxNGavc4LWINrrdGf8lfByWuysV8PWwNuEIVHjF)694Zjjqwo4lCJaeBXEo(esZ0UEgXdF7UNXwexAtQK4YXXiGJJaRX2aUycSgaL1d4k(MLpxwlkdNF(gTPKeZg9)IdX5pLYPQb15KanWmBGMHCATwEMLfpzcskBpFtEzkmQpyTB5AqplsJnUj3KTTfhOLeyMU(bbCkSpas1a3PaOoFtA7U66Wmc4tPsCxGBGyZ9sKz6L7ZN)Y9GWOxU)QOIQNlqvur6sHDb2iAJ2YOgS9fB0xc42)ujvWOKCGgtVTRn(I2JDLP6kOTHp9FkEYtyTgvG9Nd9VlEv7XaW62wmAmuc0yMEwbC(L1jZIxLmDhiCxdxIGXsjgZlWL)(3oQpWoodOr6NKgVnk31qOjxsQbWbyQr3719Yh0El2Qw4fOWBlGvRhky0Tg7A5eudJVC)7rxANTnqAY4jkWsJEIXR1ByJb4BkiW8g80BW3N)RrP)CuYx2cj7yJjhbhkfjMhJXTrC0flYiR6qkKfX4U15GpcBbomwqGfhPfOgeSaiKsrNLGfKm2)RINHAkXHSnGyIP8dT5rsSbem7KbDeLEG2SN21eBGXHCInq(iyOaUtlWPdKsgAdcoGrLCIwBtTLHVZ2lJ(rZw0bTdyXdzhPTIQZ031wUJcMKNVbOA(qcQ)9hUbS(h0NiMBpBh(wQTT(C7T9Cpyfyx9QoOjaPf0a4OpaSThGlYktGn2Ooe34yqmC2AuK(8IWz0PltqLVkzg3UPdjw4UOhhfwtzYSfdXT5vtlat1rk6Fe2lYbZRplpDlHxmpSqF4ed1uLgb8e9n6tGXXfLRjCzRo6g47jwc1uImdpow408SPl5lHZaHUVC)NwMaEyuSTGx7ayNKFUmn0xhoFRRdhnktlFUfK3cw6ZfNmg8koUCRLJjZWY3Kua4utrYCLlNOPrRxMNLVbwaNUeCJzlXWo2cZ5ufZHnSbjym7VHI0aWudEj)ZOst7BAB0rRd7w9PjepBAt4dq4CQ)GpOXf2N83xVGMqL5FM22Mc)xk2SMlo5RDMIf9S1CiP0TcCmdewqpHexXvW9d4V)CoA1BzC68JBkJNGhTkYJxCoKSc4dTGJUS5rKlQh1qsXFeTcCMWXwEjFivmJkg5BP9WmpMsJ98QJFOJOUHJ9Coql5ASDyoUCK)VmgydbkyJ3YSX)Z4TYFJ9wMj9JFbqz3gpVapVIiDrVflkahUtYf60PUtJFGA8D8fwU9lJbZc9DCy7F8FFuXJXORyCjrWVmlzAnXk3ntdLRdb2cvaWWhyJ3hl7F4h9mAayszfQSTFr8tyuy5sy5DNgFw94BYpwy0475gyFaWFqwvr(ACWh9quXSNb6RtPR8bCcO(ttGPc)yAX0xamRdTaWkYJlJQx6IOIeCcYMQwcmUvgQYFaSq0YxTdaUn746U)z4uWUX4Ijf4P9zuvCsgFS5DTr1haupwUEnq)hASXD3zK9r)CYdi33NI(Ig63TrHqaQB8mCfJpiZfOL82)4poFvmh5qMWI0qGNT5cPTMwbbUnQBmqPQRVTo(3X)a4)nfXpai9)g4isELuDj3MAG8MRIvvBs2ujNk5VSd8CCn3)4)J5ja(5gGfRedDcNYN3rAK91in5LuIe3FqsZvRrZ9io3tlEUKo3d51iFbPzq9ey57(DN3sv)taXJzGPy8DnaBep0MBdrddWK9Wr78(2O4NaG33ujxZbu7BEakt0lXP88aIEBev8MO3ClOHaZIhQzr6RNyWAuvuWUSBWVf0PQsEYgJYRsoHflWWj4q0rPGEauoeyv3kWvv88XXTIfFnGO9AV6qWee4y3yV(aetJlIXqUwq2wmgp8Zu9NO2R5JFnJmOC0so(yEj9pa4)jSCG5yiWuEmxzKNS1M94rMT45QjQGf8DBlGpa0m0GvoqxuH9bevCACeyvrmgBOrpfvSArAu2SAb1CdV8QvfBGfiGUOi7dm(5zZ2mvy0oihLBVA9eqfo(qVADXMybLlqrwgohCcUnEvwuwvTfXzu41jxbOUtHGTMH2lqXZraG7b2cgfhP7Xapi0XcuKh4yepCFQYtf1wA5PlYWIDiDzfK9sOkYCev9CTidESd8RzIz(U6Y7ybha87njggDe)qbWDEEHiEuIEtdFTEyxFg7)YsKAldYVMfgG(a14BhW88pgnn3gJNAdKccWrGvIYypW84WFnlSPzdYtZdPVPxr0B(qub4g5OOPtkYZRP9n56A8vCV2Ey0O0gCNdOMKyOsbxAqiV3Mk8ekul)bl7DC89Qro(kDno(bbwwhy8pDjgUOzcXNaWdEdEtQWsiQ)0euRn2XUH2yt7Gdzh3daTdPjddthkKOxHK5kayD4O)ATX(bgABV((hcdDB0JXCx)EpWuHHZAZp)ZXslPX(t56O2uAlhl99xJdHIUcKjJxDi4Aym4DBT0FoYjOwzSTPRU2ftJdGCoNI5x)4LXRYRwseNlJRNaO)0eyQH9TS)(H99n8jzZb6mVgo)gScS1X(SgwZDy)aYI1Jr7nfjsXBIbGMbN6zW2OHT6whYsxWbMv5frpqQGlMPT)YXo1CVwmZM7VhI0jAgw5TXX0wWvyo8ReHYhVPj4I9dQ18YmyokfxUhC4VE9AYVumRexxidRLuYMjplNbAkEdQ9rnWeu9FajZ4nlbj0p6bUOZEtNwif9t9NMGAExpBpwdYZdT5(WZGfpf5c5YWVblgnPNw8uLlRW64VSoeVcxRleir5h9q8ZKxeTkieQ(lAxai8kCgpYyltQe1DbEPwaAHEiHF)DmnnEtipb)Qe7)1uHjvrubjuIam26aCqz20pTOFAs)Kr)0GxXhRaFkIPYTR(ygprvJ0YQHbRVH8nvI6ruuvankqlX5cJFLsQx(Sv87)wTA0AnwKbu5QxGPBcladSi21QDDb(Pcia0oCPQZkmvVi0jDZJp1AJcVGQdRpN8D9TAtvNDwDsYBai1FCJoTRAgw)YwwV9FDRNDbl7D9DeGuJr7RDjiMMdUsAmj7cPRFnmIFXQWYNZMsLbDroEDPGvakwZrCQNOs6yqexaw)FmmEccCbeRtJRo1Kng)Dvmt8seRz1Zqv)IK7CRQ8sdsAW5wFEaOs6KxVG61RfRJtVHXjbI6gkqu0qbIkgcVTgQAC0loBW59(4LYbvEZ4iolhnQj7rI6TMk2XYkrPFHRE5P9WLHvoQSai)75BkaF11lssbJ)tG3Q4a27NGTGOcSMq1UcvIP8cts7WCfRv2L4hHyAQWeLf0vH8OtilBq(H1aJcDzRJ5Yt8CiGNyge4ZO7UneiYeNJg1bCVsB4wJq9wJvrS6sfSESgC55k0Zm8Y5Hoei8BR0m8cuiIkY08PZK1hyRd0s)AnjtZZtXnEH(dUWYQgWaDQHLLYP6wIyw7UQQ1tGEDECgQm(n01mo)6Kpkruky5IVusBlBlVOUB)PyYyWyXiQ52kQwhKmsIYGNHv5gs8Q49Abbt0M1jDmNt6CgNupF83RKMRxKkTeRwzKPyZQmUireeaPiBFOFWtPeTfmfCIprrgkoA2L8lra(54H)KQ3854vQVwsbJhNQKuHI)9TE7)TUERu1KkW8rxOniTu4soBhpdpA37LHkPusqaKVmnm(r6iKjQn7(D0CKDlknLugJ1eoVduNRROBUitz9Krccl7CYxToDtP24qinPWDq2o)1UhhSfXRitLkdzyc(NuZQt3JfeELFSYe10nGnwJ1O6SZoN8dXuKxvl(fxO4ljHYGeak0dYRA28SXIcbLa0sY0qK1fR4LrRazIlPB3NO5Zt(cwpAJk2W7ci6nWpWdiEEooQaROhtHTGKLBTAdOuO5NuXt(S)3oGYowanWXet29(GtztuGP4d4qPHZVdqjJz7IL9X(rNI2OHo5FsL(XX)3ya1W13Z3A)aQSn1aQ4tQKxocZZlWBS0gADvhxsKxrWDJaMP1FXW9VyA9Y9SG36y8wBJF5kKvzK4iBCDg478l3txoQyKs(LxUFkwpPucgixsf8YyYvxWlCTOkXxfJDv57kSmpHyc6AojG7mot35jzjLlJN9d)zA(4SUuLodIJWYv8)bmIfB4vZB7bZYNVagJn9004OSnRvW)j0rGOJU0hg9ZaXJrYf5dyWuOBdK3s)nZI(NELrr8gCgwtn)iEct(YIK1Zr3(DAn02oV10C)qJBND5OHgm6)fy0F6gG8An6wWY1B)aKFND5ybO3vK)R)hpfxMaGYGcqX2UGSG2tJ9BTz)YPVV3Lxoy47geE11NnaVHYUDmncLXvifxjmzRaR4L6p4efOAtIMyoOGiE)Km03olMUFkZ5kkwueTEjMdfOjo03lmaJRGb5vAp66GayXzwiADEZ5qCzhtgIRpdQgqa3m80mr3zwkMh92q)qILfO4FgMQ32bov9Lxmd(AxSUNqVKBILzV1X63y(BgR7j9BJbNz(vpAQd8(trWpWIcKBsZjK47ThnJ9ZqWS7SphlhX5rBsRksIkMUebL)wo44YMf8T3(KH6zWMx6YF9)ZsYZS2YqWeCzDai0TZ(CSqy)OntxwoD5MYYDcvTfKyA)wtNdav(D2NVcOA1QOnP7eKAlbH5dcp3pizA0zFowq69aq8qA0gSG3(qrs8IYvXBQ25wPzBgbMjQP7vzChTmUTqQnLXz6qv3EBjeg(V1Y53AJyS6Es)2eYzA3XODaMEtNo7ZXslpiRAECzzCks)EfEBqIrFU6x)pRQ1ypob9xC98nltPAEV18z9wJdi600RZ(CSW4O15GdNfBMJaZFdJYx0UaUMYA8FRdiM(ag6yg0zFoA56XPLGqZ0ni1XmeI6hJhmL4S4DaKwgTNqR3AhSFG0I1zFowG8x)FNINJUy6C(8LDH9SmBpjgVkO6R3ymnCAt5umFB6qb1cldM674(BSCkl7UN0VrVTC6y0SpafSBN95415wKIErqCyJMUCvsCrIW8PZlItwgnhVl0T8AplSd6iOLFN95yHSBPnfbNV0maDqQT8flhWEJd4BQrN95ybPZqdE)q0AuoEw5d5RsQI3cUSBlsXm4GgozB2zFo6nr8qBNw(WV(FUU6pLHgpfTyXwWvB(dtIu9)NlfIz8pnIHuyZwYF8WQ(dVCqmn(lgwC8lOjg2d)T2zq8MyPRj9Bt(d(EVU1OXoaPRxN95WKUEc3qsJEic4X)WsrWm6LTOiz(CbR)W8hwUzgDcvAnnwVLDiqlOZ(CSG244ySSRidqUkQyZMh2n8jZCK6gtMEjyDCdWGzgnDz7SzfNc(mhZZ)FOk)q8CZHTxEv4it4)srr7olCEEbM(UIkrFADjTHZRTwgWeHiT50tZZs8wDaJqjLvK5jfL0HwFepdFIlno1WWVyPJNYViH1VKz2ofA5y2eQV)0uxBf8W3UkFwofLYYntcvxc(80UsFc9b5HiqQFuWBCfD5shwDcgtkvxXgjLxwFfORUwZPvlvBc83TI9((8kFheOuCJV6teO2em7(9003Y03ZXlWYKf443(TS1kW00bFXA9RVfQhYCDojapXlbyXeZV(PTOB8ntBhxxgJpmUFfx)0YNxVDHLHpblYVFgVDHshH4Oj7gVlVJg0VA0u4D8j(aZBKCq6g5RT7CimR5oWS)r(vcw(ifUh09UqUMDCVZTxI6j641VzY0)yDBPtPtHEeCqT(0nJ(K2Is5x6km3ahMPbdZmJsSKE2JB8Sb2D20RVe8vcTUT3fN1qshjieKnEiPCuPrmJFB3lRkKAb1kX0L8CEkU)hvcb5rm96j)94PvNkVPV47AulVw88mqQbgXpV4CL)dIWdx5fzZsEmz2g6r3G6HSNFi(zr6S0YSv3t8OntgJlqSl4uV9K1lvn(yf0TAscwy5DoidPolMn1wR6j2aPQV7)7"
	local Lines =
	"T3x2Ynossc(Xmp0D)qMnUpsZ2hOUYuwkrPvGzLt3wAccKmijAbcWbamvQARwpT)h7lZ3W(d0)yRFerGdcEu101S7y2ADxkjjIdp8B3dpc8O5JtEmAtzXI0mb(XIVlktYYINLjskJZfVuxuUCvsv9JN9y02krCPijRoDTy(MQhN(yuzXlXlsMlItZHUp28Xi4dJTECSX7TES(XOQAOdRfLXZkYxKUeNIfWOb)W2nZtQf0G8VTnD2ZXZf1Iz1Pf504kQe1XvBeZINLmBLa)T8I4Kmrzn1N5PvjtZeXRFTEv6S45BZxk4UIqzsE66eCSItMntKbapal5BbajDwswC1RaiSMaxAnblcDpQWvAPytrzD8kyXgNLM)mVwfRb0dHbwhVOSyDCoS0WMVof6921XASxX6Pj1XiEcMedaAfj1RIRlkaC3M4xsNxV6XX2Ug6zQUi(Lvfpg9y0SSKQkALxbJtr58keX6zXOxeV6Ag6ABA5kXZ2(WNSXpr)Md3gybp20XZx3nvZ9Sunx1ypU1E262sdPLSndo0waSlBTSLMQXv2otvdn1dBdmVV22Ev2F51TTWAlq3ypDR93ZIZYTz1fixDMdddo7BHnasW9aRTDAUN3HATUX4cMg8dr72T1TWg2wbM7Ir2TlHhcE8vnpq2CV9sX3PTU((hGqUdTPfZ9aaITE05XoW8a8P7m0ohOX9gzlp3dGX3PXEhI9BNw3Gq0GrW(B9bzT3Hn0lCF8272wFJdbi9BERwVF1o9zSmnS2psVR0MV5EH8E4etd79tC6nOw7LrTh7HPHZbq09v44BFiuxVHUvJhGNEh2u7djVSdQW9aasp1zEM7fz0NRZ17aYk9jYnYk7mU70uNdiw1JJRgnaIUEa2Zll2Urmx54byqTotG)y(84krjyQnEtsj8j028MQ4KPtlfFpLmIJdE0lfLzZv2ItRIRltQwrn(7BItQIPjah(PffpVoP854AXpaNos)z0Qn4BqJxeG5yX8yWmpmgFh8Naaxh3hJGVboUKc(seNjWFFk6Ed4ne1EA55234Ffa0pJn8L085fVuDq3NsZRQtYNjQIxlY3cELHokb(kuSrq(6SJ7AZwbFva(cHRRkXsOB1aQznG1QJNwaEw8s6gWRlYReeTwjYwa4OSccncUKLqdw(2nXzfll2wJ)CdyOC7AkmDRsxUkd(pQj8Ie6cpyOtlWVnD7Ifa(EB5gW9Yi(BvPzaudiQYur(8SxxKwkWzU85IYeeYJq3UEmAzPawKrGpqzaEc(0RISSIxWMUobBwjGIRX2bKX08LXRkkt)5I8AWNTLjBqoteQMJWuw66uuYXR9ArJEYkM9mZOrSiOVQZaFtZH)JxA5VgxnROe82uuvbZDvxKc4yAw6uMEQXItllEgyrrwk0TUE8sadkWHIKU084ICrSKBaqB1no3IEpxpBf7SjYabO92o)IaUssjE626AP7RRbpvlFnUmznj9fj59qAIInCDYpajM0S06uKDaqmijLze0Abc9u6IWpzR)K0wpcQThVncW3COdrDffTik6CjYOZCykh)qtFVwQVmXrEkiBXI7AaYi0r1d(J2nFKHjSJuFeOKFzoWODgIV(EAvr5atnpgMnZ6cGbQAvIKsc0xGRci(iVy8MIkzNDn8FVpnaVd8IN0FQwJatr92kKqPrJkKOcfQb2XUWKa4E4p(pg9vuFve0DXBpfHSBk4Ha74ssuRlEZVpsdcwraHTqnDSPFx6tDs5sfjkDgYkIQ6aMIVYT9t0)uRx2LImGe(DbokBu)kGyRlivvvRW4MivliUQA7usj1lax9MKnmMNqNWSaXcbAVz1oGg51j5ZL86ylwKmdMKRaX33E6)(2K5LGa0BpnzcQAUCUOhFjV23HDHBjYITfvOCHOojnR6TNolP8m6zV9KnkAKVTkE6YMgEDoeokcbFl6(lV5MZU7Up)TOnGUg0SW7Uhe3FNzl6WjW(Wgqm0WK8habrGkaAI(zurs9QI5eAuISlwSac5T3ASHwSPam(GJiiKVU1YOjerZhVY1nWWX1YoWYiWY2X5XfVdcNbgQRcSTa3BTSCccmd9SnWNq8Jx5757yA7y67B76zgAJpHmjFLRb4ZVPVJBOHLTTFipA1sENg8nbciB0dKOSLj6ls0nKOPpfjs0K2F5SwnRUZsPTYNaLJnsPMaLBcSxc9dMh(N1tlYQae2wG)uRIK1RY26BhAF1SvI1jCkaOmri1lFLVLHRVBqOVJvONbeAcHpAB2y7MnLGDaP)eOzgmq)46x3iirRInuEeKtnIyQa4ui5q2XPIKFOCQayp3KL8kGvNZmVdnervpd(ieDz23)Y1SsBnNC0ZVIY)SoqzEzql4SNf4NA5AbYPgJS9KPAIiaAakkws9VNRdO3HS5kgaHFhSgYoqbI(Zs2GqaLAeC0id4OdiOy0mz2JwNwndTmIFozBj9Vcqb9Yxjv0Sr9Z641dd5Wagl19gLxuUMNJxF8Q35h447A7b)X3Zd(cqRaM(OF84vEEMMUq85UwaNVRjsfDqxcHNeyeyByz6zh4ABZpb6ZkKF3ZZ11gyl9DdXqdGNqCOvaJjpLi59he28fGCzyG9BSLHbZtUkL8KtN(hIHqQ7amLd(Ourel7ywOgtbeY8aAgr6iQpL8QJuJkBIuBJ0qm690CIld1fSmUeKSDajxphddhhpltWTvGFf0LVylQaRL6h0kfdHaJaOTrcLe5JSVO8F4G63KoHetQaOKg2s)5O5ZVlV6BsnVFlfPOvFRDxQITILwxrwxqycLfNdEaYz(tLrougoobCUmpE9wW(vCluiYTedwzQiVGz)2QEjf9tczqllYaHunvGwFOBZ1RaU1LRuUrrqZopSeDbBAlAYUMtIeLI806xb20L5KpHu(6aAhICPia6rUzVpvk4h)o0YarIzyGW3NHO7ZqS9ziY(m01GZyxdaPi08443zHMCLEMuRxZSGd5wizqgzqqulIwKk)A0DaXqvMceArCJ9FKRI5CHFICcwsWywnZo8sNGH4MLgqp2SkH12tSRt3l7k6S38YInTuMvKLoxYBknVnCFjZBd)e79(ehP1vwGazwYjp1vkCaN)bRhZz)8HWvQik73tY2sM2nOaMp1gAFQn05uBO7P2qVtTH(NAddo1ggEQn004KB5jtBmpzIJ5jtDmpzYJ5PsFyT4l3RyrlzP978P0CFA(cYkfYh)aQKN8fGTcp7e1vtnLNp2sRueMg0BApO4mYA0Q4Wk5aU5GuWpLjwWFq6YklV1b4IRGzGsAsNHV5NHGiMbEH0YsA6pW4p6fgjy5oWZXmWbCy13hZmRwXGVHvOPJVh4LqyyGTT2V32g1yfStgg6f1VG5HOb8JFvPj3I)b0ZNMGvJ5nWrNsLbwANIwuT7z7JY9tPpx9LR)2TI5PjF7kO1FBdGCYEFD9cmjuK90gT8DT(qdUmQeRgLVik4eIXPPJT4W16TnF7P7rarHUUjE22QAm)fuMq(FGUaA(3F)BprFY(Vt)J1Fh41lMlYiMjWbBWud9DWoa6dz13gnlD(zLusMGNlk)igr(7VfaISIxAAnfd93U8F9(rJJU(UXgwF7I7U7Irxe9TZlYMNuwM8TZV7Mlg9WdJU5UZ)s07xBPMpTXkx1y2A5X)GUjMQo10eAZotaVzswGBVP2ykt(vyFB1Va(8NxLbUfqOLZqFMLbT71WvDAcTT8tH)sfhha6beWzx)(n5lBfWVcya3NPqDSCTbrhWhzdoap9S3KFVwGWvuw7QUQmzT4BF563j)(nPv1V7tnDGMnWZONXCFHzPecBOxaE(DZHX7BzvgcUipH8KBFCWuQl1kRivSnEKk)YYYKxzxFMQu8mftylmir)XbfD7JVNqjmbCKtVCJOS7CwsPAezgGo84AQ(apBABDy4S3rnMJDiOhdc3oWZ2m0Vj8998KMaJVYp0YZ2212W0YYctsNkyDguixdHyMNYPLHzK3tNgaZ8y0OsmLIQv9qI0V90Bp9hLsZ)P(lZ26hBTIHG2mdcbwpBxVqVapzYhS27tS37tC6yHHwVu0M9CVEQQneYNwgTzr31F)l(dPZQ3UULgozy2V905S8LwpxJI)kftWd75x)vBpiVqRsHyU3x6I4KY1v(rfusmNNnoi)gKqpaKgH2gqO84bbXhVPsw1gncuvInjLj1a0hn(UXx2h1UJefbIucmglE5TN(iiIkxqZfvGOfmwSc3ffyY(brVEEs1pl174k0EYXCtlKvLcg7ehYBSkMAvivy6l4iQ6hkNLoYDFdmznBxMMtBK0l9cILcUL86tUEKdDDs(ZY6Mbisj7gHENWrB2sbTENOKVlOKTHogHBJYfxoz013efhnz0KVeD2OhIV)MV8XRhhFoyG7ZkFA2FZUp6YpE7LJNOZBfo47V1xCFe2G0QpLoFoVjuYCfnrL)lerDfXPnAgy1wG7id4uayDc)YmPsKZpUJgyZgHjbGqPys2MOCeeFuKopR43(l3Y5t9KwRTxbN9FoRa7)PScyI6K)ZbKT(vaY1sFMpcRtD7CqiJ4wlEFMobhNPs0L5Uc0)h1B)U2UWs46Vlv6Hl2sw5PstDxvMTBv2lG3fkfHsj4av66LO43zYzX2wRzM6mN5ZH8nO1emDjNm02jYtLGWwkt6MPlmkt12F3x3LJw3LbMaTMn9Kt3i5rqxDTf5zcqDdVV0uYUOeljD2ca8cS7f5SMOMeek3QX82BWOn(DrUyT8B4UC2OXN2EBojXZklWDzgZZC7DMfwjO18OBU7R9usMMZRFaAFLZnyvEYgEZLGGRv(SVt6zBEa4O4umjqyqSt7V)HDIcqVlVCcOX9lXXby5mT8TC9rorNak)ZVlWXXn0Z3kiWYoWia9T2jemzWBJZz3nzYD3(W1F8t92Da9UhQdNVbmL(O8p9KHv3lRDeV8vGuKNPzOBaS2W9tILLANB6yAB57KG63zlZgrlJBNGZnCIl1BC6uP9ZbSR2nPNDz(r)kA5sxhJ5DBjLE5zBlbjDYDD1goOCiORqSLVutz9ajAMJ2dlQcv5WYEGP2LhIecF5XORsafATmYoWwgq58OOkDwsX)p)MD0ZdgLQjc1sRksKEI0SWuLJiK)3nBrCxfoYWscc9nd89DCa14bE8ws6GzZglB2RC88dDTSaUtxxaB4jxtT2isu8WbWjqWbgb(yLI6IBEPNvJfV99CiskiIildptBxJqpCBuzg)ADe6qutUMafaX3ga22IrDkn)4UKHlAAh9S6l1gAy4B6hAhc903c6gBHYAVpXEVpXrIOC9nCS8mCmST6e0xVn3EYOBapFU6Hr3E53MU8DBG42Hq2L2Bjf3yHZW1TqpJaVICO6QLIcjO1aF953no6Bxp(NIbJePzXtW6Wz9HYKeX)O3IL2j(ON6FTJ5y4(7UrqdSrn9YXGLEhpLLMwR6eHGIUfq1MVtRWvf1sD)GfbI9DclPYCVQ(Silzjd2Cen3IvbEswAvD6mUvLPCTGLLLoNd(JqY7uEmDHIM6UIYYbGr4SH2PGX27(62Qa9LoPi9OzQUUGalNcqGnBozwEwwXwWyhVfUnBfl4DXZcWKnaAyj2dbIHQyjGrvctwTYKyRDrg9oe9ZAfUhOGLvX6PCilT4QEvNohqTYpA)fShuD1JQWHPvVh(mYxvrxaCLJLYcW0R2)YxLX9wlswJRdyHH4VvPIS5YT6JJ0vwXerF6lJNC5dNA5Eh91rp8W139Wjv37rrFA0TJgpunG6eyaAC2xj3gD7OpE5X7w3j7(lNCcZu369m6Ih(Y1x0QIpnncBk7tNqhthJHlW2OBVB8NhOEv9cB3L(LbkeyWOjF6ZJjFEo96GhX6YyEofaDh059JUz0fxp(ulw1OVm(ZJbxmp5QXn6(hU(YOMvulKUvxWDqW7lJ)4d39L7V)Mr)LgoXtywhbQuqpw278crcbFZjy4UF54lV9VCIfgmq4acExzffX2(Wvjme3e4DWPs66nTWKgDiXZ(lPF6Up3caDna7Ln109E4KF4Up(LlprAxNEsAIwKaMKAQCjvPiQR9iqLU2uwtQC6xvUG)svCuwUTEytT6g)SqSjEQatahyYf9jej86QvL84IpBsCjl2T(IaBLlbxLv1yKRQaRHGE2ScmuDwJErvD72Jw7PYuFGQcgDgsF479vLSLNQYmDShqe896Qk1vF(rS3rZNUqpvCWHKJnJE4YXJI)lxEZnAHuZohBGdjw5Oy8uGxF1GMAotvPL60xFxNjdCBCpk28918RkaZExZcQPtNkF)(AZT7bY7W1QRGwvb66yoKASD8dQVMRDYJAF9UUkQRRA17tREDkhm7PwbOyMM(Td479gMYQh2CF6v8u0iZWoZct3)4dxEzdFeM7FLGQAHb(iJnF8LFzYdJUzioKb0vOWoqGvAwJqQuIJU8MRAQiXqdeQ4z0Y0vHX5FVUBzZHcLGtDvC2tuLeixP2I5PuyNtllsMpJpoKT8nIonHugmaNV5s()fYxQI5CH3wMmpL8ZYZq7xQQx3xG13RLHk9vO6IAo7J43v7KENZwGQg)CPcuvvYKQIdw5FUdECfLhDrqrjfhh3sq)X6nQOLdArXT40U9otsmIIKap7flktw25qC2nF8TprLDojLa8LlEzFWNjWHQGpBZdUziAY0gqB5mAVJ5d4zJRZCyTQ8DTZ5SavpZfYiQ((LKnOA85VcoUcJNS1yhj3uJPZjYor7s(oFk73oUkahVFzowLsWcbqIR50rL3pGhL6a95)szpwxtbQYVJ3UM2vcGrNDjAOQXUB1L7nmOrHqTa3Wukp1CgnXI)UFw8018vVLqOLEvqF0U5J8AjWJ0jito40gwakjfswa8eQQki(dvfFkrtfeZj3GlsySZveFN8istwQPArLQT9YzGr(z1PFhgjIhvT81femWhbbfNNW5cO7jb6qqLsYGph0s5cT192rfYgVLzUJkCMJwWauxe6MJQbMNuopMcJDAhpBAxuekXJyu(yTO(3mdnlr2kR)hHXeKR7EmVBRTSc09GegQP2soVyaRvt5i4WSGY0Xo5U7BxH1kLii30RO6lu04hC5anip7oz1uAHTj91koul7of3ZWIzKM6wfzKSa1trY63tYy55bzCXJdvwX0Kl4D(gSWisEgttlNfcmCCkXIKZKYk5MEc6RjWAwH4o1PANREB8avLI5crL(lxhFWUo4ETNxGJvqGm)BtXflplQfRNFNFUPga6kWBOJzr5pOHBBSiWbwjAGJ0Qg0ARrNoxDhH7dlYKAzVAgqzEfdmaZM2G))b((ggoQ1fn6ygMAvcdDQR1EOj5O5dOjyqcc88d9AWs7GtPZm0jE4s6HiueeNql3atBtppt)aBvQC736wIB85aAymAVEPuMgAmW0JWU8u80MmtMopM8Hpx4DDWgTHdMfLVdiq2ZPVgZEkn0cOdO0SfkdKf09xbvYIMAaEkLppGSfEEfsNTd6XXkCFKwTGVXo8DTxU7mYu2Y1JVHDh4QR8JYlyL)OQdONRBpkdVCq1HdkERzfB8hObxoCb8WNWvPXADooO5Tpn6iYf6jslB5peD(GC87GepbmS27w0x6by6iLHt7Gg3KmFoMpu0VGDWUnvP2atzlzWDE2UItdSU9H4scndW897A46TdYBiDu(7HulNQ9bi6ZB4WTrI1cmLjLfmEukMXrTWBNN0hBYl42BWp8SS0fIyzX9YoENj(oTbCSJ((noVVDz8MsiGPz4UeZiA5rfIZposKbkceabMXJTBq)24A3HYGcvAr8nidTssxVMJxnEl4OfvcHPjzYQiev7Szw68yEZUNZDbNKZPDvKlfv5r0v6jISgZO8DlGi1QQbF1eLY8L3mD4zJf3JzC71itV829J5MwTdbTHZm8UXPgyyMHHMHBWgZ6bUosxPnvy4F(4wl7fyGhIiioKYuEZc3MtNlyPtJJPJDyAoqZY2O)ri(TOR(Yn3eFXL3C5KlJ)61JVaCicWaxD3dF8Y4jFzYDpCnebn8lrF96jN)P47hn(YBIV66hIMeF39qO(xWvsOaCuM8brEuwMI6dMY1Ahm5tBDkxBvEixp(Q70ZIz3tHVATayigUIXmre)LX4)qTf3IeGGrlJ7UFY13noscFnqMmXeXj55aoCgFqxMvxMjpg982d0EYgnzYdxF2xa0be3)LNpPl8jbfkXsX3o6Zxp(JMCjAqbbIhgjmYqDQ(um7VKuMJhp9050WOUpcMhtEQL1CuAB1qDi5g8zLtfbzCtCvO3Q1Oyv)dyiUbYYDEMZtjVDoYTUrdRe8LHjqeC5d4X5cCGz7ocZggjSCJWBUwNACFUBmLaei(XMqJAbLJaqxba3cPqC8KZV7SwiXzRWBaakLOYGsODCulfPKxrHxsEL08G7heUn)aYBoEw6xdC78EEbwonKQ)IXJ0)sC7VulsHebp8J)32kkFvEagKPInwkmYIOK)ZQY9N0BDMgbYQr2lcSPpSx40MwtNxgvovVkWX01n00Z2WY12kG2Kz5rFTbEWfkRXeDVGJ8z)gQTAmvRpU9WVg60(WZRrO7eRpEBoSmwf1XMKCbPTPd72(zlR3lzGY9TrdV3a6ehejIDCEpfZJnB7bD0TaVghv4GBx9lGNQXukEhRUYyOubgnc4fHOXxvuV3o)vrYgGH8mqU1WxDiVKoRdJWL5FpTSihTa(2t)XlkHqWaUZ)0Gd3iQkPEnoA7Iffi6rDuWWHlyGHlkdO5hESohpQe4(HFFrAfaNgwQJngnObgb8k9QuSOUYYGr920YYIY3E6AuW8pXXEyJL)J6CKH9m0XXxIJa7icjanReybaADtVOmzpwDPh5g6zZlKRklQQNwKvV)j0XtDmZOUoW6)QK60LB3dgG4fIhvodyqJVfufFlf2WRQJKgXD4gyBtUnhD)w82ibuwbJ7lah1Bp9VyQHflsKJpGAYWXgayYY2lPLbMBtwMol(kuYsuITxFw2Wb1BObfil)P9Z4UfviEfkTGnmAtkG)1N6nIn2YXG3oMOleFhI0bmIqm0ZE(TNUraA9HjbRIINf1QvRhgZR6aXrdIPdEf1HdYyunayCgqpxwbkoNj2T)U(bME6Zjhjk444XcI3K(Dah92tNbg)GEcgeaJVGsdUVw2EygRvhCoEUT9507ZZ9cMhTZucDZ0Jbzf7PPLHVCk)ywsksoNaAlHEQ(6)ILcETST550x3zthtNd2zZD6SIp122xIWVbCUf8FVyn0r6Fv9XXYGXpk2q)bO83K89KdlA)WQxlYWK18tfzatEXJC0LAoByA2hNTDFoBlZw9J3SMH6N1o9Zsx3FW)JviCh0RfCn7dCj0b7hvnaEWVssWGPWI2Pemnys9jbgC2EJ(eMDrGT8YFWobijX(UbesZYPzgXkTC)ZypMRwtQI5Y11iKXrG3yBHqmbrdGZ6zCfF)QxRAuLHZptOTuSyoy8xmex8sgZvdMZjfAGB2apdf0AJ(mBB(IxtXz7hyXvuy0zG3UvBWCmdDEsxPjhhBgOvmywEbHHmh2NbTAq4uauxSnRFx9CXnTM6QwDxOxOK4Edkm92tflE7jqz0BpDBsz9RLOjQK2AH9aXiIqBB0a2bsc9naU9purhEdspqNP3Xd3uFQRM6UcwB4P)RIPVGLuCj2Fg6)OyD)XaW6o2M0yOvOzA5BhYYlBsNlwNoBpiCpdpIHXwRgZp0J3wXOZaXX5apYzPzIDr5Egsl5kwnaoaxngMwpQ4Y(Ky7gLxGbVDa2w9qdJEnyxB3Wgy8TN(egs78Dbslt(svZUf)KjFMPacdi3usG5945vKPZ)Rjz)Cs6p2bj76yAWdLMfZ30K9rm66L5KxDihYsbsTUcIryhWX0mm0MrAH6bblwrLw05P4Hdc7)TI5OLsCi7diw41Ji6ZJIzdyy2RaAeTnb9fpDAy2aNdzMnq)i4OasPL40lvAg6dcUGtLmtRJvRLrG7UlJZsMVCaEhWJhYpshnxNvGNJIIcUKxSf4A(CkA)9pEp49pypro3(oUmj1XP9C7V7CF5AWV61dWtGx1p0o02Eam3DaUoVkfiSjdOUX1Ge4CAXrgWfmB05RsrJVADgpSDanwiv0NrHnCMMoYH4HI6zLGR6ih9pb0IcW96lkY2r5LPpwuUmZqdxPrixhprFfCoUSAdHl71rVWaF5sOHt00WNXcNxKpBfVeUau6(2tFDvkeHr5UkEDcbkjFhly0ED4(BDD42IZ0oG9G8bWtFwDYeiQyr1olhltd7alYaGBdhPPNA5KmlzZQI8ITWc48vqym7Og21r6oN(IV1biqsbZZ2szAaeQHOK)z0OPZ99D6y0Ciw6HUGaWtJ9uEaIxq9hIbvu68()2ML0eQD)ZYXXsg)s52nS6KFTZKq2ZEZHIt3o01ku6b9usDfBG7pIF(1c0Rx8go80MsXu8qltr8IZHsuWhuY42w3CefI6jnK8vLf2nzGT81JRYWmAyKjPJW9LmJg7f1N(qNqDdh7fmqRKACCnD9yK)VmbedboyJpy6G)FJpO(K5hmTO)8lak7bXIsCZSr(IrlxIxXvPfsB6u3PXpup(Ubsp3(LjGBHbUUMhE8)us53fyOySMi4dZtN1WSYHzAOdDi0rAcag(qNadF7dp8rVIoasfFnOLUu8cMfwwdl3DA8nBgFl(SvtJVVxOZra)lX6Bydo4rpNuo)1C88)wkNaQ)0eyPXpwyrO0SamTp2caREEwh1OSLjLP4eKptVemzVm0xvSGhI2bAkae2SRN3HNHZb)gfLtlXtEBuTinNhBURDUPwbUhBUS)0O)Jn2i1Do5F0pN(mk991KF0c9715sJfm34B4jhFqNlWl5F4XFsXAbJCixyrEiiY2cP2wl7WqVo3X2GrvVaN24F3GJG)3wkEgq6)viqKIAL5s2NAG9MnXQVhNDOJhIs(Yj031Z6WJ)pvKc4N7brSkm1jmNp3rAKdAXAYLGQc3FuwZ1Bq39ij3ZlFTIo6NfniFjRzyZeyh49pDzl9DfnExseAjhFpdWhXJrC7OA4sCZEy0o33oxu0aWhyP1R5cM9TocNjgL4mEFaXOnskFxY7EaSqG7IhAzrfRNCW6CdsduzVWFp4t1xp0oywE16jSndnCdpgFugyha1dbE1TEgEF)kvdzJf8mrR9BsbtyORthA9ryMMukWuUws(wmbVLsORoxnTMh)gbzW4OTA8X9Lm4iG)xXYYHXqGR84ELrrY242Jp52IVxlvfCzx(pfsapa0m0ruoSTQcNJOQ4Crc4vHaZnu0ljLRxMLKpVrrn74LFJPydSabARkY5iJFr(8TZKoTd6rz)vBMa6qEn2VXwSfE4VKOiBd3JobpiwNNKx34rCoLEDkuaQ7ukyBeO9d1YCea4DesqKiPDedCsOfsuKpeyeNUp9v5pAT02VTkdBZJzlRK8xcnrwGOQxBuzW5oiOri2mWRT(oZWJa(JMkGrhXpucCxuukZhLS30W3yh2lW08)WAK6RdkOregG(q947eA6hCkwAEqGNWsKd6CS2mtu5EW0NH)grylRoSNwhZEZOYK395KsimYOKztllkA49TyBnbAPxhFmBuTgC3JyMKeOYGqAqiF02A80e2O)bFfHGJVFdYjqBRXnim02(iJ)5RW0fnxQ(eaEiAW7ZKEcr9NMGgRXUoDSgB5eEm)4Eg4DilzyA6qLeJkvcxHGOdJ(BSgheA0I8geCmm0djFxWH(9jqOctN12F(NfkpPX(t71rJR02U2TPVghdfDlOtgVSSW1WeSmt1A)zKtyJXyhlV2wxSmocY5kkNFNjwjwxuVIyoxjAMaO)0ey1c7B78ppSFGraPBoSTWRH7VdRaN2yFZoEZD84aYfTZr79LPk1BYbGMb3MzWXOJV62hZtxiaM1fLjptMGlN3I(YyNgPxBtRU03JX6KmhRMvHGib3I7HFTmv(4n2eR2pSXYRPHPR2WL3rh(74REzAZyURuLwlLMnlExodBz4nSjg1qlW0)r0mJ3GzKs)KNzvNJMnRuP6N6pnbnYU(o(MDyppgX95xbpEklK6LHpblMwApTLVdm47MGyXp2exMKoVPqGKLF0ZIxPOi6vqiu9x0Vaq46Fgp5XRsRL1DbEdsbwHEovve5ITX8g8R3y)FnvysDI8SQbam26qCqnDO)At)1I(Rj9xdUIpwdXuiOYTR5EczQUANvvddwFd0rC2uvQg9lqlzX63C78B2CFnqiVMA0AdwKbuzR3Py2Bvo5D(9MB6Wo)S8s6U5UQzONUVXu1z9q354wVNzCFfhCR7qJoTxFbweXLWYpAD3r73QOGKtQEH05Np6Gm066eG0otYV2vMCA(1Ta3l9vTWLZcElYNthjs159y6RunhXCpjv0lFf6yDDkcEsgCje3MhxFSq7m(7RyM4seRB1Zqv)Is6CNQ8QfK0rYT58aqL0jxVGTRxlZbofhgVxDQ3uNjVqzfdfUZXz4IlVA0xUrnOQ7lw5z6yFxw94wQjl9lC1Ro1hEMyLJQkaY)wX2siw92fjPuW)fiAvCah9xasa9gbkU1vzgFfZtA7W9kUvzxI)eDt1pLjxmHsD0juLniFSlWSqx174U8cVhc0lTpa4ZPBRueiYLVZx03fn1TgUniuVZyvk0xqWnJfE4dvON54fLh9(RHV1XZXBaPeQitlMnV9jmR7XDrzjr9A0rA)Gvww3bg4dNOSuoptntZ73vDTEINtiroAm(DOAw(PyPMYFQq(qfVTQTCrD3)xXnJbZfJSMBRPADqjijldE8kknczE1YE9GGPTM1PdmNthCgN2mFujQ2B9shcmSALrHITRZz1ZiiSweV7zqdpTs8XIdcIpvZgkVgvQ477h(KxY3EwDVEvu2RvCW0fgAM0W)HwVN9BD9wRRjvq4JUlNP3QvRyXoEhEADhwhR1sPabq)YSyX3Px3r6xJd72C5PIKmgtNmsQduNBQOBwLPQEYifHvdo5R3KTTQ14qiT2VCsptnylfRjxLQInXn4FAJOoDLtXxCj0Xltwt341MlwJQZV4kkoel5(QAZ3pYYhskLbnauQhuxB8f5tKfckbO8RAhu0fR4LO1GoXv07APKfls)bwpArLB5UaQEddc9dWxZvjLyf9yj9fK8CRxBaJcD)LAEZNd(TdOMNkGg6AHB29HGtvt0GP8hyO0W9)eGstthpSSpom6u2MwOt(xQB)Ql93za1WlWpW(WaQQnnaQ8xQvh7p(WO21QR(ytIYksPBeWSS)ZgE)zl73EYm8dUgFWX4xUffvIKhzJ7YHyNF7j66SgZuYV82tZW6jL2GbkKuPSmU5Ql5cxlPw(ib2vDSRWY89KqWqZjbCxWcDxLMNwTsm)p(NO5JfDPkDMULlE7P)BWiwULRM3(dMDaVaMGn9C(1xNg(FpDeigOlNbJ(fG6Xe1I8zmzk0n31hOVBAt)ZOQKeUbxG1uZpHNWKFSmDZc59PrNH2X9dwwhgA8gSlNm0Gz)VeZ(ZWaKFVr3gwU(hgGcgSlNka9XYI)X)RxevPaOCzjyyBFqwy)PX5doM)Y5FA0n3C54pEz8T3DXL41g6dtOrqDeEHjBn4fV(LRmXuGMnjEIfGbcXHzzONoxqxVZfSHc5LFc1ex65shWI1Vhd7p6TbbWJZ8y078UZH8sNMCeV9mOBabCZXtZeDPxQfEA3g6pkSSef)ZWu9HbWP6hE9C4XEyDpHrj3flB(bx7FNLVnnhEs)TjGBA9RE00NG(xsG)Gffi7sZ7j137oAghwGW0zW(CQsexHNE(Y0KYzRqq5VwabUSDjtEpJCuphiEzR(h)VxLjV3F6mB4gCzFei0BW(CQq4zjBNTQA2QTvv7fQ6RiXY5dwUhbQcgSp)kGQ1Rt2MTxqQVgeZaq55HbjlJb7ZPcsFcaINZs2If82NltflRwl2wVxsPvFbbtl0s3)FDCNSoUDqQD1Xz5sv3EFnegbFW293BNyShEs)TPKZYzGr7ic9wUd2NtLx(Y86fIQkrgY)ElEboJzFU(F8Vx3yXEskgV4MfBxLr18EV5Z(dghr1PL)G95uHXOnfqaNLBxGaZFfZYxY(aUU6Ac(GlOM(io6yfoyFoz96ISkqPz2wK7GEHIEMyb9(wwShG02O)eA)bNWddK2Md2Ntfi)h)pZWZrNGoNp)yFypBR(tIX)Ffv)6DgRfoTREkZa61tSDpSm4QVR3VZ6PSDgEs)ngTL7aJMZr4G9gSpNUn3YmmkcsclA2Q1PIYuP7txvksxLSaFHCz73FwmpAGG2bd2NtfYEGiksjFLBaTbP(6xSDb)nosSPgd2NtfKUaD49ZjBq945vpxSoTwSdC50xLIv4rDCYXAW(CYer8qBNv98)4FFt9FihDEkz5YDGR(YhweR6)xxlKPX)LrnKgB2t)Jpw1F4LdILXF2WMXVGLyGg(7DWG4nXYqt6Vn9poEdmAMhH11FW(CCwxFzyizjpNaY4FELmzgJYxwMUyHu0FCXZR2oNoHk9Mg7pyEmqlCW(CQG2eHal7kYbKBtk3U959dFQDos)YnifVYUD9cXKzMmBv)DZsKbXml49)pwV)q8EZHTxDv4O2W)vYI2DoEjtIBFxzTSp9US2W51P1oGjtrA3PNMNv4T6aDFzI7kYI0Yk(wPK3Hp17pB1WWVdieZKV9XBDjZS7wOvG7MqZnEP(ARGtF7A6M10IEh2hRF)0WB7k9l0pueJa5bUIUWdRoF1AwPVInsRUP5DyI(9sIusI20A62NeN8Ut8)f4fET6DGlJ(C2b9zHxL(LP)mETbLfHlE(vudT3oQVRrqt1ii9o)3cps8hu1CWV1TAUjzuVzKU727h9WLt(6DQlZMJq7SgM2TlPXPdPXApKg8aWyy57z5yA6zz1I04defFBttRaCxqO3YEksJHPh8BMEoga5lqDpwHKgldFlVq8axB4JNnr4jE)6in2hIZEqsZ(WxwhIx)eONDPK)2599TdSXkoe4MD8AqWJ98SEVhEBIX343iM13212peVdWd8mdSAJzX3HgHoEa5aWTE)gy6PRYwPtb0l5KP910Y3jlMEH4BvttCJB0ATAV5YDEdbp8MT386SrRt7HrxFrhfHKEsq15XucsvoXC(9wJQOrA0JR1IxXBjQ86HuRJKtO6Dt)BIz1NRUiWyQf1Y7KV(L43Dd8XjN9n4Ye8SxED(80VNoFl9AjJ6HQNFw8QC3UATXxdpXrBNobxGyxWPE3jBuME8PxqJttX6oFWbzm1z5SPjTTUpRRF8X)p)"
	local main =
	"K372YTnYA6c(Wmx0R1k6YbYeiZeyFNSTuvEkBzpMYvTx7OctdrcjXwuKQbjTl5z3(vzUz9m0xn3vVy7VV)mbqcasrvvxRDmrm9HY2sajYd)h((pMFu9Xl(4K7RxF1ILv8VU(Zv1LlxoD2YQY6PRQ(Y211xFt5MTF85FCYUnvtRRkxUDXDvZVFZhV8JtQx)LPxvoVA6Iv41px9Xj4VCU(JNN8m9h3(XjB2Ix4UQ6PZwV6QfxZpXvy0Wpy39Zl3wjdY)(UfZUD68QTvZ2Uy9kzCR2uTD6M7RMnDw5SBQ4pB16PLlRQ3kVZ8fBkVCz107Ey7nlMnD(Uvxx5FvollxT4UsowtlNnRAjM8yUSAhMilMvUC6MhWu4oz6kRjSiAFJnCLwxD)66TtVbl2PlxS6w)AT6oS9i7a3n9Q613nDfwA8XVBbE7D3nTD3B9DxwUDk3NWhjbZ2QYT3mD761yV7(PFzX8T38XZtnjTFPTRN(LBw)XjFCYSLLB2iR8nyCwxpFd3yTA)2l3xnQctQsBc7ZPo83s5Ft(zz(Nbl4Zvzwx7R184wDZJ38Ww)tBtBFwzi1HNzVdTgZ9WthEsvZ4gEovZdQAh2U58HE24v5WLx)NfRT82h22(0UdS40MUvxEy1P2)Ci7qlS9SjyEK12Oh3AFSNU9H5cwg8h7SB8thTBKQZvJ3rg)kfp28X1845Hh3EWt8rpRX5EKdYrNnre37zIK2o6(Xox9i0PJg6Sh5HhmYAR5r2Xh9W2hJ8B0t3TH0onYp8t)OK2JidTfhI2E8Z6sESjYWhp6PpSyNHewQe9H307ZT5uhCMpyprLKE4dNbdQ(GeQdipujzpYg9qboU0hBRBWqh9W7HMEezA6JXVmARW8itKbIZSQdUzmKQZyFeELHhYD8kJg3rpA2JWwnGIBlvasOhqFE96D3xnVb4buOUDzf)HRMpDtvnu1o9(YA83OU573mT8YlRR(8crjoh8jFzD9Y5n6IxSz626Yn3ip8NVFA5MPYhGd)LRxF7DL13oDB1Vcqhl(k1AdSbDOiG64Q5tHAEmgFg4jW0nZ8Xj4FbGllawIPlR4p)scVbOHKNxwEMHk)3Gj9T8b)YIvZx)Lnpk8PfR2STC1SQntVRA1oGkJaLawH13xjyDgbxB2n4FwbSqCDTP6A8ABXwZDyxB70lxdKfFzX9a1LGkHBRBQwEf2JwUw2gbKSszWwT7(PlxF96DB5pUBA0a76s85UzX13Se))YJ4xK4v8dgbTmHWN(4KRRRWKDYL7U6kmLwSetzSlvVOA18LpC1I6k(zRVDDDjN2yG8p597QVhysNamqlX(egHhQwUC9x4tFxjFYASfVLJpogxS66P3SUEXxxVAlWSDD59KYKZQ5CoTCXDliNJnET0U9SC9SB9eAcjcXQodytxH)F)sB1dt3mBDnqBwTzd(2B6VPaGPlxCP)8SDx8Y613csussryDdOLabkOq5r3IvtxVQAAGAaBBB7a3s0ZBNDJhSjjGW2Em4xoXB4uME5UTBdWxVdivRFyAD5Dc33KaThptAidVR8xbhZILl2UGKdyJHhPEcHwPaf2gzr8VL2(3c665unE8UVcyZXlmPpROwOeMh2m69nuHXVq5SrIVuCKVe8wE292jusrwZB4)RPD)v)CIVO8ovKZVEfO1Eo3V(8InRR3ZN2pgQUV6vGaAZnLHtsC(cQkC4tA4P3VEt4LnjUN5Kb47akEr(zZAeefB3THhuTBJnBInBHTt2Zn4JG9E8FCFCYpt5vtWRx9TpnHKBnZhzApTwy16VV5gUPbJvQGzlYJEUY1)8zBz91nhrlMrsrkQdef)S)z)b5p22USRRwIJWpxXr5(MFk2y3UwevjBvEHLGvBZUlfzuFbe13xEVFJV5rGPqq4T)bHa57kxnpqQZN4QYz4BCg4E)2N()Ax58AW)8TpDXfuYC98QbKL(L(iQf)tskSDuKYlR2wUy5MV9PNxw)C539TpL2UYwF1vW(YbJy8U9JtKS5gAXOiuLujHVDyVa8ByZgcC(kLxS9M1ZLDlU5Sz6Lx3nfF1kyhmx7)YK3D6RF9ZF7B)XFzY9qih1h9DVdYz(ov7m((1q5d)uGj)UOrRZer1hpZyYtYm60CDsUonl7Jx9DWCgSeolpvd4TADwEUQWMMWFJqpEMZ6YuPzkNl1yvfP83iQKpZKam)kxMPirNM6k8J22aTt3gUmfiz07fwzTIyrM8AH10jwIm5I4)XZJEST9wkXcFYBa2e4AYBGj4rjm0yE8h3D56LBWg2oqF2kI0lx1RRp20(nZUP6UsVlaepreKlFMtNyCM8cxMUWMyZ87hXQn2D)91qpqapbvZqd9NU9H7RewR13l(ri8P5gZgmpRc0oJavu(RnGka959llFa7QZ9uV7BiMS5wGryYPl)8hELxODlb1KBFG8)EzGb)Yqn4EKf8VfbTGK6tj1NOQwoeGeG1RVwE)bqhi6qV6k)ee)COn0dGcmaZkVNZaX1iTk(jaesnpl49O7wSzg1mY)E5UA5pRGa6RFqer7vQ)8EOE8ZCmGtdYENSAD9D(VXdF8SVZLN5mPw8FCwl(h4Sce9t(1pEM1QugyFUrdkFJsZFdHeIFtEsEAIwztZnPP(FdENBi9U1AmPGS0zkOPb43iuOBaHP)tYJ3Fv2n)coUss47DUojXttEZcbjxR7FecIgbLBRbgLnYHv6uptngICs8arJ8CKsvw5vFd5OHhXZoOtckBicQ5czgfgC90AWAJzBrwk4E1G9THbEYv7OGKobtNzYsYsvf60eNwNKL7fb4N0G2aYedtC5evu50aP4rfggWLmvKki(rmsY2jZN)2vB(LG04FzbpK38lXVYMP6PbfUKAg8xK9CoWf6DgyJt6iB90sG3C1072bvAtJ2v5M2uO5zJam2dLBZxwqOtKMTE9sW32EWiRpIKE7nGa(6BAqwjZMr)YAIk7YOJPXQyMuvxTAX2haL71ReyIIl8WXj3CfJcgqb4bK2Og68VJ6fLtD)Cq2VFo3UFo3TFo3SForl8CpAbWyrvMN)DAQlkawzB7A2ZljiffnvKKHBTCBjipStCcmRQEboORM2bjGY08eZ4hj4IdhyEIpvpQRNGY5ULgopU)MsVcaHa(YpEwMfMdAsYSQmLjdcAe9mc(V51RVFpB4FVhw4KOp9q2ardN1R7ld62SzgNUqLc5eHFt6()YbZrB5NxtYMvcm(gPrWYaOAzU3iayoZg5m(ZLl3jqCseRPFQpy6t9bZEQpO5P(G2N6d6EQpy(t9blEQpOk5j)Kp5Zg1t(Wr9KpDup5Jh1t98XlH)6reWnqsI4QomM1awGfRUsuHr643tX9cqbrss1SNOuB5r9FVGAyz4ED8WXVLxQ2gV1ME7W92UW)2YQR8)LaswpNwVP10nySf8d9g(UFmmUygaNePGDXVsZs2V1Lr7eHXli1nX)dM(WGFarY0z85uFazADrYEMtpfrGTWTo0M9pT42nF4v)YBQMVO8xodp9VCpwvlF22TxrNkjkd7er3x1rZSE2UnypD0xOtwkptEc238OwrP7r82Aay72Bys4D8X)3eXN6)4zF7tYFl9)q(d9)bOExpVAPqKa80qnI8VbgwczCZVCYSfZFET4tj87RQ)EAa(ZEd(2lx)LUNwmz(xo9)(7o58jV6TNNO)Lx(23(YtE5KF5fRxoVSUU8xEXBF9lp59V)Kx)2x8Hjp7oDZ3RvrKPzmJwv(Fq7JOAEPUhrITzjqQuEfJMPOOSL6W)y92jA)DaS)QnlHYF5h)CcwoyTUP7G8PqJCH)z308xE22RlJSRVHc5SSctAHvLMKNuKL5LEOBy5e8bcQ8ryoAm0dGzULEWI(AeG)Jj2pdGUv5fWsoaQSa2lXXw8lYH(nPh83adoZfy8y(MPP64S(gC(7ApPr0vJHuceq)oKFHFjDDl2EM8xaeiaFRuEKdXGj)4RRlFWJB6YMrzph0b3v3jSS5P7yq5UzGxPt2IGoRtqM80huSslZMC(bBHV07VLafRAFcY(4eUvbg5Mj)(yu)2N(lbo0)AKyG2x0J78I9lqVA7xONEdY76TsIfN(OYkLLwdLwVV)3VC9Mn7va9FCMLMbRZt2rdZzIlQ3CwD5Dv)YhE13f(3VEXMTF3p09cH9YbhK7rH2trlXQ1TssesUd5NkVdO6t22yNXuV708MY3r5nyckJqSAfH8dMQp9(nHCZOJmFt19L1LBXSFY)A4J06SRTnEK4nmjiGbAB2Uywy6pVAtj(6ySM7ND0b(Wiisbn0DZJuwhjo(OA2dzAcn(XBZANLkbBIOlj8Men0wmDR14oXbm7UEXkj4qFzGvOI1PcyTW6jm0BlxDBa7dosk75nqr9sp7j7ctWeXtXGVAs5NRehOrunm6iV80lo5vVEY0jxCYfFyYZp59tF3R)W3)QZN(cOf7hB4(o8J9UjN(9V50ZVO1xuCWp8t)Y3nHpWIn)WI5Z9bwk4)NlA8Pf3OotORozgunxXOS8Tp9oWrX)XSh8pXlEAqloHwX7LsT4UQlAqXXF1Kw)jZ)1F)nENN(KwRXRGN))EwbP)PSc8hQx8)EMY6Fht5TbP7hH0zBStecgk3Y9(8ipumPLPmoqRyg1xteZQQ)JGekoxR9s6AeR2x(w8tT8lqbD7J9eW52ZhBQbIxLb17KY9HMl6dF51E4sXUCRXxErYi67bkAZxtKQhkskRvKucDSvx8j9EguuY33gY1RwwbPi(qiloHsC4tqpcM4R5RVELxatNJ7crfCvCSat5)UAv1DH)fdizNGCjs0CGVBXS61mGW0LWXbrfRecOCYRF7ppq23Iv(1pMTp49z3MvL37deem11VWoZKL7aw1KIII88IcDSJk78UAd4Cga4YlPBAOXMxom8F9q13gKwV)Jz4oYYkuzkTtdSN0HV5I7J)U8SmtH1PZZ1P5a5m)vfq7Gpkmp)TxCXBFZ7F13)ddCUFBW)An4UBAgq18NU7Q2oWdBEV9AZYnQ8uNwH)hJPztmY1YtLOQhO9Tn(xE7q9ypbulENm2g3ZldQk3Jk0(oOSpdbrrebqUNE7(pP4k4z7QHubbVDt8cA093JT(70UaZ)294uyV1BmNiA8EHhAvtqAKJq8p(4KZkHSRi9P7XJ)sULSEZIzLR))ZhRIbGveXvnBTYQsyZViOb4YgmhIHVDH49IbK1huqBKX2(SFfML6Yn0mqLRWOtA2pIINyhfx)m1mke1smPAnH(S8eTjb8SkS)A9MwMz5sqcVMEeMYbHHD)U9kYckrOjZVeF49hia(bsj0MurcM6Ob)vV4TNp5xE15)0uiGEXYPxW0v5UhZDmY5uByhADtq6irVnHesm8CVbhzyWl6BepiWCPPoBbe5vOZdEbxFWFt6b)nmQX2IIKKICTcNgzEZ7tL1Y2H5R09Fw2PUz92GSAibxi3UWZz5P2AENRwwETpfE2N9g8PQx4t9QLlxm3VSLdRrzJs)zrxAoj2TJD2LlhLFwhmmQr5dFaasaTYLTPHd0(vbgSLZfvRZwUEhuo5JyAxKpbcHBRGAxm1ygTdBKOirzY0KXq6itVIcABW5BZUHHCeAcRU7sV1eXe74NljRoeS(RXoa9H4)Xg8zBdzUFZVjbQW8AfZCKuDBSbFiya62QY746almU)DZIQLZdHrZBYzibfM8dF48lo99p1SREYpFY7F)RE77FsPz(K3DYRp5LV68NAojo5nN89NUVe0mlhQx3FUuo5DNEXXFLbzv5Kx((p8QxgLxLQKIUKRmRitLLS)0yDYBE75)4EYkuBr8RmAH9Ytp5IF4hpxGM80Z28jt(HtEZjN)ewEdpLo98tFZF)jMIPt(W5)45au4tovxN8U3)QtN0TqIMm6(BN7DU9HZ)(3)2p8U396t(7D0DpHV6jqacXtCWVBc0TK7YY3)Rdc3GfDpLd9rZ6xEko57ZR0CQN(4jLlSjcAZFQF3bZ63)2V)dN(e3P7tOE6p92FmAUAsaC2USP(Wu3tEmPb9NDIKORkHQTUefQjZ)At1hisVvLyNxwgMeSaFZgVLsMOFzxQXo92QQ7NEzf9eguDtmCKuOn5qfes(sbYNHG9tNhOZ9AaTTjLEmn5Zmms5(BGIQN3jxSjnzhCwBDnz(utcdMTp5HpZ1KHu2MeHmlDmRCZHFwtAu5gj(RnNkBONleV6DY7p98tM(3p91VULLv1ld9FmMSSMVBZuBOSqvlvztwCMnuOxVpMP4qs3CUwINMjw6Euj8S2Kz10w2kPDRZV)9NEA3ZAZBZ8vxZOwKmIpPn9vBYo2m1(eZ1Ixim9gjzBKVpBDoGAS4etZ5UPzVXvmssmodvkxS5AplrfsDx1HKYyBo1uf9g5yfFPdoyL9KZp9dx8(tE9(Os2JaIM9dyiul5rHK5Uto91N1LaGfjCE4pf0ktZES)NVTFwQrMsaQBJ3dinzGNpXORMVqmt8Y61LZN5R(WiSrsX7jEHO5V(U1mhz1mU1LZxiqSSjTqsbuFFE4)fbX165R7CPLiUyR3XG8F3eH6EPYFtk1zKefTjdfBYf3gC(zS6advkiegl2D5Fsi)4U7BSUnp6mw7T4678ELxSiHL6Wv1Lx3RMj77Q84cySxHlI53QQVCO5Nc0HnZVu1JgvI2JP7H0YzsSB91tzh0zVzOn(SAuznqXZ(8gKIV)s59um(8haKwmEHNMVOatDQuwgvdTqtWo)eCky)uO2g(b9to1gg)2YSQrpCBO(BsPTZF75N2pKjj9ctZ(Y6zzFeq))YCM5ryRehJ316ZXb)cXeQRyqQ(4fTELKjB9qpX1Mpvdwkf62vJ8xt7(R(1uUvKceCW3LDKaItfcKaSGqB28ESmKRH1Szg7DgHpNC5lVrO7cvKSOPws9tjxYRNbL8Z2U4ZyKeA0MLFB(3c6iyC9QsV1(9l8MhBw1Wz4l74aFrR29yRc9kVdEAtsiLJ6ab5vQAFCkgyEz98PIzSx2dztSFsAypMs(J7Q2(hMG2Zrg5q(JqGc(6(vvDS0s5CBk2L2k(w4Xj5cUl9I3(U4eyUrObPEEGIRilXV6JH8EPrhhLyVo0oxo3qr618VbYhjXJSCspk7MiPUXmyDB(GVGhRFUCPNVEVeUS6JwU(YYx6tGcOHPQ8w6wvVxiO54IJafWKHeNw(neRjin3W9YMIi3NS0S(LwqFH04tltMdAYbMARnptNNh8t2LCX7)knlEaCm(h353Q(m8jTwX0GdkXeVRckWnvDZJfB62MJgDPm2oc1xWvDYB1nGb))5YP3912ehwx2KM1Lm60tvrb4VxoJoyBQrdzQL(dP(6Q)aB0sD78el9Jb7onNszfAtUsB1fPjUujMfSabh80r8G(AXz)BZdERWgMrLOCPQ8eMop(WIWnSrtiUA85kFqNq0xvYF6MO6f26keb3bqjh)X9Y5VNzSi(QZFcVrww4ny4TFYpVaE44pS27fogc(J)WPnPvzexIG84yIB8L62GJSOTAcb5MqXpCK5Gt2)EINnE31)h4W5jUv7F()zSvRdB1EzF(E5bzhV8HPEi4(WzkmSD)2JYSosA0EyfDWAIcfewAtmjgBGp5AwRjlMn64RTU6Apt6TCIwMHvMAidZrE(9WW8uFJMtXN0Z3CkEKhU)P4rE4Xmm9rhNpMRiiTYceKWeMe(Fm(srBGAlVgKgE(rhNXN0Jo7KZSwnjj5fwgcPcBMuL(J(u9va2yAFJbLnf0Qel1XZqIV5XvBeveKTX)9qz8gRi8aA7whakF3rRXMvhaaGLwbiMtZvTXaS7l97iqw1aZPVeXg)5I3V7g8wvVUdEk0f8nCINybyL0eT21mrhl18r1yUh5fcF5L9ozUVC(CgJeARWOPvez8Hy6)DWUpse8))a299tQ3cY(qe6Xel7Di(JPRS8YnRRhhtR9QpZ8hr)hviv(5RFkJV)5RxSDpFJd8ozY7u9R3x(KqlPSheF1JoP2DV41MNW8X0SM38KN9pv4kz2)aWv8siEYaqUzXVJj(FsqBAsmZ4ZO9PROlPX3RSNGN9YvHqRcWo1vZ8(EmUMkK8Pj40S2FWYfxrSsEYoX9zlR(SK2lT9zSwFWT76P3xxnFXmMWw(jyOaB9H5MI7Hq0T106EwqZRR36ZowjqisY7677AxqNJu9Tp9zcvBZgSMw9TpbIzS040JUjuzumAnWc)ByvsS6wFb(xUA73(0gSRuwxjh2YZLYfE93(u5URa6VBjwpzW)s5smd(x)2N(6g8cRAECyv3V9pWVHig)2NyaywFBZVdgdEB5x)AzDjEnzsEZV9F67(jyQC3Ik2r5AEyiZQA2nRX3AnwaRQwU9MYAXf7YV3wqNXE9DRRl)1Mxrk((RRxC1vy45N)RL)7GEO5nY72z4NRA5x3T6Am5VJPnyyi8wYWFcDN)0DRw4BQDlkxgkoaqJT6(zlMp1N1EZ9jdhpIEHKku(6Hj0wqcUJjuVgsq)RMbekB3Tf7pHKgO7ZX(XbtmoMtqIzXEAjgG(M0KO9uMUtH9JVTq95mY(YScYRRD96LsB0BdDeUt6Uaw68x8vxxVWliF3kPxKe8C25spqyXkqYV8(2FOZWMmXPN)I3kHDy6ZF)PN8JV8T)85tL(FWjF49NmPF74P5dGP9zV99F)PtV4dx823)QtEnFSMKs9vNF2BB)fkptBv9wVJAc1s7LeZ1LeV1LCYDzuN3G7IBRxg6To(Kyi(d)gMHUV9np)KlMEXREZPC8F7pD67p51V(LNCXjt)5tE)5V68Vhq7yicyUKGd1WsnefNPLRwHD0z(6QDVtBTh(4p)QZX(XugUNPF4C(hY65LVAYjp)1No9TNlX)A67o58tLTGWZlbGB6Bo5hLjIKkQIJYzXqtVN3go0M8()lGdJDmNfZLXVPfjnFQ4nRL8ywr67HpCx3aWxc)nEAFAN)NPx(2sjzd77bmX4czuNpEU(0EjKIlTZxzoUKbAfgbc2aFIB6Pmpc9iJyqib)662KDUDSVp49QKls2wjXsbcLW8UkiLC6fV4TppAJC2nS3ejHoo48wjdVAz0AyPj)TWslY2zEZqGoyZBoBXp3bgcFUbbLtjbistzNg6AMMqnlskE)8d(R)33vv)qOakdHSEAGF1ZflU)QPQffndpVDd0lP5GBGDVJ3jAc4JMWOEMTWX8hWLzT2cJHzSAQRlS00rLWwVmLszZWFL2DNM1f(s87ngMPJWinTQqj)EBB4QXVwBDoy7EIYK7KUncgEFff3(nWV35SyGYsGXdssuYXO7BOlmUcydOYOzjVXFFE0AiN5ZRjtLGPAQjvm6iPjW0WqsyOkl9SmNn1jDsbUc9r89mxogsRjds(tn(VnttZ25Vb2(yYYtCf5Sdl4F52OEFMbVVZMKwO05fPzP(PUVqOdXH9myHxwAcgeRoxzCrlp)YhMybBCtuyoKKMN6cBX(j45W4W8eZZYT2qa(XCYuOtu(nuBQ4JvDBSNpdAOs04unjjLNRYWz62ToxzWV3(mMSQnXWftrA4MnrLWuw11KSQDNa2KeBrUlVqvyX3oShghU5ZYSotcojm2IuvMnP)o55ALZy0pJU4mS5XEtxI7zPSxwjziaEMen(bjz9Zja85TPkC6NMMQ1zsAvNAhgV7ZYa9trEHvvWefnvCruOlc1WtrMvpUkAUJpQhh2MEDNv9TDYk8tlYI7lvTcfgfHr2ZZUEAtegGHcvIs1EImpSO1ThuuIKNljDYp3JQ)obb2Cfi8YvfmakFUA(a8hN30ibttlaDQOd4ci8Czz9)YMV9PFQQMWn)2N(lX)qO2zXmj9y(RYMsMvLBB7pcbFSJb6eiL9BFIzcQeWM9L1S)Cv59qu7ZHgPextJti4FEmcNU6ZlQxVIysXC4Ss6OQR)R7D0KL003uE9IztpJNjv185B6Xcs)9YKui(bEcuoUdiFXKBB9IBXF(xE3npWu8EPFfPb03022UqisbJMpVSE9xwDWj0jsTx8W0j7U6Q18qSP5mitL9U82U46Dvp2Y7K6zGmA6BWjWBe)T(qtJCGdQDFd6I6dmIsslVJA7oJKr8bNC)cyeCtlFGdPBpd5Rl)C5JVKF)npSEjD67pTEjMWRB6neCeZ3Ziozj4jF8H8fSSXzoo)U1l2akMeDBFKq2pfbHCKpRE9MTxUEjh33SOUEnG4)kQ(3FYQsn5I9S(olHC0s3klV7pS(lKa7BF65qNPmaaU73(0fIPSDVFAAB)MqE)SmRqZp51l(S)1b0l82akcaE2YMOtTADxdOq4tG6dFLmm55aB8M7zSYj3gG9FB3NmllTOTDuiVNnVOWVE)rqlalmbP86Dlh(QwdtWV2(tHebScBHphIW0fYQ(2NwdlHa7Y3(0BkR3(qnjSlJ3WyW8872nuVkn(r(L83VSCXNX7EbKXI3S5F()HU5T1PEgjLRBnNR0HjW6v)lsNFbh4dN7z0VV(xnV9vtYdBx)pVaI4l0z)3uY)xc(F9)n1)nLw(p)pXs77RU63(h)2)pbl9UTU8YlRwUQHfplvjdFdPPwPDPfE6Z7xmV6UfZoanGnXk0q6K2zwH1NOvtE(Y1RN)aicwSSA8rjuKkY50nuFyEyZt2p53jRpDivNUveRI5O)WjB0B0ohJi2snfDZXV9PFG(ky(4jj1vlVAw3RM4BbatalnKtXLwyqoTHkF44a9jj(dqTPDCCQCtdHZ8fS6J)xKgrX8R3ZMLjppZ3VB7MhkFvmaAhaEVw2UEh7RdE64)7Ll)A5IFD4qPj6WqRsUDOyjujd1RUELOrMCaxxX5ZzWgLrthLQOi1F4LhTECfJxpVPAo1vnEprB0SRrZXOHQJb64qALMiPZXqDsPDuDaOLNv69R3oRg625X5pHZL1qZ7lHnyJwf0gq)mivfFQ4gVko9oal5U9qEKkbZLLnqya052SgklaNA9oq9(JWYBQyfwFarcbscGq3tALM2klrb(8hvwIAOSK0g6YcaQpG1ylmglOoHEYTtxUqg5xWnKHPWKgDyp)2DlV1tfbwbUYhDKPa8ETiPi1gVJPgVJ9QvBwaIPY9ic3K4hIo6VKcF6up5Nb4G6n3l7AdEpc6o8I5rSX5E4rVhql8smi8SQnB33Cpxl6oslIK)giAEXnlifsRcG3VBpQFijRZ3RQIO7sC(L)lwVA2n(H4Lqd23(0pFZIn0p3JwkzfGB2poQy6xZFu63mDl2vNpTPHqHRQUeILirlfpDx72pmgwENgYU8COkXdyyblRw5lDa8ckr7xwwCoKm5nvlRQomWQVSUE(uj7NPR5dVi1E5F7tygvTKGJxC1q0XNmF(6XX5t8EBP8AeY)vcmTSocsLnm0qZiBkG5pUMXxxsDu)ynlJyyZcZBU7xu5v8kVUm8neRW4xF(eo5hy(RDdL67DFsROPC)(BEllwAAqs9pTEXCIjA5w)oAsQjOxiRvgieTzI1mnrmQ5PVXWd95btHey7nKQG8ptB7GmWQt8X3zE(6n3ifqkLdVR(UGGlDINpQ9MVilb2vPBhznXJ84J8lRPTzRUQAxv9LaIy1Qn3hG6iVTm8Te155fz5HH3cdBvhbRZpU76QL0f84S86QVcXWBPWBpoqDrItyAAVXmO)HkIWsb5mhHK59mHhxUsGs9(DxUyv44uHzV)sCOHdb8JzMwQrlqVMFKTMFa7iGmet7DxYoXbubxVUbgiFDz8nD7n5bIl)CpT4iBotiAb)uFcO3HE5sMROHVGmaYxOHFkTWXWueT7OShz7)H6YBVTed6Mk)3cWpxg(ajfgT)k0OL4bagB2HuKzX94d)zv7QX(dM)NTC3MnKPTz)xx48QNAVTqsZZ0bmfy2Zb)iJ(j7U6llQUwoDPOag2ILTGb9kGAVyrKt3MDFbgDYJp6NUyZLlz4cWGFfd30Yoe4(wwyshpvUQ9GnxNMCme(V8FRSE3Uv)Rys)B)JDewQCi3GbwlvpZ5T3xcKQ3yB33ZDPM0JSXVKX(b7lSx23CleCE4vLXUJJvRsBM8wtIn9iKmVPC1c2XIH676YDIqUBRc2TX3U393dDIO28N0zQj4VM2lXbnvp3m6gfW5EeHb)mm7CvznLHn7MLvlUAZ2Qw6rtE)BtcWDLzsJfc7ShJFTsKMjhMNWaN9LF7FCJxumSkuz7D17iuKfXJV1CKnNLl3UwKpkBoVPAHK9An7oEr9TxVlISYw(jJbRMJjVbt)vHPVOf5QAXFCI6v59LpqhdRlj9pFXnTxHmP5kNTzbi2LPpcP5UTl8YHHjr3boGDB3mRZQoDVRrgCEKMyBfiyGLNhrC)PlfS6l2D32sYbSQ8UldYeK3U3TidLoNMfgE83luhrEZeqrwk7jBenlFvoLLX3)69UpziKGK0oXzWa9hF4)WDxwxTCdmCq00Ez9AgS1GeTG59Uo22I80wsttsrM(iB9IQ1VuT8(Qv3xU6RbQs25qY84jDzT77AtElBvbVyWoYoZRR2n7MTcaKV9PfRW8))ZQvbYs)7lFGi9SU0i(kdGPCehU8B)NB)AvGRQg6OixWpv1ON14ZLKZD2OVqNUeATYX29)5fljT(7buQRQMh2DcVPm0DmTQcBdahivIbP5i8u(YVzzGYhwH)B)N31iuJVUm(5ru96S)uO6979cKBxelBMlgJduYFKHNoIz(cw(lEj(3x1q84FDXXUjXAcZ)tvty7D4f0MWeSRrCJXuCKH(DL1BxCBRa)FUArhhLjZpX74xZssY6oxlssEkYdaD)nRRxfin)HQfng3QCI0S80UjFIr3UXytog8Mt2rF2izGYKBx)5sVDlupIRqKKL3XWInMM9C29xksvpzhygjQFirtENIwJUiegGlfhA5DX7FH)9hwVRMJXYR(RpjdRQUK9jujEw8B0WYcbyUGpVE(ojjciy9QvFf2t(xYE3tBS95b6VCPFaMEL8(tPoNSN9VD)1YhSfRSoRzx706D379u3V3Vuv4nh8nAzM1g6NLafBMYuCmn8NjkGXHYLvB2nVIzZ03(0)JrNmnSZzQCtRRRP7ipMcEAoEheO(QzKxxcQsRkynaq0kSlnvBpMwgAq0sIDJwXV6Ak3oq2Yxwg8wlD1PwvNXkg3rfsFIhwRm1)Ea9FtvfHM)3UhlI)wl3rqIDrBGu41sshNxHYEmyIpVsqFUB1IaeOjmDm9JV86Y4N2UouffzXMLwC04hiYPVnSuE(V9paHADNDPERglYI)a2)j8bmD8EzznNefMcxr(Xoi2gKDCD1)(ojP7aZZhKpG)9LX3gFcK)N)jGRt2AAMo2iMJn)xE)wyB0DvlK8XtIoEJrgfIrgfDSWI5KHXwZ)1rmc45yQUMA7d7(FUQEEnjtRRaK9vEc1uaCw75hA5L1fANoYa4JzK6ZxwUT5CyxDP)q450b))nMnz)T)Al(OqaVss6IYtwshFTvBp2I6uYyFLWulgFm7M6QznMdR86sPf9bh7b1FDyyC6J5cR3TU(RqEA5QBRRU0dCuzsYZcbzS9oImtBTTBrabGk5ycKE3I7PgU7kRlVE(11)2)VIROXwe3H2JO(3Eqr9HmJTE3I5tVSQS(MDxp9sgwIVCZITvnI(7U6jHS)gN5ty0m7AoYE8lzJTAv9URQQVDjSCNhKLRRAohXoIr3)MOeKiDGfnk2HTocJ1pvcR7UH5alnYtAeuBRwfPFX1)wJuikv)xNOS11m6m)hO1fZwWXL25Ykt2ra19Mh(xMZCWF5cCQ2awudZH8JRlAIBIuD5Yko2eVAXSBUCD9TCQdjCn6TWB6h6orc28I8)muCrih72uns3LkPtOGnlV1ZsjzGK)iY2yRNbIofPMNYKW(Rb)B4aNQFts1PFhIoTT0pw3X28FE1Y11)lWo11B(xB8draXU)19JFNkEMCm)PRyr1LKeqIz7hWaXyU8JWaqFIDhmfEUKa5)maavEtWz8(x3)bI5InnCy2mRn)i7q)y52YBx(WDIl4coiRQ58L3AWYW35Gm5tgli(iq3zUtvvFPGlCceCbjglx0KiimrCLX3ejWmZ9NIaZ7at3VlbMlxqXLLxd0XS(jALqQIGfyA9atHggn5oQfxWGRVU76anY)JQfBN7x8(x3p(ri8lSM)RibEOGxvE8(A(Fk7R)nUX(3AYTbi2s5f3OIebyALqs3uMFmpaddD5vp6Uvxh4r)q9vllBDZzU3hWkDs0xWM9pJVGkwXT9pL9lgg(Fx0H8sRvUmvKsqSLmuRJ0uO7SdHMHEmVWkLysBc)KQ8WF0r26RSnsLGWQK0JTANSLXWB5LSLI8vH3(7RUUlVic3errUvp1KeRa6yM99(DRaaRVSJWScov40fZ6u7OcNxXQ9Z6KlPpQwNVVQE9kW74N64pk3vVOlupEXsDjCJYWG)34(shiWpQJ7VukRQ2Tks31GVv7ZNhLow5Vv)NGYFDEGZxhzsVQ1IBGWRat)JS1anoS0LQdkFGIHv(TgjZZ9jqKs3XURtBDC8)1m4GTs7Vm0EdvAK19Q2Ofc8b4y4ikFo)H72XniCu8Lf11btZAWxW33)fIy7z2W9Nl6L28dcdNXMhhQCZr8P27RUQMnfik26KRVMbpzX6UyLBcPrzRYFJjVvYGrNLBo2g0puw)zr4GpTD2kj6Cx6peoaAHVNvK1gaitbRhGJGUyYd8sWuAJT4CVU6lSuU87q(x3)bmDFaDl6faFYwKDmV9sFvFph9j3wwp)biO4fRRdFb599FHwD4zSXS08fYlkstpIOUxCdZ5rMmgBxxFx9613cH9(qmfEF)xOLx2OzldRBtcNphtyX1lc5F0jlVUSEbxdRM1UnPczABBUpXaN16uC(e6JjVyYIBRlLKm9uMNSmXYoPEtKdk8qrAZokSnvK0fVgSPzoMN0k)C1Q1mRl(H1RQyIFU7RFTntAYBKl1M8u0ThTMBYKr2ypIoHxiGGVeerHSxiCgiVQFWvDdUPnIncL2XoLFtfmsyUpZ(VGTdRwA0W5BwexCABav8uXhBItMS5IPMFDXTux2pZcXSLjim5t7sKADh6gE6MCKt3ZKCE(5v3uD36T3WLWlUPQBjqloKVqlFSjX1gPsfqAMFmKSxSMLYkPqLSLMFIxw951HCrtNs)9jFIwozdB9rXCbMJjjDxD1Tlii5YLR32KgH(8aasY85APQnvVyqeTDj3rHZCmml(eW6DqE6gMLKEst)l6hAxKuOESxjhvk0D3ZKVvKt)I6h2i3LjR7oIdsHY6yGlsBnJ6prbPTzsgis1TI5SjaC(XoH7Pj4uwUl(TE)76ZD(oE3I82a4KzS4FDewG3cD8Z89GdI3QS(7k)U3dWXSvxW4r0KLQHbZ)5urI7sZ(ZtCxEsUhFNPR2fS5jM)jWYz6unNyl(NclNPJRM3wcT2SOksmfhJJyjmazwq12SYLldrk1KYMCSNO1ePCUWK1JOvDmFxurSV1IAHl4Dd4Dl2gr0g(a2yP2QE8DhxZ5QQ4A34D1lwZsiTLXlu1hDkNHj8T2MYUO0XsjVFMTcq)xyI48rPubM0fVDxGwkps4QQ4pTtA)a4)efXY(IvVPowEU(IQYnvEgHjFPS(URx2eFIWR7lSLKUpamjPN07J4gvayz(UzH8)gQ38zaD3xWNPpQ2mqdOKOM1glEsmh9l8(Q7wjTDHMKSEvtQefED)hOtnTROvgLmfShZBnvLXzbUVcRQc7soluk4HBBtJq61gTrrq5XCg2lGri8Jq4DR5U1dDczdvHJTdSDAxmp8iroMguGaMn5HBfs165ryycNVDANvSsAJ2CkoMhHVSct9vsezRwU8Q11HKEo82(XpItwP7dH5y4VkNZwxzvLi1(nSq0dzsNM(JOzRVJpwL0MHK0pKhB8F793lwpXkP4T1nfQqB(rgQJoBEKcbL6)YA4gPtZgZc3zQwbtwWJ8b41YOS7xERxj9jZMv3CgiVVV(Y6usJJ4ii8fQJfLrpaP3xXB)grJgteOY2GMfSrW1Pw2L5u9ulFmX13(aKFwVom64VHdKoDMbH1UowyTUNui9XWHDsD539JL1Lm(RZUe2QnpA098xUoy2owuGrJ(XmXrKCUCD9Cz3FhtKMi1zAXch2Xn8xEttR(17NwxUyExthrk1yTl1Fx0IpV)pXjh)tmfL)eNM(FoeFX)KPeV8VHSg)ZLeE)WV358TZHBREqq2oOJviniIHDOcFJTLxHm3SyBOXqW7KtqfF7IMUbC1UP(Q3UTQT)90cm2wgU0bWgbFAUkMOydkzIkv(VA5)QK)BIFn011e7U02USTT120UoyXRl3vnQMEjXWMmtORlZ2RC)wEQ0kKWth6ZmnDd44F256mX7wtwUMTBhPFULbRKZOytNvRBApcCNAJuxEt2w)WuOWteP3vp5NzGHVzwinrRZZkSYnvMOu6adzuXJN4VW00jkENpzyMZ40oFJNlQcX9pMZ4sPfxAyturwws7JL17XS55z0fEqYGwzlSTpMP3JHpgMsfywZ65SPB3fv32HhZ6mkaAWPzCGsmTpMR3JbwdxEgKINNAOTZTpwE)hZXSUirNbbJGKVO9Xk6VstDaNBgmbp3Y(Xq7J1gKWMVAwcGaxO1caQU1qBW(clIcdSfJDjKcvEIQB2P6FqW7JS0SuiYivHjAw3Z1)Kalb2Eny18HDyx041)Oi3QzpfbyxuPaiAAZLCwxjkhEom3Yss050xwSc(AFo7G1RkXQWXBUw5SPrR3(NgaVQXLbskOGJvfu34n84iJhA4j591xwA34vm45sD40Y54nJvE05HozW3LLIBEwEktKnB36v3)8Gz5SHLcI1zXuOO75gWyaLdmud48nhsYJgV(NhgwDDQetoyEYJpp0dopmoEHmMJZ3Ku)Dkyy8gCE4CzSWsS8sytN1DEO7FEGXsrsLe8uyGJEUbCh2CCAb2S0C2sWunZpP)TDpZx7cE9tVHD()h835eyQlESUt(uUew2u2ysCjSQ18TNYG8jERQDa5tqheytsW2nlnyv4Mu0tpzGHYwPSpD2MRBUo5tNzXQdeVSJ2qNfA6EvJHj5N2bU(c8hDhHPTxkBGtJpbTEkv62mHx1YCLc8yW(z8z9NwMi5y4vTwfyXyhYXMxe9Q4hAXbsAArgy)0Q2x108Qm5)zuxHjGqWGn(RItlq0XkicIu6o7TnVAcplt4joosLwVt4vDmmcejrc(Q2OJzxZDHPUqAQousjN1(79DVuwd7JSGRrZRcr9q5INzCGFggea2aiI1FxH6Fvh4lDos6BzCgudLvc9oj6KSeWIWsT3u0DdCcztSpLuW5uxN2ES8Z9tsnw(jidYHgolBE3PjXYz1dEoM(QS)gLMZBD0dj)0clpzXcOGXpj5XF3bQYuKOltvqTI5jDQlgi)0anIuQJHv9pe429C2HRda4cAdmPrTI2XYpX2j1HYThE9agn)YhTEtHwFDb0xLhPrEG8tlwOAm7CfqkRPqDi5NgiEf64ZboF8yMU53a5NSFhWeS2b5tKIV750dhVu(iK6sN3P3RtUtEYybpjswQgbmYq2bdjqG925MqJUTrWZbL7KdlwW3hQ1slGecHnUiSFO1kmQ4psep8oqUtRA299HJN(69m7ft37M9yVVa7PwdKvNB88c2oyDhA23DYTN3E0mfg6rwnTjfYwY8e0UEZ09TpB7da1bUcE3JX(pSYj4i5v27X2NBWmT33(ytbx)nlxbKOa5Rq0bKq7rIM)0Nc79TpYuWirlkExaCMeVSXAZtAGV2mfomkCBIH32X0T1uqBKwowbTuza4Ra(k3iQncGhkmWMrgqF5IFvJwA)yaTh7aNM8rA5W3eYVZbXmi1HgROxnJb32zifod09iTCza7JwZ7kAi8Mo6OtFdE1utkEvoaD09TA5GoJKmlVLsbIm2mwAvAaOC5qNjgp2YxIay3QLdVqUyMrgvDyIEvJHgXyaq1mQazis)ZOKey3bBpEaWJinX)QNNke7T60CqQomMrqCKhUAOd3hRoqDMHVCQf)g7bX)VxAGX6VeLCaDHI9DpRo7G6VGyvquMcEzMWEUdI)NjDcaLcr0SAzmhs)LbhBSsTzwDNfUCT3N(ldXfWlbC8FCaj1y5VS1YnMJOV8xCE5GXQeag0Xzt6Zr4omhbEpI2mJ2lIDPiSqa2qbtKaP4Ls1JX9bRqsjmzIDbChrqgzMf5ygAMaWKfjJX9H9dcjbcdmPqHB0RA0a9fHCGZ0CZyCFgqhbX3jSZ7HnHieywMqUKxtLrM4XCez8COGMFcLg4PJqGzjLeVcQPDUrysA4iWHjeBb7BOM(Cxm1kaTNaDTAWRLNgbdOHJaFu2Z(lG57mxYmDiWGT3yyPEdydySLPT4(aEbh7MagMm)z6Ox1GnEWKPGQ9KSiiJn4(aTUoLjyKfmtgb6TpPI5RI5BAwEc7VJ7XU5ZKaBl1EcWMNjuU(3Lfj3ZYcjSCRgCSaaOffd0UYV1yBCYW(Oj3dIWmshGhdyyTMdBrnwoMmOJTaMpgSwy)CuQCAZaSiKDYGKSdHimZXUif0eRilyA6HqecPgGKIErL4mpmIqHzbSZfW8GmDms08bwYdRh04eNnZMGKMbqwY2hhF2aexqFuc9RHMMjpWvuMhXspyUarkLadCsZmXw65OVOadl)fEjL944zlRHTGabaArSoqicMz6ugnx3gBuFAlnvkTp0KcPWjz2yfzfgy4dEn86GtiBehpMokdVGnkKcemsrgw3P8YMpbi1ZJjC6S0JTRuPajlGuJidNyghNiTqtWEUhpBboEOEc2Ec9YymK7BJMVAbKUa5wa)pn6ZnIJ3cUvl0UbnuoNsO7dyAbjeOhHfKfSowI0j0YXRfT2q0iMzAbJyZRMWKmcMltVjKOnhsRimzkHAtGKqOG0DaTIS0lFguWVh9G7NUAF2XXBgDhRvenlBMdZ1AHGoXIAlN97r)MDpo2q3x)g2UZzBlYb8h4JQh441hXadqYcbt02BUHqMsFcwsQzOKIgfdIxy2ANJzA4uGTjoI8YAKRjy(Qnq(e3XIjc7tnPMXK7furdmlxXRqz5C0hMTZyqGWjBIyvyAU5aoOfY5YiLsUvaWPBpfgicRGhbqGiKNOuMUhZo03CCf64fidORYBFSHoOvCZRJiKvf5Dh99KFDoev)mvOwf7FudfKSYrH2dTRNa)Kbq3G(cirL5BTsL6oiKSCiqH9HyQZQheVbKIUciXIDYrQ0lxDqsraWH8Yaepe8wKEifioMMVjablaeM7p43RceRMyy1y8y7pl7GkqSGjrtTJ4JcGlh2LcWMemZYjYwcR4GUuaFxWHqNJsVZFqxYcrQSoy1jgaZONRcgaroJ9Bjq)qf12ixum0Lcy(bHMj0HbMyw(bUuGHrvrXNq6i9Wx3Zn48aFrmm02OIEk(h4swlWNYS1XYTpxhDvNieQvEOmeLtkgSydxZW8HaPYOxhZ7B7CYqrirJE8yRcoETVfPabh2OlyPOLkD1SE4VFe5tGBZXRrk(IzE3x1ysQwQne6DEGmYdJX1dao2F9qeDGPtC(xZRcez0OsXwTcpHKRVJxPuE6wrtJq5gtsXMmZjTmacpZPk2JJxHur2aQjkCJSl2AnleYyygjbQ3IKS9441ufT9ubzvjzME2qBz6Tcmegfm60ThhV6O5K0DNehD8eUaVdGqKaq8yRpDKJxPxOvgscrJLf91nOwWirxZNkzbruig6uhdkgSddBgYY8rtR18BftKKmiyQaBdDAaAD8AcJmfeZyLEPE8RMl9CwSqj0IOVAhaCqmuKiEtpHqyJoybjcVFrGnkgQEO7DBPNYGrBm2ejeRuAeKhwJKm2Gz00bDYy44KGIYVZK48K63PYAc6LKAbqmcmWxNosclF3eAVGXyzewIExlmXdudyfLYajvmsQRm6ff4uf7X8OmY)2QcAHefctibJHYZWNsXsqjmrwAtJ9no18Ncv8uYrSu3o)CaLgA6SxNjykuWQoOUbg)Mk2izZ2tq0oJX6mJ29HVTIPisRbw7xuWEmdiXH1f9KqkOKI1coasNIqNadDM4LZdgynAueXGNZG)gR9yOu8cQHbScGockV0hukoBkBIHGzWc)4V7aP4qNloxbnjJhR(GsXPKkG4jbNh0yQONBGwvlVE1igBiAk30HqAqG1W3LKR558EoieDPS9eynCib72sbMCSlNg54F9ih1xya)oS)bINImjq3784CO87zkpUO0rNaGnjJHiIwE39LshEcyOxR4(ayLJcTr6axn5ZoshygtztIS75gCcq4FPqdQfY6CrggNo6ea7venlBzTfrZVbNaGqJ9XWu2nFJLuKomU)ayn9UwrICo09CUbUmJsDa7BUv1ZW408bjVqc2)zOMkYpGEEJBFbbDGVWG2KCwYhc(58Ib6IpCqqbjhRKvyBNX6y22eRlg2PIHL9hGm7ytJzq8T0GEiGduzfXE0cYmbkwPAYaYP9yRaOz4tXBRdxSwrhe8rwFAjb7)LJ0fNlHOImwjmBoIe(rLhqgGhzLXwm29Wq1n2GatHIyIIKxdwUeIpM3xkGCsnwxmPhzBWf23cLcjrVAo9TKbcIe8CQr6IDICcO(HyfuEWdMGACaOvHD4eTeSYrMgBzXYtrcqSoe(gjSgM6ccrXfBuFUDCqqtGPAmOTzmDMfjTnVk(HeXd7FgUuLEpodJ2EqV2ZsNprUWxADK2(iZ2xILqKlGcqCZuXHDSm70mwRbCt0)L2dMyj4bmmrgWmhefhoXsmSvRbDrgAOvK)qh6gmlrgbSkSq4zD8FaRyaCrdo2OaYCNpo)HXRp3otxdl9LhjSD28dLyjoAHle2c8tjUSiVepu)NrmTvX4NqxQ0zN(aRktHuiWhGpz)SnqpmcuGxggUbmZzzfrbDzG(pA8hVNAGKCcbqDOelHnVcXQA6h4GJYn7r)hWyWJbisfpvrCIQygy9zwUCFOYQDj1LDOelbltgXuERaaHwrXDAG(pIkImJmGqyLhTogCEyZfbqojyM5r7ldd8ICvZbLVjw6OOobAdopmmxVyiZy4(JZ(JbNhqtem2agqRCmxF6EUbNh0NyIulmdYI)UPdWvbXla5GtgWe1y3RYkTFpAr67Fva(wsnkMWEwt7nr(tqlcZYpQiGUSZ7luV8CPoIJ0zqRP5vla0YsT72yhBAeFHc4V0tmPdt2pM8gfAddDFkVgLYJJqhZtAWAjxFrri1Z6uYzzgSvWAz3F9l1aupJh7q2Qlf2WfLgFn6mm0xRGag66W2RlAcBtLqyWmDtLAJW216o1mjAh0AkY1fL9la8cqUdwdi(r7ICsrR7ubLg9thqbd9l(Tj)freSbRFAYqptG9owx1jEhfBdqYnm6U00rQNo)aopnh6850tXS8PxQZnGY2YALeNBAMheXH2tn0)l0H30fh0jZQd7)kgiwfdwMPhoVH(VYWtwO(dWPuUd7)klJXLddhKhbBuoO)RaZet7dlOtYzQaEq)xr)jaH0gEJwfhESH(VchrK2xdijDxk5JL8drmaImfcdXw24VBXa8QalygZIsSnYsO6qPetorHs3eczMXwsnkLyYzlqwOb6H7EOLpjCfRblag14ufAykfMZ7ogdPOiHvYbT8HUcJbAcI6K7mJdy5dVt0GUKewIysJl8aw(aOtI7sy0Y4r3HS8XaKCeinvhdGfh0YhtbJzf2GzcdzJ9x3GZd6prqJ6YKkXO75gi53a(iOGGSSQ84u3AGKFdVi441xa0JPJSynk0a7nNhT9dnaM(aOdqxdD16K8NUG6CySe97dn20L25tPZD9LtNtD2avkG7MOILtBHqaA1fOuObyU9e2liuSWXuuQGGSIHkdXKf84gSv2ip5mG0HEWZrKCW2zT1COe1EV7bJtu7e6kD6v2mTXApuIABOOwndvagu94esSD0C8o6JjGvHXe5WHbunsutzviQ5b(bLQctGabdJBctd7OiCnqQkX9cbQjqdgnFjkXLhMzy5exe25nWui1HXtBOXPjz(qIRpyIAKz5zg9WHH6XoyIgMzKBLhiqphQsJhVHbLjH3IGkl2COBypyyLjklA(bu8cfKh2Fsml9zbNskrGu)q4PZz(nXVl0sQ83rJ7fpni75NMoPKjGP7GjQnyJumzIioM4etFyIAtNHvW0SHHvm6CBGuvMd(WmrQOlJMBCi80utptXxaqYLAJ8MXWe1UWkzilS(gNWjQdMO20yAGJhAG5fq5EclFMApHLxpmb9s8jPlqgdGiU(sJEKeW2sK8uITew5yFJxOWbwg9HLT5k5SN8jr7sHI7z4aq1ZJ8uVddbewpHCz32dhjdnUyxTI3gl9IdaOpWNemKmi5DF1Soyze2cSXtsK4i3QZe7f4lTmg4fXa)BJdaDwLJEzttfO9wRgQu1rVjxOII(qxCaYyw5JDyEfOAJ)QaZh0FvWugnpicSFcydMiAhubyGXoASZs0S7oqowklUWokoamqKmpJD0be5XaFzn9KsNuZ0FX5g77baMgBouJEkO9n99hp9mUJfODF5Dn(EaYTyJgRWYAe0MfN5d5kXz90hI5H4L0twjXCyzOyyAzqxifBCHLWBHWcfB(7zJJdaVLxtYyg5ZkSpnjov1vjWeaJs64C5JtEBj5BGWc6bAQBmEoNYmpIQ8CPnfCs)4aqXnI1qyNs7Lm1KLvPsM1ZQNIx1FQXXbaCoo2dVLoHAWPu2MOsNROJItzQsLmokTNbjnmftWx1YqvKg9Um)24bliPaiPIXXbaShSKGlyot6cXBjVj6s0knEpVA6LDkQ2CGmLnumhzR5LLRRl1P2VuK9eHxSOm0sp2RqIlAPXXgiJonQGqjI11meHSJ9wjEjhd(sxxSAISDwVN8P2y6NIWmvlyABBONVu68NC(5swA6luYEN7IDaRL5tzcmhiH(NCpzJOJEpwUtJDS5bfhZmMNgQuM6QWuz1iHGWcPunrlWNiVx9GKXS7hNmAP1tSNGHIVeoQynXwWpBm1U4xxd(U0XXJZnjySj7VTSZbasVSEPuOMPsoJBpV7IthNFUaTjLtIVm94CKxuTmyLSftW784qoT0ZyA6ABg8rwJdKQpkbJ27z2iqFoyCjJGoBVBQ9iWRZPtowUkjsBio1E4ubjtkarl7LA5ps25YnjPIlykpC4SZfSs06sPCysI9MWqtPLRm0uSbQOdlmpTSsYK130dk83X6pkH5KON9l941nWzSgHHisnfrZICQZYJchVNLtc)pQEMHWB46ul7P9joxEmfoJHTVHRHPsYy185mX2leAJ8GH0nVkBb)yMqn5eL(i188Q(gQ)kyT9aXu59yjbddlYeWsgkaoBVqmWlViQsoxm231lL5HO6uMsL0w8XQ556JHrobhnScpIyj1mf9z6P5YP6XXHya6XXC2iWH819st4um0lYz(UgDO(t7RMhiAG6j2UfYyQ4eTwPaA2syzARhJDTnedqynTlrRK8)0gVn5yY0NWY7Yge)miC)ebT4kpAVSnUu2iU6CghBMEXQX1UkRFgOnNh7P009ybqyEQy5jYIDqhhEIwckdlir6Bn2zavXvKgJOitXyAwEQzpH7NvDj4DG0jMFD9spsw(X8A2fa8s2xEVthHZGTi1tbVQ7JSNoPqgrY(YBhLXQ5H9pog0uGPrhQkSw)iMZw6MufVXbpStnVJ93bSOaCky3yC0YWzAbdcct3oDGlyq4(tu8jW)fYZZ1240mirloybkc09mVTd9iJ7zctjhRUx5uWqBWYcLrsQjEz9uZZAvKxSksunY8HITbAYEL9eP6xyI4fMPJIo9EWoe6k6VdjfGiIlvuoEoaoatmJCqaW0vfS5jDp3WAiJYqj5GCT(3oErWgC7d2GeN4iBNOJ9zgBduGmP57dBi5WItzGvjQVu6R148sMHwGdjH2LesZ3(2oXOgbnI0v9mLzItthwXojze6qsij76B7e1)kGozVC2Mhh3whli(mA0vr(EeQYR9vqPXIjIr4po5Gkyikb0BaFVX5b9fQMwqRuveQCHjls1b0b8SSCDpXOs2UPzLXbab9mV7q2O1LFlAgslOK3yvHyMg2tjezwk9SsOcfeApXOSCNeVTZ2MEOsxBShLg6OPSbTkeU1EIrDm)cPwbnr30ldXKmHGaLtjXMDSyuqQZM6KJayvSlOeNyA0DVS434xnzCwtzz5EsNMifICVe9c0vS2xbJgvMLpYBtc8rMkV5SIlnfDGwppn0(y7aAseBsDLYJ44vNXsNJWEqqEUjwqFBosbBwPt95TOJQxPRjvanneGATCXqTAZrQC6ozhBOVqVzMQxvltuVSpZA6BlOTfMQtUu2z5TPdfiuqGBHKjzjmEHjXv(sNTrgAfp7dfPqmVnUyWkkEwsO1O1s2KBiQ1eLKN35z9(smdjzEqcyiXQYAftYYowXRCQeMu6rwSsp9BznEqlkI8bESfnXvC4bgkFHq2pcHqSHldMFXIgu5gMpPhRqi3)BF0cHSVHwmgEmtXzOpCHuUm9ju2TSepSKzGns3KE8kf0bSfPcUCJh(us)Y(IHeNTdcJnOVRvMIkvkFkdZ8Km74cHSGj3qg2xzwGPkIn0kHMdbjvg6CO8XL9frvi1Une7vK2tonhtkLh4bSjJ92eJQxHCrAc24ISIyB0SgA7nDfsVwcrxullOZn5DvblI(8oTV7FJpoQLjysjgrlOzIm0InTairXcMIIgPrP7PnOKtFMZy16kYdjxvFDQm0gJiqu6bwIRfR(zxliPToxoEDbkE0LqZ1kCKweFurVsyzuRzoZKLnQSjYH55fe2rbVfMe)Y2yDkKdbnPzsKMIJJ4GeQGi0WjsQMHi0COsKy)lTrHgXYIVfpd0gdZBZkoqOrScfnD0oKafhd2HHgPG5Fuou2WMdqYHcnIuvsS4pXExAH(awjZ2VsQwLXcBkrTVE(HzFOMkguAmgIwgZiLrBE6fcgqDcuPzkws4m7BJrnX24dWgYo(s(Ekemypi77KP4Hyko4IRJAlZdvOYeKbbuPUbMIQyLUIZeSXK569vHoi2yimME5nulQjw(0fIcjfTDi2Esh7DHPmf6YursE6mfvIQp7arm8iXfCAotux8A05WfQXT8dMq1u1ybeI46JMb69GkfhVnetkS7jB300XWzSnxOTjXtyRKh1ss7rNkRhBkkmMmtbMVCcHmVNvS0FZm1mPlnnJXqrNwXSOd6WmYLoE3HdS1dCcSSzjqK9HHIw4AHTUS)ROtIpDCI)t5(xwMYooNhyjNkWzfIQ84u8GjOp9)wUt60i7jZZzrVW6RfcoarCEKmAGkGfddBV2j9Za8U8NKE8hKeSLTN3lDezlKrmc2YqEMVhpot3ntJYC00pj38cEVD)Cv7jhksWwfBaeA6940oZWgvePXrpmE8g2wMacFndkot929yozxz6rpiMkvbVt1v5xdJ2NH5iqgdlCQnkw8DIyS7T87g2GmYjlGJUR21wQSpH(EwHpeNwwrdPjXw6qS64KJfvTYfkoPIXDnJ9)LhPZGwQXAaG12vsCqxh2STsyzgWeJbOOlshkOOnL04TpJrQ9UMcuZmwNrUewrOHkLz6FYOE(tNMCSyzWQnYfwYH8Sk43zGkyTFAIB4vdcNonnkN1jgnj3AoCF7HrQcGztzNElknc77z1ZX38zPf7RcpLS2MAXufusuNKg1q9183Z6ccwcLe3jXgMaKaLNKXImLeJtmut)zuA2Z07R1MXm0L9ClERcAvrrUEygOIPdJnzItAJufhmduZyKByFqJvsx6bJyolZEAWArANtL3teZXWBEg7Xs7jNtbvCQKMMSv0Puhkg5wWX7y4ijWjDuo7omNtlKwJdEKmIetDOyKZu6mN9ZlQqwfPIAynxK7ZbTmwmuz5hSzMrnEzIlyzpprxCOCo1Y7diBUMLGusOh(nihmt2xW0ZgemDr4ndGwH0WAg0oZom6vqIqIewkRaXzS2t6sgh3uy(EKNmQO6ySjtf)0jsks6Ln(g2KISmgOH6(Uh0gXB1mVOGPemLoIDablwyXgyMih2XbtpNshCs82PVaJJdpw9Pgg202A7ONdHSSauzWTk85JyStRnSTwZOqQ0Exg4F1UGPd5xSrAqqq5MI4EOMKWa0Uuvp6W2(8cnnI(nJofnjoSaS))X0UHncvklEm0g6WsUwlKgmrSBNPxY1GdInHo7E6QfKuNbfdiUCS4SI6MzutpwKeiqtYL0py6m5NtKINJDNgFF4W1KoN7HkBCmOycCdgjAARlUZzePknFFPR2GyJMt)mNNW4c35F8wvPpsRAHoYJ5TvwIju9YTEXHzxgrhPb2nVjW9BErfSLMr3iZohzpR5yHLqEeMT(XA66SzN5pqIyswsV2frUKPTkcAlvU1YhsudIwMjz0VwamJnPN5(82NcwKLO7vtmDTQfqAWqKjVCmws62HmjLOCmBIouMUT)D5rQMLeauZU4i7FPr5q0WcUoN1Abdvpn87q5pS0sGiSMck2vFqvZS3pyzJioJTmg1bj4yEUrVsxWws5JK)WsVPXirQ20Vscth1YKyl9PG1Hzpm8JAjrkjS2PoMc9Qdw)7gjAXeAoZ(7dw)7SkgymoYOak1HZ0ngfr27fzLWWm4(GyFjjRLEsaCKzUIdM)WjSfWuWonGUPsp2B(dNWsEI3GDSnafNNXQHJhRgpPQ6zFo4GTup2YTv2MgzvXHYFyMF)SNWXuj32RLPoit3Cs)8GRzavooVLndB8nmTQyA8ZuR2DW8hMQ4tzZxKDbT489DaWvje(kPBazI7UK6HTiw6oanJCkli90dL)Wzs2KYURGJ6Csoy(dtvwzmPkyXPhbMFq(dlvUe0ezzPHKhTEhu5i80a2aYu4kTWUVwCOEF2aLoO9bqJlYlGGFA)TnzGVwZpSJwettH9xSqMt09Qnqwt00Rhfm7vsg7lngtr2VCaFRlVxD6Bydp0KjzeJlzCzf6yefyCFOKiJowdnlXsWocPA0et1yhTixGialILTTLK4glqQyqaJZHRP3SnOSc51TGKf(swWgNPbjSPGX6INXBwTphTqnnSVwXEBxCA4iXhLjqnV(9SJ74oemqULx1nqdPR3AfmnCdoxUmdJsuUUCWIr5J5GoMXQ4gFlWxiTkcgT4q(coOhBb0TfqqLJrKXNNoTFvMjZSUNyAwNTNESfE3eQ8j1ce1AxVzmXyZB7dWSKKKVhhTOLc0bCiSpO1RmvTYTURJGgtDf69uI)5mzdzW7tsS9cWg7(No2Mss43VZFZrHVIEiH1efLgPCX2YZA2KHVIATdHemTVILNX6b0iT6tE7b2K16joLyNTRjLnt7NvFsZ7XYRYzM)ZrKtwPYbycKAAtWOE(DHoVNzFhD8wIbgbfNdjqOhBQUjwjU2J8fdtEcf99gZbRuVe3wSweMfbsXQXpkS7TXXcAjGqAMaKPcSQyWwwaFvZesNEmYoYNn(Ab2jHDprUT77(US66bmF2tMWH7Ec3p9Ve2TWkYq1o9sZag0ecBI1RD0(8qRuzoUXo3iS0Tjlb3x4(j9fTyeiPTnrRmDFwPYm1LbdNDTCtuBhAuLrMi9rkhTun4j)09wzKShSLjg9wueVhyhUo403X6PkthpEd8tqkRO7ePd54YmrJ3y)ead(GfyjIoPUNBylPpH5UaLZ02A43xFcGj)cnGIlJ00O9VHvgjvAKXclLXrnQ7onSYiPZCz32rr)4N1n)shEEa86fStMKlHUQ75gCEiDOzCel92Xi250rNhsoeZaROYI)U2Hv0kZwiwxeQ(F3bNhaUg5mzMBztJ6)ud7taSzJZ0wNzDsOcqgKUj2rExq(13VSCBvnvRxxvUK3EetNF)MPvR4nzXCEbteUcm2wEB1QPBUPC(6VWRRIEpogLhQQJ(T9EPObBVV1cEBiY(vu)pv7pU3lnB9Y11dU5k4fnsc1whUflIF(YvZUrEHjYYEYVk)3nl4DoRZFDCe9rp6t3BSpWm)37umSp8h81(9nLdV0HosApbdV3Dt38WQz8e9(61xTyz10lFy6M7RM5BhuLBUD621tRQl38KUBvc3HjHjE81yY8fB4pEt)XFEv52BwU(6P3G5YIvxpN3Hl3X73sv42nz6mq)EnWxoDt5NRM3CbS0DUUzw9A8yrZeSprdiyyQLYIpr3KguyVdQczpfe6bHUPMqYA5kzXkmOV(0ZgC7UCj2MUf7zRMED1kSrixgmxTE12gQdv4FgF8M8mjY3()mn8NzYFQjFR)n4vD9hN8Ytp7Kp86MbD9UTyJa)4ZF75NIVEz90Tv)62D14hn52hKFhE)LLGtF2nLaPo3(8tfMwwfFCs7LUZ0)T17QxvY9Wz3u172H5l3uXr87)WRE9lXIVSEdE813ZDqETXmHl1RFqUuCUAjiyUK3BolQwox(r80c)Ogbm4W(LH7uMYvRW3Ew10fCcuV7(THHRLC8lWEH7HePjFK3r8R4TRZKjN835LheSJ4o(ZxHfm(ZTrd39CEpAS6gGtF9zCTH52MkzM53HMx(WhNGZ4j(BiNPRwm72TLxZ3D9S5quz5SB9sh93kql2IZ9N3DrgnB96L8SFJFZdmiH7Yiq5Ev1kEPA9D8(ZrgWWpqep2(B3YRq3TYf5ZwYo8GWm0(RXoXgEhq6NZYKO5uap311R3DVNVBdhwsf2Yf(iZGl)dpdcFRXdVS(VRCHNvV7tfyJh8XKFAZNBWJ0(bVOrb28T3eskPWfz0W99BQ4TdO3KtodHWm)9ngxkKLaY98cy3D3kVa7bJGSZoB9k)DUPSaxVA5dGmLcs5FSfYzLZUWpFQS57LugrY5VwL832vRV7YYTyMCnhoHwA6nEgVRa1ZxLn6fReAYPTs6AoSGiMztR(8Aq)n1lkJF8rpoz3kxUuUFMWBfEb5LdV1LnID51T)c8BM()Q9U22TTnAc)402lAcpQta9czl5edFkWs9I)CrOwlUsKv8GWUK5qHHUQVh9M8m0xa)I1zMLKMIELiJ)HBrbcqGJn5o78XLZm7S7hjh09u(4XxZJPIJL0Zew2rTEHgukNEaMDqlaI3gLlvghLZNNXuEIQciLFoeecRQFql5zC)jNr5QzvuetP9cU6KuG9g7yamIphaGYVb0QIOd01LEGFIHWIb07qdB1QWptvfgrUsey5L9WNFriMpNjWLgyvKwevGVA0gyIL9psgThaf5A9Yc0H4JEUZrXzztQGzXbuO0W9FIHtth89B44dNLT5XHZIJKPwPZ)ha1Q7af)GznOfGw0MAavDKSYSJxLkGjx2FI3QcJgA4x4DJO3Y(1g9ETL9UfMdh5AmYX4(Rq)Rz81XWCfYBsMM4VBb4DiYWkH497wSeCUuLWEQUAw4ldTrjYUfSSItXrrRkaNWL5RObdD6Ka3eLt3zHjHYaU)p(tK(u(73LkL4uBYGDl(fOhf5uTs8jDM9a1fWCSPNgXzj5BRW)RW8v0jYjqVpbcMZkVi3GL88iyQ3Or0FBAt)3yjJPAWeUaRWIqV(51HBxH1ky3gDTJ7ilRJJMEAfPZObl3VcSy8Qhq9B072WLB)JdObAfPRa6nI0h(ZpXLHauMkGjFoeYg2unoJCmV)03o(YlNE9BM6D1ntM6nB(4BNt9GKNHwCsqzXWIvkN)qzuGtTr2eRGji4h3KHoRphc5JRaGMQyTGTnalAYqtCPZxKXLA2c0xPzVxhcqoNjEyg(7RdQRlsMVUgQAaboFUFiUuaFVkNN6TH(r5OCXq8VdQAKMX0QtEUpCAK1aQykU)OS5ix7xy)Btt9k955GBA9n3Bt4Gtre4t8jg8JqWeuLsZRufoTN0Bgh3HW0rRmD1J4mwEuMiKjwgGq59PWsxYxRU9EcLOEcCZlk4H)kGwCwZyiyTM2Ufe2tRmDfHNWYxgixgKlLhevndKy5mYYTfunqRmFdOkoMLhDqi1mcI5ai45XHKLHwz6kKElaInrSComoDHiKVwgZZZo4TsRMocMw4mDFpgxNJX9Kb19JXH1YfApT3Fy2yWiB3x6KyS1R0Nxqolhn9wlo9wUALPR2YttYwXLsEeA)EfS2XmS2nN9WxZECg75H4QB3UkpisXS6(6ZEKrlHoT6RvMUIryvPWcof5RqW8ECddzhcC7hRzWiximDlj6ynuRmDoUopscbnJYrRdFerNWbVNiEc)aG02OPcTh5m84G02uRmDfKp8hW9xjEl(so7ZhA0Z2QPsm(EGQV9KXQnMUFCkSOFsC4S)OmKQVBVx44u2o6v6ZC1wUA6nNwSG7PvMUpNRicxfb5HnBzqCixewK(0zcEyadgZvLwT91IzRle0EGwz6kYULUPu45xMgqDi1m(ITlKVrlRn1qRmDfstWeEVGTfJJNi3KghMXFcUCAgsXAyRjo5yPvMoFtmmogcxU5HVUn7hsWKNyRx)eC10)WImv)xpkKPX)zcdvnA2i(tF85haF4uTmETHTA8fMjgUh(sVyqS2XQtPpV4piJwpP3mBX0TVwzA30TFXYqIyByGp(fbfBMX4K1IWvRkC9VoDtqUpOMbnvJ9iZ2G2qTY0vOnNd3k2TGsa5kMipFZHXxjZrLmc4f6JPq2BiUzMSLbnzZIhbRzM7TLLWjsiv0nOONdBVxcsxZDkclZyEbmXhXen89wLkqg8ezfYuSRJfBNoPxNAmGvSfP7REspbHzQ94LyUyvOqspEAZuC8PyX8XUHCQe8LPc)6D2jnztdVksr2ekhjqQ5twfUUA7BJt9tPDPuMFNhldw7(Dq09AhHoqQhcYcErTuVl80)mlO9gGQcJHq0OTqaoKfc5Lk(DGFxMW2wBuf5pb3A21Hji3PZhF(LZ8E3L)6Bo)AV5NF9)ZB(BVD6yKrpLFhXwoavfWQbtZsYCMLKkIv86(LpC2p3Fa(8iHVnay9ZOS2squh3dFbuWxwZb2wvpfqZ(e(qMzG1jqZE2dCTR(Q6plGEVcWhnTb4Ns4YV3aUeJuPrPfK6BrK6BI9eK7Rbk314x(KQTPgmhurtHlO8Q77vMOzQn3g)GaJfPn7A3URtd2HyxRoHQvCWwzmC74ZNSNfezGb2CTz9qKo77jsJ4Ysg7F0bOY8xQ4ssXTKSY4s93xW)sXw6xs32n39B8LzNMMKXct4cAyJCXMnHSSvbwNc6E3IZt8d)yOFodIc)oQ)k73BapfIAVsgdEuX1vZS87MJxGim0ROXrv99UfNcIcGYxFNCnjCH2QU1IZvIp2cKlWh(7p"
	
	Details:EraseProfile("ViksUI_NoPanelsOne")
	Details:EraseProfile("ViksUI_NoPanels")
	Details:EraseProfile("ViksUI_Panels")
	Details:EraseProfile("ViksUI_Lines")
	Details:ImportProfile(NoPanelsOne, "ViksUI_NoPanelsOne")
	Details:ImportProfile(NoPanels, "ViksUI_NoPanels")
	Details:ImportProfile(Panels, "ViksUI_Panels")
	Details:ImportProfile(Lines, "ViksUI_Lines")

	--if ProfileNames ~= Details:GetCurrentProfileName() then
		--Details:ApplyProfile(ProfileNames)
	--end

	-- Load on all characters
	--Details.always_use_profile = true
	--Details.always_use_profile_name = main
end
local UploadOpie = function()

OneRing_Config = {
	["CenterActions"] = {
		["OPieTracking"] = "OPieBundleTracker3",
		["OPieAutoQuest"] = "OPieBundleQuest180805",
	},
	["CharProfiles"] = {
		["Quel'Thalas-Skytter"] = "default",
	},
	["_GameVersion"] = "9.0.5",
	["_OPieVersion"] = "Xe 2a (3.104)",
	["ProfileStorage"] = {
		["default"] = {
			["ClickActivation"] = true,
			["Bindings"] = {
				["RaidSymbols"] = false,
				["Viks"] = "<",
				["SpecMenu"] = false,
				["CommonTrades"] = false,
				["WorldMarkers"] = false,
				["Hello"] = false,
				["Emotes"] = false,
			},
			["CenterAction"] = true,
			["RotationTokens"] = {
				["ABuehyJB06S"] = "ABuekNAmcse",
				["ABuejX/ZeFz"] = "ABuejX/ZeF4",
				["ABuek7zNjkd"] = "ABuekG209/r",
				["ABuekGtRAP1P"] = "ABuekGtRAP18",
				["ABuezqzGGSt"] = "ABuezqzGGS1",
				["ABuelBTLtNE"] = "ABuelBTLtNa",
			},
		},
	},
	["PersistentStorage"] = {
		["RingKeeper"] = {
			["Misc"] = {
				{
					"toy", -- [1]
					88375, -- [2]
					["sliceToken"] = "ABuezqzGGS1",
				}, -- [1]
				{
					"macro", -- [1]
					"Rarekill", -- [2]
					["sliceToken"] = "ABuezqzGGSr",
				}, -- [2]
				{
					"toy", -- [1]
					113542, -- [2]
					["sliceToken"] = "ABuezq5ITP1",
				}, -- [3]
				{
					"toy", -- [1]
					131811, -- [2]
					["sliceToken"] = "ABuezq5ITPr",
				}, -- [4]
				["name"] = "Misc",
				["save"] = true,
			},
			["munication"] = {
				{
					["sliceToken"] = "ABuekGtRAPc",
					["caption"] = "Agree",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionHappy",
					["id"] = "/agree",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPx",
					["caption"] = "No",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionAngry",
					["id"] = "/no",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAP5",
					["caption"] = "Nod",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionAfraid",
					["id"] = "/nod",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPz",
					["caption"] = "Shrug",
					["icon"] = "Interface\\Icons\\SPELL_SHADOW_MINDSTEAL",
					["id"] = "/shrug",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPl",
					["caption"] = "Raise Hand",
					["icon"] = "Interface\\Icons\\Spell_Shadow_AnimateDead",
					["id"] = "/raise",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPk",
					["caption"] = "Ready",
					["icon"] = "Interface\\Icons\\Ability_Hunter_Readiness",
					["id"] = "/ready",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPj",
					["caption"] = "BRB",
					["icon"] = "Interface\\Icons\\SPELL_HOLY_BORROWEDTIME",
					["id"] = "/brb",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAP4",
					["id"] = "/confused",
					["caption"] = "Confused",
				}, -- [8]
				{
					["sliceToken"] = "ABuekGtRAPh",
					["caption"] = "Lost",
					["icon"] = "Interface\\Icons\\Ability_Spy",
					["id"] = "/lost",
				}, -- [9]
				{
					["sliceToken"] = "ABuekGtRAPg",
					["caption"] = "Listen",
					["icon"] = "Interface\\Icons\\INV_Misc_Ear_Human_01",
					["id"] = "/listen",
				}, -- [10]
				{
					["sliceToken"] = "ABuekGtRAPf",
					["caption"] = "Beckon",
					["icon"] = "Interface\\Icons\\Ability_Hunter_BeastCall",
					["id"] = "/beckon",
				}, -- [11]
				{
					["sliceToken"] = "ABuekGtRAPd",
					["caption"] = "Wait",
					["icon"] = "Interface\\Icons\\Ability_Stealth",
					["id"] = "/wait",
				}, -- [12]
				{
					["sliceToken"] = "ABuekGtRAP3",
					["caption"] = "Tap Foot",
					["icon"] = "Interface\\Icons\\Ability_Kick",
					["id"] = "/tap",
				}, -- [13]
				{
					["sliceToken"] = "ABuekGtRAPs",
					["caption"] = "Veto",
					["icon"] = "Interface\\Icons\\Spell_Shadow_SacrificialShield",
					["id"] = "/veto",
				}, -- [14]
				{
					["sliceToken"] = "ABuekGtRAPa",
					["caption"] = "Point",
					["icon"] = "Interface\\Icons\\Spell_Holy_Stoicism",
					["id"] = "/point",
				}, -- [15]
				["name"] = "General Communication",
				["save"] = true,
			},
			["Buffs"] = {
				{
					"item", -- [1]
					129192, -- [2]
					["sliceToken"] = "ABuek7zNjk3",
				}, -- [1]
				{
					"item", -- [1]
					140587, -- [2]
					["sliceToken"] = "ABuek7zNjks",
				}, -- [2]
				{
					"item", -- [1]
					132514, -- [2]
					["sliceToken"] = "ABuek7zNjka",
				}, -- [3]
				{
					"item", -- [1]
					160053, -- [2]
					["sliceToken"] = "ABuek7zNjkf",
				}, -- [4]
				{
					"item", -- [1]
					181468, -- [2]
					["sliceToken"] = "ABuekGtRAP1j",
				}, -- [5]
				{
					"item", -- [1]
					171286, -- [2]
					["sliceToken"] = "ABuekG209/1",
				}, -- [6]
				{
					"item", -- [1]
					171285, -- [2]
					["sliceToken"] = "ABuekG209/r",
				}, -- [7]
				{
					"item", -- [1]
					172347, -- [2]
					["sliceToken"] = "ABuek0gWpUe",
				}, -- [8]
				{
					"item", -- [1]
					171276, -- [2]
					["sliceToken"] = "ABuelBGtuUt",
				}, -- [9]
				["name"] = "Buffs",
				["save"] = true,
			},
			["Laughter"] = {
				{
					["sliceToken"] = "ABuekGtRAPE",
					["caption"] = "LOL",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionHappy",
					["id"] = "/lol",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPW",
					["caption"] = "Chuckle",
					["icon"] = "Interface\\Icons\\INV_Misc_Head_Dwarf_01",
					["id"] = "/chuckle",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPQ",
					["caption"] = "Giggle",
					["icon"] = "Interface\\Icons\\INV_Misc_Head_Dwarf_02",
					["id"] = "/giggle",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPm",
					["caption"] = "ROFL",
					["icon"] = "Interface\\Icons\\Spell_Magic_PolymorphRabbit",
					["id"] = "/rofl",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPn",
					["caption"] = "Guffaw",
					["icon"] = "Interface\\Icons\\Spell_Nature_Polymorph_Cow",
					["id"] = "/guffaw",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAP6",
					["caption"] = "Cackle",
					["icon"] = "Interface\\Icons\\ability_hunter_murderofcrows",
					["id"] = "/cackle",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPb",
					["caption"] = "Snicker",
					["icon"] = "Interface\\Icons\\ability_warlock_impoweredimp",
					["id"] = "/snicker",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAPv",
					["caption"] = "JK",
					["icon"] = "Interface\\Icons\\Spell_Shaman_Hex",
					["id"] = "/jk",
				}, -- [8]
				["name"] = "Laughter",
				["save"] = true,
			},
			["moNegative"] = {
				{
					["sliceToken"] = "ABuekGtRAPee",
					["caption"] = "Sad",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionSad",
					["id"] = "/sad",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPew",
					["caption"] = "Tired",
					["icon"] = "Interface\\Icons\\Ability_Foundryraid_Dormant",
					["id"] = "/tired",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPeq",
					["caption"] = "Mourn",
					["icon"] = "Interface\\Icons\\INV_Misc_Bone_DwarfSkull_01",
					["id"] = "/mourn",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPwM",
					["caption"] = "Whine",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionAfraid",
					["id"] = "/whine",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPwN",
					["caption"] = "Bored",
					["icon"] = "Interface\\Icons\\Ability_Racial_TimeIsMoney",
					["id"] = "/bored",
				}, -- [5]
				["name"] = "Emo: Negative",
				["save"] = true,
			},
			["yFunctions"] = {
				{
					["sliceToken"] = "ABuekGtRAPwP",
					["caption"] = "Belch",
					["icon"] = "Interface\\Icons\\Ability_Mage_Burnout",
					["id"] = "/belch",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPwO",
					["caption"] = "Cough",
					["icon"] = "Interface\\Icons\\Spell_Shadow_PsychicHorrors",
					["id"] = "/cough",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPwI",
					["caption"] = "Yawn",
					["icon"] = "Interface\\Icons\\Ability_Foundryraid_Dormant",
					["id"] = "/yawn",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPw8",
					["caption"] = "Spit",
					["icon"] = "Interface\\Icons\\Spell_Fire_FelRainOfFire",
					["id"] = "/spit",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPwU",
					["caption"] = "Lick",
					["icon"] = "Interface\\Icons\\Ability_Hunter_Pet_Wolf",
					["id"] = "/lick",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPwY",
					["caption"] = "Bite",
					["icon"] = "Interface\\Icons\\Spell_Holy_PainSupression",
					["id"] = "/bite",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPwT",
					["caption"] = "Drool",
					["icon"] = "Interface\\Icons\\Ability_Hunter_BeastTraining",
					["id"] = "/drool",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAPwR",
					["caption"] = "Whistle",
					["icon"] = "Interface\\Icons\\Ability_Hunter_BeastCall",
					["id"] = "/whistle",
				}, -- [8]
				{
					["sliceToken"] = "ABuekGtRAPw7",
					["caption"] = "Nose Pick",
					["icon"] = "Interface\\Icons\\Ability_Creature_Poison_02",
					["id"] = "/nosepick",
				}, -- [9]
				{
					["sliceToken"] = "ABuekGtRAPwE",
					["caption"] = "Sniff",
					["icon"] = "Interface\\Icons\\Ability_Warrior_FuriousResolve",
					["id"] = "/sniff",
				}, -- [10]
				{
					["sliceToken"] = "ABuekGtRAPwW",
					["caption"] = "Eat",
					["icon"] = "Interface\\Icons\\INV_Misc_Fork&Knife",
					["id"] = "/eat",
				}, -- [11]
				{
					["sliceToken"] = "ABuekGtRAPwQ",
					["caption"] = "Drink",
					["icon"] = "Interface\\Icons\\INV_Drink_20",
					["id"] = "/drink",
				}, -- [12]
				{
					["sliceToken"] = "ABuekGtRAPwm",
					["caption"] = "Hungry",
					["icon"] = "Interface\\Icons\\INV_Misc_Basket_01",
					["id"] = "/hungry",
				}, -- [13]
				{
					["sliceToken"] = "ABuekGtRAPwn",
					["caption"] = "Thirsty",
					["icon"] = "Interface\\Icons\\INV_Misc_Beer_09",
					["id"] = "/thirsty",
				}, -- [14]
				{
					["sliceToken"] = "ABuekGtRAPw6",
					["caption"] = "Scratch",
					["icon"] = "Interface\\Icons\\Ability_GhoulFrenzy",
					["id"] = "/scratch",
				}, -- [15]
				{
					["sliceToken"] = "ABuekGtRAPwb",
					["caption"] = "Bleed",
					["icon"] = "Interface\\Icons\\ability_deathwing_bloodcorruption_earth",
					["id"] = "/bleed",
				}, -- [16]
				{
					["sliceToken"] = "ABuekGtRAPwv",
					["caption"] = "Cold",
					["icon"] = "Interface\\Icons\\Spell_Frost_Glacier",
					["id"] = "/cold",
				}, -- [17]
				{
					["sliceToken"] = "ABuekGtRAPwc",
					["caption"] = "Shiver",
					["icon"] = "Interface\\Icons\\Spell_Misc_ConjureManaJewel",
					["id"] = "/shiver",
				}, -- [18]
				{
					["sliceToken"] = "ABuekGtRAPwx",
					["caption"] = "Fart",
					["icon"] = "Interface\\Icons\\Ability_DeathKnight_DeathSiphon2",
					["id"] = "/fart",
				}, -- [19]
				["name"] = "Body Functions",
				["save"] = true,
			},
			["Romantic"] = {
				{
					["sliceToken"] = "ABuekGtRAPeI",
					["caption"] = "Blow Kiss",
					["icon"] = "Interface\\Icons\\Spell_Shadow_SoothingKiss",
					["id"] = "/blow",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPe8",
					["caption"] = "Hug",
					["icon"] = "Interface\\ICONS\\INV_Misc_Bomb_04",
					["id"] = "/hug",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPeU",
					["caption"] = "Flirt",
					["icon"] = "Interface\\Icons\\Spell_Shadow_SummonSuccubus",
					["id"] = "/flirt",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPeY",
					["caption"] = "Tease",
					["icon"] = "Interface\\Icons\\INV_Misc_Head_Gnome_02",
					["id"] = "/tease",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPeT",
					["caption"] = "Moan",
					["icon"] = "Interface\\Icons\\Ability_Priest_HeavanlyVoice",
					["id"] = "/moan",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPeR",
					["caption"] = "Cuddle",
					["icon"] = "Interface\\Icons\\Ability_Hunter_Harass",
					["id"] = "/cuddle",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPe7",
					["caption"] = "Purr",
					["icon"] = "Interface\\Icons\\Spell_Misc_PetHeal",
					["id"] = "/purr",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAPeE",
					["caption"] = "Love",
					["icon"] = "Interface\\Icons\\Ability_Paladin_BeaconsOfLight",
					["id"] = "/love",
				}, -- [8]
				{
					["sliceToken"] = "ABuekGtRAPeW",
					["caption"] = "Sexy",
					["icon"] = "Interface\\Icons\\Spell_Shadow_Possession",
					["id"] = "/sexy",
				}, -- [9]
				{
					["sliceToken"] = "ABuekGtRAPeQ",
					["caption"] = "Shimmy",
					["icon"] = "Interface\\Icons\\Ability_Mage_ColdAsIce",
					["id"] = "/shimmy",
				}, -- [10]
				{
					["sliceToken"] = "ABuekGtRAPem",
					["caption"] = "Massage",
					["icon"] = "Interface\\Icons\\INV_Misc_Gift_02",
					["id"] = "/massage",
				}, -- [11]
				{
					["sliceToken"] = "ABuekGtRAPen",
					["caption"] = "Silly",
					["icon"] = "Interface\\Icons\\Ability_Monk_LeeroftheOx",
					["id"] = "/silly",
				}, -- [12]
				["name"] = "Romantic",
				["save"] = true,
			},
			["Toys"] = {
				{
					"toy", -- [1]
					68806, -- [2]
					["sliceToken"] = "ABuelBTLtNW",
				}, -- [1]
				{
					"toy", -- [1]
					68806, -- [2]
					["sliceToken"] = "ABuelBTLtNQ",
				}, -- [2]
				{
					"toy", -- [1]
					54653, -- [2]
					["sliceToken"] = "ABuelBTLtNm",
				}, -- [3]
				{
					"toy", -- [1]
					53057, -- [2]
					["sliceToken"] = "ABuelBTLtNn",
				}, -- [4]
				{
					"toy", -- [1]
					43499, -- [2]
					["sliceToken"] = "ABuelBTLtN6",
				}, -- [5]
				{
					"toy", -- [1]
					52201, -- [2]
					["sliceToken"] = "ABuelBTLtNb",
				}, -- [6]
				{
					"toy", -- [1]
					134022, -- [2]
					["sliceToken"] = "ABuelBTLtNv",
				}, -- [7]
				{
					"toy", -- [1]
					37254, -- [2]
					["sliceToken"] = "ABuelBTLtNc",
				}, -- [8]
				{
					"toy", -- [1]
					35275, -- [2]
					["sliceToken"] = "ABuelBTLtNx",
				}, -- [9]
				{
					"toy", -- [1]
					71259, -- [2]
					["sliceToken"] = "ABuelBTLtN5",
				}, -- [10]
				{
					"toy", -- [1]
					122117, -- [2]
					["sliceToken"] = "ABuelBTLtNz",
				}, -- [11]
				{
					"toy", -- [1]
					127668, -- [2]
					["sliceToken"] = "ABuelBTLtNl",
				}, -- [12]
				{
					"toy", -- [1]
					104294, -- [2]
					["sliceToken"] = "ABuelBTLtNk",
				}, -- [13]
				{
					"toy", -- [1]
					119215, -- [2]
					["sliceToken"] = "ABuelBTLtNj",
				}, -- [14]
				{
					"toy", -- [1]
					179393, -- [2]
					["sliceToken"] = "ABuelBTLtN4",
				}, -- [15]
				{
					"toy", -- [1]
					66888, -- [2]
					["sliceToken"] = "ABuelBTLtNh",
				}, -- [16]
				{
					"toy", -- [1]
					69775, -- [2]
					["sliceToken"] = "ABuelBTLtNg",
				}, -- [17]
				{
					"toy", -- [1]
					34686, -- [2]
					["sliceToken"] = "ABuelBTLtNf",
				}, -- [18]
				{
					"toy", -- [1]
					128807, -- [2]
					["sliceToken"] = "ABuelBTLtNd",
				}, -- [19]
				{
					"toy", -- [1]
					86589, -- [2]
					["sliceToken"] = "ABuelBTLtN3",
				}, -- [20]
				{
					"toy", -- [1]
					184223, -- [2]
					["sliceToken"] = "ABuelBTLtNs",
				}, -- [21]
				{
					"toy", -- [1]
					166779, -- [2]
					["sliceToken"] = "ABuelBTLtNa",
				}, -- [22]
				{
					"toy", -- [1]
					86568, -- [2]
					["sliceToken"] = "ABuelBTLtNp",
				}, -- [23]
				{
					"toy", -- [1]
					88566, -- [2]
					["sliceToken"] = "ABuelBTLtNo",
				}, -- [24]
				{
					"toy", -- [1]
					1973, -- [2]
					["sliceToken"] = "ABuelBTLtN2",
				}, -- [25]
				{
					"toy", -- [1]
					32782, -- [2]
					["sliceToken"] = "ABuelBTLtNi",
				}, -- [26]
				{
					"toy", -- [1]
					86573, -- [2]
					["sliceToken"] = "ABuelBTLtNu",
				}, -- [27]
				{
					"toy", -- [1]
					109183, -- [2]
					["sliceToken"] = "ABuelBTLtNy",
				}, -- [28]
				{
					"toy", -- [1]
					97919, -- [2]
					["sliceToken"] = "ABuelBTLtNt",
				}, -- [29]
				{
					"toy", -- [1]
					86571, -- [2]
					["sliceToken"] = "ABuelBTLtN1",
				}, -- [30]
				{
					"toy", -- [1]
					116139, -- [2]
					["sliceToken"] = "ABuelBTLtNr",
				}, -- [31]
				{
					"toy", -- [1]
					166790, -- [2]
					["sliceToken"] = "ABuelBTLtNe",
				}, -- [32]
				{
					"toy", -- [1]
					118937, -- [2]
					["sliceToken"] = "ABuelBTLtNwq",
				}, -- [33]
				["name"] = "Toys",
				["save"] = true,
			},
			["xpressions"] = {
				{
					["sliceToken"] = "ABuekGtRAPw5",
					["caption"] = "Smile",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionHappy",
					["id"] = "/smile",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPwz",
					["caption"] = "Frown",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionSad",
					["id"] = "/frown",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPwl",
					["caption"] = "Smirk",
					["icon"] = "INTERFACE\\ICONS\\ability_hunter_camouflage",
					["id"] = "/smirk",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPwk",
					["caption"] = "Grin Wickedly",
					["icon"] = "Interface\\Icons\\Spell_Nature_RemoveDisease",
					["id"] = "/grin",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPwj",
					["caption"] = "Facepalm",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionAfraid",
					["id"] = "/facepalm",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPw4",
					["caption"] = "Eye",
					["icon"] = "Interface\\Icons\\Ability_CheapShot",
					["id"] = "/eye",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPwh",
					["caption"] = "Wink",
					["icon"] = "Interface\\Icons\\INV_Misc_Head_Human_01",
					["id"] = "/wink",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAPwg",
					["caption"] = "Stare",
					["icon"] = "Interface\\Icons\\Ability_Hunter_AspectoftheViper",
					["id"] = "/stare",
				}, -- [8]
				{
					["sliceToken"] = "ABuekGtRAPwf",
					["caption"] = "Gaze",
					["icon"] = "Interface\\Icons\\Ability_EyeOfTheOwl",
					["id"] = "/gaze",
				}, -- [9]
				{
					["sliceToken"] = "ABuekGtRAPwd",
					["caption"] = "Glare",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionAngry",
					["id"] = "/glare",
				}, -- [10]
				{
					["sliceToken"] = "ABuekGtRAPw3",
					["caption"] = "Roll Eyes",
					["icon"] = "Interface\\Icons\\Ability_Rogue_BloodyEye",
					["id"] = "/rolleyes",
				}, -- [11]
				{
					["sliceToken"] = "ABuekGtRAPws",
					["caption"] = "Peer",
					["icon"] = "Interface\\Icons\\Ability_Druid_SupriseAttack",
					["id"] = "/peer",
				}, -- [12]
				{
					["sliceToken"] = "ABuekGtRAPwa",
					["caption"] = "Blink",
					["icon"] = "Interface\\Icons\\Spell_Arcane_Blink",
					["id"] = "/blink",
				}, -- [13]
				{
					["sliceToken"] = "ABuekGtRAPwp",
					["caption"] = "Cry",
					["icon"] = "Interface\\Icons\\Spell_BrokenHeart",
					["id"] = "/cry",
				}, -- [14]
				{
					["sliceToken"] = "ABuekGtRAPwo",
					["caption"] = "Groan",
					["icon"] = "Interface\\Icons\\Ability_Creature_Cursed_05",
					["id"] = "/groan",
				}, -- [15]
				{
					["sliceToken"] = "ABuekGtRAPw2",
					["caption"] = "Sigh",
					["icon"] = "Interface\\Icons\\Ability_Druid_HealingInstincts",
					["id"] = "/sigh",
				}, -- [16]
				{
					["sliceToken"] = "ABuekGtRAPwi",
					["caption"] = "Blush",
					["icon"] = "Interface\\Icons\\Ability_Warrior_CommandingShout",
					["id"] = "/blush",
				}, -- [17]
				{
					["sliceToken"] = "ABuekGtRAPwu",
					["caption"] = "Ponder",
					["icon"] = "Interface\\Icons\\Ability_Hibernation",
					["id"] = "/ponder",
				}, -- [18]
				["name"] = "Facial Expressions",
				["save"] = true,
			},
			["HelloGB"] = {
				{
					["sliceToken"] = "ABuekGtRAPp",
					["caption"] = "Hello",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionHappy",
					["id"] = "/hello",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPo",
					["caption"] = "Greet",
					["icon"] = "Interface\\Icons\\Ability_Priest_HeavanlyVoice",
					["id"] = "/greet",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAP2",
					["caption"] = "Welcome",
					["icon"] = "Interface\\Icons\\INV_Misc_Head_Elf_02",
					["id"] = "/welcome",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPi",
					["caption"] = "Introduce",
					["icon"] = "Interface\\Icons\\Spell_Shaman_BlessingOfTheEternals",
					["id"] = "/introduce",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPu",
					["caption"] = "Hail",
					["icon"] = "Interface\\Icons\\Spell_Holy_FlashHeal",
					["id"] = "/hail",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPy",
					["caption"] = "Salute",
					["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_01",
					["id"] = "/salute",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPt",
					["caption"] = "Bow",
					["icon"] = "Interface\\Icons\\ability_monk_dpsstance",
					["id"] = "/bow",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAP1",
					["caption"] = "Wave",
					["icon"] = "Interface\\Icons\\Spell_Holy_Chastise",
					["id"] = "/wave",
				}, -- [8]
				{
					["sliceToken"] = "ABuekGtRAPr",
					["caption"] = "Curtsey",
					["icon"] = "Interface\\Icons\\INV_Misc_Head_Human_02",
					["id"] = "/curtsey",
				}, -- [9]
				{
					["sliceToken"] = "ABuekGtRAPe",
					["caption"] = "Bye",
					["icon"] = "Interface\\Icons\\Spell_Arcane_PortalDarnassus",
					["id"] = "/bye",
				}, -- [10]
				["name"] = "Hello/GB",
				["save"] = true,
			},
			["Emotes"] = {
				{
					"ring", -- [1]
					"Hello", -- [2]
					["sliceToken"] = "ABuekGtRAP1h",
				}, -- [1]
				{
					"ring", -- [1]
					"HelloGB", -- [2]
					["sliceToken"] = "ABuekGtRAP1g",
				}, -- [2]
				{
					"ring", -- [1]
					"Laughter", -- [2]
					["sliceToken"] = "ABuekGtRAP1f",
				}, -- [3]
				{
					"ring", -- [1]
					"munication2", -- [2]
					["sliceToken"] = "ABuekGtRAP1d",
				}, -- [4]
				{
					"ring", -- [1]
					"xpressions", -- [2]
					["sliceToken"] = "ABuekGtRAP13",
				}, -- [5]
				{
					"ring", -- [1]
					"Emotes", -- [2]
					["sliceToken"] = "ABuekGtRAP1s",
				}, -- [6]
				{
					"ring", -- [1]
					"munication", -- [2]
					["sliceToken"] = "ABuekGtRAP1a",
				}, -- [7]
				{
					"ring", -- [1]
					"TYYWCong", -- [2]
					["sliceToken"] = "ABuekGtRAP1p",
				}, -- [8]
				{
					"ring", -- [1]
					"ttleTaunts", -- [2]
					["sliceToken"] = "ABuekGtRAP1o",
				}, -- [9]
				{
					"ring", -- [1]
					"yFunctions", -- [2]
					["sliceToken"] = "ABuekGtRAP12",
				}, -- [10]
				{
					"ring", -- [1]
					"EmoAngry", -- [2]
					["sliceToken"] = "ABuekGtRAP1i",
				}, -- [11]
				{
					"ring", -- [1]
					"moPositive", -- [2]
					["sliceToken"] = "ABuekGtRAP1u",
				}, -- [12]
				{
					"ring", -- [1]
					"Emotions", -- [2]
					["sliceToken"] = "ABuekGtRAP1y",
				}, -- [13]
				{
					"ring", -- [1]
					"Romantic", -- [2]
					["sliceToken"] = "ABuekGtRAP1t",
				}, -- [14]
				["name"] = "Emotes",
				["save"] = true,
			},
			["Macros"] = {
				{
					"macro", -- [1]
					"SoundNorm", -- [2]
					["sliceToken"] = "ABuehyJB065",
					["c"] = "95f09c",
				}, -- [1]
				{
					["sliceToken"] = "ABuehyJB06z",
					["c"] = "f0cac6",
					["caption"] = "20y",
					["id"] = "/run SetCVar(\"nameplateMaxDistance\", \"20\")\n",
				}, -- [2]
				{
					["sliceToken"] = "ABuehyJB06P",
					["c"] = "ff513e",
					["caption"] = "40y",
					["id"] = "/run SetCVar(\"nameplateMaxDistance\", \"40\")",
				}, -- [3]
				{
					["c"] = "ff0b00",
					["id"] = "/run SetCVar(\"nameplateMaxDistance\", \"60\")",
					["fastClick"] = true,
					["sliceToken"] = "ABuehyJB06O",
					["caption"] = "60y",
				}, -- [4]
				["name"] = "Macros",
				["save"] = true,
			},
			["Hello"] = {
				{
					["sliceToken"] = "ABuek4NgCIj",
					["caption"] = "Belch",
					["icon"] = "Interface\\Icons\\Ability_Mage_Burnout",
					["id"] = "/belch",
				}, -- [1]
				{
					["sliceToken"] = "ABuek4NgCI4",
					["caption"] = "Cough",
					["icon"] = "Interface\\Icons\\Spell_Shadow_PsychicHorrors",
					["id"] = "/cough",
				}, -- [2]
				{
					["sliceToken"] = "ABuek4NgCIh",
					["caption"] = "Yawn",
					["icon"] = "Interface\\Icons\\Ability_Foundryraid_Dormant",
					["id"] = "/yawn",
				}, -- [3]
				{
					["sliceToken"] = "ABuek4NgCIg",
					["caption"] = "Spit",
					["icon"] = "Interface\\Icons\\Spell_Fire_FelRainOfFire",
					["id"] = "/spit",
				}, -- [4]
				{
					["sliceToken"] = "ABuek4NgCIf",
					["caption"] = "Lick",
					["icon"] = "Interface\\Icons\\Ability_Hunter_Pet_Wolf",
					["id"] = "/lick",
				}, -- [5]
				{
					["sliceToken"] = "ABuek4NgCId",
					["caption"] = "Bite",
					["icon"] = "Interface\\Icons\\Spell_Holy_PainSupression",
					["id"] = "/bite",
				}, -- [6]
				{
					["sliceToken"] = "ABuek4NgCI3",
					["caption"] = "Drool",
					["icon"] = "Interface\\Icons\\Ability_Hunter_BeastTraining",
					["id"] = "/drool",
				}, -- [7]
				{
					["sliceToken"] = "ABuek4NgCIs",
					["caption"] = "Whistle",
					["icon"] = "Interface\\Icons\\Ability_Hunter_BeastCall",
					["id"] = "/whistle",
				}, -- [8]
				{
					["sliceToken"] = "ABuek4NgCIa",
					["caption"] = "Nose Pick",
					["icon"] = "Interface\\Icons\\Ability_Creature_Poison_02",
					["id"] = "/nosepick",
				}, -- [9]
				{
					["sliceToken"] = "ABuek4NgCIp",
					["caption"] = "Sniff",
					["icon"] = "Interface\\Icons\\Ability_Warrior_FuriousResolve",
					["id"] = "/sniff",
				}, -- [10]
				{
					["sliceToken"] = "ABuek4NgCIo",
					["caption"] = "Eat",
					["icon"] = "Interface\\Icons\\INV_Misc_Fork&Knife",
					["id"] = "/eat",
				}, -- [11]
				{
					["sliceToken"] = "ABuek4NgCI2",
					["caption"] = "Drink",
					["icon"] = "Interface\\Icons\\INV_Drink_20",
					["id"] = "/drink",
				}, -- [12]
				{
					["sliceToken"] = "ABuek4NgCIi",
					["caption"] = "Hungry",
					["icon"] = "Interface\\Icons\\INV_Misc_Basket_01",
					["id"] = "/hungry",
				}, -- [13]
				{
					["sliceToken"] = "ABuek4NgCIu",
					["caption"] = "Thirsty",
					["icon"] = "Interface\\Icons\\INV_Misc_Beer_09",
					["id"] = "/thirsty",
				}, -- [14]
				{
					["sliceToken"] = "ABuek4NgCIy",
					["caption"] = "Scratch",
					["icon"] = "Interface\\Icons\\Ability_GhoulFrenzy",
					["id"] = "/scratch",
				}, -- [15]
				{
					["sliceToken"] = "ABuek4NgCIt",
					["caption"] = "Bleed",
					["icon"] = "Interface\\Icons\\ability_deathwing_bloodcorruption_earth",
					["id"] = "/bleed",
				}, -- [16]
				{
					["sliceToken"] = "ABuek4NgCI1",
					["caption"] = "Cold",
					["icon"] = "Interface\\Icons\\Spell_Frost_Glacier",
					["id"] = "/cold",
				}, -- [17]
				{
					["sliceToken"] = "ABuek4NgCIr",
					["caption"] = "Shiver",
					["icon"] = "Interface\\Icons\\Spell_Misc_ConjureManaJewel",
					["id"] = "/shiver",
				}, -- [18]
				{
					["sliceToken"] = "ABuek4NgCIe",
					["caption"] = "Fart",
					["icon"] = "Interface\\Icons\\Ability_DeathKnight_DeathSiphon2",
					["id"] = "/fart",
				}, -- [19]
				["name"] = "Hello",
				["save"] = true,
			},
			["ttleTaunts"] = {
				{
					["sliceToken"] = "ABuekGtRAPwy",
					["caption"] = "Roar",
					["icon"] = "Interface\\Icons\\Ability_Druid_ChallangingRoar",
					["id"] = "/roar",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPwt",
					["caption"] = "Growl",
					["icon"] = "Interface\\Icons\\Ability_Druid_FerociousBite",
					["id"] = "/growl",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPw1",
					["caption"] = "Bark",
					["icon"] = "Interface\\Icons\\Ability_Druid_PrimalTenacity",
					["id"] = "/bark",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPwr",
					["caption"] = "Snarl",
					["icon"] = "Interface\\Icons\\Ability_Druid_Lacerate",
					["id"] = "/snarl",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPwe",
					["caption"] = "Brandish",
					["icon"] = "Interface\\Icons\\Ability_Warrior_Warbringer",
					["id"] = "/brandish",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPww",
					["caption"] = "Crack Knuckles",
					["icon"] = "Interface\\Icons\\Ability_Warrior_SecondWind",
					["id"] = "/crack",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPwq",
					["caption"] = "Rude",
					["icon"] = "Interface\\Icons\\Ability_Creature_Poison_05",
					["id"] = "/rude",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAPM",
					["caption"] = "Moon",
					["icon"] = "Interface\\Icons\\Spell_Holy_ElunesGrace",
					["id"] = "/moon",
				}, -- [8]
				{
					["sliceToken"] = "ABuekGtRAPN",
					["caption"] = "Shake Rear",
					["icon"] = "Interface\\Icons\\Spell_Nature_HeavyPolymorph1",
					["id"] = "/rear",
				}, -- [9]
				{
					["sliceToken"] = "ABuekGtRAPB",
					["caption"] = "Chicken",
					["icon"] = "Interface\\Icons\\Spell_Magic_PolymorphChicken",
					["id"] = "/chicken",
				}, -- [10]
				{
					["sliceToken"] = "ABuekGtRAP/",
					["caption"] = "Insult",
					["icon"] = "Interface\\Icons\\Ability_Warrior_Revenge",
					["id"] = "/insult",
				}, -- [11]
				{
					["sliceToken"] = "ABuekGtRAPV",
					["caption"] = "Doom",
					["icon"] = "Interface\\Icons\\Spell_Deathknight_BloodPresence",
					["id"] = "/doom",
				}, -- [12]
				{
					["sliceToken"] = "ABuekGtRAPC",
					["caption"] = "Golf Clap",
					["icon"] = "Interface\\Icons\\Spell_Holy_SealOfSalvation",
					["id"] = "/golfclap",
				}, -- [13]
				{
					["sliceToken"] = "ABuekGtRAPX",
					["caption"] = "Mock",
					["icon"] = "Interface\\Icons\\Ability_Rogue_Disguise",
					["id"] = "/mock",
				}, -- [14]
				{
					["sliceToken"] = "ABuekGtRAPZ",
					["caption"] = "Pat",
					["icon"] = "Interface\\Icons\\Spell_Shadow_FelMending",
					["id"] = "/pat",
				}, -- [15]
				{
					["sliceToken"] = "ABuekGtRAP=",
					["caption"] = "Taunt",
					["icon"] = "Interface\\Icons\\Spell_Nature_UnyeildingStamina",
					["id"] = "/taunt",
				}, -- [16]
				{
					["sliceToken"] = "ABuekGtRAPL",
					["caption"] = "Smell",
					["icon"] = "Interface\\Icons\\Spell_Warlock_HarvestofLife",
					["id"] = "/smell",
				}, -- [17]
				{
					["sliceToken"] = "ABuekGtRAPK",
					["caption"] = "Violin",
					["icon"] = "Interface\\Icons\\Ability_Paladin_BeaconOfInsight",
					["id"] = "/violin",
				}, -- [18]
				{
					["sliceToken"] = "ABuekGtRAPJ",
					["caption"] = "Pest",
					["icon"] = "Interface\\Icons\\Spell_Holy_Dizzy",
					["id"] = "/pest",
				}, -- [19]
				["name"] = "Battle Taunts",
				["save"] = true,
			},
			["Food"] = {
				{
					"item", -- [1]
					172069, -- [2]
					["sliceToken"] = "ABuekGtRAP1k",
				}, -- [1]
				{
					"item", -- [1]
					172051, -- [2]
					["sliceToken"] = "ABuekGtRAP1O",
				}, -- [2]
				{
					"item", -- [1]
					172045, -- [2]
					["sliceToken"] = "ABuekGtRAP1I",
				}, -- [3]
				{
					"item", -- [1]
					172049, -- [2]
					["sliceToken"] = "ABuekGtRAP18",
				}, -- [4]
				{
					"item", -- [1]
					172041, -- [2]
					["sliceToken"] = "ABuekGtRAP1U",
				}, -- [5]
				{
					"item", -- [1]
					172062, -- [2]
					["sliceToken"] = "ABuekGtRAP1Y",
				}, -- [6]
				{
					"item", -- [1]
					172061, -- [2]
					["sliceToken"] = "ABuekGtRAP1T",
				}, -- [7]
				["name"] = "Food",
				["save"] = true,
			},
			["Viks"] = {
				{
					"mount", -- [1]
					460, -- [2]
					["sliceToken"] = "ABuehyd=j6o",
				}, -- [1]
				{
					"ring", -- [1]
					"DKCombat", -- [2]
					["sliceToken"] = "ABuehyd=j6f",
				}, -- [2]
				{
					"ring", -- [1]
					"Travel", -- [2]
					["sliceToken"] = "ABuehyJB06e",
				}, -- [3]
				{
					"ring", -- [1]
					"Engeneer", -- [2]
					["sliceToken"] = "ABuehyJB06S",
				}, -- [4]
				{
					"ring", -- [1]
					"Mounts", -- [2]
					["sliceToken"] = "ABuejX/ZeFz",
				}, -- [5]
				{
					"ring", -- [1]
					"Buffs", -- [2]
					["sliceToken"] = "ABuek7zNjkd",
				}, -- [6]
				{
					"ring", -- [1]
					"Food", -- [2]
					["sliceToken"] = "ABuekGtRAP1P",
				}, -- [7]
				{
					"ring", -- [1]
					"Toys", -- [2]
					["sliceToken"] = "ABuelBTLtNE",
				}, -- [8]
				{
					"ring", -- [1]
					"Misc", -- [2]
					["sliceToken"] = "ABuezqzGGSt",
				}, -- [9]
				["name"] = "Viks",
				["save"] = true,
			},
			["TYYWCong"] = {
				{
					["sliceToken"] = "ABuekGtRAPI",
					["caption"] = "Thanks",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionHappy",
					["id"] = "/thanks\n",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAP8",
					["caption"] = "You're Welcome",
					["icon"] = "Interface\\Icons\\Spell_Holy_SpellWarding",
					["id"] = "/yw",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPU",
					["caption"] = "Congrats",
					["icon"] = "Interface\\Icons\\Spell_Paladin_Inquisition",
					["id"] = "/congrats",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPY",
					["caption"] = "High Five",
					["icon"] = "Interface\\Icons\\Spell_Holy_PrayerOfMendingtga",
					["id"] = "/highfive",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPT",
					["caption"] = "Cheer",
					["icon"] = "Interface\\Icons\\Spell_DeathKnight_IceBoundFortitude",
					["id"] = "/cheer",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPR",
					["caption"] = "Applaud",
					["icon"] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSalvation",
					["id"] = "/applaud",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAP7",
					["caption"] = "Commend",
					["icon"] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofKings",
					["id"] = "/commend",
				}, -- [7]
				["name"] = "TY/YW/Cong",
				["save"] = true,
			},
			["BuffHunter"] = {
				["save"] = true,
				["limit"] = "HUNTER",
				["name"] = "BuffHunter",
			},
			["moPositive"] = {
				{
					["sliceToken"] = "ABuekGtRAPe2",
					["caption"] = "Happy",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionHappy",
					["id"] = "/happy",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPei",
					["caption"] = "Amaze",
					["icon"] = "Interface\\Icons\\Spell_Holy_SpiritualGuidence",
					["id"] = "/amaze",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPeu",
					["caption"] = "Surprised",
					["icon"] = "Interface\\Icons\\Spell_Shadow_SpectralSight",
					["id"] = "/surprised",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPey",
					["caption"] = "Calm",
					["icon"] = "Interface\\Icons\\Spell_Nature_Polymorph",
					["id"] = "/calm",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPet",
					["caption"] = "Comfort",
					["icon"] = "Interface\\Icons\\Spell_Shaman_GiftEarthmother",
					["id"] = "/comfort",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPe1",
					["caption"] = "Soothe",
					["icon"] = "Interface\\Icons\\INV_Holiday_BrewfestBuff_01",
					["id"] = "/soothe",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPer",
					["caption"] = "Glad",
					["icon"] = "Interface\\Icons\\Spell_Holy_Heroism",
					["id"] = "/glad",
				}, -- [7]
				["name"] = "Emo: Positive",
				["save"] = true,
			},
			["Fishing"] = {
				{
					"item", -- [1]
					133755, -- [2]
					["forceShow"] = true,
					["c"] = "ffffff",
					["sliceToken"] = "ABuelBTLtN/",
				}, -- [1]
				{
					"ring", -- [1]
					"ingBobbers", -- [2]
					["sliceToken"] = "ABuelBTLtNV",
					["c"] = "ffffff",
					["icon"] = 236576,
				}, -- [2]
				{
					"toy", -- [1]
					152556, -- [2]
					["sliceToken"] = "ABuelBTLtNC",
					["c"] = "ffffff",
				}, -- [3]
				{
					"toy", -- [1]
					85500, -- [2]
					["sliceToken"] = "ABuelBTLtNX",
					["c"] = "ffffff",
					["icon"] = 774121,
				}, -- [4]
				{
					"item", -- [1]
					167698, -- [2]
					["sliceToken"] = "ABuelBTLtNZ",
					["c"] = "ffffff",
				}, -- [5]
				{
					"toy", -- [1]
					168016, -- [2]
					["sliceToken"] = "ABuelBTLtN=",
					["c"] = "ffffff",
				}, -- [6]
				["quarantineBind"] = "F5",
				["name"] = "Fishing",
				["save"] = true,
			},
			["Emotions"] = {
				{
					"ring", -- [1]
					"moPositive", -- [2]
					["sliceToken"] = "ABuekGtRAPek",
				}, -- [1]
				{
					"ring", -- [1]
					"moNegative", -- [2]
					["sliceToken"] = "ABuekGtRAPej",
				}, -- [2]
				{
					"ring", -- [1]
					"EmoAngry", -- [2]
					["sliceToken"] = "ABuekGtRAPe4",
				}, -- [3]
				{
					"ring", -- [1]
					"EmoUnsure", -- [2]
					["sliceToken"] = "ABuekGtRAPeh",
				}, -- [4]
				["name"] = "Emotions",
				["save"] = true,
			},
			["munication2"] = {
				{
					["sliceToken"] = "ABuekGtRAPH",
					["caption"] = "Charge!",
					["icon"] = "Interface\\Icons\\Ability_Hunter_KillCommand",
					["id"] = "/charge",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAP0",
					["caption"] = "Open Fire!",
					["icon"] = "Interface\\Icons\\Ability_Hunter_RapidRegeneration",
					["id"] = "/openfire",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPG",
					["caption"] = "Attack Target",
					["icon"] = "Interface\\Icons\\Ability_Hunter_SniperShot",
					["id"] = "/attacktarget",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPF",
					["caption"] = "Incoming",
					["icon"] = "Interface\\Icons\\Spell_Shadow_Shadesofdarkness",
					["id"] = "/incoming",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPD",
					["caption"] = "Duck",
					["icon"] = "Interface\\Icons\\Ability_Whirlwind",
					["id"] = "/duck",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPS",
					["caption"] = "Flee",
					["icon"] = "Interface\\Icons\\ABILITY_HUNTER_POSTHASTE",
					["id"] = "/flee",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAP9",
					["caption"] = "Heal Me!",
					["icon"] = "Interface\\Icons\\Ability_Hunter_OneWithNature",
					["id"] = "/healme",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAPA",
					["caption"] = "OOM",
					["icon"] = "Interface\\Icons\\Spell_Holy_MagicalSentry",
					["id"] = "/oom",
				}, -- [8]
				{
					["sliceToken"] = "ABuekGtRAPP",
					["caption"] = "Help Me!",
					["icon"] = "Interface\\Icons\\Ability_Mage_TormentOfTheWeak",
					["id"] = "/helpme",
				}, -- [9]
				{
					["sliceToken"] = "ABuekGtRAPO",
					["caption"] = "Follow Me!",
					["icon"] = "Interface\\Icons\\Ability_Tracking",
					["id"] = "/followme",
				}, -- [10]
				["name"] = "Battle Communication",
				["save"] = true,
			},
			["OPieFlagStore"] = {
				["StoreVersion"] = 2,
			},
			["Mounts"] = {
				{
					"mount", -- [1]
					449, -- [2]
					["sliceToken"] = "ABuejX/ZeFl",
				}, -- [1]
				{
					"mount", -- [1]
					416, -- [2]
					["sliceToken"] = "ABuejX/ZeFk",
				}, -- [2]
				{
					"mount", -- [1]
					455, -- [2]
					["sliceToken"] = "ABuejX/ZeFj",
				}, -- [3]
				{
					"mount", -- [1]
					522, -- [2]
					["sliceToken"] = "ABuejX/ZeF4",
				}, -- [4]
				{
					"mount", -- [1]
					1025, -- [2]
					["sliceToken"] = "ABuejX/ZeFh",
				}, -- [5]
				{
					"mount", -- [1]
					382, -- [2]
					["sliceToken"] = "ABuejX/ZeFg",
				}, -- [6]
				{
					"mount", -- [1]
					751, -- [2]
					["sliceToken"] = "ABuej/0MXFe",
				}, -- [7]
				["name"] = "Mounts",
				["save"] = true,
			},
			["Consumable"] = {
				{
					"item", -- [1]
					171285, -- [2]
					["sliceToken"] = "ABuelBTLtNK",
				}, -- [1]
				{
					"item", -- [1]
					171286, -- [2]
					["sliceToken"] = "ABuelBTLtNJ",
				}, -- [2]
				{
					"item", -- [1]
					171437, -- [2]
					["sliceToken"] = "ABuelBTLtNH",
				}, -- [3]
				{
					"item", -- [1]
					171439, -- [2]
					["sliceToken"] = "ABuelBTLtN0",
				}, -- [4]
				{
					"item", -- [1]
					171276, -- [2]
					["sliceToken"] = "ABuelBTLtNG",
				}, -- [5]
				{
					"item", -- [1]
					171278, -- [2]
					["sliceToken"] = "ABuelBTLtNF",
				}, -- [6]
				{
					["sliceToken"] = "ABuelBTLtND",
					["id"] = "#showtooltip Eternal Flask\n/use Eternal Flask",
					["icon"] = 3566839,
					["show"] = "[have:171280]",
				}, -- [7]
				{
					["sliceToken"] = "ABuelBTLtNS",
					["id"] = "#icon inv_leatherworking_armorpatch_heavy\n/use Heavy Desolate Armor Kit\n#skip\n/use 5",
					["icon"] = 3528447,
					["show"] = "[have:172347]",
				}, -- [8]
				{
					"item", -- [1]
					181468, -- [2]
					["sliceToken"] = "ABuelBTLtN9",
				}, -- [9]
				{
					"item", -- [1]
					172051, -- [2]
					["sliceToken"] = "ABuelBTLtNA",
				}, -- [10]
				{
					"item", -- [1]
					172045, -- [2]
					["sliceToken"] = "ABuelBTLtNP",
				}, -- [11]
				{
					"item", -- [1]
					172049, -- [2]
					["sliceToken"] = "ABuelBTLtNO",
				}, -- [12]
				{
					"item", -- [1]
					172041, -- [2]
					["sliceToken"] = "ABuelBTLtNI",
				}, -- [13]
				{
					"item", -- [1]
					173049, -- [2]
					["sliceToken"] = "ABuelBTLtN8",
				}, -- [14]
				{
					"item", -- [1]
					173859, -- [2]
					["sliceToken"] = "ABuelBTLtNU",
				}, -- [15]
				{
					"item", -- [1]
					113509, -- [2]
					["sliceToken"] = "ABuelBTLtNY",
				}, -- [16]
				{
					"item", -- [1]
					132514, -- [2]
					["sliceToken"] = "ABuelBTLtNT",
				}, -- [17]
				{
					"item", -- [1]
					172042, -- [2]
					["sliceToken"] = "ABuelBTLtNR",
				}, -- [18]
				{
					"item", -- [1]
					172043, -- [2]
					["sliceToken"] = "ABuelBTLtN7",
				}, -- [19]
				["name"] = "Consumable",
				["save"] = true,
			},
			["Movement"] = {
				{
					["sliceToken"] = "ABuekGtRAPwC",
					["caption"] = "Dance",
					["icon"] = "Interface\\Icons\\Ability_TitanKeeper_Phasing",
					["id"] = "/dance",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPwX",
					["caption"] = "Bounce",
					["icon"] = "Interface\\Icons\\Spell_Paladin_Clarityofpurpose",
					["id"] = "/bounce",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPwZ",
					["caption"] = "Fidget",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionAfraid",
					["id"] = "/fidget",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPw=",
					["caption"] = "Flex",
					["icon"] = "Interface\\Icons\\Spell_Shaman_AncestralAwakening",
					["id"] = "/flex",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPwL",
					["caption"] = "Flop",
					["icon"] = "Interface\\Icons\\INV_Misc_Fish_27",
					["id"] = "/flop",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPwK",
					["caption"] = "Sleep",
					["icon"] = "Interface\\Icons\\Ability_Foundryraid_Dormant",
					["id"] = "/sleep",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPwJ",
					["caption"] = "Train",
					["icon"] = "Interface\\Icons\\Ability_IronMaidens_IronWill",
					["id"] = "/train",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAPwH",
					["caption"] = "Read",
					["icon"] = "Interface\\Icons\\INV_Misc_Book_11",
					["id"] = "/read",
				}, -- [8]
				{
					["sliceToken"] = "ABuekGtRAPw0",
					["caption"] = "Bonk",
					["icon"] = "Interface\\Icons\\Spell_Holy_FistOfJustice",
					["id"] = "/bonk",
				}, -- [9]
				{
					["sliceToken"] = "ABuekGtRAPwG",
					["caption"] = "Pounce",
					["icon"] = "Interface\\Icons\\Ability_Mount_WhiteTiger",
					["id"] = "/pounce",
				}, -- [10]
				{
					["sliceToken"] = "ABuekGtRAPwF",
					["caption"] = "Punch",
					["icon"] = "Interface\\Icons\\Ability_Warrior_SecondWind",
					["id"] = "/punch",
				}, -- [11]
				{
					["sliceToken"] = "ABuekGtRAPwD",
					["caption"] = "Poke",
					["icon"] = "Interface\\Icons\\Spell_Holy_Stoicism",
					["id"] = "/poke",
				}, -- [12]
				{
					["sliceToken"] = "ABuekGtRAPwS",
					["caption"] = "Slap",
					["icon"] = "Interface\\Icons\\ability_deathknight_desolation",
					["id"] = "/slap",
				}, -- [13]
				{
					["sliceToken"] = "ABuekGtRAPw9",
					["caption"] = "Tickle",
					["icon"] = "Interface\\Icons\\INV_Feather_06",
					["id"] = "/tickle",
				}, -- [14]
				{
					["sliceToken"] = "ABuekGtRAPwA",
					["caption"] = "Work",
					["icon"] = "Interface\\Icons\\INV_Misc_Gear_05",
					["id"] = "/work",
				}, -- [15]
				["name"] = "Movement",
				["save"] = true,
			},
			["Engeneer"] = {
				{
					"toy", -- [1]
					168808, -- [2]
					["sliceToken"] = "ABuehyJB06g",
				}, -- [1]
				{
					"toy", -- [1]
					168807, -- [2]
					["sliceToken"] = "ABuehyJB06f",
				}, -- [2]
				{
					"toy", -- [1]
					112059, -- [2]
					["sliceToken"] = "ABuehyJB06d",
				}, -- [3]
				{
					"toy", -- [1]
					48933, -- [2]
					["sliceToken"] = "ABuehyJB063",
				}, -- [4]
				{
					"toy", -- [1]
					40768, -- [2]
					["sliceToken"] = "ABuehyJB06s",
				}, -- [5]
				{
					"toy", -- [1]
					87215, -- [2]
					["sliceToken"] = "ABuejC0mw/e",
				}, -- [6]
				{
					"item", -- [1]
					87216, -- [2]
					["sliceToken"] = "ABuekGtRAP14",
				}, -- [7]
				{
					"toy", -- [1]
					172924, -- [2]
					["sliceToken"] = "ABuekNAmcse",
				}, -- [8]
				{
					"item", -- [1]
					49040, -- [2]
					["sliceToken"] = "ABuelBFrlje",
				}, -- [9]
				["name"] = "Engeneer",
				["save"] = true,
			},
			["bservience"] = {
				{
					["sliceToken"] = "ABuekGtRAPe6",
					["caption"] = "Surrender",
					["icon"] = "Interface\\Icons\\ABILITY_MAGE_INVISIBILITY",
					["id"] = "/surrender",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPeb",
					["caption"] = "Grovel",
					["icon"] = "Interface\\Icons\\Spell_Shadow_PainAndSuffering",
					["id"] = "/grovel",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPev",
					["caption"] = "Plead",
					["icon"] = "Interface\\Icons\\Ability_Hunter_BeastSoothe",
					["id"] = "/plead",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPec",
					["caption"] = "Beg",
					["icon"] = "Interface\\Icons\\inv_misc_coin_01",
					["id"] = "/beg",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPex",
					["caption"] = "Peon",
					["icon"] = "Interface\\Icons\\INV_Misc_Head_Centaur_01",
					["id"] = "/peon",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPe5",
					["caption"] = "Kneel",
					["icon"] = "Interface\\Icons\\Ability_Druid_NaturalPerfection",
					["id"] = "/kneel",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPez",
					["caption"] = "Praise",
					["icon"] = "Interface\\Icons\\Spell_Holy_SearingLightPriest",
					["id"] = "/praise",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAPel",
					["caption"] = "Pray",
					["icon"] = "Interface\\Icons\\Spell_Holy_HolyGuidance",
					["id"] = "/pray",
				}, -- [8]
				["name"] = "Subservience",
				["save"] = true,
			},
			["EmoAngry"] = {
				{
					["sliceToken"] = "ABuekGtRAPwB",
					["caption"] = "Angry",
					["icon"] = "Interface\\Icons\\Spell_Misc_EmotionAngry",
					["id"] = "/angry",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPw/",
					["caption"] = "Snub",
					["icon"] = "Interface\\Icons\\INV_Misc_Head_Elf_02",
					["id"] = "/snub",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPwV",
					["caption"] = "Gloat",
					["icon"] = "Interface\\Icons\\Spell_Fire_TotemOfWrath",
					["id"] = "/gloat",
				}, -- [3]
				["name"] = "Emo: Angry",
				["save"] = true,
			},
			["Travel"] = {
				{
					"item", -- [1]
					6948, -- [2]
					["sliceToken"] = "ABuehyd=j6c",
				}, -- [1]
				{
					"item", -- [1]
					140192, -- [2]
					["sliceToken"] = "ABuehyd=j6x",
				}, -- [2]
				{
					"item", -- [1]
					110560, -- [2]
					["sliceToken"] = "ABuehyd=j65",
				}, -- [3]
				{
					"item", -- [1]
					141605, -- [2]
					["sliceToken"] = "ABuehyd=j6z",
				}, -- [4]
				["name"] = "Travel",
				["save"] = true,
			},
			["EmoUnsure"] = {
				{
					["sliceToken"] = "ABuekGtRAPeg",
					["caption"] = "Cower",
					["icon"] = "Interface\\Icons\\Spell_Shadow_Skull",
					["id"] = "/cower",
				}, -- [1]
				{
					["sliceToken"] = "ABuekGtRAPef",
					["caption"] = "Scared",
					["icon"] = "Interface\\Icons\\Spell_Shadow_DeathCoil",
					["id"] = "/scared",
				}, -- [2]
				{
					["sliceToken"] = "ABuekGtRAPed",
					["caption"] = "Panic",
					["icon"] = "Interface\\Icons\\Ability_Warrior_Rampage",
					["id"] = "/panic",
				}, -- [3]
				{
					["sliceToken"] = "ABuekGtRAPe3",
					["caption"] = "Bashful",
					["icon"] = "Interface\\Icons\\Ability_Hunter_Pet_Turtle",
					["id"] = "/bashful",
				}, -- [4]
				{
					["sliceToken"] = "ABuekGtRAPes",
					["caption"] = "Shy",
					["icon"] = "Interface\\Icons\\Ability_Druid_PredatoryInstincts",
					["id"] = "/shy",
				}, -- [5]
				{
					["sliceToken"] = "ABuekGtRAPea",
					["caption"] = "Curious",
					["icon"] = "Interface\\Icons\\Ability_Fixated_State_Red",
					["id"] = "/curious",
				}, -- [6]
				{
					["sliceToken"] = "ABuekGtRAPep",
					["id"] = "/boggle",
					["caption"] = "Boggle",
				}, -- [7]
				{
					["sliceToken"] = "ABuekGtRAPeo",
					["caption"] = "Regret",
					["icon"] = "Interface\\Icons\\INV_Mask_01",
					["id"] = "/regret",
				}, -- [8]
				["name"] = "Emo: Unsure",
				["save"] = true,
			},
		},
	},
	["_GameLocale"] = "enUS",
}
OPie_SavedData = nil

end
-- Create installui

local OnLogon = CreateFrame("Frame")
OnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
OnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	local CD = GetCVar("countdownForCooldowns")
	if CD == "1" then SetCVar("countdownForCooldowns", "0") end
end)

local v = CreateFrame("Button", "ViksUIVersionFrame", UIParent)
v:SetSize(300, 66)
v:SetPoint("CENTER")
v:SetTemplate("Transparent")
v.text = v:FontString("text", C["media"].normal_font, 20)
v.text:SetPoint("CENTER")
v.text:SetText("|cffC41F3BViksUI|r ".. T.version)
v.text2 = v:FontString("text2", C["media"].normal_font, 11)
v.text2:SetPoint("BOTTOM", 0, 2)
v.text2:SetText("by |cffC41F3B - Vik|r")
v:SetScript("OnClick", function() v:Hide() end)
v:Hide()

local vicon = CreateFrame("Frame", "ViksUIVersion", v)
vicon:SetSize(66, 66)
vicon:SetTemplate()
vicon:SetPoint("RIGHT", v, "LEFT", -2, 0)
vicon:SetFrameStrata("HIGH")

vicon.bg = vicon:CreateTexture(nil, "ARTWORK")
vicon.bg:SetPoint("TOPLEFT", 2, -2)
vicon.bg:SetPoint("BOTTOMRIGHT", -2, 2)
vicon.bg:SetTexture(C["media"].texture)

local f = CreateFrame("Frame", "ViksUIInstallFrame", UIParent)
f:SetSize(500, 300)
f:SetPoint("CENTER")
f:SetTemplate("Transparent")
f:SetFrameStrata("HIGH")
f:Hide()

f.bg = f:CreateTexture(nil, "BACKGROUND")
f.bg:SetPoint("CENTER", f, "CENTER", 0, 0)
f.bg:SetTexture([[Interface\AddOns\ViksUI\Media\Textures\logosk]])
f.bg:SetAlpha(0.2)

local viconl = CreateFrame("Frame", "ViksUIVersion", f)
viconl:SetTemplate()
viconl:SetSize(30, 30)
viconl:SetPoint("BOTTOMRIGHT", f, "TOPRIGHT", 0, 2)
viconl:SetFrameStrata("HIGH")

viconl.bg = viconl:CreateTexture(nil, "ARTWORK")
viconl.bg:SetPoint("TOPLEFT", 2, -2)
viconl.bg:SetPoint("BOTTOMRIGHT", -2, 2)
viconl.bg:SetTexture([[Interface\AddOns\ViksUI\Media\Textures\viksicon]])

local title = CreateFrame("Frame", "ViksUIInstallTitle", f)
title:SetTemplate("Transparent")
title:SetSize(f:GetWidth() - 32, 30)
title:SetPoint("BOTTOMLEFT", f, "TOPLEFT", 0, 2)
title:SetFrameStrata("HIGH")

local logo = CreateFrame("Frame", "ViksLogo", f)
logo:SetSize(256, 128)
logo:SetPoint("BOTTOM", title, "BOTTOM", 0, -20)
logo:SetFrameStrata("HIGH")
logo:SetFrameLevel(6)

logo.bg = logo:CreateTexture(nil, "ARTWORK")
logo.bg:SetPoint("TOPLEFT", 2, -2)
logo.bg:SetPoint("BOTTOMRIGHT", -2, 2)
logo.bg:SetTexture([[Interface\AddOns\ViksUI\Media\Textures\logo]])

local name = title:CreateFontString(nil, "OVERLAY")
name:SetFont(C["media"].normal_font, 16)
name:SetPoint("LEFT", title, 7, -1)
name:SetText(T.version)

local sb = CreateFrame("StatusBar", nil, f)
sb:SetStatusBarTexture("\\Interface\\AddOns\\ViksUI\\Media\\Textures\\normTex.tga")
sb:SetPoint("BOTTOM", f, "BOTTOM", 0, 35)
sb:SetHeight(15)
sb:SetWidth(f:GetWidth() - 44)
sb:SetFrameStrata("HIGH")
sb:SetFrameLevel(6)
sb:Hide()

local sbd = CreateFrame("Frame", nil, sb)
sbd:SetTemplate("Default")
sbd:SetPoint("TOPLEFT", sb, -2, 2)
sbd:SetPoint("BOTTOMRIGHT", sb, 2, -2)
sbd:SetFrameStrata("HIGH")
sbd:SetFrameLevel(5)

local header = f:CreateFontString(nil, "OVERLAY")
header:SetFont(C["media"].normal_font, 16, "THINOUTLINE")
header:SetPoint("TOP", f, "TOP", 0, -20)

local text1 = f:CreateFontString(nil, "OVERLAY")
text1:SetJustifyH("LEFT")
text1:SetFont(C["media"].normal_font, 11)
text1:SetWidth(f:GetWidth()-40)
text1:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -60)

local text2 = f:CreateFontString(nil, "OVERLAY")
text2:SetJustifyH("LEFT")
text2:SetFont(C["media"].normal_font, 11)
text2:SetWidth(f:GetWidth()-40)
text2:SetPoint("TOPLEFT", text1, "BOTTOMLEFT", 0, -20)

local text3 = f:CreateFontString(nil, "OVERLAY")
text3:SetJustifyH("LEFT")
text3:SetFont(C["media"].normal_font, 11)
text3:SetWidth(f:GetWidth()-40)
text3:SetPoint("TOPLEFT", text2, "BOTTOMLEFT", 0, -20)

local text4 = f:CreateFontString(nil, "OVERLAY")
text4:SetJustifyH("LEFT")
text4:SetFont(C["media"].normal_font, 11)
text4:SetWidth(f:GetWidth()-40)
text4:SetPoint("TOPLEFT", text3, "BOTTOMLEFT", 0, -20)

local credits = f:CreateFontString(nil, "OVERLAY")
credits:SetFont(C["media"].normal_font, 11, "THINOUTLINE")
credits:SetText("")
credits:SetPoint("BOTTOM", f, "BOTTOM", 0, 4)

local sbt = sb:CreateFontString(nil, "OVERLAY")
sbt:SetFont(C["media"].normal_font, 13, "THINOUTLINE")
sbt:SetPoint("CENTER", sb)

local option1 = CreateFrame("Button", "ViksUIInstallOption1", f)
option1:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 20, 7)
option1:SetSize(128, 20)
option1:SetTemplate("Default")
option1:FontString("Text", C["media"].normal_font, 11)
option1.Text:SetPoint("CENTER")

local option2 = CreateFrame("Button", "ViksUIInstallOption2", f)
option2:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -20, 7)
option2:SetSize(128, 20)
option2:SetTemplate("Default")
option2:FontString("Text", C["media"].normal_font, 11)
option2.Text:SetPoint("CENTER")

local close = CreateFrame("Button", "ViksUIInstallCloseButton", f, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", f, "TOPRIGHT")
T.SkinCloseButton(close)
close:SetScript("OnClick", function() f:Hide() end)

Optionb1 = CreateFrame("Button", "InstallOption1Button", f, "UIPanelButtonTemplate")
Optionb1:StripTextures()
Optionb1:SetSize(160, 30)
Optionb1:SetPoint("BOTTOM", 0, 60)
Optionb1:SkinButton()
Optionb1:SetText("")
Optionb1:Hide()

Optionb2 = CreateFrame("Button", "InstallOption2Button", f, "UIPanelButtonTemplate")
Optionb2:StripTextures()
Optionb2:SetSize(110, 30)
Optionb2:SetPoint('BOTTOMLEFT', f, 'BOTTOM', 4, 60)
Optionb2:SkinButton()
Optionb2:SetText("")
Optionb2:Hide()
Optionb2:SetScript('OnShow', function() Optionb1:Width(110); Optionb1:ClearAllPoints(); Optionb1:SetPoint('BOTTOMRIGHT', f, 'BOTTOM', -4, 60) end)
Optionb2:SetScript('OnHide', function() Optionb1:Width(160); Optionb1:ClearAllPoints(); Optionb1:SetPoint("BOTTOM", 0, 60) end)

Optionb3 = CreateFrame("Button", "InstallOption3Button", f, "UIPanelButtonTemplate")
Optionb3:StripTextures()
Optionb3:SetSize(100, 30)
Optionb3:SetPoint('LEFT', Optionb2, 'RIGHT', 4, 0)
Optionb3:SkinButton()
Optionb3:SetText("")
Optionb3:Hide()
Optionb3:SetScript('OnShow', function() Optionb1:Width(100); Optionb1:ClearAllPoints(); Optionb1:SetPoint('RIGHT', Optionb2, 'LEFT', -4, 0); Optionb2:Width(100); Optionb2:ClearAllPoints(); Optionb2:SetPoint('BOTTOM', f, 'BOTTOM', 0, 60)  end)
Optionb3:SetScript('OnHide', function() Optionb1:Width(160); Optionb1:ClearAllPoints(); Optionb1:SetPoint("BOTTOM", 0, 60); Optionb2:Width(110); Optionb2:ClearAllPoints(); Optionb2:SetPoint('BOTTOMLEFT', f, 'BOTTOM', 4, 60) end)

local maxsteps = 8
-- Creating the steps in installui
-- Step 8 / Finish
local profile
local step8 = function()
	f.bg:SetTexture([[Interface\AddOns\ViksUI\Media\Textures\logosk]])
	f.bg:SetAlpha(0.2)
	ViksUISettingsPerChar.Install = true
	sb:SetValue(7)
	PlaySound(888)
	header:SetText("8. Success!")
	text1:SetText("Installation is complete.")
	text2:SetText("Please click the 'Finish' button to reload the UI.")
	text3:SetText("")
	text4:SetText("Enjoy ViksUI")
	sbt:SetText("8/ "..maxsteps)
	option1:Hide()
	option2.Text:SetText("Finish")
	option2:SetText("Finish")
	option2:SetScript("OnClick", function() ReloadUI() end)
end
-- Step 7 / Select Panels Layout
local step7 = function()
	if not option2:IsShown() then option2:Show() end
	sb:SetValue(7)
	header:SetText("6. No Panel Layout Select")
	text1:SetText("Click the button to use No Panel Layout")
	text2:SetText("This can be changed under Config->Panels")
	text3:Hide()
	InstallOption1Button:Show()
	InstallOption1Button:SetText("NoPanels")
	InstallOption1Button:SetScript('OnClick', function()
		f.bg:SetTexture([[Interface\AddOns\ViksUI\Media\Other\NoPanels]])
		f.bg:SetAlpha(1)
		if not profile["panels"] then profile["panels"] = {} end
		if not profile["panels"]["NoPanels"] then profile["panels"]["NoPanels"] = {} end
		profile["panels"]["NoPanels"] = true
		ViksUISettingsPerChar.NoPanels = true
		Details:ApplyProfile("ViksUI_NoPanels")
	end)
	InstallOption2Button:Show()
	InstallOption2Button:SetText("Normal Panels")
	InstallOption2Button:SetScript('OnClick', function()
		f.bg:SetTexture([[Interface\AddOns\ViksUI\Media\Other\Panels]])
		f.bg:SetAlpha(1)
		if not profile["panels"] then profile["panels"] = {} end
		if not profile["panels"]["NoPanels"] then profile["panels"]["NoPanels"] = {} end
		profile["panels"]["NoPanels"] = false
		ViksUISettingsPerChar.NoPanels = false
		Details:ApplyProfile("ViksUI_Panels")
	end)
	text4:SetText("Click one of the buttons then click 'Continue'.")
	sbt:SetText("7/ "..maxsteps)
	option1:SetScript("OnClick", step8)
	option2:SetScript("OnClick", function()
		InstallOption1Button:Hide()
		InstallOption2Button:Hide()
		step8()
	end)
end
-- Step 6 / Select UnitFrame Layout
local step6 = function()
	if not option2:IsShown() then option2:Show() end
	sb:SetValue(6)
	header:SetText("6. Unit Frame Layout")
	text1:SetText("This step will setup Unit Frame Positions.")
	text2:Hide()
	text3:Hide()
	InstallOption1Button:Show()
	InstallOption1Button:SetText("DPS")
	InstallOption1Button:SetScript('OnClick', function()
		if not profile["unitframe"] then profile["unitframe"] = {} end
		if not profile["unitframe"]["HealFrames"] then profile["unitframe"]["HealFrames"] = {} end
		profile["unitframe"]["HealFrames"] = false
	end)
	InstallOption2Button:Show()
	InstallOption2Button:SetText("HEALER")
	InstallOption2Button:SetScript('OnClick', function()
		if not profile["unitframe"] then profile["unitframe"] = {} end
		if not profile["unitframe"]["HealFrames"] then profile["unitframe"]["HealFrames"] = {} end
		profile["unitframe"]["HealFrames"] = true
	end)
	text4:SetText("Click one of the buttons then click 'Continue'.")
	sbt:SetText("6/ "..maxsteps)
	option1:SetScript("OnClick", step7)
	option2:SetScript("OnClick", function()
		InstallOption1Button:Hide()
		InstallOption2Button:Hide()
		step7()
	end)
end
-- Step 5 / Setting up skada Profile
local step5 = function()
	if C_AddOns.IsAddOnLoaded("Details") then
		if ViksUISettings.DetailsSettings then
		step6()
		return end
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(5)
		header:SetText("5. Details")
		text1:SetText("This step will setup Details 3 Window profile.")
		text2:SetText("This step is |cffff0000recommended|r for new users. NB: Load profile inside Details after")
		text3:SetText("|cffff0000NB! NOTE|r this step overwrite Details current settings.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("5/ "..maxsteps)
		option1:SetScript("OnClick", step6)
		option2:SetScript("OnClick", function()
			UploadDetails()
			_detalhes_database["active_profile"] = "ViksUI"
			ViksUISettings.DetailsSettings = true
			step6()
		end)
	elseif C_AddOns.IsAddOnLoaded("Skada") then
		if ViksUISettings.SkadaSettings then
		step6()
		return end
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(5)
		header:SetText("5. Skada")
		text1:SetText("This step will setup Skada 3 Window profile.")
		text2:SetText("This step is |cffff0000recommended|r for new users.")
		text3:SetText("|cffff0000NB! NOTE|r this step overwrite Skadas current settings.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("5/ "..maxsteps)
		option1:SetScript("OnClick", step6)
		option2:SetScript("OnClick", function()
			UploadSkada()
			ViksUISettings.SkadaSettings = true
			step6()
		end)
	else
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(5)
		header:SetText("5. Damage Meters")
		text1:SetText("Skada or Details was not detected! Both settings will be added")
		text2:SetText("This step is |cffff0000recommended|r for new users.")
		text3:SetText("|cffff0000NB! NOTE|r this step overwrite Skadas and Details current settings.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("5/ "..maxsteps)
		option1:SetScript("OnClick", step6)
		option2:SetScript("OnClick", function()
			UploadSkada()
			ViksUISettings.SkadaSettings = true
			UploadDetails()
			ViksUISettings.DetailsSettings = true
			step6()
		end)
	end
end
-- Step 4 / Setting up bartenders profile
local step4 = function()
	if C_AddOns.IsAddOnLoaded("Bartender4") then
		if ViksUISettings.BTSettings then
		step5()
		return end
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(4)
		header:SetText("4. Bartender")
		text1:SetText("This step will setup bartender profile.")
		text2:SetText("This step is |cffff0000recommended|r for new users.")
		text3:SetText("|cffff0000NB! NOTE|r this step overwrite bartender current settings.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("3/ "..maxsteps)
		option1:SetScript("OnClick", step5)
		option2:SetScript("OnClick", function()
			UploadBartender()
			ViksUISettingsPerChar.BartenderSet = false
			ViksUISettings.BTSettings = true
			step5()
		end)
	else
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(4)
		header:SetText("4. Bartender addon is missing!!!")
		text1:SetText("ViksUI mainly uses Bartender 3 for actionbars.")
		text2:SetText("The addon will not look the same with default built in actionbars")
		text3:SetText("|cffff0000NB! NOTE|r Apply settings for Bartender 3 still?.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("4/ "..maxsteps)
		option1:SetScript("OnClick", step5)
		option2:SetScript("OnClick", function()
			UploadBartender()
			ViksUISettingsPerChar.BartenderSet = false
			ViksUISettings.BTSettings = true
			step5()
		end)
	end
end
-- Step 3 / Setting Sosial (chat++)
local step3 = function()
	sb:SetValue(3)
	header:SetText("3. Social")
	sbt:SetText("3/ "..maxsteps)
	if C_AddOns.IsAddOnLoaded("Prat") or C_AddOns.IsAddOnLoaded("Chatter") then
		text1:SetText("Another chat addon is found.  We will ignore this step.  Please press skip to continue installation.")
		option2:Hide()
	else
		text1:SetText("The second step applies the correct chat setup.")
		text2:SetText("If you are a new user, this step is recommended.  If you are an existing user, you may want to skip this step.")
		text3:SetText("It is normal that your chat font will appear too big upon applying these settings.  It will revert back to normal when you finish with the installation.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		option2:SetScript("OnClick", function()
			T.ChatSetup()
			step4()
		end)
	end
	option1:SetScript("OnClick", step4)
end
-- Step 2 / Setting Cvars and Masque
local step2 = function()
	close:Hide()
	sb:SetMinMaxValues(0, 7) -- Setting amount of steps for Progressbar
	sb:Show()
	sb:SetValue(2)
	sb:SetStatusBarColor(.26, 1, .22)
	header:SetText("2. Essential Settings")
	text1:SetText("These steps will apply the correct CVar settings for ViksUI.")
	text2:SetText("The step applies the essential settings.")
	text3:SetText("This is |cffff0000recommended|r for any user, unless you want to apply only a specific part of the settings.")
	text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
	sbt:SetText("2/ "..maxsteps)
	option1:Show()
	option1.Text:SetText("Skip")
	option2.Text:SetText("Continue")
	option1:SetText("Skip")
	option2:SetText("Continue")
	option1:SetScript("OnClick", step3)
	option2:SetScript("OnClick", function()
		cvarsetup()
		UploadMasque()
		step3()
	end)
	SetActionBarToggles(1, 1, 1, 1, 0)
	SetCVar("alwaysShowActionBars", 0)
end
-- Step 1 / Profile Settings
local step1 = function()
	local realm = GetRealmName()
	local name = UnitName("player")
	if not option2:IsShown() then option2:Show() end
	sb:SetValue(1)
	header:SetText("1. Profile Settings")
	text1:SetText("This Character will use profile for:")
	text2:SetText("Settings pr account or character")
	text3:Hide()
	InstallOption1Button:Show()
	InstallOption1Button:SetText("Account")
	InstallOption1Button:SetScript('OnClick', function()
		ViksUIOptionsGlobal["Current_Profile"] = ViksUIOptionsGlobal["Current_Profile"] or 1
		local i = tostring(ViksUIOptionsGlobal["Current_Profile"])
		ViksUIOptions[i] = ViksUIOptions[i] or {}
		profile = ViksUIOptions[i]
		ViksUIOptionsGlobal[realm][name] = false
	end)
	InstallOption2Button:Show()
	InstallOption2Button:SetText("Character")
	InstallOption2Button:SetScript('OnClick', function()
		ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name] = ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name] or 1
		local i = tostring(ViksUIOptionsGlobal[T.realm]["Current_Profile"][T.name])
		ViksUIOptionsPerChar[i] = ViksUIOptionsPerChar[i] or {}
		profile = ViksUIOptionsPerChar[i]
		ViksUIOptionsGlobal[realm][name] = true
	end)
	text4:SetText("Click one of the buttons then click 'Continue'.")
	sbt:SetText("1/ "..maxsteps)
	option1:SetScript("OnClick", step6)
	option2:SetScript("OnClick", function()
		InstallOption1Button:Hide()
		InstallOption2Button:Hide()
		step2()
	end)
end
-- Step 0 / Welcome
local function install()
	f:Show()
	sb:Hide()
	option2:Show()
	close:Show()
	header:SetText("Welcome")
	text1:SetText("Thank you for choosing ViksUI!")
	text2:SetText("You will be guided through the installation process in a few simple steps.  At each step, you can decide whether or not you want to apply or skip the presented settings.")
	text3:SetText("You are also given the possibility to be shown a brief tutorial on some of the features of ViksUI.")
	text4:SetText("Press the 'Tutorial' button to be guided through this small introduction, or press 'Install' to skip this step.")
	option2.Text:SetText("Install")
	option2:SetText("Install")
	option2:SetScript("OnClick", step1)
end

local function DisableUI()
	DisableAddOn("ViksUI")
	ReloadUI()
end

local OnLogon = CreateFrame("Frame")
OnLogon:RegisterEvent("PLAYER_LOGIN")
OnLogon:SetScript("OnEvent", function(self)
	self:UnregisterEvent("PLAYER_LOGIN")

	-- TODO delete old variable
	if SavedOptions then
		ViksUISettings = SavedOptions
		SavedOptions = nil
	end

	if SavedStats then
		ViksUIStats = SavedStats
		SavedStats = nil
	end

	if SavedBindings then
		ViksUIBindings = SavedBindings
		SavedBindings = nil
	end

	if SavedCurrency then
		ViksUICurrency = SavedCurrency
		SavedCurrency = nil
	end

	if ViksUISettings == nil then ViksUISettings = {} end
	if not ViksUISettings.Migrated then
		if SavedOptionsPerChar then

			if SavedOptionsPerChar.UFPos then
				SavedPositions.UFPos = SavedOptionsPerChar.UFPos
				SavedOptionsPerChar.UFPos = nil
				StaticPopup_Show("INSTALL_UI")
			end
			ViksUISettingsPerChar = SavedOptionsPerChar
			SavedOptionsPerChar = nil
		end

		if SavedPositions then
			ViksUIPositions = SavedPositions
			SavedPositions = nil
		end

		ViksUISettings.Migrated = true
	end

	-- Create empty CVar if they doesn't exist
	if ViksUISettings == nil then ViksUISettings = {} end
	if ViksUIPositions == nil then ViksUIPositions = {} end
	if ViksUIPositions.UnitFrame == nil then ViksUIPositions.UnitFrame = {} end
	if ViksUISettingsPerChar == nil then ViksUISettingsPerChar = {} end
	if ViksUIOptionsPerChar == nil then ViksUIOptionsPerChar = {} end
	if ViksUISettingsPerChar.experiencebar == nil  then ViksUISettingsPerChar.experiencebar = {
	["ViksUIExperienceBar1"] = "XP",
	["ViksUIExperienceBar2"] = "HONOR",
	}
	end
	if ViksUISettingsPerChar.FogOfWar == nil then ViksUISettingsPerChar.FogOfWar = false end
	if ViksUISettingsPerChar.AutoInvite == nil then ViksUISettingsPerChar.AutoInvite = false end
	if ViksUISettingsPerChar.Archaeology == nil then ViksUISettingsPerChar.Archaeology = false end
	if ViksUISettingsPerChar.BarsLocked == nil then ViksUISettingsPerChar.BarsLocked = false end
	if ViksUISettingsPerChar.SplitBars == nil then ViksUISettingsPerChar.SplitBars = true end
	if ViksUISettingsPerChar.RightBars == nil then ViksUISettingsPerChar.RightBars = C.actionbar.rightbars end
	if ViksUISettingsPerChar.BottomBars == nil then ViksUISettingsPerChar.BottomBars = C.actionbar.bottombars end

	if T.screenWidth < 1024 and GetCVar("gxMonitor") == "0" then
		SetCVar("useUiScale", 0)
		StaticPopup_Show("DISABLE_UI")
	else
		C.general.uiscale = tonumber(C.general.uiscale)
		SetCVar("useUiScale", 1)
		if C.general.uiscale > 1.28 then C.general.uiscale = 1.28 end

		-- Set our uiScale
		if tonumber(GetCVar("uiScale")) ~= tonumber(C.general.uiscale) then
			SetCVar("uiScale", C.general.uiscale)
		end

		-- Hack for 4K and WQHD Resolution
		if C.general.uiscale < 0.64 then
			UIParent:SetScale(C.general.uiscale)
		end

		-- Install default if we never ran ViksUI on this character
		if not ViksUISettingsPerChar.Install then
			install()
		end
	end

	if C_AddOns.IsAddOnLoaded("Bartender4") then
		ExtraActionBarFrame:SetSize(50,50) -- Reduce annoying background frame that right button camera turning
		ExtraAbilityContainer:SetSize(50,50) -- Reduce annoying background frame that right button camera turning
		if ViksUISettingsPerChar.Install and ViksUISettingsPerChar.BartenderSet ~= true and ViksUISettingsPerChar.NoPanels then
			StaticPopup_Show("SET_BTLine")
			ViksUISettingsPerChar.BartenderSet = true
		end
		if ViksUISettingsPerChar.Install and ViksUISettingsPerChar.BartenderSet ~= true and ViksUISettingsPerChar.NoPanels ~= true then
			StaticPopup_Show("SET_BT")
			ViksUISettingsPerChar.BartenderSet = true
		end
	end
	-- Welcome message
	if C.general.welcome_message == true then
		print("|cffffff00".."Welcome to ViksUI "..T.version..", "..T.name)
		print("|cffffff00".."Type /config to config interface".." |cffffff00".."for more informations.")
	end

	-- Force load some cvars
	C_Timer.After(1, function() -- Making sure other addons don't turn this off
		SetCVar("cameraDistanceMaxZoomFactor", 2.6) -- Set Max camera distance
		SetCVar("scriptErrors", 1) -- Making sure to show lua errors.
		QuickJoinToastButton:Hide() -- Something is overriding this with NoPanel, So overriding it again ;p
	end)
end)

----------------------------------------------------------------------------------------
--	Popups
----------------------------------------------------------------------------------------

StaticPopupDialogs.DISABLE_UI = {
	text = L_POPUP_DISABLEUI,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = DisableUI,
	showAlert = true,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

StaticPopupDialogs.RESET_UI = {
	text = L_POPUP_RESETUI,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = InstallUI,
	OnCancel = function() ViksUISettingsPerChar.Install = true end,
	showAlert = true,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

StaticPopupDialogs.RESET_STATS = {
	text = L_POPUP_RESETSTATS,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() ViksUIStats = {} ReloadUI() end,
	showAlert = true,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

StaticPopupDialogs.SET_BT = {
	text = "Select Bartender Profile",
	button1 = "Rogue",
	button2 = "Druid",
	button3 = "Other",
	OnAccept = function() Bartender4.db:SetProfile("ViksUIRogue") end,
	OnCancel = function() Bartender4.db:SetProfile("ViksUIDruid") end,
	OnAlt = function() Bartender4.db:SetProfile("ViksUI") end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
	preferredIndex = 5,
}
StaticPopupDialogs.SET_BTLine = {
	text = "Select Bartender Profile",
	button1 = "Rogue NoPanel",
	button2 = "Druid NoPanel",
	button3 = "Other NoPanel",
	OnAccept = function() Bartender4.db:SetProfile("ViksUIRogueLine") end,
	OnCancel = function() Bartender4.db:SetProfile("ViksUIDruidLine") end,
	OnAlt = function() Bartender4.db:SetProfile("ViksUILine") end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
	preferredIndex = 5,
}
----------------------------------------------------------------------------------------
--	Slash Commands
----------------------------------------------------------------------------------------


-- Bartender Select Profile
SLASH_SET_BT1 = "/vbt"
SlashCmdList.SET_BT = function() StaticPopup_Show("SET_BT") end

SLASH_SET_BTLine1 = "/vbtline"
SlashCmdList.SET_BTLine = function() StaticPopup_Show("SET_BTLine") end

SLASH_CONFIGURE1 = "/resetui"
SlashCmdList.CONFIGURE = function() StaticPopup_Show("RESET_UI") end

SLASH_INSTALLUI1 = "/installui"
SlashCmdList['INSTALLUI'] = install

SLASH_RESETSTATS1 = "/resetstats"
SlashCmdList.RESETSTATS = function() StaticPopup_Show("RESET_STATS") end


SLASH_RESETSTATS1 = "/resetstats"
SlashCmdList.RESETSTATS = function() StaticPopup_Show("RESET_STATS") end

StaticPopupDialogs.SETTINGS_ALL = {
	text = L_POPUP_SETTINGS_ALL,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		if C_AddOns.IsAddOnLoaded("DBM-Core") and C.skins.dbm then T.UploadDBM() end
		if C_AddOns.IsAddOnLoaded("BigWigs") and C.skins.bigwigs then T.UploadBW() end
		if C_AddOns.IsAddOnLoaded("MikScrollingBattleText") then UploadMSBT() end
		if C_AddOns.IsAddOnLoaded("Skada") then UploadSkada() end
		if C_AddOns.IsAddOnLoaded("Bartender4") then UploadBartender() end
		if C_AddOns.IsAddOnLoaded("Details") then UploadDetails() end
		UploadMasque()
		T.ChatSetup()
		cvarsetup()
		ReloadUI()
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

SlashCmdList.SETTINGS = function(msg)
	if msg == "dbm" then
		if C_AddOns.IsAddOnLoaded("DBM-Core") then
			if C.skins.dbm == true then
				StaticPopup_Show("SETTINGS_DBM")
			else
				print("|cffffff00"..L_INFO_SKIN_DISABLED1.."DBM"..L_INFO_SKIN_DISABLED2.."|r")
			end
		else
			print("|cffffff00DBM"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "bw" then
		if C_AddOns.IsAddOnLoaded("BigWigs") then
			if C.skins.bigwigs == true then
				StaticPopup_Show("SETTINGS_BIGWIGS")
			else
				print("|cffffff00"..L_INFO_SKIN_DISABLED1.."BigWigs"..L_INFO_SKIN_DISABLED2.."|r")
			end
		else
			print("|cffffff00BigWigs"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "msbt" then
		if C_AddOns.IsAddOnLoaded("MikScrollingBattleText") then
			UploadMSBT()
			ReloadUI()
		else
			print("|cffffff00MSBT"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "details" then
		if C_AddOns.IsAddOnLoaded("Details") then
			UploadDetails()
			ReloadUI()
		else
			print("|cffffff00Details"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "skada" then
		if C_AddOns.IsAddOnLoaded("Skada") then
			UploadSkada()
			ReloadUI()
		else
			print("|cffffff00Skada"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "chat" then
			T.ChatSetup()
	elseif msg == "cvar" then
			UploadCvar()
	elseif msg == "details" then
		if C_AddOns.IsAddOnLoaded("Details") then
			UploadDetails()
			ReloadUI()
		else
			print("|cffffff00Bartender"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "bartender" then
		if C_AddOns.IsAddOnLoaded("Bartender4") then
			UploadBartender()
			ReloadUI()
		else
			print("|cffffff00Bartender"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "OPie" then
		if C_AddOns.IsAddOnLoaded("OPie") then
			UploadOpie()
			ReloadUI()
		else
			print("|cffffff00OPie"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "all" then
		StaticPopup_Show("SETTINGS_ALL")
	else
		print("|cffffff00"..L_INFO_SETTINGS_DBM.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_BIGWIGS.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_MSBT.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_SKADA.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_DETAILS.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_CHAT.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_CVAR.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_ALL.."|r")
	end
end
SLASH_SETTINGS1 = "/settings"