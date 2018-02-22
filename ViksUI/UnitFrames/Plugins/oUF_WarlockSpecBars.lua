local _, ns = ...
local oUF = ns.oUF or oUF
assert(oUF, "oUF_WarlockSpecBars was unable to locate oUF install")

if select(2, UnitClass("player")) ~= "WARLOCK" then return end

local SPELL_POWER_SOUL_SHARDS = SPELL_POWER_SOUL_SHARDS

local Colors = {
	[1] = {111/255, 114/255, 195/255, 1},
	[2] = {119/255, 103/255, 198/255, 1},
	[3] = {125/255, 95/255, 195/255, 1},
	[4] = {132/255, 86/255, 193/255, 1},
	[5] = {209/255, 51/255, 188/255, 1},
}

local Update = function(self, event, unit, powerType)
	if(self.unit ~= unit or (powerType and powerType  ~= "SOUL_SHARDS")) then return end

	local wsb = self.SoulShards
	local numShards = UnitPower("player", SPELL_POWER_SOUL_SHARDS)
	local maxShards = UnitPowerMax("player", SPELL_POWER_SOUL_SHARDS)

	if (wsb.PreUpdate) then
		wsb:PreUpdate(numShards)
	end

	for i = 1, maxShards do
		if i <= numShards then
			wsb[i]:SetAlpha(1)
		else
			wsb[i]:SetAlpha(.3)
		end
	end

	if (wsb.PostUpdate) then
		return wsb:PostUpdate(numShards)
	end
end

local Path = function(self, ...)
	return (self.SoulShards.Override or Update) (self, ...)
end

local ForceUpdate = function(element)
	return Path(element.__owner, "ForceUpdate", element.__owner.unit, "SOUL_SHARDS")
end

local function Enable(self)
	local wsb = self.SoulShards
	if(wsb) then
		wsb.__owner = self
		wsb.ForceUpdate = ForceUpdate

		self:RegisterEvent("UNIT_POWER", Path)
		self:RegisterEvent("UNIT_DISPLAYPOWER", Path)

		for i = 1, 5 do
			local Point = wsb[i]
			if not Point:GetStatusBarTexture() then
				Point:SetStatusBarTexture([=[Interface\TargetingFrame\UI-StatusBar]=])
			end

			Point:SetFrameLevel(wsb:GetFrameLevel() + 1)
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
	local wsb = self.SoulShards
	if(wsb) then
		self:UnregisterEvent("UNIT_POWER", Path)
		self:UnregisterEvent("UNIT_DISPLAYPOWER", Path)
	end
end

oUF:AddElement("SoulShards", Path, Enable, Disable)