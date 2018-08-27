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
		--BETA {114163, "BOTTOMLEFT", {0.9, 0.6, 0.4}},			-- Eternal Flame
		{1022, "BOTTOMRIGHT", {0.2, 0.2, 1}, true},			-- Blessing of Protection
		{1044, "BOTTOMRIGHT", {0.89, 0.45, 0}, true},		-- Blessing of Freedom
		{204013, "BOTTOMRIGHT", {0.93, 0.75, 0}, true},		-- Blessing of Salvation
		{6940, "BOTTOMRIGHT", {0.89, 0.1, 0.1}, true},		-- Blessing of Sacrifice
		{204018, "BOTTOMRIGHT", {0.4, 0.6, 0.8}, true},		-- Blessing of Spellwarding
	},
	PRIEST = {
		{194384, "TOPRIGHT", {0.8, 0.4, 0.2}},				-- Atonement
		{41635, "BOTTOMRIGHT", {0.2, 0.7, 0.2}},			-- Prayer of Mending
		{139, "BOTTOMLEFT", {0.4, 0.7, 0.2}}, 				-- Renew
		{17, "TOPLEFT", {0.81, 0.85, 0.1}, true},			-- Power Word: Shield
		{33206, "LEFT", {0.89, 0.1, 0.1}, true},			-- Pain Suppression
		{47788, "LEFT", {0.86, 0.52, 0}, true},				-- Guardian Spirit
	},
	SHAMAN = {
		{61295, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Riptide
		{974, "BOTTOMRIGHT", {0.2, 0.7, 0.2}, true},		-- Earth Shield
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
		--BETA {3411, "TOPRIGHT", {0.89, 0.1, 0.1}},				-- Intervene
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
-- Legion Raid
-----------------------------------------------------------------
-- Legion
-- Antorus, the Burning Throne
	-- Garothi Worldbreaker
	[SpellName(244590)] = 3, -- Molten Hot Fel
	[SpellName(80354)] = 3, -- Molten Hot Fel
	[SpellName(244761)] = 3, -- Annihilation
	[SpellName(246920)] = 3, -- Haywire Decimation
	[SpellName(246369)] = 3, -- Searing Barrage
	[SpellName(246848)] = 3, -- Luring Destruction
	[SpellName(246220)] = 3, -- Fel Bombardment
	[SpellName(247159)] = 3, -- Luring Destruction
	[SpellName(244122)] = 3, -- Carnage
	[SpellName(244410)] = 3, -- Decimation
	[SpellName(245294)] = 3, -- Empowered Decimation
	[SpellName(246368)] = 3, -- Searing Barrage

	-- Felhounds of Sargeras
	[SpellName(245022)] = 3, -- Burning Remnant
	[SpellName(251445)] = 3, -- Smouldering
	[SpellName(251448)] = 3, -- Burning Maw
	[SpellName(244086)] = 5, -- Molten Touch
	[SpellName(244091)] = 3, -- Singed
	[SpellName(244768)] = 3, -- Desolate Gaze
	[SpellName(244767)] = 3, -- Desolate Path
	[SpellName(244471)] = 4, -- Enflame Corruption
	[SpellName(248815)] = 4, -- Enflamed
	[SpellName(244517)] = 3, -- Lingering Flames
	[SpellName(245098)] = 3, -- Decay
	[SpellName(251447)] = 3, -- Corrupting Maw
	[SpellName(244131)] = 3, -- Consuming Sphere
	[SpellName(245024)] = 3, -- Consumed
	[SpellName(244071)] = 3, -- Weight of Darkness
	[SpellName(244578)] = 3, -- Siphon Corruption
	[SpellName(248819)] = 3, -- Siphoned
	[SpellName(254429)] = 3, -- Weight of Darkness
	[SpellName(244072)] = 3, -- Molten Touch

	-- Antoran High Command
	[SpellName(245121)] = 3, -- Entropic Blast
	[SpellName(244748)] = 3, -- Shocked
	[SpellName(244824)] = 3, -- Warp Field
	[SpellName(244892)] = 3, -- Exploit Weakness
	[SpellName(244172)] = 3, -- Psychic Assault
	[SpellName(244388)] = 3, -- Psychic Scarring
	[SpellName(244420)] = 3, -- Chaos Pulse
	[SpellName(254771)] = 3, -- Disruption Field
	[SpellName(257974)] = 5, -- Chaos Pulse
	[SpellName(244910)] = 3, -- Felshield
	[SpellName(244737)] = 6, -- Shock Grenade

	-- Portal Keeper Hasabel
	[SpellName(244016)] = 3, -- Reality Tear
	[SpellName(245157)] = 3, -- Everburning Light
	[SpellName(245075)] = 3, -- Hungering Gloom
	[SpellName(245240)] = 3, -- Oppressive Gloom
	[SpellName(244709)] = 3, -- Fiery Detonation
	[SpellName(246208)] = 3, -- Acidic Web
	[SpellName(246075)] = 3, -- Catastrophic Implosion
	[SpellName(244826)] = 3, -- Fel Miasma
	[SpellName(246316)] = 3, -- Poison Essence
	[SpellName(244849)] = 3, -- Caustic Slime
	[SpellName(245118)] = 3, -- Cloying Shadows
	[SpellName(245050)] = 3, -- Delusions
	[SpellName(245040)] = 3, -- Corrupt
	[SpellName(244607)] = 3, -- Flames of Xoroth
	[SpellName(244915)] = 3, -- Leech Essence
	[SpellName(244926)] = 3, -- Felsilk Wrap
	[SpellName(244949)] = 3, -- Felsilk Wrap
	[SpellName(244613)] = 3, -- Everburning Flames

	-- Eonar the Life-Binder
	[SpellName(248326)] = 3, -- Rain of Fel
	[SpellName(248861)] = 5, -- Spear of Doom
	[SpellName(249016)] = 3, -- Feedback - Targeted
	[SpellName(249015)] = 3, -- Feedback - Burning Embers
	[SpellName(249014)] = 3, -- Feedback - Foul Steps
	[SpellName(249017)] = 3, -- Feedback - Arcane Singularity
	[SpellName(250693)] = 3, -- Arcane Buildup
	[SpellName(250691)] = 3, -- Burning Embers
	[SpellName(248795)] = 3, -- Fel Wake
	[SpellName(248332)] = 4, -- Rain of Fel
	[SpellName(250140)] = 3, -- Foul Steps

	-- Imonar the Soulhunter
	[SpellName(248424)] = 3, -- Gathering Power
	[SpellName(247552)] = 5, -- Sleep Canister
	[SpellName(247565)] = 5, -- Slumber Gas
	[SpellName(250224)] = 3, -- Shocked
	[SpellName(248252)] = 3, -- Infernal Rockets
	[SpellName(247687)] = 3, -- Sever
	[SpellName(247716)] = 3, -- Charged Blasts
	[SpellName(247367)] = 4, -- Shock Lance
	[SpellName(250255)] = 3, -- Empowered Shock Lance
	[SpellName(247641)] = 4, -- Stasis Trap
	[SpellName(255029)] = 5, -- Sleep Canister
	[SpellName(248321)] = 3, -- Conflagration
	[SpellName(247932)] = 3, -- Shrapnel Blast
	[SpellName(248070)] = 3, -- Empowered Shrapnel Blast
	[SpellName(254183)] = 5, -- Seared Skin

	-- Kin'garoth
	[SpellName(233062)] = 3, -- Infernal Burning
	[SpellName(230345)] = 3, -- Crashing Comet
	[SpellName(244312)] = 5, -- Forging Strike
	[SpellName(246840)] = 3, -- Ruiner
	[SpellName(248061)] = 3, -- Purging Protocol
	[SpellName(249686)] = 3, -- Reverberating Decimation
	[SpellName(246706)] = 6, -- Demolish
	[SpellName(246698)] = 6, -- Demolish
	[SpellName(245919)] = 3, -- Meteor Swarm
	[SpellName(245770)] = 3, -- Decimation

	-- Varimathras
	[SpellName(244042)] = 5, -- Marked Prey
	[SpellName(243961)] = 5, -- Misery
	[SpellName(248732)] = 3, -- Echoes of Doom
	[SpellName(243973)] = 3, -- Torment of Shadows
	[SpellName(244005)] = 3, -- Dark Fissure
	[SpellName(244093)] = 6, -- Necrotic Embrace
	[SpellName(244094)] = 6, -- Necrotic Embrace

	-- The Coven of Shivarra
	[SpellName(244899)] = 4, -- Fiery Strike
	[SpellName(245518)] = 4, -- Flashfreeze
	[SpellName(245586)] = 5, -- Chilled Blood
	[SpellName(246763)] = 3, -- Fury of Golganneth
	[SpellName(245674)] = 3, -- Flames of Khaz'goroth
	[SpellName(245671)] = 3, -- Flames of Khaz'goroth
	[SpellName(245910)] = 3, -- Spectral Army of Norgannon
	[SpellName(253520)] = 3, -- Fulminating Pulse
	[SpellName(245634)] = 3, -- Whirling Saber
	[SpellName(253020)] = 3, -- Storm of Darkness
	[SpellName(245921)] = 3, -- Spectral Army of Norgannon
	[SpellName(250757)] = 3, -- Cosmic Glare

	-- Aggramar
	[SpellName(244291)] = 3, -- Foe Breaker
	[SpellName(255060)] = 3, -- Empowered Foe Breaker
	[SpellName(245995)] = 4, -- Scorching Blaze
	[SpellName(246014)] = 3, -- Searing Tempest
	[SpellName(244912)] = 3, -- Blazing Eruption
	[SpellName(247135)] = 3, -- Scorched Earth
	[SpellName(247091)] = 3, -- Catalyzed
	[SpellName(245631)] = 3, -- Unchecked Flame
	[SpellName(245916)] = 3, -- Molten Remnants
	[SpellName(245990)] = 4, -- Taeshalach's Reach
	[SpellName(254452)] = 3, -- Ravenous Blaze
	[SpellName(244736)] = 3, -- Wake of Flame
	[SpellName(247079)] = 3, -- Empowered Flame Rend

	-- Argus the Unmaker
	[SpellName(251815)] = 3, -- Edge of Obliteration
	[SpellName(248499)] = 4, -- Sweeping Scythe
	[SpellName(250669)] = 5, -- Soulburst
	[SpellName(251570)] = 6, -- Soulbomb
	[SpellName(248396)] = 6, -- Soulblight
	[SpellName(258039)] = 3, -- Deadly Scythe
	[SpellName(252729)] = 3, -- Cosmic Ray
	[SpellName(256899)] = 4, -- Soul Detonation
	[SpellName(252634)] = 4, -- Cosmic Smash
	[SpellName(252616)] = 4, -- Cosmic Beacon
	[SpellName(255200)] = 3, -- Aggramar's Boon
	[SpellName(255199)] = 4, -- Avatar of Aggramar
	[SpellName(258647)] = 3, -- Gift of the Sea
	[SpellName(253901)] = 3, -- Strength of the Sea
	[SpellName(257299)] = 4, -- Ember of Rage
	[SpellName(248167)] = 3, -- Death Fog
	[SpellName(258646)] = 3, -- Gift of the Sky
	[SpellName(253903)] = 3, -- Strength of the Sky
	
-----------------------------------------------------------------
-- BFA Dungeon
-----------------------------------------------------------------
--Freehold
	[SpellName(258323)] = 3, -- Infected Wound
	[SpellName(257775)] = 3, -- Plague Step
	[SpellName(257908)] = 3, -- Oiled Blade
	[SpellName(257436)] = 3, -- Poisoning Strike
	[SpellName(274389)] = 3, -- Rat Traps
	[SpellName(274555)] = 3, -- Scabrous Bites
	[SpellName(258875)] = 3, -- Blackout Barrel
	[SpellName(256363)] = 3, -- Ripper Punch
	
--Shrine of the Storm
	[SpellName(264560)] = 3, -- Choking Brine
	[SpellName(268233)] = 3, -- Electrifying Shock
	[SpellName(268322)] = 3, -- Touch of the Drowned
	[SpellName(268896)] = 3, -- Mind Rend
	[SpellName(268104)] = 3, -- Explosive Void
	[SpellName(267034)] = 3, -- Whispers of Power
	[SpellName(276268)] = 3, -- Heaving Blow
	[SpellName(264166)] = 3, -- Undertow
	[SpellName(264526)] = 3, -- Grasp of the Depths
	[SpellName(274633)] = 3, -- Sundering Blow
	[SpellName(268214)] = 3, -- Carving Flesh
	[SpellName(267818)] = 3, -- Slicing Blast
	[SpellName(268309)] = 3, -- Unending Darkness
	[SpellName(268317)] = 3, -- Rip Mind
	[SpellName(268391)] = 3, -- Mental Assault
	[SpellName(274720)] = 3, -- Abyssal Strike

--Siege of Boralus
	[SpellName(257168)] = 3, -- Cursed Slash
	[SpellName(272588)] = 3, -- Rotting Wounds
	[SpellName(272571)] = 3, -- Choking Waters
	[SpellName(274991)] = 3, -- Putrid Waters
	[SpellName(275835)] = 3, -- Stinging Venom Coating
	[SpellName(273930)] = 3, -- Hindering Cut
	[SpellName(257292)] = 3, -- Heavy Slash
	[SpellName(261428)] = 3, -- Hangman's Noose
	[SpellName(256897)] = 3, -- Clamping Jaws
	[SpellName(272874)] = 3, -- Trample
	[SpellName(273470)] = 3, -- Gut Shot
	[SpellName(272834)] = 3, -- Viscous Slobber
	[SpellName(257169)] = 3, -- Terrifying Roar
	[SpellName(272713)] = 3, -- Crushing Slam
	
-- Tol Dagor
	[SpellName(258128)] = 3, -- Debilitating Shout
	[SpellName(265889)] = 3, -- Torch Strike
	[SpellName(257791)] = 3, -- Howling Fear
	[SpellName(258864)] = 3, -- Suppression Fire
	[SpellName(257028)] = 3, -- Fuselighter
	[SpellName(258917)] = 3, -- Righteous Flames
	[SpellName(257777)] = 3, -- Crippling Shiv
	[SpellName(258079)] = 3, -- Massive Chomp
	[SpellName(258058)] = 3, -- Squeeze
	[SpellName(260016)] = 3, -- Itchy Bite
	[SpellName(257119)] = 3, -- Sand Trap
	[SpellName(260067)] = 3, -- Vicious Mauling
	[SpellName(258313)] = 3, -- Handcuff
	[SpellName(259711)] = 3, -- Lockdown
	[SpellName(256198)] = 3, -- Azerite Rounds: Incendiary
	[SpellName(256101)] = 3, -- Explosive Burst
	[SpellName(256044)] = 3, -- Deadeye
	[SpellName(256474)] = 3, -- Heartstopper Venom
	
--Waycrest Manor
	[SpellName(260703)] = 3, -- Unstable Runic Mark
	[SpellName(263905)] = 3, -- Marking Cleave
	[SpellName(265880)] = 3, -- Dread Mark
	[SpellName(265882)] = 3, -- Lingering Dread
	[SpellName(264105)] = 3, -- Runic Mark
	[SpellName(264050)] = 3, -- Infected Thorn
	[SpellName(261440)] = 3, -- Virulent Pathogen
	[SpellName(263891)] = 3, -- Grasping Thorns
	[SpellName(264378)] = 3, -- Fragment Soul
	[SpellName(266035)] = 3, -- Bone Splinter
	[SpellName(266036)] = 3, -- Drain Essence
	[SpellName(260907)] = 3, -- Soul Manipulation
	[SpellName(260741)] = 3, -- Jagged Nettles
	[SpellName(264556)] = 3, -- Tearing Strike
	[SpellName(265760)] = 3, -- Thorned Barrage
	[SpellName(260551)] = 3, -- Soul Thorns
	[SpellName(263943)] = 3, -- Etch
	[SpellName(265881)] = 3, -- Decaying Touch
	[SpellName(261438)] = 3, -- Wasting Strike
	[SpellName(268202)] = 3, -- Death Lens
	
-- Atal'Dazar
	[SpellName(252781)] = 3, -- Unstable Hex
	[SpellName(250096)] = 3, -- Wracking Pain
	[SpellName(250371)] = 3, -- Lingering Nausea
	[SpellName(253562)] = 3, -- Wildfire
	[SpellName(255582)] = 3, -- Molten Gold
	[SpellName(255041)] = 3, -- Terrifying Screech
	[SpellName(255371)] = 3, -- Terrifying Visage
	[SpellName(252687)] = 3, -- Venomfang Strike
	[SpellName(254959)] = 3, -- Soulburn
	[SpellName(255814)] = 3, -- Rending Maul
	[SpellName(255421)] = 3, -- Devour
	[SpellName(255434)] = 3, -- Serrated Teeth
	[SpellName(256577)] = 3, -- Soulfeast
	
--King's Rest
	[SpellName(270492)] = 3, -- Hex
	[SpellName(267763)] = 3, -- Wretched Discharge
	[SpellName(276031)] = 3, -- Pit of Despair
	[SpellName(265773)] = 3, -- Spit Gold
	[SpellName(270920)] = 3, -- Seduction
	[SpellName(270865)] = 3, -- Hidden Blade
	[SpellName(271564)] = 3, -- Embalming Fluid
	[SpellName(270507)] = 3, -- Poison Barrage
	[SpellName(267273)] = 3, -- Poison Nova
	[SpellName(270003)] = 3, -- Suppression Slam
	[SpellName(270084)] = 3, -- Axe Barrage
	[SpellName(267618)] = 3, -- Drain Fluids
	[SpellName(267626)] = 3, -- Dessication
	[SpellName(270487)] = 3, -- Severing Blade
	[SpellName(266238)] = 3, -- Shattered Defenses
	[SpellName(266231)] = 3, -- Severing Axe
	[SpellName(266191)] = 3, -- Whirling Axes
	[SpellName(272388)] = 3, -- Shadow Barrage
	[SpellName(271640)] = 3, -- Dark Revelation
	[SpellName(268796)] = 3, -- Impaling Spear
	
--Motherlode
	[SpellName(263074)] = 3, -- Festering Bite
	[SpellName(280605)] = 3, -- Brain Freeze
	[SpellName(257337)] = 3, -- Shocking Claw
	[SpellName(270882)] = 3, -- Blazing Azerite
	[SpellName(268797)] = 3, -- Transmute: Enemy to Goo
	[SpellName(259856)] = 3, -- Chemical Burn
	[SpellName(269302)] = 3, -- Toxic Blades
	[SpellName(280604)] = 3, -- Iced Spritzer
	[SpellName(257371)] = 3, -- Tear Gas
	[SpellName(257544)] = 3, -- Jagged Cut
	[SpellName(268846)] = 3, -- Echo Blade
	[SpellName(262794)] = 3, -- Energy Lash
	[SpellName(262513)] = 3, -- Azerite Heartseeker
	[SpellName(260829)] = 3, -- Homing Missle (travelling)
	[SpellName(260838)] = 3, -- Homing Missle (exploded)
	[SpellName(263637)] = 3, -- Clothesline
	
--Temple of Sethraliss
	[SpellName(269686)] = 3, -- Plague
	[SpellName(268013)] = 3, -- Flame Shock
	[SpellName(268008)] = 3, -- Snake Charm
	[SpellName(273563)] = 3, -- Neurotoxin
	[SpellName(272657)] = 3, -- Noxious Breath
	[SpellName(267027)] = 3, -- Cytotoxin
	[SpellName(272699)] = 3, -- Venomous Spit
	[SpellName(263371)] = 3, -- Conduction
	[SpellName(272655)] = 3, -- Scouring Sand
	[SpellName(263914)] = 3, -- Blinding Sand
	[SpellName(263958)] = 3, -- A Knot of Snakes
	[SpellName(266923)] = 3, -- Galvanize
	[SpellName(268007)] = 3, -- Heart Attack
	
--Underrot
	[SpellName(265468)] = 3, -- Withering Curse
	[SpellName(278961)] = 3, -- Decaying Mind
	[SpellName(259714)] = 3, -- Decaying Spores
	[SpellName(272180)] = 3, -- Death Bolt
	[SpellName(272609)] = 3, -- Maddening Gaze
	[SpellName(269301)] = 3, -- Putrid Blood
	[SpellName(265533)] = 3, -- Blood Maw
	[SpellName(265019)] = 3, -- Savage Cleave
	[SpellName(265377)] = 3, -- Hooked Snare
	[SpellName(265625)] = 3, -- Dark Omen
	[SpellName(260685)] = 3, -- Taint of G'huun
	[SpellName(266107)] = 3, -- Thirst for Blood
	[SpellName(260455)] = 3, -- Serrated Fangs

-- Mythic+ Affixes (Legion, unsure if changes in BFA)
	[SpellName(226489)] = 5,	-- Sanguine Ichor
	[SpellName(209858)] = 5,	-- Necrotic Rot
	[SpellName(240559)] = 5,	-- Grievous Wound
	[SpellName(240443)] = 5,	-- Burst
	
}
-----------------------------------------------------------------
-- PvP
-----------------------------------------------------------------
if C.unitframe.plugins_pvp_debuffs == true then
	T.PvPDebuffs = {
		-- Death Knight
		[SpellName(108194)] = 3,	-- Asphyxiate
		[SpellName(91797)] = 3,		-- Monstrous Blow (Mutated Ghoul)
		[SpellName(91800)] = 3,		-- Gnaw (Ghoul)
		[SpellName(47476)] = 3,		-- Strangulate
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
		-- Warrior
		[SpellName(46968)] = 3,		-- Shockwave
		[SpellName(132169)] = 3,	-- Storm Bolt
		[SpellName(194958)] = 3,	-- Intimidating Shout
	}
end

T.RaidDebuffsReverse = {
	--[spellID] = true,			-- Spell name
}

T.RaidDebuffsIgnore = {
	--[spellID] = true,			-- Spell name
}
