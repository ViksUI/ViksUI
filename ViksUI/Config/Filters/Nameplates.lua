local T, C, L = unpack(ViksUI)
if C.nameplate.enable ~= true then return end

----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Polymorph -> http://www.wowhead.com/spell=118
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
local function SpellName(id)
	local name = GetSpellInfo(id)
	if name then
		return name
	else
		print("|cffff0000ViksUI: Nameplates spell ID ["..tostring(id).."] no longer exists!|r")
		return "Empty"
	end
end

T.DebuffWhiteList = {
	-- Death Knight
	[SpellName(108194)] = true,	-- Asphyxiate
	[SpellName(47476)] = true,	-- Strangulate
	[SpellName(55078)] = true,	-- Blood Plague
	[SpellName(55095)] = true,	-- Frost Fever
	-- Druid
	[SpellName(33786)] = true,	-- Cyclone
	[SpellName(339)] = true,	-- Entangling Roots
	[SpellName(164812)] = true,	-- Moonfire
	[SpellName(164815)] = true,	-- Sunfire
	[SpellName(58180)] = true,	-- Infected Wounds
	[SpellName(155722)] = true,	-- Rake
	[SpellName(1079)] = true,	-- Rip
	-- Evoker
	[SpellName(360806)] = true,	-- Sleep Walk
	-- Hunter
	[SpellName(3355)] = true,	-- Freezing Trap
	[SpellName(13812)] = true,	-- Explosive Trap
	[SpellName(217200)] = true,	-- Barbed Shot
	-- Mage
	[SpellName(118)] = true,	-- Polymorph
	[SpellName(31661)] = true,	-- Dragon's Breath
	[SpellName(122)] = true,	-- Frost Nova
	[SpellName(44457)] = true,	-- Living Bomb
	[SpellName(114923)] = true,	-- Nether Tempest
	[SpellName(120)] = true,	-- Cone of Cold
	-- Monk
	[SpellName(115078)] = true,	-- Paralysis
	-- Paladin
	[SpellName(20066)] = true,	-- Repentance
	[SpellName(853)] = true,	-- Hammer of Justice
	[SpellName(183218)] = true,	-- Hand of Hindrance
	-- Priest
	[SpellName(204213)] = true,	-- Purge the Wicked
	[SpellName(9484)] = true,	-- Shackle Undead
	[SpellName(8122)] = true,	-- Psychic Scream
	[SpellName(64044)] = true,	-- Psychic Horror
	[SpellName(15487)] = true,	-- Silence
	[SpellName(589)] = true,	-- Shadow Word: Pain
	[SpellName(34914)] = true,	-- Vampiric Touch
	-- Rogue
	[SpellName(6770)] = true,	-- Sap
	[SpellName(2094)] = true,	-- Blind
	[SpellName(1776)] = true,	-- Gouge
	-- Shaman
	[SpellName(51514)] = true,	-- Hex
	[SpellName(3600)] = true,	-- Earthbind
	[SpellName(196840)] = true,	-- Frost Shock
	[SpellName(188389)] = true,	-- Flame Shock
	[SpellName(197209)] = true,	-- Lightning Rod
	-- Warlock
	[SpellName(710)] = true,	-- Banish
	[SpellName(6789)] = true,	-- Mortal Coil
	[SpellName(5782)] = true,	-- Fear
	[SpellName(5484)] = true,	-- Howl of Terror
	[SpellName(6358)] = true,	-- Seduction
	[SpellName(30283)] = true,	-- Shadowfury
	[SpellName(603)] = true,	-- Doom
	[SpellName(980)] = true,	-- Agony
	[SpellName(146739)] = true,	-- Corruption
	[SpellName(48181)] = true,	-- Haunt
	[SpellName(348)] = true,	-- Immolate
	[SpellName(30108)] = true,	-- Unstable Affliction
	-- Warrior
	[SpellName(5246)] = true,	-- Intimidating Shout
	[SpellName(132168)] = true,	-- Shockwave
	[SpellName(115767)] = true,	-- Deep Wounds
	-- Racial
	[SpellName(20549)] = true,	-- War Stomp (Tauren)
	[SpellName(107079)] = true,	-- Quaking Palm (Pandaren)
}

for _, spell in pairs(C.nameplate.debuffs_list) do
	T.DebuffWhiteList[SpellName(spell)] = true
end

T.DebuffBlackList = {
	-- [SpellName(spellID)] = true,	-- Spell Name
}

for _, spell in pairs(C.nameplate.ignore_list) do
	T.DebuffBlackList[SpellName(spell)] = true
end

T.BuffWhiteList = {
	-- [SpellName(226510)] = true,	-- Sanguine Ichor
}

for _, spell in pairs(C.nameplate.buffs_list) do
	T.BuffWhiteList[SpellName(spell)] = true
end

T.BuffBlackList = {
	-- [SpellName(spellID)] = true,	-- Spell Name
}

T.PlateBlacklist = {
	["24207"] = true,	-- Army of the Dead
	["29630"] = true,	-- Fanged Pit Viper (Gundrak)
	["55659"] = true,	-- Wild Imp
	["167966"] = true,	-- Experimental Sludge (De Other Side)
}

T.InterruptCast = { -- Yellow border for interruptible cast
	-- The War Within Season 1
	[461904] = true,	-- Cosmic Ascension
	[462508] = true,	-- Dark Prayer
	-- Algeth'ar Academy
	[396812] = true,	-- Mystic Blast
	[332612] = true,	-- Healing Touch
	[377389] = true,	-- Call of the Flock
	[387843] = true,	-- Astral Bomb
	-- The Azure Vault
	[370225] = true,	-- Shriek
	-- The Nokhud Offensive
	[386024] = true,	-- Tempest
	[373395] = true,	-- Bloodcurdling Shout
	-- Halls of Valor
	[215433] = true,	-- Holy Radiance
	-- Shadowmoon Burial Grounds
	[152818] = true,	-- Shadow Mend
	-- Temple of the Jade Serpent
	[395859] = true,	-- Haunting Scream
}

T.ImportantCast = { -- Red border for non-interruptible cast
	-- The Nokhud Offensive
	[383823] = true,	-- Rally the Clan
	-- Ruby Life Pools
	[372743] = true,	-- Ice Shield
	-- Court of Stars
	[210261] = true,	-- Sound Alarm
}

for _, spell in pairs(C.nameplate.cast_color_list) do
	T.InterruptCast[spell] = true
end

local color = C.nameplate.mob_color
local color_alt = {0, 0.7, 0.6}
T.ColorPlate = {
	-- Algeth'ar Academy
	["196548"] = color,		-- Ancient Branch
	-- The Azure Vault
	["187159"] = color_alt,	-- Shrieking Whelp
	-- The Nokhud Offensive
	["194894"] = color,		-- Primalist Stormspeaker
	-- Temple of the Jade Serpent
	["59555"] = color,		-- Haunting Sha
	["59545"] = color,		-- The Golden Beetle
	-- Court of Stars
	["104251"] = color_alt,	-- Duskwatch Sentry
	-- PvP
	["5925"] = color,		-- Grounding Totem
}

for word in gmatch(C.nameplate.mob_color_list, "%S+") do
	T.ColorPlate[tostring(word)] = color
end

T.ShortNames = {
	-- Академия Алгет'ар
	["Рассерженная стрекотуха"] = "Cтрекотуха",
	["Мерзкий плеточник"] = "Плеточник",
	["Алгет'арский охранник"] = "Охранник",
	["Алгет'арский рыцарь эха"] = "Рыцарь",
	["Алгет'арская заклинательница"] = "Заклинательница",
	["Алгет'арский целитель"] = "Целитель",
	-- Наступление клана Нокхуд
	["Мастер копья из клана Нокхуд"] = "Мастер копья",
	["Лучница из клана Нокхуд"] = "Лучница",
	["Боевое копье клана Нокхуд"] = "Копье",
	["Трубач из клана Нокхуд"] = "Трубач",
	["Нокхудский копейщик"] = "Копейщик",
	["Громовой кулак из клана Нокхуд"] = "Кулак",
	["Псарь из клана Нокхуд"] = "Псарь",
	["Заступник из клана Нокхуд"] = "Заступник",
	-- Квартал Звезд
	["Караульный из Сумеречной стражи"] = "Караульный",
	["Часовой из Сумеречной стражи"] = "Часовой",
	["Бдительный инквизитор"] = "Инквизитор",
	["Пылающий бес"] = "Бес",
	["Порабощенная Скверной карательница"] = "Карательница",
}