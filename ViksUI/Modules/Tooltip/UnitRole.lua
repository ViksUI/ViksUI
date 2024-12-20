local T, C, L = unpack(ViksUI)
if C.tooltip.enable ~= true or C.tooltip.unit_role ~= true then return end

----------------------------------------------------------------------------------------
--	Displays a players LFD/LFR role(gTooltipRoles by g0st)
----------------------------------------------------------------------------------------
local function GetLFDRole(unit)
	local role = UnitGroupRolesAssigned(unit)

	if role == "NONE" then
		return "|cFFB5B5B5"..NO_ROLE.."|r"
	elseif role == "TANK" then
		return "|cFF0070DE"..TANK.."|r"
	elseif role == "HEALER" then
		return "|cFF00CC12"..HEALER.."|r"
	else
		return "|cFFFF3030"..DAMAGER.."|r"
	end
end

local function OnTooltipSetUnit(self)
	if self ~= GameTooltip or self:IsForbidden() then return end
	local _, instanceType = IsInInstance()
	if instanceType == "scenario" then return end
	local _, unit = GameTooltip:GetUnit()
	if unit and (UnitIsPlayer(unit) or UnitInPartyIsAI(unit)) and ((UnitInParty(unit) or UnitInRaid(unit)) and GetNumGroupMembers() > 0) then
		local leaderText = UnitIsGroupLeader(unit) and "|cfFFFFFFF - "..LEADER.."|r" or ""
		GameTooltip:AddLine(ROLE..": "..GetLFDRole(unit)..leaderText)
	end
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, OnTooltipSetUnit)