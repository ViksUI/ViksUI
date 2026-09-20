local T, C, L = unpack(ViksUI)
local _, class = UnitClass("player")
local r, g, b = unpack(C.media.pxcolor1)
if not C.datatext.Wowtime and not C.datatext.Wowtime > 0 then return end
local next, pairs, unpack = next, pairs, unpack
local C_AreaPoiInfo_GetAreaPOIInfo = C_AreaPoiInfo.GetAreaPOIInfo
local C_QuestLog_IsQuestFlaggedCompleted = C_QuestLog.IsQuestFlaggedCompleted
local UNKNOWN = UNKNOWN

pxfont = C.media.pixel_font
pxfontsize = C.media.pixel_font_size

DataTextTooltipAnchor = function(self)
	local panel = self:GetParent()
	local anchor = "ANCHOR_BOTTOMLEFT"
	local xoff = 0
	local yoff = 4
	return anchor, panel, xoff, yoff
end

-- Midnight 12.1+: current scheduled events, catalyst currency and Great Vault.
local VENOMBLIGHT_MANAFLUX_ID = 3465
local NEBULOUS_VOIDCORE_ID = 3418
local TROVEHUNTER_BOUNTY_USED_QUEST = 86371
local PURGING_THE_VAULTS_QUEST = 95520
local MANAFLUX_MAX = 8

-- Midnight Season 2 Mistcrests.
-- These are seasonal upgrade currencies; each has a seasonal cap of 100.
local MISTCREST_IDS = {
	{ id = 3442, name = "Adventurer Mistcrest", cap = 100 },
	{ id = 3443, name = "Veteran Mistcrest", cap = 100 },
	{ id = 3444, name = "Champion Mistcrest", cap = 100 },
	{ id = 3445, name = "Hero Mistcrest", cap = 100 },
	{ id = 3446, name = "Myth Mistcrest", cap = 100 },
}

local VAULT_TYPES = { 3, 1, 6 } -- Raid, Activities (dungeons), World

-- Main datatext frame must exist before any tooltip/event helpers reference it.
local Stat = CreateFrame("Frame", "DataTextTime", UIParent)
Stat:EnableMouse(true)
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)

-- The original ViksUI datatext uses a FontString named Text for the clock.
-- Keep that object local to this module so Update() and OnEnter() can use it.
local Text = Stat:CreateFontString(nil, "OVERLAY")
if C.datatext.location >= 9 then
	Text:SetTextColor(unpack(C.media.pxcolor1))
	if C.datatext.location ~= 14 or C.datatext.location ~= 15 then
		Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize - 2, C.media.pxfontHFlag)
	else
		Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
	end
else
	Text:SetTextColor(unpack(C.media.pxcolor1))
	Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
PP(C.datatext.Wowtime, Text)

-- Weekly quests known to be offered by the Silvermoon endgame hub.
-- Keep these IDs in one table so additional weekly quests can be added safely.
local SILVERMOON_WEEKLIES = {
	{ id = 93744, name = "Unity Against the Void", giver = "Lady Liadrin" },
	{ id = 95468, name = "Hope in the Darkest Corners", giver = "Halduron Brightwing" },
	{ id = 95520, name = "Purging the Vaults" },
	{ id = 93605, name = "The World Awaits" },
	{ id = 93607, name = "An Original Path Through Time" },
	{ id = 93628, name = "A Shadowed Path Through Time" },
}

-- ViksUI already provides the account-wide SavedVariables table ViksUIStats.
-- Store this datatext's per-character snapshots there.
local function GetCharacterKey()
	local name, realm = UnitName("player")
	realm = realm or GetRealmName() or "Unknown"
	return realm .. "-" .. name, name, realm
end

local function GetStatsDB()
	ViksUIStats = ViksUIStats or {}
	ViksUIStats.characters = ViksUIStats.characters or {}
	return ViksUIStats
end

local function GetOwnedKeystoneInfo()
	if not C_MythicPlus then return nil end
	if not C_MythicPlus.GetOwnedKeystoneLevel then return nil end

	local level = C_MythicPlus.GetOwnedKeystoneLevel()
	local challengeMapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID and C_MythicPlus.GetOwnedKeystoneChallengeMapID()
	local mapID = C_MythicPlus.GetOwnedKeystoneMapID and C_MythicPlus.GetOwnedKeystoneMapID()

	if not level or level <= 0 then
		return nil
	end

	local name
	if challengeMapID and C_ChallengeMode and C_ChallengeMode.GetMapUIInfo then
		name = C_ChallengeMode.GetMapUIInfo(challengeMapID)
	end

	if not name and mapID and C_Map and C_Map.GetMapInfo then
		local mapInfo = C_Map.GetMapInfo(mapID)
		name = mapInfo and mapInfo.name
	end

	return {
		level = level,
		name = name or UNKNOWN,
		challengeMapID = challengeMapID,
		mapID = mapID,
	}
end

local function SaveCharacterData()
	local db = GetStatsDB()
	local key, name, realm = GetCharacterKey()
	local avgILvl, equippedILvl = GetAverageItemLevel()
	local manaFluxInfo = C_CurrencyInfo.GetCurrencyInfo(VENOMBLIGHT_MANAFLUX_ID)

	local char = db.characters[key] or {}
	char.name = name
	char.realm = realm
	char.ilvl = avgILvl and tonumber(format("%.1f", avgILvl)) or nil
	char.equippedIlvl = equippedILvl and tonumber(format("%.1f", equippedILvl)) or nil
	char.keystone = GetOwnedKeystoneInfo()
	char.manaFlux = manaFluxInfo and manaFluxInfo.quantity or 0
	local voidcoreInfo = C_CurrencyInfo.GetCurrencyInfo(NEBULOUS_VOIDCORE_ID)
	char.voidcore = voidcoreInfo and voidcoreInfo.quantity or 0
	char.troveUsed = C_QuestLog_IsQuestFlaggedCompleted(TROVEHUNTER_BOUNTY_USED_QUEST)
	char.weeklies = {}
	for _, quest in ipairs(SILVERMOON_WEEKLIES) do
		char.weeklies[quest.id] = C_QuestLog_IsQuestFlaggedCompleted(quest.id)
	end

	char.mistcrests = {}
	for _, crest in ipairs(MISTCREST_IDS) do
		local info = C_CurrencyInfo.GetCurrencyInfo(crest.id)
		if info then
			char.mistcrests[crest.id] = info.quantity or 0
		end
	end

	-- Save this character's current raid lockouts so the Shift table can
	-- display each lockout under the correct character column.
	char.raidLockouts = {}
	for i = 1, GetNumSavedInstances() do
		local instanceName, _, reset, difficulty, locked, extended, _, isRaid, _, difficultyNameAPI, numEncounters, encounterProgress = GetSavedInstanceInfo(i)
		if isRaid and (locked or extended) and reset then
			local difficultyName
			if difficulty == 17 then
				difficultyName = "LFR"
			elseif difficulty == 14 then
				difficultyName = "N"
			elseif difficulty == 15 then
				difficultyName = "HC"
			elseif difficulty == 16 then
				difficultyName = "M"
			else
				difficultyName = difficultyNameAPI or "Raid"
			end

			local d, h, m = ChatFrame_TimeBreakDown(floor(reset))
			local resetText
			if d > 0 then
				resetText = string.format("%dd %dh", d, h)
			elseif h > 0 then
				resetText = string.format("%dh %dm", h, m)
			else
				resetText = string.format("%dm", m)
			end

			char.raidLockouts[#char.raidLockouts + 1] = {
				name = instanceName,
				difficulty = difficultyName,
				progress = encounterProgress or 0,
				total = numEncounters or 0,
				reset = resetText,
			}
		end
	end

	char.lastSeen = time()

	-- Keep the current weekly Vault snapshot with the character.
	char.vault = {}
	if C_WeeklyRewards then
		for _, vaultType in ipairs(VAULT_TYPES) do
			local activities = C_WeeklyRewards.GetActivities(vaultType)
			if activities then
				char.vault[vaultType] = {}
				for _, activity in ipairs(activities) do
					char.vault[vaultType][activity.index] = {
						progress = activity.progress or 0,
						threshold = activity.threshold or 0,
						level = activity.level,
					}
				end
			end
		end
	end

	db.characters[key] = char
end

local SavedCharactersFrame

local function ShowSavedCharactersFrame()
	local db = GetStatsDB()
	local entries = {}
	for _, char in pairs(db.characters or {}) do
		entries[#entries + 1] = char
	end

	table.sort(entries, function(a, b)
		return (a.name or "") < (b.name or "")
	end)

	local labelWidth = 185
	local columnWidth = 100
	local columnGap = 6
	local frameWidth = labelWidth + (#entries * (columnWidth + columnGap)) + 36
	local frameHeight = 720

	if not SavedCharactersFrame then
		SavedCharactersFrame = CreateFrame("Frame", "ViksUI_TimeSavedCharacters", UIParent, "BackdropTemplate")
		SavedCharactersFrame:SetFrameStrata("DIALOG")
		SavedCharactersFrame:SetFrameLevel(20)
		SavedCharactersFrame:SetMovable(true)
		SavedCharactersFrame:EnableMouse(true)
		SavedCharactersFrame:RegisterForDrag("LeftButton")
		SavedCharactersFrame:SetScript("OnDragStart", function(self) self:StartMoving() end)
		SavedCharactersFrame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
		SavedCharactersFrame:SetBackdrop({
			bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true,
			tileSize = 16,
			edgeSize = 16,
			insets = { left = 4, right = 4, top = 4, bottom = 4 },
		})
		SavedCharactersFrame:SetBackdropColor(0.03, 0.03, 0.03, 0.96)
		SavedCharactersFrame:SetBackdropBorderColor(r, g, b, 1)

		local title = SavedCharactersFrame:CreateFontString(nil, "OVERLAY")
		title:SetFontObject(GameTooltipText)
		title:SetTextColor(1, 0.82, 0)
		title:SetPoint("TOPLEFT", 12, -10)
		title:SetText("ViksUI Character Progress")
		SavedCharactersFrame.title = title

		local close = CreateFrame("Button", nil, SavedCharactersFrame, "UIPanelCloseButton")
		close:SetPoint("TOPRIGHT", -2, -2)
		SavedCharactersFrame.close = close

		local scroll = CreateFrame("ScrollFrame", nil, SavedCharactersFrame, "UIPanelScrollFrameTemplate")
		scroll:SetPoint("TOPLEFT", 10, -34)
		scroll:SetPoint("BOTTOMRIGHT", -28, 10)
		SavedCharactersFrame.scroll = scroll

		local child = CreateFrame("Frame", nil, scroll)
		child:SetPoint("TOPLEFT")
		child:SetSize(1, 1)
		scroll:SetScrollChild(child)
		SavedCharactersFrame.child = child
	end

	SavedCharactersFrame:SetSize(math.max(360, frameWidth), frameHeight)
	SavedCharactersFrame:ClearAllPoints()
	SavedCharactersFrame:SetPoint("CENTER")
	SavedCharactersFrame:Show()

	local child = SavedCharactersFrame.child
	local oldRows = SavedCharactersFrame.rows or {}
	for _, row in ipairs(oldRows) do
		row:Hide()
	end
	wipe(oldRows)
	SavedCharactersFrame.rows = oldRows

	local rowHeight = 16
	local y = 0

	local function Font(parent, width, justify)
		local fs = parent:CreateFontString(nil, "OVERLAY")
		fs:SetFontObject(GameTooltipText)
		fs:SetWidth(width)
		fs:SetJustifyH(justify or "LEFT")
		fs:SetWordWrap(false)
		return fs
	end

	local function AddRow(label, valueFunc, isHeader, colorFunc)
		local row = CreateFrame("Frame", nil, child)
		row:SetSize(frameWidth - 20, rowHeight)
		row:SetPoint("TOPLEFT", 0, -y)
		SavedCharactersFrame.rows[#SavedCharactersFrame.rows + 1] = row

		local left = Font(row, labelWidth, "LEFT")
		left:SetPoint("LEFT", 0, 0)
		left:SetText(label or "")
		if isHeader then
			left:SetTextColor(0.8, 0.8, 0.8)
		else
			left:SetTextColor(1, 1, 1)
		end

		for index, char in ipairs(entries) do
			local cell = Font(row, columnWidth, "LEFT")
			cell:SetPoint("LEFT", labelWidth + columnGap + ((index - 1) * (columnWidth + columnGap)), 0)
			cell:SetText(valueFunc(char) or "-")

			local cr, cg, cb = 1, 1, 1
			if isHeader then
				cr, cg, cb = 0.8, 0.8, 0.8
			elseif colorFunc then
				local rr, gg, bb = colorFunc(char)
				if rr then cr, cg, cb = rr, gg, bb end
			end
			cell:SetTextColor(cr, cg, cb)
		end

		y = y + rowHeight
	end

	local function AddSpacer()
		y = y + 8
	end

	local function AddSection(text)
		local row = CreateFrame("Frame", nil, child)
		row:SetSize(frameWidth - 20, rowHeight)
		row:SetPoint("TOPLEFT", 0, -y)
		SavedCharactersFrame.rows[#SavedCharactersFrame.rows + 1] = row
		local fs = Font(row, frameWidth - 20, "LEFT")
		fs:SetPoint("LEFT", 0, 0)
		fs:SetText(text)
		fs:SetTextColor(0.6, 0.8, 1)
		y = y + rowHeight
	end

	if #entries == 0 then
		AddRow("Character", function() return "-" end, true)
		AddRow("", function() return "No character data saved yet." end)
	else
		AddRow("Character", function(char)
			return char.name or UNKNOWN
		end, true)

		AddSpacer()
		AddSection("Character Progress")
		AddRow("Overall Item Level", function(char)
			return char.ilvl and string.format("%.1f", char.ilvl) or "-"
		end)

		AddRow("Mythic+ Keystone", function(char)
			if not char.keystone or not char.keystone.level then
				return "None"
			end
			return string.format("%s +%d", char.keystone.name or UNKNOWN, char.keystone.level)
		end)

		AddRow("Great Vault", function(char)
			local unlocked, total = 0, 0
			if char.vault then
				for _, activities in pairs(char.vault) do
					for _, activity in pairs(activities) do
						total = total + 1
						if (activity.threshold or 0) > 0 and (activity.progress or 0) >= (activity.threshold or 0) then
							unlocked = unlocked + 1
						end
					end
				end
			end
			return total > 0 and string.format("%d/%d", unlocked, total) or "-"
		end, false, function(char)
			local unlocked = 0
			if char.vault then
				for _, activities in pairs(char.vault) do
					for _, activity in pairs(activities) do
						if (activity.threshold or 0) > 0 and (activity.progress or 0) >= (activity.threshold or 0) then
							unlocked = unlocked + 1
						end
					end
				end
			end
			if unlocked >= 3 then return 0.2, 1, 0.2 end
		end)

		AddRow("Trovehunter's Bounty", function(char)
			return char.troveUsed and "Used" or "Available"
		end, false, function(char)
			if char.troveUsed then return 0.2, 1, 0.2 end
		end)

		AddSpacer()
		AddSection("Weekly Quests")
		for _, quest in ipairs(SILVERMOON_WEEKLIES) do
			AddRow(quest.name, function(char)
				if not char.weeklies then return "-" end
				return char.weeklies[quest.id] and "Done" or "Open"
			end, false, function(char)
				if char.weeklies and char.weeklies[quest.id] then return 0.2, 1, 0.2 end
			end)
		end

		AddSpacer()
		AddSection("Currencies")
		AddRow("Venomblight Manaflux", function(char)
			return string.format("%d/%d", char.manaFlux or 0, MANAFLUX_MAX)
		end)
		AddRow("Nebulous Voidcore", function(char)
			return tostring(char.voidcore or 0)
		end)
		for _, crest in ipairs(MISTCREST_IDS) do
			AddRow(crest.name, function(char)
				return tostring(char.mistcrests and char.mistcrests[crest.id] or 0)
			end)
		end

		AddSpacer()
		AddSection("Raid Lockouts")

		-- Build one row per raid. The full raid name is shown only once in the
		-- label column; character columns contain compact progress such as
		-- "6/8 HC". This keeps the character columns narrow and readable.
		local raidNames = {}
		local raidNameOrder = {}
		for _, char in ipairs(entries) do
			for _, lockout in ipairs(char.raidLockouts or {}) do
				if lockout.name and not raidNames[lockout.name] then
					raidNames[lockout.name] = true
					raidNameOrder[#raidNameOrder + 1] = lockout.name
				end
			end
		end

		if #raidNameOrder == 0 then
			AddRow("", function() return "" end)
		else
			for _, raidName in ipairs(raidNameOrder) do
				AddRow(raidName, function(char)
					local results = {}
					for _, lockout in ipairs(char.raidLockouts or {}) do
						if lockout.name == raidName then
							local progress = tonumber(lockout.progress) or 0
							local total = tonumber(lockout.total) or 0
							local difficulty = lockout.difficulty or "Raid"
							if total > 0 then
								results[#results + 1] = string.format("%d/%d %s", progress, total, difficulty)
							else
								results[#results + 1] = difficulty
							end
						end
					end
					return #results > 0 and table.concat(results, ", ") or "-"
				end)
			end
		end
	end

	child:SetSize(math.max(frameWidth - 20, 1), math.max(y + 10, 1))
end

local function GetScheduledEventName(event)
	local poi = event.areaPoiID and C_AreaPoiInfo_GetAreaPOIInfo(nil, event.areaPoiID)
	return (poi and poi.name) or UNKNOWN
end

local function GetEventZone(event)
	if event.areaPoiID then
		return C_EventScheduler.GetEventZoneName(event.areaPoiID) or UNKNOWN
	end
	return UNKNOWN
end

local function FormatEventTime(timestamp)
	if C['datatext']['Time24'] then
		return date("%d.%m / %H:%M", timestamp)
	end
	return date("%m/%d %I:%M %p", timestamp)
end

local function AddMidnightEvents()
	if not C_EventScheduler then return end

	C_EventScheduler.RequestEvents()

	local now = time()
	local ongoing = C_EventScheduler.GetOngoingEvents()
	local scheduled = C_EventScheduler.GetScheduledEvents()

	local addedHeader = false
	local function addHeader()
		if not addedHeader then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine("Midnight Events")
			addedHeader = true
		end
	end

	-- Events currently active.
	if ongoing then
		for _, event in ipairs(ongoing) do
			addHeader()
			local name = GetScheduledEventName(event)
			local zone = GetEventZone(event)
			if zone ~= UNKNOWN then
				name = name .. " - " .. zone
			end
			GameTooltip:AddDoubleLine(name, "ACTIVE", 1, 1, 1, 0, 1, 0)
		end
	end

	-- Then show the next scheduled events supplied by the live server.
	if scheduled then
		table.sort(scheduled, function(a, b)
			return (a.startTime or 0) < (b.startTime or 0)
		end)

		local shown = 0
		for _, event in ipairs(scheduled) do
			if event.startTime and event.endTime and event.endTime >= now then
				addHeader()
				local name = GetScheduledEventName(event)
				local zone = GetEventZone(event)
				if zone ~= UNKNOWN then
					name = name .. " - " .. zone
				end

				local timeText
				if event.startTime <= now and event.endTime > now then
					timeText = "ACTIVE"
				elseif event.startTime > now then
					timeText = FormatEventTime(event.startTime)
				end

				if timeText then
					GameTooltip:AddDoubleLine(name, timeText, 1, 1, 1, 1, 1, 1)
					shown = shown + 1
					if shown >= 8 then break end
				end
			end
		end
	end
end

-- Great Vault -------------------------------------------------------------
-- Midnight exposes the live slot progress and reward item level directly
-- through C_WeeklyRewards. Each category has three possible slots.
local function GetVaultRewardLevel(activity)
	if activity.level and activity.level > 0 then
		return activity.level
	end

	if activity.rewards then
		for _, reward in ipairs(activity.rewards) do
			if reward.type == 1 and reward.itemDBID then
				local ilvl = C_Item.GetDetailedItemLevelInfo(reward.itemDBID)
				if ilvl then return ilvl end
			end
		end
	end
end

local function AddVaultCategory(titleText, vaultType)
	local activities = C_WeeklyRewards.GetActivities(vaultType)
	if not activities then return 0 end

	table.sort(activities, function(a, b)
		return (a.index or 0) < (b.index or 0)
	end)

	local unlocked = 0
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(titleText)

	for _, activity in ipairs(activities) do
		local progress = activity.progress or 0
		local threshold = activity.threshold or 0
		local complete = threshold > 0 and progress >= threshold
		if complete then unlocked = unlocked + 1 end

		local ilvl = GetVaultRewardLevel(activity)
		local rewardText = ilvl and ("ilvl " .. ilvl) or UNKNOWN
		local progressText = string.format("%d/%d", progress, threshold)

		if complete then
			GameTooltip:AddDoubleLine(
				string.format("Slot %d  %s", activity.index or 0, progressText),
				rewardText .. "  " .. COMPLETE,
				1, 1, 1, 0, 1, 0
			)
		else
			GameTooltip:AddDoubleLine(
				string.format("Slot %d  %s", activity.index or 0, progressText),
				rewardText,
				1, 1, 1, 1, 1, 1
			)
		end
	end

	return unlocked
end

local function AddGreatVault()
	if not C_WeeklyRewards then return end

	local categories = {
		{ title = "Raid", type = 3 },
		{ title = "Dungeons", type = 1 },
		{ title = "World", type = 6 },
	}

	local totalUnlocked = 0
	local totalSlots = 0
	local categoryData = {}

	for _, category in ipairs(categories) do
		local activities = C_WeeklyRewards.GetActivities(category.type)
		if activities then
			table.sort(activities, function(a, b)
				return (a.index or 0) < (b.index or 0)
			end)

			categoryData[#categoryData + 1] = {
				title = category.title,
				activities = activities,
			}

			totalSlots = totalSlots + #activities
			for _, activity in ipairs(activities) do
				local progress = activity.progress or 0
				local threshold = activity.threshold or 0
				if threshold > 0 and progress >= threshold then
					totalUnlocked = totalUnlocked + 1
				end
			end
		end
	end

	if totalSlots == 0 then return end

	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine(
		"Great Vault",
		string.format("%d/%d slots unlocked", totalUnlocked, totalSlots),
		1, 1, 1, 0, 1, 0
	)

	for _, category in ipairs(categoryData) do
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(category.title)

		for _, activity in ipairs(category.activities) do
			local progress = activity.progress or 0
			local threshold = activity.threshold or 0
			local complete = threshold > 0 and progress >= threshold
			local ilvl = GetVaultRewardLevel(activity)
			local rewardText = ilvl and ("ilvl " .. ilvl) or UNKNOWN
			local progressText = string.format("%d/%d", progress, threshold)
			local slotName = string.format("Slot %d  %s", activity.index or 0, progressText)

			GameTooltip:AddDoubleLine(
				slotName,
				rewardText,
				1, 1, 1,
				complete and 0 or 1,
				complete and 1 or 1,
				complete and 0 or 1
			)
		end
	end
end

local title
local function addTitle(text)
	if not title then
		GameTooltip:AddLine(' ')
		GameTooltip:AddLine(text..":")
		title = true
	end
end

local int = 1
local function Update(self, t)
	local pendingCalendarInvites = 0 --// BETA CalendarGetNumPendingInvites()
	int = int - t
	if int < 0 then
		if C.datatext.Localtime == true then
			Hr24 = tonumber(date("%H"))
			Hr = tonumber(date("%I"))
			Min = date("%M")
			if C.datatext.Time24 == true then
				if pendingCalendarInvites > 0 then
				Text:SetText("|cffFF0000"..Hr24..":"..Min)
			else
				Text:SetText(Hr24..":"..Min)
			end
		else
			if Hr24>=12 then
				if pendingCalendarInvites > 0 then
					Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffpm|r")
				else
					Text:SetText(Hr..":"..Min.." |cffffffffpm|r")
				end
			else
				if pendingCalendarInvites > 0 then
					Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffam|r")
				else
					Text:SetText(Hr..":"..Min.." |cffffffffam|r")
				end
			end
		end
	else
		local Hr, Min = GetGameTime()
		if Min<10 then Min = "0"..Min end
		if C.datatext.Time24 == true then
			if pendingCalendarInvites > 0 then			
				Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffff|r")
			else
				Text:SetText(Hr..":"..Min.." |cffffffff|r")
			end
		else
			if Hr>=12 then
				if Hr>12 then Hr = Hr-12 end
				if pendingCalendarInvites > 0 then
					Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffpm|r")
				else
					Text:SetText(Hr..":"..Min.." |cffffffffpm|r")
				end
			else
				if Hr == 0 then Hr = 12 end
				if pendingCalendarInvites > 0 then
					Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffam|r")
				else
					Text:SetText(Hr..":"..Min.." |cffffffffam|r")
				end
			end
		end
	end
	self:SetAllPoints(Text)
	int = 1
	end
end

Stat:SetScript("OnEnter", function(self)
	local anchor, panel, xoff, yoff = DataTextTooltipAnchor(Text)
	OnLoad = function(self) RequestRaidInfo() end
	
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT", -4, 16)

	GameTooltip:ClearLines()

	-- Weekly / seasonal tracked data -------------------------------------
	local manaFluxInfo = C_CurrencyInfo.GetCurrencyInfo(VENOMBLIGHT_MANAFLUX_ID)
	local manaFlux = manaFluxInfo and manaFluxInfo.quantity or 0
	GameTooltip:AddDoubleLine(
		"Venomblight Manaflux",
		string.format("%d / %d", manaFlux, MANAFLUX_MAX)
	)

	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("Mistcrests")
	for _, crest in ipairs(MISTCREST_IDS) do
		local info = C_CurrencyInfo.GetCurrencyInfo(crest.id)
		if info then
			GameTooltip:AddDoubleLine(
				crest.name,
				string.format("%d / %d", info.quantity or 0, crest.cap),
				1, 1, 1, 1, 1, 1
			)
		end
	end

	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("Weekly Quests")
	for _, quest in ipairs(SILVERMOON_WEEKLIES) do
		local completed = C_QuestLog_IsQuestFlaggedCompleted(quest.id)
		local inLog = C_QuestLog.IsOnQuest(quest.id)
		local state
		if completed then
			state = COMPLETE
		elseif inLog then
			state = "In progress"
		else
			state = "Not completed"
		end

		local questLabel = quest.giver and (quest.name .. " — " .. quest.giver) or quest.name
		GameTooltip:AddDoubleLine(
			questLabel,
			state,
			1, 1, 1,
			completed and 0 or 1,
			completed and 1 or 1,
			completed and 0 or 1
		)
	end

	-- Trovehunter's Bounty is granted by Purging the Vaults and is tracked
	-- separately because it can be present in the bags before the weekly quest
	-- completion flag changes.
	local troveUsed = C_QuestLog_IsQuestFlaggedCompleted(TROVEHUNTER_BOUNTY_USED_QUEST)
	local troveCount = C_Item.GetItemCount(274374, true)
	GameTooltip:AddDoubleLine(
		"Trovehunter's Bounty",
		troveUsed and "Used this week" or string.format("Available / bags: %d", troveCount),
		1, 1, 1,
		troveUsed and 1 or 1,
		troveUsed and 0.3 or 1,
		troveUsed and 0.3 or 1
	)

	AddMidnightEvents()
	AddGreatVault()

	if C.datatext.Localtime == true then
		local Hr, Min = GetGameTime()
		if Min<10 then Min = "0"..Min end
		if C.datatext.Time24 == true then         
			GameTooltip:AddDoubleLine("Server Time: ",Hr .. ":" .. Min);
		else             
			if Hr>=12 then
			Hr = Hr-12
			if Hr == 0 then Hr = 12 end
				GameTooltip:AddDoubleLine("Server Time: ",Hr .. ":" .. Min.." PM");
			else
				if Hr == 0 then Hr = 12 end
				GameTooltip:AddDoubleLine("Server Time: ",Hr .. ":" .. Min.." AM");
			end
		end
	else
		Hr24 = tonumber(date("%H"))
		Hr = tonumber(date("%I"))
		Min = date("%M")
		if C.datatext.time24 == true then
			GameTooltip:AddDoubleLine("Local Time: ",Hr24 .. ":" .. Min);
		else
			if Hr24>=12 then
				GameTooltip:AddDoubleLine("Local Time: ",Hr .. ":" .. Min.." PM");
			else
				GameTooltip:AddDoubleLine("Local Time: ",Hr .. ":" .. Min.." AM");
			end
		end
	end  
	
	local oneraid
	for i = 1, GetNumSavedInstances() do
		local name,_,reset,difficulty,locked,extended,_,isRaid,maxPlayers = GetSavedInstanceInfo(i)
		if isRaid and (locked or extended) or maxPlayers == 5 and difficulty == 23 and (locked or extended) then
			local tr,tg,tb,diff
			if not oneraid then
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine("Saved Mythic/Raid(s)")
				oneraid = true
			end

			local function fmttime(sec,table)
			local table = table or {}
			local d,h,m,s = ChatFrame_TimeBreakDown(floor(sec))
			local string = gsub(gsub(format(" %dd %dh %dm "..((d==0 and h==0) and "%ds" or ""),d,h,m,s)," 0[dhms]"," "),"%s+"," ")
			local string = strtrim(gsub(string, "([dhms])", {d=table.days or "d",h=table.hours or "h",m=table.minutes or "m",s=table.seconds or "s"})," ")
			if maxPlayers == 5 and difficulty == 23 then
			return strmatch(string,"^%s*$") or string
			else
			return strmatch(string,"^%s*$") and "0"..(table.seconds or L"s") or string
			end
		end
		if extended then tr,tg,tb = 0.3,1,0.3 else tr,tg,tb = 1,1,1 end
		if difficulty == 3 or difficulty == 4 then diff = "H" else diff = "N" end
		if maxPlayers == 5 and difficulty == 23 then
		GameTooltip:AddDoubleLine("M:"..name,fmttime(reset),1,1,1,tr,tg,tb)
		else
		GameTooltip:AddDoubleLine(name,fmttime(reset),1,1,1,tr,tg,tb)
		end
		end
	end
	local addedLine
	for i = 1, GetNumSavedWorldBosses() do
		local name, _, reset = GetSavedWorldBossInfo(i)
		local function fmttime(sec,table)
		local table = table or {}
		local d,h,m,s = ChatFrame_TimeBreakDown(floor(sec))
		local string = gsub(gsub(format(" %dd %dh %dm "..((d==0 and h==0) and "%ds" or ""),d,h,m,s)," 0[dhms]"," "),"%s+"," ")
		local string = strtrim(gsub(string, "([dhms])", {d=table.days or "d",h=table.hours or "h",m=table.minutes or "m",s=table.seconds or "s"})," ")
		return strmatch(string,"^%s*$") and "0"..(table.seconds or L"s") or string
		end
		if reset then
			if not addedLine then
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine(RAID_INFO_WORLD_BOSS, tr, tg, tb)
				addedLine = true
			end
			GameTooltip:AddDoubleLine(name, fmttime(reset), 1, 1, 1, 1, 1, 1)
		end
	end

	-- Mouse Actions
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("Mouse Actions", r, g, b)
	GameTooltip:AddDoubleLine("Left Click", "Open Calendar", 1, 1, 1, 1, 1, 1)
	GameTooltip:AddDoubleLine("Right Click", "Open Time Manager", 1, 1, 1, 1, 1, 1)
	GameTooltip:AddDoubleLine("Shift + Left Click", "Character Overview", 1, 1, 1, 1, 1, 1)

	GameTooltip:Show()
end)

Stat:SetScript("OnLeave", function()
	GameTooltip:Hide()
end)
Stat:RegisterEvent("CALENDAR_UPDATE_PENDING_INVITES")
Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:RegisterEvent("PLAYER_LOGIN")
Stat:RegisterEvent("UPDATE_INSTANCE_INFO")
Stat:RegisterEvent("WEEKLY_REWARDS_UPDATE")
Stat:RegisterEvent("CHALLENGE_MODE_COMPLETED")
Stat:RegisterEvent("MYTHIC_PLUS_NEW_WEEKLY_RECORD")
Stat:RegisterEvent("BAG_UPDATE_DELAYED")
Stat:RegisterEvent("WEEKLY_REWARDS_ITEM_CHANGED")
Stat:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
Stat:RegisterEvent("UNIT_INVENTORY_CHANGED")
Stat:SetScript("OnEvent", function(self, event, unit)
	if event == "UNIT_INVENTORY_CHANGED" and unit ~= "player" then return end

	if event == "PLAYER_LOGIN"
		or event == "PLAYER_ENTERING_WORLD"
		or event == "UPDATE_INSTANCE_INFO"
		or event == "WEEKLY_REWARDS_UPDATE"
		or event == "WEEKLY_REWARDS_ITEM_CHANGED"
		or event == "CHALLENGE_MODE_COMPLETED"
		or event == "MYTHIC_PLUS_NEW_WEEKLY_RECORD"
		or event == "BAG_UPDATE_DELAYED"
		or event == "CURRENCY_DISPLAY_UPDATE"
		or event == "UNIT_INVENTORY_CHANGED" then
		SaveCharacterData()
	end
end)
Stat:SetScript("OnUpdate", Update)
Stat:SetScript("OnMouseDown", function(self, btn)
	if btn == 'RightButton' then
		ToggleTimeManager()
	elseif btn == 'LeftButton' then
		if IsShiftKeyDown() then
			GameTooltip:Hide()
			ShowSavedCharactersFrame()
		else
			GameTimeFrame:Click()
		end
	end
end)
Update(Stat, 10)
SaveCharacterData()
