local T, C, L, _ = unpack(select(2, ...))

T.ChatSetup = function()
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
		
		-- set default font size
		FCF_SetChatWindowFontSize(nil, frame, 11)
		
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
	---Chat Channels Setup
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_RemoveChannel(ChatFrame1, TRADE)
	ChatFrame_RemoveChannel(ChatFrame1, GENERAL)
	ChatFrame_RemoveChannel(ChatFrame1, "LocalDefense")
	ChatFrame_RemoveChannel(ChatFrame1, "GuildRecruitment")
	ChatFrame_RemoveChannel(ChatFrame1, "LookingForGroup")
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame1, "PET_BATTLE_INFO")
	-- Setup the Trade / Locale spam chat frame	
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddChannel(ChatFrame3, TRADE)
	ChatFrame_AddChannel(ChatFrame3, GENERAL)
	ChatFrame_AddChannel(ChatFrame3, "LocalDefense")
	ChatFrame_AddChannel(ChatFrame3, "GuildRecruitment")
	ChatFrame_AddChannel(ChatFrame3, "LookingForGroup")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_MISC_INFO")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame3, "CHANNEL")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame3, "SKILL")
	ChatFrame_AddMessageGroup(ChatFrame3, "CURRENCY")
	ChatFrame_AddMessageGroup(ChatFrame3, "OPENING")
	ChatFrame_AddMessageGroup(ChatFrame3, "TRADESKILLS")
	-- Setup the guild chat frame
	ChatFrame_RemoveAllMessageGroups(ChatFrame4)
	ChatFrame_AddMessageGroup(ChatFrame4, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame4, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame4, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame4, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame4, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame4, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_GUILD_XP_GAIN")
	-- enable classcolor automatically on login and on each character without doing /configure each time.
	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")	
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")		
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL6")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL7")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL8")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL9")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL10")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL11")
	--Adjust Chat Colors
	--General
	ChangeChatColor("CHANNEL1", 195/255, 230/255, 232/255)
	--Trade
	ChangeChatColor("CHANNEL2", 232/255, 158/255, 121/255)
	--Local Defense
	ChangeChatColor("CHANNEL3", 232/255, 228/255, 121/255)
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
	SetCVar("chatStyle", "im")
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
	SetCVar("buffDurations", 1)
	SetCVar("autoOpenLootHistory", 0)
	SetCVar("violenceLevel", 5)
	SetCVar("lossOfControl", 0)
	SetCVar("threatWarning", 3)
	SetCVar('SpamFilter', 0)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("nameplateShowSelf", 0)
end

local UploadBartender = function()

Bartender4DB = {
	["namespaces"] = {
		["StatusTrackingBar"] = {
		},
		["ActionBars"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["actionbars"] = {
						{
							["showgrid"] = true,
							["padding"] = 8,
							["version"] = 3,
							["position"] = {
								["y"] = 125,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
						}, -- [1]
						{
							["showgrid"] = true,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["fadeoutalpha"] = 0.3,
							["padding"] = 8,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
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
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 6,
							["hidemacrotext"] = true,
							["padding"] = 6,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
						}, -- [3]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["hidemacrotext"] = true,
							["padding"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
						}, -- [4]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["hidemacrotext"] = true,
							["padding"] = 3,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
						}, -- [5]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["rows"] = 6,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["padding"] = 11,
						}, -- [6]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["rows"] = 6,
							["padding"] = 11,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["showgrid"] = true,
						}, -- [7]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["hidemacrotext"] = true,
							["padding"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
						}, -- [8]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 6,
							["hidemacrotext"] = true,
							["padding"] = 6,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
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
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["position"] = {
								["y"] = 180,
								["x"] = -654.5,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
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
							["version"] = 3,
							["showgrid"] = true,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["padding"] = 8,
							["fadeoutalpha"] = 0.3,
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
							["showgrid"] = true,
							["padding"] = 3,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["hidemacrotext"] = true,
							["rows"] = 2,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["buttons"] = 6,
						}, -- [5]
						{
							["version"] = 3,
							["showgrid"] = true,
							["rows"] = 12,
							["padding"] = 8,
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
							["showgrid"] = true,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 11,
							["rows"] = 6,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
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
							["version"] = 3,
							["showgrid"] = true,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["padding"] = 8,
							["fadeoutalpha"] = 0.3,
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
								["scale"] = 0.8,
								["x"] = 0.4,
								["point"] = "LEFT",
								["y"] = 116.5,
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
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["position"] = {
								["scale"] = 0.8,
								["x"] = 0.4,
								["point"] = "LEFT",
								["y"] = 82,
							},
							["padding"] = 9,
							["alpha"] = 0.5,
							["showgrid"] = true,
						}, -- [4]
						{
							["padding"] = 3,
							["position"] = {
								["scale"] = 0.75,
								["x"] = 279,
								["point"] = "BOTTOM",
								["y"] = 113,
							},
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["hidemacrotext"] = true,
							["rows"] = 2,
							["showgrid"] = true,
							["buttons"] = 6,
						}, -- [5]
						{
							["position"] = {
								["scale"] = 0.76,
								["x"] = -35,
								["point"] = "RIGHT",
								["y"] = 201.4,
							},
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["rows"] = 12,
							["padding"] = 8,
							["fadeout"] = true,
							["showgrid"] = true,
						}, -- [6]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 6,
							["version"] = 3,
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
							["fadeoutalpha"] = 0.3,
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
								["scale"] = 0.75,
								["x"] = -372,
								["point"] = "BOTTOM",
								["y"] = 112.5,
							},
							["buttons"] = 6,
						}, -- [8]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 6,
							["position"] = {
								["scale"] = 0.7,
								["x"] = 524,
								["point"] = "BOTTOM",
								["y"] = 188,
							},
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 6,
							["hidemacrotext"] = true,
							["fadeout"] = true,
							["buttons"] = 6,
						}, -- [9]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 7,
							["position"] = {
								["scale"] = 0.7,
								["x"] = -557,
								["point"] = "BOTTOM",
								["y"] = 188,
							},
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 6,
							["hidemacrotext"] = true,
							["fadeout"] = true,
							["buttons"] = 6,
						}, -- [10]
					},
				},
				["ViksUI"] = {
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
							["showgrid"] = true,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["fadeoutalpha"] = 0.3,
							["padding"] = 8,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["states"] = {
								["enabled"] = true,
								["default"] = 2,
							},
						}, -- [2]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 9,
							["alpha"] = 0.5,
							["position"] = {
								["y"] = 116.5,
								["x"] = 0.4,
								["point"] = "LEFT",
								["scale"] = 0.8,
							},
						}, -- [3]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 9,
							["alpha"] = 0.5,
							["position"] = {
								["y"] = 82,
								["x"] = 0.4,
								["point"] = "LEFT",
								["scale"] = 0.8,
							},
						}, -- [4]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["version"] = 3,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["rows"] = 2,
							["hidemacrotext"] = true,
							["padding"] = 3,
							["showgrid"] = true,
						}, -- [5]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 8,
							["position"] = {
								["y"] = 201.4,
								["x"] = -35,
								["point"] = "RIGHT",
								["scale"] = 0.76,
							},
							["rows"] = 12,
						}, -- [6]
						{
							["enabled"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["rows"] = 6,
							["padding"] = 11,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["showgrid"] = true,
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
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["padding"] = 3,
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
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
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
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["position"] = {
								["y"] = 180,
								["x"] = -654.5,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [10]
					},
				},
				["ViksUILine"] = {
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
							["fadeout"] = true,
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
							["fadeout"] = true,
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
							["padding"] = 3,
							["version"] = 3,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["hidemacrotext"] = true,
						}, -- [5]
						{
							["showgrid"] = true,
							["rows"] = 12,
							["fadeout"] = true,
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
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["version"] = 3,
							["fadeoutalpha"] = 0.3,
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
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 187,
								["x"] = 524,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [9]
						{
							["showgrid"] = true,
							["rows"] = 7,
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 188,
								["x"] = -557,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [10]
					},
				},
				["ViksUIDruidLine"] = {
					["actionbars"] = {
						{
							["showgrid"] = true,
							["padding"] = 8,
							["version"] = 3,
							["position"] = {
								["y"] = 125,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
						}, -- [1]
						{
							["showgrid"] = true,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["fadeoutalpha"] = 0.3,
							["padding"] = 8,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["states"] = {
								["enabled"] = true,
								["default"] = 2,
							},
						}, -- [2]
						{
							["showgrid"] = true,
							["rows"] = 6,
							["buttons"] = 6,
							["fadeout"] = true,
							["position"] = {
								["scale"] = 0.7,
								["x"] = 524,
								["point"] = "BOTTOM",
								["y"] = 188,
							},
							["version"] = 3,
							["padding"] = 6,
							["hidemacrotext"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
						}, -- [3]
						{
							["position"] = {
								["scale"] = 0.75,
								["x"] = -372,
								["point"] = "BOTTOM",
								["y"] = 112.5,
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["padding"] = 3,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [4]
						{
							["position"] = {
								["scale"] = 0.75,
								["x"] = 279,
								["point"] = "BOTTOM",
								["y"] = 113,
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["padding"] = 3,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [5]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["rows"] = 6,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["padding"] = 11,
						}, -- [6]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["rows"] = 6,
							["padding"] = 11,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["showgrid"] = true,
						}, -- [7]
						{
							["position"] = {
								["scale"] = 0.75,
								["x"] = -372,
								["point"] = "BOTTOM",
								["y"] = 112.5,
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["padding"] = 3,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [8]
						{
							["position"] = {
								["scale"] = 0.7,
								["x"] = 624,
								["point"] = "BOTTOM",
								["y"] = 180,
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 6,
							["padding"] = 6,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [9]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 7,
							["buttons"] = 6,
							["fadeout"] = true,
							["position"] = {
								["scale"] = 0.7,
								["x"] = -557,
								["point"] = "BOTTOM",
								["y"] = 188,
							},
							["version"] = 3,
							["padding"] = 6,
							["hidemacrotext"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
						}, -- [10]
					},
				},
			},
		},
		["APBar"] = {
		},
		["LibDualSpec-1.0"] = {
		},
		["ExtraActionBar"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
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
				["ViksUIRogueLine"] = {
					["position"] = {
						["scale"] = 1.5,
						["x"] = 150,
						["point"] = "CENTER",
						["y"] = 47,
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUI"] = {
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
				["ViksUILine"] = {
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
				["ViksUIDruidLine"] = {
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["version"] = 3,
					["position"] = {
						["scale"] = 1.5,
						["x"] = 150,
						["point"] = "CENTER",
						["y"] = 47,
					},
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
				["ViksUIRogue"] = {
					["version"] = 3,
					["position"] = {
						["y"] = -40.7500305175781,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["position"] = {
						["y"] = -40.7500305175781,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = -40.7499389648438,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUILine"] = {
					["position"] = {
						["y"] = -40.7499389648438,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
					["version"] = 3,
				},
				["ViksUIDruidLine"] = {
					["version"] = 3,
					["position"] = {
						["y"] = -40.7500305175781,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
				},
			},
		},
		["MicroMenu"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["fadeoutalpha"] = 0,
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
					["fadeoutdelay"] = 0.69,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["version"] = 3,
				},
				["ViksUIRogue"] = {
					["version"] = 3,
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
					["fadeoutdelay"] = 0,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["fadeout"] = true,
				},
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutdelay"] = 0,
					["position"] = {
						["y"] = 150,
						["x"] = -65,
						["point"] = "RIGHT",
					},
					["fadeoutalpha"] = 0,
					["rows"] = 11,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["fadeout"] = true,
				},
				["ViksUI"] = {
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["version"] = 3,
					["visibility"] = {
						["custom"] = true,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["position"] = {
						["y"] = 222,
						["x"] = -306,
						["point"] = "BOTTOMRIGHT",
					},
				},
				["ViksUILine"] = {
					["rows"] = 11,
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["visibility"] = {
						["custom"] = true,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["position"] = {
						["y"] = 150,
						["x"] = -65,
						["point"] = "RIGHT",
						["scale"] = 0.800000011920929,
					},
				},
				["ViksUIDruidLine"] = {
					["fadeout"] = true,
					["position"] = {
						["y"] = 150,
						["x"] = -65,
						["point"] = "RIGHT",
					},
					["fadeoutalpha"] = 0,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutdelay"] = 0.69,
					["rows"] = 11,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["version"] = 3,
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
				["ViksUIDruid"] = {
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
			},
		},
		["MultiCast"] = {
			["profiles"] = {
				["ViksUI"] = {
					["enabled"] = false,
					["position"] = {
						["y"] = 35.0000026671023,
						["x"] = 284.333404478858,
						["point"] = "BOTTOMLEFT",
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
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
				["ViksUIRogue"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
				["ViksUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
				["ViksUILine"] = {
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
				["ViksUIDruidLine"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
			},
		},
		["Vehicle"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["position"] = {
						["y"] = 144.500122070313,
						["x"] = 315.5,
						["point"] = "CENTER",
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
						["y"] = 83.2500610351563,
						["x"] = 203.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUIRogueLine"] = {
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
				["ViksUILine"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["position"] = {
						["y"] = 83.2500610351563,
						["x"] = 203.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUIDruidLine"] = {
					["position"] = {
						["y"] = 144.500122070313,
						["x"] = 315.5,
						["point"] = "CENTER",
					},
					["version"] = 3,
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
				["ViksUI"] = {
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
				["ViksUILine"] = {
					["enabled"] = false,
					["position"] = {
						["y"] = 41.75,
						["x"] = 463.5,
						["point"] = "BOTTOM",
					},
					["onebag"] = true,
					["version"] = 3,
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
			},
		},
		["StanceBar"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 209,
						["x"] = 335,
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
				["ViksUIRogue"] = {
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
						["customdata"] = "[mod:ctrl]show;hide",
						["always"] = false,
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
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
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
						["scale"] = 0.75,
						["x"] = 334.999969482422,
						["point"] = "BOTTOMLEFT",
						["y"] = 238.249992370606,
					},
				},
				["ViksUI"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
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
				["ViksUILine"] = {
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["version"] = 3,
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
						["y"] = 238.249992370606,
						["x"] = 334.999969482422,
						["point"] = "BOTTOMLEFT",
						["scale"] = 0.75,
					},
				},
				["ViksUIDruidLine"] = {
					["version"] = 3,
					["position"] = {
						["scale"] = 0.75,
						["x"] = 335,
						["point"] = "BOTTOMLEFT",
						["y"] = 209,
					},
					["padding"] = 7,
					["visibility"] = {
						["custom"] = false,
						["possess"] = false,
						["customdata"] = "[mod:ctrl]show;hide",
						["always"] = false,
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
		["PetBar"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["fadeoutalpha"] = 1,
					["version"] = 3,
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
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogue"] = {
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
						["possess"] = false,
						["always"] = false,
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["fadeoutalpha"] = 1,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["position"] = {
						["scale"] = 0.600000023841858,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["y"] = 43.4560381037409,
					},
					["padding"] = 15,
					["visibility"] = {
						["always"] = false,
						["possess"] = false,
					},
					["fadeoutdelay"] = 0.1,
				},
				["ViksUI"] = {
					["position"] = {
						["y"] = 43.4560381037409,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["scale"] = 0.600000023841858,
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutdelay"] = 0.1,
					["padding"] = 15,
					["visibility"] = {
						["always"] = false,
						["possess"] = false,
					},
					["fadeoutalpha"] = 1,
				},
				["ViksUILine"] = {
					["version"] = 3,
					["fadeoutdelay"] = 0.1,
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
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIDruidLine"] = {
					["version"] = 3,
					["fadeoutdelay"] = 0.1,
					["position"] = {
						["scale"] = 0.600000023841858,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["y"] = 43.4560381037409,
					},
					["fadeoutalpha"] = 1,
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
				["ViksUIDruid"] = {
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
		["ViksUIRogue"] = {
			["onkeydown"] = true,
			["minimapIcon"] = {
				["hide"] = true,
			},
			["selfcastmodifier"] = false,
			["buttonlock"] = true,
		},
		["ViksUIRogueLine"] = {
			["onkeydown"] = true,
			["minimapIcon"] = {
				["hide"] = true,
			},
			["selfcastmodifier"] = false,
			["buttonlock"] = true,
		},
		["ViksUI"] = {
			["onkeydown"] = false,
			["selfcastmodifier"] = false,
			["minimapIcon"] = {
				["hide"] = true,
			},
			["buttonlock"] = true,
		},
		["ViksUILine"] = {
			["minimapIcon"] = {
				["hide"] = true,
			},
			["buttonlock"] = true,
			["onkeydown"] = false,
			["selfcastmodifier"] = false,
		},
		["ViksUIDruidLine"] = {
			["onkeydown"] = false,
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
			["modulesBlocked"] = {
				["CC"] = true,
				["Power"] = true,
			},
			["windows"] = {
				{
					["barslocked"] = true,
					["modeincombat"] = "Threat",
					["y"] = 80.5010528564453,
					["x"] = -340.9990234375,
					["name"] = "Threath",
					["point"] = "BOTTOMRIGHT",
					["barwidth"] = 167.000061035156,
					["mode"] = "Threat",
					["enablebackground"] = true,
					["background"] = {
						["borderthickness"] = 2,
						["height"] = 79.0000610351563,
					},
				}, -- [1]
				{
					["point"] = "BOTTOMRIGHT",
					["barcolor"] = {
						["a"] = 1,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.8,
					},
					["classcolortext"] = false,
					["mode"] = "Healing",
					["scale"] = 1,
					["reversegrowth"] = false,
					["snapto"] = true,
					["barfontsize"] = 12,
					["modeincombat"] = "",
					["name"] = "Heal",
					["barslocked"] = true,
					["x"] = -340.9996006869089,
					["barorientation"] = 1,
					["enabletitle"] = true,
					["wipemode"] = "",
					["returnaftercombat"] = false,
					["barbgcolor"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["bartexture"] = "Armory",
					["set"] = "current",
					["buttons"] = {
						["segment"] = true,
						["menu"] = true,
						["mode"] = true,
						["report"] = true,
						["reset"] = true,
					},
					["barwidth"] = 166.9996692109227,
					["barspacing"] = -0,
					["hidden"] = false,
					["background"] = {
						["borderthickness"] = -0,
						["color"] = {
							["a"] = 0.2,
							["r"] = -0,
							["g"] = -0,
							["b"] = 0.5,
						},
						["height"] = 53.99990795077569,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
					["y"] = 5.000074473703773,
					["barfont"] = "Accidental Presidency",
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
					["classcolorbars"] = false,
					["display"] = "bar",
					["clickthrough"] = false,
					["barfontflags"] = "",
					["barheight"] = 12,
				}, -- [2]
				{
					["classcolortext"] = false,
					["barcolor"] = {
						["a"] = 1,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.8,
					},
					["barheight"] = 15,
					["clickthrough"] = false,
					["scale"] = 1,
					["reversegrowth"] = false,
					["modeincombat"] = "DPS",
					["barfontsize"] = 11,
					["enabletitle"] = true,
					["name"] = "Dps",
					["barslocked"] = true,
					["x"] = 341.000020858108,
					["barorientation"] = 1,
					["mode"] = "DPS",
					["wipemode"] = "",
					["returnaftercombat"] = false,
					["barbgcolor"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["buttons"] = {
						["segment"] = true,
						["menu"] = true,
						["mode"] = true,
						["report"] = true,
						["reset"] = true,
					},
					["bartexture"] = "BantoBar",
					["set"] = "current",
					["barwidth"] = 163.0001646080854,
					["barspacing"] = -0,
					["hidden"] = false,
					["background"] = {
						["borderthickness"] = -0,
						["color"] = {
							["a"] = 0.2,
							["r"] = -0,
							["g"] = -0,
							["b"] = 0.5,
						},
						["height"] = 160.0000021883917,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
					["y"] = 5.000234226295153,
					["barfont"] = "Accidental Presidency",
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
					["classcolorbars"] = false,
					["display"] = "bar",
					["snapto"] = true,
					["barfontflags"] = "",
					["point"] = "BOTTOMLEFT",
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
		},
	},
}
end

local OnLogon = CreateFrame("Frame")
OnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
OnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	local CD = GetCVar("countdownForCooldowns")
	if CD == "1" then SetCVar("countdownForCooldowns", "0") end
end)

--local function positionsetup()
	--D.SetPerCharVariable("DuffedUIDataPerChar", {})
	--if DuffedUIDataPerChar.Move then DuffedUIDataPerChar.Move = {} end
--end

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

local step5 = function()
	SavedOptionsPerChar.Install = true
	sb:SetValue(5)
	PlaySoundFile("Sound\\interface\\LevelUp.wav")
	header:SetText("4. Success!")
	text1:SetText("Installation is complete.")
	text2:SetText("Please click the 'Finish' button to reload the UI.")
	text3:SetText("")
	text4:SetText("Enjoy ViksUI")
	sbt:SetText("5/5")
	option1:Hide()
	option2.Text:SetText("Finish")
	option2:SetText("Finish")
	option2:SetScript("OnClick", function() ReloadUI() end)
end

local step4 = function()
	if not option2:IsShown() then option2:Show() end
	sb:SetValue(4)
	header:SetText("4. Skada")
	text1:SetText("This step will setup Skada 3 Window profile.")
	text2:SetText("This step is |cffff0000recommended|r for new users.")
	text3:SetText("|cffff0000NB! NOTE|r this step overwrite Skadas current settings.")
	text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
	sbt:SetText("4/5")
	option1:SetScript("OnClick", step5)
	option2:SetScript("OnClick", function()
		--positionsetup()
		UploadSkada()	
		step5()
	end)
end

local step3 = function()
	if not option2:IsShown() then option2:Show() end
	sb:SetValue(3)
	header:SetText("3. Bartender")
	text1:SetText("This step will setup bartender profile.")
	text2:SetText("This step is |cffff0000recommended|r for new users.")
	text3:SetText("|cffff0000NB! NOTE|r this step overwrite bartender current settings.")
	text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
	sbt:SetText("3/5")
	option1:SetScript("OnClick", step4)
	option2:SetScript("OnClick", function()
		--positionsetup()
		UploadBartender()
		SavedOptionsPerChar.BartenderSet = false
		step4()
	end)
end

local step2 = function()
	sb:SetValue(2)
	header:SetText("2. Social")
	sbt:SetText("2/5")
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

local step1 = function()
	close:Hide()
	sb:SetMinMaxValues(0, 5)
	sb:Show()
	sb:SetValue(1)
	sb:SetStatusBarColor(.26, 1, .22)
	header:SetText("1. Essential Settings")
	text1:SetText("These steps will apply the correct CVar settings for ViksUI.")
	text2:SetText("The first step applies the essential settings.")
	text3:SetText("This is |cffff0000recommended|r for any user, unless you want to apply only a specific part of the settings.")
	text4:SetText("Click 'Continue' to apply the settings, or click 'Skip' if you wish to skip this step.")
	sbt:SetText("1/5")
	option1:Show()
	option1.Text:SetText("Skip")
	option2.Text:SetText("Continue")
	option1:SetText("Skip")
	option2:SetText("Continue")
	option1:SetScript("OnClick", step2)
	option2:SetScript("OnClick", function()
		cvarsetup()
		step2()
	end)
	SetActionBarToggles(1, 1, 1, 1, 0)
	SetCVar("alwaysShowActionBars", 0)
end

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
SLASH_SET_BT1 = "/vbt"
SlashCmdList.SET_BT = function() StaticPopup_Show("SET_BT") end

local OnLogon = CreateFrame("Frame")
OnLogon:RegisterEvent("PLAYER_LOGIN")
OnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_LOGIN")

	-- Create empty CVar if they doesn't exist
	if SavedOptions == nil then SavedOptions = {} end
	if SavedPositions == nil then SavedPositions = {} end
	if SavedAddonProfiles == nil then SavedAddonProfiles = {} end
	if SavedOptionsPerChar == nil then SavedOptionsPerChar = {} end
	if SavedOptionsPerChar.RaidLayout == nil then SavedOptionsPerChar.RaidLayout = "UNKNOWN" end
	if GUIConfig == nil then GUIConfig = {} end
	if GUIConfigSettings == nil then GUIConfigSettings = {} end
	if GUIConfig.unitframe == nil then GUIConfig.unitframe = {} end
	if GUIConfigSettings.unitframe == nil then GUIConfigSettings.unitframe = {} end
	if SavedOptionsPerChar.FogOfWar == nil then SavedOptionsPerChar.FogOfWar = false end
	if SavedOptionsPerChar.AutoInvite == nil then SavedOptionsPerChar.AutoInvite = false end
	if SavedOptionsPerChar.Archaeology == nil then SavedOptionsPerChar.Archaeology = false end
	if SavedOptionsPerChar.BarsLocked == nil then SavedOptionsPerChar.BarsLocked = false end
	if SavedOptionsPerChar.SplitBars == nil then SavedOptionsPerChar.SplitBars = true end
	if SavedOptionsPerChar.RightBars == nil then SavedOptionsPerChar.RightBars = C.actionbar.rightbars end
	if SavedOptionsPerChar.BottomBars == nil then SavedOptionsPerChar.BottomBars = C.actionbar.bottombars end

	if T.getscreenwidth < 1024 and GetCVar("gxMonitor") == "0" then
		SetCVar("useuiscale", 0)
		StaticPopup_Show("DISABLE_UI")
	else
		SetCVar("useuiscale", 1)
		if C.general.uiscale > 1.28 then C.general.uiscale = 1.28 end
		if C.general.uiscale < 0.64 then C.general.uiscale = 0.64 end

		-- Set our uiscale
		SetCVar("uiscale", C.general.uiscale)

		-- Hack for 4K and WQHD Resolution
		local customScale = min(2, max(0.32, 768 / string.match(T.resolution, "%d+x(%d+)")))
		if C.general.auto_scale == true and customScale < 0.64 then
			UIParent:SetScale(customScale)
		elseif customScale < 0.64 then
			UIParent:SetScale(C.general.uiscale)
		end

		-- Install default if we never ran ViksUI on this character
		if not SavedOptionsPerChar.Install then
			install()
		end
	end

	if SavedOptionsPerChar.RaidLayout == "UNKNOWN" and SavedOptionsPerChar.Install then
		StaticPopup_Show("SWITCH_RAID")
	end
	
	if SavedOptionsPerChar.BartenderSet ~= true then
		StaticPopup_Show("SET_BT")
		SavedOptionsPerChar.BartenderSet = true
	end

	-- Welcome message
	if C.general.welcome_message == true then
		print("|cffffff00".."Welcome to ViksUI "..T.version.." "..T.client..", "..T.name)
		print("|cffffff00".."Type /config to config interface".." |cffffff00".."for more informations.")
	end
	
	-- Force load some cvars
	C_Timer.After(1, function() -- Making sure other addons don't turn this off
		SetCVar("cameraDistanceMaxZoomFactor", 2.6) -- Set Max camera distance
		SetCVar("scriptErrors", 1) -- Making sure to show lua errors.
	end)
end)

SLASH_CONFIGURE1 = "/resetui"
SlashCmdList.CONFIGURE = function() StaticPopup_Show("RESET_UI") end

SLASH_CONFIGURE1 = "/installui"
SlashCmdList['CONFIGURE'] = install

SLASH_RESETSTATS1 = "/resetstats"
SlashCmdList.RESETSTATS = function() StaticPopup_Show("RESET_STATS") end
