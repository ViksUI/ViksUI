local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	Colors
----------------------------------------------------------------------------------------
local _, ns = ...
local oUF = ns.oUF

T.oUF_colors = setmetatable({
	tapped = oUF:CreateColor(0.6, 0.6, 0.6),
	disconnected = oUF:CreateColor(0.84, 0.75, 0.65),
	power = setmetatable({
		["MANA"] = oUF:CreateColor(0.31, 0.45, 0.63),
		["RAGE"] = oUF:CreateColor(0.69, 0.31, 0.31),
		["FOCUS"] = oUF:CreateColor(0.71, 0.43, 0.27),
		["ENERGY"] = oUF:CreateColor(0.65, 0.63, 0.35),
		["POWER_TYPE_FEL_ENERGY"] = oUF:CreateColor(0.65, 0.63, 0.35),
		["RUNES"] = oUF:CreateColor(0.55, 0.57, 0.61),
		["RUNIC_POWER"] = oUF:CreateColor(0, 0.82, 1),
		["AMMOSLOT"] = oUF:CreateColor(0.8, 0.6, 0),
		["FUEL"] = oUF:CreateColor(0, 0.55, 0.5),
	}, {__index = oUF.colors.power}),
	runes = setmetatable({
		[1] = oUF:CreateColor(0.69, 0.31, 0.31),
		[2] = oUF:CreateColor(0.33, 0.59, 0.33),
		[3] = oUF:CreateColor(0.31, 0.45, 0.63),
		[4] = oUF:CreateColor(0.84, 0.75, 0.65),
	}, {__index = oUF.colors.runes}),
	reaction = setmetatable({
		[1] = oUF:CreateColor(0.85, 0.27, 0.27), -- Hated
		[2] = oUF:CreateColor(0.85, 0.27, 0.27), -- Hostile
		[3] = oUF:CreateColor(0.85, 0.27, 0.27), -- Unfriendly
		[4] = oUF:CreateColor(0.85, 0.77, 0.36), -- Neutral
		[5] = oUF:CreateColor(0.33, 0.59, 0.33), -- Friendly
		[6] = oUF:CreateColor(0.33, 0.59, 0.33), -- Honored
		[7] = oUF:CreateColor(0.33, 0.59, 0.33), -- Revered
		[8] = oUF:CreateColor(0.33, 0.59, 0.33), -- Exalted
	}, {__index = oUF.colors.reaction}),
	class = setmetatable({
		["DEATHKNIGHT"] = oUF:CreateColor(196/255,  30/255,  60/255 ),
		["DEMONHUNTER"] = oUF:CreateColor(163/255,  48/255, 201/255 ),
		["DRUID"]       = oUF:CreateColor(255/255, 125/255,  10/255 ),
		["HUNTER"]      = oUF:CreateColor(171/255, 214/255, 116/255 ),
		["MAGE"]        = oUF:CreateColor(104/255, 205/255, 255/255 ),
		["PALADIN"]     = oUF:CreateColor(245/255, 140/255, 186/255 ),
		["PRIEST"]      = oUF:CreateColor(212/255, 212/255, 212/255 ),
		["ROGUE"]       = oUF:CreateColor(255/255, 243/255,  82/255 ),
		["SHAMAN"]      = oUF:CreateColor( 41/255,  79/255, 155/255 ),
		["WARLOCK"]     = oUF:CreateColor(148/255, 130/255, 201/255 ),
		["WARRIOR"]     = oUF:CreateColor(199/255, 156/255, 110/255 ),
		["MONK"]        = oUF:CreateColor(0/255, 255/255, 150/255   ),
	}, {__index = oUF.colors.class}),
}, {__index = oUF.colors})
