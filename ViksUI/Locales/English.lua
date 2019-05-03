local T, C, L, _ = unpack(select(2, ...))

------------------------------------------------
L.DataText = {} -- Data Text Locales
------------------------------------------------

L.DataText.LootSpec = "Loot Specialization"
L.DataText.Garrison = "Garrison"
L.DataText.Zone = "Zone"
L.DataText.AvoidanceBreakdown = "Avoidance Breakdown"
L.DataText.Level = "Lvl"
L.DataText.Boss = "Boss"
L.DataText.Miss = "Miss"
L.DataText.Dodge = "Dodge"
L.DataText.Block = "Block"
L.DataText.Parry = "Parry"
L.DataText.Avoidance = "Avoidance"
L.DataText.AvoidanceShort = "Avd: "
L.DataText.Memory = "Memory"
L.DataText.Hit = "Hit"
L.DataText.Power = "Power"
L.DataText.Mastery = "Mastery"
L.DataText.Crit = "Crit"
L.DataText.Regen = "Regen"
L.DataText.Versatility = "Versatility"
L.DataText.Leech = "Leech"
L.DataText.Multistrike = "Multistrike"
L.DataText.Session = "Session: "
L.DataText.Earned = "Earned:"
L.DataText.Spent = "Spent:"
L.DataText.Deficit = "Deficit:"
L.DataText.Profit = "Profit:"
L.DataText.Character = "Character: "
L.DataText.Server = "Server: "
L.DataText.Gold = "Gold"
L.DataText.TotalGold = "Total: "
L.DataText.GoldShort = "|cffffd700g|r"
L.DataText.SilverShort = "|cffc7c7cfs|r"
L.DataText.CopperShort = "|cffeda55fc|r"
L.DataText.Talents = "Talents"
L.DataText.NoTalent = "No Talents"
L.DataText.Download = "Download: "
L.DataText.Bandwidth = "Bandwidth: "
L.DataText.Guild = "Guild"
L.DataText.NoGuild = "No Guild"
L.DataText.Bags = "Bags"
L.DataText.BagSlots = "Bags Slots"
L.DataText.Friends = "Friends"
L.DataText.Online = "Online: "
L.DataText.Armor = "Armor"
L.DataText.Durability = "Durability"
L.DataText.TimeTo = "Time to"
L.DataText.FriendsList = "Friends list:"
L.DataText.Spell = "SP"
L.DataText.AttackPower = "AP"
L.DataText.Haste = "Haste"
L.DataText.DPS = "DPS"
L.DataText.HPS = "HPS"
L.DataText.Session = "Session: "
L.DataText.Character = "Character: "
L.DataText.Server = "Server: "
L.DataText.Total = "Total: "
L.DataText.SavedRaid = "Saved Raid(s)"
L.DataText.Currency = "Currency"
L.DataText.FPS = "FPS &"
L.DataText.MS = "MS"
L.DataText.FPSAndMS = "FPS & MS"
L.DataText.Critical = " Crit"
L.DataText.Heal = " Heal"
L.DataText.Time = "Time"
L.DataText.ServerTime = "Server Time: "
L.DataText.LocalTime = "Local Time: "
L.DataText.Mitigation = "Mitigation By Level: "
L.DataText.Healing = "Healing: "
L.DataText.Damage = "Damage: "
L.DataText.Honor = "Honor: "
L.DataText.KillingBlow = "Killing Blows: "
L.DataText.StatsFor = "Stats for "
L.DataText.HonorableKill = "Honorable Kills:"
L.DataText.Death = "Deaths:"
L.DataText.HonorGained = "Honor Gained:"
L.DataText.DamageDone = "Damage Done:"
L.DataText.HealingDone = "Healing Done:"
L.DataText.BaseAssault = "Bases Assaulted:"
L.DataText.BaseDefend = "Bases Defended:"
L.DataText.TowerAssault = "Towers Assaulted:"
L.DataText.TowerDefend = "Towers Defended:"
L.DataText.FlagCapture = "Flags Captured:"
L.DataText.FlagReturn = "Flags Returned:"
L.DataText.GraveyardAssault = "Graveyards Assaulted:"
L.DataText.GraveyardDefend = "Graveyards Defended:"
L.DataText.DemolisherDestroy = "Demolishers Destroyed:"
L.DataText.GateDestroy = "Gates Destroyed:"
L.DataText.TotalMemory = "Total Memory Usage:"
L.DataText.ControlBy = "Controlled by:"
L.DataText.CallToArms = "Call to Arms"
L.DataText.ArmError = "Could not get Call To Arms information."
L.DataText.NoDungeonArm = "No dungeons are currently offering a Call To Arms."
L.DataText.CartControl = "Carts Controlled:"
L.DataText.VictoryPts = "Victory Points:"
L.DataText.OrbPossession = "Orb Possessions:"
L.DataText.Slots = {
	[1] = {1, "Head", 1000},
	[2] = {3, "Shoulder", 1000},
	[3] = {5, "Chest", 1000},
	[4] = {6, "Waist", 1000},
	[5] = {9, "Wrist", 1000},
	[6] = {10, "Hands", 1000},
	[7] = {7, "Legs", 1000},
	[8] = {8, "Feet", 1000},
	[9] = {16, "Main Hand", 1000},
	[10] = {17, "Off Hand", 1000},
	[11] = {18, "Ranged", 1000}
}

----------------------------------------------------------------------------------------
--	Localization for enUS and enGB client
----------------------------------------------------------------------------------------
-- Announce flasks and food
L_ANNOUNCE_FF_NOFOOD = "No Food: "
L_ANNOUNCE_FF_NOFLASK = "No Flask: "
L_ANNOUNCE_FF_ALLBUFFED = "All Buffed!"
L_ANNOUNCE_FF_CHECK_BUTTON = "Check food and flask"

-- Says thanks for some spells
L_ANNOUNCE_SS_THANKS = "Thanks for "
L_ANNOUNCE_SS_RECEIVED = " received from "

-- Pull countdown announce
L_ANNOUNCE_PC_GO = "GO!"
L_ANNOUNCE_PC_MSG = "Pulling %s in %s.."
L_ANNOUNCE_PC_ABORTED = "Pull ABORTED!"

-- Announce feasts and portals
L_ANNOUNCE_FP_STAT = "%s has prepared a %s - [%s]."
L_ANNOUNCE_FP_PRE = "%s has prepared a %s."
L_ANNOUNCE_FP_PUT = "%s has put down a %s."
L_ANNOUNCE_FP_CAST = "%s is casting %s."
L_ANNOUNCE_FP_CLICK = "%s is casting %s. Click!"
L_ANNOUNCE_FP_USE = "%s used a %s."

-- Announce your interrupts
L_ANNOUNCE_INTERRUPTED = INTERRUPTED

-- Tooltip
L_TOOLTIP_NO_TALENT = "No Talents"
L_TOOLTIP_LOADING = "Loading..."
L_TOOLTIP_ACH_STATUS = "Your Status:"
L_TOOLTIP_ACH_COMPLETE = "Your Status: Completed on "
L_TOOLTIP_ACH_INCOMPLETE = "Your Status: Incomplete"
L_TOOLTIP_SPELL_ID = "Spell ID:"
L_TOOLTIP_ITEM_ID = "Item ID:"
L_TOOLTIP_WHO_TARGET = "Targeted By"
L_TOOLTIP_ITEM_COUNT = "Item count:"
L_TOOLTIP_INSPECT_OPEN = "Inspect Frame is open"

-- Misc
L_MISC_UNDRESS = "Undress"
L_MISC_DRINKING = " is drinking."
L_MISC_BUY_STACK = "Alt-Click to buy a stack"
L_MISC_ONECLICK_BUYOUT = "Shift-Right-Click to buyout the selected item without confirmation"
L_MISC_ONECLICK_BID = "Shift-Right-Click to bid on the selected item without confirmation"
L_MISC_ONECLICK_CANCEL = "Shift-Right-Click to cancel on the selected item without confirmation"
L_MISC_UI_OUTDATED = "Your version of ViksUI is out of date. You can download the latest version from http://goo.gl/QAj0J6"
L_MISC_HEADER_MARK = "Mouseover Raid Icons"
L_MISC_BINDER_OPEN = "Mouse Bindings"
L_MISC_GROCERY_BUY = "Buy"
L_MISC_GROCERY_DESC = "Automatically buy grocery bags"
L_MISC_SCROLL = "Scroll"
L_MISC_COLLAPSE = "The Collapse"

-- Raid Utility
L_RAID_UTIL_DISBAND = "Disband Group"

-- Zone name
L_ZONE_TOLBARAD = "Tol Barad"
L_ZONE_TOLBARADPEN = "Tol Barad Peninsula"
L_ZONE_ARATHIBASIN = "Arathi Basin"
L_ZONE_GILNEAS = "The Battle for Gilneas"
L_ZONE_ANCIENTDALARAN = "Dalaran Crater"

-- WatchFrame Wowhead link
L_WATCH_WOWHEAD_LINK = "Wowhead link"

-- Toggle Menu
L_TOGGLE_ADDON = "Addon "
L_TOGGLE_ADDONS = " addons"
L_TOGGLE_EXPAND = "Expand "
L_TOGGLE_COLLAPSE = "Collapse "
L_TOGGLE_RCLICK = "Right click to enable or disable "
L_TOGGLE_LCLICK = "Left click to toggle window "
L_TOGGLE_RELOAD = " (needs UI reload)"
L_TOGGLE_NOT_FOUND = " not found."

-- UnitFrame
L_UF_GHOST = "Ghost"
L_UF_DEAD = "Dead"
L_UF_OFFLINE = "Offline"
L_UF_MANA = "Low mana"

-- Map
L_MAP_CURSOR = "Cursor: "
L_MAP_BOUNDS = "Out of bounds!"
L_MAP_FOG = "Fog of War"
L_MAP_COORDS = "Coordinates"

-- Minimap
L_MINIMAP_CALENDAR = "Calendar"
L_MINIMAP_HEAL_LAYOUT = "Left-Click - Heal Layout"
L_MINIMAP_DPS_LAYOUT = "Right-Click - DPS Layout"
L_MINIMAP_BLIZZ_LAYOUT = "Middle-Click - Blizzard Layout"

-- Chat
L_CHAT_WHISPER = "From"
L_CHAT_BN_WHISPER = "From"
L_CHAT_AFK = "[AFK]"
L_CHAT_DND = "[DND]"
L_CHAT_GM = "[GM]"
L_CHAT_GUILD = "G"
L_CHAT_PARTY = "P"
L_CHAT_PARTY_LEADER = "PL"
L_CHAT_RAID = "R"
L_CHAT_RAID_LEADER = "RL"
L_CHAT_RAID_WARNING = "RW"
L_CHAT_INSTANCE_CHAT = "I"
L_CHAT_INSTANCE_CHAT_LEADER = "IL"
L_CHAT_OFFICER = "O"
L_CHAT_PET_BATTLE = "PB"
L_CHAT_COME_ONLINE = "has come |cff298F00online|r."
L_CHAT_GONE_OFFLINE = "has gone |cffff0000offline|r."

-- Errors frame
L_ERRORFRAME_L = "Click to view errors."

-- Bags
L_BAG_BANK = "Bank"
L_BAG_NO_SLOTS = "Can't buy anymore slots!"
L_BAG_COSTS = "Cost: %.2f gold"
L_BAG_BUY_SLOTS = "Buy new slot with /bags purchase yes"
L_BAG_OPEN_BANK = "You need to open your bank first."
L_BAG_SORT = "Sort your bags or your bank, if open."
L_BAG_STACK = "Fill up partial stacks in your bags or bank, if open."
L_BAG_BUY_BANKS_SLOT = "Buy bank slot (need to have bank open)."
L_BAG_SORT_MENU = "Sort"
L_BAG_SORT_SPECIAL = "Sort Special"
L_BAG_STACK_MENU = "Stack"
L_BAG_STACK_SPECIAL = "Stack Special"
L_BAG_SHOW_BAGS = "Show Bags"
L_BAG_SORTING_BAGS = "Sorting finished."
L_BAG_NOTHING_SORT = "Nothing to sort."
L_BAG_BAGS_BIDS = "Using bags: "
L_BAG_STACK_END = "Restacking finished."
L_BAG_RIGHT_CLICK_SEARCH = "Right-click to search"
L_BAG_STACK_MENU = "Stack"
L_BAG_BUTTONS_DEPOSIT = "Deposit Reagents"
L_BAG_BUTTONS_SORT = "LM:Cleanup / RM:Blizzard"
L_BAG_BUTTONS_ARTIFACT = "Right click to use Artifact Power item in bag"
L_BAG_RIGHT_CLICK_CLOSE = "Right-click to open menu"

-- Grab mail
L_MAIL_STOPPED = "Stopped, inventory is full."
L_MAIL_UNIQUE = "Stopped. Found a duplicate unique item in bag or in bank."
L_MAIL_COMPLETE = "All done."
L_MAIL_NEED = "Need a mailbox."
L_MAIL_MESSAGES = "messages"

-- Loot
L_LOOT_RANDOM = "Random Player"
L_LOOT_SELF = "Self Loot"
L_LOOT_FISH = "Fishing loot"
L_LOOT_ANNOUNCE = "Announce to"
L_LOOT_TO_RAID = "  raid"
L_LOOT_TO_PARTY = "  party"
L_LOOT_TO_GUILD = "  guild"
L_LOOT_TO_SAY = "  say"

-- LitePanels AFK module
L_PANELS_AFK = "You are AFK!"
L_PANELS_AFK_RCLICK = "Right-Click to hide."
L_PANELS_AFK_LCLICK = "Left-Click to go back."

-- Cooldowns
L_COOLDOWNS = "CD: "
L_COOLDOWNS_COMBATRESS = "BattleRes"
L_COOLDOWNS_COMBATRESS_REMAINDER = "Battle Resurrection: "
L_COOLDOWNS_NEXTTIME = "Next time: "

-- Autoinvite
L_INVITE_ENABLE = "Autoinvite ON: "
L_INVITE_DISABLE = "Autoinvite OFF"

-- Bind key
L_BIND_SAVED = "All keybindings have been saved."
L_BIND_DISCARD = "All newly set keybindings have been discarded."
L_BIND_INSTRUCT = "Hover your mouse over any actionbutton to bind it. Press the escape key or right click to clear the current actionbutton's keybinding."
L_BIND_CLEARED = "All keybindings cleared for"
L_BIND_BINDING = "Binding"
L_BIND_KEY = "Key"
L_BIND_NO_SET = "No bindings set"

-- Info text
L_INFO_ERRORS = "No error yet."
L_INFO_INVITE = "Accepted invite from "
L_INFO_DUEL = "Declined duel request from "
L_INFO_PET_DUEL = "Declined pet duel request from "
L_INFO_DISBAND = "Disbanding group..."
L_INFO_SETTINGS_DBM = "Type /settings dbm, to apply the settings DBM."
L_INFO_SETTINGS_BIGWIGS = "Type /settings bw, to apply the settings BigWigs."
L_INFO_SETTINGS_MSBT = "Type /settings msbt, to apply the settings MSBT."
L_INFO_SETTINGS_SKADA = "Type /settings skada, to apply the settings Skada."
L_INFO_SETTINGS_CHAT = "Type /settings chat, to apply the default chat settings."
L_INFO_SETTINGS_CVAR = "Type /settings cvar, to apply the default cvar(Game UI) settings."
L_INFO_SETTINGS_ALL = "Type /settings all, to apply the settings for all modifications."
L_INFO_NOT_INSTALLED = " is not installed."
L_INFO_SKIN_DISABLED1 = "Stylization for "
L_INFO_SKIN_DISABLED2 = " is disabled."

-- Popups
L_POPUP_INSTALLUI = "First time on ViksUI with this Character. You must reload UI to configure it."
L_POPUP_RESETUI = "Are you sure you want to reset all settings for ViksUI?"
L_POPUP_RESETSTATS = "Are you sure you want to reset statistics for time spent in game and gold."
L_POPUP_SWITCH_RAID = "Select Raid layout."
L_POPUP_DISBAND_RAID = "Are you sure you want to disband the group?"
L_POPUP_DISABLEUI = "ViksUI doesn't work for this resolution, do you want to disable ViksUI? (Cancel if you want to try another resolution)"
L_POPUP_SETTINGS_ALL = "Apply settings for all modifications? (DBM, BigWigs, Skada, Bartender, Masque, MBF and MSBT)"
L_POPUP_SETTINGS_DBM = "Need to change the position of elements DBM."
L_POPUP_SETTINGS_BW = "Need to change the position of elements BigWigs."
L_POPUP_ARMORY = "Armory"
L_POPUP_CURRENCY_CAP = "You get maximum value of"

-- Welcome message
L_WELCOME_LINE_1 = "Welcome to ViksUI "
L_WELCOME_LINE_2_1 = "Type /cfg to config interface, or visit https://discord.gg/Dhp5nHh"
L_WELCOME_LINE_2_2 = "for more information"

-- Combat text
L_COMBATTEXT_KILLING_BLOW = "Killing Blow"
L_COMBATTEXT_ALREADY_UNLOCKED = "Combat text already unlocked."
L_COMBATTEXT_ALREADY_LOCKED = "Combat text already locked."
L_COMBATTEXT_TEST_DISABLED = "Combat text test mode disabled."
L_COMBATTEXT_TEST_ENABLED = "Combat text test mode enabled."
L_COMBATTEXT_TEST_USE_UNLOCK = "Type /xct unlock to move and resize combat text frames."
L_COMBATTEXT_TEST_USE_LOCK = "Type /xct lock to lock combat text frames."
L_COMBATTEXT_TEST_USE_TEST = "Type /xct test to toggle combat text testmode."
L_COMBATTEXT_TEST_USE_RESET = "Type /xct reset to restore default positions."
L_COMBATTEXT_POPUP = "To save combat text window positions you need to reload your UI."
L_COMBATTEXT_UNSAVED = "Combat text window positions unsaved, don't forget to reload UI."
L_COMBATTEXT_UNLOCKED = "Combat text unlocked."

-- LiteStats
L_STATS_AUTO_REPAIR = "AutoRepair"
L_STATS_GUILD_REPAIR = "Repair from guild bank"
L_STATS_AUTO_SELL = "AutoSell junk"
L_STATS_BANDWIDTH = "Bandwidth:"
L_STATS_DOWNLOAD = "Download:"
L_STATS_CURRENCY_RAID = "Raid Seals"
L_STATS_MEMORY_USAGE = "Blizzard UI Memory Usage:"
L_STATS_TOTAL_MEMORY_USAGE = "Total Memory Usage:"
L_STATS_TOTAL_CPU_USAGE = "Total CPU Usage:"
L_STATS_GARBAGE_COLLECTED = "Garbage collected"
L_STATS_HIDDEN = "Hidden"
L_STATS_JUNK_ALREADY_ADDITIONS = "is already in additions list."
L_STATS_JUNK_ITEMLINK = "itemlink"
L_STATS_JUNK_ADDITIONS = "Junk additions"
L_STATS_JUNK_LIST = "Junk List"
L_STATS_JUNK_PROFIT = "Junk profit"
L_STATS_JUNK_CLEARED = "Junk list cleared."
L_STATS_JUNK_CLEAR_ADDITIONS = "Clear additions list."
L_STATS_JUNK_ADDED = "Added junk additions"
L_STATS_JUNK_ADD_ITEM = "Add/remove items."
L_STATS_JUNK_REMOVED = "Removed junk additions"
L_STATS_JUNK_ITEMS_LIST = "List for sell items."
L_STATS_KILLS = "K"
L_STATS_XP_RATE = "Level XP rate"
L_STATS_HR = "hr"
L_STATS_INF = "inf"
L_STATS_ON = "ON"
L_STATS_PLAYED_LEVEL = "Played this level"
L_STATS_PLAYED_SESSION = "Played this session"
L_STATS_ACC_PLAYED = "Account Played"
L_STATS_PLAYED_TOTAL = "Played total"
L_STATS_QUEST = "Q"
L_STATS_QUESTS_TO = "Quests/Kills to %s"
L_STATS_CURRENT_XP = "Current/Max XP"
L_STATS_REMAINING_XP = "Remaining XP"
L_STATS_RESTED_XP = "Rested XP"
L_STATS_SERVER_GOLD = "Server Gold"
L_STATS_SESSION_GAIN = "Session Gain/Loss"
L_STATS_SESSION_XP = "Session XP rate"
L_STATS_SORTING_BY = "Sorting by"
L_STATS_SEALS = "Seals this week"
L_STATS_SPEC = "Spec"
L_STATS_TIPS = "tips:"
L_STATS_OPEN_CALENDAR = "Left-Click opens calendar."
L_STATS_RC_TIME_MANAGER = "Right-Click opens time manager frame."
L_STATS_TOGGLE_TIME = "Local/realm & 24hr time can be toggled from the time manager."
L_STATS_MEMORY = "Memory"
L_STATS_RC_COLLECTS_GARBAGE = "Right-Click collects Lua garbage."
L_STATS_VIEW_NOTES = "Hold alt key to view ranks, notes and officer notes."
L_STATS_CHANGE_SORTING = "[Guild] Right-Click to invite and whisper, Middle-Click to change the sorting, Shift-Middle-Click to reverse order."
L_STATS_OPEN_CHARACTER = "Left-Click opens character tab."
L_STATS_RC_AUTO_REPAIRING1 = "Right-Click toggles auto repairing."
L_STATS_RC_AUTO_REPAIRING2 = "Middle-Click toggles guild auto repairing."
L_STATS_EQUIPMENT_CHANGER = "Shift-Click or Alt-Click for equipment set changer."
L_STATS_RC_EXPERIENCE = "Right-Click to cycle through experience, time played, and faction watcher."
L_STATS_WATCH_FACTIONS = "Watch factions from the character faction UI."
L_STATS_TOOLTIP_EXPERIENCE = "When below max level, a tooltip will be displayed with experience details."
L_STATS_TOOLTIP_TIME_PLAYED = "When at max level, the tooltip will show time played details for the account."
L_STATS_OPEN_TALENT = "Left-Click toggles your talent specialization."
L_STATS_RC_TALENT = "Right-Click toggles your loot specialization."
L_STATS_LOCATION = "Location/Coords"
L_STATS_WORLD_MAP = "Clicking opens world map."
L_STATS_INSERTS_COORDS = "Shift-Clicking location or coords module inserts your coords into chat."
L_STATS_OPEN_CURRENCY = "Left-Click opens currency tab."
L_STATS_RC_AUTO_SELLING = "Right-Click toggles auto selling."
L_STATS_NEED_TO_SELL = "Use /junk to configure which items need to sell."
L_STATS_WATCH_CURRENCY = "Watched currency tab items will reflect onto the tooltip."
L_STATS_OTHER_OPTIONS = "Other options may be configured in %s"

-- Slash commands
L_SLASHCMD_HELP = {
	"Available slash commands:",
	"/rl or // - Reload interface.",
	"/rc - Activates a ready check.",
	"/gm - Opens GM frame.",
	"/dis ADDON_NAME - Disable Addon.",
	"/en ADDON_NAME - Enable Addon.",
	"/rd - Disband party or raid.",
	"/toraid - Convert to party or raid.",
	"/teleport - Teleportation from random dungeon.",
	"/spec, /ss - Switches between talent spec's.",
	"/heal - Switches to 'Heal' layout.",
	"/dps - Switches to 'DPS' layout.",
	"/frame - Description is not ready.",
	"/farmmode - Increase the size of the minimap.",
	"/moveui - Allows the movement of interface elements.",
	"/moveui reset - Resets the movment done by /moveui.",
	"/resetui - Resets general settings to default.",
	"/resetuf - Resets the unit frames to their default position.",
	"/resetconfig - Resets ViksUI_Config settings.",
	"/resetstats - Resets the statistics of gold and time spent.",
	"/settings ADDON_NAME - Applies settings to msbt, dbm, skada, or all addons.",
	"/ls, /litestats - Help for LiteStats.",
	"/bags - Managing for bags.",
	"/xct - Manage the combat text.",
	"/raidcd - Raid cooldown test.",
	"/enemycd - Enemy cooldown test.",
	"/pulsecd - Self cooldown pulse test.",
	"/threat - Threat meter test.",
	"/tt - Whisper target.",
	"/ainv - Enables automatic invitation.",
	"/testuf - Unit frame test.",
	"/cfg - Opens interface settings.",
	"/installui - Opens installer.",
	"/vbt - Opens Bartender Select Profile.",
}