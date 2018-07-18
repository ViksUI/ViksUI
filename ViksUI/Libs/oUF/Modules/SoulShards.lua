
if(select(2, UnitClass('player')) ~= 'WARLOCK') then return end

local parent, ns = ...
local oUF = ns.oUF

local SPELL_POWER_SOUL_SHARDS = Enum.PowerType.SoulShards or 7

local Colors = {
	[1] = {111/255, 114/255, 195/255, 1},
	[2] = {119/255, 103/255, 198/255, 1},
	[3] = {125/255, 95/255, 195/255, 1},
	[4] = {132/255, 86/255, 193/255, 1},
	[5] = {209/255, 51/255, 188/255, 1},
}

local function Update(self, event, unit, powerType)
	if(self.unit ~= unit or (powerType and powerType ~= 'SOUL_SHARDS')) then return end

	local ss = self.SoulShards

	if(ss.PreUpdate) then
		ss:PreUpdate(unit)
	end

	local cur = UnitPower('player', SPELL_POWER_SOUL_SHARDS)
	local max = UnitPowerMax("player", SPELL_POWER_SOUL_SHARDS)

	for i = 1, max do
		if i <= cur then
			ss[i]:SetAlpha(1)
		else
			ss[i]:SetAlpha(0.2)
		end
	end

	if(ss.PostUpdate) then
		return ss:PostUpdate(cur)
	end
end

local Path = function(self, ...)
	return (self.SoulShards.Override or Update) (self, ...)
end

local ForceUpdate = function(element)
	return Path(element.__owner, 'ForceUpdate', element.__owner.unit, 'SOUL_SHARDS')
end

local function Enable(self, unit)
	local ss = self.SoulShards
	if(ss) and unit == 'player' then
		ss.__owner = self
		ss.ForceUpdate = ForceUpdate


		self:RegisterEvent('UNIT_POWER_UPDATE', Path)
		self:RegisterEvent('UNIT_DISPLAYPOWER', Path)

		for i = 1, 5 do
			local Point = ss[i]
			if not Point:GetStatusBarTexture() then
				Point:SetStatusBarTexture([=[Interface\TargetingFrame\UI-StatusBar]=])
			end

			Point:SetFrameLevel(ss:GetFrameLevel() + 1)
			Point:GetStatusBarTexture():SetHorizTile(false)
			Point:SetStatusBarColor(unpack(Colors[i]))



			if Point.bg then
				Point.bg:SetAllPoints()
			end
		end

		return true
	end
end

local function Disable(self)
	local ss = self.SoulShards
	if(ss) then
		self:UnregisterEvent('UNIT_POWER_UPDATE', Path)
		self:UnregisterEvent('UNIT_DISPLAYPOWER', Path)
	end
end

oUF:AddElement('SoulShards', Path, Enable, Disable)