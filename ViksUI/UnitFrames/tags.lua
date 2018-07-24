local T, C, L, _ = unpack(select(2, ...))
local addon, ns = ...
local _, ns = ...
local cfg = ns.cfg
local oUF = ns.oUF or oUF
local foo = {""}
local spellcache = setmetatable({}, 
{__index=function(t,id) 
	local a = {GetSpellInfo(id)} 

	if GetSpellInfo(id) then
		t[id] = a
		return a
	end

	--print("Invalid spell ID: ", id)
	t[id] = foo
	return foo
end
})

--------------------------------------------------------
oUF.Tags.Methods["Threat"] = function(unit)
	local _, status, percent = UnitDetailedThreatSituation("player", "target")
	if percent and percent > 0 then
		return ("%s%d%%|r"):format(Hex(GetThreatStatusColor(status)), percent)
	end
end
oUF.Tags.Events["Threat"] = "UNIT_THREAT_LIST_UPDATE"

oUF.Tags.Methods["DiffColor"] = function(unit)
	local r, g, b
	local level = UnitLevel(unit)
	if level < 1 then
		r, g, b = 0.69, 0.31, 0.31
	else
		local DiffColor = UnitLevel(unit) - UnitLevel("player")
		if DiffColor >= 5 then
			r, g, b = 0.69, 0.31, 0.31
		elseif DiffColor >= 3 then
			r, g, b = 0.71, 0.43, 0.27
		elseif DiffColor >= -2 then
			r, g, b = 0.84, 0.75, 0.65
		elseif -DiffColor <= GetQuestGreenRange() then
			r, g, b = 0.33, 0.59, 0.33
		else
			r, g, b = 0.55, 0.57, 0.61
		end
	end
	return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
end
oUF.Tags.Events["DiffColor"] = "UNIT_LEVEL"

oUF.Tags.Methods["PetNameColor"] = function(unit)
	return string.format("|cff%02x%02x%02x", T.color.r * 255, T.color.g * 255, T.color.b * 255)
end
oUF.Tags.Events["PetNameColor"] = "UNIT_POWER_UPDATE"

oUF.Tags.Methods["GetNameColor"] = function(unit)
	local reaction = UnitReaction(unit, "player")
	if UnitIsPlayer(unit) then
		return _TAGS["raidcolor"](unit)
	elseif reaction then
		local c = T.Colors.reaction[reaction]
		return string.format("|cff%02x%02x%02x", c[1] * 255, c[2] * 255, c[3] * 255)
	else
		r, g, b = 0.33, 0.59, 0.33
		return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
	end
end
oUF.Tags.Events["GetNameColor"] = "UNIT_POWER_UPDATE UNIT_FLAGS"

oUF.Tags.Methods["NameArena"] = function(unit)
	local name = UnitName(unit)
	return T.UTF(name, 4, false)
end
oUF.Tags.Events["NameArena"] = "UNIT_NAME_UPDATE"

oUF.Tags.Methods["NameShort"] = function(unit)
	local name = UnitName(unit)
	return T.UTF(name, 8, false)
end
oUF.Tags.Events["NameShort"] = "UNIT_NAME_UPDATE"

oUF.Tags.Methods["NameMedium"] = function(unit)
	local name = UnitName(unit)
	return T.UTF(name, 11, true)
end
oUF.Tags.Events["NameMedium"] = "UNIT_NAME_UPDATE"

oUF.Tags.Methods["NameLong"] = function(unit)
	local name = UnitName(unit)
	return T.UTF(name, 18, true)
end
oUF.Tags.Events["NameLong"] = "UNIT_NAME_UPDATE"

oUF.Tags.Methods["NameLongAbbrev"] = function(unit)
	local name = UnitName(unit)
	local newname = (string.len(name) > 18) and string.gsub(name, "%s?(.[\128-\191]*)%S+%s", "%1. ") or name
	return T.UTF(newname, 18, false)
end
oUF.Tags.Events["NameLong"] = "UNIT_NAME_UPDATE"

oUF.Tags.Methods["LFD"] = function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if role == "TANK" then
		return "|cff0070DE[T]|r"
	elseif role == "HEALER" then
		return "|cff00CC12[H]|r"
	elseif role == "DAMAGER" then
		return "|cffFF3030[D]|r"
	end
end
oUF.Tags.Events["LFD"] = "PLAYER_ROLES_ASSIGNED GROUP_ROSTER_UPDATE"

oUF.Tags.Methods["AltPower"] = function(unit)
	local min = UnitPower(unit, ALTERNATE_POWER_INDEX)
	local max = UnitPowerMax(unit, ALTERNATE_POWER_INDEX)
	if max > 0 and not UnitIsDeadOrGhost(unit) then
		return ("%s%%"):format(math.floor(min / max * 100 + 0.5))
	end
end
oUF.Tags.Events["AltPower"] = "UNIT_POWER_UPDATE"

oUF.Tags.Methods["IncHeal"] = function(unit)
	local incheal = UnitGetIncomingHeals(unit) or 0
	local player = UnitGetIncomingHeals(unit, "player") or 0
	incheal = incheal - player
	if incheal > 0 then
		return "|cff00FF00+"..T.ShortValue(incheal).."|r"
	end
end
oUF.Tags.Events["IncHeal"] = "UNIT_HEAL_PREDICTION"

oUF.Tags.Methods["NameplateLevel"] = function(unit)
	local level = UnitLevel(unit)
	local c = UnitClassification(unit)
	if UnitIsWildBattlePet(unit) or UnitIsBattlePetCompanion(unit) then
		level = UnitBattlePetLevel(unit)
	end

	if level == T.level and c == "normal" then return end
	if level > 0 then
		return level
	else
		return "??"
	end
end
oUF.Tags.Events["NameplateLevel"] = "UNIT_LEVEL PLAYER_LEVEL_UP"

oUF.Tags.Methods["NameplateNameColor"] = function(unit)
	local reaction = UnitReaction(unit, "player")
	if not UnitIsUnit("player", unit) and UnitIsPlayer(unit) and reaction >= 5 then
		local c = T.Colors.power["MANA"]
		return string.format("|cff%02x%02x%02x", c[1] * 255, c[2] * 255, c[3] * 255)
	elseif UnitIsPlayer(unit) then
		return _TAGS["raidcolor"](unit)
	elseif reaction then
		local c = T.Colors.reaction[reaction]
		return string.format("|cff%02x%02x%02x", c[1] * 255, c[2] * 255, c[3] * 255)
	else
		r, g, b = 0.33, 0.59, 0.33
		return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
	end
end
oUF.Tags.Events["NameplateNameColor"] = "UNIT_POWER_UPDATE UNIT_FLAGS"

oUF.Tags.Methods["NameplateHealth"] = function(unit)
	local hp = UnitHealth(unit)
	local maxhp = UnitHealthMax(unit)
	if maxhp == 0 then
		return 0
	else
		return ("%s - %d%%"):format(T.ShortValue(hp), hp / maxhp * 100 + 0.5)
	end
end
oUF.Tags.Events["NameplateHealth"] = "UNIT_HEALTH_FREQUENT UNIT_MAXHEALTH NAME_PLATE_UNIT_ADDED"
-----------------------------------------------------

local SVal = function(val)
	if val then
		if (val >= 1e6) then
			return ("%.1fm"):format(val / 1e6)
		elseif (val >= 1e3) then
			return ("%.1fk"):format(val / 1e3)
		else
			return ("%d"):format(val)
		end
	end
end
local function hex(r, g, b)
	if r then
		if (type(r) == 'table') then
			if(r.r) then r, g, b = r.r, r.g, r.b else r, g, b = unpack(r) end
		end
		return ('|cff%02x%02x%02x'):format(r * 255, g * 255, b * 255)
	end
end
local utf8sub = function(string, i, dots)
	if not string then return end
	local bytes = string:len()
	if (bytes <= i) then
		return string
	else
		local len, pos = 0, 1
		while(pos <= bytes) do
			len = len + 1
			local c = string:byte(pos)
			if (c > 0 and c <= 127) then
				pos = pos + 1
			elseif (c >= 192 and c <= 223) then
				pos = pos + 2
			elseif (c >= 224 and c <= 239) then
				pos = pos + 3
			elseif (c >= 240 and c <= 247) then
				pos = pos + 4
			end
			if (len == i) then break end
		end

		if (len == i and pos <= bytes) then
			return string:sub(1, pos - 1)..(dots and '...' or '')
		else
			return string
		end
	end
end

-----------------------------------------
-----------------------------------------
oUF.Tags.Methods['drk:Shp'] = function(u)
	local current = UnitHealthMax(u) - UnitHealth(u)
	local per = oUF.Tags.Methods['perhp'](u).."%" or 0
	if(current > 0) then
	return "|cffff0000".."-"..SVal(current).." | "..per.."|r"
	end
end
oUF.Tags.Events['drk:Shp'] = 'UNIT_HEALTH'

-- Error, just temp changes
oUF.Tags.Methods['cur|max'] = function(u)
	local cur, max = UnitHealth(u), UnitHealthMax(u)
	--local cur = max-min
	local r, g, b
	
	local status = not UnitIsConnected(u) and 'Offline' or UnitIsGhost(u) and 'Ghost' or UnitIsDead(u) and 'Dead'
	
	if(max ~= 0) then
		r, g, b = oUF.ColorGradient(cur, max, .89,.11,.11, .89,.89,.11, .33,.59,.33)
	end
	
	return status and status or ('%s%s | |cff2f9717%s|r'):format(Hex(r, g, b), SVal(cur), SVal(max))
end
oUF.Tags.Events['cur|max'] = 'UNIT_HEALTH'

oUF.Tags.Events['drk:power2'] = 'UNIT_MAXPOWER UNIT_POWER_UPDATE'
oUF.Tags.Methods['drk:power2'] = function(unit)
	local curpp, maxpp = UnitPower(unit), UnitPowerMax(unit);
	local playerClass, englishClass = UnitClass(unit);

	if(maxpp == 0) then
		return ""
	else
		if (englishClass == "WARRIOR") then
			return curpp
		elseif (englishClass == "DEATHKNIGHT" or englishClass == "ROGUE" or englishClass == "HUNTER") then
			return curpp .. ' /' .. maxpp
		else
			return SVal(curpp) .. " /" .. SVal(maxpp) .. " | " .. math.floor(curpp/maxpp*100+0.5) .. "%"
		end
	end
end;






oUF.Tags.Methods['rollico:LFD'] = function(u)
	local role = UnitGroupRolesAssigned(u)
	if role == "HEALER" then
		return "|cff8AFF30H|r"
	elseif role == "TANK" then
		return "|cff5F9BFFT|r"
	elseif role == "DAMAGER" then
		return "|cffFF6161D|r"
	end
end
oUF.Tags.Events['rollico:LFD'] = 'PLAYER_ROLES_ASSIGNED GROUP_ROSTER_UPDATE'

oUF.Tags.Methods["rolltext:LFD"] = function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if role == "HEALER" then
		return "|cff8AFF30Heal|r"
	elseif role == "TANK" then
		return "|cffFFF130Tank|r"
	elseif role == "DAMAGER" then
		return "|cffFF6161Dps|r"
	end
end
oUF.Tags.Events["rolltext:LFD"] = "GROUP_ROSTER_UPDATE PLAYER_ROLES_ASSIGNED"

oUF.Tags.Events['drk:power2'] = 'UNIT_MAXPOWER UNIT_POWER_UPDATE'
oUF.Tags.Methods['drk:power2'] = function(unit)
	local curpp, maxpp = UnitPower(unit), UnitPowerMax(unit);
	local playerClass, englishClass = UnitClass(unit);

	if(maxpp == 0) then
		return ""
	else
		if (englishClass == "WARRIOR") then
			return curpp
		elseif (englishClass == "DEATHKNIGHT" or englishClass == "ROGUE" or englishClass == "HUNTER") then
			return curpp .. ' /' .. maxpp
		else
			return SVal(curpp) .. " /" .. SVal(maxpp) .. " | " .. math.floor(curpp/maxpp*100+0.5) .. "%"
		end
	end
end;

-----------------------------------------
-----------------------------------------
oUF.Tags.Methods['hp']  = function(u) 
  if UnitIsDead(u) or UnitIsGhost(u) or not UnitIsConnected(u) then
    return oUF.Tags.Methods['DDG'](u)
  else
	local per = oUF.Tags.Methods['perhp'](u).."%" or 0
    local min, max = UnitHealth(u), UnitHealthMax(u)
    if u == "player" or u == "target" then
      if min~=max then 
        return SVal(min).." | "..per
      else
        return SVal(max).." | "..per
      end
    else
      return per
    end
  end
end
oUF.Tags.Events['hp'] = 'UNIT_HEALTH'
oUF.Tags.Methods['power']  = function(u) 
	local min, max = UnitPower(u), UnitPowerMax(u)
	if min~=max then 
		return SVal(min)
	else
		return SVal(max)
	end
end
oUF.Tags.Events['power'] = 'UNIT_POWER_UPDATE UNIT_MAXPOWER'
oUF.Tags.Methods['color'] = function(u, r)
	local _, class = UnitClass(u)
	local reaction = UnitReaction(u, "player")
	
	if UnitIsDead(u) or UnitIsGhost(u) or not UnitIsConnected(u) then
		return "|cffA0A0A0"
	elseif UnitIsTapDenied(u) then
		return hex(oUF.colors.tapped)
	elseif (UnitIsPlayer(u)) then
		return hex(oUF.colors.class[class])
	elseif reaction then
		return hex(oUF.colors.reaction[reaction])
	else
		return hex(1, 1, 1)
	end
end
oUF.Tags.Events['color'] = 'UNIT_HEALTH'

oUF.Tags.Methods["afk"] = function(unit) 
	
	return UnitIsAFK(unit) and "|cffCFCFCF afk|r" or ""
end
oUF.Tags.Events["afk"] = "PLAYER_FLAGS_CHANGED"

oUF.Tags.Methods['DDG'] = function(u)
	if UnitIsDead(u) then
		return "|cffCFCFCF Dead|r"
	elseif UnitIsGhost(u) then
		return "|cffCFCFCF Ghost|r"
	elseif not UnitIsConnected(u) then
		return "|cffCFCFCF D/C|r"
	end
end
oUF.Tags.Events['DDG'] = 'UNIT_HEALTH'

oUF.Tags.Methods['LFD'] = function(u)
	local role = UnitGroupRolesAssigned(u)
	if role == "HEALER" then
		return "|cff8AFF30H|r"
	elseif role == "TANK" then
		return "|cff5F9BFFT|r"
	elseif role == "DAMAGER" then
		return "|cffFF6161D|r"
	end
end
oUF.Tags.Events['LFD'] = 'PLAYER_ROLES_ASSIGNED GROUP_ROSTER_UPDATE'
-- Level
oUF.Tags.Methods["level"] = function(unit)
	
	local c = UnitClassification(unit)
	local l = UnitLevel(unit)
	local d = GetQuestDifficultyColor(l)
	
	local str = l
		
	if l <= 0 then l = "??" end
	
	if c == "worldboss" then
		str = string.format("|cff%02x%02x%02xBoss|r",250,20,0)
	elseif c == "eliterare" then
		str = string.format("|cff%02x%02x%02x%s|r|cff0080FFR|r+",d.r*255,d.g*255,d.b*255,l)
	elseif c == "elite" then
		str = string.format("|cff%02x%02x%02x%s|r+",d.r*255,d.g*255,d.b*255,l)
	elseif c == "rare" then
		str = string.format("|cff%02x%02x%02x%s|r|cff0080FFR|r",d.r*255,d.g*255,d.b*255,l)
	else
		if not UnitIsConnected(unit) then
			str = "??"
		else
			if UnitIsPlayer(unit) then
				str = string.format("|cff%02x%02x%02x%s",d.r*255,d.g*255,d.b*255,l)
			elseif UnitPlayerControlled(unit) then
				str = string.format("|cff%02x%02x%02x%s",d.r*255,d.g*255,d.b*255,l)
			else
				str = string.format("|cff%02x%02x%02x%s",d.r*255,d.g*255,d.b*255,l)
			end
		end		
	end
	
	return str
end
oUF.Tags.Events["level"] = "UNIT_LEVEL PLAYER_LEVEL_UP UNIT_CLASSIFICATION_CHANGED"

-- AltPower value tag
oUF.Tags.Methods['altpower'] = function(unit)
	local cur = UnitPower(unit, ALTERNATE_POWER_INDEX)
	local max = UnitPowerMax(unit, ALTERNATE_POWER_INDEX)
	if(max > 0 and not UnitIsDeadOrGhost(unit)) then
		return ("%s%%"):format(math.floor(cur/max*100+.5))
	end
end
oUF.Tags.Events['altpower'] = 'UNIT_POWER_UPDATE'
oUF.Tags.Methods['drk:hp']  = function(u) 
  if UnitIsDead(u) or UnitIsGhost(u) or not UnitIsConnected(u) then
    return oUF.Tags.Methods['drk:DDG'](u)
  else
	local per = oUF.Tags.Methods['perhp'](u).."%" or 0
    local min, max = UnitHealth(u), UnitHealthMax(u)
    if u == "player" or u == "target" then
      if min~=max then 
        return SVal(min)
      else
        return SVal(max)
      end
    else
      return per
    end
  end
end
oUF.Tags.Events['drk:hp'] = 'UNIT_HEALTH'


oUF.Tags.Methods['drk:power']  = function(u) 
	local min, max = UnitPower(u), UnitPowerMax(u)
	if min~=max then 
		return SVal(min)
	else
		return SVal(max)
	end
end
oUF.Tags.Events['drk:power'] = 'UNIT_POWER_UPDATE UNIT_MAXPOWER'


oUF.Tags.Methods['drk:raidhp']  = function(u) 
  if UnitIsDead(u) or UnitIsGhost(u) or not UnitIsConnected(u) then
    return oUF.Tags.Methods['drk:DDG'](u)
  else
	local per = oUF.Tags.Methods['perhp'](u).."%" or 0
    return per
  end
end
oUF.Tags.Events['drk:raidhp'] = 'UNIT_HEALTH'

oUF.Tags.Methods['drk:color'] = function(u, r)
	local _, class = UnitClass(u)
	local reaction = UnitReaction(u, "player")
	
	if UnitIsDead(u) or UnitIsGhost(u) or not UnitIsConnected(u) then
		return "|cffA0A0A0"
	elseif (UnitIsTapDenied(u) and not UnitPlayerControlled(u)) then
		return hex(oUF.colors.tapped)
	elseif (UnitIsPlayer(u)) then
		return hex(oUF.colors.class[class])
	elseif reaction then
		return hex(oUF.colors.reaction[reaction])
	else
		return hex(1, 1, 1)
	end
end
oUF.Tags.Events['drk:color'] = 'UNIT_HEALTH'

oUF.Tags.Methods['drk:color2'] = function(u, r)
	local _, class = UnitClass(u)
	local reaction = UnitReaction(u, "player")
	
	if UnitIsDead(u) or UnitIsGhost(u) or not UnitIsConnected(u) then
		return "|cffA0A0A0"
	elseif (UnitIsTapDenied(u) and not UnitPlayerControlled(u)) then
		return hex(oUF.colors.tapped)
	elseif (UnitIsPlayer(u)) then
		return hex(unpack(C.media.oUFfontcolor))
	elseif reaction then
		return hex(oUF.colors.reaction[reaction])
	else
		return hex(1, 1, 1)
	end
end
oUF.Tags.Events['drk:color2'] = 'UNIT_HEALTH'

oUF.Tags.Methods["drk:afkdnd"] = function(unit) 
	
	return UnitIsAFK(unit) and "|cffCFCFCF <afk>|r" or UnitIsDND(unit) and "|cffCFCFCF <dnd>|r" or ""
end
oUF.Tags.Events["drk:afkdnd"] = "PLAYER_FLAGS_CHANGED"

oUF.Tags.Methods['drk:DDG'] = function(u)
	if UnitIsDead(u) then
		return "|cffCFCFCF Dead|r"
	elseif UnitIsGhost(u) then
		return "|cffCFCFCF Ghost|r"
	elseif not UnitIsConnected(u) then
		return "|cffCFCFCF D/C|r"
	end
end
oUF.Tags.Events['drk:DDG'] = 'UNIT_HEALTH'

oUF.Tags.Events["drk:level"] = "UNIT_LEVEL PLAYER_LEVEL_UP UNIT_CLASSIFICATION_CHANGED"

local _, class = UnitClass("player")
local spells
oUF.Indicators = {
	["TL"] = "",
	["TR"] = "",
	["BL"] = "",
	["BR"] = ""
}
if (class == "DRUID") then
--[[
	spells = {
		["Mark of the Wild"] = GetSpellInfo(1126)
	}
	oUF.Tags.Methods["MotW"] = function(unit)
		if (not UnitAura(unit, spells["Mark of the Wild"])) then
			return "|cffFF00FFM|r"
		end
	end
	oUF.Tags.Events["MotW"] = "UNIT_AURA"
	oUF.Indicators["TR"] = "[MotW]"
	]]--
elseif (class == "DEATHKNIGHT") then
--[[
	spells = {
		["Horn of Winter"] = GetSpellInfo(57330)
	}
	oUF.Tags.Methods["HoW"] = function(unit)
		if (not UnitAura(unit, spells["Horn of Winter"])) then
			return "|cffffff10M|r"
		end
	end
	oUF.Tags.Events["HoW"] = "UNIT_AURA"
	oUF.Indicators["TR"] = "[HoW]"
	]]--
elseif (class == "HUNTER") then
	spells = {}
elseif (class == "MAGE") then
	--[[spells = {
		["Arcane Brilliance"] = GetSpellInfo(1459),
		["Dalaran Brilliance"] = GetSpellInfo(61316)
	}
	oUF.Tags.Methods["FM"] = function(unit)
		if (not (UnitAura(unit, spells["Arcane Brilliance"]) or 
		UnitAura(unit, spells["Dalaran Brilliance"]))) then
			return "|cffffff00M|r"
		end
	end
	oUF.Tags.Events["FM"] = "UNIT_AURA"
	
	oUF.Indicators["TR"] = "[FM]"
	]]--
elseif (class == "PALADIN") then
	--[[spells = {
		["Beacon of Light"] = GetSpellInfo(53563),
		["Blessing of Kings"] = GetSpellInfo(20217),
		["Blessing of Might"] = GetSpellInfo(19740)
	}
	
	oUF.Tags.Methods["BoL"] = function(unit)
		if (UnitAura(unit, spells["Beacon of Light"])) then
			return "|cffffff10M|r"
		end
	end
	oUF.Tags.Events["BoL"] = "UNIT_AURA"
	
	oUF.Tags.Methods["sBoL"] = function(unit)
		local _, _, _, _, _, _, _, caster = UnitAura(unit, spells["Beacon of Light"])
		if (caster and caster == "player") then
			return "|cffff33ffM|r"
		end
	end
	oUF.Tags.Events["sBoL"] = "UNIT_AURA"
	
	oUF.Tags.Methods["Blessing"] = function(unit)
		if (not (select(8, UnitAura(unit, spells["Blessing of Kings"])) == "player" or
			select(8, UnitAura(unit, spells["Blessing of Might"])) == "player")) then
			return "|cffffff00M|r"
		end
	end
	oUF.Tags.Events["Blessing"] = "UNIT_AURA"
	
	oUF.Indicators["TR"] = "[sBoL][BoL][Blessing]"
	]]--
elseif (class == "PRIEST") then
--[[
	spells = {
		["Power Word: Fortitude"] = GetSpellInfo(21562)
	}
	oUF.Tags.Methods["PW:F"] = function(unit)
		if (not UnitAura(unit, spells["Power Word: Fortitude"])) then
			return "|cff00A1DEM|r"
		end
	end
	oUF.Tags.Events["PW:F"] = "UNIT_AURA"
	oUF.Tags.Methods["SP"] = function(unit)
		if (not UnitAura(unit, spells["Shadow Protection"])) then
			return ""
		end
	end
	oUF.Tags.Events["SP"] = "UNIT_AURA"
	oUF.Indicators["TR"] = "[PW:F]"
--]]
elseif (class == "ROGUE") then
	spells = {}
elseif (class == "SHAMAN") then
	spells = {}
elseif (class == "MONK") then
--[[
	spells = {
			["Legacy of the Emperor"] = GetSpellInfo(115921)
	}
	oUF.Tags.Methods["LE"] = function(unit)
		if (not UnitAura(unit, spells["Legacy of the Emperor"])) then
			return "|cffffff10M|r"
		end
	end
	oUF.Tags.Events["LE"] = "UNIT_AURA"
	oUF.Indicators["TR"] = "[LE]"
--]]
elseif (class == "WARLOCK") then
	--[[spells = {
			["Dark Intent"] = GetSpellInfo(109773)
	}
	oUF.Tags.Methods["DI"] = function(unit)
		if (not UnitAura(unit, spells["Dark Intent"])) then
			return "|cffffff10M|r"
		end
	end
	oUF.Tags.Events["DI"] = "UNIT_AURA"
	oUF.Indicators["TR"] = "[DI]"
]]--
elseif (class == "WARRIOR") then
--[[
	spells = {
		["Battle Shout"] = GetSpellInfo(6673),
		["Commanding Shout"] = GetSpellInfo(469),
	}
	oUF.Tags.Methods["BS"] = function(unit)
		if (UnitAura(unit, spells["Battle Shout"])) then
			return "|cffff0000M|r"
		end
	end
	oUF.Tags.Events["BS"] = "UNIT_AURA"
	
	oUF.Tags.Methods["CS"] = function(unit)
		if (UnitAura(unit, spells["Commanding Shout"])) then
			return "|cffffff00M|r"
		end
	end
	oUF.Tags.Events["CS"] = "UNIT_AURA"
	oUF.Indicators["TR"] = "[BS][CS]"
]]--
end
-- Level
oUF.Tags.Methods["drk:level"] = function(unit)
	
	local c = UnitClassification(unit)
	local l = UnitLevel(unit)
	local d = GetQuestDifficultyColor(l)
	
	local str = l
		
	if l <= 0 then l = "??" end
	
	if c == "worldboss" then
		str = string.format("|cff%02x%02x%02xBoss|r",250,20,0)
	elseif c == "eliterare" then
		str = string.format("|cff%02x%02x%02x%s|r|cff0080FFR|r+",d.r*255,d.g*255,d.b*255,l)
	elseif c == "elite" then
		str = string.format("|cff%02x%02x%02x%s|r+",d.r*255,d.g*255,d.b*255,l)
	elseif c == "rare" then
		str = string.format("|cff%02x%02x%02x%s|r|cff0080FFR|r",d.r*255,d.g*255,d.b*255,l)
	else
		if not UnitIsConnected(unit) then
			str = "??"
		else
			if UnitIsPlayer(unit) then
				str = string.format("|cff%02x%02x%02x%s",d.r*255,d.g*255,d.b*255,l)
			elseif UnitPlayerControlled(unit) then
				str = string.format("|cff%02x%02x%02x%s",d.r*255,d.g*255,d.b*255,l)
			else
				str = string.format("|cff%02x%02x%02x%s",d.r*255,d.g*255,d.b*255,l)
			end
		end		
	end
	
	return str
end


-- CLASS BUFF INDICATORS

local GetTime = GetTime

local numberize = function(val)
	if (val >= 1e6) then
		return ("%.1fm"):format(val / 1e6)
	elseif (val >= 1e3) then
		return ("%.1fk"):format(val / 1e3)
	else
		return ("%d"):format(val)
	end
end
ns.numberize = numberize

local x = "M"

local getTime = function(expirationTime)
	local expire = (expirationTime-GetTime())
	local timeleft = numberize(expire)
	if expire > 0.5 then
		return ("|cffffff00"..timeleft.."|r")
	end

end

if cfg.IndicatorIcons2 and class ~= "MONK" then
----------------------------------------------------------------------------------------
-- Magic
oUF.Tags.Methods['freebgrid:magic'] = function(u)
	local index = 1
	while true do
		local name,_,_,_, dtype = UnitAura(u, index, 'HARMFUL')
		if not name then break end

		if dtype == "Magic" then
			return ns.debuffColor[dtype]..x
		end

		index = index+1
	end
end
oUF.Tags.Events['freebgrid:magic'] = "UNIT_AURA"

-- Disease
oUF.Tags.Methods['freebgrid:disease'] = function(u)
	local index = 1
	while true do
		local name,_,_,_, dtype = UnitAura(u, index, 'HARMFUL')
		if not name then break end

		if dtype == "Disease" then
			return ns.debuffColor[dtype]..x
		end

		index = index+1
	end
end
oUF.Tags.Events['freebgrid:disease'] = "UNIT_AURA"

-- Curse
oUF.Tags.Methods['freebgrid:curse'] = function(u)
	local index = 1
	while true do
		local name,_,_,_, dtype = UnitAura(u, index, 'HARMFUL')
		if not name then break end

		if dtype == "Curse" then
			return ns.debuffColor[dtype]..x
		end

		index = index+1
	end
end
oUF.Tags.Events['freebgrid:curse'] = "UNIT_AURA"

-- Poison
oUF.Tags.Methods['freebgrid:poison'] = function(u)
	local index = 1
	while true do
		local name,_,_,_, dtype = UnitAura(u, index, 'HARMFUL')
		if not name then break end

		if dtype == "Poison" then
			return ns.debuffColor[dtype]..x
		end

		index = index+1
	end
end
oUF.Tags.Events['freebgrid:poison'] = "UNIT_AURA"

-- Priest
local pomCount = {
	[1] = 'i',
	[2] = 'h',
	[3] = 'g',
	[4] = 'f',
	[5] = 'Z',
	[6] = 'Y',
}
oUF.Tags.Methods['freebgrid:pom'] = function(u) 
	local name, _,_, c, _,_,_, fromwho = UnitAura(u, GetSpellInfo(33076))
	if name and pomCount[c] then
		if(fromwho == "player") then
			return "|cff66FFFF"..pomCount[c].."|r"
		else
			return "|cffFFCF7F"..pomCount[c].."|r"
		end
	end
end
oUF.Tags.Events['freebgrid:pom'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:rnw'] = function(u)
	local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(139))
	if(fromwho == "player") then
		local spellTimer = GetTime()-expirationTime
		if spellTimer > -2 then
			return "|cffFF0000"..x.."|r"
		elseif spellTimer > -4 then
			return "|cffFF9900"..x.."|r"
		else
			return "|cff33FF33"..x.."|r"
		end
	end
end
oUF.Tags.Events['freebgrid:rnw'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:rnwTime'] = function(u)
	local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(139))
	if(fromwho == "player") then return getTime(expirationTime) end 
end
oUF.Tags.Events['freebgrid:rnwTime'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:pws'] = function(u) if UnitAura(u, GetSpellInfo(17)) then return "|cff33FF33"..x.."|r" end end
oUF.Tags.Events['freebgrid:pws'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:ws'] = function(u) if UnitDebuff(u, GetSpellInfo(6788)) then return "|cffFF9900"..x.."|r" end end
oUF.Tags.Events['freebgrid:ws'] = "UNIT_AURA"

--oUF.Tags.Methods['freebgrid:fw'] = function(u) if UnitAura(u, GetSpellInfo(6346)) then return "|cff8B4513"..x.."|r" end end
--oUF.Tags.Events['freebgrid:fw'] = "UNIT_AURA"

--oUF.Tags.Methods['freebgrid:fort'] = function(u) if not(UnitAura(u, GetSpellInfo(21562)) or UnitAura(u, GetSpellInfo(469)) or UnitAura(u, GetSpellInfo(109773))) then return "|cff00A1DE"..x.."|r" end end
--oUF.Tags.Events['freebgrid:fort'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:pwb'] = function(u) if UnitAura(u, GetSpellInfo(81782)) then return "|cffEEEE00"..x.."|r" end end
oUF.Tags.Events['freebgrid:pwb'] = "UNIT_AURA"

-- Druid

local LIFEBLOOM = GetSpellInfo(33763)
oUF.Tags.Events["freebgrid:lb"] = 'UNIT_AURA'
oUF.Tags.Methods["freebgrid:lb"] = function(unit)
	local _, _, _, stacks, _, _, expirationTime, source = UnitAura(unit, LIFEBLOOM)
	if source and source == "player" then
			return format("|cffcc0000%.0f|r ", expirationTime - GetTime())
	end
end

oUF.Tags.Methods['freebgrid:rejuv'] = function(u)
	local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(774))
	if(fromwho == "player") then
		local spellTimer = GetTime()-expirationTime
		if spellTimer > -2 then
			return "|cffFF0000"..x.."|r"
		elseif spellTimer > -4 then
			return "|cffFF9900"..x.."|r"
		else
			return "|cff33FF33"..x.."|r"
		end
	end
end
oUF.Tags.Events['freebgrid:rejuv'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:rejuvTime'] = function(u)
	local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(774))
	if(fromwho == "player") then return getTime(expirationTime) end 
end
oUF.Tags.Events['freebgrid:rejuvTime'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:regrow'] = function(u) if UnitAura(u, GetSpellInfo(8936)) then return "|cff00FF10"..x.."|r" end end
oUF.Tags.Events['freebgrid:regrow'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:wg'] = function(u) if UnitAura(u, GetSpellInfo(48438)) then return "|cff33FF33"..x.."|r" end end
oUF.Tags.Events['freebgrid:wg'] = "UNIT_AURA"


-- Warrior
oUF.Tags.Methods['freebgrid:stragi'] = function(u) if not(UnitAura(u, GetSpellInfo(6673)) or UnitAura(u, GetSpellInfo(57330)) or UnitAura(u, GetSpellInfo(8076))) then return "|cffFF0000"..x.."|r" end end
oUF.Tags.Events['freebgrid:stragi'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:vigil'] = function(u) if UnitAura(u, GetSpellInfo(50720)) then return "|cff8B4513"..x.."|r" end end
oUF.Tags.Events['freebgrid:vigil'] = "UNIT_AURA"

-- Shaman
oUF.Tags.Methods['freebgrid:rip'] = function(u) 
	local name, _,_,_,_,_,_, fromwho = UnitAura(u, GetSpellInfo(61295))
	if(fromwho == 'player') then return "|cff00FEBF"..x.."|r" end
end
oUF.Tags.Events['freebgrid:rip'] = 'UNIT_AURA'

oUF.Tags.Methods['freebgrid:ripTime'] = function(u)
	local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(61295))
	if(fromwho == "player") then return getTime(expirationTime) end 
end
oUF.Tags.Events['freebgrid:ripTime'] = 'UNIT_AURA'

local earthCount = {'i','h','g','f','p','q','Z','Z','Y'}
oUF.Tags.Methods['freebgrid:earth'] = function(u) 
	local c = select(4, UnitAura(u, GetSpellInfo(974))) if c then return '|cffFFCF7F'..earthCount[c]..'|r' end 
end
oUF.Tags.Events['freebgrid:earth'] = 'UNIT_AURA'

oUF.Tags.Methods['freebgrid:beacon'] = function(u)
	local name, _,_,_,_,_,_, fromwho = UnitAura(u, GetSpellInfo(53563))
	if not name then return end
	if(fromwho == "player") then
		return "|cffFFCC003|r"
	else
		return "|cff996600Y|r" -- other pally's beacon
	end
end
oUF.Tags.Events['freebgrid:beacon'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:forbearance'] = function(u) if UnitDebuff(u, GetSpellInfo(25771)) then return "|cffFF9900"..x.."|r" end end
oUF.Tags.Events['freebgrid:forbearance'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:eternalTime'] = function(u)
	local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(114163))
	if(fromwho == "player") then return getTime(expirationTime) end 
end
oUF.Tags.Events['freebgrid:eternalTime'] = "UNIT_AURA"

-- Warlock
oUF.Tags.Methods['freebgrid:di'] = function(u) 
	local name, _,_,_,_,_,_, fromwho = UnitAura(u, GetSpellInfo(109773))
	if fromwho == "player" then
		return "|cff6600FF"..x.."|r"
	elseif name then
		return "|cffCC00FF"..x.."|r"
	end
end
oUF.Tags.Events['freebgrid:di'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:ss'] = function(u) 
	local name, _,_,_,_,_,_, fromwho = UnitAura(u, GetSpellInfo(20707)) 
	if fromwho == "player" then
		return "|cff6600FFY|r"
	elseif name then
		return "|cffCC00FFY|r"
	end
end
oUF.Tags.Events['freebgrid:ss'] = "UNIT_AURA"

-- Mage
oUF.Tags.Methods['freebgrid:int'] = function(u) if not(UnitAura(u, GetSpellInfo(1459)) or UnitAura(u, GetSpellInfo(61316))) then return "|cff00A1DE"..x.."|r" end end
oUF.Tags.Events['freebgrid:int'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:fmagic'] = function(u) if UnitAura(u, GetSpellInfo(54648)) then return "|cffCC00FF"..x.."|r" end end
oUF.Tags.Events['freebgrid:fmagic'] = "UNIT_AURA"

-- DEATHKNIGHT

oUF.Tags.Methods['freebgrid:horn'] = function(u) if not(UnitAura(u, GetSpellInfo(57330)) or UnitAura(u, GetSpellInfo(19506))) then return "|cff00A1DE"..x.."|r" end end
oUF.Tags.Events['freebgrid:horn'] = "UNIT_AURA"

ns.classIndicators={
	["DRUID"] = {
		["TL"] = "",
		["TR"] = "",
		["BL"] = "[freebgrid:regrow][freebgrid:wg]",
		["BR"] = "[freebgrid:lb]",
		["Cen"] = "[freebgrid:rejuvTime]",
	},
	["PRIEST"] = {
		["TL"] = "[freebgrid:pws][freebgrid:ws]",
		["TR"] = "[freebgrid:fw]",
		["BL"] = "[freebgrid:rnw][freebgrid:pwb]",
		["BR"] = "[freebgrid:pom]",
		["Cen"] = "[freebgrid:rnwTime]",
	},
	["PALADIN"] = {
		["TL"] = "[freebgrid:forbearance]",
		["TR"] = "",
		["BL"] = "",
		["BR"] = "[freebgrid:beacon]",
		["Cen"] = "[freebgrid:eternalTime]",
	},
	["WARLOCK"] = {
		["TL"] = "",
		["TR"] = "[freebgrid:di]",
		["BL"] = "",
		["BR"] = "[freebgrid:ss]",
		["Cen"] = "",
	},
	["WARRIOR"] = {
		["TL"] = "[freebgrid:vigil]",
		["TR"] = "[freebgrid:stragi]",
		["BL"] = "",
		["BR"] = "",
		["Cen"] = "",
	},
	["DEATHKNIGHT"] = {
		["TL"] = "",
		["TR"] = "[freebgrid:horn]",
		["BL"] = "",
		["BR"] = "",
		["Cen"] = "",
	},
	["SHAMAN"] = {
		["TL"] = "[freebgrid:rip]",
		["TR"] = "",
		["BL"] = "",
		["BR"] = "[freebgrid:earth]",
		["Cen"] = "[freebgrid:ripTime]",
	},
	["HUNTER"] = {
		["TL"] = "",
		["TR"] = "",
		["BL"] = "",
		["BR"] = "",
		["Cen"] = "",
	},
	["ROGUE"] = {
		["TL"] = "",
		["TR"] = "",
		["BL"] = "",
		["BR"] = "",
		["Cen"] = "",
	},
	["MAGE"] = {
		["TL"] = "",
		["TR"] = "[freebgrid:int]",
		["BL"] = "",
		["BR"] = "",
		["Cen"] = "",
	},
	["MONK"] = {
		["TL"] = "",
		["TR"] = "",
		["BL"] = "",
		["BR"] = "",
		["Cen"] = "",
	},
}

----------------------------------------------------------------------------------------
else
----------------------------------------------------------------------------------------
---------------------------
-- Class Buff Indicators, from cfg.lua --
---------------------------
local UnitAura, GetTime = UnitAura, GetTime

--DEATHKNIGHT
--DRUID

--local INNERVATE = GetSpellInfo(29166)
--oUF.Tags.Events["Druid:Innervate"] = 'UNIT_AURA'
--oUF.Tags.Methods["Druid:Innervate"] = function(unit)
--	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, INNERVATE)
--	if expirationTime then
--		return format("|cff268ccc%.0f|r ", expirationTime - GetTime())
--	end
--end

local IRONBARK = GetSpellInfo(102342)
oUF.Tags.Events["Druid:Ironbark"] = 'UNIT_AURA'
oUF.Tags.Methods["Druid:Ironbark"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, IRONBARK)
	if expirationTime then
		return format("|cffa52a2a%.0f|r ", expirationTime - GetTime())
	end
end

local LIFEBLOOM = GetSpellInfo(33763)
oUF.Tags.Events["Druid:Lifebloom"] = 'UNIT_AURA'
oUF.Tags.Methods["Druid:Lifebloom"] = function(unit)
	local _, _, _, stacks, _, _, expirationTime, source = UnitAura(unit, LIFEBLOOM)
	if source and source == "player" then
		return format("|cffffcc00%.0f|r ", expirationTime - GetTime())
	end
end

local REJUVENATION = GetSpellInfo(774)
oUF.Tags.Events["Druid:Rejuv"] = 'UNIT_AURA'
oUF.Tags.Methods["Druid:Rejuv"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, REJUVENATION)
	if source and source == "player" then
		return format("|cffd814ff%.0f|r ", expirationTime - GetTime())
	end
end

local GERMINATION = GetSpellInfo(155777)
oUF.Tags.Events["Druid:Germination"] = 'UNIT_AURA'
oUF.Tags.Methods["Druid:Germination"] = function(unit)
    local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, GERMINATION)
    if source and source == "player" then
        return format("|cffd814ff%.0f|r ", expirationTime - GetTime())
    end
end

local REGROWTH = GetSpellInfo(8936)
oUF.Tags.Events["Druid:Regrowth"] = 'UNIT_AURA'
oUF.Tags.Methods["Druid:Regrowth"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, REGROWTH)
	if source == "player" then
		return format("|cff33cc00%.0f|r ", expirationTime - GetTime())
	end
end

local WILD_GROWTH = GetSpellInfo(48438)
oUF.Tags.Events["Druid:WildGrowth"] = 'UNIT_AURA'
oUF.Tags.Methods["Druid:WildGrowth"] = function(unit)
    if UnitBuff(unit, WILD_GROWTH) then
        return "|cff33cc00M|r "
    end
end

--HUNTER
--local MISDIRECTION = GetSpellInfo(35079)
--oUF.Tags.Events["Hunter:Misdirection"] = 'UNIT_AURA'
--oUF.Tags.Methods["Hunter:Misdirection"] = function(unit)
	--if UnitDebuff(unit, MISDIRECTION) then 
		--return "|cffaa0000M|r "
	--end
--end

--MAGE

--MONK
local ENVELOPING_MIST = GetSpellInfo(124682)
oUF.Tags.Events["Monk:EnvelopingMist"] = 'UNIT_AURA'
oUF.Tags.Methods["Monk:EnvelopingMist"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, ENVELOPING_MIST)
	if source and source == "player" then
		return format("|cff33cc00%.0f|r ", expirationTime - GetTime())
	end
end

local RENEWING_MIST = GetSpellInfo(119611)
oUF.Tags.Events["Monk:RenewingMist"] = 'UNIT_AURA'
oUF.Tags.Methods["Monk:RenewingMist"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, RENEWING_MIST)
	if source and source == "player" then
		return format("|cff0099cc%.0f|r ", expirationTime - GetTime())
	end
end

local SOOTHING_MIST = GetSpellInfo(115175)
oUF.Tags.Events["Monk:SoothingMist"] = 'UNIT_AURA'
oUF.Tags.Methods["Monk:SoothingMist"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, SOOTHING_MIST)
	if source and source == "player" then
		return format("|cffd814ff%.0f|r ", expirationTime - GetTime())
	end
end

local LIFE_COCOON = GetSpellInfo(116849)
oUF.Tags.Events["Monk:LifeCocoon"] = 'UNIT_AURA'
oUF.Tags.Methods["Monk:LifeCocoon"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, LIFE_COCOON)
	if source and source == "player" then
		return format("|cffd814ff%.0f|r ", expirationTime - GetTime())
	end
end

--PALADIN
local BEACON = GetSpellInfo(53563)
oUF.Tags.Events["Paladin:Beacon"] = 'UNIT_AURA'
oUF.Tags.Methods["Paladin:Beacon"] = function(unit)
	local _, _, _, _, _, _, _, source = UnitAura(unit, BEACON)
	if source then
		if source == "player" then
			return "|cffffff33M|r "
		else
			return "|cffffcc00M|r "
		end
	end
end

local BEACON_FAITH = GetSpellInfo(156910)
oUF.Tags.Events["Paladin:BeaconOfFaith"] = 'UNIT_AURA'
oUF.Tags.Methods["Paladin:BeaconOfFaith"] = function(unit)
	local _, _, _, _, _, _, _, source = UnitAura(unit, BEACON_FAITH)
	if source then
		if source == "player" then
			return "|cffffff33M|r "
		else
			return "|cffffcc00M|r "
		end
	end
end

local FORBEARANCE = GetSpellInfo(25771)
oUF.Tags.Events["Paladin:Forbearance"] = 'UNIT_AURA'
oUF.Tags.Methods["Paladin:Forbearance"] = function(unit)
	if UnitDebuff(unit, FORBEARANCE) then
		return "|cffaa0000M|r "
	end
end

--PRIEST
local RENEW = GetSpellInfo(139)
oUF.Tags.Events["Priest:Renew"] = 'UNIT_AURA'
oUF.Tags.Methods["Priest:Renew"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, RENEW)
	if source and source == "player" then
		return format("|cff33cc00%.0f|r ", expirationTime - GetTime())
	end
end

local ATONEMENT = GetSpellInfo(214206)
oUF.Tags.Events["Priest:Atonement"] = 'UNIT_AURA'
oUF.Tags.Methods["Priest:Atonement"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, ATONEMENT)
	if source and source == "player" then
		return format("|cff268ccc%.0f|r ", expirationTime - GetTime())
	end
end

local CLARITY_OF_WILL = GetSpellInfo(152118)
oUF.Tags.Events["Priest:ClarityOfWill"] = 'UNIT_AURA'
oUF.Tags.Methods["Priest:ClarityOfWill"] = function(unit)

	local _, _, _, _, _, _, expirationTime = UnitAura(unit, CLARITY_OF_WILL)
	if expirationTime then
		return format("|cff33cc00%.0f|r ", expirationTime - GetTime())
	end
end

local POWER_WORD_SHIELD = GetSpellInfo(17)
local WEAKENED_SOUL = GetSpellInfo(6788)
oUF.Tags.Events["Priest:PowerWordShield"] = 'UNIT_AURA'
oUF.Tags.Methods["Priest:PowerWordShield"] = function(unit)

	local _, _, _, _, _, _, expirationTime = UnitAura(unit, POWER_WORD_SHIELD)
	if expirationTime then
		return format("|cffffcc00%.0f|r ", expirationTime - GetTime())
	else
		local _, _, _, _, _, _, expirationTime = UnitDebuff(unit, WEAKENED_SOUL)
		if expirationTime then
			return format("|cffaa0000%.0f|r ", expirationTime - GetTime())
		end
	end
end

local PRAYER_OF_MENDING = GetSpellInfo(41635)
oUF.Tags.Events["Priest:PrayerOfMending"] = 'UNIT_AURA'
oUF.Tags.Methods["Priest:PrayerOfMending"] = function(unit)
	local _, _, _, count = UnitAura(unit, PRAYER_OF_MENDING)
	if count then
		if count > 3 then 
			return "|cff33cc00"..count.."|r "
		else
			return "|cffffcc00"..count.."|r "
		end
	end
end

--ROGUE

--SHAMAN
--[[
local RIPTIDE = GetSpellInfo(61295)
oUF.Tags.Events["Shaman:Riptide"] = 'UNIT_AURA'
oUF.Tags.Methods["Shaman:Riptide"] = function(unit)
	local _, _, _, _, _, _, expirationTime, source = UnitAura(unit, RIPTIDE)
	if source and source == "player" then
		return format("|cff0099cc%.0f|r ", expirationTime - GetTime())
	end
end
]]--
--WARLOCK

--WARRIOR

end