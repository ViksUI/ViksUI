local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	First Time Launch and On Login file
----------------------------------------------------------------------------------------


local function InstallUI()
	-- Don't need to set CVar multiple time
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
	SetCVar("autoQuestProgress", 1)
	SetCVar("scriptErrors", 1)
	SetCVar("taintLog", 0)
	SetCVar("buffDurations", 1)
	SetCVar("autoOpenLootHistory", 0)
	SetCVar("lossOfControl", 0)
	SetCVar("threatWarning", 3)
	SetCVar('SpamFilter', 0)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("nameplateShowSelf", 0)

	-- Setting chat frames
	if C.chat.enable == true and not (IsAddOnLoaded("Prat-3.0") or IsAddOnLoaded("Chatter")) then
	--FCF_ResetChatWindows()
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
	-- Setup the Trade / Locale spam chat frame	
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddChannel(ChatFrame3, "Trade")
	ChatFrame_AddChannel(ChatFrame3, "General")
	ChatFrame_AddChannel(ChatFrame3, "LocalDefense")
	ChatFrame_AddChannel(ChatFrame3, "GuildRecruitment")
	ChatFrame_AddChannel(ChatFrame3, "LookingForGroup")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
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

	-- Reset saved variables on char
	SavedPositions = {}
	SavedOptionsPerChar = {}
	
	SavedOptionsPerChar.Install = true
	SavedOptionsPerChar.FogOfWar = false
	SavedOptionsPerChar.AutoInvite = false
	SavedOptionsPerChar.Archaeology = false
	SavedOptionsPerChar.BarsLocked = false
	SavedOptionsPerChar.SplitBars = true
	SavedOptionsPerChar.LootFrame = true
	SavedOptionsPerChar.DamageMeter = false
	SavedOptionsPerChar.RightBars = C.actionbar.rightbars
	SavedOptionsPerChar.BottomBars = C.actionbar.bottombars
----------------------------------------------------------------------------------------
--	Few Addons Settings
----------------------------------------------------------------------------------------









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

MBFDB = {
	["profiles"] = {
		["Default"] = {
			["ButtonOverride"] = {
				[11] = "QueueStatusMinimapButton",
			},
			["columns_or_rows"] = 4,
			["locked"] = true,
			["currentMinimapIcon"] = "QueueStatusMinimapButtonIcon",
			["mbfHidden"] = true,
			["GrowUp"] = false,
			["currentButtonOverride"] = "QueueStatusMinimapButton",
			["minimapButton"] = {
				["minimapPos"] = 192.7577142010699,
			},
			["mbfAnchor"] = "TOPLEFT",
			["MBF_FrameLocation"] = {
				"TOPLEFT", -- [1]
				nil, -- [2]
				-172.2963331240912, -- [3]
				-223.7184393402793, -- [4]
			},
			["currentChild"] = "LibDBIcon10_KLE",
			["colorLocked"] = "All",
			["MinimapIcons"] = {
				[14] = "Compass",
				[17] = "ArchyMinimap",
				[18] = "QueueStatusMinimapButtonIcon",
			},
			["currentTexture"] = "simple Square",
			["customChildren"] = {
				"MinimapButtonFrameDragButton", -- [1]
				"MiniMapMailFrameDisabled", -- [2]
				"LibDBIcon10_MrPlowLDB", -- [3]
				"LibDBIcon10_Bartender4", -- [4]
				"DBMMinimapButton", -- [5]
				"LibDBIcon10_PitBull4", -- [6]
				"LibDBIcon10_Broker_Auditor", -- [7]
				"LibDBIcon10_TravelAgent", -- [8]
				"LibDBIcon10_Omen", -- [9]
				"LibDBIcon10_Skada", -- [10]
				"tdpsButtonFrame", -- [11]
				"LibDBIcon10_DXE", -- [12]
				"LibDBIcon10_Broker_Portals", -- [13]
				"ZygorGuidesViewerMapIcon", -- [14]
				"LibDBIcon10_BugSack", -- [15]
				"FuBarPluginAtlasLootFuFrameMinimapButton", -- [16]
				"OutfitterMinimapButton", -- [17]
				"VuhDoMinimapButton", -- [18]
				"LibDBIcon10_MorgDKP2", -- [19]
				"MageNug_MinimapFrame", -- [20]
				"LibDBIcon10_Broker_Calendar", -- [21]
				"BT_Minimapbtn", -- [22]
				"FuBarPluginBig BrotherFrameMinimapButton", -- [23]
				"LibDBIcon10_ElkGuild", -- [24]
				"RA_MinimapButton", -- [25]
				"Minimalist_Map", -- [26]
				"LibDBIcon10_WoWProIcon", -- [27]
				"LibDBIcon10_AtlasLoot", -- [28]
				"LibDBIcon10_ArchyLDB", -- [29]
				"ArchyMinimap_POI1", -- [30]
				"ArchyMinimap_POI2", -- [31]
				"ArchyMinimap_POI3", -- [32]
				"ArchyMinimap_POI4", -- [33]
				"ArchyMinimap_POI5", -- [34]
				"ArchyMinimap_POI6", -- [35]
				"ArchyMinimap_POI7", -- [36]
				"ArchyMinimap_POI8", -- [37]
				"ArchyMinimap_POI9", -- [38]
				"ArchyMinimap_POI10", -- [39]
				"ArchyMinimap_POI11", -- [40]
				"ArchyMinimap_POI12", -- [41]
				"ArchyMinimap_POI13", -- [42]
				"ArchyMinimap_POI14", -- [43]
				"PS_MinimapButton", -- [44]
				"RBSMinimapButton", -- [45]
				"LibDBIcon10_BigWigs", -- [46]
				"kgPanel7", -- [47]
				"TenTonHammer_MinimapButton", -- [48]
				"LibDBIcon10_KLE", -- [49]
				"Compass", -- [50]
				"LibDBIcon10_MBF", -- [51]
				"LibDBIcon10_Archy", -- [52]
				"LibDBIcon10_TradeSkillMaster", -- [53]
				"bUnitFrames_MinimapButton", -- [54]
				"LibDBIcon10_Masque", -- [55]
				"QueueStatusMinimapButton", -- [56]
				"HealBot_ButtonFrame", -- [57]
				"MMHolder", -- [58]
				"LeftMiniPanel", -- [59]
				"RightMiniPanel", -- [60]
			},
			["padding"] = 3,
		},
	},
}

	if SavedOptionsPerChar.RaidLayout ~= "UNKNOWN" then
		ReloadUI()
	else
		StaticPopup_Show("SWITCH_RAID")
	end
end

local function DisableUI()
	DisableAddOn("ViksUI")
	ReloadUI()
end


----------------------------------------------------------------------------------------
--	Popups
----------------------------------------------------------------------------------------
StaticPopupDialogs.INSTALL_UI = {
	text = L_POPUP_INSTALLUI,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = InstallUI,
	OnCancel = function() SavedOptionsPerChar.Install = false
	if SavedOptionsPerChar.RaidLayout == "UNKNOWN" then StaticPopup_Show("SWITCH_RAID") end end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
	preferredIndex = 5,
}

StaticPopupDialogs.SKADAINST_UI = {
	text = "Install settings for Skada",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = Skadasetup,
	showAlert = true,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

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
	OnCancel = function() SavedOptionsPerChar.Install = true end,
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
	OnAccept = function() SavedStats = {} ReloadUI() end,
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
	OnAccept = function() GUIConfig.unitframe.HealFrames = false GUIConfigSettings.unitframe.HealFrames = false SavedOptionsPerChar.RaidLayout = "DPS" ReloadUI() end,
	OnCancel = function() GUIConfig.unitframe.HealFrames = true GUIConfigSettings.unitframe.HealFrames = true SavedOptionsPerChar.RaidLayout = "HEAL" ReloadUI() end,
	--OnAlt = function() SavedOptionsPerChar.RaidLayout = "NONE" ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
	preferredIndex = 5,
}

SLASH_CONFIGURE1 = "/resetui"
SlashCmdList.CONFIGURE = function() StaticPopup_Show("RESET_UI") end

SLASH_CONFIGURE1 = "/installui"
SlashCmdList.CONFIGURE = function() StaticPopup_Show("INSTALL_UI") end

SLASH_RESETSTATS1 = "/resetstats"
SlashCmdList.RESETSTATS = function() StaticPopup_Show("RESET_STATS") end

SLASH_SKADA1 = "/skadasetup_ui"
SlashCmdList.SKADA = function() StaticPopup_Show("SKADAINST_UI") end
----------------------------------------------------------------------------------------
--	On logon function
----------------------------------------------------------------------------------------
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
			StaticPopup_Show("INSTALL_UI")
		end
	end

	if SavedOptionsPerChar.RaidLayout == "UNKNOWN" and SavedOptionsPerChar.Install then
		StaticPopup_Show("SWITCH_RAID")
	end

	-- Welcome message
	if C.general.welcome_message == true then
		print("|cffffff00".."Welcome to ViksUI "..T.version.." "..T.client..", "..T.name)
		print("|cffffff00".."Type /config to config interface".." |cffffff00".."for more informations.")
	end
end)
