local T, C, L = unpack(ViksUI)

local CreateSpellEntry = function( id, castByAnyone, color, unitType, castSpellId )
	local name = GetSpellInfo(id)
	if name then
		return { id = id, castByAnyone = castByAnyone, color = color, unitType = unitType or 0, castSpellId = castSpellId };
	else
		print("|cffff0000ViksUI: Class Timer spell ID ["..tostring(id).."] no longer exists!|r")
		return "Empty"
	end
end

T.ClassTimer_Trinkets = {
	--[[Proccs & Racials]]--
	CreateSpellEntry(2825, true), 		-- [Shaman] Bloodlust
	CreateSpellEntry(32182, true), 		-- [Shaman] Heroism
	CreateSpellEntry(80353, true), 		-- [Mage] Time Warp
	CreateSpellEntry(90355, true), 		-- [Hunter] Ancient Hysteria
	CreateSpellEntry(390386, true), 	-- [Evoker] Fury of the Aspects
	CreateSpellEntry(26297), 			-- Berserking (troll racial)
	CreateSpellEntry(33702), 			-- Blood Fury +INT (orc racial) 
	CreateSpellEntry(33697),  			-- Blood Fury +AP & INT (orc racial), Shamman
	CreateSpellEntry(20572), 			-- Blood Fury +AP (orc racial)
	CreateSpellEntry(55016),			-- Nitro Boost (Engeneering)
	CreateSpellEntry(173260),			-- Shieldtronic Shield (Engeneering)
	CreateSpellEntry(55001),			-- Parachute (Engeneering)
	CreateSpellEntry(126389),			-- Goblin Glider
	CreateSpellEntry(68992), 			-- Darkflight (Worgen Sprint Racial)
	CreateSpellEntry(273104), 			-- Fireblood (Dark Iron Dwarf)
	CreateSpellEntry(65116), 			-- Stoneform (Dwarf)
	CreateSpellEntry(58984), 			-- Shadowmeld (Night Elf)
	CreateSpellEntry(28880), 			-- Gift of the Naaru (Draenei)

	--[[Damage Reduction]]--
	CreateSpellEntry(116849, true), 		-- [Monk] Life Cocoon
	CreateSpellEntry(47788, true), 			-- [Priest] Guardian Spirit
	CreateSpellEntry(33206, true), 			-- [Priest] Pain Suppression
	CreateSpellEntry(102342, true), 		-- [Druid] Ironbark
	CreateSpellEntry(31821, true), 			-- [Paladin] Aura Mastery
	CreateSpellEntry(1022, true), 			-- [Paladin] Blessing of Protection
	CreateSpellEntry(6940, true), 			-- [Paladin] Blessing of Sacrifice
	CreateSpellEntry(204018, true), 		-- [Paladin] Blessing of Spellwarding
	CreateSpellEntry(114030, true), 		-- [Warrior] Vigilance
	CreateSpellEntry(97463, true), 			-- [Warrior] Rallying Cry
	CreateSpellEntry(209426, true), 		-- [Demon Hunter] Darkness
	
	--[[Trinkets]]--
	CreateSpellEntry(162915), -- Spirit of the Warlords (Skull of War)
	CreateSpellEntry(162913), -- Visions of the Future (Winged Hourglass)
	CreateSpellEntry(162919), -- Nightmare Fire (Sandman's Pouch)
	CreateSpellEntry(162917), -- Strength of Steel (Knight's Badge)
	CreateSpellEntry(123456), -- Strength of Steel (Knight's Badge)
	CreateSpellEntry(345231), -- Gladiator's Eternal Aegis
	CreateSpellEntry(345231), -- Gladiator's Emblem
}
	
T.ClassTimer_CommonTarget = {
}

T.ClassTimer_Classes = {
	DEATHKNIGHT = {
		target = {
			-- Shared
			CreateSpellEntry(45524), -- Chains of Ice
			CreateSpellEntry(391568), -- Insidious Chill
			CreateSpellEntry(273977), -- Grip of the Dead
			CreateSpellEntry(206930), -- Heart Strike
			CreateSpellEntry(383312), -- Abomination Limb
			-- Blood
			CreateSpellEntry(55078), -- Blood Plague
			CreateSpellEntry(206931), -- Blooddrinker
			CreateSpellEntry(343294), -- Soul Reaper
			-- Frost
			CreateSpellEntry(55095), -- Frost Fever
			-- Unholy
			CreateSpellEntry(191587), -- Virulent Plague
			CreateSpellEntry(194310), -- Festering Wounds
			CreateSpellEntry(196782), -- Outbreak
			CreateSpellEntry(221562), -- Asphyxiate
		},
		player = {
			-- Global
			CreateSpellEntry(48707), -- Anti-Magic Shell
			CreateSpellEntry(81256), -- Dancing Rune Weapon
			CreateSpellEntry(49028), -- Dancing Rune Weapon
			CreateSpellEntry(49039), -- Lichborne
			CreateSpellEntry(115018), -- Desecrated Ground
			CreateSpellEntry(115989), -- Unholy Blight
			CreateSpellEntry(145629), -- Anti-Magic Zone
			CreateSpellEntry(188290), -- Death and Decay
			CreateSpellEntry(315443), -- Abomination Limb
			-- Blood
			CreateSpellEntry(274156), -- Consumption
			CreateSpellEntry(55233), -- Vampiric Blood
			CreateSpellEntry(81141), -- Crimson Scourge
			CreateSpellEntry(274156), -- Consumption
			CreateSpellEntry(193249), -- Maw of the Damned
			CreateSpellEntry(193320), -- Maw of the Damned
			CreateSpellEntry(195181), -- Bone Shield
			CreateSpellEntry(194679), -- Rune Tap
			CreateSpellEntry(194844), -- Bonestorm
			CreateSpellEntry(219809), -- Tombstone
			CreateSpellEntry(215377), -- Maw of the Damned
			CreateSpellEntry(273947), -- Hemostasis
			CreateSpellEntry(219788), -- Ossuary
			-- Frost
			CreateSpellEntry(48792), -- Ice Bound Fortitude
			CreateSpellEntry(51124), -- Killing Machine
			CreateSpellEntry(51714), -- Razorice
			CreateSpellEntry(51271), -- Pillar of Frost
			CreateSpellEntry(59052), -- Rime
			CreateSpellEntry(152279), -- Breath of Sindragosa
			CreateSpellEntry(194879), -- Icy Talons
			CreateSpellEntry(196770), -- Remorseless Winter
			CreateSpellEntry(207127), -- Hungering Rune Weapon
			CreateSpellEntry(207256), -- Obliteration
			CreateSpellEntry(281209), -- Coldheart							 
			-- Unholy
			CreateSpellEntry(207319), -- Corpse Shield
			CreateSpellEntry(49206), -- Summon Gargoyle
		},
		procs = {
			-- Global
			CreateSpellEntry(53365), -- Unholy Strength
			-- Blood
			CreateSpellEntry(77535), -- Blood Shield
			CreateSpellEntry(391481), -- Coagulopathy
			-- Frost
			-- Unholy
			CreateSpellEntry(51460), -- Runic Corruption
			CreateSpellEntry(81340), -- Sudden Doom
		}
	},
	DEMONHUNTER = {
		target = {
			-- Global
			CreateSpellEntry(179057), -- Chaos Nova
			CreateSpellEntry(211881), -- Fel Eruption
			-- Havoc
			CreateSpellEntry(198813), -- Vengeful Retreat
			CreateSpellEntry(200166), -- Metamorphosis (Stun)
			CreateSpellEntry(202443), -- Anguish
			CreateSpellEntry(207690), -- Bloodlet
			CreateSpellEntry(211053), -- Fel Barrage
			CreateSpellEntry(213405), -- Master of the Glaives
			-- Vengeance
			CreateSpellEntry(185245), -- Torment
			CreateSpellEntry(204490), -- Sigil of Silence
			CreateSpellEntry(204598), -- Sigil of Flame
			CreateSpellEntry(207407), -- Soul Carver
			CreateSpellEntry(207685), -- Sigil of Misery
			CreateSpellEntry(207744), -- Fiery Brand
			CreateSpellEntry(207771), -- Fiery Brand
			CreateSpellEntry(210003), -- Razor Spikes
			CreateSpellEntry(212818), -- Fiery Demise
			CreateSpellEntry(224509), -- Frailty
		},
		player = {
			-- Global
			CreateSpellEntry(163073), -- Demon Soul
			CreateSpellEntry(206804), -- Rain from Above
			-- Havoc
			CreateSpellEntry(162264), -- Metamorphosis (Havoc)
			CreateSpellEntry(188501), -- Spectral Sight
			CreateSpellEntry(196555), -- Netherwalk
			CreateSpellEntry(209426), -- Darkness
			CreateSpellEntry(212800), -- Blur
			-- Vengeance
			CreateSpellEntry(187827), -- Metamorphosis (Vengeance)
			CreateSpellEntry(203819), -- Demon Spikes
			CreateSpellEntry(207693), -- Feast of Souls
			CreateSpellEntry(207810), -- Netherbond
			CreateSpellEntry(263648), -- Soul Barrier
		},
		procs = {
			-- Havoc
			CreateSpellEntry(188499), -- Blade Dance
			CreateSpellEntry(203650), -- Prepared
			CreateSpellEntry(208628), -- Momentum
			-- Vengeance
			CreateSpellEntry(212988), -- Painbringer
			CreateSpellEntry(227330), -- Gluttony
		}
	},
	DRUID = {
		target = {
			CreateSpellEntry(339), -- Entangling Roots
			CreateSpellEntry(5211), -- Mighty Bash
			CreateSpellEntry(61391), -- Typhoon
			CreateSpellEntry(102359), -- Mass Entanglement
			CreateSpellEntry(137452), -- Displacer Beast
			CreateSpellEntry(164812), -- Moonfire
			CreateSpellEntry(203554), -- Focused Growth
			-- Balance
			CreateSpellEntry(81261), -- Solar Beam
			CreateSpellEntry(164815), -- Sunfire
			CreateSpellEntry(202347), -- Stellar Flare
			CreateSpellEntry(205644), -- Force of Nature
			-- Feral
			CreateSpellEntry(1079), -- Rip
			CreateSpellEntry(58180), -- Infected Wounds
			CreateSpellEntry(106830), -- Thrash
			CreateSpellEntry(155625), -- Moonfire (Feral)
			CreateSpellEntry(155722), -- Rake
			CreateSpellEntry(203123), -- Main
			CreateSpellEntry(210664), -- Scent of Blood
			CreateSpellEntry(210670), -- Open Wounds
			CreateSpellEntry(210705), -- Ashamane's Rip
			CreateSpellEntry(210723), -- Ashamane's Frenzy
			-- Guardian
			CreateSpellEntry(99), -- Incapacitating Roar
			CreateSpellEntry(6795), -- Growl
			CreateSpellEntry(77758), -- Thrash
			CreateSpellEntry(214995), -- Bloody Paws
			-- Restoration
			CreateSpellEntry(774), -- Rejuvenation
			CreateSpellEntry(8936), -- Regrowth
			CreateSpellEntry(33763), -- Lifebloom
			CreateSpellEntry(48438), -- Wild Growth
			CreateSpellEntry(102342), -- Ironbark
			CreateSpellEntry(102351), -- Cenarion Ward
			CreateSpellEntry(127797), -- Ursol's Vortex
			CreateSpellEntry(155777), -- Rejuvenation (Germination)
			CreateSpellEntry(200389), -- Cultivation
			CreateSpellEntry(207386), -- Spring Blossom
		},
		player = {
			-- Global
			CreateSpellEntry(1850), -- Dash
			CreateSpellEntry(5215), -- Prowl
			CreateSpellEntry(22812), -- Barkskin
			CreateSpellEntry(61336), -- Survival Instincts
			CreateSpellEntry(362486), -- Tranquility (Druid PVP)
			-- Balance
			CreateSpellEntry(102560), -- Incarnation: Chosen of Elune
			CreateSpellEntry(165547), -- Lunar Empowerment
			CreateSpellEntry(191034), -- Starfall
			CreateSpellEntry(194223), -- Celestial Alignment
			CreateSpellEntry(202425), -- Warrior of Elune
			CreateSpellEntry(202737), -- Blessing of Elune
			CreateSpellEntry(202739), -- Blessing of An'she
			CreateSpellEntry(202770), -- Fury of Elune
			CreateSpellEntry(202942), -- Star Power
			-- Feral
			CreateSpellEntry(5217), -- Tiger's Fury
			CreateSpellEntry(52610), -- Savage Roar
			CreateSpellEntry(69369), -- Predatory Swiftness
			CreateSpellEntry(77764), -- Stampeding Roar
			CreateSpellEntry(102543), -- Incarnation: King of the Jungle
			CreateSpellEntry(106951), -- Berserk
			CreateSpellEntry(135700), -- Omen of Clarity
			CreateSpellEntry(145152), -- Bloodtalons
			CreateSpellEntry(210583), -- Ashamane's Energy
			CreateSpellEntry(210649), -- Feral Instinct
			-- Guardian
			CreateSpellEntry(93622), -- Mangle!
			CreateSpellEntry(102558), -- Incarnation: Son of Ursoc
			CreateSpellEntry(155835), -- Bristling Fur
			CreateSpellEntry(192081), -- Ironfur
			CreateSpellEntry(200851), -- Rage of the Sleeper
			CreateSpellEntry(201671), -- Gory Fur
			CreateSpellEntry(203975), -- Earthwarden
			CreateSpellEntry(213680), -- Guardian of Elune
			CreateSpellEntry(213708), -- Galactic Guardian
			-- Restoration
			CreateSpellEntry(774), -- Rejuvenation
			CreateSpellEntry(8936), -- Regrowth
			CreateSpellEntry(16870), -- Clearcasting
			CreateSpellEntry(33763), -- Lifebloom
			CreateSpellEntry(48438), -- Wild Growth
			CreateSpellEntry(102342), -- Ironbark
			CreateSpellEntry(102351), -- Cenarion Ward
			CreateSpellEntry(114108), -- Soul of the Forest
			CreateSpellEntry(117679), -- Incarnation: Tree of Life
			CreateSpellEntry(155777), -- Rejuvenation (Germination)
			CreateSpellEntry(200389), -- Cultivation
			CreateSpellEntry(207386), -- Spring Blossom
			CreateSpellEntry(207640), -- Abundance
		},
		procs = {
			-- Global
			-- Balance
			-- Feral
			-- Guardian
			-- Restoration
		}
	},
	EVOKER = {
		target = {
			CreateSpellEntry(361500), 		-- Living Flame Debuff
			CreateSpellEntry(361509), 		-- Leaping Flames Healing
			CreateSpellEntry(357209), 		-- Fire Breath
			CreateSpellEntry(355689),		-- Landslide
			CreateSpellEntry(357170), 		-- Time Dilation
			CreateSpellEntry(378441), 		-- Time Stop (PVP Talent)
			CreateSpellEntry(383005), 		-- Chrono Loop (PVP Talent)
			CreateSpellEntry(360806), 		-- Sleep Walk
			CreateSpellEntry(355941), 		-- Dream Breath
			CreateSpellEntry(363502), 		-- Dream Flight
			CreateSpellEntry(366155), 		-- Reversion
			CreateSpellEntry(364343), 		-- Echo

		},
		player = {
			-- Global
			CreateSpellEntry(361509), 		-- Living Flame Healing
			CreateSpellEntry(363916), 		-- Obsidian Scales
			CreateSpellEntry(375234), 		-- Time Spiral
			CreateSpellEntry(370818), 		-- Snapfire
			CreateSpellEntry(359618), 		-- Essence burst
			CreateSpellEntry(370901), 		-- Leaping Flames
			CreateSpellEntry(374348), 		-- Renewing Blaze
			CreateSpellEntry(375087), 		-- Dragonrage
			CreateSpellEntry(358267), 		-- Hover
			CreateSpellEntry(357210), 		-- Deep Breath
			CreateSpellEntry(371807), 		-- Recall
			CreateSpellEntry(357170), 		-- Time Dilation
			CreateSpellEntry(378441), 		-- Time Stop (PVP Talent)
			CreateSpellEntry(370960), 		-- Emerald Communion
			CreateSpellEntry(355941), 		-- Dream Breath
			CreateSpellEntry(363502), 		-- Dream Flight
			CreateSpellEntry(366155), 		-- Reversion
			CreateSpellEntry(364343), 		-- Echo

		},
		procs = {
			-- Global
			-- Devastation
			-- Preservation

		}
	},
	HUNTER = {
		target = {
			-- Global
			CreateSpellEntry(131894), -- A Murder of Crows
			CreateSpellEntry(328275), -- Wild Mark - Night Fae Covenant Ability for Hunters
			CreateSpellEntry(308498), -- Resonating Arrow - Kyrian Covenant Ability for Hunters
			CreateSpellEntry(308498), -- Flayed Shot - Venthyr Covenant Ability for Hunters
			-- Shared
			CreateSpellEntry(5116), -- Concussive Shot
			CreateSpellEntry(24335), -- Wyvern Sting
			CreateSpellEntry(117405), -- Binding Shot
			CreateSpellEntry(202797), -- Viper Sting
			CreateSpellEntry(202900), -- Scorpid Sting
			-- Beast Mastery
			CreateSpellEntry(24394), -- Intimidation			
			CreateSpellEntry(202933), -- Spider Sting
			CreateSpellEntry(207094), -- Titan's Thunder
			-- Marksmanship
			CreateSpellEntry(190533), -- Marked for Death
			CreateSpellEntry(194599), -- Black Arrow
			CreateSpellEntry(199803), -- True Aim
			CreateSpellEntry(204090), -- Bullseye
			CreateSpellEntry(209790), -- Freezing Arrow
			CreateSpellEntry(213691), -- Scatter Shot
			CreateSpellEntry(224729), -- Bursting Shot
			-- Survival
			CreateSpellEntry(3355), -- Freezing Trap
			CreateSpellEntry(118253), -- Serpent Sting
			CreateSpellEntry(162496), -- Steel Trap
			CreateSpellEntry(185855), -- Lacerate
			CreateSpellEntry(194858), -- Dragonsfire Grenade
			CreateSpellEntry(203257), -- Sticky Tar
			CreateSpellEntry(204081), -- On the Trail
			CreateSpellEntry(206755), -- Ranger's Net
			CreateSpellEntry(212353), -- Harpoon
			CreateSpellEntry(212638), -- Tracker's Net
			CreateSpellEntry(336746), -- Soulforge Embers
		},
		player = {
			-- Global
			CreateSpellEntry(35079, true), -- Misdirection
			CreateSpellEntry(109215), -- Posthaste (Disengage/Harpoon speed burst)
			CreateSpellEntry(186258), -- Aspect of the Cheetah
			CreateSpellEntry(189949), -- Aspect of the Turtle
			CreateSpellEntry(186265), -- Aspect of the Turtle
			CreateSpellEntry(53480), -- Roar of Sacrifice (PVP Talent)
			-- Shared
			CreateSpellEntry(120360), -- Barrage
			CreateSpellEntry(199483), -- Camouflage
			CreateSpellEntry(202627), -- Catlike Reflexes
			CreateSpellEntry(202748), -- Survival Tactics
			CreateSpellEntry(264735), -- Survival of the Fittest (Pet Ability)
			CreateSpellEntry(281195), -- Survival of the Fittest (Lone Wolf)
			CreateSpellEntry(281195), -- Survival of the Fittest (Lone Wolf)
			-- Beast Mastery
			CreateSpellEntry(19574), -- Bestial Wrath
			CreateSpellEntry(193530), -- Aspect of the Wild
			-- Marksmanship
			CreateSpellEntry(82921), -- Bombardment
			CreateSpellEntry(190515), -- Survival of the Fittest
			CreateSpellEntry(193534), -- Steady Focus
			CreateSpellEntry(203155), -- Sniper Shot
			-- Survival
			CreateSpellEntry(62305), -- Master's Call
			CreateSpellEntry(186289), -- Aspect of the Eagle
			CreateSpellEntry(190931), -- Mongoose Fury
			CreateSpellEntry(194407), -- Spitting Cobra
		},
		procs = {
			CreateSpellEntry(164857), -- Survivalist
		},
	},
	MAGE = {
		target = {
			-- Global
			CreateSpellEntry(118), -- Polymorph
			CreateSpellEntry(122), -- Frost Nova
			CreateSpellEntry(28271), -- Polymorph Turtle
			CreateSpellEntry(82691), -- Ring of Frost
			-- Arcane
			CreateSpellEntry(31589), -- Slow
			CreateSpellEntry(114923), -- Nether Tempest
			CreateSpellEntry(210134), -- Erosion
			CreateSpellEntry(210824), -- Touch of the Magi
			-- Fire
			CreateSpellEntry(2120), -- Flamestrike
			CreateSpellEntry(12654), -- Ignite
			CreateSpellEntry(31661), -- Dragon's Breath
			CreateSpellEntry(157981), -- Blast Wave
			CreateSpellEntry(217694), -- Living Bomb
			CreateSpellEntry(226757), -- Conflagration
			-- Frost
			CreateSpellEntry(33395), -- Freeze
			CreateSpellEntry(59638), -- Frostbolt (Mirror Images)
			CreateSpellEntry(135029), -- Water Jet
			CreateSpellEntry(157997), -- Ice Nova
			CreateSpellEntry(199786), -- Glacial Spike
			CreateSpellEntry(205021), -- Ray of Frost
			CreateSpellEntry(205708), -- Chilled
			CreateSpellEntry(212792), -- Cone of Cold
		},
		player = {
			-- Global
			CreateSpellEntry(130), -- Slow Fall
			CreateSpellEntry(11426), -- Ice Barrier
			CreateSpellEntry(45438), -- Ice Block
			CreateSpellEntry(108839), -- Ice Floes
			CreateSpellEntry(116014), -- Rune of Power
			CreateSpellEntry(116267), -- Incanter's Flow
			-- Shared
			CreateSpellEntry(66), -- Invisibility
			CreateSpellEntry(32612), -- Invisibility
			CreateSpellEntry(198158), -- Mass Invisibility (PVP Talent)
			CreateSpellEntry(198111), -- Temporal Shield (PVP Talent)
			CreateSpellEntry(205025), -- Presence of Mind
			CreateSpellEntry(210126), -- Arcane Familiar
			CreateSpellEntry(342246), -- Alter Time
			CreateSpellEntry(110909), -- Alter Time
			CreateSpellEntry(108978), -- Alter Time
			-- Arcane
			CreateSpellEntry(12042), -- Arcane Power
			CreateSpellEntry(12051), -- Evocation
			CreateSpellEntry(110960), -- Greater Invisibility
			CreateSpellEntry(212799), -- Displacement
			-- Fire
			CreateSpellEntry(48108), -- Hot Streak
			CreateSpellEntry(190319), -- Combustion
			CreateSpellEntry(235313), -- Blazing Barrier								   
			--Frost
			CreateSpellEntry(12472), -- Icy Veins
			CreateSpellEntry(195418), -- Chain Reaction
		},
		procs = {
			-- Arcane							   
			CreateSpellEntry(198924), -- Quickening
			CreateSpellEntry(263725), -- Clearcasting
			CreateSpellEntry(276743), -- Clearcasting
			-- Fire
			CreateSpellEntry(48107), -- Heating Up!
			-- Frost
			CreateSpellEntry(44544), -- Fingers of Frost
			CreateSpellEntry(195391), -- Jouster
			CreateSpellEntry(195446), -- Chilled to the Core
		},
	},
	MONK = {
		target = {
			-- Global
			CreateSpellEntry(115078), -- Paralysis
			CreateSpellEntry(116189), -- Provoke
			CreateSpellEntry(117952), -- Crackling Jade Lightning
			CreateSpellEntry(119381), -- Leg Sweep
			CreateSpellEntry(115176), -- Zen Meditation
			-- Brewmaster
			CreateSpellEntry(121253), -- Keg Smash
			CreateSpellEntry(196727), -- Provoke
			CreateSpellEntry(196733), -- Special Delivery
			CreateSpellEntry(213063), -- Dark Side of the Moon
			CreateSpellEntry(214326), -- Exploding Keg
			-- Mistweaver
			CreateSpellEntry(116849), -- Life Cocoon
			CreateSpellEntry(202577), -- Dome of Mist
			CreateSpellEntry(198909), -- Song of Chi-Ji
			-- Windwalker
			CreateSpellEntry(115080), -- Touch of Death
			CreateSpellEntry(115804), -- Mortal Wounds
			CreateSpellEntry(116095), -- Disable
			CreateSpellEntry(122470), -- Touch of Karma
			CreateSpellEntry(196608), -- Eye of the Tiger
			CreateSpellEntry(205320), -- Strike of the Windlord
		},
		player = {
			-- Global
			CreateSpellEntry(122278), -- Dampen Harm
			CreateSpellEntry(122783), -- Diffuse Magic
			-- Shared
			CreateSpellEntry(116847), -- Rushing Jade Wind
			CreateSpellEntry(353319), -- Peaceweaver (PVP Talent)
			CreateSpellEntry(115176), -- Zen Meditation
			-- Brewmaster
			CreateSpellEntry(120954), -- Fortifying Brew
			CreateSpellEntry(213177), -- Swift as a Coursing River
			CreateSpellEntry(213341), -- Fortification
			CreateSpellEntry(214373), -- Brew Stache
			CreateSpellEntry(215479), -- Ironskin Brew
			-- Mistweaver
			CreateSpellEntry(115175), -- Soothing Mist
			CreateSpellEntry(116680), -- Thunder Focus Tea
			CreateSpellEntry(116849), -- Life Cocoon
			CreateSpellEntry(202577), -- Dome of Mist
			CreateSpellEntry(119611), -- Renewing Mist
			CreateSpellEntry(197908), -- Mana Tea
			CreateSpellEntry(199888), -- The Mists of Shellum
			CreateSpellEntry(214478), -- Shroud of Mist
			-- Windwalker
			CreateSpellEntry(101546), -- Spinning Crane Kick
			CreateSpellEntry(125174), -- Touch of Karma
			CreateSpellEntry(129914), -- Power Strikes
			CreateSpellEntry(137639), -- Storm, Earth & Fire
			CreateSpellEntry(195312), -- Good Karma
			CreateSpellEntry(195321), -- Transfer of Power
			CreateSpellEntry(196608), -- Eye of the Tiger
		},
		procs = {
			-- Shared
			CreateSpellEntry(116841), -- Tiger's Lust
			-- Mistweaver
			CreateSpellEntry(124682), -- Enveloping Mist
			CreateSpellEntry(199407), -- Light on your Feet
			-- Windwalker
			CreateSpellEntry(116768), -- Blackout Kick!
			CreateSpellEntry(195381), -- Healing Winds
			CreateSpellEntry(196741), -- Hit Combo
		}
	},
	PALADIN = {
		target = {
			-- Global
			CreateSpellEntry(853), -- Hammer of Justice
			CreateSpellEntry(62124), -- Hand of Reckoning
			CreateSpellEntry(1022), -- Blessing of Protection
			CreateSpellEntry(1044), -- Blessing of Freedom
			CreateSpellEntry(6940), -- Hand of Sacrifice
			CreateSpellEntry(199448), -- Blessing of Ultimate Sacrifice
			-- Holy
			CreateSpellEntry(214222), -- Judgement
			CreateSpellEntry(223306), -- Bestow Faith
			-- Protection
			CreateSpellEntry(31935), -- Avenger's Shield
			CreateSpellEntry(204242), -- Consecration
			CreateSpellEntry(204301), -- Blessed Hammer
			CreateSpellEntry(228049), -- Guardian of the Forgotten Queen (PVP Talent)
			-- Retribution
			CreateSpellEntry(183218), -- Hand of Hindrance
			CreateSpellEntry(197277), -- Judgement
			CreateSpellEntry(205273), -- Wake of Ashes
		},
		player = {
			-- Global
			CreateSpellEntry(642), -- Devine Shield
			CreateSpellEntry(1022), -- Blessing of Protection
			CreateSpellEntry(1044), -- Blessing of Freedom
			CreateSpellEntry(221887), -- Devine Steed
			-- Shared
			CreateSpellEntry(6940), -- Hand of Sacrifice
			CreateSpellEntry(199448), -- Blessing of Ultimate Sacrifice
			CreateSpellEntry(31884), -- Avenging Wrath
			-- Holy
			CreateSpellEntry(498), -- Devine Protection
			CreateSpellEntry(31821), -- Aura Mastery
			CreateSpellEntry(53563), -- Beacon of Light
			CreateSpellEntry(105809), -- Holy Avenger
			CreateSpellEntry(200025), -- Beacon of Virtue
			CreateSpellEntry(200376), -- Vindicator
			CreateSpellEntry(200654), -- Tyr's Deliverance
			CreateSpellEntry(211210), -- Protection of Tyr
			CreateSpellEntry(214202), -- Rule of Law
			CreateSpellEntry(223306), -- Bestow Faith
			-- Protection
			CreateSpellEntry(31850), -- Ardent Defender
			CreateSpellEntry(86659), -- Guardian of Ancient Kings
			CreateSpellEntry(132403), -- Shield of the Righteous
			CreateSpellEntry(204013), -- Blessing of Salvation
			CreateSpellEntry(204018), -- Blessing of Spellwarding
			CreateSpellEntry(204150), -- Aegis of Light
			CreateSpellEntry(209332), -- Painful Truths
			CreateSpellEntry(209388), -- Bulwark of Order
			CreateSpellEntry(209540), -- Light of the Titans
			CreateSpellEntry(204242), -- Consecration
			CreateSpellEntry(327193), -- Moment of Glory
			CreateSpellEntry(205273), -- Guardian of the Forgotten Queen (PVP Talent)
			
			-- Retribution
			CreateSpellEntry(184662), -- Shield of Vengeance
			CreateSpellEntry(205191), -- Eye for an Eye
			CreateSpellEntry(217020), -- Zeal
		},
		procs = {
			-- Holy
			CreateSpellEntry(200652), -- Tyr's Deliverance
			-- Retribution
			CreateSpellEntry(223819), -- Devine Purpose
		},
	},
	PRIEST = {
		target = {
			--Global
			CreateSpellEntry(605), -- Mind Control
			CreateSpellEntry(9484), -- Shackle Undead
			-- Shared
			CreateSpellEntry(17), -- Power Word: Shield
			CreateSpellEntry(589), -- Shadow Word: Pain
			CreateSpellEntry(8122), -- Psychic Scream
			CreateSpellEntry(65081), -- Body and Soul
			CreateSpellEntry(109142), -- Twist of Fate
			-- Holy
			CreateSpellEntry(139), -- Renew					
			CreateSpellEntry(33076), -- Prayer of Mending			
			CreateSpellEntry(47788), -- Guardian Spirit
			CreateSpellEntry(64901), -- Symbol of Hope
			CreateSpellEntry(196611), -- Delivered from Evil
			CreateSpellEntry(200196), -- Holy Word: Chastise			
			CreateSpellEntry(208065), -- Light of T'uure
			CreateSpellEntry(210980), -- Focus in the Light
			CreateSpellEntry(213610), -- Holy Ward
			CreateSpellEntry(221660), -- Holy Concentration
			-- Discipline
			CreateSpellEntry(33206), -- Pain Suppression
			CreateSpellEntry(194384), -- Atonement
			CreateSpellEntry(152118), -- Clarity of Will
			CreateSpellEntry(196440), -- Purified Resolve
			CreateSpellEntry(204213), -- Purge the Wicked (should replace Shadow Word: Pain when talented)
			CreateSpellEntry(204197), -- Purge the Wicked (should replace Shadow Word: Pain when talented)
			CreateSpellEntry(204263), -- Shining Force
			CreateSpellEntry(214621), -- Schism
			CreateSpellEntry(81782), -- Power Word: Barrier
			CreateSpellEntry(271466), -- Luminous Barrier
			-- Shadow
			CreateSpellEntry(15407), -- Mind Flay
			CreateSpellEntry(34914, false, nil, nil, 34914), -- Vampiric Touch
			CreateSpellEntry(199683), -- Last Word
			CreateSpellEntry(335467), -- Devouring Plague
		},
		player = {
			--Global
			CreateSpellEntry(586), 		-- Fade
			CreateSpellEntry(2096), 	--Mind Vision
			-- Shared
			CreateSpellEntry(17), 		-- Power Word: Shield
			CreateSpellEntry(10060), 	-- Power Infusion			
			CreateSpellEntry(121536), 	-- Angelic Feather
			CreateSpellEntry(19236), 	-- Desperate Prayer
			-- Holy
			CreateSpellEntry(139), 		-- Renew			
			CreateSpellEntry(33076), 	-- Prayer of Mending
			CreateSpellEntry(64843),	-- Divine Hymn
			CreateSpellEntry(64901),	-- Symbol of Hope
			CreateSpellEntry(196644),	-- Blessing of T'uure
			CreateSpellEntry(196773),	-- Inner Focus
			CreateSpellEntry(197341), 	-- Ray of Hope
			CreateSpellEntry(200183), 	-- Apotheosis
			CreateSpellEntry(208065), 	-- Light of T'uure
			CreateSpellEntry(210980), 	-- Focus in the Light
			CreateSpellEntry(213610), 	-- Holy Ward
			CreateSpellEntry(217941), 	-- Spirit of the Redeemer
			CreateSpellEntry(20711), 	-- Spirit of Redemption
			-- Discipline
			CreateSpellEntry(33206), 	-- Pain Suppression
			CreateSpellEntry(47536), 	-- Rapture
			CreateSpellEntry(194384), 	-- Atonement			
			CreateSpellEntry(152118), 	-- Clarity of Will
			CreateSpellEntry(197763), 	-- Borrowed Time
			CreateSpellEntry(197871), 	-- Dark Archangel
			CreateSpellEntry(198069), 	-- Power of the Dark Side
			CreateSpellEntry(210027), 	-- Share in the Light
			CreateSpellEntry(211681), 	-- Power Word: Fortitude
			CreateSpellEntry(81782), 	-- Power Word: Barrier
			CreateSpellEntry(271466),	-- Luminous Barrier
			-- Shadow
			CreateSpellEntry(47585), -- Dispersion
			CreateSpellEntry(193173), -- Mania
			CreateSpellEntry(194249), -- Voidform
			CreateSpellEntry(199131), -- Pure Shadow
			CreateSpellEntry(204778), -- Void Shield
			CreateSpellEntry(205065), -- Void Torrent

		},
		procs = {
			CreateSpellEntry(45243), -- Focused Will
			CreateSpellEntry(341207), -- Dark Thoughts
			CreateSpellEntry(195329), -- Defender of the Weak
			CreateSpellEntry(196684), -- Invoke the Naaru (Holy Priest Artifact)
		},
	},
	ROGUE = {
		target = {
			-- Global
			CreateSpellEntry(408), -- Kidney Shot
			CreateSpellEntry(703), -- Garrote
			CreateSpellEntry(1833), -- Cheap Shot
			CreateSpellEntry(2818), -- Deadly Poison
			CreateSpellEntry(3409), -- Crippling Poison
			CreateSpellEntry(6770), -- Sap
			CreateSpellEntry(8680), -- Wound Poison
			CreateSpellEntry(137619), -- Mark for Death
			-- Shared
			CreateSpellEntry(2094), -- Blind
			-- Assassination
			CreateSpellEntry(16511), -- Hemorrhage
			CreateSpellEntry(79140), -- Vendetta
			CreateSpellEntry(154953), -- Internal Bleeding
			CreateSpellEntry(192425), -- Surge of Toxins
			CreateSpellEntry(192759), -- Kingsbane
			-- Outlaw
			CreateSpellEntry(1776), -- Gouge
			CreateSpellEntry(1943), -- Rupture
			CreateSpellEntry(196937), -- Ghostly Strike
			-- Subtlety
			CreateSpellEntry(195452), -- Nightblade
			CreateSpellEntry(196958), -- Strike from the Shadows
			CreateSpellEntry(206760), -- Night Terrors
			CreateSpellEntry(209786), -- Goremaw's Bite
		},
		player = {
			-- Global
			CreateSpellEntry(5277), -- Evasion
			CreateSpellEntry(1966), -- Feint
			CreateSpellEntry(2983), -- Sprint
			CreateSpellEntry(11327), -- Vanish
			CreateSpellEntry(31224), -- Cloak of Shadows
			CreateSpellEntry(185311), -- Crimson Vial
			CreateSpellEntry(114018), -- Shroud of Concealment
			CreateSpellEntry(115834), -- Shroud of Concealment
			-- Shared
			CreateSpellEntry(36554), -- Shadowstep
			-- Assassination
			CreateSpellEntry(32645), -- Envenom
			-- Outlaw
			CreateSpellEntry(5171), -- Slice and Dice
			CreateSpellEntry(13750), -- Adrenaline Rush
			CreateSpellEntry(13877), -- Blade Flurry
			CreateSpellEntry(51690), -- Killing Spree
			CreateSpellEntry(193356), -- Broadsides
			CreateSpellEntry(193357), -- Shark Infested Waters
			CreateSpellEntry(193358), -- Grand Melee
			CreateSpellEntry(195627), -- Opportunity
			CreateSpellEntry(199600), -- Buried Treasure
			CreateSpellEntry(199603), -- Jolly Roger
			-- Subtlety
			CreateSpellEntry(31665), -- Master of Subtlety
			CreateSpellEntry(121471), -- Shadow Blades
			CreateSpellEntry(185422), -- Shadow Dance
			CreateSpellEntry(197603), -- Embrace the Darkness
			CreateSpellEntry(212283), -- Symbols of Death
			CreateSpellEntry(220901), -- Goremaw's Bite
			CreateSpellEntry(227151), -- Death
		},
		procs = {
			-- Global
			CreateSpellEntry(193538), -- Alacrity
			-- Assassination
			CreateSpellEntry(193641), -- Elaborate Planning
			-- Outlaw
			CreateSpellEntry(193359), -- True Bearing
			CreateSpellEntry(202776), -- Blurred Time
		},
	},
	SHAMAN = {
		target = {
			-- Global
			CreateSpellEntry(51514), -- Hex
			CreateSpellEntry(64695), -- Earthgrab
			CreateSpellEntry(116947), -- Earthbind
			CreateSpellEntry(118905), -- Static Charge
			CreateSpellEntry(383018), -- Stoneskin Totem
			CreateSpellEntry(325174), -- Spirit Link Totem
			CreateSpellEntry(207498), -- Ancestral Protection Totem
			-- Elemental
			CreateSpellEntry(188389), -- Flame Shock
			CreateSpellEntry(196840), -- Frost Shock
			CreateSpellEntry(197209), -- Lightning Rod
			-- Enhancer
			CreateSpellEntry(147732), -- Frostbrand Attack
			CreateSpellEntry(197214), -- Sundering
			CreateSpellEntry(224125), -- Fiery Jaws
			CreateSpellEntry(224126), -- Frozen Bite
			-- Restoration
			CreateSpellEntry(61295), -- Riptide
			CreateSpellEntry(207400), -- Ancestral Vigor
		},
		player = {
			-- Global
			CreateSpellEntry(108271), -- Astral Shift
			CreateSpellEntry(192082), -- Wind Rush
			CreateSpellEntry(118337), -- Harden Skin
			CreateSpellEntry(383018), -- Stoneskin Totem
			CreateSpellEntry(325174), -- Spirit Link Totem
			CreateSpellEntry(207498), -- Ancestral Protection Totem
			-- Elemental
			CreateSpellEntry(16166), -- Elemental Mastery
			CreateSpellEntry(108281), -- Ancestral Guidance
			CreateSpellEntry(114050), -- Ascendance
			CreateSpellEntry(157384), -- Eye of the Storm
			CreateSpellEntry(173184), -- Elemental Blast: Haste
			CreateSpellEntry(202192), -- Resonance Totem
			CreateSpellEntry(205495), -- Stormkeeper
			CreateSpellEntry(210652), -- Storm Totem
			CreateSpellEntry(210658), -- Ember Totem
			CreateSpellEntry(210659), -- Tallwind Totem
			CreateSpellEntry(210714), -- Icefury
			-- Enhancer
			CreateSpellEntry(58875), -- Spirit Walk
			CreateSpellEntry(114051), -- Ascendance
			CreateSpellEntry(192106), -- Lightning Shield
			CreateSpellEntry(194084), -- Flametongue
			CreateSpellEntry(195222), -- Stormlash
			CreateSpellEntry(197211), -- Fury of Air
			CreateSpellEntry(198249), -- Elemental Healing
			CreateSpellEntry(198293), -- Wind Strikes
			CreateSpellEntry(198300), -- Gathering Storm
			CreateSpellEntry(201846), -- Stormbringer
			CreateSpellEntry(204945), -- Doom Winds
			-- Restoration
			CreateSpellEntry(53390), 	-- Tidal Waves
			CreateSpellEntry(61295),	-- Riptide
			CreateSpellEntry(73685), 	-- Unleash Life
			CreateSpellEntry(73920), 	-- Healing Rain
			CreateSpellEntry(79206), 	-- Spiritwalker's Grace
			CreateSpellEntry(98007), 	-- Spiritlink Totem
			CreateSpellEntry(114052), 	-- Ascendance
			CreateSpellEntry(157504), 	-- Cloudburst Totem
			CreateSpellEntry(974),		-- Earthen Shield
			CreateSpellEntry(201633),	-- Earthen Shield
			CreateSpellEntry(207400), 	-- Ancestral Vigor
			CreateSpellEntry(207498), 	-- Ancestral Protection
			CreateSpellEntry(207778), 	-- Gift of the Queen
			CreateSpellEntry(208205), 	-- Cumulative Upkeep
			CreateSpellEntry(209950), 	-- Caress of the Tidemother
		},
		procs = {
			-- Shared
			CreateSpellEntry(77762), -- Lava Surge
			-- Elemental
			-- Enhancer
			CreateSpellEntry(199055), -- Unleash Doom
			CreateSpellEntry(202004), -- Landslide
			CreateSpellEntry(215785), -- Hot Hand
			-- Restoration
			CreateSpellEntry(207288), -- Queen Ascendant
			CreateSpellEntry(208899), -- Queen's Decree
			CreateSpellEntry(216251), -- Undulation
		},
	},
	WARLOCK = {
			target = {
			-- Global
			CreateSpellEntry(710), -- Banish
			CreateSpellEntry(6789), -- Mortal Coil
			CreateSpellEntry(118699), -- Fear
			CreateSpellEntry(5782), -- Fear
			CreateSpellEntry(1098), -- Enslave Demon
			CreateSpellEntry(334275), -- Curse of Exhaustion
			CreateSpellEntry(702), -- Curse of Weakness
			CreateSpellEntry(27243), -- Curse of Weakness
			CreateSpellEntry(331623), -- Soul Rot - Night Fae Covenant Ability for Warlocks
			CreateSpellEntry(325640), -- Soul Rot - Night Fae Covenant Ability for Warlocks
			-- Shared
			CreateSpellEntry(212295), -- Nether Ward (PVP Talent)
			-- Affliction
			CreateSpellEntry(172), -- Corruption
			CreateSpellEntry(980), -- Bane of Agony
			CreateSpellEntry(5484), -- Howl of Terror
			CreateSpellEntry(27243), -- Seed of Corruption
			CreateSpellEntry(316099), -- Unstable Affliction
			CreateSpellEntry(231791), -- Unstable Affliction
			CreateSpellEntry(334315), -- Unstable Affliction
			CreateSpellEntry(342938), -- Unstable Affliction
			CreateSpellEntry(48181), -- Haunt
			CreateSpellEntry(63106), -- Siphon Life
			CreateSpellEntry(146739), -- Corruption Debuff
			CreateSpellEntry(198590), -- Drain Soul
			CreateSpellEntry(205178), -- Soul Effigy
			CreateSpellEntry(205179), -- Phantom Singularity
			CreateSpellEntry(233496), --Unstable Affliction
			CreateSpellEntry(233497), --Unstable Affliction
			CreateSpellEntry(233498), --Unstable Affliction
			CreateSpellEntry(251502), --Unstable Affliction
			CreateSpellEntry(233490), --Unstable Affliction
			CreateSpellEntry(205179), -- Phantom Singularity
			-- Demonology
			CreateSpellEntry(603), -- Bane of Doom
			CreateSpellEntry(30213), -- Legion Strike
			CreateSpellEntry(30283), -- Shadowfury
			CreateSpellEntry(205181), -- Shadowflame
			CreateSpellEntry(270569), -- From the Shadows
			-- Destruction
			CreateSpellEntry(80240), -- Bane of Havoc
			CreateSpellEntry(157736), -- Immolate
			CreateSpellEntry(348), -- Immolate
			CreateSpellEntry(196414), -- Eradiction
		},
		player = {
			-- Global
			CreateSpellEntry(126), -- Eye of Kilrogg
			CreateSpellEntry(104773), -- Unending Resolve
			CreateSpellEntry(108366), -- Soul Leech
			-- Shared
			CreateSpellEntry(108416), -- Dark Pact
			CreateSpellEntry(196098), -- Soul Harvest
			CreateSpellEntry(196099), -- Demonic Power
			CreateSpellEntry(212295), -- Nether Ward (PVP Talent)
			-- Affliction
			CreateSpellEntry(216695), -- Tormented Souls
			CreateSpellEntry(216708), -- Deadwind Harvester
			CreateSpellEntry(264571), -- Nightfall
			CreateSpellEntry(333889), -- Fel Domination
			-- Demonology
			CreateSpellEntry(171982), -- Demonic Synergy
			CreateSpellEntry(264173), -- Demonic Core
			CreateSpellEntry(193440), -- Demonwrath
			CreateSpellEntry(196606), -- Shadowy Inspiration
			CreateSpellEntry(205146), -- Demonic Calling
			CreateSpellEntry(387393), -- Dread Calling
			-- Destruction
			CreateSpellEntry(196546), -- Conflagration of Chaos
			CreateSpellEntry(387263), -- Flashpoint
			CreateSpellEntry(266030), -- Reverse Entropy
		},
		procs = {
			-- Affliction
			CreateSpellEntry(199281), -- Compund Interest
			-- Destruction
			CreateSpellEntry(117828),-- Backdraft rank 1/2/3
		},
	},
	WARRIOR = {
		target = {
			-- Global
			CreateSpellEntry(355), -- Taunt
			CreateSpellEntry(1715), -- Hamstring
			CreateSpellEntry(105771), -- Charge
			CreateSpellEntry(132168), -- Shockwave
			CreateSpellEntry(132169), -- Stormbolt
			CreateSpellEntry(147833), -- Intervene
			-- Shared
			CreateSpellEntry(5246), -- Intimidating Shout
			-- Arms
			CreateSpellEntry(115804), -- Mortal Wounds
			CreateSpellEntry(208086), -- Colossus Smash
			CreateSpellEntry(215537), -- Trauma
			-- Fury
			CreateSpellEntry(12323), -- Piercing Howl
			CreateSpellEntry(205546), -- Odyn's Fury
			-- Protection
			CreateSpellEntry(1160), -- Demoralizing Shout
			CreateSpellEntry(6343), -- Thunderclap
			CreateSpellEntry(115767), -- Deep Wounds
			CreateSpellEntry(23920), -- Spell Reflection
			CreateSpellEntry(213871), -- Bodyguard
		},
		player = {
			-- Global
			CreateSpellEntry(1719), -- Battle Cry
			CreateSpellEntry(18499), -- Berserker Rage
			CreateSpellEntry(97463), -- Commanding Shout
			CreateSpellEntry(147833), -- Intervene
			-- Shared
			CreateSpellEntry(107574), -- Avatar
			-- Arms
			CreateSpellEntry(118038), -- Die by the Sword
			CreateSpellEntry(207982), -- Focused Rage
			CreateSpellEntry(209706), -- Shattered Defense
			CreateSpellEntry(227847), -- Bladestorm
			-- Fury
			CreateSpellEntry(46924), -- Bladestorm
			CreateSpellEntry(118000), -- Dragon Roar
			CreateSpellEntry(184362), -- Enrage
			CreateSpellEntry(184364), -- Enraged Regeneration
			-- Protection
			CreateSpellEntry(871), -- Shield Wall
			CreateSpellEntry(12975), -- Last Stand
			CreateSpellEntry(23920), -- Spell Reflection
			CreateSpellEntry(132404), -- Shield Block
			CreateSpellEntry(190456), -- Ignore Pain
			CreateSpellEntry(202602), -- Into the Fray
			CreateSpellEntry(203524), -- Neltharion's Fury
		},
		procs = {
			-- Shared
			CreateSpellEntry(202164), -- Bounding Stride
			-- Arms
			CreateSpellEntry(209567), -- Corrupted Blood of Zakajz
			-- Fury
			CreateSpellEntry(200953), -- Berserking
			CreateSpellEntry(200954), -- Battle Scars
			CreateSpellEntry(200986), -- Odyn's Champion
			CreateSpellEntry(202539), -- Frenzy
			CreateSpellEntry(206333), -- Taste for Blood
			CreateSpellEntry(215570), -- Wrecking Ball
			-- Protection
			CreateSpellEntry(188783), -- Might of the Vrykul
			CreateSpellEntry(202289), -- Renewed Fury
			CreateSpellEntry(202573), -- Vengeance: Focused Rage
		},
	},
}
