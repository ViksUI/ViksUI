local T, C, L = unpack(ViksUI)

----------------------------------------------------------------------------------------
--	Colors
----------------------------------------------------------------------------------------
local _, ns = ...
local oUF = ns.oUF
local Class = select(2, UnitClass("player"))

T.oUF_colors = setmetatable({
	tapped = oUF:CreateColor(0.6, 0.6, 0.6),
	disconnected = oUF:CreateColor(0.84, 0.75, 0.65),
	power = setmetatable({
		["MANA"]              = oUF:CreateColor(0.31, 0.45, 0.63),
		["INSANITY"]          = oUF:CreateColor(0.40, 0.00, 0.80),
		["MAELSTROM"]         = oUF:CreateColor(0.00, 0.50, 1.00),
		["LUNAR_POWER"]       = oUF:CreateColor(0.93, 0.51, 0.93),
		["HOLY_POWER"]        = oUF:CreateColor(228/255, 205/255, 43/255),
		["ARCANE_CHARGES"]    = oUF:CreateColor( 0/255, 184/255, 242/255 ),
		["RAGE"]              = oUF:CreateColor(0.69, 0.31, 0.31),
		["FOCUS"]             = oUF:CreateColor(0.71, 0.43, 0.27),
		["ENERGY"]            = oUF:CreateColor(0.65, 0.63, 0.35),
		["POWER_TYPE_FEL_ENERGY"] = oUF:CreateColor(0.65, 0.63, 0.35),
		["CHI"]               = oUF:CreateColor(0.71, 1.00, 0.92),
		["RUNES"]             = oUF:CreateColor( 220/255, 50/255, 50/255 ),
		["SOUL_SHARDS"]       = oUF:CreateColor(0.50, 0.32, 0.55),
		["FURY"]              = oUF:CreateColor(0.78, 0.26, 0.99),
		["PAIN"]              = oUF:CreateColor(1.00, 0.61, 0.00),
		["RUNIC_POWER"]       = oUF:CreateColor(0.00, 0.82, 1.00),
		["AMMOSLOT"]          = oUF:CreateColor(0.80, 0.60, 0.00),
		["FUEL"]              = oUF:CreateColor(0.00, 0.55, 0.50),
		["POWER_TYPE_STEAM"]  = oUF:CreateColor(0.55, 0.57, 0.61),
		["POWER_TYPE_PYRITE"] = oUF:CreateColor(0.60, 0.09, 0.17),
		["ALTPOWER"]          = oUF:CreateColor(0.00, 1.00, 1.00),
		["ANIMA"]             = oUF:CreateColor(0.83, 0.83, 0.83),
	}, {__index = oUF.colors.power}),
	runes = setmetatable({
		[1] = oUF:CreateColor(176/255, 79/255, 79/255),
		[2] = oUF:CreateColor(105/255, 204/255, 255/255),
		[3] = oUF:CreateColor(148/255, 204/255, 35/255),
		[5] = oUF:CreateColor(0.55, 0.57, 0.61), -- unspec, new char
	}, {__index = oUF.colors.runes}),
	reaction = setmetatable({
		[1] = oUF:CreateColor( 0.87, 0.37, 0.37 ), -- Hated
		[2] = oUF:CreateColor( 0.87, 0.37, 0.37 ), -- Hostile
		[3] = oUF:CreateColor( 0.87, 0.37, 0.37 ), -- Unfriendly
		[4] = oUF:CreateColor( 0.85, 0.77, 0.36 ), -- Neutral
		[5] = oUF:CreateColor( 0.29, 0.67, 0.30 ), -- Friendly
		[6] = oUF:CreateColor( 0.29, 0.67, 0.30 ), -- Honored
		[7] = oUF:CreateColor( 0.29, 0.67, 0.30 ), -- Revered
		[8] = oUF:CreateColor( 0.29, 0.67, 0.30 ), -- Exalted
	}, {__index = oUF.colors.reaction}),
	class = setmetatable({
		["DEATHKNIGHT"] = oUF:CreateColor(180/255, 10/255, 51/255),
		["DRUID"]       = oUF:CreateColor(240/255, 119/255, 13/255),
		["HUNTER"]      = oUF:CreateColor(139/255, 192/255, 67/255),
		["MAGE"]        = oUF:CreateColor(105/255, 204/255, 242/255),
		["PALADIN"]     = oUF:CreateColor(225/255, 129/255, 172/255),
		["PRIEST"]      = oUF:CreateColor(244/255, 244/255, 244/255),
		["ROGUE"]       = oUF:CreateColor(243/255, 233/255, 99/255),
		["SHAMAN"]      = oUF:CreateColor(47/255, 91/255, 179/255),
		["WARLOCK"]     = oUF:CreateColor(148/255, 130/255, 201/255),
		["WARRIOR"]     = oUF:CreateColor(188/255, 144/255, 81/255),
		["MONK"]        = oUF:CreateColor(0/255, 255/255, 150/255),
		["DEMONHUNTER"] = oUF:CreateColor(150/255, 39/255, 149/255),
		["EVOKER"] 		= oUF:CreateColor(18/255, 102/255, 117/255),
	}, {__index = oUF.colors.class}),
}, {__index = oUF.colors})

oUF.colors.class = {
	["DEATHKNIGHT"] = { 180/255, 10/255, 51/255 },
	["DRUID"]       = { 240/255, 119/255, 13/255 },
	["HUNTER"]      = { 139/255, 192/255, 67/255 },
	["MAGE"]        = { 105/255, 204/255, 242/255 },
	["PALADIN"]     = { 225/255, 129/255, 172/255 },
	["PRIEST"]      = { 244/255, 244/255, 244/255 },
	["ROGUE"]       = { 243/255, 233/255, 99/255 },
	["SHAMAN"]      = { 47/255, 91/255, 179/255 },
	["WARLOCK"]     = { 148/255, 130/255, 201/255 },
	["WARRIOR"]     = { 188/255, 144/255, 81/255 },
	["MONK"]        = { 0/255, 255/255, 150/255 },
	["DEMONHUNTER"] = { 150/255, 39/255, 149/255 },
	["EVOKER"] 		= { 18/255, 102/255, 117/255 },
}

T["Colors"] = oUF.colors