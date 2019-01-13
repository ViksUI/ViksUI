
if(select(2, UnitClass("player")) ~= "WARLOCK") then return end

local _, ns = ...
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
	if(self.unit ~= unit or (powerType and powerType ~= "SOUL_SHARDS")) then return end

	local element = self.SoulShards

	if(element.PreUpdate) then
		element:PreUpdate(unit)
	end

	local cur = UnitPower("player", SPELL_POWER_SOUL_SHARDS)
	local max = UnitPowerMax("player", SPELL_POWER_SOUL_SHARDS)

	for i = 1, max do
		if i <= cur then
			element[i]:SetAlpha(1)
		else
			element[i]:SetAlpha(0.2)
		end
	end

	if(element.PostUpdate) then
		return element:PostUpdate(cur)
	end
end

local function Path(self, ...)
	return (self.SoulShards.Override or Update) (self, ...)
end

local function ForceUpdate(element)
	return Path(element.__owner, "ForceUpdate", element.__owner.unit, "SOUL_SHARDS")
end

local function Enable(self, unit)
	local element = self.SoulShards
	if(element) and unit == "player" then
		element.__owner = self
		element.ForceUpdate = ForceUpdate

		self:RegisterEvent("UNIT_POWER_UPDATE", Path)
		self:RegisterEvent("UNIT_DISPLAYPOWER", Path)

		for i = 1, 5 do
			local Point = element[i]
			if not Point:GetStatusBarTexture() then
				Point:SetStatusBarTexture([=[Interface\TargetingFrame\UI-StatusBar]=])
			end

			Point:SetFrameLevel(element:GetFrameLevel() + 1)
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
	local element = self.SoulShards
	if(element) then
		self:UnregisterEvent("UNIT_POWER_UPDATE", Path)
		self:UnregisterEvent("UNIT_DISPLAYPOWER", Path)
	end
end

oUF:AddElement("SoulShards", Path, Enable, Disable)