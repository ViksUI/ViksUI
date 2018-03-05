local parent, ns = ...
local oUF = ns.oUF
local class = select(2, UnitClass('player'))

if not (class == "ROGUE" or class == "DRUID") then return end

local GetComboPoints = GetComboPoints
local MAX_COMBO_POINTS = MAX_COMBO_POINTS

local Colors = {
    [1] = {.69, .31, .31, 1},
    [2] = {.65, .42, .31, 1},
    [3] = {.65, .63, .35, 1},
    [4] = {.46, .63, .35, 1},
    [5] = {.33, .63, .33, 1},
    [6] = {.33, .63, .33, 1},
    [7] = {.33, .63, .33, 1},
    [8] = {.33, .63, .33, 1},
}

local Update = function(self, event, unit)
	if powerType and powerType ~= 'COMBO_POINTS' then return end
	if(unit == 'pet') then return end

	local cpoints = self.CPoints
	if(cpoints.PreUpdate) then
		cpoints:PreUpdate()
	end

	local cp
	if(UnitHasVehicleUI'player') then
		cp = GetComboPoints('vehicle', 'target')
	else
		cp = GetComboPoints('player', 'target')
	end

	for i = 1, MAX_COMBO_POINTS do
		if(i <= cp) then
			cpoints[i]:Show()
		else
			cpoints[i]:Hide()
		end
	end
end

local Path = function(self, ...)
	return (self.CPoints.Override or Update) (self, ...)
end

local ForceUpdate = function(element)
	return Path(element.__owner, 'ForceUpdate', element.__owner.unit)
end

local Enable = function(self)
	local cpoints = self.CPoints
	if(cpoints) then
		cpoints.__owner = self
		cpoints.ForceUpdate = ForceUpdate

		self:RegisterEvent('UNIT_POWER', Path, true)
		self:RegisterEvent('UNIT_MAXPOWER', Path, true)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', Path)

		for index = 1, MAX_COMBO_POINTS do
			local cpoint = cpoints[index]
			if(cpoint:IsObjectType'Texture' and not cpoint:GetTexture()) then
				cpoint:SetTexture[[Interface\ComboFrame\ComboPoint]]
				cpoint:SetTexCoord(0, 0.375, 0, 1)
			end
		end

		return true
	end
end

local Disable = function(self)
	local cpoints = self.CPoints
	if(cpoints) then
		self:UnregisterEvent('UNIT_POWER', Path)
		self:UnregisterEvent('UNIT_MAXPOWER', Path)
		self:UnregisterEvent('PLAYER_TARGET_CHANGED', Path)
	end
end

oUF:AddElement('CPoints', Path, Enable, Disable)