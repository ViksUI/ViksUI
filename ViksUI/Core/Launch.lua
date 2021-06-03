local T, C, L, _ = unpack(select(2, ...))

T.ChatSetup = function()
	local IsPublicChannelFound = EnumerateServerChannels()
	
	if not IsPublicChannelFound then
		-- Restart this function until we are able to query public channels
		C_Timer.After(1, Chat.Reset)
		
		return
	end
	
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)

	FCF_OpenNewWindow("T & L")
	FCF_OpenNewWindow("Guild")
	FCF_DockFrame(ChatFrame3)
	FCF_SetLocked(ChatFrame3, 1)
	FCF_UnDockFrame(ChatFrame4)
	FCF_SetLocked(ChatFrame4, 1)
	ChatFrame4:Show()
	FCF_SetChatWindowFontSize(nil, ChatFrame1, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame2, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame3, 12)
	FCF_SetChatWindowFontSize(nil, ChatFrame4, 12)	
	DEFAULT_CHAT_FRAME:SetUserPlaced(true)
	
	local ChatGroup = {}
	local Channels = {}
	
	for i=1, select("#", EnumerateServerChannels()), 1 do
		Channels[i] = select(i, EnumerateServerChannels())
	end
	
	-- Remove everything in first 4 chat windows
	for i = 1, 4 do
		if i ~= 2 then
			local ChatFrame = _G["ChatFrame"..i]

			ChatFrame_RemoveAllMessageGroups(ChatFrame)
			ChatFrame_RemoveAllChannels(ChatFrame)
		end
	end
	
	-- Join public channels
	for i = 1, #Channels do
		SlashCmdList["JOIN"](Channels[i])
	end
	
	-- Fix a editbox texture
	ChatEdit_ActivateChat(ChatFrame1EditBox)
	ChatEdit_DeactivateChat(ChatFrame1EditBox)

	-----------------------
	-- ChatFrame 1 Setup --
	-----------------------
	
	ChatGroup = {"SKILL", "LOOT", "MONEY", "OPENING", "COMBAT_MISC_INFO ", "COMBAT_XP_GAIN", "COMBAT_HONOR_GAIN", "ARENA_POINTS", "CURRENCY", "SAY", "EMOTE", "YELL", "MONSTER_SAY", "MONSTER_EMOTE", "MONSTER_YELL", "MONSTER_WHISPER", "MONSTER_BOSS_EMOTE", "MONSTER_BOSS_WHISPER", "PARTY", "PARTY_LEADER", "RAID", "RAID_LEADER", "RAID_WARNING", "INSTANCE_CHAT", "INSTANCE_CHAT_LEADER", "BG_HORDE", "BG_ALLIANCE", "BG_NEUTRAL", "AFK", "DND", "ACHIEVEMENT"}
	
	for _, v in ipairs(ChatGroup) do
		ChatFrame_AddMessageGroup(_G.ChatFrame1, v)
	end

	-----------------------
	-- ChatFrame 3 Setup --
	-----------------------

	for i = 1, #Channels do
		ChatFrame_RemoveChannel(ChatFrame1, Channels[i])
		ChatFrame_AddChannel(ChatFrame3, Channels[i])
	end
	
	-- Adjust Chat Colors
	ChangeChatColor("CHANNEL1", 195/255, 230/255, 232/255)
	ChangeChatColor("CHANNEL2", 232/255, 158/255, 121/255)
	ChangeChatColor("CHANNEL3", 232/255, 228/255, 121/255)
	ChangeChatColor("CHANNEL4", 232/255, 228/255, 121/255)
	ChangeChatColor("CHANNEL5", 0/255, 228/255, 121/255)
	ChangeChatColor("CHANNEL6", 0/255, 228/255, 0/255)
	
	-----------------------
	-- ChatFrame 4 Setup --
	-----------------------
	
	local Tab4 = ChatFrame4Tab
	local Chat4 = ChatFrame4

	ChatGroup = {"GUILD", "OFFICER", "GUILD_ACHIEVEMENT", "WHISPER", "BN_WHISPER", "BN_CONVERSATION"}
	
	for _, v in ipairs(ChatGroup) do
		ChatFrame_AddMessageGroup(_G.ChatFrame4, v)
	end
	
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		local chatFrameId = frame:GetID()
		local chatName = FCF_GetChatWindowInfo(chatFrameId)
		
		-- move general bottom left
		if i == 1 then
			frame:ClearAllPoints()
			frame:SetWidth(LChat:GetWidth()-8)
			frame:SetHeight(LChat:GetHeight()-8)
			frame:SetPoint("BOTTOMLEFT",LChat,"BOTTOMLEFT",4,6)
			frame:SetPoint("TOPRIGHT",LChat,"TOPRIGHT",-4,-2)		
		elseif i == 4 then
			frame:ClearAllPoints()
			frame:SetWidth(RChat:GetWidth()-8)
			frame:SetHeight(RChat:GetHeight()-8)
			frame:SetPoint("BOTTOMLEFT",RChat,"BOTTOMLEFT",4,4)
			frame:SetPoint("TOPRIGHT",RChat,"TOPRIGHT",-4,-2)
		end
		
		FCF_SavePositionAndDimensions(frame)
		FCF_StopDragging(frame)
		
	
		-- rename windows general because moved to chat #3
		if i == 1 then
			FCF_SetWindowName(frame, "GROUP")
		elseif i == 2 then
			FCF_SetWindowName(frame, "LOG")
		elseif i == 3 then 
			FCF_SetWindowName(frame, "T&G")
		elseif i == 4 then 
			FCF_SetWindowName(frame, "GUILD") 			
		end
	end


	-- Reset saved variables on char
	ViksUIPositions = {}
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
	SetCVar("nameplateMaxDistance", 60)
	SetCVar("nameplateResourceOnTarget", 0)
	SetCVar("nameplateShowSelf", 0)
	SetCVar("cameraSmoothStyle", 0)
	SetCVar('showQuestTrackingTooltips', 1)
	SetCVar("profanityFilter", 0)
	SetCVar('fstack_preferParentKeys', 0) --Add back the frame names via fstack!
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
							["y"] = 47,
							["x"] = 150,
							["point"] = "CENTER",
							["scale"] = 1.5,
						},
					},
					["ViksUILine"] = {
						["position"] = {
							["y"] = 47,
							["x"] = 150,
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
							["y"] = 47,
							["x"] = 150,
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
							["y"] = 47,
							["x"] = 150,
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
							["y"] = 47,
							["x"] = 150,
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
							["y"] = 47,
							["x"] = 150,
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
_detalhes_global = {
	["npcid_pool"] = {
	},
	["death_recap"] = {
		["show_segments"] = false,
		["enabled"] = true,
		["show_life_percent"] = false,
		["relevance_time"] = 7,
	},
	["spell_pool"] = {
		[75] = 3,
		[154253] = 3,
		[34026] = 3,
		[186406] = 3,
		[176984] = 3,
		[19574] = 3,
		[5384] = 3,
		[131900] = 3,
		[131894] = 3,
	},
	["encounter_spell_pool"] = {
	},
	["immersion_pets_on_solo_play"] = false,
	["npcid_ignored"] = {
	},
	["dungeon_data"] = {
	},
	["auto_open_news_window"] = true,
	["got_first_run"] = true,
	["report_pos"] = {
		1, -- [1]
		1, -- [2]
	},
	["latest_report_table"] = {
	},
	["exp90temp"] = {
		["delete_damage_TCOB"] = true,
	},
	["__profiles"] = {
		["ViksUI"] = {
			["show_arena_role_icon"] = false,
			["capture_real"] = {
				["heal"] = true,
				["spellcast"] = true,
				["miscdata"] = true,
				["aura"] = true,
				["energy"] = true,
				["damage"] = true,
			},
			["row_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["streamer_config"] = {
				["faster_updates"] = false,
				["quick_detection"] = false,
				["reset_spec_cache"] = false,
				["no_alerts"] = false,
				["disable_mythic_dungeon"] = false,
				["use_animation_accel"] = true,
			},
			["all_players_are_group"] = false,
			["use_row_animations"] = true,
			["report_heal_links"] = false,
			["remove_realm_from_name"] = true,
			["minimum_overall_combat_time"] = 10,
			["event_tracker"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["line_height"] = 16,
				["line_color"] = {
					0.1, -- [1]
					0.1, -- [2]
					0.1, -- [3]
					0.3, -- [4]
				},
				["font_shadow"] = "NONE",
				["font_size"] = 10,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = true,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["locked"] = false,
					["height"] = 300,
					["width"] = 250,
				},
				["line_texture"] = "Details Serenity",
				["options_frame"] = {
				},
			},
			["report_to_who"] = "",
			["class_specs_coords"] = {
				[62] = {
					0.251953125, -- [1]
					0.375, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[63] = {
					0.375, -- [1]
					0.5, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[250] = {
					0, -- [1]
					0.125, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[251] = {
					0.125, -- [1]
					0.25, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[252] = {
					0.25, -- [1]
					0.375, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[253] = {
					0.875, -- [1]
					1, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[254] = {
					0, -- [1]
					0.125, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[255] = {
					0.125, -- [1]
					0.25, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[66] = {
					0.125, -- [1]
					0.25, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[257] = {
					0.5, -- [1]
					0.625, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[258] = {
					0.6328125, -- [1]
					0.75, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[259] = {
					0.75, -- [1]
					0.875, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[260] = {
					0.875, -- [1]
					1, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[577] = {
					0.25, -- [1]
					0.375, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[262] = {
					0.125, -- [1]
					0.25, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[581] = {
					0.375, -- [1]
					0.5, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[264] = {
					0.375, -- [1]
					0.5, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[265] = {
					0.5, -- [1]
					0.625, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[266] = {
					0.625, -- [1]
					0.75, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[267] = {
					0.75, -- [1]
					0.875, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[268] = {
					0.625, -- [1]
					0.75, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[269] = {
					0.875, -- [1]
					1, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[270] = {
					0.75, -- [1]
					0.875, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[70] = {
					0.251953125, -- [1]
					0.375, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[102] = {
					0.375, -- [1]
					0.5, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[71] = {
					0.875, -- [1]
					1, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[103] = {
					0.5, -- [1]
					0.625, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[72] = {
					0, -- [1]
					0.125, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[104] = {
					0.625, -- [1]
					0.75, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[73] = {
					0.125, -- [1]
					0.25, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[64] = {
					0.5, -- [1]
					0.625, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[105] = {
					0.75, -- [1]
					0.875, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[65] = {
					0, -- [1]
					0.125, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[256] = {
					0.375, -- [1]
					0.5, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[261] = {
					0, -- [1]
					0.125, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[263] = {
					0.25, -- [1]
					0.375, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
			},
			["profile_save_pos"] = true,
			["tooltip"] = {
				["header_statusbar"] = {
					0.3, -- [1]
					0.3, -- [2]
					0.3, -- [3]
					0.8, -- [4]
					false, -- [5]
					false, -- [6]
					"WorldState Score", -- [7]
				},
				["fontcolor_right"] = {
					1, -- [1]
					0.7, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["line_height"] = 17,
				["tooltip_max_targets"] = 2,
				["icon_size"] = {
					["W"] = 17,
					["H"] = 17,
				},
				["tooltip_max_pets"] = 2,
				["anchor_relative"] = "top",
				["abbreviation"] = 2,
				["anchored_to"] = 1,
				["show_amount"] = false,
				["header_text_color"] = {
					1, -- [1]
					0.9176, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["fontsize"] = 10,
				["background"] = {
					0.196, -- [1]
					0.196, -- [2]
					0.196, -- [3]
					0.8, -- [4]
				},
				["submenu_wallpaper"] = true,
				["fontsize_title"] = 10,
				["fontcolor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["commands"] = {
				},
				["tooltip_max_abilities"] = 6,
				["fontface"] = "Friz Quadrata TT",
				["border_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["border_texture"] = "Details BarBorder 3",
				["anchor_offset"] = {
					0, -- [1]
					0, -- [2]
				},
				["fontshadow"] = false,
				["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
				["border_size"] = 14,
				["maximize_method"] = 1,
				["anchor_screen_pos"] = {
					507.7, -- [1]
					-350.5, -- [2]
				},
				["anchor_point"] = "bottom",
				["menus_bg_coords"] = {
					0.309777336120606, -- [1]
					0.924000015258789, -- [2]
					0.213000011444092, -- [3]
					0.279000015258789, -- [4]
				},
				["icon_border_texcoord"] = {
					["R"] = 0.921875,
					["L"] = 0.078125,
					["T"] = 0.078125,
					["B"] = 0.921875,
				},
				["menus_bg_color"] = {
					0.8, -- [1]
					0.8, -- [2]
					0.8, -- [3]
					0.2, -- [4]
				},
			},
			["ps_abbreviation"] = 3,
			["world_combat_is_trash"] = false,
			["update_speed"] = 0.2,
			["bookmark_text_size"] = 11,
			["animation_speed_mintravel"] = 0.45,
			["track_item_level"] = true,
			["windows_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["instances_menu_click_to_open"] = false,
			["overall_clear_newchallenge"] = true,
			["current_dps_meter"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["arena_enabled"] = true,
				["font_shadow"] = "NONE",
				["font_size"] = 18,
				["mythic_dungeon_enabled"] = true,
				["sample_size"] = 5,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = false,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["locked"] = false,
					["height"] = 65,
					["width"] = 220,
				},
				["update_interval"] = 0.3,
				["options_frame"] = {
				},
			},
			["data_cleanup_logout"] = false,
			["instances_disable_bar_highlight"] = false,
			["trash_concatenate"] = false,
			["color_by_arena_team"] = true,
			["animation_speed"] = 33,
			["disable_stretch_from_toolbar"] = false,
			["disable_lock_ungroup_buttons"] = true,
			["memory_ram"] = 64,
			["disable_window_groups"] = true,
			["instances_suppress_trash"] = 0,
			["options_window"] = {
				["scale"] = 0.9500000476837158,
			},
			["animation_speed_maxtravel"] = 3,
			["time_type_original"] = 2,
			["default_bg_alpha"] = 0.5,
			["font_faces"] = {
				["menus"] = "Friz Quadrata TT",
			},
			["time_type"] = 2,
			["death_tooltip_width"] = 350,
			["animate_scroll"] = false,
			["segments_amount"] = 18,
			["report_lines"] = 5,
			["clear_ungrouped"] = true,
			["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
			["skin"] = "WoW Interface",
			["override_spellids"] = true,
			["pvp_as_group"] = true,
			["force_activity_time_pvp"] = true,
			["numerical_system"] = 1,
			["player_details_window"] = {
				["scale"] = 1,
				["skin"] = "ElvUI",
				["bar_texture"] = "Skyline",
			},
			["minimum_combat_time"] = 5,
			["chat_tab_embed"] = {
				["enabled"] = false,
				["tab_name"] = "",
				["x_offset"] = 0,
				["single_window"] = false,
				["w2_pos"] = {
					["point"] = "TOP",
					["x_legacy"] = 41.0000610351563,
					["pos_table"] = true,
					["w"] = 309.999938964844,
					["y"] = -224.999694824219,
					["h"] = 157.999984741211,
					["scale"] = 1,
					["x"] = 40.9999389648438,
					["y_legacy"] = 236.000305175781,
				},
				["y_offset"] = 0,
				["w1_pos"] = {
					["point"] = "CENTER",
					["x_legacy"] = -361.000366210938,
					["pos_table"] = true,
					["w"] = 309.999938964844,
					["y"] = 212.000457763672,
					["h"] = 157.999984741211,
					["scale"] = 1,
					["x"] = -361.000396728516,
					["y_legacy"] = 212.00048828125,
				},
			},
			["cloud_capture"] = true,
			["damage_taken_everything"] = false,
			["scroll_speed"] = 2,
			["new_window_size"] = {
				["height"] = 158,
				["width"] = 310,
			},
			["memory_threshold"] = 3,
			["deadlog_events"] = 32,
			["window_clamp"] = {
				-8, -- [1]
				0, -- [2]
				21, -- [3]
				-14, -- [4]
			},
			["close_shields"] = false,
			["class_coords"] = {
				["HUNTER"] = {
					0, -- [1]
					0.25, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["WARRIOR"] = {
					0, -- [1]
					0.25, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["ROGUE"] = {
					0.49609375, -- [1]
					0.7421875, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["MAGE"] = {
					0.25, -- [1]
					0.49609375, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["PET"] = {
					0.25, -- [1]
					0.49609375, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["DRUID"] = {
					0.7421875, -- [1]
					0.98828125, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["MONK"] = {
					0.5, -- [1]
					0.73828125, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["DEATHKNIGHT"] = {
					0.25, -- [1]
					0.5, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["UNGROUPPLAYER"] = {
					0.5, -- [1]
					0.75, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["UNKNOW"] = {
					0.5, -- [1]
					0.75, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["PRIEST"] = {
					0.49609375, -- [1]
					0.7421875, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["WARLOCK"] = {
					0.7421875, -- [1]
					0.98828125, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["Alliance"] = {
					0.49609375, -- [1]
					0.7421875, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["ENEMY"] = {
					0, -- [1]
					0.25, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["DEMONHUNTER"] = {
					0.73828126, -- [1]
					1, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["Horde"] = {
					0.7421875, -- [1]
					0.98828125, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["PALADIN"] = {
					0, -- [1]
					0.25, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["SHAMAN"] = {
					0.25, -- [1]
					0.49609375, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["MONSTER"] = {
					0, -- [1]
					0.25, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
			},
			["overall_flag"] = 16,
			["disable_alldisplays_window"] = false,
			["numerical_system_symbols"] = "auto",
			["class_colors"] = {
				["HUNTER"] = {
					0.67, -- [1]
					0.83, -- [2]
					0.45, -- [3]
				},
				["WARRIOR"] = {
					0.78, -- [1]
					0.61, -- [2]
					0.43, -- [3]
				},
				["ROGUE"] = {
					1, -- [1]
					0.96, -- [2]
					0.41, -- [3]
				},
				["MAGE"] = {
					0.41, -- [1]
					0.8, -- [2]
					0.94, -- [3]
				},
				["ARENA_YELLOW"] = {
					1, -- [1]
					1, -- [2]
					0.25, -- [3]
				},
				["UNGROUPPLAYER"] = {
					0.4, -- [1]
					0.4, -- [2]
					0.4, -- [3]
				},
				["DRUID"] = {
					1, -- [1]
					0.49, -- [2]
					0.04, -- [3]
				},
				["MONK"] = {
					0, -- [1]
					1, -- [2]
					0.59, -- [3]
				},
				["DEATHKNIGHT"] = {
					0.77, -- [1]
					0.12, -- [2]
					0.23, -- [3]
				},
				["SHAMAN"] = {
					0, -- [1]
					0.44, -- [2]
					0.87, -- [3]
				},
				["UNKNOW"] = {
					0.2, -- [1]
					0.2, -- [2]
					0.2, -- [3]
				},
				["PRIEST"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["ARENA_GREEN"] = {
					0.4, -- [1]
					1, -- [2]
					0.4, -- [3]
				},
				["WARLOCK"] = {
					0.58, -- [1]
					0.51, -- [2]
					0.79, -- [3]
				},
				["ENEMY"] = {
					0.94117, -- [1]
					0, -- [2]
					0.0196, -- [3]
					1, -- [4]
				},
				["DEMONHUNTER"] = {
					0.64, -- [1]
					0.19, -- [2]
					0.79, -- [3]
				},
				["version"] = 1,
				["NEUTRAL"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
				},
				["PALADIN"] = {
					0.96, -- [1]
					0.55, -- [2]
					0.73, -- [3]
				},
				["PET"] = {
					0.3, -- [1]
					0.4, -- [2]
					0.5, -- [3]
				},
			},
			["hotcorner_topleft"] = {
				["hide"] = false,
			},
			["broadcaster_enabled"] = false,
			["clear_graphic"] = true,
			["total_abbreviation"] = 2,
			["segments_auto_erase"] = 1,
			["options_group_edit"] = true,
			["segments_amount_to_save"] = 18,
			["minimap"] = {
				["onclick_what_todo"] = 1,
				["radius"] = 160,
				["hide"] = false,
				["minimapPos"] = 220,
				["text_format"] = 3,
				["text_type"] = 1,
			},
			["instances_amount"] = 5,
			["max_window_size"] = {
				["height"] = 450,
				["width"] = 480,
			},
			["default_bg_color"] = 0.0941,
			["only_pvp_frags"] = false,
			["disable_stretch_button"] = true,
			["deny_score_messages"] = false,
			["animation_speed_triggertravel"] = 5,
			["trash_auto_remove"] = true,
			["segments_panic_mode"] = false,
			["standard_skin"] = false,
			["windows_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["row_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["overall_clear_newboss"] = true,
			["font_sizes"] = {
				["menus"] = 8,
			},
			["overall_clear_logout"] = false,
			["report_schema"] = 1,
			["use_scroll"] = false,
			["use_battleground_server_parser"] = false,
			["disable_reset_button"] = false,
			["data_broker_text"] = "",
			["instances"] = {
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -502.0908584594727,
							["x"] = 536.0833740234375,
							["w"] = 165.9775390625,
							["h"] = 75.98710632324219,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["menu_icons_size"] = 0.7999999523162842,
					["menu_anchor"] = {
						16, -- [1]
						-2, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.05882352941176471,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["bars_sort_direction"] = 1,
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
						["textL_outline"] = true,
						["textR_outline_small"] = false,
						["textL_outline_small"] = false,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 2,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["textL_translit_text"] = true,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ViksUI\\Media\\textures\\Texture.tga",
						["textR_bracket"] = "(",
						["font_size"] = 14,
						["icon_file"] = "",
						["icon_grayscale"] = false,
						["use_spec_icons"] = false,
						["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
						["textR_enable_custom_text"] = false,
						["percent_type"] = 1,
						["fixed_texture_color"] = {
							0.301960784313726, -- [1]
							0.301960784313726, -- [2]
							0.8, -- [3]
							0.439999997615814, -- [4]
						},
						["textL_show_number"] = true,
						["textR_show_data"] = {
							true, -- [1]
							false, -- [2]
							false, -- [3]
						},
						["fixed_texture_background_color"] = {
							0.188235294117647, -- [1]
							0.188235294117647, -- [2]
							0.188235294117647, -- [3]
							0, -- [4]
						},
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "ViksBar",
						["start_after_icon"] = false,
						["texture_custom"] = "",
						["texture_background"] = "ViksGloss",
						["alpha"] = 0.439999997615814,
						["textL_class_colors"] = true,
						["textR_class_colors"] = true,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = true,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["font_face"] = "Accidental Presidency",
						["texture_class_colors"] = false,
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 12,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "1 Pixel",
						},
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["height"] = 16,
					},
					["ignore_mass_showhide"] = false,
					["plugins_grow_direction"] = 1,
					["icon_desaturated"] = false,
					["desaturated_menu"] = true,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.05882352941176471,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.05882352941176471,
					["backdrop_texture"] = "ViksBlank",
					["color"] = {
						0.05882352941176471, -- [1]
						0.05882352941176471, -- [2]
						0.05882352941176471, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "New Gray",
					["following"] = {
						["enabled"] = false,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["StatusBarSaved"] = {
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 17,
								["textAlign"] = 3,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 17,
								["textAlign"] = 1,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["maxSectionIds"] = 17,
								["textAlign"] = 2,
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
					},
					["__was_opened"] = true,
					["switch_all_roles_after_wipe"] = false,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onleave"] = 1,
						["ignorebars"] = false,
						["iconstoo"] = true,
						["onenter"] = 1,
					},
					["switch_healer_in_combat"] = false,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = false,
					},
					["stretch_button_side"] = 1,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = true,
					["__snap"] = {
					},
					["bg_alpha"] = 0,
					["hide_in_combat_alpha"] = 0,
					["show_statusbar"] = false,
					["clickthrough_window"] = false,
					["libwindow"] = {
						["y"] = 0,
						["x"] = -341.077880859375,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.05882352941176471, -- [1]
							0.05882352941176471, -- [2]
							0.05882352941176471, -- [3]
						},
					},
					["bars_grow_direction"] = 1,
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["skin_custom"] = "",
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["switch_damager_in_combat"] = false,
					["grab_on_top"] = false,
					["micro_displays_locked"] = true,
					["clickthrough_rows"] = false,
					["auto_current"] = true,
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["switch_damager"] = false,
					["attribute_text"] = {
						["show_timer"] = true,
						["shadow"] = true,
						["side"] = 1,
						["text_color"] = {
							0.933333333333333, -- [1]
							0.933333333333333, -- [2]
							0.933333333333333, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Accidental Presidency",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["enabled"] = true,
						["enable_custom_text"] = false,
						["text_size"] = 12,
					},
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -502.0908584594727,
							["x"] = 536.0833740234375,
							["w"] = 165.9775390625,
							["h"] = 75.98710632324219,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["switch_tank_in_combat"] = false,
					["switch_tank"] = false,
					["wallpaper"] = {
						["enabled"] = false,
						["width"] = 266.000061035156,
						["texcoord"] = {
							0.00100000001490116, -- [1]
							1, -- [2]
							0.00100000001490116, -- [3]
							0.703000030517578, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.498038113117218, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.498039245605469,
						["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = true,
					["fontstrings_text3_anchor"] = 35,
					["use_multi_fontstrings"] = false,
					["bars_inverted"] = false,
				}, -- [1]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -410.0643768310547,
							["x"] = 536.0838623046875,
							["w"] = 167.9999237060547,
							["h"] = 69.99910736083984,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1.0001220703125,
							["w"] = 300,
							["h"] = 300,
						},
					},
					["show_statusbar"] = false,
					["menu_icons_size"] = 0.7999999523162842,
					["menu_anchor"] = {
						16, -- [1]
						-2, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.05882352941176471,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["skin_custom"] = "",
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = {
						"raid", -- [1]
						"DETAILS_PLUGIN_TINY_THREAT", -- [2]
						30, -- [3]
					},
					["clickthrough_toolbaricons"] = false,
					["clickthrough_rows"] = false,
					["switch_tank"] = {
						"raid", -- [1]
						"DETAILS_PLUGIN_TINY_THREAT", -- [2]
						30, -- [3]
					},
					["switch_all_roles_after_wipe"] = {
						4, -- [1]
						5, -- [2]
						26, -- [3]
					},
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = false,
					},
					["switch_damager"] = {
						"raid", -- [1]
						"DETAILS_PLUGIN_TINY_THREAT", -- [2]
						30, -- [3]
					},
					["show_sidebars"] = true,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.05882352941176471,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.05882352941176471,
					["switch_healer_in_combat"] = {
						4, -- [1]
						5, -- [2]
						26, -- [3]
					},
					["color"] = {
						0.05882352941176471, -- [1]
						0.05882352941176471, -- [2]
						0.05882352941176471, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "New Gray",
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = false,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = {
						2, -- [1]
						3, -- [2]
						11, -- [3]
					},
					["fontstrings_text2_anchor"] = 70,
					["__was_opened"] = true,
					["ignore_mass_showhide"] = false,
					["StatusBarSaved"] = {
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textAlign"] = 3,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 1,
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textStyle"] = 2,
								["textFace"] = "Accidental Presidency",
								["timeType"] = 1,
								["textXMod"] = 6,
								["textAlign"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
					},
					["plugins_grow_direction"] = 1,
					["attribute_text"] = {
						["show_timer"] = true,
						["shadow"] = true,
						["side"] = 1,
						["text_color"] = {
							0.933333333333333, -- [1]
							0.933333333333333, -- [2]
							0.933333333333333, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Accidental Presidency",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["enabled"] = true,
						["enable_custom_text"] = false,
						["text_size"] = 12,
					},
					["switch_tank_in_combat"] = {
						"raid", -- [1]
						"DETAILS_PLUGIN_TINY_THREAT", -- [2]
						30, -- [3]
					},
					["bg_alpha"] = 0,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = false,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["clickthrough_window"] = false,
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = true,
					["__snap"] = {
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["hide_in_combat_alpha"] = 0,
					["hide_in_combat_type"] = 1,
					["icon_desaturated"] = false,
					["libwindow"] = {
						["y"] = 95.02049255371094,
						["x"] = -340.066162109375,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.05882352941176471, -- [1]
							0.05882352941176471, -- [2]
							0.05882352941176471, -- [3]
						},
					},
					["fontstrings_text3_anchor"] = 35,
					["bars_grow_direction"] = 1,
					["backdrop_texture"] = "ViksBlank",
					["micro_displays_side"] = 2,
					["switch_damager_in_combat"] = {
						"raid", -- [1]
						"DETAILS_PLUGIN_TINY_THREAT", -- [2]
						30, -- [3]
					},
					["grab_on_top"] = false,
					["micro_displays_locked"] = true,
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["auto_current"] = true,
					["bars_sort_direction"] = 1,
					["desaturated_menu"] = true,
					["__snapV"] = false,
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -410.0643768310547,
							["x"] = 536.0838623046875,
							["w"] = 167.9999237060547,
							["h"] = 69.99910736083984,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1.0001220703125,
							["w"] = 300,
							["h"] = 300,
						},
					},
					["version"] = 3,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
						["textL_outline"] = true,
						["textR_outline_small"] = false,
						["textL_outline_small"] = false,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["textL_translit_text"] = true,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ViksUI\\Media\\textures\\Texture.tga",
						["textR_bracket"] = "(",
						["font_size"] = 14,
						["icon_file"] = "",
						["icon_grayscale"] = false,
						["use_spec_icons"] = false,
						["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
						["textR_enable_custom_text"] = false,
						["percent_type"] = 1,
						["fixed_texture_color"] = {
							0.301960784313726, -- [1]
							0.301960784313726, -- [2]
							0.8, -- [3]
							0.439999997615814, -- [4]
						},
						["textL_show_number"] = true,
						["textR_show_data"] = {
							true, -- [1]
							false, -- [2]
							false, -- [3]
						},
						["fixed_texture_background_color"] = {
							0.188235294117647, -- [1]
							0.188235294117647, -- [2]
							0.188235294117647, -- [3]
							0, -- [4]
						},
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "ViksBar",
						["start_after_icon"] = false,
						["texture_custom"] = "",
						["texture_background"] = "ViksGloss",
						["alpha"] = 0.439999997615814,
						["textL_class_colors"] = true,
						["textR_class_colors"] = true,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = true,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["font_face"] = "Accidental Presidency",
						["texture_class_colors"] = false,
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 12,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "1 Pixel",
						},
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["height"] = 16,
					},
					["wallpaper"] = {
						["enabled"] = false,
						["width"] = 266.000061035156,
						["texcoord"] = {
							0.00100000001490116, -- [1]
							1, -- [2]
							0.00100000001490116, -- [3]
							0.703000030517578, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.498038113117218, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.498039245605469,
						["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
					},
					["stretch_button_side"] = 1,
					["__snapH"] = false,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["use_multi_fontstrings"] = false,
					["bars_inverted"] = false,
				}, -- [2]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -457.0843734741211,
							["x"] = -537.149658203125,
							["w"] = 166.0000610351563,
							["h"] = 166.0000762939453,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["menu_icons_size"] = 0.7999999523162842,
					["menu_anchor"] = {
						16, -- [1]
						-2, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.05882352941176471,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["bars_sort_direction"] = 1,
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
						["textL_outline"] = true,
						["textR_outline_small"] = false,
						["textL_outline_small"] = false,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["textL_translit_text"] = true,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ViksUI\\Media\\textures\\Texture.tga",
						["textR_bracket"] = "(",
						["font_size"] = 14,
						["icon_file"] = "",
						["icon_grayscale"] = false,
						["use_spec_icons"] = false,
						["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
						["textR_enable_custom_text"] = false,
						["percent_type"] = 1,
						["fixed_texture_color"] = {
							0.301960784313726, -- [1]
							0.301960784313726, -- [2]
							0.8, -- [3]
							0.439999997615814, -- [4]
						},
						["textL_show_number"] = true,
						["textR_show_data"] = {
							true, -- [1]
							false, -- [2]
							false, -- [3]
						},
						["fixed_texture_background_color"] = {
							0.188235294117647, -- [1]
							0.188235294117647, -- [2]
							0.188235294117647, -- [3]
							0, -- [4]
						},
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "ViksBar",
						["start_after_icon"] = false,
						["texture_custom"] = "",
						["texture_background"] = "ViksGloss",
						["alpha"] = 0.439999997615814,
						["textL_class_colors"] = true,
						["textR_class_colors"] = true,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = true,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["font_face"] = "Accidental Presidency",
						["texture_class_colors"] = false,
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 12,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "1 Pixel",
						},
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["height"] = 16,
					},
					["ignore_mass_showhide"] = false,
					["plugins_grow_direction"] = 1,
					["icon_desaturated"] = false,
					["desaturated_menu"] = true,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.05882352941176471,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.05882352941176471,
					["backdrop_texture"] = "ViksBlank",
					["color"] = {
						0.05882352941176471, -- [1]
						0.05882352941176471, -- [2]
						0.05882352941176471, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "New Gray",
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = false,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["StatusBarSaved"] = {
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textAlign"] = 3,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE"] = {
								["isHidden"] = false,
								["textStyle"] = 2,
								["textYMod"] = 1,
								["segmentType"] = 2,
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 1,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textStyle"] = 2,
								["textFace"] = "Accidental Presidency",
								["timeType"] = 1,
								["textXMod"] = 6,
								["textAlign"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE",
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
					},
					["__was_opened"] = true,
					["switch_all_roles_after_wipe"] = false,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = false,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["switch_healer_in_combat"] = false,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = true,
					},
					["stretch_button_side"] = 1,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = true,
					["__snap"] = {
					},
					["bg_alpha"] = 0,
					["hide_in_combat_alpha"] = 0,
					["show_statusbar"] = false,
					["clickthrough_window"] = false,
					["libwindow"] = {
						["y"] = 0,
						["x"] = 340.0003051757813,
						["point"] = "BOTTOMLEFT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.05882352941176471, -- [1]
							0.05882352941176471, -- [2]
							0.05882352941176471, -- [3]
						},
					},
					["bars_grow_direction"] = 1,
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["skin_custom"] = "",
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["switch_damager_in_combat"] = false,
					["grab_on_top"] = false,
					["micro_displays_locked"] = true,
					["clickthrough_rows"] = false,
					["auto_current"] = true,
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["switch_damager"] = false,
					["attribute_text"] = {
						["show_timer"] = true,
						["shadow"] = true,
						["side"] = 1,
						["text_color"] = {
							0.933333333333333, -- [1]
							0.933333333333333, -- [2]
							0.933333333333333, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Accidental Presidency",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["enabled"] = true,
						["enable_custom_text"] = false,
						["text_size"] = 12,
					},
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -457.0843734741211,
							["x"] = -537.149658203125,
							["w"] = 166.0000610351563,
							["h"] = 166.0000762939453,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["switch_tank_in_combat"] = false,
					["switch_tank"] = false,
					["wallpaper"] = {
						["enabled"] = false,
						["width"] = 266.000061035156,
						["texcoord"] = {
							0.00100000001490116, -- [1]
							1, -- [2]
							0.00100000001490116, -- [3]
							0.703000030517578, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.498038113117218, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.498039245605469,
						["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = false,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = true,
					["fontstrings_text3_anchor"] = 35,
					["use_multi_fontstrings"] = false,
					["bars_inverted"] = false,
				}, -- [3]
			},
			["instances_no_libwindow"] = false,
			["deadlog_limit"] = 16,
			["instances_segments_locked"] = false,
		},
		["ViksUI_Line"] = {
			["show_arena_role_icon"] = false,
			["capture_real"] = {
				["heal"] = true,
				["spellcast"] = true,
				["miscdata"] = true,
				["aura"] = true,
				["energy"] = true,
				["damage"] = true,
			},
			["row_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["streamer_config"] = {
				["faster_updates"] = false,
				["quick_detection"] = false,
				["reset_spec_cache"] = false,
				["no_alerts"] = false,
				["use_animation_accel"] = true,
				["disable_mythic_dungeon"] = false,
			},
			["all_players_are_group"] = false,
			["use_row_animations"] = true,
			["report_heal_links"] = false,
			["remove_realm_from_name"] = true,
			["minimum_overall_combat_time"] = 10,
			["event_tracker"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["line_height"] = 16,
				["line_color"] = {
					0.1, -- [1]
					0.1, -- [2]
					0.1, -- [3]
					0.3, -- [4]
				},
				["font_shadow"] = "NONE",
				["font_size"] = 10,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = true,
					["strata"] = "LOW",
					["point"] = "BOTTOMRIGHT",
					["scale"] = 1,
					["width"] = 297.0075378417969,
					["y"] = 15.02555274963379,
					["x"] = -4.0003662109375,
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["height"] = 136.9745178222656,
					["locked"] = false,
				},
				["line_texture"] = "Details Serenity",
				["options_frame"] = {
				},
			},
			["report_to_who"] = "",
			["class_specs_coords"] = {
				[62] = {
					0.251953125, -- [1]
					0.375, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[63] = {
					0.375, -- [1]
					0.5, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[250] = {
					0, -- [1]
					0.125, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[251] = {
					0.125, -- [1]
					0.25, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[252] = {
					0.25, -- [1]
					0.375, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[253] = {
					0.875, -- [1]
					1, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[254] = {
					0, -- [1]
					0.125, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[255] = {
					0.125, -- [1]
					0.25, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[66] = {
					0.125, -- [1]
					0.25, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[257] = {
					0.5, -- [1]
					0.625, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[258] = {
					0.6328125, -- [1]
					0.75, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[259] = {
					0.75, -- [1]
					0.875, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[260] = {
					0.875, -- [1]
					1, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[577] = {
					0.25, -- [1]
					0.375, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[262] = {
					0.125, -- [1]
					0.25, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[581] = {
					0.375, -- [1]
					0.5, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[264] = {
					0.375, -- [1]
					0.5, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[265] = {
					0.5, -- [1]
					0.625, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[266] = {
					0.625, -- [1]
					0.75, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[267] = {
					0.75, -- [1]
					0.875, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[268] = {
					0.625, -- [1]
					0.75, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[269] = {
					0.875, -- [1]
					1, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[270] = {
					0.75, -- [1]
					0.875, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[70] = {
					0.251953125, -- [1]
					0.375, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[102] = {
					0.375, -- [1]
					0.5, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[71] = {
					0.875, -- [1]
					1, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[103] = {
					0.5, -- [1]
					0.625, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[72] = {
					0, -- [1]
					0.125, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[104] = {
					0.625, -- [1]
					0.75, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[73] = {
					0.125, -- [1]
					0.25, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[64] = {
					0.5, -- [1]
					0.625, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[105] = {
					0.75, -- [1]
					0.875, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[65] = {
					0, -- [1]
					0.125, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[256] = {
					0.375, -- [1]
					0.5, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[261] = {
					0, -- [1]
					0.125, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[263] = {
					0.25, -- [1]
					0.375, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
			},
			["profile_save_pos"] = true,
			["tooltip"] = {
				["header_statusbar"] = {
					0.3, -- [1]
					0.3, -- [2]
					0.3, -- [3]
					0.8, -- [4]
					false, -- [5]
					false, -- [6]
					"WorldState Score", -- [7]
				},
				["fontcolor_right"] = {
					1, -- [1]
					0.7, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["line_height"] = 17,
				["tooltip_max_targets"] = 2,
				["icon_size"] = {
					["W"] = 17,
					["H"] = 17,
				},
				["tooltip_max_pets"] = 2,
				["anchor_relative"] = "top",
				["abbreviation"] = 2,
				["anchored_to"] = 1,
				["show_amount"] = false,
				["header_text_color"] = {
					1, -- [1]
					0.9176, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["fontsize"] = 10,
				["background"] = {
					0.196, -- [1]
					0.196, -- [2]
					0.196, -- [3]
					0.8, -- [4]
				},
				["submenu_wallpaper"] = true,
				["fontsize_title"] = 10,
				["icon_border_texcoord"] = {
					["B"] = 0.921875,
					["L"] = 0.078125,
					["T"] = 0.078125,
					["R"] = 0.921875,
				},
				["commands"] = {
				},
				["tooltip_max_abilities"] = 6,
				["fontface"] = "Friz Quadrata TT",
				["border_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["border_texture"] = "Details BarBorder 3",
				["anchor_offset"] = {
					0, -- [1]
					0, -- [2]
				},
				["fontshadow"] = false,
				["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
				["border_size"] = 14,
				["maximize_method"] = 1,
				["anchor_screen_pos"] = {
					507.7, -- [1]
					-350.5, -- [2]
				},
				["anchor_point"] = "bottom",
				["menus_bg_coords"] = {
					0.309777336120606, -- [1]
					0.924000015258789, -- [2]
					0.213000011444092, -- [3]
					0.279000015258789, -- [4]
				},
				["fontcolor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["menus_bg_color"] = {
					0.8, -- [1]
					0.8, -- [2]
					0.8, -- [3]
					0.2, -- [4]
				},
			},
			["ps_abbreviation"] = 3,
			["world_combat_is_trash"] = false,
			["update_speed"] = 0.2,
			["bookmark_text_size"] = 11,
			["animation_speed_mintravel"] = 0.45,
			["track_item_level"] = true,
			["windows_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["instances_menu_click_to_open"] = false,
			["overall_clear_newchallenge"] = true,
			["current_dps_meter"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["arena_enabled"] = true,
				["font_shadow"] = "NONE",
				["font_size"] = 18,
				["mythic_dungeon_enabled"] = true,
				["sample_size"] = 5,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = false,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["locked"] = false,
					["height"] = 65,
					["width"] = 220,
				},
				["update_interval"] = 0.3,
				["options_frame"] = {
				},
			},
			["data_cleanup_logout"] = false,
			["instances_disable_bar_highlight"] = false,
			["trash_concatenate"] = false,
			["color_by_arena_team"] = true,
			["animation_speed"] = 33,
			["disable_stretch_from_toolbar"] = false,
			["disable_lock_ungroup_buttons"] = false,
			["memory_ram"] = 64,
			["disable_window_groups"] = true,
			["instances_suppress_trash"] = 0,
			["options_window"] = {
				["scale"] = 1,
			},
			["animation_speed_maxtravel"] = 3,
			["time_type_original"] = 2,
			["default_bg_alpha"] = 0.5,
			["font_faces"] = {
				["menus"] = "ViksFont",
			},
			["time_type"] = 2,
			["death_tooltip_width"] = 350,
			["animate_scroll"] = false,
			["segments_amount"] = 18,
			["report_lines"] = 5,
			["clear_ungrouped"] = true,
			["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
			["skin"] = "WoW Interface",
			["override_spellids"] = true,
			["pvp_as_group"] = true,
			["force_activity_time_pvp"] = true,
			["numerical_system"] = 1,
			["player_details_window"] = {
				["scale"] = 1,
				["bar_texture"] = "Skyline",
				["skin"] = "ElvUI",
			},
			["minimum_combat_time"] = 5,
			["chat_tab_embed"] = {
				["enabled"] = false,
				["tab_name"] = "",
				["x_offset"] = 0,
				["w1_pos"] = {
					["point"] = "CENTER",
					["scale"] = 1,
					["y_legacy"] = 212.00048828125,
					["w"] = 309.999938964844,
					["y"] = 212.000457763672,
					["h"] = 157.999984741211,
					["pos_table"] = true,
					["x"] = -361.000396728516,
					["x_legacy"] = -361.000366210938,
				},
				["w2_pos"] = {
					["point"] = "TOP",
					["scale"] = 1,
					["y_legacy"] = 236.000305175781,
					["w"] = 309.999938964844,
					["y"] = -224.999694824219,
					["h"] = 157.999984741211,
					["pos_table"] = true,
					["x"] = 40.9999389648438,
					["x_legacy"] = 41.0000610351563,
				},
				["y_offset"] = 0,
				["single_window"] = false,
			},
			["cloud_capture"] = true,
			["damage_taken_everything"] = false,
			["scroll_speed"] = 2,
			["new_window_size"] = {
				["height"] = 158,
				["width"] = 310,
			},
			["memory_threshold"] = 3,
			["deadlog_events"] = 32,
			["window_clamp"] = {
				-8, -- [1]
				0, -- [2]
				21, -- [3]
				-14, -- [4]
			},
			["close_shields"] = false,
			["class_coords"] = {
				["HUNTER"] = {
					0, -- [1]
					0.25, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["WARRIOR"] = {
					0, -- [1]
					0.25, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["SHAMAN"] = {
					0.25, -- [1]
					0.49609375, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["MAGE"] = {
					0.25, -- [1]
					0.49609375, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["PET"] = {
					0.25, -- [1]
					0.49609375, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["DRUID"] = {
					0.7421875, -- [1]
					0.98828125, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["MONK"] = {
					0.5, -- [1]
					0.73828125, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["DEATHKNIGHT"] = {
					0.25, -- [1]
					0.5, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["MONSTER"] = {
					0, -- [1]
					0.25, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["UNKNOW"] = {
					0.5, -- [1]
					0.75, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["PRIEST"] = {
					0.49609375, -- [1]
					0.7421875, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["ROGUE"] = {
					0.49609375, -- [1]
					0.7421875, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["Alliance"] = {
					0.49609375, -- [1]
					0.7421875, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["WARLOCK"] = {
					0.7421875, -- [1]
					0.98828125, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["DEMONHUNTER"] = {
					0.73828126, -- [1]
					1, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["Horde"] = {
					0.7421875, -- [1]
					0.98828125, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["PALADIN"] = {
					0, -- [1]
					0.25, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["UNGROUPPLAYER"] = {
					0.5, -- [1]
					0.75, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["ENEMY"] = {
					0, -- [1]
					0.25, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
			},
			["overall_flag"] = 16,
			["disable_alldisplays_window"] = false,
			["numerical_system_symbols"] = "auto",
			["class_colors"] = {
				["HUNTER"] = {
					0.67, -- [1]
					0.83, -- [2]
					0.45, -- [3]
				},
				["WARRIOR"] = {
					0.78, -- [1]
					0.61, -- [2]
					0.43, -- [3]
				},
				["SHAMAN"] = {
					0, -- [1]
					0.44, -- [2]
					0.87, -- [3]
				},
				["MAGE"] = {
					0.41, -- [1]
					0.8, -- [2]
					0.94, -- [3]
				},
				["ARENA_YELLOW"] = {
					1, -- [1]
					1, -- [2]
					0.25, -- [3]
				},
				["UNGROUPPLAYER"] = {
					0.4, -- [1]
					0.4, -- [2]
					0.4, -- [3]
				},
				["DRUID"] = {
					1, -- [1]
					0.49, -- [2]
					0.04, -- [3]
				},
				["MONK"] = {
					0, -- [1]
					1, -- [2]
					0.59, -- [3]
				},
				["DEATHKNIGHT"] = {
					0.77, -- [1]
					0.12, -- [2]
					0.23, -- [3]
				},
				["ARENA_GREEN"] = {
					0.4, -- [1]
					1, -- [2]
					0.4, -- [3]
				},
				["UNKNOW"] = {
					0.2, -- [1]
					0.2, -- [2]
					0.2, -- [3]
				},
				["PRIEST"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["WARLOCK"] = {
					0.58, -- [1]
					0.51, -- [2]
					0.79, -- [3]
				},
				["PET"] = {
					0.3, -- [1]
					0.4, -- [2]
					0.5, -- [3]
				},
				["ENEMY"] = {
					0.94117, -- [1]
					0, -- [2]
					0.0196, -- [3]
					1, -- [4]
				},
				["DEMONHUNTER"] = {
					0.64, -- [1]
					0.19, -- [2]
					0.79, -- [3]
				},
				["version"] = 1,
				["NEUTRAL"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
				},
				["PALADIN"] = {
					0.96, -- [1]
					0.55, -- [2]
					0.73, -- [3]
				},
				["ROGUE"] = {
					1, -- [1]
					0.96, -- [2]
					0.41, -- [3]
				},
			},
			["hotcorner_topleft"] = {
				["hide"] = false,
			},
			["broadcaster_enabled"] = false,
			["clear_graphic"] = true,
			["total_abbreviation"] = 2,
			["segments_auto_erase"] = 1,
			["options_group_edit"] = false,
			["segments_amount_to_save"] = 18,
			["minimap"] = {
				["onclick_what_todo"] = 1,
				["radius"] = 160,
				["text_type"] = 1,
				["minimapPos"] = 220,
				["text_format"] = 3,
				["hide"] = false,
			},
			["instances_amount"] = 5,
			["max_window_size"] = {
				["height"] = 450,
				["width"] = 480,
			},
			["default_bg_color"] = 0.0941,
			["only_pvp_frags"] = false,
			["disable_stretch_button"] = false,
			["deny_score_messages"] = false,
			["animation_speed_triggertravel"] = 5,
			["trash_auto_remove"] = true,
			["segments_panic_mode"] = false,
			["standard_skin"] = false,
			["windows_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["row_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["overall_clear_newboss"] = true,
			["font_sizes"] = {
				["menus"] = 10,
			},
			["overall_clear_logout"] = false,
			["report_schema"] = 1,
			["use_scroll"] = false,
			["use_battleground_server_parser"] = false,
			["disable_reset_button"] = false,
			["data_broker_text"] = "",
			["instances"] = {
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -401.5713806152344,
							["x"] = 859.1461181640625,
							["w"] = 172.0000610351563,
							["h"] = 54.99678039550781,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["show_statusbar"] = false,
					["menu_icons_size"] = 0.7999999523162842,
					["menu_anchor"] = {
						11, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.05882352941176471,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["skin_custom"] = "",
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = {
						"raid", -- [1]
						"DETAILS_PLUGIN_TINY_THREAT", -- [2]
						30, -- [3]
					},
					["clickthrough_toolbaricons"] = false,
					["clickthrough_rows"] = false,
					["switch_tank"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["switch_all_roles_after_wipe"] = {
						1, -- [1]
						3, -- [2]
						3, -- [3]
					},
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -3,
						["shadow"] = false,
					},
					["switch_damager"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["show_sidebars"] = true,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.05882352941176471,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.05882352941176471,
					["switch_healer_in_combat"] = {
						"raid", -- [1]
						"DETAILS_PLUGIN_TINY_THREAT", -- [2]
						30, -- [3]
					},
					["color"] = {
						0.05882352941176471, -- [1]
						0.05882352941176471, -- [2]
						0.05882352941176471, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "New Gray",
					["following"] = {
						["enabled"] = false,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["fontstrings_text2_anchor"] = 70,
					["__snapV"] = false,
					["__snapH"] = false,
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textYMod"] = 1,
								["textAlign"] = 3,
								["timeType"] = 1,
								["textSize"] = 10,
								["maxSectionIds"] = 17,
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textYMod"] = 1,
								["textAlign"] = 1,
								["timeType"] = 1,
								["textSize"] = 10,
								["maxSectionIds"] = 17,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textYMod"] = 1,
								["textAlign"] = 2,
								["timeType"] = 1,
								["textSize"] = 10,
								["maxSectionIds"] = 17,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["switch_damager_in_combat"] = {
						"raid", -- [1]
						"DETAILS_PLUGIN_TINY_THREAT", -- [2]
						30, -- [3]
					},
					["__was_opened"] = true,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["bg_alpha"] = 0,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = false,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["plugins_grow_direction"] = 1,
					["attribute_text"] = {
						["enabled"] = true,
						["shadow"] = true,
						["side"] = 1,
						["text_size"] = 10,
						["custom_text"] = "{name}",
						["text_face"] = "Hooge",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["text_color"] = {
							0, -- [1]
							0.7019607843137254, -- [2]
							0.9372549019607843, -- [3]
							1, -- [4]
						},
						["enable_custom_text"] = false,
						["show_timer"] = true,
					},
					["clickthrough_window"] = false,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = true,
					["__snap"] = {
						[2] = 2,
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["hide_in_combat_alpha"] = 0,
					["auto_hide_menu"] = {
						["left"] = true,
						["right"] = false,
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["libwindow"] = {
						["y"] = 111.0146408081055,
						["x"] = -15.0037841796875,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.05882352941176471, -- [1]
							0.05882352941176471, -- [2]
							0.05882352941176471, -- [3]
						},
					},
					["hide_in_combat_type"] = 1,
					["bars_grow_direction"] = 1,
					["fontstrings_text3_anchor"] = 35,
					["backdrop_texture"] = "Solid",
					["micro_displays_side"] = 2,
					["grab_on_top"] = false,
					["micro_displays_locked"] = true,
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["auto_current"] = true,
					["bars_sort_direction"] = 1,
					["desaturated_menu"] = true,
					["icon_desaturated"] = false,
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -401.5713806152344,
							["x"] = 859.1461181640625,
							["w"] = 172.0000610351563,
							["h"] = 54.99678039550781,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["version"] = 3,
					["row_info"] = {
						["textR_outline"] = false,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
						["textL_outline"] = false,
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textL_outline_small"] = true,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ViksUI\\Media\\Font\\1.ttf",
						["backdrop"] = {
							["enabled"] = false,
							["texture"] = "1 Pixel",
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["size"] = 12,
						},
						["font_size"] = 10,
						["textL_translit_text"] = false,
						["height"] = 17,
						["texture_file"] = "Interface\\AddOns\\Details\\images\\bar_background",
						["texture_custom_file"] = "Interface\\",
						["textR_bracket"] = "(",
						["icon_file"] = "",
						["icon_grayscale"] = false,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["use_spec_icons"] = false,
						["textR_enable_custom_text"] = false,
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["fixed_texture_color"] = {
							0.301960784313726, -- [1]
							0.301960784313726, -- [2]
							0.8, -- [3]
							0.439999997615814, -- [4]
						},
						["textL_show_number"] = true,
						["texture"] = "DGround",
						["percent_type"] = 1,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["fixed_texture_background_color"] = {
							0.188235294117647, -- [1]
							0.188235294117647, -- [2]
							0.188235294117647, -- [3]
							0, -- [4]
						},
						["textR_outline_small"] = true,
						["texture_custom"] = "",
						["texture_background"] = "Armory",
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["textL_class_colors"] = true,
						["textR_class_colors"] = true,
						["alpha"] = 0.439999997615814,
						["no_icon"] = true,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["font_face"] = "ViksFont",
						["texture_class_colors"] = false,
						["start_after_icon"] = false,
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["texture_background_file"] = "Interface\\Addons\\SharedMedia\\statusbar\\Armory",
					},
					["wallpaper"] = {
						["enabled"] = false,
						["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
						["texcoord"] = {
							0.00100000001490116, -- [1]
							1, -- [2]
							0.00100000001490116, -- [3]
							0.703000030517578, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.498038113117218, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.498039245605469,
						["width"] = 266.000061035156,
					},
					["stretch_button_side"] = 2,
					["ignore_mass_showhide"] = false,
					["switch_tank_in_combat"] = {
						"raid", -- [1]
						"DETAILS_PLUGIN_TINY_THREAT", -- [2]
						30, -- [3]
					},
					["use_multi_fontstrings"] = false,
					["bars_inverted"] = false,
				}, -- [1]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -476.5681686401367,
							["x"] = 859.1461181640625,
							["w"] = 172.0000610351563,
							["h"] = 54.99678039550781,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["clickthrough_window"] = false,
					["menu_anchor"] = {
						11, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.5176470588235293,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["micro_displays_locked"] = true,
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["row_info"] = {
						["textR_outline"] = false,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
						["textL_outline"] = false,
						["textR_outline_small"] = true,
						["textR_show_data"] = {
							false, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ViksUI\\Media\\Font\\1.ttf",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["font_size"] = 10,
						["textL_translit_text"] = false,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\Details\\images\\bar_background",
						["height"] = 17,
						["textR_bracket"] = "(",
						["icon_file"] = "",
						["icon_grayscale"] = false,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["texture_background_file"] = "Interface\\Addons\\SharedMedia\\statusbar\\Armory",
						["textR_enable_custom_text"] = false,
						["backdrop"] = {
							["enabled"] = false,
							["texture"] = "1 Pixel",
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["size"] = 12,
						},
						["fixed_texture_color"] = {
							0.301960784313726, -- [1]
							0.301960784313726, -- [2]
							0.8, -- [3]
							0.439999997615814, -- [4]
						},
						["textL_show_number"] = true,
						["fixed_texture_background_color"] = {
							0.1882352941176471, -- [1]
							0.1882352941176471, -- [2]
							0.1882352941176471, -- [3]
							0, -- [4]
						},
						["percent_type"] = 1,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "DGround",
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["texture_custom"] = "",
						["textL_class_colors"] = true,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["textR_class_colors"] = true,
						["texture_background"] = "Armory",
						["alpha"] = 0.439999997615814,
						["no_icon"] = true,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["textL_outline_small"] = true,
						["font_face"] = "ViksFont",
						["texture_class_colors"] = false,
						["start_after_icon"] = false,
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["use_spec_icons"] = false,
					},
					["switch_tank"] = false,
					["plugins_grow_direction"] = 1,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -3,
						["shadow"] = true,
					},
					["desaturated_menu"] = true,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.5176470588235293,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.5176470588235293,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "New Gray",
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = false,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["__snapV"] = false,
					["__snapH"] = false,
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textAlign"] = 3,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textFace"] = "Accidental Presidency",
								["textXMod"] = 0,
								["textAlign"] = 1,
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textStyle"] = 2,
								["textXMod"] = 6,
								["textAlign"] = 2,
								["textFace"] = "Accidental Presidency",
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["grab_on_top"] = false,
					["__was_opened"] = true,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["bg_alpha"] = 0,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = false,
					["menu_alpha"] = {
						["enabled"] = false,
						["onleave"] = 1,
						["ignorebars"] = false,
						["iconstoo"] = true,
						["onenter"] = 1,
					},
					["switch_all_roles_after_wipe"] = {
						1, -- [1]
						3, -- [2]
						3, -- [3]
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["bars_inverted"] = false,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = true,
					["__snap"] = {
						[4] = 1,
					},
					["stretch_button_side"] = 2,
					["hide_in_combat_alpha"] = 0,
					["icon_desaturated"] = false,
					["show_statusbar"] = false,
					["libwindow"] = {
						["y"] = 36.01785278320313,
						["x"] = -15.0037841796875,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
						},
					},
					["backdrop_texture"] = "None",
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["switch_damager"] = false,
					["switch_tank_in_combat"] = false,
					["bars_grow_direction"] = 1,
					["switch_damager_in_combat"] = false,
					["bars_sort_direction"] = 1,
					["clickthrough_rows"] = false,
					["auto_current"] = true,
					["auto_hide_menu"] = {
						["left"] = true,
						["right"] = false,
					},
					["version"] = 3,
					["attribute_text"] = {
						["show_timer"] = true,
						["shadow"] = true,
						["side"] = 1,
						["text_color"] = {
							0.03529411764705882, -- [1]
							0.7803921568627451, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Hooge",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["text_size"] = 10,
						["enable_custom_text"] = false,
						["enabled"] = true,
					},
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -476.5681686401367,
							["x"] = 859.1461181640625,
							["w"] = 172.0000610351563,
							["h"] = 54.99678039550781,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["skin_custom"] = "",
					["ignore_mass_showhide"] = false,
					["wallpaper"] = {
						["enabled"] = false,
						["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
						["texcoord"] = {
							0.00100000001490116, -- [1]
							1, -- [2]
							0.00100000001490116, -- [3]
							0.703000030517578, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.498038113117218, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.498039245605469,
						["width"] = 266.000061035156,
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = false,
					["fontstrings_text3_anchor"] = 35,
					["use_multi_fontstrings"] = false,
					["menu_icons_size"] = 0.7999999523162842,
				}, -- [2]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -447.5756683349609,
							["x"] = 662.6962890625,
							["w"] = 209.0072937011719,
							["h"] = 147.0111389160156,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["clickthrough_window"] = false,
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.05882352941176471,
					["hide_out_of_combat"] = false,
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["micro_displays_locked"] = true,
					["fontstrings_width"] = 35,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["switch_all_roles_in_combat"] = false,
					["clickthrough_toolbaricons"] = false,
					["row_info"] = {
						["textR_outline"] = false,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
						["textL_outline"] = false,
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textL_outline_small"] = true,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							0.03529411764705882, -- [1]
							0.7803921568627451, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\AddOns\\ViksUI\\Media\\Font\\1.ttf",
						["backdrop"] = {
							["enabled"] = false,
							["texture"] = "1 Pixel",
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["size"] = 12,
						},
						["font_size"] = 10,
						["textL_translit_text"] = false,
						["height"] = 16,
						["texture_file"] = "Interface\\AddOns\\Details\\images\\bar_background",
						["texture_custom_file"] = "Interface\\",
						["textR_bracket"] = "(",
						["icon_file"] = "",
						["icon_grayscale"] = false,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["use_spec_icons"] = false,
						["textR_enable_custom_text"] = false,
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["fixed_texture_color"] = {
							0.301960784313726, -- [1]
							0.301960784313726, -- [2]
							0.8, -- [3]
							0.439999997615814, -- [4]
						},
						["textL_show_number"] = true,
						["texture"] = "DGround",
						["percent_type"] = 1,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["fixed_texture_background_color"] = {
							0.188235294117647, -- [1]
							0.188235294117647, -- [2]
							0.188235294117647, -- [3]
							0, -- [4]
						},
						["textR_outline_small"] = true,
						["texture_custom"] = "",
						["texture_background"] = "Armory",
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["textL_class_colors"] = true,
						["textR_class_colors"] = true,
						["alpha"] = 0.439999997615814,
						["no_icon"] = true,
						["icon_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["textR_show_data"] = {
							true, -- [1]
							false, -- [2]
							false, -- [3]
						},
						["font_face"] = "ViksFont",
						["texture_class_colors"] = false,
						["start_after_icon"] = false,
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["texture_background_file"] = "Interface\\Addons\\SharedMedia\\statusbar\\Armory",
					},
					["switch_tank"] = false,
					["plugins_grow_direction"] = 1,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = true,
					},
					["desaturated_menu"] = true,
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["hide_icon"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.05882352941176471,
					["menu_icons_alpha"] = 0.5,
					["bg_b"] = 0.05882352941176471,
					["switch_healer_in_combat"] = false,
					["color"] = {
						0.05882352941176471, -- [1]
						0.05882352941176471, -- [2]
						0.05882352941176471, -- [3]
						0, -- [4]
					},
					["hide_on_context"] = {
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [1]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [2]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [3]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [4]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [5]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [6]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [7]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [8]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [9]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [10]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [11]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [12]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [13]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [14]
						{
							["enabled"] = false,
							["inverse"] = false,
							["value"] = 100,
						}, -- [15]
					},
					["skin"] = "New Gray",
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = false,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["switch_healer"] = false,
					["fontstrings_text2_anchor"] = 70,
					["__snapV"] = false,
					["__snapH"] = false,
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textAlign"] = 3,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE"] = {
								["isHidden"] = false,
								["textStyle"] = 2,
								["textYMod"] = 1,
								["segmentType"] = 2,
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 1,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textStyle"] = 2,
								["textXMod"] = 6,
								["textAlign"] = 2,
								["textFace"] = "Accidental Presidency",
								["timeType"] = 1,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE",
					},
					["grab_on_top"] = false,
					["__was_opened"] = true,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["fontstrings_text4_anchor"] = 0,
					["__locked"] = false,
					["menu_alpha"] = {
						["enabled"] = false,
						["onleave"] = 1,
						["ignorebars"] = false,
						["iconstoo"] = true,
						["onenter"] = 1,
					},
					["switch_all_roles_after_wipe"] = false,
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["bars_inverted"] = false,
					["strata"] = "LOW",
					["clickthrough_incombatonly"] = true,
					["__snap"] = {
					},
					["stretch_button_side"] = 2,
					["hide_in_combat_alpha"] = 0,
					["bars_sort_direction"] = 1,
					["show_statusbar"] = false,
					["libwindow"] = {
						["y"] = 19.0031795501709,
						["x"] = -192.9500732421875,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.05882352941176471, -- [1]
							0.05882352941176471, -- [2]
							0.05882352941176471, -- [3]
						},
					},
					["backdrop_texture"] = "Solid",
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["bg_alpha"] = 0,
					["switch_tank_in_combat"] = false,
					["bars_grow_direction"] = 1,
					["switch_damager_in_combat"] = false,
					["icon_desaturated"] = false,
					["clickthrough_rows"] = false,
					["auto_current"] = true,
					["attribute_text"] = {
						["enabled"] = true,
						["shadow"] = true,
						["side"] = 1,
						["text_size"] = 10,
						["custom_text"] = "{name}",
						["text_face"] = "Hooge",
						["anchor"] = {
							-18, -- [1]
							3, -- [2]
						},
						["text_color"] = {
							0.03529411764705882, -- [1]
							0.7803921568627451, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["enable_custom_text"] = false,
						["show_timer"] = true,
					},
					["auto_hide_menu"] = {
						["left"] = true,
						["right"] = false,
					},
					["switch_damager"] = false,
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -447.5756683349609,
							["x"] = 662.6962890625,
							["w"] = 209.0072937011719,
							["h"] = 147.0111389160156,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["skin_custom"] = "",
					["ignore_mass_showhide"] = false,
					["wallpaper"] = {
						["enabled"] = false,
						["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
						["texcoord"] = {
							0.00100000001490116, -- [1]
							1, -- [2]
							0.00100000001490116, -- [3]
							0.703000030517578, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.498038113117218, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.498039245605469,
						["width"] = 266.000061035156,
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = true,
					["fontstrings_text3_anchor"] = 35,
					["use_multi_fontstrings"] = false,
					["menu_icons_size"] = 0.8500000238418579,
				}, -- [3]
			},
			["instances_no_libwindow"] = false,
			["deadlog_limit"] = 16,
			["instances_segments_locked"] = false,
		},
	},
	["immersion_special_units"] = true,
	["boss_mods_timers"] = {
		["encounter_timers_bw"] = {
		},
		["encounter_timers_dbm"] = {
		},
	},
	["spell_school_cache"] = {
	},
	["deathlog_healingdone_min"] = 1,
	["tutorial"] = {
		["bookmark_tutorial"] = false,
		["main_help_button"] = 78,
		["FULL_DELETE_WINDOW"] = true,
		["WINDOW_GROUP_MAKING1"] = true,
		["DETAILS_INFO_TUTORIAL1"] = true,
		["alert_frames"] = {
			false, -- [1]
			false, -- [2]
			false, -- [3]
			false, -- [4]
			false, -- [5]
			false, -- [6]
		},
		["FORGE_TUTORIAL"] = true,
		["ATTRIBUTE_SELECT_TUTORIAL1"] = true,
		["ctrl_click_close_tutorial"] = false,
		["logons"] = 78,
		["OPTIONS_PANEL_OPENED"] = true,
		["version_announce"] = 0,
		["WINDOW_LOCK_UNLOCK1"] = true,
		["unlock_button"] = 4,
		["SWITCH_PANEL_FIRST_OPENED"] = true,
	},
	["plater"] = {
		["realtime_dps_enabled"] = false,
		["damage_taken_shadow"] = true,
		["realtime_dps_player_shadow"] = true,
		["damage_taken_enabled"] = false,
		["realtime_dps_player_size"] = 12,
		["damage_taken_size"] = 12,
		["realtime_dps_color"] = {
			1, -- [1]
			1, -- [2]
			0, -- [3]
			1, -- [4]
		},
		["realtime_dps_anchor"] = {
			["y"] = 0,
			["x"] = 0,
			["side"] = 7,
		},
		["damage_taken_anchor"] = {
			["y"] = 0,
			["x"] = 0,
			["side"] = 7,
		},
		["realtime_dps_size"] = 12,
		["damage_taken_color"] = {
			1, -- [1]
			1, -- [2]
			0, -- [3]
			1, -- [4]
		},
		["realtime_dps_player_color"] = {
			1, -- [1]
			1, -- [2]
			0, -- [3]
			1, -- [4]
		},
		["realtime_dps_player_anchor"] = {
			["y"] = 0,
			["x"] = 0,
			["side"] = 7,
		},
		["realtime_dps_player_enabled"] = false,
		["realtime_dps_shadow"] = true,
	},
	["report_where"] = "SAY",
	["mythic_plus"] = {
		["make_overall_boss_only"] = false,
		["mythicrun_chart_frame"] = {
		},
		["merge_boss_trash"] = true,
		["delay_to_show_graphic"] = 5,
		["always_in_combat"] = false,
		["make_overall_when_done"] = true,
		["delete_trash_after_merge"] = true,
		["show_damage_graphic"] = true,
		["mythicrun_chart_frame_ready"] = {
		},
		["boss_dedicated_segment"] = true,
		["mythicrun_chart_frame_minimized"] = {
		},
		["last_mythicrun_chart"] = {
		},
	},
	["last_changelog_size"] = 1861,
	["run_code"] = {
		["on_groupchange"] = "\n-- this code runs when the player enter or leave a group",
		["on_zonechanged"] = "\n-- when the player changes zone, this code will run",
		["on_init"] = "\n-- code to run when Details! initializes, put here code which only will run once\n-- this also will run then the profile is changed\n\n--size of the death log tooltip in the Deaths display (default 350)\nDetails.death_tooltip_width = 350;\n\n--when in arena or battleground, details! silently switch to activity time (goes back to the old setting on leaving, default true)\nDetails.force_activity_time_pvp = true;\n\n--speed of the bar animations (default 33)\nDetails.animation_speed = 33;\n\n--threshold to trigger slow or fast speed (default 0.45)\nDetails.animation_speed_mintravel = 0.45;\n\n--call to update animations\nDetails:RefreshAnimationFunctions();\n\n--max window size, does require a /reload to work (default 480 x 450)\nDetails.max_window_size.width = 480;\nDetails.max_window_size.height = 450;\n\n--use the arena team color as the class color (default true)\nDetails.color_by_arena_team = true;\n\n--use the role icon in the player bar when inside an arena (default false)\nDetails.show_arena_role_icon = false;\n\n--how much time the update warning is shown (default 10)\nDetails.update_warning_timeout = 10;",
		["on_leavecombat"] = "\n-- this code runs when the player leave combat",
		["on_specchanged"] = "\n-- run when the player changes its spec",
		["on_entercombat"] = "\n-- this code runs when the player enters in combat",
	},
	["spellid_ignored"] = {
	},
	["damage_scroll_position"] = {
	},
	["plugin_window_pos"] = {
		["y"] = -57.00164794921875,
		["x"] = -91.51127624511719,
		["point"] = "TOP",
		["scale"] = 1,
	},
	["show_totalhitdamage_on_overkill"] = false,
	["createauraframe"] = {
		["y"] = 7.62939453125e-06,
		["x"] = -3.0517578125e-05,
		["point"] = "CENTER",
		["scale"] = 1,
	},
	["item_level_pool"] = {
	},
	["global_plugin_database"] = {
		["DETAILS_PLUGIN_ENCOUNTER_DETAILS"] = {
			["encounter_timers_bw"] = {
			},
			["encounter_timers_dbm"] = {
			},
		},
	},
	["savedCustomSpells"] = {
		{
			1, -- [1]
			"Melee", -- [2]
			"Interface\\ICONS\\INV_Sword_04", -- [3]
		}, -- [1]
		{
			2, -- [1]
			"Auto Shot", -- [2]
			"Interface\\ICONS\\INV_Weapon_Bow_07", -- [3]
		}, -- [2]
		{
			4, -- [1]
			"Environment (Drowning)", -- [2]
			"Interface\\ICONS\\Ability_Suffocate", -- [3]
		}, -- [3]
		{
			8, -- [1]
			"Environment (Slime)", -- [2]
			"Interface\\ICONS\\Ability_Creature_Poison_02", -- [3]
		}, -- [4]
		{
			88082, -- [1]
			"Fireball (Mirror Image)", -- [2]
			135812, -- [3]
		}, -- [5]
		{
			94472, -- [1]
			"Atonement (critical)", -- [2]
			135887, -- [3]
		}, -- [6]
		{
			59638, -- [1]
			"Frostbolt (Mirror Image)", -- [2]
			135846, -- [3]
		}, -- [7]
		{
			5, -- [1]
			"Environment (Fatigue)", -- [2]
			"Interface\\ICONS\\Spell_Arcane_MindMastery", -- [3]
		}, -- [8]
		{
			158336, -- [1]
			"Pulverize (wave #1)", -- [2]
			135242, -- [3]
		}, -- [9]
		{
			3, -- [1]
			"Environment (Falling)", -- [2]
			"Interface\\ICONS\\Spell_Magic_FeatherFall", -- [3]
		}, -- [10]
		{
			6, -- [1]
			"Environment (Fire)", -- [2]
			"Interface\\ICONS\\INV_SummerFest_FireSpirit", -- [3]
		}, -- [11]
		{
			224078, -- [1]
			"Devilsaur Shock Leash (trinket)", -- [2]
			136048, -- [3]
		}, -- [12]
		{
			214350, -- [1]
			"Nightmare Essence (trinket)", -- [2]
			1357816, -- [3]
		}, -- [13]
		{
			44461, -- [1]
			"Living Bomb (explosion)", -- [2]
			236220, -- [3]
		}, -- [14]
		{
			213786, -- [1]
			"Nightfall (trinket)", -- [2]
			236168, -- [3]
		}, -- [15]
		{
			120761, -- [1]
			"Glaive Toss (Glaive #2)", -- [2]
			132330, -- [3]
		}, -- [16]
		{
			121414, -- [1]
			"Glaive Toss (Glaive #1)", -- [2]
			132330, -- [3]
		}, -- [17]
		{
			33778, -- [1]
			"Lifebloom (bloom)", -- [2]
			134206, -- [3]
		}, -- [18]
		{
			7, -- [1]
			"Environment (Lava)", -- [2]
			"Interface\\ICONS\\Ability_Rhyolith_Volcano", -- [3]
		}, -- [19]
		{
			158420, -- [1]
			"Pulverize (wave #3)", -- [2]
			135242, -- [3]
		}, -- [20]
		{
			158417, -- [1]
			"Pulverize (wave #2)", -- [2]
			135242, -- [3]
		}, -- [21]
		{
			161612, -- [1]
			"Overflowing Energy (caught)", -- [2]
			841219, -- [3]
		}, -- [22]
		{
			98021, -- [1]
			"Health Exchange", -- [2]
			237586, -- [3]
		}, -- [23]
		{
			161576, -- [1]
			"Overflowing Energy (explosion)", -- [2]
			841219, -- [3]
		}, -- [24]
		{
			55090, -- [1]
			"Scourge Strike (Physical)", -- [2]
			237530, -- [3]
		}, -- [25]
		{
			49184, -- [1]
			"Howling Blast (Main Target)", -- [2]
			135833, -- [3]
		}, -- [26]
		{
			278227, -- [1]
			"Barkspines (Trinket)", -- [2]
			134439, -- [3]
		}, -- [27]
		{
			268998, -- [1]
			"Kindled Soul (Trinket)", -- [2]
			651093, -- [3]
		}, -- [28]
		{
			196917, -- [1]
			"Light of the Martyr (Damage)", -- [2]
			135938, -- [3]
		}, -- [29]
		{
			278812, -- [1]
			"Lion's Grace (Trinket)", -- [2]
			464140, -- [3]
		}, -- [30]
		{
			270827, -- [1]
			"Webweaver's Soul Gem (Trinket)", -- [2]
			237431, -- [3]
		}, -- [31]
		{
			212739, -- [1]
			"Epidemic (Main Target)", -- [2]
			136066, -- [3]
		}, -- [32]
		{
			279664, -- [1]
			"Bloody Bile (Trinket)", -- [2]
			136007, -- [3]
		}, -- [33]
		{
			237680, -- [1]
			"Howling Blast (AoE)", -- [2]
			135833, -- [3]
		}, -- [34]
		{
			215969, -- [1]
			"Epidemic (AoE)", -- [2]
			136066, -- [3]
		}, -- [35]
		{
			278359, -- [1]
			"Blood Hatred (Trinket)", -- [2]
			132175, -- [3]
		}, -- [36]
		{
			278155, -- [1]
			"Lingering Power of Xalzaix (Trinket)", -- [2]
			254105, -- [3]
		}, -- [37]
		{
			271115, -- [1]
			"Ignition Mage's Fuse (Trinket)", -- [2]
			1119937, -- [3]
		}, -- [38]
		{
			277179, -- [1]
			"Gladiator's Medallion (Trinket)", -- [2]
			252267, -- [3]
		}, -- [39]
		{
			70890, -- [1]
			"Scourge Strike (Shadow)", -- [2]
			237530, -- [3]
		}, -- [40]
		{
			278057, -- [1]
			"Volatile Blood Explosion (Trinket)", -- [2]
			538040, -- [3]
		}, -- [41]
		{
			277185, -- [1]
			"Gladiator's Badge (Trinket)", -- [2]
			135884, -- [3]
		}, -- [42]
		{
			228649, -- [1]
			"Blackout Kick (Passive)", -- [2]
			574575, -- [3]
		}, -- [43]
		{
			277187, -- [1]
			"Gladiator's Emblem (Trinket)", -- [2]
			132344, -- [3]
		}, -- [44]
		{
			277181, -- [1]
			"Gladiator's Insignia (Trinket)", -- [2]
			134501, -- [3]
		}, -- [45]
		{
			278862, -- [1]
			"Chill of the Runes (Trinket)", -- [2]
			252270, -- [3]
		}, -- [46]
		{
			271462, -- [1]
			"Rotcrusted Voodoo Doll (Trinket)", -- [2]
			1716867, -- [3]
		}, -- [47]
		{
			270925, -- [1]
			"Waterspout (Trinket)", -- [2]
			1698701, -- [3]
		}, -- [48]
		{
			271071, -- [1]
			"Conch of Dark Whispers (Trinket)", -- [2]
			1498840, -- [3]
		}, -- [49]
		{
			271465, -- [1]
			"Rotcrusted Voodoo Doll (Trinket)", -- [2]
			1716867, -- [3]
		}, -- [50]
		{
			278383, -- [1]
			"Ruffling Tempest (Trinket)", -- [2]
			2103829, -- [3]
		}, -- [51]
		{
			271671, -- [1]
			"Cacaphonous Chord (Trinket)", -- [2]
			454048, -- [3]
		}, -- [52]
	},
	["damage_scroll_auto_open"] = true,
	["update_warning_timeout"] = 10,
	["raid_data"] = {
	},
	["switchSaved"] = {
		["slots"] = 8,
		["table"] = {
			{
				["atributo"] = 1,
				["sub_atributo"] = 1,
			}, -- [1]
			{
				["atributo"] = 2,
				["sub_atributo"] = 1,
			}, -- [2]
			{
				["atributo"] = 1,
				["sub_atributo"] = 6,
			}, -- [3]
			{
				["atributo"] = 4,
				["sub_atributo"] = 5,
			}, -- [4]
			{
				["atributo"] = 1,
				["sub_atributo"] = 2,
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
		},
	},
	["always_use_profile_name"] = "ViksUI",
	["savedStyles"] = {
		{
			["hide_in_combat_type"] = 1,
			["switch_healer_in_combat"] = false,
			["color"] = {
				0.0588235294117647, -- [1]
				0.0588235294117647, -- [2]
				0.0588235294117647, -- [3]
				0.5, -- [4]
			},
			["menu_anchor"] = {
				16, -- [1]
				0, -- [2]
				["side"] = 2,
			},
			["bg_r"] = 0.0588235294117647,
			["hide_out_of_combat"] = false,
			["following"] = {
				["enabled"] = false,
				["bar_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["color_buttons"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
			["bars_sort_direction"] = 1,
			["bg_b"] = 0.0588235294117647,
			["version"] = 3,
			["name"] = "ViksUI",
			["attribute_text"] = {
				["show_timer"] = {
					true, -- [1]
					true, -- [2]
					true, -- [3]
				},
				["shadow"] = true,
				["side"] = 1,
				["text_size"] = 12,
				["custom_text"] = "{name}",
				["text_face"] = "Accidental Presidency",
				["anchor"] = {
					-18, -- [1]
					2, -- [2]
				},
				["enabled"] = true,
				["enable_custom_text"] = false,
				["text_color"] = {
					0.933333333333333, -- [1]
					0.933333333333333, -- [2]
					0.933333333333333, -- [3]
					1, -- [4]
				},
			},
			["tooltip"] = {
				["n_abilities"] = 3,
				["n_enemies"] = 3,
			},
			["stretch_button_side"] = 1,
			["libwindow"] = {
				["y"] = 4.999840259552,
				["x"] = 340.000335693359,
				["point"] = "BOTTOMLEFT",
				["scale"] = 1,
			},
			["switch_all_roles_in_combat"] = false,
			["instance_button_anchor"] = {
				-27, -- [1]
				1, -- [2]
			},
			["bg_alpha"] = 0.5,
			["row_info"] = {
				["textR_outline"] = true,
				["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
				["textL_outline"] = true,
				["textR_outline_small"] = false,
				["textL_outline_small"] = false,
				["textL_enable_custom_text"] = false,
				["fixed_text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["space"] = {
					["right"] = 0,
					["left"] = 0,
					["between"] = 1,
				},
				["texture_background_class_color"] = false,
				["start_after_icon"] = false,
				["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
				["textL_custom_text"] = "{data1}. {data3}{data2}",
				["models"] = {
					["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
					["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
					["upper_alpha"] = 0.5,
					["lower_enabled"] = false,
					["lower_alpha"] = 0.1,
					["upper_enabled"] = false,
				},
				["height"] = 15,
				["texture_file"] = "Interface\\AddOns\\Details\\images\\BantoBar",
				["font_size"] = 14,
				["icon_file"] = "",
				["icon_grayscale"] = false,
				["textR_bracket"] = "(",
				["use_spec_icons"] = false,
				["texture_custom"] = "",
				["backdrop"] = {
					["enabled"] = false,
					["size"] = 12,
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["texture"] = "1 Pixel",
				},
				["fixed_texture_color"] = {
					0.301960784313726, -- [1]
					0.301960784313726, -- [2]
					0.8, -- [3]
					0.439999997615814, -- [4]
				},
				["textL_show_number"] = true,
				["textL_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["textR_enable_custom_text"] = false,
				["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
				["texture"] = "BantoBar",
				["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
				["percent_type"] = 1,
				["textR_show_data"] = {
					true, -- [1]
					true, -- [2]
					false, -- [3]
				},
				["texture_background"] = "ViksGloss",
				["alpha"] = 0.439999997615814,
				["textR_class_colors"] = false,
				["textR_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["no_icon"] = true,
				["textL_class_colors"] = false,
				["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
				["font_face"] = "Accidental Presidency",
				["texture_class_colors"] = false,
				["fixed_texture_background_color"] = {
					0.188235294117647, -- [1]
					0.188235294117647, -- [2]
					0.188235294117647, -- [3]
					0, -- [4]
				},
				["fast_ps_update"] = false,
				["textR_separator"] = "NONE",
				["texture_custom_file"] = "Interface\\",
			},
			["statusbar_info"] = {
				["alpha"] = 0.5,
				["overlay"] = {
					0.0588235294117647, -- [1]
					0.0588235294117647, -- [2]
					0.0588235294117647, -- [3]
				},
			},
			["menu_alpha"] = {
				["enabled"] = false,
				["onenter"] = 1,
				["iconstoo"] = true,
				["ignorebars"] = false,
				["onleave"] = 1,
			},
			["bars_grow_direction"] = 1,
			["switch_all_roles_after_wipe"] = false,
			["desaturated_menu"] = true,
			["strata"] = "LOW",
			["show_sidebars"] = true,
			["window_scale"] = 1,
			["switch_tank"] = false,
			["hide_in_combat_alpha"] = 0,
			["plugins_grow_direction"] = 1,
			["menu_icons"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				false, -- [6]
				["space"] = -2,
				["shadow"] = true,
			},
			["switch_damager"] = false,
			["micro_displays_side"] = 2,
			["menu_anchor_down"] = {
				16, -- [1]
				-3, -- [2]
			},
			["row_show_animation"] = {
				["anim"] = "Fade",
				["options"] = {
				},
			},
			["switch_healer"] = false,
			["hide_icon"] = true,
			["grab_on_top"] = false,
			["switch_damager_in_combat"] = false,
			["backdrop_texture"] = "ViksBlank",
			["skin"] = "New Gray",
			["auto_current"] = true,
			["toolbar_side"] = 1,
			["bg_g"] = 0.0588235294117647,
			["auto_hide_menu"] = {
				["left"] = false,
				["right"] = false,
			},
			["hide_in_combat"] = false,
			["show_statusbar"] = false,
			["menu_icons_size"] = 0.799999952316284,
			["ignore_mass_showhide"] = false,
			["wallpaper"] = {
				["overlay"] = {
					0.999997794628143, -- [1]
					0.999997794628143, -- [2]
					0.999997794628143, -- [3]
					0.498038113117218, -- [4]
				},
				["width"] = 266.000061035156,
				["texcoord"] = {
					0.00100000001490116, -- [1]
					1, -- [2]
					0.00100000001490116, -- [3]
					0.703000030517578, -- [4]
				},
				["enabled"] = false,
				["anchor"] = "all",
				["height"] = 225.999984741211,
				["alpha"] = 0.498039245605469,
				["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
			},
			["total_bar"] = {
				["enabled"] = false,
				["only_in_group"] = true,
				["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["skin_custom"] = "",
			["micro_displays_locked"] = true,
			["switch_tank_in_combat"] = false,
			["bars_inverted"] = false,
		}, -- [1]
		{
			["hide_in_combat_type"] = 1,
			["menu_icons_size"] = 0.850000023841858,
			["color"] = {
				0.0588235294117647, -- [1]
				0.0588235294117647, -- [2]
				0.0588235294117647, -- [3]
				0.5, -- [4]
			},
			["menu_anchor"] = {
				16, -- [1]
				0, -- [2]
				["side"] = 2,
			},
			["bg_r"] = 0.0588235294117647,
			["hide_out_of_combat"] = false,
			["following"] = {
				["bar_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["enabled"] = false,
				["text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["color_buttons"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["switch_healer"] = false,
			["micro_displays_locked"] = true,
			["bars_inverted"] = false,
			["bars_sort_direction"] = 1,
			["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
			["skin"] = "New Gray",
			["tooltip"] = {
				["n_abilities"] = 3,
				["n_enemies"] = 3,
			},
			["stretch_button_side"] = 1,
			["switch_damager"] = false,
			["switch_all_roles_in_combat"] = false,
			["instance_button_anchor"] = {
				-27, -- [1]
				1, -- [2]
			},
			["name"] = "ViksUI",
			["attribute_text"] = {
				["enabled"] = true,
				["shadow"] = true,
				["side"] = 1,
				["text_size"] = 12,
				["custom_text"] = "{name}",
				["text_face"] = "Accidental Presidency",
				["anchor"] = {
					-18, -- [1]
					4, -- [2]
				},
				["text_color"] = {
					0.933333333333333, -- [1]
					0.933333333333333, -- [2]
					0.933333333333333, -- [3]
					1, -- [4]
				},
				["enable_custom_text"] = false,
				["show_timer"] = {
					true, -- [1]
					true, -- [2]
					true, -- [3]
				},
			},
			["statusbar_info"] = {
				["alpha"] = 0.5,
				["overlay"] = {
					0.0588235294117647, -- [1]
					0.0588235294117647, -- [2]
					0.0588235294117647, -- [3]
				},
			},
			["menu_alpha"] = {
				["enabled"] = false,
				["onleave"] = 1,
				["ignorebars"] = false,
				["iconstoo"] = true,
				["onenter"] = 1,
			},
			["menu_anchor_down"] = {
				16, -- [1]
				-3, -- [2]
			},
			["ignore_mass_showhide"] = false,
			["desaturated_menu"] = true,
			["strata"] = "LOW",
			["show_sidebars"] = true,
			["window_scale"] = 1,
			["switch_tank"] = false,
			["hide_in_combat_alpha"] = 0,
			["switch_all_roles_after_wipe"] = false,
			["menu_icons"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				false, -- [6]
				["space"] = -2,
				["shadow"] = false,
			},
			["libwindow"] = {
				["y"] = 96.0001754760742,
				["x"] = -336.99853515625,
				["point"] = "BOTTOMRIGHT",
				["scale"] = 1,
			},
			["auto_hide_menu"] = {
				["left"] = false,
				["right"] = false,
			},
			["bars_grow_direction"] = 1,
			["row_show_animation"] = {
				["anim"] = "Fade",
				["options"] = {
				},
			},
			["row_info"] = {
				["textR_outline"] = true,
				["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
				["textL_outline"] = true,
				["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
				["textR_show_data"] = {
					true, -- [1]
					true, -- [2]
					false, -- [3]
				},
				["textL_enable_custom_text"] = false,
				["fixed_text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["space"] = {
					["right"] = 0,
					["left"] = 0,
					["between"] = 0,
				},
				["texture_background_class_color"] = false,
				["textL_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
				["backdrop"] = {
					["enabled"] = false,
					["texture"] = "1 Pixel",
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["size"] = 12,
				},
				["font_size"] = 14,
				["height"] = 15,
				["texture_file"] = "Interface\\AddOns\\Details\\images\\BantoBar",
				["texture_custom_file"] = "Interface\\",
				["icon_file"] = "",
				["icon_grayscale"] = false,
				["models"] = {
					["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
					["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
					["upper_alpha"] = 0.5,
					["lower_enabled"] = false,
					["lower_alpha"] = 0.1,
					["upper_enabled"] = false,
				},
				["textR_bracket"] = "(",
				["textR_enable_custom_text"] = false,
				["textL_custom_text"] = "{data1}. {data3}{data2}",
				["fixed_texture_color"] = {
					0.301960784313726, -- [1]
					0.301960784313726, -- [2]
					0.8, -- [3]
					0.439999997615814, -- [4]
				},
				["textL_show_number"] = true,
				["textL_outline_small"] = false,
				["texture_custom"] = "",
				["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
				["texture"] = "BantoBar",
				["textR_outline_small"] = false,
				["start_after_icon"] = false,
				["textL_class_colors"] = false,
				["textR_class_colors"] = false,
				["textR_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["texture_background"] = "ViksGloss",
				["alpha"] = 0.439999997615814,
				["no_icon"] = true,
				["percent_type"] = 1,
				["fixed_texture_background_color"] = {
					0.188235294117647, -- [1]
					0.188235294117647, -- [2]
					0.188235294117647, -- [3]
					0, -- [4]
				},
				["font_face"] = "Accidental Presidency",
				["texture_class_colors"] = false,
				["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
				["fast_ps_update"] = false,
				["textR_separator"] = "NONE",
				["use_spec_icons"] = false,
			},
			["bg_alpha"] = 0.5,
			["grab_on_top"] = false,
			["hide_icon"] = true,
			["switch_damager_in_combat"] = false,
			["skin_custom"] = "",
			["auto_current"] = true,
			["toolbar_side"] = 1,
			["bg_g"] = 0.0588235294117647,
			["micro_displays_side"] = 2,
			["hide_in_combat"] = false,
			["plugins_grow_direction"] = 1,
			["show_statusbar"] = false,
			["switch_healer_in_combat"] = false,
			["wallpaper"] = {
				["enabled"] = false,
				["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
				["texcoord"] = {
					0.00100000001490116, -- [1]
					1, -- [2]
					0.00100000001490116, -- [3]
					0.703000030517578, -- [4]
				},
				["overlay"] = {
					0.999997794628143, -- [1]
					0.999997794628143, -- [2]
					0.999997794628143, -- [3]
					0.498038113117218, -- [4]
				},
				["anchor"] = "all",
				["height"] = 225.999984741211,
				["alpha"] = 0.498039245605469,
				["width"] = 266.000061035156,
			},
			["total_bar"] = {
				["enabled"] = false,
				["only_in_group"] = true,
				["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["backdrop_texture"] = "ViksBlank",
			["version"] = 3,
			["switch_tank_in_combat"] = false,
			["bg_b"] = 0.0588235294117647,
		}, -- [2]
	},
	["always_use_profile_exception"] = {
	},
	["details_auras"] = {
	},
	["realm_sync"] = true,
	["savedTimeCaptures"] = {
	},
	["latest_news_saw"] = "v8.0.1.6035",
	["custom"] = {
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Show who in your raid used a potion during the encounter.",
			["tooltip"] = "			--init:\n			local player, combat, instance = ...\n\n			--get the debuff container for potion of focus\n			local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n			if (debuff_uptime_container) then\n			    local focus_potion = debuff_uptime_container [188030] --Legion\n			    if (focus_potion) then\n				local name, _, icon = GetSpellInfo (188030) --Legion\n				GameCooltip:AddLine (name, 1) --> can use only 1 focus potion (can't be pre-potion)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			end\n\n			--get the buff container for all the others potions\n			local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n			if (buff_uptime_container) then\n			    --potion of the jade serpent\n			    local jade_serpent_potion = buff_uptime_container [188027] --Legion\n			    if (jade_serpent_potion) then\n				local name, _, icon = GetSpellInfo (188027) --Legion\n				GameCooltip:AddLine (name, jade_serpent_potion.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			    \n			    --potion of mogu power\n			    local mogu_power_potion = buff_uptime_container [188028] --Legion\n			    if (mogu_power_potion) then\n				local name, _, icon = GetSpellInfo (188028) --Legion\n				GameCooltip:AddLine (name, mogu_power_potion.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			    \n			    --mana potion\n			    local mana_potion = buff_uptime_container [188017] --Legion\n			    if (mana_potion) then\n				local name, _, icon = GetSpellInfo (188017) --Legion\n				GameCooltip:AddLine (name, mana_potion.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			    \n			    --prolongued power\n			    local prolongued_power = buff_uptime_container [229206] --Legion\n			    if (prolongued_power) then\n				local name, _, icon = GetSpellInfo (229206) --Legion\n				GameCooltip:AddLine (name, prolongued_power.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			    \n			    --potion of the mountains\n			    local mountains_potion = buff_uptime_container [188029] --Legion\n			    if (mountains_potion) then\n				local name, _, icon = GetSpellInfo (188029) --Legion\n				GameCooltip:AddLine (name, mountains_potion.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			end\n		",
			["attribute"] = false,
			["name"] = "Potion Used",
			["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the misc actor container\n				local misc_container = combat:GetActorList ( DETAILS_ATTRIBUTE_MISC )\n\n				--do the loop:\n				for _, player in ipairs ( misc_container ) do \n				    \n				    --only player in group\n				    if (player:IsGroupPlayer()) then\n					\n					local found_potion = false\n					\n					--get the spell debuff uptime container\n					local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n					if (debuff_uptime_container) then\n					    --potion of focus (can't use as pre-potion, so, its amount is always 1\n					    local focus_potion = debuff_uptime_container [188030] --Legion\n					    if (focus_potion) then\n						total = total + 1\n						found_potion = true\n						if (top < 1) then\n						    top = 1\n						end\n						--add amount to the player \n						instance_container:AddValue (player, 1)\n					    end\n					end\n					\n					--get the spell buff uptime container\n					local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n					if (buff_uptime_container) then\n					    \n					    --potion of the jade serpent\n					    local jade_serpent_potion = buff_uptime_container [188027] --Legion\n					    if (jade_serpent_potion) then\n						local used = jade_serpent_potion.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					    \n					    --potion of mogu power\n					    local mogu_power_potion = buff_uptime_container [188028] --Legion\n					    if (mogu_power_potion) then\n						local used = mogu_power_potion.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					    \n					    --mana potion\n					    local mana_potion = buff_uptime_container [188017] --Legion\n					    if (mana_potion) then\n						local used = mana_potion.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					    \n					    --potion of prolongued power\n					    local prolongued_power = buff_uptime_container [229206] --Legion\n					    if (prolongued_power) then\n						local used = prolongued_power.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					    \n					    --potion of the mountains\n					    local mountains_potion = buff_uptime_container [188029] --Legion\n					    if (mountains_potion) then\n						local used = mountains_potion.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					end\n					\n					if (found_potion) then\n					    amount = amount + 1\n					end    \n				    end\n				end\n\n				--return:\n				return total, top, amount\n				",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\ICONS\\Trade_Alchemy_PotionD4",
			["script_version"] = 3,
		}, -- [1]
		{
			["source"] = false,
			["desc"] = "Show who in your raid group used the healthstone or a heal potion.",
			["author"] = "Details! Team",
			["percent_script"] = false,
			["total_script"] = false,
			["attribute"] = false,
			["tooltip"] = "			--get the parameters passed\n			local actor, combat, instance = ...\n			\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GameCooltip = GameCooltip\n			local R, G, B, A = 0, 0, 0, 0.75\n			\n			local hs = actor:GetSpell (6262)\n			if (hs) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(6262)),  _detalhes:ToK(hs.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (6262)), 1, 1, 16, 16)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_HEALTH_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_HEALTH_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_HEALTH_POTION_ID)), 1, 1, 16, 16)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_REJU_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_REJU_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_REJU_POTION_ID)), 1, 1, 16, 16)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n\n			--Cooltip code\n			",
			["name"] = "Health Potion & Stone",
			["script"] = "			--get the parameters passed\n			local combat, instance_container, instance = ...\n			--declade the values to return\n			local total, top, amount = 0, 0, 0\n			\n			--do the loop\n			local AllHealCharacters = combat:GetActorList (DETAILS_ATTRIBUTE_HEAL)\n			for index, character in ipairs (AllHealCharacters) do\n				local AllSpells = character:GetSpellList()\n				local found = false\n				for spellid, spell in pairs (AllSpells) do\n					if (DETAILS_HEALTH_POTION_LIST [spellid]) then\n						instance_container:AddValue (character, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						found = true\n					end\n				end\n			\n				if (found) then\n					amount = amount + 1\n				end\n			end\n			--loop end\n			--return the values\n			return total, top, amount\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\ICONS\\warlock_ healthstone",
			["script_version"] = 13,
		}, -- [2]
		{
			["source"] = false,
			["tooltip"] = "				\n			",
			["author"] = "Details!",
			["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
			["desc"] = "Tells how much time each character spent doing damage.",
			["attribute"] = false,
			["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
			["name"] = "Damage Activity Time",
			["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, amount = 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\ICONS\\Achievement_PVP_H_06",
			["script_version"] = 1,
		}, -- [3]
		{
			["source"] = false,
			["tooltip"] = "				\n			",
			["author"] = "Details!",
			["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
			["desc"] = "Tells how much time each character spent doing healing.",
			["attribute"] = false,
			["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
			["name"] = "Healing Activity Time",
			["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_HEAL )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\ICONS\\Achievement_PVP_G_06",
			["script_version"] = 1,
		}, -- [4]
		{
			["source"] = false,
			["author"] = "Details!",
			["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
			["desc"] = "Show the crowd control amount for each player.",
			["attribute"] = false,
			["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n					if (character.cc_done and character:IsPlayer()) then\n						local cc_done = floor (character.cc_done)\n						instance_container:AddValue (character, cc_done)\n						total = total + cc_done\n						if (cc_done > top) then\n							top = cc_done\n						end\n						amount = amount + 1\n					end\n				end\n\n				return total, top, amount\n			",
			["name"] = "Crowd Control Done",
			["tooltip"] = "				local actor, combat, instance = ...\n				local spells = {}\n				for spellid, spell in pairs (actor.cc_done_spells._ActorTable) do\n				    tinsert (spells, {spellid, spell.counter})\n				end\n\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n				end\n\n				local targets = {}\n				for playername, amount in pairs (actor.cc_done_targets) do\n				    tinsert (targets, {playername, amount})\n				end\n\n				table.sort (targets, _detalhes.Sort2)\n\n				_detalhes:AddTooltipSpellHeaderText (\"Targets\", \"yellow\", #targets)\n				local class, _, _, _, _, r, g, b = _detalhes:GetClass (actor.nome)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, target in ipairs (targets) do\n				    GameCooltip:AddLine (target[1], target [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (target [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, 14, 14, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, 14, 14)\n				    end\n				    --\n				end\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\ICONS\\Spell_Frost_FreezingBreath",
			["script_version"] = 9,
		}, -- [5]
		{
			["source"] = false,
			["author"] = "Details!",
			["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
			["desc"] = "Show the amount of crowd control received for each player.",
			["attribute"] = false,
			["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amt = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n				DETAILS_CUSTOM_CC_RECEIVED_CACHE = DETAILS_CUSTOM_CC_RECEIVED_CACHE or {}\n				wipe (DETAILS_CUSTOM_CC_RECEIVED_CACHE)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					\n					for player_name, amount in pairs (character.cc_done_targets) do\n					    local target = combat (1, player_name) or combat (2, player_name)\n					    if (target and target:IsPlayer()) then\n						instance_container:AddValue (target, amount)\n						total = total + amount\n						if (amount > top) then\n						    top = amount\n						end\n						if (not DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name]) then\n						    DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name] = true\n						    amt = amt + 1\n						end\n					    end\n					end\n					\n				    end\n				end\n\n				return total, top, amt\n			",
			["name"] = "Crowd Control Received",
			["tooltip"] = "				local actor, combat, instance = ...\n				local name = actor:name()\n				local spells, from = {}, {}\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					local on_actor = character.cc_done_targets [name]\n					if (on_actor) then\n					    tinsert (from, {character:name(), on_actor})\n					    \n					    for spellid, spell in pairs (character.cc_done_spells._ActorTable) do\n						\n						local spell_on_actor = spell.targets [name]\n						if (spell_on_actor) then\n						    local has_spell\n						    for index, spell_table in ipairs (spells) do\n							if (spell_table [1] == spellid) then\n							    spell_table [2] = spell_table [2] + spell_on_actor\n							    has_spell = true\n							end\n						    end\n						    if (not has_spell) then\n							tinsert (spells, {spellid, spell_on_actor}) \n						    end\n						end\n						\n					    end            \n					end\n				    end\n				end\n\n				table.sort (from, _detalhes.Sort2)\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, 14, 14)    \n				end\n\n				_detalhes:AddTooltipSpellHeaderText (\"From\", \"yellow\", #from)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, t in ipairs (from) do\n				    GameCooltip:AddLine (t[1], t[2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (t [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, 14, 14, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, 14, 14)\n				    end     \n				    \n				end\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\ICONS\\Spell_Mage_IceNova",
			["script_version"] = 1,
		}, -- [6]
		{
			["source"] = false,
			["author"] = "Details!",
			["percent_script"] = "				local value, top, total, combat, instance = ...\n				local dps = _detalhes:ToK (floor (value) / combat:GetCombatTime())\n				local percent = string.format (\"%.1f\", value/total*100)\n				return dps .. \", \" .. percent\n			",
			["desc"] = "Show your spells in the window.",
			["tooltip"] = "			--config:\n			--Background RBG and Alpha:\n			local R, G, B, A = 0, 0, 0, 0.75\n			local R, G, B, A = 0.1960, 0.1960, 0.1960, 0.8697\n\n			--get the parameters passed\n			local spell, combat, instance = ...\n\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GC = GameCooltip\n			GC:SetOption (\"YSpacingMod\", 0)\n\n			local role = UnitGroupRolesAssigned (\"player\")\n\n			if (spell.n_dmg) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    local debuff_uptime_total, cast_string = \"\", \"\"\n			    local misc_actor = instance.showing (4, _detalhes.playername)\n			    if (misc_actor) then\n				local debuff_uptime = misc_actor.debuff_uptime_spells and misc_actor.debuff_uptime_spells._ActorTable [spell.id] and misc_actor.debuff_uptime_spells._ActorTable [spell.id].uptime\n				if (debuff_uptime) then\n				    debuff_uptime_total = floor (debuff_uptime / instance.showing:GetCombatTime() * 100)\n				end\n				\n				local spell_cast = misc_actor.spell_cast and misc_actor.spell_cast [spell.id]\n				\n				if (not spell_cast and misc_actor.spell_cast) then\n				    local spellname = GetSpellInfo (spell.id)\n				    for casted_spellid, amount in pairs (misc_actor.spell_cast) do\n					local casted_spellname = GetSpellInfo (casted_spellid)\n					if (casted_spellname == spellname) then\n					    spell_cast = amount .. \" (|cFFFFFF00?|r)\"\n					end\n				    end\n				end\n				if (not spell_cast) then\n				    spell_cast = \"(|cFFFFFF00?|r)\"\n				end\n				cast_string = cast_string .. spell_cast\n			    end\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Casts:\", cast_string or \"?\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (debuff_uptime_total ~= \"\") then\n				GC:AddLine (\"Uptime:\", (debuff_uptime_total or \"?\") .. \"%\")\n				GC:AddStatusBar (100, 1, R, G, B, A)\n			    end\n			    \n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Dps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_dmg / spell.n_amt\n			    local T = (combat_time*spell.n_dmg)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_dmg / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_dmg/spell.c_amt\n				local T = (combat_time*spell.c_dmg)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_dmg / T\n				\n				GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Dps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Multistrike: \", spell.m_amt .. \" (\" ..floor ( spell.m_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"On Normal / On Critical:\", spell.m_amt - spell.m_crit .. \"  / \" .. spell.m_crit)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			elseif (spell.n_curado) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Hps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_curado / spell.n_amt\n			    local T = (combat_time*spell.n_curado)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_curado / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_curado/spell.c_amt\n				local T = (combat_time*spell.c_curado)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_curado / T\n				\n				GC:AddLine (\"Average / E-Hps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Hps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Multistrike: \", spell.m_amt .. \" (\" ..floor ( spell.m_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"On Normal / On Critical:\", spell.m_amt - spell.m_crit .. \"  / \" .. spell.m_crit)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			end\n			",
			["attribute"] = false,
			["name"] = "My Spells",
			["script"] = "				--get the parameters passed\n				local combat, instance_container, instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				local player\n				local role = UnitGroupRolesAssigned (\"player\")\n				local pet_attribute\n\n				if (role == \"DAMAGER\") then\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				elseif (role == \"HEALER\") then    \n					player = combat (DETAILS_ATTRIBUTE_HEAL, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_HEAL\n				else\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				end\n\n				--do the loop\n\n				if (player) then\n					local spells = player:GetSpellList()\n					for spellid, spell in pairs (spells) do\n						instance_container:AddValue (spell, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						amount = amount + 1\n					end\n				    \n					for _, PetName in ipairs (player.pets) do\n						local pet = combat (pet_attribute, PetName)\n						if (pet) then\n							for spellid, spell in pairs (pet:GetSpellList()) do\n								instance_container:AddValue (spell, spell.total, nil, \" (\" .. PetName:gsub ((\" <.*\"), \"\") .. \")\")\n								total = total + spell.total\n								if (top < spell.total) then\n									top = spell.total\n								end\n								amount = amount + 1\n							end\n						end\n					end\n				end\n\n				--return the values\n				return total, top, amount\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\ICONS\\ABILITY_MAGE_ARCANEBARRAGE",
			["script_version"] = 5,
		}, -- [7]
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Show the amount of damage applied on targets marked with skull.",
			["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [128]\n				if (DamageOnStar) then\n				    --RAID_TARGET_8 is the built-in localized word for 'Skull'.\n				    GameCooltip:AddLine (RAID_TARGET_8 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_8\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
			["attribute"] = false,
			["name"] = "Damage On Skull Marked Targets",
			["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n				\n				--raid target flags: \n				-- 128: skull \n				-- 64: cross\n				-- 32: square\n				-- 16: moon\n				-- 8: triangle\n				-- 4: diamond\n				-- 2: circle\n				-- 1: star\n				\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					if (actor.raid_targets [128]) then\n					    CustomContainer:AddValue (actor, actor.raid_targets [128])\n					end        \n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8",
			["script_version"] = 2,
		}, -- [8]
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Show the amount of damage applied on targets marked with any other mark.",
			["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object\n				local GameCooltip = GameCooltip\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [1]\n				if (DamageOnStar) then\n				    GameCooltip:AddLine (RAID_TARGET_1 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_1\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCircle = RaidTargets [2]\n				if (DamageOnCircle) then\n				    GameCooltip:AddLine (RAID_TARGET_2 .. \":\", format_func (_, DamageOnCircle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_2\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnDiamond = RaidTargets [4]\n				if (DamageOnDiamond) then\n				    GameCooltip:AddLine (RAID_TARGET_3 .. \":\", format_func (_, DamageOnDiamond))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_3\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnTriangle = RaidTargets [8]\n				if (DamageOnTriangle) then\n				    GameCooltip:AddLine (RAID_TARGET_4 .. \":\", format_func (_, DamageOnTriangle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_4\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnMoon = RaidTargets [16]\n				if (DamageOnMoon) then\n				    GameCooltip:AddLine (RAID_TARGET_5 .. \":\", format_func (_, DamageOnMoon))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_5\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnSquare = RaidTargets [32]\n				if (DamageOnSquare) then\n				    GameCooltip:AddLine (RAID_TARGET_6 .. \":\", format_func (_, DamageOnSquare))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_6\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCross = RaidTargets [64]\n				if (DamageOnCross) then\n				    GameCooltip:AddLine (RAID_TARGET_7 .. \":\", format_func (_, DamageOnCross))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_7\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
			["attribute"] = false,
			["name"] = "Damage On Other Marked Targets",
			["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					local total = (actor.raid_targets [1] or 0) --star\n					total = total + (actor.raid_targets [2] or 0) --circle\n					total = total + (actor.raid_targets [4] or 0) --diamond\n					total = total + (actor.raid_targets [8] or 0) --tiangle\n					total = total + (actor.raid_targets [16] or 0) --moon\n					total = total + (actor.raid_targets [32] or 0) --square\n					total = total + (actor.raid_targets [64] or 0) --cross\n					\n					if (total > 0) then\n					    CustomContainer:AddValue (actor, total)\n					end\n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_5",
			["script_version"] = 2,
		}, -- [9]
		{
			["source"] = false,
			["author"] = "Details!",
			["total_script"] = "				local value, top, total, combat, instance = ...\n\n				--get the time of overall combat\n				local OverallCombatTime = Details:GetCombat (-1):GetCombatTime()\n\n				--get the time of current combat if the player is in combat\n				if (Details.in_combat) then\n				    local CurrentCombatTime = Details:GetCombat (0):GetCombatTime()\n				    OverallCombatTime = OverallCombatTime + CurrentCombatTime\n				end\n\n				--build the string\n				local ToK = Details:GetCurrentToKFunction()\n				local s = ToK (_, total / OverallCombatTime)\n				s = ToK (_, total) .. \" (\" .. s .. \", \"\n\n				return s\n			",
			["desc"] = "Show overall damage done on the fly.",
			["attribute"] = false,
			["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				if (not OverallCombat.GetActorList or not CurrentCombat.GetActorList) then\n				    return 0, 0, 0\n				end\n\n				--get the damage actor container for overall\n				local damage_container_overall = OverallCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				--get the damage actor container for current\n				local damage_container_current = CurrentCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n\n				--do the loop:\n				for _, player in ipairs ( damage_container_overall ) do \n				    --only player in group\n				    if (player:IsGroupPlayer()) then\n					instance_container:AddValue (player, player.total)\n				    end\n				end\n\n				if (Details.in_combat) then\n				    for _, player in ipairs ( damage_container_current ) do \n					--only player in group\n					if (player:IsGroupPlayer()) then\n					    instance_container:AddValue (player, player.total)        \n					end\n				    end\n				end\n\n				total, top =  instance_container:GetTotalAndHighestValue()\n				amount =  instance_container:GetNumActors()\n\n				--return:\n				return total, top, amount\n			",
			["name"] = "Dynamic Overall Damage",
			["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip2\n\n				--Cooltip code\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				local AllSpells = {}\n\n				--overall\n				local player = OverallCombat [1]:GetActor (actor.nome)\n				local playerSpells = player:GetSpellList()\n				for spellID, spellTable in pairs (playerSpells) do\n				    AllSpells [spellID] = spellTable.total\n				end\n\n				--current\n				local player = CurrentCombat [1]:GetActor (actor.nome)\n				local playerSpells = player:GetSpellList()\n				for spellID, spellTable in pairs (playerSpells) do\n				    AllSpells [spellID] = (AllSpells [spellID] or 0) + (spellTable.total or 0)\n				end\n\n				local sortedList = {}\n				for spellID, total in pairs (AllSpells) do\n				    tinsert (sortedList, {spellID, total})\n				end\n				table.sort (sortedList, Details.Sort2)\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--build the tooltip\n				for i, t in ipairs (sortedList) do\n				    local spellID, total = unpack (t)\n				    if (total > 1) then\n					local spellName, _, spellIcon = Details.GetSpellInfo (spellID)\n					\n					GameCooltip:AddLine (spellName, format_func (_, total))\n					Details:AddTooltipBackgroundStatusbar()\n					GameCooltip:AddIcon (spellIcon, 1, 1, 14, 14)\n				    end\n				end\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\ICONS\\Achievement_Quests_Completed_08",
			["script_version"] = 2,
		}, -- [10]
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Damage done to shields",
			["tooltip"] = "				--get the parameters passed\n				local actor, Combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				--get the actor total damage absorbed\n				local totalAbsorb = actor.totalabsorbed\n				local format_func = Details:GetCurrentToKFunction()\n\n				--get the damage absorbed by all the actor pets\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n				    end\n				end\n\n				GameCooltip:AddLine (actor:Name(), format_func (_, actor.totalabsorbed))\n				Details:AddTooltipBackgroundStatusbar()\n\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n					\n					GameCooltip:AddLine (petName, format_func (_, pet.totalabsorbed))\n					Details:AddTooltipBackgroundStatusbar()        \n					\n				    end\n				end\n			",
			["attribute"] = false,
			["name"] = "Damage on Shields",
			["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for index, actor in ipairs (Combat:GetActorList(1)) do\n				    if (actor:IsPlayer()) then\n					\n					--get the actor total damage absorbed\n					local totalAbsorb = actor.totalabsorbed\n					\n					--get the damage absorbed by all the actor pets\n					for petIndex, petName in ipairs (actor.pets) do\n					    local pet = Combat :GetActor (1, petName)\n					    if (pet) then\n						totalAbsorb = totalAbsorb + pet.totalabsorbed\n					    end\n					end\n					\n					--add the value to the actor on the custom container\n					CustomContainer:AddValue (actor, totalAbsorb)        \n					\n				    end\n				end\n				--loop end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
			["target"] = false,
			["spellid"] = false,
			["icon"] = "Interface\\ICONS\\Spell_Holy_PowerWordShield",
			["script_version"] = 1,
		}, -- [11]
	},
	["performance_profiles"] = {
		["Dungeon"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["RaidFinder"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Battleground15"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Battleground40"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Mythic"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Arena"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Raid30"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Raid15"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
	},
	["exit_log"] = {
		"1 - Closing Janela Info.", -- [1]
		"2 - Clearing user place from instances.", -- [2]
		"4 - Reversing switches.", -- [3]
		"6 - Saving Config.", -- [4]
		"7 - Saving Profiles.", -- [5]
		"8 - Saving nicktag cache.", -- [6]
	},
	["immersion_unit_special_icons"] = true,
	["lastUpdateWarning"] = 0,
	["always_use_profile"] = false,
}
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
vicon:Size(66, 66)
vicon:SetTemplate()
vicon:SetPoint("RIGHT", v, "LEFT", -2, 0)
vicon:SetFrameStrata("HIGH")

vicon.bg = vicon:CreateTexture(nil, "ARTWORK")
vicon.bg:Point("TOPLEFT", 2, -2)
vicon.bg:Point("BOTTOMRIGHT", -2, 2)
vicon.bg:SetTexture(C["media"].texture)

local f = CreateFrame("Frame", "ViksUIInstallFrame", UIParent)
f:SetSize(500, 300)
f:SetPoint("CENTER")
f:SetTemplate("Transparent")
f:SetFrameStrata("HIGH")
f:Hide()

f.bg = f:CreateTexture(nil, "BACKGROUND")
--f.bg:Point("TOPLEFT", 2, -2)
--f.bg:Point("BOTTOMRIGHT", -2, 2)
--f.bg:Size()
f.bg:SetPoint("CENTER", f, "CENTER", 0, 0)
f.bg:SetTexture([[Interface\AddOns\ViksUI\Media\textures\logosk]])
f.bg:SetAlpha(0.2)

local viconl = CreateFrame("Frame", "ViksUIVersion", f)
viconl:SetTemplate()
viconl:Size(30, 30)
viconl:SetPoint("BOTTOMRIGHT", f, "TOPRIGHT", 0, 2)
viconl:SetFrameStrata("HIGH")

viconl.bg = viconl:CreateTexture(nil, "ARTWORK")
viconl.bg:Point("TOPLEFT", 2, -2)
viconl.bg:Point("BOTTOMRIGHT", -2, 2)
viconl.bg:SetTexture([[Interface\AddOns\ViksUI\Media\textures\viksicon]])

local title = CreateFrame("Frame", "ViksUIInstallTitle", f)
title:SetTemplate("Transparent")
title:Size(f:GetWidth() - 32, 30)
title:SetPoint("BOTTOMLEFT", f, "TOPLEFT", 0, 2)
title:SetFrameStrata("HIGH")

local logo = CreateFrame("Frame", "ViksLogo", f)
logo:Size(256, 128)
logo:SetPoint("BOTTOM", title, "BOTTOM", 0, -20)
logo:SetFrameStrata("HIGH")
logo:SetFrameLevel(6)

logo.bg = logo:CreateTexture(nil, "ARTWORK")
logo.bg:Point("TOPLEFT", 2, -2)
logo.bg:Point("BOTTOMRIGHT", -2, 2)
logo.bg:SetTexture([[Interface\AddOns\ViksUI\Media\textures\logo]])

local name = title:CreateFontString(nil, "OVERLAY")
name:SetFont(C["media"].normal_font, 16)
name:SetPoint("LEFT", title, 7, -1)
name:SetText(T.version)

local sb = CreateFrame("StatusBar", nil, f)
sb:SetStatusBarTexture("\\Interface\\AddOns\\ViksUI\\Media\\textures\\normTex.tga")
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
Optionb1:Size(160, 30)
Optionb1:Point("BOTTOM", 0, 60)
Optionb1:SkinButton()
Optionb1:SetText("")
Optionb1:Hide()

Optionb2 = CreateFrame("Button", "InstallOption2Button", f, "UIPanelButtonTemplate")
Optionb2:StripTextures()
Optionb2:Size(110, 30)
Optionb2:Point('BOTTOMLEFT', f, 'BOTTOM', 4, 60)
Optionb2:SkinButton()
Optionb2:SetText("")
Optionb2:Hide()
Optionb2:SetScript('OnShow', function() Optionb1:Width(110); Optionb1:ClearAllPoints(); Optionb1:Point('BOTTOMRIGHT', f, 'BOTTOM', -4, 60) end)
Optionb2:SetScript('OnHide', function() Optionb1:Width(160); Optionb1:ClearAllPoints(); Optionb1:Point("BOTTOM", 0, 60) end)

Optionb3 = CreateFrame("Button", "InstallOption3Button", f, "UIPanelButtonTemplate")
Optionb3:StripTextures()
Optionb3:Size(100, 30)
Optionb3:Point('LEFT', Optionb2, 'RIGHT', 4, 0)
Optionb3:SkinButton()
Optionb3:SetText("")
Optionb3:Hide()
Optionb3:SetScript('OnShow', function() Optionb1:Width(100); Optionb1:ClearAllPoints(); Optionb1:Point('RIGHT', Optionb2, 'LEFT', -4, 0); Optionb2:Width(100); Optionb2:ClearAllPoints(); Optionb2:Point('BOTTOM', f, 'BOTTOM', 0, 60)  end)
Optionb3:SetScript('OnHide', function() Optionb1:Width(160); Optionb1:ClearAllPoints(); Optionb1:Point("BOTTOM", 0, 60); Optionb2:Width(110); Optionb2:ClearAllPoints(); Optionb2:Point('BOTTOMLEFT', f, 'BOTTOM', 4, 60) end)

maxsteps = 7
-- Creating the steps in installui
-- Step 6 / Finish
local step7 = function()
	ViksUISettingsPerChar.Install = true
	sb:SetValue(7)
	PlaySound(888)
	header:SetText("4. Success!")
	text1:SetText("Installation is complete.")
	text2:SetText("Please click the 'Finish' button to reload the UI.")
	text3:SetText("")
	text4:SetText("Enjoy ViksUI")
	sbt:SetText("7/ "..maxsteps)
	option1:Hide()
	option2.Text:SetText("Finish")
	option2:SetText("Finish")
	option2:SetScript("OnClick", function() StaticPopup_Show("SWITCH_RAID") end)
end
-- Step 7 / Select Bartender Profile
local step6 = function()
	if not option2:IsShown() then option2:Show() end
	sb:SetValue(6)
	header:SetText("6. No Panel Layout Select")
	text1:SetText("Click the button to use No Panel Layout")
	text2:SetText("This can be changed under Config->Panels")
	text3:Hide()
	InstallOption1Button:Show()
	InstallOption1Button:SetText("NoPanels.")
	InstallOption1Button:SetScript('OnClick', function() ViksUIOptions.panels.NoPanels = true ViksUIOptionsPerChar.panels.NoPanels = true end)
	InstallOption2Button:Show()
	InstallOption2Button:SetText("Normal Panels.")
	InstallOption2Button:SetScript('OnClick', function() ViksUIOptions.panels.NoPanels = false ViksUIOptionsPerChar.panels.NoPanels = false end)
	text4:SetText("Click one of the buttons then click 'Continue'.")
	sbt:SetText("6/ "..maxsteps)
	option1:SetScript("OnClick", step7)
	option2:SetScript("OnClick", function()
		InstallOption1Button:Hide()
		InstallOption2Button:Hide()
		step7()
	end)
end
-- Step 6 / Select UnitFrame Layout
local step5 = function()
sb:SetValue(5)
	if not option2:IsShown() then option2:Show() end
	sb:SetValue(5)
	header:SetText("5. Unit Frame Layout")
	text1:SetText("This step will setup Unit Frame Positions.")
	text2:Hide()
	text3:Hide()
	InstallOption1Button:Show()
	InstallOption1Button:SetText("DPS.")
	InstallOption1Button:SetScript('OnClick', function() ViksUIOptionsPerChar.unitframe.HealFrames = false ViksUIOptions.unitframe.HealFrames = false ViksUISettingsPerChar.RaidLayout = "DPS" end)
	InstallOption2Button:Show()
	InstallOption2Button:SetText("HEALER")
	InstallOption2Button:SetScript('OnClick', function() ViksUIOptionsPerChar.unitframe.HealFrames = true ViksUIOptions.unitframe.HealFrames = true ViksUISettingsPerChar.RaidLayout = "HEAL" end)
	--InstallOption3Button:Show()
	--InstallOption3Button:SetText("TANK")
	text4:SetText("Click one of the buttons then click 'Continue'.")
	sbt:SetText("5/ "..maxsteps)
	option1:SetScript("OnClick", step6)
	option2:SetScript("OnClick", function()
		InstallOption1Button:Hide()
		InstallOption2Button:Hide()
		step6()
	end)
end
-- Step 5 / Setting up skada Profile
local step4 = function()
	if IsAddOnLoaded("Details") then
		if ViksUISettings.DetailsSettings then 
		step5() 	
		return end
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(4)
		header:SetText("4. Details")
		text1:SetText("This step will setup Details 3 Window profile.")
		text2:SetText("This step is |cffff0000recommended|r for new users. NB: Load profile inside Details after")
		text3:SetText("|cffff0000NB! NOTE|r this step overwrite Details current settings.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("4/ "..maxsteps)
		option1:SetScript("OnClick", step5)
		option2:SetScript("OnClick", function()
			--positionsetup()
			UploadDetails()
			_detalhes_database["active_profile"] = "ViksUI"
			ViksUISettings.DetailsSettings = true
			step5()
		end)
	elseif IsAddOnLoaded("Skada") then
		if ViksUISettings.SkadaSettings then 
		step5() 	
		return end
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(4)
		header:SetText("4. Skada")
		text1:SetText("This step will setup Skada 3 Window profile.")
		text2:SetText("This step is |cffff0000recommended|r for new users.")
		text3:SetText("|cffff0000NB! NOTE|r this step overwrite Skadas current settings.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("4/ "..maxsteps)
		option1:SetScript("OnClick", step5)
		option2:SetScript("OnClick", function()
			--positionsetup()
			UploadSkada()
			ViksUISettings.SkadaSettings = true
			step5()
		end)
	else
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(4)
		header:SetText("4. Damage Meters")
		text1:SetText("Skada or Details was not detected! Both settings will be added")
		text2:SetText("This step is |cffff0000recommended|r for new users.")
		text3:SetText("|cffff0000NB! NOTE|r this step overwrite Skadas and Details current settings.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("4/ "..maxsteps)
		option1:SetScript("OnClick", step5)
		option2:SetScript("OnClick", function()
			--positionsetup()
			UploadSkada()
			ViksUISettings.SkadaSettings = true
			UploadDetails()
			ViksUISettings.DetailsSettings = true
			step5()
		end)
	end
end
-- Step 4 / Setting up bartenders profile
local step3 = function()
	if IsAddOnLoaded("Bartender4") then
		if ViksUISettings.BTSettings then 
		step4() 
		return end
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(3)
		header:SetText("3. Bartender")
		text1:SetText("This step will setup bartender profile.")
		text2:SetText("This step is |cffff0000recommended|r for new users.")
		text3:SetText("|cffff0000NB! NOTE|r this step overwrite bartender current settings.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("3/ "..maxsteps)
		option1:SetScript("OnClick", step4)
		option2:SetScript("OnClick", function()
			--positionsetup()
			UploadBartender()
			ViksUISettingsPerChar.BartenderSet = false
			ViksUISettings.BTSettings = true
			step4()
		end)
	else
		if not option2:IsShown() then option2:Show() end
		sb:SetValue(3)
		header:SetText("3. Bartender addon is missing!!!")
		text1:SetText("ViksUI mainly uses Bartender 3 for actionbars.")
		text2:SetText("The addon will not look the same with default built in actionbars")
		text3:SetText("|cffff0000NB! NOTE|r Apply settings for Bartender 3 still?.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		sbt:SetText("3/ "..maxsteps)
		option1:SetScript("OnClick", step4)
		option2:SetScript("OnClick", function()
			--positionsetup()
			UploadBartender()
			ViksUISettingsPerChar.BartenderSet = false
			ViksUISettings.BTSettings = true
			step4()
		end)	
	end
end
-- Step 3 / Setting Sosial (chat++)
local step2 = function()
	sb:SetValue(2)
	header:SetText("2. Social")
	sbt:SetText("2/ "..maxsteps)
	if IsAddOnLoaded("Prat") or IsAddOnLoaded("Chatter") then
		text1:SetText("Another chat addon is found.  We will ignore this step.  Please press skip to continue installation.")
		option2:Hide()
	else
		text1:SetText("The second step applies the correct chat setup.")
		text2:SetText("If you are a new user, this step is recommended.  If you are an existing user, you may want to skip this step.")
		text3:SetText("It is normal that your chat font will appear too big upon applying these settings.  It will revert back to normal when you finish with the installation.")
		text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
		option2:SetScript("OnClick", function()
			T.ChatSetup()
			step3()
		end)
	end
	option1:SetScript("OnClick", step3)
end
-- Step 2 / Setting Cvars and Masque
local step1 = function()
	close:Hide()
	sb:SetMinMaxValues(0, 7) -- Setting amount of steps for Progressbar
	sb:Show()
	sb:SetValue(1)
	sb:SetStatusBarColor(.26, 1, .22)
	header:SetText("1. Essential Settings")
	text1:SetText("These steps will apply the correct CVar settings for ViksUI.")
	text2:SetText("The first step applies the essential settings.")
	text3:SetText("This is |cffff0000recommended|r for any user, unless you want to apply only a specific part of the settings.")
	text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
	sbt:SetText("1/ "..maxsteps)
	option1:Show()
	option1.Text:SetText("Skip")
	option2.Text:SetText("Continue")
	option1:SetText("Skip")
	option2:SetText("Continue")
	option1:SetScript("OnClick", step2)
	option2:SetScript("OnClick", function()
		cvarsetup()
		UploadMasque()
		step2()
	end)
	SetActionBarToggles(1, 1, 1, 1, 0)
	SetCVar("alwaysShowActionBars", 0)
end
-- Step 1 / Welcome
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
	if ViksUISettingsPerChar == nil then ViksUISettingsPerChar = {} end
	if ViksUISettingsPerChar.RaidLayout == nil then ViksUISettingsPerChar.RaidLayout = "UNKNOWN" end
	if ViksUIOptionsPerChar == nil then ViksUIOptionsPerChar = {} end
	if ViksUISettingsPerChar.experiencebar == nil  then ViksUISettingsPerChar.experiencebar = {
	["ViksUIExperienceBar1"] = "XP",
	["ViksUIExperienceBar2"] = "HONOR",
	}
	end
	if ViksUIOptions == nil then ViksUIOptions = {} end
	if ViksUIOptionsPerChar.unitframe == nil then ViksUIOptionsPerChar.unitframe = {} end
	if ViksUIOptions.unitframe == nil then ViksUIOptions.unitframe = {} end
	if ViksUIOptions.panels == nil then ViksUIOptions.panels = {} end
	if ViksUIOptionsPerChar.panels == nil then ViksUIOptionsPerChar.panels = {} end
	if ViksUIOptions.panels.NoPanels == nil then ViksUIOptions.panels.NoPanels = false end
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

	if ViksUISettingsPerChar.RaidLayout == "UNKNOWN" and ViksUISettingsPerChar.Install then
		StaticPopup_Show("SWITCH_RAID")
	end
	if IsAddOnLoaded("Bartender4") then
		if ViksUISettingsPerChar.Install and ViksUISettingsPerChar.BartenderSet ~= true and ViksUIOptions.panels.NoPanels then
			StaticPopup_Show("SET_BTLine")
			ViksUISettingsPerChar.BartenderSet = true
		end
		if ViksUISettingsPerChar.Install and ViksUISettingsPerChar.BartenderSet ~= true and ViksUIOptions.panels.NoPanels ~= true then
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

StaticPopupDialogs.SWITCH_RAID = {
	text = L_POPUP_SWITCH_RAID,
	button1 = DAMAGER,
	button2 = HEALER,
	--button3 = "Blizzard",
	OnAccept = function() ViksUIOptionsPerChar.unitframe.HealFrames = false ViksUIOptions.unitframe.HealFrames = false ViksUISettingsPerChar.RaidLayout = "DPS" ReloadUI() end,
	OnCancel = function() ViksUIOptionsPerChar.unitframe.HealFrames = true ViksUIOptions.unitframe.HealFrames = true ViksUISettingsPerChar.RaidLayout = "HEAL" ReloadUI() end,
	--OnAlt = function() ViksUISettingsPerChar.RaidLayout = "NONE" ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
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
SlashCmdList.SET_BTLine = function() StaticPopup_Show("SET_BT") end

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
		if IsAddOnLoaded("DBM-Core") and C.skins.dbm then T.UploadDBM() end
		if IsAddOnLoaded("BigWigs") and C.skins.bigwigs then T.UploadBW() end
		if IsAddOnLoaded("MikScrollingBattleText") then UploadMSBT() end
		if IsAddOnLoaded("Skada") then UploadSkada() end
		if IsAddOnLoaded("Bartender4") then UploadBartender() end
		if IsAddOnLoaded("Details") then UploadDetails() end
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
		if IsAddOnLoaded("DBM-Core") then
			if C.skins.dbm == true then
				StaticPopup_Show("SETTINGS_DBM")
			else
				print("|cffffff00"..L_INFO_SKIN_DISABLED1.."DBM"..L_INFO_SKIN_DISABLED2.."|r")
			end
		else
			print("|cffffff00DBM"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "bw" then
		if IsAddOnLoaded("BigWigs") then
			if C.skins.bigwigs == true then
				StaticPopup_Show("SETTINGS_BIGWIGS")
			else
				print("|cffffff00"..L_INFO_SKIN_DISABLED1.."BigWigs"..L_INFO_SKIN_DISABLED2.."|r")
			end
		else
			print("|cffffff00BigWigs"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "msbt" then
		if IsAddOnLoaded("MikScrollingBattleText") then
			UploadMSBT()
			ReloadUI()
		else
			print("|cffffff00MSBT"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "details" then
		if IsAddOnLoaded("Details") then
			UploadDetails()
			ReloadUI()
		else
			print("|cffffff00Details"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "skada" then
		if IsAddOnLoaded("Skada") then
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
		if IsAddOnLoaded("Details") then
			UploadDetails()
			ReloadUI()
		else
			print("|cffffff00Bartender"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "bartender" then
		if IsAddOnLoaded("Bartender4") then
			UploadBartender()
			ReloadUI()
		else
			print("|cffffff00Bartender"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "OPie" then
		if IsAddOnLoaded("OPie") then
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