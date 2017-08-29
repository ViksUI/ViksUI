local _, ns = ...
local cfg = ns.cfg
local oUF = ns.oUF or oUF

if not cfg.showRaid or not cfg.RaidDebuffs then return end

local addon = {}
ns.oUF_RaidDebuffs = addon
if not _G.oUF_RaidDebuffs then
	_G.oUF_RaidDebuffs = addon
end

local debuff_data = {}
addon.DebuffData = debuff_data


addon.ShowDispelableDebuff = true
addon.FilterDispellableDebuff = true
addon.MatchBySpellName = true

addon.priority = 10

local function add(spell)
	if addon.MatchBySpellName and type(spell) == 'number' then
		spell = GetSpellInfo(spell)
	end
	debuff_data[spell] = addon.priority
	addon.priority = addon.priority + 1
end

function addon:RegisterDebuffs(t)
	for _, v in next, t do
		add(v)
	end
end

function addon:ResetDebuffData()
	wipe(debuff_data)
	addon.priority = 10
end


local DispellColor = {
	['Magic']	= {.2, .6, 1},
	['Curse']	= {.6, 0, 1},
	['Disease']	= {.6, .4, 0},
	['Poison']	= {0, .6, 0},
	['none'] = {1, 0, 0},
}

local DispellPriority = {
	['Magic']	= 4,
	['Curse']	= 3,
	['Disease']	= 2,
	['Poison']	= 1,
}

local DispellFilter
do
	local dispellClasses = {
		["DRUID"] = {
			["Magic"] = false,
			["Curse"] = true,
			["Poison"] = true,
		},
		["MAGE"] = {
			["Curse"] = true,
		},
		["MONK"] = {
			["Magic"] = false,
			["Poison"] = true,
			["Disease"] = true,
		},
		["PALADIN"] = {
			["Magic"] = false,
			["Poison"] = true,
			["Disease"] = true,
		},
		["PRIEST"] = {
			["Magic"] = true,
			["Disease"] = true,
		},
		["SHAMAN"] = {
			["Magic"] = false,
			["Curse"] = true,
		},
	}

	DispellFilter = dispellClasses[select(2, UnitClass("player"))] or {}
end

local function Spec(self, event)
	-- Check spec to see if we can dispel magic or not
	if select(2, UnitClass("player")) == "DRUID" then
		if CheckSpec(4) then
			DispellFilter.Magic = true
		else
			DispellFilter.Magic = false
		end
	elseif select(2, UnitClass("player")) == "MONK" then
		if CheckSpec(2) then
			DispellFilter.Magic = true
		else
			DispellFilter.Magic = false
		end
	elseif select(2, UnitClass("player")) == "PALADIN" then
		if CheckSpec(1) then
			DispellFilter.Magic = true
		else
			DispellFilter.Magic = false
		end
	elseif select(2, UnitClass("player")) == "SHAMAN" then
		if CheckSpec(3) then
			DispellFilter.Magic = true
		else
			DispellFilter.Magic = false
		end
	elseif select(2, UnitClass("player")) == "PRIEST" then
		if CheckSpec(3) then
			DispellFilter.Disease = false
			DispellFilter.Magic = false
		else
			DispellFilter.Disease = true
			DispellFilter.Magic = true
		end
	end
end

local function formatTime(s)
	if s > 60 then
		return format('%dm', s/60), s%60
	else
		return format('%d', s), s - floor(s)
	end
end

local function OnUpdate(self, elps)
	self.nextUpdate = self.nextUpdate - elps
	if self.nextUpdate > 0 then return end
	
	local timeLeft = self.endTime - GetTime()
	if timeLeft > 0 then
		local text, nextUpdate = formatTime(timeLeft)
		self.time:SetText(text)
		self.nextUpdate = nextUpdate
	else
		self:SetScript('OnUpdate', nil)
		self.time:Hide()
	end
end

local function UpdateDebuff(self, name, icon, count, debuffType, duration, endTime)
	local f = self.RaidDebuffs
	if name then
		f.icon:SetTexture(icon)
		f.icon:Show()
		
		if f.count then
			if count and (count > 0) then
				f.count:SetText(count)
				f.count:Show()
			else
				f.count:Hide()
			end
		end
		
		if f.time then
			if duration and (duration > 0) then
				f.endTime = endTime
				f.nextUpdate = 0
				f:SetScript('OnUpdate', OnUpdate)
				f.time:Show()
			else
				f:SetScript('OnUpdate', nil)
				f.time:Hide()
			end
		end
		
		if f.cd then
			if duration and (duration > 0) then
				f.cd:SetCooldown(endTime - duration, duration)
				f.cd:Show()
			else
				f.cd:Hide()
			end
		end
		
		local c = DispellColor[debuffType] or DispellColor.none
		f:SetBackdropColor(c[1], c[2], c[3])
		
		f:Show()
	else
		f:Hide()
	end
end

local function Update(self, event, unit)
	if unit ~= self.unit then return end
	local _name, _icon, _count, _dtype, _duration, _endTime
	local _priority, priority = 0
	for i = 1, 40 do
		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitAura(unit, i, 'HARMFUL')
		if (not name) then break end
		
		if addon.ShowDispelableDebuff and debuffType then
			if addon.FilterDispellableDebuff then
				DispellPriority[debuffType] = DispellPriority[debuffType] + addon.priority 
				priority = DispellFilter[debuffType] and DispellPriority[debuffType]
			else
				priority = DispellPriority[debuffType]
			end
			
			if priority and (priority > _priority) then
				_priority, _name, _icon, _count, _dtype, _duration, _endTime = priority, name, icon, count, debuffType, duration, expirationTime
			end
		end
		
		priority = debuff_data[addon.MatchBySpellName and name or spellId]
		if priority and (priority > _priority) then
			_priority, _name, _icon, _count, _dtype, _duration, _endTime = priority, name, icon, count, debuffType, duration, expirationTime
		end
	end
	
	UpdateDebuff(self, _name, _icon, _count, _dtype, _duration, _endTime)
end

local function Enable(self)
	if self.RaidDebuffs then
		self:RegisterEvent('UNIT_AURA', Update)
		return true
	end
	self:RegisterEvent("PLAYER_ENTERING_WORLD", Spec)
	self:RegisterEvent("PLAYER_TALENT_UPDATE", Spec)
end

local function Disable(self)
	if self.RaidDebuffs then
		self:UnregisterEvent('UNIT_AURA', Update)
		self.RaidDebuffs:Hide()
	end
	self:UnregisterEvent("PLAYER_TALENT_UPDATE", Spec)
end

oUF:AddElement('RaidDebuffs', Update, Enable, Disable)