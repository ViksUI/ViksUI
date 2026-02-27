-- Tag Library - Reference for all available oUF and ViksUI tags

local _, ns = ...

-- Don't unpack ViksUI here - defer it until it's needed
local T, C, L

-- Initialize tables
ns.oUF_BuiltInTags = ns.oUF_BuiltInTags or {}
ns.ViksUI_CustomTags = ns.ViksUI_CustomTags or {}
ns.UserCustomTags = ns.UserCustomTags or {}

-- ========== BUILT-IN oUF TAGS ==========

ns.oUF_BuiltInTags = {
	-- General Info Tags
	["name"] = "Unit name",
	["smartname"] = "Smart unit name (shortest available)",
	["curhp"] = "Current health value",
	["maxhp"] = "Maximum health value",
	["perhp"] = "Health percentage",
	["missinghp"] = "Missing health value",
	["curpp"] = "Current power value",
	["maxpp"] = "Maximum power value",
	["perpp"] = "Power percentage",
	["curpp.abs"] = "Current power (absolute)",
	["maxpp.abs"] = "Maximum power (absolute)",
	["perpp.abs"] = "Power percentage (absolute)",
	
	-- Unit Details
	["class"] = "Unit class name",
	["faction"] = "Unit faction",
	["race"] = "Unit race",
	["level"] = "Unit level",
	["dead"] = "Shows Dead/Ghost status",
	["status"] = "Connection and status info",
	
	-- Power Types
	["power"] = "Current power (color-coded)",
	["powertype"] = "Type of power",
	
	-- Combat/Status
	["threat"] = "Threat percentage",
	["threatcolor"] = "Threat color code",
	["raidcolor"] = "Raid class color",
	["creatureclass"] = "Creature classification",
	["affix"] = "Mythic+ affix indicator",
	
	-- Class-specific
	["arcanecharges"] = "Mage arcane charges",
	["chi"] = "Monk chi points",
	
	-- Arena
	["arenaspec"] = "Arena opponent spec",
	
	-- Other
	["abbreviate"] = "Abbreviated value",
	["count"] = "Group count",
	["altpower"] = "Alternate power value",
	["absorb"] = "Absorption amount",
	["heal"] = "Healing absorbed",
}

-- ========== VIKSUI CUSTOM TAGS ==========

ns.ViksUI_CustomTags = {
	["Threat"] = "Threat indicator with percentage",
	["DiffColor"] = "Color based on difficulty",
	["PetNameColor"] = "Pet name with class color",
	["GetNameColor"] = "Name color by faction/class",
	["NameArena"] = "Arena player name (4 chars)",
	["NameShort"] = "Short name (8 chars)",
	["NameMedium"] = "Medium name (11 chars)",
	["NameLong"] = "Long name (18 chars)",
	["NameLongAbbrev"] = "Abbreviated long name",
	["LFD"] = "LFD role indicator [T/H/D]",
	["AltPower"] = "Alternate power percentage",
	["NameplateLevel"] = "Nameplate level display",
	["NameplateNameColor"] = "Nameplate name coloring",
	["NameplateNameShort"] = "Nameplate short name",
	["NameplateHealth"] = "Nameplate health display",
	["Absorbs"] = "Absorption values",
	["missinghp:short"] = "Missing health shortened",
	["missingpp:short"] = "Missing power shortened",
	["absorbs:shortvalue"] = "Absorbs shortened",
	["absorbs:longvalue"] = "Absorbs full value",
	["healabsorbs:shortvalue"] = "Heal absorbs shortened",
	["healabsorbs:longvalue"] = "Heal absorbs full value",
	["missinghp:shortvalue"] = "Missing HP shortened",
	["missinghp:longvalue"] = "Missing HP full value",
	["missingpp:shortvalue"] = "Missing power shortened",
	["missingpp:longvalue"] = "Missing power full value",
	["health:current:shortvalue"] = "Current health shortened",
	["health:current:longvalue"] = "Current health full",
	["health:max:shortvalue"] = "Max health shortened",
	["health:max:longvalue"] = "Max health full",
	["power:current:shortvalue"] = "Current power shortened",
	["power:current:longvalue"] = "Current power full",
	["power:max:shortvalue"] = "Max power shortened",
	["power:max:longvalue"] = "Max power full",
	["pvp:honorlevel"] = "PvP honor level",
	["drk:afkdnd"] = "AFK/DND status",
	["drk:color"] = "Class/reaction color code",
	["drk:color2"] = "Custom font color code",
	["drk:level"] = "Level with difficulty color",
	["drk:Shp"] = "Missing health with percent",
	["drk:power2"] = "Power with custom format",
	["cur|max"] = "Colored current/max health",
}

-- ========== FUNCTIONS ==========

function ns.RegisterCustomTag(tagName, tagFunction, tagEvents)
	if not tagName or tagName == "" then
		print("|cffFF0000Error: Tag name cannot be empty|r")
		return false
	end
	
	if not tagFunction or tagFunction == "" then
		print("|cffFF0000Error: Tag function cannot be empty|r")
		return false
	end
	
	-- Validate Lua syntax
	local wrappedFunc = "return function(unit, realUnit, ...) " .. tagFunction .. " end"
	local success, func = pcall(loadstring, wrappedFunc)
	
	if not success then
		print("|cffFF0000Error: Invalid Lua syntax - " .. tostring(func) .. "|r")
		return false
	end
	
	-- Get C from ViksUI if available
	if not C and ViksUI then
		C = select(2, unpack(ViksUI))
	end
	
	-- Store in config if available
	if C and C.options then
		if not C.options.custom_tags then
			C.options.custom_tags = {}
		end
		C.options.custom_tags[tagName] = {
			func = tagFunction,
			events = tagEvents or "UNIT_HEALTH"
		}
	end
	
	-- Store in UserCustomTags
	ns.UserCustomTags[tagName] = {
		func = tagFunction,
		events = tagEvents or "UNIT_HEALTH"
	}
	
	print("|cff70C0F5Custom tag '" .. tagName .. "' created successfully!|r")
	return true
end

function ns.DeleteCustomTag(tagName)
	if not C and ViksUI then
		C = select(2, unpack(ViksUI))
	end
	
	if C and C.options and C.options.custom_tags then
		C.options.custom_tags[tagName] = nil
	end
	ns.UserCustomTags[tagName] = nil
	print("|cff70C0F5Custom tag '" .. tagName .. "' deleted.|r")
end

function ns.LoadCustomTags()
	if not C and ViksUI then
		C = select(2, unpack(ViksUI))
	end
	
	if not C or not C.options or not C.options.custom_tags then return end
	
	for tagName, tagData in pairs(C.options.custom_tags) do
		ns.RegisterCustomTag(tagName, tagData.func, tagData.events)
	end
end

function ns.GetAllAvailableTags()
	local allTags = {}
	
	-- Add oUF tags
	for tagName, description in pairs(ns.oUF_BuiltInTags) do
		table.insert(allTags, { name = tagName, source = "oUF Built-in", desc = description })
	end
	
	-- Add ViksUI tags
	for tagName, description in pairs(ns.ViksUI_CustomTags) do
		table.insert(allTags, { name = tagName, source = "ViksUI", desc = description })
	end
	
	-- Add user custom tags
	for tagName, tagData in pairs(ns.UserCustomTags) do
		table.insert(allTags, { name = tagName, source = "Custom", desc = "User-created tag" })
	end
	
	table.sort(allTags, function(a, b) return a.name < b.name end)
	return allTags
end