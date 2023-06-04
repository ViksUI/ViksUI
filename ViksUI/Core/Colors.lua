local T, C, L = unpack(ViksUI)

local Framework = select(2, ...)
local oUF = oUF or Framework.oUF
local Class = select(2, UnitClass("player"))

oUF.colors.disconnected = {
	0.1, 0.1, 0.1
}

oUF.colors.runes = {
	[1] = {176/255, 79/255, 79/255},
	[2] = {105/255, 204/255, 255/255},
	[3] = {148/255, 204/255, 35/255},
	[5] = {0.55, 0.57, 0.61}, -- unspec, new char
}

oUF.colors.reaction = {
	[1] = { 0.87, 0.37, 0.37 }, -- Hated
	[2] = { 0.87, 0.37, 0.37 }, -- Hostile
	[3] = { 0.87, 0.37, 0.37 }, -- Unfriendly
	[4] = { 0.85, 0.77, 0.36 }, -- Neutral
	[5] = { 0.29, 0.67, 0.30 }, -- Friendly
	[6] = { 0.29, 0.67, 0.30 }, -- Honored
	[7] = { 0.29, 0.67, 0.30 }, -- Revered
	[8] = { 0.29, 0.67, 0.30 }, -- Exalted
}

oUF.colors.power = {
	["MANA"]              = {0.31, 0.45, 0.63},
	["INSANITY"]          = {0.40, 0.00, 0.80},
	["MAELSTROM"]         = {0.00, 0.50, 1.00},
	["LUNAR_POWER"]       = {0.93, 0.51, 0.93},
	["HOLY_POWER"]        = {228/255, 205/255, 43/255},
	["ARCANE_CHARGES"]    = { 0/255, 184/255, 242/255 },
	["RAGE"]              = {0.69, 0.31, 0.31},
	["FOCUS"]             = {0.71, 0.43, 0.27},
	["ENERGY"]            = {0.65, 0.63, 0.35},
	["CHI"]               = {0.71, 1.00, 0.92},
	["RUNES"]             = { 220/255, 50/255, 50/255 },
	["SOUL_SHARDS"]       = {0.50, 0.32, 0.55},
	["FURY"]              = {0.78, 0.26, 0.99},
	["PAIN"]              = {1.00, 0.61, 0.00},
	["RUNIC_POWER"]       = {0.00, 0.82, 1.00},
	["AMMOSLOT"]          = {0.80, 0.60, 0.00},
	["FUEL"]              = {0.00, 0.55, 0.50},
	["POWER_TYPE_STEAM"]  = {0.55, 0.57, 0.61},
	["POWER_TYPE_PYRITE"] = {0.60, 0.09, 0.17},
	["ALTPOWER"]          = {0.00, 1.00, 1.00},
	["ANIMA"]             = {0.83, 0.83, 0.83},
}

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

oUF.colors.totems = {
	[1] = oUF.colors.class[Class], -- Totem 1
	[2] = oUF.colors.class[Class], -- Totem 2
	[3] = oUF.colors.class[Class], -- Totem 3
	[4] = oUF.colors.class[Class], -- Totem 4
}

T["Colors"] = oUF.colors
