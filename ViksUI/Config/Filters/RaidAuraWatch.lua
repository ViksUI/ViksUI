local T, C, L, _ = unpack(select(2, ...))
if C.unitframe.plugins_aura_watch ~= true then return end

----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Renew -> http://www.wowhead.com/spell=139
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
T.RaidBuffs = {
	DRUID = {
		{774, "TOPRIGHT", {0.8, 0.4, 0.8}},					-- Rejuvenation
		{8936, "BOTTOMLEFT", {0.2, 0.8, 0.2}},				-- Regrowth
		{33763, "TOPLEFT", {0.4, 0.8, 0.2}},				-- Lifebloom
		{48438, "BOTTOMRIGHT", {0.8, 0.4, 0}},				-- Wild Growth
		{102342, "LEFT", {0.45, 0.3, 0.2}, true},			-- Ironbark
		{155777, "RIGHT", {0.4, 0.9, 0.4}},					-- Rejuvenation (Germination)
	},
	MONK = {
		{119611, "TOPRIGHT", {0.2, 0.7, 0.7}},				-- Renewing Mist
		{124682, "BOTTOMLEFT", {0.4, 0.8, 0.2}},			-- Enveloping Mist
		{115175, "BOTTOMRIGHT", {0.7, 0.4, 0}},				-- Soothing Mist
		{191840, "TOPLEFT", {0.1, 0.4, 0.9}},				-- Essence Font
		{116849, "LEFT", {0.81, 0.85, 0.1}, true},			-- Life Cocoon
	},
	PALADIN = {
		{53563, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Beacon of Light
		{156910, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Beacon of Faith
		{200025, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Beacon of Virtue
		{1022, "BOTTOMRIGHT", {0.2, 0.2, 1}, true},			-- Blessing of Protection
		{1044, "BOTTOMRIGHT", {0.89, 0.45, 0}, true},		-- Blessing of Freedom
		{204013, "BOTTOMRIGHT", {0.93, 0.75, 0}, true},		-- Blessing of Salvation
		{6940, "BOTTOMRIGHT", {0.89, 0.1, 0.1}, true},		-- Blessing of Sacrifice
		{204018, "BOTTOMRIGHT", {0.4, 0.6, 0.8}, true},		-- Blessing of Spellwarding
		{287280, "BOTTOMLEFT", {0.9, 0.5, 0.1}},			-- Glimmer of Light
	},
	PRIEST = {
		{194384, "TOPRIGHT", {0.8, 0.4, 0.2}},				-- Atonement
		{41635, "BOTTOMRIGHT", {0.2, 0.7, 0.2}},			-- Prayer of Mending
		{139, "BOTTOMLEFT", {0.4, 0.7, 0.2}}, 				-- Renew
		{6788, "BOTTOMLEFT", {1, 0, 0}, true}, 				-- Weakened Soul
		{17, "TOPLEFT", {0.81, 0.85, 0.1}, true},			-- Power Word: Shield
		{33206, "LEFT", {0.89, 0.1, 0.1}, true},			-- Pain Suppression
		{47788, "LEFT", {0.86, 0.52, 0}, true},				-- Guardian Spirit
	},
	SHAMAN = {
		{61295, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Riptide
		{204288, "BOTTOMRIGHT", {0.2, 0.7, 0.2}, true},		-- Earth Shield
	},
	HUNTER = {
		{35079, "TOPRIGHT", {0.2, 0.2, 1}},					-- Misdirection
	},
	ROGUE = {
		{57934, "TOPRIGHT", {0.89, 0.1, 0.1}},				-- Tricks of the Trade
	},
	WARLOCK = {
		{20707, "TOPRIGHT", {0.7, 0.32, 0.75}},				-- Soulstone
	},
	WARRIOR = {
		{114030, "TOPLEFT", {0.2, 0.2, 1}},					-- Vigilance
	},
	ALL = {
		{23333, "LEFT", {1, 0, 0}, true}, 					-- Warsong flag, Horde
		{23335, "LEFT", {0, 0, 1}, true},					-- Warsong flag, Alliance
		{34976, "LEFT", {1, 0, 0}, true}, 					-- Netherstorm Flag
	},
}

T.RaidBuffsIgnore = {
	--[spellID] = true,			-- Spell name
}

local function SpellName(id)
	local name = GetSpellInfo(id)
	if name then
		return name
	else
		print("|cffff0000WARNING: spell ID ["..tostring(id).."] no longer exists in RaidAurawatch! Report this to Viks.|r")
		return "Empty"
	end
end

T.RaidDebuffs = {
-----------------------------------------------------------------
-- SHADOWLAND (Todo: Ajust value/priority)
-----------------------------------------------------------------
	-- Mythic+ General
	[SpellName(209859)] = 3, -- Bolster
	[SpellName(178658)] = 3, -- Raging
	[SpellName(226510)] = 3, -- Sanguine
	-- Mythic+ Shadowlands Season 1
	[SpellName(343502)] = 3, -- Inspiring
	[SpellName(342332)] = 3, -- Bursting With Pride (Prideful)
	[SpellName(340880)] = 3, -- Prideful
		-- Mythic+ Dungeons
	-- General Affix
	[SpellName(209858)] = 3, -- Necrotic
	[SpellName(226512)] = 3, -- Sanguine
	[SpellName(240559)] = 3, -- Grievous
	[SpellName(240443)] = 3, -- Bursting
	-- Shadowlands Affix
	[SpellName(342494)] = 3, -- Belligerent Boast (Prideful)

-- Shadowlands Dungeons
	-- Halls of Atonement
	[SpellName(335338)] = 3, -- Ritual of Woe
	[SpellName(326891)] = 3, -- Anguish
	[SpellName(329321)] = 3, -- Jagged Swipe 1
	[SpellName(344993)] = 3, -- Jagged Swipe 2
	[SpellName(319603)] = 3, -- Curse of Stone
	[SpellName(319611)] = 3, -- Turned to Stone
	[SpellName(325876)] = 3, -- Curse of Obliteration
	[SpellName(326632)] = 3, -- Stony Veins
	[SpellName(323650)] = 3, -- Haunting Fixation
	[SpellName(326874)] = 3, -- Ankle Bites
	[SpellName(340446)] = 3, -- Mark of Envy
	-- Mists of Tirna Scithe
	[SpellName(325027)] = 3, -- Bramble Burst
	[SpellName(323043)] = 3, -- Bloodletting
	[SpellName(322557)] = 3, -- Soul Split
	[SpellName(331172)] = 3, -- Mind Link
	[SpellName(322563)] = 3, -- Marked Prey
	[SpellName(322487)] = 3, -- Overgrowth 1
	[SpellName(322486)] = 3, -- Overgrowth 2
	[SpellName(328756)] = 3, -- Repulsive Visage
	[SpellName(325021)] = 3, -- Mistveil Tear
	[SpellName(321891)] = 3, -- Freeze Tag Fixation
	[SpellName(325224)] = 3, -- Anima Injection
	[SpellName(326092)] = 3, -- Debilitating Poison
	[SpellName(325418)] = 3, -- Volatile Acid
	-- Plaguefall
	[SpellName(336258)] = 3, -- Solitary Prey
	[SpellName(331818)] = 3, -- Shadow Ambush
	[SpellName(329110)] = 3, -- Slime Injection
	[SpellName(325552)] = 3, -- Cytotoxic Slash
	[SpellName(336301)] = 3, -- Web Wrap
	[SpellName(322358)] = 3, -- Burning Strain
	[SpellName(322410)] = 3, -- Withering Filth
	[SpellName(328180)] = 3, -- Gripping Infection
	[SpellName(320542)] = 3, -- Wasting Blight
	[SpellName(340355)] = 3, -- Rapid Infection
	[SpellName(328395)] = 3, -- Venompiercer
	[SpellName(320512)] = 3, -- Corroded Claws
	[SpellName(333406)] = 3, -- Assassinate
	[SpellName(332397)] = 3, -- Shroudweb
	[SpellName(330069)] = 3, -- Concentrated Plague
	-- The Necrotic Wake
	[SpellName(321821)] = 3, -- Disgusting Guts
	[SpellName(323365)] = 3, -- Clinging Darkness
	[SpellName(338353)] = 3, -- Goresplatter
	[SpellName(333485)] = 3, -- Disease Cloud
	[SpellName(338357)] = 3, -- Tenderize
	[SpellName(328181)] = 3, -- Frigid Cold
	[SpellName(320170)] = 3, -- Necrotic Bolt
	[SpellName(323464)] = 3, -- Dark Ichor
	[SpellName(323198)] = 3, -- Dark Exile
	[SpellName(343504)] = 3, -- Dark Grasp
	[SpellName(343556)] = 3, -- Morbid Fixation 1
	[SpellName(338606)] = 3, -- Morbid Fixation 2
	[SpellName(324381)] = 3, -- Chill Scythe
	[SpellName(320573)] = 3, -- Shadow Well
	[SpellName(333492)] = 3, -- Necrotic Ichor
	[SpellName(334748)] = 3, -- Drain FLuids
	[SpellName(333489)] = 3, -- Necrotic Breath
	[SpellName(320717)] = 3, -- Blood Hunger
	-- Theater of Pain
	[SpellName(333299)] = 3, -- Curse of Desolation 1
	[SpellName(333301)] = 3, -- Curse of Desolation 2
	[SpellName(319539)] = 3, -- Soulless
	[SpellName(326892)] = 3, -- Fixate
	[SpellName(321768)] = 3, -- On the Hook
	[SpellName(323825)] = 3, -- Grasping Rift
	[SpellName(342675)] = 3, -- Bone Spear
	[SpellName(323831)] = 3, -- Death Grasp
	[SpellName(330608)] = 3, -- Vile Eruption
	[SpellName(330868)] = 3, -- Necrotic Bolt Volley
	[SpellName(323750)] = 3, -- Vile Gas
	[SpellName(323406)] = 3, -- Jagged Gash
	[SpellName(330700)] = 3, -- Decaying Blight
	[SpellName(319626)] = 3, -- Phantasmal Parasite
	[SpellName(324449)] = 3, -- Manifest Death
	[SpellName(341949)] = 3, -- Withering Blight
	-- Sanguine Depths
	[SpellName(326827)] = 3, -- Dread Bindings
	[SpellName(326836)] = 3, -- Curse of Suppression
	[SpellName(322554)] = 3, -- Castigate
	[SpellName(321038)] = 3, -- Burden Soul
	[SpellName(328593)] = 3, -- Agonize
	[SpellName(325254)] = 3, -- Iron Spikes
	[SpellName(335306)] = 3, -- Barbed Shackles
	[SpellName(322429)] = 3, -- Severing Slice
	[SpellName(334653)] = 3, -- Engorge
	-- Spires of Ascension
	[SpellName(338729)] = 3, -- Charged Stomp
	[SpellName(323195)] = 3, -- Purifying Blast
	[SpellName(327481)] = 3, -- Dark Lance
	[SpellName(322818)] = 3, -- Lost Confidence
	[SpellName(322817)] = 3, -- Lingering Doubt
	[SpellName(324205)] = 3, -- Blinding Flash
	[SpellName(331251)] = 3, -- Deep Connection
	[SpellName(328331)] = 3, -- Forced Confession
	[SpellName(341215)] = 3, -- Volatile Anima
	[SpellName(323792)] = 3, -- Anima Field
	[SpellName(317661)] = 3, -- Insidious Venom
	[SpellName(330683)] = 3, -- Raw Anima
	[SpellName(328434)] = 3, -- Intimidated
	-- De Other Side
	[SpellName(320786)] = 3, -- Power Overwhelming
	[SpellName(334913)] = 3, -- Master of Death
	[SpellName(325725)] = 3, -- Cosmic Artifice
	[SpellName(328987)] = 3, -- Zealous
	[SpellName(334496)] = 3, -- Soporific Shimmerdust
	[SpellName(339978)] = 3, -- Pacifying Mists
	[SpellName(323692)] = 3, -- Arcane Vulnerability
	[SpellName(333250)] = 3, -- Reaver
	[SpellName(330434)] = 3, -- Buzz-Saw 1
	[SpellName(320144)] = 3, -- Buzz-Saw 2
	[SpellName(331847)] = 3, -- W-00F
	[SpellName(327649)] = 3, -- Crushed Soul
	[SpellName(331379)] = 3, -- Lubricate
	[SpellName(332678)] = 3, -- Gushing Wound
	[SpellName(322746)] = 3, -- Corrupted Blood
	[SpellName(323687)] = 3, -- Arcane Lightning
	[SpellName(323877)] = 3, -- Echo Finger Laser X-treme
	[SpellName(334535)] = 3, -- Beak Slice

-- Castle Nathria
	-- Shriekwing
	[SpellName(328897)] = 3, -- Exsanguinated
	[SpellName(330713)] = 3, -- Reverberating Pain
	[SpellName(342923)] = 3, -- Deadly Descent
	[SpellName(342863)] = 3, -- Echo Screech
	-- Huntsman Altimor
	[SpellName(335304)] = 3, -- Sinseeker
	[SpellName(334971)] = 3, -- Jagged Claws
	[SpellName(335111)] = 3, -- Huntsman's Mark 1
	[SpellName(335112)] = 3, -- Huntsman's Mark 2
	[SpellName(335113)] = 3, -- Huntsman's Mark 3
	[SpellName(334945)] = 3, -- Bloody Thrash
	-- Hungering Destroyer
	[SpellName(334228)] = 3, -- Volatile Ejection
	[SpellName(329298)] = 3, -- Gluttonous Miasma
	-- Lady Inerva Darkvein
	[SpellName(325936)] = 3, -- Shared Cognition
	[SpellName(335396)] = 3, -- Hidden Desire
	[SpellName(324983)] = 3, -- Shared Suffering
	[SpellName(324982)] = 3, -- Shared Suffering (Partner)
	[SpellName(332664)] = 3, -- Concentrate Anima
	[SpellName(325382)] = 3, -- Warped Desires
	-- Sun King's Salvation
	[SpellName(333002)] = 3, -- Vulgar Brand
	[SpellName(326078)] = 3, -- Infuser's Boon
	[SpellName(325251)] = 3, -- Sin of Pride
	-- Artificer Xy'mox
	[SpellName(327902)] = 3, -- Fixate
	[SpellName(326302)] = 3, -- Stasis Trap
	[SpellName(325236)] = 3, -- Glyph of Destruction
	[SpellName(327414)] = 3, -- Possession
	-- The Council of Blood
	[SpellName(327052)] = 3, -- Drain Essence 1
	[SpellName(327773)] = 3, -- Drain Essence 2
	[SpellName(346651)] = 3, -- Drain Essence Mythic
	[SpellName(328334)] = 3, -- Tactical Advance
	[SpellName(330848)] = 3, -- Wrong Moves
	[SpellName(331706)] = 3, -- Scarlet Letter
	[SpellName(331636)] = 3, -- Dark Recital 1
	[SpellName(331637)] = 3, -- Dark Recital 2
	-- Sludgefist
	[SpellName(335470)] = 3, -- Chain Slam
	[SpellName(339181)] = 3, -- Chain Slam (Root)
	[SpellName(331209)] = 3, -- Hateful Gaze
	[SpellName(335293)] = 3, -- Chain Link
	[SpellName(335295)] = 3, -- Shattering Chain
	-- Stone Legion Generals
	[SpellName(334498)] = 3, -- Seismic Upheaval
	[SpellName(337643)] = 3, -- Unstable Footing
	[SpellName(334765)] = 3, -- Heart Rend
	[SpellName(333377)] = 3, -- Wicked Mark
	[SpellName(334616)] = 3, -- Petrified
	[SpellName(334541)] = 3, -- Curse of Petrification
	[SpellName(339690)] = 3, -- Crystalize
	[SpellName(342655)] = 3, -- Volatile Anima Infusion
	[SpellName(342698)] = 3, -- Volatile Anima Infection
	-- Sire Denathrius
	[SpellName(326851)] = 3, -- Blood Price
	[SpellName(327796)] = 3, -- Night Hunter
	[SpellName(327992)] = 3, -- Desolation
	[SpellName(328276)] = 3, -- March of the Penitent
	[SpellName(326699)] = 3, -- Burden of Sin
	[SpellName(329181)] = 3, -- Wracking Pain
	[SpellName(335873)] = 3, -- Rancor
	[SpellName(329951)] = 3, -- Impale
	
-----------------------------------------------------------------
-- BFA Dungeon
-----------------------------------------------------------------
--Freehold
	[SpellName(258323)] = 3, -- Infected Wound
	[SpellName(257775)] = 3, -- Plague Step
	[SpellName(257908)] = 4, -- Oiled Blade
	[SpellName(257436)] = 3, -- Poisoning Strike
	[SpellName(274389)] = 3, -- Rat Traps
	[SpellName(274555)] = 4, -- Scabrous Bites
	[SpellName(258875)] = 4, -- Blackout Barrel
	[SpellName(256363)] = 3, -- Ripper Punch
	
--Shrine of the Storm
	[SpellName(264560)] = 3, -- Choking Brine
	[SpellName(268233)] = 4, -- Electrifying Shock
	[SpellName(268322)] = 3, -- Touch of the Drowned
	[SpellName(268896)] = 3, -- Mind Rend
	[SpellName(268104)] = 3, -- Explosive Void
	[SpellName(267034)] = 5, -- Whispers of Power
	[SpellName(276268)] = 3, -- Heaving Blow
	[SpellName(264166)] = 3, -- Undertow
	[SpellName(264526)] = 3, -- Grasp of the Depths
	[SpellName(274633)] = 4, -- Sundering Blow
	[SpellName(268214)] = 5, -- Carving Flesh
	[SpellName(267818)] = 4, -- Slicing Blast
	[SpellName(268309)] = 4, -- Unending Darkness
	[SpellName(268317)] = 4, -- Rip Mind
	[SpellName(268391)] = 3, -- Mental Assault
	[SpellName(274720)] = 3, -- Abyssal Strike
	[SpellName(269131)] = 4, -- Ancient Mindbender

--Siege of Boralus
	[SpellName(257168)] = 4, -- Cursed Slash
	[SpellName(272588)] = 4, -- Rotting Wounds
	[SpellName(272571)] = 4, -- Choking Waters
	[SpellName(274991)] = 3, -- Putrid Waters
	[SpellName(275835)] = 4, -- Stinging Venom Coating
	[SpellName(273930)] = 3, -- Hindering Cut
	[SpellName(257292)] = 3, -- Heavy Slash
	[SpellName(261428)] = 3, -- Hangman's Noose
	[SpellName(256897)] = 3, -- Clamping Jaws
	[SpellName(272874)] = 3, -- Trample
	[SpellName(273470)] = 3, -- Gut Shot
	[SpellName(272834)] = 3, -- Viscous Slobber
	[SpellName(257169)] = 4, -- Terrifying Roar
	[SpellName(272713)] = 3, -- Crushing Slam
	
-- Tol Dagor
	[SpellName(258128)] = 4, -- Debilitating Shout
	[SpellName(265889)] = 3, -- Torch Strike
	[SpellName(257791)] = 4, -- Howling Fear
	[SpellName(258864)] = 3, -- Suppression Fire
	[SpellName(257028)] = 4, -- Fuselighter
	[SpellName(258917)] = 3, -- Righteous Flames
	[SpellName(257777)] = 3, -- Crippling Shiv
	[SpellName(258079)] = 4, -- Massive Chomp
	[SpellName(258058)] = 4, -- Squeeze
	[SpellName(260016)] = 4, -- Itchy Bite
	[SpellName(257119)] = 5, -- Sand Trap
	[SpellName(260067)] = 3, -- Vicious Mauling
	[SpellName(258313)] = 3, -- Handcuff
	[SpellName(259711)] = 3, -- Lockdown
	[SpellName(256198)] = 3, -- Azerite Rounds: Incendiary
	[SpellName(256101)] = 4, -- Explosive Burst
	[SpellName(256044)] = 6, -- Deadeye
	[SpellName(256474)] = 4, -- Heartstopper Venom
	
--Waycrest Manor
	[SpellName(260703)] = 3, -- Unstable Runic Mark
	[SpellName(263905)] = 3, -- Marking Cleave
	[SpellName(265880)] = 4, -- Dread Mark
	[SpellName(265882)] = 3, -- Lingering Dread
	[SpellName(264105)] = 3, -- Runic Mark
	[SpellName(264050)] = 4, -- Infected Thorn
	[SpellName(261440)] = 4, -- Virulent Pathogen
	[SpellName(263891)] = 4, -- Grasping Thorns
	[SpellName(264378)] = 4, -- Fragment Soul
	[SpellName(266035)] = 3, -- Bone Splinter
	[SpellName(266036)] = 4, -- Drain Essence
	[SpellName(260907)] = 5, -- Soul Manipulation
	[SpellName(260741)] = 6, -- Jagged Nettles
	[SpellName(264556)] = 3, -- Tearing Strike
	[SpellName(265760)] = 5, -- Thorned Barrage
	[SpellName(260551)] = 3, -- Soul Thorns
	[SpellName(263943)] = 4, -- Etch
	[SpellName(265881)] = 4, -- Decaying Touch
	[SpellName(261438)] = 4, -- Wasting Strike
	[SpellName(268202)] = 5, -- Death Lens
	[SpellName(278456)] = 4, -- Infest
	
-- Atal'Dazar
	[SpellName(252781)] = 5, -- Unstable Hex
	[SpellName(250096)] = 5, -- Wracking Pain
	[SpellName(250371)] = 5, -- Lingering Nausea
	[SpellName(253562)] = 3, -- Wildfire
	[SpellName(255582)] = 4, -- Molten Gold
	[SpellName(255041)] = 4, -- Terrifying Screech
	[SpellName(255371)] = 4, -- Terrifying Visage
	[SpellName(252687)] = 4, -- Venomfang Strike
	[SpellName(254959)] = 5, -- Soulburn
	[SpellName(255814)] = 5, -- Rending Maul
	[SpellName(255421)] = 5, -- Devour
	[SpellName(255434)] = 4, -- Serrated Teeth
	[SpellName(256577)] = 5, -- Soulfeast
	
--King's Rest
	[SpellName(270492)] = 4, -- Hex
	[SpellName(267763)] = 4, -- Wretched Discharge
	[SpellName(276031)] = 4, -- Pit of Despair
	[SpellName(265773)] = 5, -- Spit Gold
	[SpellName(270920)] = 5, -- Seduction
	[SpellName(270865)] = 4, -- Hidden Blade
	[SpellName(271564)] = 4, -- Embalming Fluid
	[SpellName(270507)] = 4, -- Poison Barrage
	[SpellName(267273)] = 4, -- Poison Nova
	[SpellName(270003)] = 4, -- Suppression Slam
	[SpellName(270084)] = 3, -- Axe Barrage
	[SpellName(267618)] = 3, -- Drain Fluids
	[SpellName(267626)] = 5, -- Dessication
	[SpellName(270487)] = 4, -- Severing Blade
	[SpellName(266238)] = 5, -- Shattered Defenses
	[SpellName(266231)] = 4, -- Severing Axe
	[SpellName(266191)] = 5, -- Whirling Axes
	[SpellName(272388)] = 4, -- Shadow Barrage
	[SpellName(271640)] = 4, -- Dark Revelation
	[SpellName(268796)] = 5, -- Impaling Spear
	
--Motherlode
	[SpellName(263074)] = 4, -- Festering Bite
	[SpellName(280605)] = 4, -- Brain Freeze
	[SpellName(257337)] = 4, -- Shocking Claw
	[SpellName(270882)] = 5, -- Blazing Azerite
	[SpellName(268797)] = 4, -- Transmute: Enemy to Goo
	[SpellName(259856)] = 4, -- Chemical Burn
	[SpellName(269302)] = 3, -- Toxic Blades
	[SpellName(280604)] = 3, -- Iced Spritzer
	[SpellName(257371)] = 4, -- Tear Gas
	[SpellName(257544)] = 4, -- Jagged Cut
	[SpellName(268846)] = 4, -- Echo Blade
	[SpellName(262794)] = 5, -- Energy Lash
	[SpellName(262513)] = 5, -- Azerite Heartseeker
	[SpellName(260829)] = 5, -- Homing Missle (travelling)
	[SpellName(260838)] = 5, -- Homing Missle (exploded)
	[SpellName(263637)] = 4, -- Clothesline
	
--Temple of Sethraliss
	[SpellName(269686)] = 4, -- Plague
	[SpellName(268013)] = 3, -- Flame Shock
	[SpellName(268008)] = 4, -- Snake Charm
	[SpellName(273563)] = 4, -- Neurotoxin
	[SpellName(272657)] = 3, -- Noxious Breath
	[SpellName(267027)] = 3, -- Cytotoxin
	[SpellName(272699)] = 3, -- Venomous Spit
	[SpellName(263371)] = 4, -- Conduction
	[SpellName(272655)] = 4, -- Scouring Sand
	[SpellName(263914)] = 4, -- Blinding Sand
	[SpellName(263958)] = 5, -- A Knot of Snakes
	[SpellName(266923)] = 4, -- Galvanize
	[SpellName(268007)] = 4, -- Heart Attack
	
--Underrot
	[SpellName(265468)] = 4, -- Withering Curse
	[SpellName(278961)] = 4, -- Decaying Mind
	[SpellName(259714)] = 4, -- Decaying Spores
	[SpellName(272180)] = 4, -- Death Bolt
	[SpellName(272609)] = 4, -- Maddening Gaze
	[SpellName(269301)] = 4, -- Putrid Blood
	[SpellName(265533)] = 4, -- Blood Maw
	[SpellName(265019)] = 5, -- Savage Cleave
	[SpellName(265377)] = 4, -- Hooked Snare
	[SpellName(265625)] = 5, -- Dark Omen
	[SpellName(260685)] = 3, -- Taint of G'huun
	[SpellName(266107)] = 5, -- Thirst for Blood
	[SpellName(260455)] = 3, -- Serrated Fangs
	
--Operation: Mechagon
	[SpellName(291928)] = 3, -- Giga-Zap
	[SpellName(292267)] = 3, -- Giga-Zap
	[SpellName(302274)] = 3, -- Fulminating Zap
	[SpellName(298669)] = 3, -- Taze
	[SpellName(295445)] = 3, -- Wreck
	[SpellName(294929)] = 3, -- Blazing Chomp
	[SpellName(297257)] = 3, -- Electrical Charge
	[SpellName(294855)] = 3, -- Blossom Blast
	[SpellName(291972)] = 3, -- Explosive Leap
	[SpellName(285443)] = 3, -- "Hidden" Flame Cannon
	[SpellName(291974)] = 3, -- Obnoxious Monologue
	[SpellName(296150)] = 3, -- Vent Blast
	[SpellName(298602)] = 3, -- Smoke Cloud
	[SpellName(296560)] = 3, -- Clinging Static
	[SpellName(297283)] = 3, -- Cave In
	[SpellName(291914)] = 3, -- Cutting Beam
	[SpellName(302384)] = 3, -- Static Discharge

-- Mythic+ Affixes (Legion, unsure if changes in BFA)
	[SpellName(226489)] = 5,	-- Sanguine Ichor
	[SpellName(226512)] = 5,	-- Sanguine Ichor
	[SpellName(209858)] = 5,	-- Necrotic Rot
	[SpellName(240559)] = 5,	-- Grievous Wound
	[SpellName(196376)] = 5,	-- Grievous Tear
	[SpellName(240443)] = 5,	-- Burst
	-- 8.3 Mythic+
	[SpellName(314406)] = 3,	-- Crippling Pestilence
	[SpellName(314411)] = 3,	-- Lingering Doubt
	[SpellName(314467)] = 4,	-- Volatile Rupture
	[SpellName(314478)] = 5,	-- Cascading Terror
	[SpellName(314483)] = 5,	-- Cascading Terror
	[SpellName(314531)] = 3,	-- Tear Flesh
	[SpellName(314565)] = 3,	-- Defiled Ground
	[SpellName(314592)] = 3,	-- Mind Flay
	[SpellName(314392)] = 3,	-- Vile Corruption
	[SpellName(314308)] = 4,	-- Spirit Breaker


-----------------------------------------------------------------
-- Uldir Raid
-----------------------------------------------------------------
-- Taloc
	[SpellName(270290)] = 5, -- Blood Storm
	[SpellName(271296)] = 5, -- Cudgel of Gore
	[SpellName(275270)] = 5, -- Fixate
	[SpellName(271224)] = 4, -- Plasma Discharge
	[SpellName(271225)] = 4, -- Plasma Discharge

-- MOTHER
	[SpellName(268277)] = 3, -- Purifying Flame
	[SpellName(268253)] = 3, -- Surgical Beam
	[SpellName(268095)] = 3, -- Cleansing Purge
	[SpellName(267787)] = 3, -- Sundering Scalpel
	[SpellName(268198)] = 3, -- Clinging Corruption
	[SpellName(267821)] = 3, -- Defense Grid
	[SpellName(267787)] = 5, -- Sanitizing Strike

-- Fetid Devourer
	[SpellName(262313)] = 5, -- Malodorous Miasma
	[SpellName(262292)] = 4, -- Rotting Regurgitation
	[SpellName(262314)] = 3, -- Putrid Paroxysm

-- Zek'voz, Herald of N'zoth
	[SpellName(265237)] = 6, -- Shatter
	[SpellName(265264)] = 5, -- Void Lash
	[SpellName(265360)] = 5, -- Roiling Deceit
	[SpellName(265662)] = 4, -- Corruptor's Pact
	[SpellName(265646)] = 5, -- Will of the Corruptor
	
-- Vectis
	[SpellName(265127)] = 4, -- Lingering Infection
	[SpellName(265178)] = 3, -- Evolving Affliction
	[SpellName(265206)] = 5, -- Immunosuppression
	[SpellName(265212)] = 5, -- Gestate
	[SpellName(265129)] = 4, -- Omega Vector
	[SpellName(267160)] = 4, -- Omega Vector
	[SpellName(267161)] = 4, -- Omega Vector
	[SpellName(267162)] = 4, -- Omega Vector
	[SpellName(267163)] = 4, -- Omega Vector
	[SpellName(267164)] = 4, -- Omega Vector

-- Zul, Reborn
	[SpellName(273365)] = 4, -- Dark Revelation
	[SpellName(273434)] = 5, -- Pit of Despair
	[SpellName(274195)] = 3, -- Corrupted Blood
	[SpellName(272018)] = 4, -- Absorbed in Darkness

-- Mythrax
	[SpellName(272336)] = 3, -- Annihilation
	[SpellName(272536)] = 5, -- Imminent Ruin
	[SpellName(274693)] = 4, -- Essence Shear
	[SpellName(272407)] = 3, -- Oblivion Sphere

-- G'huun
	[SpellName(263436)] = 5, -- Imperfect Physiology
	[SpellName(263227)] = 5, -- Putrid Blood
	[SpellName(263372)] = 4, -- Power Matrix
	[SpellName(272506)] = 4, -- Explosive Corruption
	[SpellName(267409)] = 4, -- Dark Bargain
	[SpellName(267430)] = 3, -- Torment
	[SpellName(263235)] = 5, -- Blood Feast
	[SpellName(270287)] = 3, -- Blighted Ground

-----------------------------------------------------------------
-- Battle of Dazar'alor Raid
-----------------------------------------------------------------
	-- Jaina
	[SpellName(285253)] = 3, -- Ice Shard
	[SpellName(287993)] = 3, -- Chilling Touch
	[SpellName(287365)] = 3, -- Searing Pitch
	[SpellName(288038)] = 3, -- Marked Target
	[SpellName(285254)] = 3, -- Avalanche
	[SpellName(287626)] = 3, -- Grasp of Frost
	[SpellName(287490)] = 3, -- Frozen Solid
	[SpellName(287199)] = 3, -- Ring of Ice
	[SpellName(288392)] = 3, -- Vengeful Seas

	-- Stormwall Blockade
	[SpellName(284369)] = 3, -- Sea Storm
	[SpellName(284410)] = 3, -- Tempting Song
	[SpellName(284405)] = 3, -- Tempting Song
	[SpellName(284121)] = 3, -- Thunderous Boom
	[SpellName(286680)] = 3, -- Roiling Tides
	[SpellName(285000)] = 5, -- 

	-- Opulence
	[SpellName(286501)] = 3, -- Creeping Blaze
	[SpellName(283610)] = 3, -- Crush
	[SpellName(289383)] = 3, -- Chaotic Displacement
	[SpellName(285479)] = 3, -- Flame Jet
	[SpellName(283063)] = 3, -- Flames of Punishment
	[SpellName(283507)] = 3, -- Volatile Charge

	-- King Rastakhan
	[SpellName(284995)] = 3, -- Zombie Dust
	[SpellName(285349)] = 3, -- Plague of Fire
	[SpellName(285044)] = 3, -- Toad Toxin
	[SpellName(284831)] = 3, -- Scorching Detonation
	[SpellName(289858)] = 3, -- Crushed
	[SpellName(284662)] = 3, -- Seal of Purification
	[SpellName(284676)] = 3, -- Seal of Purification
	[SpellName(285178)] = 3, -- Serpent's Breath
	[SpellName(285010)] = 3, -- Poison Toad Slime

	-- Jadefire Masters
	[SpellName(282037)] = 3, -- Rising Flames
	[SpellName(284374)] = 3, -- Magma Trap
	[SpellName(285632)] = 3, -- Stalking
	[SpellName(288151)] = 3, -- Tested
	[SpellName(284089)] = 3, -- Successful Defense
	[SpellName(286988)] = 3, -- Searing Embers

	-- Mekkatorque
	[SpellName(288806)] = 3, -- Gigavolt Blast
	[SpellName(289023)] = 3, -- Enormous
	[SpellName(286646)] = 3, -- Gigavolt Charge
	[SpellName(288939)] = 3, -- Gigavolt Radiation
	[SpellName(284168)] = 3, -- Shrunk
	[SpellName(286516)] = 3, -- Anti-Tampering Shock
	[SpellName(286480)] = 3, -- Anti-Tampering Shock
	[SpellName(284214)] = 3, -- Trample

	-- Conclave of the Chosen
	[SpellName(284663)] = 3, -- Bwonsamdi's Wrath
	[SpellName(282444)] = 3, -- Lacerating Claws
	[SpellName(282592)] = 3, -- Bleeding Wounds
	[SpellName(282209)] = 3, -- Mark of Prey
	[SpellName(285879)] = 3, -- Mind Wipe
	[SpellName(282135)] = 3, -- Crawling Hex
	[SpellName(286060)] = 3, -- Cry of the Fallen
	[SpellName(282447)] = 3, -- Kimbul's Wrath
	[SpellName(282834)] = 3, -- Kimbul's Wrath
	[SpellName(286811)] = 3, -- Akunda's Wrath
	[SpellName(286838)] = 3, -- Static Orb
	
-----------------------------------------------------------------
-- Crucible of Storms
-----------------------------------------------------------------
	--The Restless Cabal
	[SpellName(282386)] = 3, -- Aphotic Blast
	[SpellName(282384)] = 3, -- Shear Mind
	[SpellName(282566)] = 3, -- Promises of Power
	[SpellName(282561)] = 3, -- Dark Herald
	[SpellName(282432)] = 3, -- Crushing Doubt
	[SpellName(282589)] = 3, -- Mind Scramble
	[SpellName(292826)] = 3, -- Mind Scramble

	--Fa'thuul the Feared
	[SpellName(284851)] = 3, -- Touch of the End
	[SpellName(286459)] = 3, -- Feedback: Void
	[SpellName(286457)] = 3, -- Feedback: Ocean
	[SpellName(286458)] = 3, -- Feedback: Storm
	[SpellName(285367)] = 3, -- Piercing Gaze of N'Zoth
	[SpellName(284733)] = 3, -- Embrace of the Void
	[SpellName(284722)] = 3, -- Umbral Shell
	[SpellName(285345)] = 3, -- Maddening Eyes of N'Zoth
	[SpellName(285477)] = 3, -- Obscurity
	[SpellName(285652)] = 3, -- Insatiable Torment

-----------------------------------------------------------------
-- Eternal Palace
-----------------------------------------------------------------	
	--Lady Ashvane
	[SpellName(296693)] = 3, -- Waterlogged
	[SpellName(296725)] = 3, -- Barnacle Bash
	[SpellName(296942)] = 3, -- Arcing Azerite
	[SpellName(296938)] = 3, -- Arcing Azerite
	[SpellName(296941)] = 3, -- Arcing Azerite
	[SpellName(296939)] = 3, -- Arcing Azerite
	[SpellName(296943)] = 3, -- Arcing Azerite
	[SpellName(296940)] = 3, -- Arcing Azerite
	[SpellName(296752)] = 3, -- Cutting Coral
	[SpellName(297333)] = 3, -- Briny Bubble
	[SpellName(297397)] = 3, -- Briny Bubble

	--Abyssal Commander Sivara
	[SpellName(300701)] = 3, -- Rimefrost
	[SpellName(300705)] = 3, -- Septic Taint
	[SpellName(294847)] = 3, -- Unstable Mixture
	[SpellName(295850)] = 3, -- Delirious
	[SpellName(295421)] = 3, -- Overflowing Venom
	[SpellName(295807)] = 3, -- Frozen
	[SpellName(300883)] = 3, -- Inversion Sickness
	[SpellName(295705)] = 3, -- Toxic Bolt

	--The Queen’s Court
	[SpellName(301830)] = 3, -- Pashmar's Touch
	[SpellName(296851)] = 3, -- Fanatical Verdict
	[SpellName(297836)] = 3, -- Potent Spark
	[SpellName(297586)] = 3, -- Suffering
	[SpellName(304410)] = 3, -- Repeat Performance
	[SpellName(299914)] = 3, -- Frenetic Charge
	[SpellName(303306)] = 3, -- Sphere of Influence
	[SpellName(300545)] = 3, -- Mighty Rupture

	--Radiance of Azshara
	[SpellName(296566)] = 3, -- Tide Fist
	[SpellName(296737)] = 3, -- Arcane Bomb
	[SpellName(296746)] = 3, -- Arcane Bomb
	[SpellName(295920)] = 3, -- Ancient Tempest
	[SpellName(296462)] = 3, -- Squall Trap
	[SpellName(299152)] = 3, -- Waterlogged

	--Orgozoa
	[SpellName(298156)] = 3, -- Desensitizing Sting
	[SpellName(298306)] = 3, -- Incubation Fluid

	--Blackwater Behemoth
	[SpellName(292127)] = 3, -- Darkest Depths
	[SpellName(292138)] = 3, -- Radiant Biomass
	[SpellName(292167)] = 3, -- Toxic Spine
	[SpellName(301494)] = 3, -- Piercing Barb

	--Za’qul
	[SpellName(295495)] = 3, -- Mind Tether
	[SpellName(295480)] = 3, -- Mind Tether
	[SpellName(295249)] = 3, -- Delirium Realm
	[SpellName(303819)] = 3, -- Nightmare Pool
	[SpellName(293509)] = 3, -- Manifest Nightmares
	[SpellName(295327)] = 3, -- Shattered Psyche
	[SpellName(294545)] = 3, -- Portal of Madness
	[SpellName(298192)] = 3, -- Dark Beyond
	[SpellName(292963)] = 3, -- Dread
	[SpellName(300133)] = 3, -- Snapped

	--Queen Azshara
	[SpellName(298781)] = 3, -- Arcane Orb
	[SpellName(297907)] = 3, -- Cursed Heart
	[SpellName(302999)] = 3, -- Arcane Vulnerability
	[SpellName(302141)] = 3, -- Beckon
	[SpellName(299276)] = 3, -- Sanction
	[SpellName(303657)] = 3, -- Arcane Burst
	[SpellName(298756)] = 3, -- Serrated Edge
	[SpellName(301078)] = 3, -- Charged Spear
	[SpellName(298014)] = 3, -- Cold Blast
	[SpellName(298018)] = 3, -- Frozen
	
-----------------------------------------------------------------
-- Other
-----------------------------------------------------------------
	[SpellName(87023)] = 4,		-- Cauterize
	[SpellName(94794)] = 4,		-- Rocket Fuel Leak
	[SpellName(116888)] = 4,	-- Shroud of Purgatory
	[SpellName(121175)] = 2,	-- Orb of Power
}
-----------------------------------------------------------------
-- PvP
-----------------------------------------------------------------
if C.unitframe.plugins_pvp_debuffs == true then
	local PvPDebuffs = {
		-- Death Knight
		[SpellName(108194)] = 3,	-- Asphyxiate
		[SpellName(91797)] = 3,		-- Monstrous Blow (Mutated Ghoul)
		[SpellName(91800)] = 3,		-- Gnaw (Ghoul)
		[SpellName(47476)] = 3,		-- Strangulate
		-- Demon Hunter
		[SpellName(217832)] = 3,	-- Imprison
		[SpellName(211881)] = 3,	-- Fel Eruption
		[SpellName(179057)] = 3,	-- Chaos Nova
		[SpellName(205630)] = 3,	-- Illidan's Grasp
		-- Druid
		[SpellName(33786)] = 3,		-- Cyclone
		[SpellName(78675)] = 3,		-- Solar Beam
		[SpellName(339)] = 2,		-- Entangling Roots
		-- Hunter
		[SpellName(3355)] = 3,		-- Freezing Trap
		[SpellName(19386)] = 3,		-- Wyvern Sting
		[SpellName(117526)] = 3,	-- Binding Shot
		[SpellName(24394)] = 3,		-- Intimidation
		-- Mage
		[SpellName(61305)] = 3,		-- Polymorph
		[SpellName(82691)] = 3,		-- Ring of Frost
		[SpellName(31661)] = 3,		-- Dragon's Breath
		[SpellName(122)] = 2,		-- Frost Nova
		-- Monk
		[SpellName(115078)] = 3,	-- Paralysis
		[SpellName(119381)] = 3,	-- Leg Sweep
		-- Paladin
		[SpellName(20066)] = 3,		-- Repentance
		[SpellName(853)] = 3,		-- Hammer of Justice
		[SpellName(105421)] = 3,	-- Blinding Light
		-- Priest
		[SpellName(605)] = 3,		-- Dominate Mind
		[SpellName(8122)] = 3,		-- Psychic Scream
		[SpellName(64044)] = 3,		-- Psychic Horror
		[SpellName(15487)] = 3,		-- Silence
		[SpellName(284402)] = 3,	-- Vampiric Touch (Don't dispel)
		-- Rogue
		[SpellName(6770)] = 3,		-- Sap
		[SpellName(2094)] = 3,		-- Blind
		[SpellName(1776)] = 3,		-- Gouge
		[SpellName(1330)] = 3,		-- Garrote - Silence
		-- Shaman
		[SpellName(51514)] = 3,		-- Hex
		[SpellName(118905)] = 3,	-- Static Charge
		-- Warlock
		[SpellName(118699)] = 3,	-- Fear
		[SpellName(6789)] = 3,		-- Mortal Coil
		[SpellName(5484)] = 3,		-- Howl of Terror
		[SpellName(6358)] = 3,		-- Seduction (Succubus)
		[SpellName(115268)] = 3,	-- Mesmerize (Shivarra)
		[SpellName(30283)] = 3,		-- Shadowfury
		[SpellName(30108)] = 3,		-- Unstable Affliction (Don't dispel)
		-- Warrior
		[SpellName(46968)] = 3,		-- Shockwave
		[SpellName(132169)] = 3,	-- Storm Bolt
		[SpellName(194958)] = 3,	-- Intimidating Shout
	}

	for spell, prio in pairs(PvPDebuffs) do
		T.RaidDebuffs[spell] = prio
	end
end

T.RaidDebuffsReverse = {
	--[spellID] = true,			-- Spell name
}

T.RaidDebuffsIgnore = {
	--[spellID] = true,			-- Spell name
}

for _, spell in pairs(C.unitframe.plugins_aura_watch_list) do
	T.RaidDebuffs[SpellName(spell)] = 3
end