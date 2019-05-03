local T, C, L, _ = unpack(select(2, ...))
if not C.misc.classtimer == true then return end

local mediaPath = "Interface\\AddOns\\ViksUI\\Media\\Other\\"
local texture = "Interface\\Buttons\\WHITE8x8"
local glowTex = mediaPath.."glowTex"
fontsize = 10
fontsize1 =  10
local buttonTex = mediaPath.."buttontex"

--[[ Configuration functions - DO NOT TOUCH
	id - spell id
	castByAnyone - show if aura wasn't created by player
	color - bar color (nil for default color)
	unitType - 0 all, 1 friendly, 2 enemy
	castSpellId - fill only if you want to see line on bar that indicates if its safe to start casting spell and not clip the last tick, also note that this can be different from aura id
]]--

local CreateSpellEntry = function( id, castByAnyone, color, unitType, castSpellId )
	return { id = id, castByAnyone = castByAnyone, color = color, unitType = unitType or 0, castSpellId = castSpellId };
end

local CreateColor = function( red, green, blue, alpha )
	return { red / 255, green / 255, blue / 255, alpha };
end

local BAR_HEIGHT = 14;
local BAR_SPACING = 1;
local LAYOUT = 4;
local BACKGROUND_ALPHA = 1;
local ICON_POSITION = 0;
local ICON_COLOR = CreateColor( 0, 0, 0, 1 );
local SPARK = true;
local CAST_SEPARATOR = true;
local CAST_SEPARATOR_COLOR = CreateColor( .1,.1,.1,.5 );
local TEXT_MARGIN = 5;
local MASTER_FONT, STACKS_FONT;
MASTER_FONT = { C.media.normal_font, fontsize };
STACKS_FONT = { C.media.normal_font, fontsize1 };
local PERMANENT_AURA_VALUE = 1;
local PLAYER_BAR_COLOR = CreateColor( 70, 70, 150, 1 );
local PLAYER_DEBUFF_COLOR = nil;
local TARGET_BAR_COLOR = CreateColor( 70, 150, 70, 1 );
local TARGET_DEBUFF_COLOR = CreateColor( 150, 70, 70, 1 );
local TRINKET_BAR_COLOR = CreateColor( 150, 150, 70, 1 );
local SORT_DIRECTION = true;
local TENTHS_TRESHOLD = 1

local TRINKET_FILTER = {
	--[[Proccs & Racials]]--
	CreateSpellEntry(2825, true), CreateSpellEntry(32182, true), CreateSpellEntry(80353, true), -- Bloodlust/Heroism/Timewarp
	CreateSpellEntry(90355, true), -- Ancient Hysteria, bloodlust from hunters pet
	CreateSpellEntry(26297), -- Berserking (troll racial)
	CreateSpellEntry(33702), CreateSpellEntry(33697), CreateSpellEntry(20572), -- Blood Fury (orc racial)
	CreateSpellEntry(57933), -- Tricks of Trade (15% dmg buff)
	CreateSpellEntry(121279), -- Lifeblood
	CreateSpellEntry(45861), -- Nitro Boost (Engeneering)
	CreateSpellEntry(68992), -- Darkflight (Worgen Sprint Racial)

	--[[Darkmoon-Trinkets]]--
	CreateSpellEntry(162915), -- Spirit of the Warlords (Skull of War)
	CreateSpellEntry(162913), -- Visions of the Future (Winged Hourglass)
	CreateSpellEntry(162919), -- Nightmare Fire (Sandman's Pouch)
	CreateSpellEntry(162917), -- Strength of Steel (Knight's Badge)

}

local CLASS_FILTERS = {
	DEATHKNIGHT = {
		target = {
			-- Shared
			CreateSpellEntry(45524), -- Chains of Ice
			-- Blood
			CreateSpellEntry(55078), -- Blood Plague
			-- Frost
			CreateSpellEntry(55095), -- Frost Fever
			-- Unholy
			CreateSpellEntry(130736), -- Soul Reaper
			CreateSpellEntry(191587), -- Virulent Plague
			CreateSpellEntry(194310), -- Festering Wounds
			CreateSpellEntry(196782), -- Outbreak
			CreateSpellEntry(221562), -- Asphyxiate
		},
		player = {
			-- Global
			CreateSpellEntry(48707), -- Anti-Magic Shell
			CreateSpellEntry(81256), -- Dancing Rune Weapon
			CreateSpellEntry(49039), -- Lichborne
			CreateSpellEntry(115018), -- Desecrated Ground
			CreateSpellEntry(115989), -- Unholy Blight
			-- Blood
			CreateSpellEntry(55233), -- Vampiric Blood
			CreateSpellEntry(81141), -- Crimson Scourge
			CreateSpellEntry(193249), -- Maw of the Damned
			CreateSpellEntry(193320), -- Maw of the Damned
			CreateSpellEntry(195181), -- Bone Shield
			CreateSpellEntry(194679), -- Rune Tap
			CreateSpellEntry(194844), -- Bonestorm
			CreateSpellEntry(219809), -- Tombstone
			CreateSpellEntry(215377), -- Maw of the Damned
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
			-- Unholy
			CreateSpellEntry(207319), -- Corpse Shield
			CreateSpellEntry(49206), -- Summon Gargoyle
		},
		procs = {
			-- Global
			CreateSpellEntry(53365), -- Unholy Strength
			-- Blood
			CreateSpellEntry(77535), -- Blood Shield
			-- Frost
			-- Unholy
			CreateSpellEntry(51460), -- Runic Corruption
			CreateSpellEntry(81340), -- Sudden Doom
			CreateSpellEntry(207290), -- Unholy Frenzy
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
			CreateSpellEntry(206491), -- Nemesis
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
			-- Havoc
			CreateSpellEntry(162264), -- Metamorphosis (Havoc)
			CreateSpellEntry(188501), -- Spectral Sight
			CreateSpellEntry(196555), -- Netherwalk
			CreateSpellEntry(209426), -- Darkness
			CreateSpellEntry(211048), -- Chaos Blades
			CreateSpellEntry(212800), -- Blur
			-- Vengeance
			CreateSpellEntry(178740), -- Immolation Aura
			CreateSpellEntry(187827), -- Metamorphosis (Vengeance)
			CreateSpellEntry(203819), -- Demon Spikes
			CreateSpellEntry(207693), -- Feast of Souls
			CreateSpellEntry(207810), -- Netherbond
			CreateSpellEntry(218256), -- Empower Wards
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
			-- Balance
			CreateSpellEntry(81261), -- Solar Beam
			CreateSpellEntry(164815), -- Sunfire
			CreateSpellEntry(197637), -- Stellar Empowerment
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
			CreateSpellEntry(42231), -- Hurricane
			CreateSpellEntry(48438), -- Wild Growth
			CreateSpellEntry(48504), -- Living Seed
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
			-- Balance
			CreateSpellEntry(102560), -- Incarnation: Chosen of Elune
			CreateSpellEntry(164545), -- Solar Empowerment
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
			CreateSpellEntry(158792), -- Pulverize
			CreateSpellEntry(192081), -- Ironfur
			CreateSpellEntry(192083), -- Mark of Ursol
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
			CreateSpellEntry(48504), -- Living Seed
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
	HUNTER = {
		target = {
			-- Global
			CreateSpellEntry(131894), -- A Murder of Crows
			-- Shared
			CreateSpellEntry(5116), -- Concussive Shot
			CreateSpellEntry(24335), -- Wyvern Sting
			CreateSpellEntry(34490), -- Silencing Shot
			CreateSpellEntry(117405), -- Binding Shot
			CreateSpellEntry(202797), -- Viper Sting
			CreateSpellEntry(202900), -- Scorpid Sting
			-- Beast Mastery
			CreateSpellEntry(24394), -- Intimidation			
			CreateSpellEntry(202933), -- Spider Sting
			CreateSpellEntry(207094), -- Titan's Thunder
			-- Marksmanship
			CreateSpellEntry(187131), -- Vulnerable
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
		},
		player = {
			-- Global
			CreateSpellEntry(35079, true), -- Misdirection
			CreateSpellEntry(109215), -- Posthaste (Disengage/Harpoon speed burst)
			CreateSpellEntry(186258), -- Aspect of the Cheetah
			CreateSpellEntry(189949), -- Aspect of the Turtle
			-- Shared
			CreateSpellEntry(120360), -- Barrage
			CreateSpellEntry(199483), -- Camouflage
			CreateSpellEntry(202627), -- Catlike Reflexes
			CreateSpellEntry(202748), -- Survival Tactics
			-- Beast Mastery
			CreateSpellEntry(19574), -- Bestial Wrath
			CreateSpellEntry(193530), -- Aspect of the Wild
			-- Marksmanship
			CreateSpellEntry(82921), -- Bombardment
			CreateSpellEntry(190515), -- Survival of the Fittest
			CreateSpellEntry(193526), -- Trueshot
			CreateSpellEntry(193534), -- Steady Focus
			CreateSpellEntry(203155), -- Sniper Shot
			CreateSpellEntry(227272), -- Trick Shot
			-- Survival
			CreateSpellEntry(62305), -- Master's Call
			CreateSpellEntry(186289), -- Aspect of the Eagle
			CreateSpellEntry(190931), -- Mongoose Fury
			CreateSpellEntry(194407), -- Spitting Cobra
		},
		procs = {
			CreateSpellEntry(164857), -- Survivalist
			CreateSpellEntry(185987), -- Hunter's Mark
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
			CreateSpellEntry(32612), -- Invisibility
			CreateSpellEntry(205025), -- Presence of Mind
			CreateSpellEntry(210126), -- Arcane Familiar
			-- Arcane
			CreateSpellEntry(12042), -- Arcane Power
			CreateSpellEntry(12051), -- Evocation
			CreateSpellEntry(110960), -- Greater Invisibility
			CreateSpellEntry(212799), -- Displacement
			-- Fire
			CreateSpellEntry(48108), -- Hot Streak
			CreateSpellEntry(190319), -- Combustion
			--Frost
			CreateSpellEntry(12472), -- Icy Veins
			CreateSpellEntry(195418), -- Chain Reaction
		},
		procs = {
			-- Arcane
			CreateSpellEntry(79683), -- Arcane Missiles!
			CreateSpellEntry(198924), -- Quickening
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
			CreateSpellEntry(140023), -- Ring of Peace
			-- Brewmaster
			CreateSpellEntry(121253), -- Keg Smash
			CreateSpellEntry(196727), -- Provoke
			CreateSpellEntry(196733), -- Special Delivery
			CreateSpellEntry(213063), -- Dark Side of the Moon
			CreateSpellEntry(214326), -- Exploding Keg
			-- Mistweaver
			CreateSpellEntry(116849), -- Life Cocoon
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
			CreateSpellEntry(119611), -- Renewing Mist
			CreateSpellEntry(191840), -- Essence Font
			CreateSpellEntry(197206), -- Uplifting Trance
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
			-- Holy
			CreateSpellEntry(214222), -- Judgement
			CreateSpellEntry(223306), -- Bestow Faith
			-- Protection
			CreateSpellEntry(31935), -- Avenger's Shield
			CreateSpellEntry(204242), -- Consecration
			CreateSpellEntry(204301), -- Blessed Hammer
			-- Retribution
			CreateSpellEntry(183218), -- Hand of Hindrance
			CreateSpellEntry(197277), -- Judgement
			CreateSpellEntry(202270), -- Blade of Wrath
			CreateSpellEntry(205273), -- Wake of Ashes
			CreateSpellEntry(213757), -- Execution Sentence
		},
		player = {
			-- Global
			CreateSpellEntry(642), -- Devine Shield
			CreateSpellEntry(1022), -- Blessing of Protection
			CreateSpellEntry(1044), -- Blessing of Freedom
			CreateSpellEntry(221887), -- Devine Steed
			-- Shared
			CreateSpellEntry(6940), -- Hand of Sacrifice
			CreateSpellEntry(31884), -- Avenging Wrath
			-- Holy
			CreateSpellEntry(498), -- Devine Protection
			CreateSpellEntry(31821), -- Aura Mastery
			CreateSpellEntry(31842), -- Avenging Wrath
			CreateSpellEntry(53563), -- Beacon of Light
			CreateSpellEntry(105809), -- Holy Avenger
			CreateSpellEntry(183415), -- Aura of Mercy
			CreateSpellEntry(183416), -- Aura of Sacrifice
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
			CreateSpellEntry(152262), -- Seraphim
			CreateSpellEntry(204013), -- Blessing of Salvation
			CreateSpellEntry(204018), -- Blessing of Spellwarding
			CreateSpellEntry(204150), -- Aegis of Light
			CreateSpellEntry(209332), -- Painful Truths
			CreateSpellEntry(209388), -- Bulwark of Order
			CreateSpellEntry(209540), -- Light of the Titans
			CreateSpellEntry(204242), -- Consecration
			
			-- Retribution
			CreateSpellEntry(184662), -- Shield of Vengeance
			CreateSpellEntry(202273), -- Seal of Light
			--CreateSpellEntry(203528), -- Greater Blessing of Might
			--CreateSpellEntry(203538), -- Greater Blessing of Kings
			--CreateSpellEntry(203539), -- Greater Blessing of Wisdom
			CreateSpellEntry(205191), -- Eye for an Eye
			CreateSpellEntry(217020), -- Zeal
			CreateSpellEntry(224668), -- Crusade
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
			CreateSpellEntry(186263), -- Shadow Mend
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
			CreateSpellEntry(214121), -- Body and Mind
			CreateSpellEntry(221660), -- Holy Concentration
			-- Discipline
			CreateSpellEntry(33206), -- Pain Suppression
			CreateSpellEntry(194384), -- Atonement
			CreateSpellEntry(152118), -- Clarity of Will
			CreateSpellEntry(196440), -- Purified Resolve
			CreateSpellEntry(204197), -- Purge the Wicked (should replace Shadow Word: Pain when talented)
			CreateSpellEntry(204263), -- Shining Force
			CreateSpellEntry(214621), -- Schism
			CreateSpellEntry(219521), -- Shadow Covenant
			-- Shadow
			CreateSpellEntry(15407), -- Mind Flay
			CreateSpellEntry(34914, false, nil, nil, 34914), -- Vampiric Touch
			CreateSpellEntry(199683), -- Last Word
			CreateSpellEntry(217676), -- Mind Spike
			CreateSpellEntry(226943), -- Mind Bomb
		},
		player = {
			--Global
			CreateSpellEntry(586), -- Fade
			CreateSpellEntry(2096), --Mind Vision
			-- Shared
			CreateSpellEntry(17), -- Power Word: Shield
			CreateSpellEntry(10060), -- Power Infusion			
			CreateSpellEntry(121536), -- Angelic Feather
			CreateSpellEntry(186263), -- Shadow Mend
			-- Holy
			CreateSpellEntry(139), -- Renew			
			CreateSpellEntry(33076), -- Prayer of Mending
			CreateSpellEntry(63735), -- Serendipity
			CreateSpellEntry(64843), -- Divine Hymn
			CreateSpellEntry(64901), -- Symbol of Hope
			CreateSpellEntry(196644), -- Blessing of T'uure
			CreateSpellEntry(196773), -- Inner Focus
			CreateSpellEntry(197341), -- Ray of Hope
			CreateSpellEntry(200183), -- Apotheosis
			CreateSpellEntry(208065), -- Light of T'uure
			CreateSpellEntry(210980), -- Focus in the Light
			CreateSpellEntry(213610), -- Holy Ward
			CreateSpellEntry(214121), -- Body and Mind
			CreateSpellEntry(217941), -- Spirit of the Redeemer
			-- Discipline
			CreateSpellEntry(33206), -- Pain Suppression
			CreateSpellEntry(47536), -- Rapture
			CreateSpellEntry(81700), -- Archangel
			CreateSpellEntry(194384), -- Atonement			
			CreateSpellEntry(152118), -- Clarity of Will
			CreateSpellEntry(197763), -- Borrowed Time
			CreateSpellEntry(197871), -- Dark Archangel
			CreateSpellEntry(198069), -- Power of the Dark Side
			CreateSpellEntry(210027), -- Share in the Light
			CreateSpellEntry(211681), -- Power Word: Fortitude
			CreateSpellEntry(219521), -- Shadow Covenant
			-- Shadow
			CreateSpellEntry(47585), -- Dispersion
			CreateSpellEntry(193173), -- Mania
			CreateSpellEntry(194249), -- Voidform
			CreateSpellEntry(195455), -- Surrender to Madness
			CreateSpellEntry(197937), -- Lingering Insanity
			CreateSpellEntry(199131), -- Pure Shadow
			CreateSpellEntry(199413), -- Edge of Insanity
			CreateSpellEntry(204778), -- Void Shield
			CreateSpellEntry(205065), -- Void Torrent
			CreateSpellEntry(205372), -- Void Ray

		},
		procs = {
			CreateSpellEntry(45243), -- Focused Will
			CreateSpellEntry(88690), -- Surge of Light
			CreateSpellEntry(124430), -- Shadowy Insight
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
			CreateSpellEntry(200803), -- Agonizing Poison
			-- Outlaw
			CreateSpellEntry(1776), -- Gouge
			CreateSpellEntry(1943), -- Rupture
			CreateSpellEntry(185778), -- Shellshocked
			CreateSpellEntry(196937), -- Ghostly Strike
			CreateSpellEntry(199804), -- Between the Eyes
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
			CreateSpellEntry(206237), -- Enveloping Shadows
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
			-- Elemental
			CreateSpellEntry(182387), -- Earthquake
			CreateSpellEntry(188389), -- Flame Shock
			CreateSpellEntry(196840), -- Frost Shock
			CreateSpellEntry(197209), -- Lightning Rod
			-- Enhancer
			CreateSpellEntry(147732), -- Frostbrand Attack
			CreateSpellEntry(188089), -- Earthen Spike
			CreateSpellEntry(197214), -- Sundering
			CreateSpellEntry(197385), -- Fury of Air
			CreateSpellEntry(224125), -- Fiery Jaws
			CreateSpellEntry(224126), -- Frozen Bite
			-- Restoration
			CreateSpellEntry(61295), -- Riptide
			CreateSpellEntry(188838), -- Flame Shock
			CreateSpellEntry(207400), -- Ancestral Vigor
		},
		player = {
			-- Global
			CreateSpellEntry(108271), -- Astral Shift
			CreateSpellEntry(192082), -- Wind Rush
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
			CreateSpellEntry(196834), -- Frostbrand
			CreateSpellEntry(197211), -- Fury of Air
			CreateSpellEntry(198249), -- Elemental Healing
			CreateSpellEntry(198293), -- Wind Strikes
			CreateSpellEntry(198300), -- Gathering Storm
			CreateSpellEntry(201846), -- Stormbringer
			CreateSpellEntry(204945), -- Doom Winds
			CreateSpellEntry(215864), -- Rainfall
			CreateSpellEntry(218825), -- Boulderfist
			-- Restoration
			CreateSpellEntry(53390), -- Tidal Waves
			CreateSpellEntry(61295), -- Riptide
			CreateSpellEntry(73685), -- Unleash Life
			CreateSpellEntry(73920), -- Healing Rain
			CreateSpellEntry(79206), -- Spiritwalker's Grace
			CreateSpellEntry(98007), -- Spiritlink Totem
			CreateSpellEntry(114052), -- Ascendance
			CreateSpellEntry(157504), -- Cloudburst Totem
			CreateSpellEntry(201633), -- Earthen Shield
			CreateSpellEntry(207400), -- Ancestral Vigor
			CreateSpellEntry(207498), -- Ancestral Protection
			CreateSpellEntry(207778), -- Gift of the Queen
			CreateSpellEntry(208205), -- Cumulative Upkeep
			CreateSpellEntry(209950), -- Caress of the Tidemother
		},
		procs = {
			-- Shared
			CreateSpellEntry(77762), -- Lava Surge
			-- Elemental
			CreateSpellEntry(16246), -- Elemental Focus
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
			-- Shared
			CreateSpellEntry(689), -- Drain Life
			-- Affliction
			CreateSpellEntry(172), -- Corruption
			CreateSpellEntry(980), -- Bane of Agony
			CreateSpellEntry(5484), -- Howl of Terror
			CreateSpellEntry(27243, false, nil, nil, 27243), -- Seed of Corruption
			CreateSpellEntry(30108, false, nil, nil, 30108), -- Unstable Affliction
			CreateSpellEntry(48181, false, nil, nil, 48181), -- Haunt
			CreateSpellEntry(63106), -- Siphon Life
			CreateSpellEntry(146739), -- Corruption Debuff
			CreateSpellEntry(198590), -- Drain Soul
			CreateSpellEntry(205178), -- Soul Effigy
			CreateSpellEntry(205179), -- Phantom Singularity
			CreateSpellEntry( 233496 ), CreateSpellEntry( 233497 ), CreateSpellEntry( 233498 ),	CreateSpellEntry( 251502 ), CreateSpellEntry( 233490 ), CreateSpellEntry( 205179 ), -- Phantom Singularity
			-- Demonology
			CreateSpellEntry(603), -- Bane of Doom
			CreateSpellEntry(30213), -- Legion Strike
			CreateSpellEntry(30283), -- Shadowfury
			CreateSpellEntry(205181), -- Shadowflame
			-- Destruction
			CreateSpellEntry(80240), -- Bane of Havoc
			CreateSpellEntry(157736), -- Immolate
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
			CreateSpellEntry(196104), -- Mana Tap
			-- Affliction
			CreateSpellEntry(216695), -- Tormented Souls
			CreateSpellEntry(216708), -- Deadwind Harvester
			-- Demonology
			CreateSpellEntry(171982), -- Demonic Synergy
			CreateSpellEntry(193440), -- Demonwrath
			CreateSpellEntry(196606), -- Shadowy Inspiration
			CreateSpellEntry(205146), -- Demonic Calling
			-- Destruction
			CreateSpellEntry(196546), -- Conflagration of Chaos
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
			-- Shared
			CreateSpellEntry(5246), -- Intimidating Shout
			-- Arms
			CreateSpellEntry(722), -- Rend
			CreateSpellEntry(115804), -- Mortal Wounds
			CreateSpellEntry(208086), -- Colossus Smash
			CreateSpellEntry(215537), -- Trauma
			-- Fury
			CreateSpellEntry(12323), -- Piercing Howl
			CreateSpellEntry(205546), -- Odyn's Fury
			-- Protection
			CreateSpellEntry(1160), -- Demoralizing Shout
			CreateSpellEntry(6343), -- Thunderclap
			CreateSpellEntry(7922), -- Warbringer
			CreateSpellEntry(115767), -- Deep Wounds
		},
		player = {
			-- Global
			CreateSpellEntry(1719), -- Battle Cry
			CreateSpellEntry(18499), -- Berserker Rage
			CreateSpellEntry(97463), -- Commanding Shout
			-- Shared
			CreateSpellEntry(107574), -- Avatar
			-- Arms
			CreateSpellEntry(118038), -- Die by the Sword
			CreateSpellEntry(188923), -- Cleave
			CreateSpellEntry(207982), -- Focused Rage
			CreateSpellEntry(209706), -- Shattered Defense
			CreateSpellEntry(227847), -- Bladestorm
			-- Fury
			CreateSpellEntry(12292), -- Bloodbath
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
			CreateSpellEntry(204488), -- Focused Rage
			CreateSpellEntry(227744), -- Ravager
		},
		procs = {
			-- Shared
			CreateSpellEntry(202164), -- Bounding Stride
			-- Arms
			CreateSpellEntry(60503), -- Overpower
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
};

local CreateUnitAuraDataSource
do
	local auraTypes = { 'HELPFUL', 'HARMFUL' }

	-- private
	local CheckFilter = function(self, id, caster, filter)
		if (filter == nil) then return false end
		local byPlayer = caster == 'player' or caster == 'pet' or caster == 'vehicle'
		for _, v in ipairs(filter) do
			if (v.id == id and (v.castByAnyone or byPlayer)) then return v end
		end
		return false
	end

	local CheckUnit = function(self, unit, filter, result)
		if (not UnitExists(unit)) then return 0 end
		local unitIsFriend = UnitIsFriend('player', unit)
		for _, auraType in ipairs(auraTypes) do
			local isDebuff = auraType == 'HARMFUL'

			for index = 1, 40 do
				local name, texture, stacks, _, duration, expirationTime, caster, _, _, spellId = UnitAura(unit, index, auraType)
				if (name == nil) then break end
				local filterInfo = CheckFilter(self, spellId, caster, filter)
				if (filterInfo and (filterInfo.unitType ~= 1 or unitIsFriend) and (filterInfo.unitType ~= 2 or not unitIsFriend)) then
					filterInfo.name = name
					filterInfo.texture = texture
					filterInfo.duration = duration
					filterInfo.expirationTime = expirationTime
					filterInfo.stacks = stacks
					filterInfo.unit = unit
					filterInfo.isDebuff = isDebuff
					table.insert(result, filterInfo)
				end
			end
		end
	end

	-- public
	local Update = function(self)
		local result = self.table
		for index = 1, #result do table.remove(result) end
		CheckUnit(self, self.unit, self.filter, result)
		if (self.includePlayer) then CheckUnit(self, 'player', self.playerFilter, result) end
		self.table = result
	end

	local SetSortDirection = function(self, descending) self.sortDirection = descending end
	local GetSortDirection = function(self) return self.sortDirection end

	local Sort = function(self)
		local direction = self.sortDirection
		local time = GetTime()
		local sorted
		repeat
			sorted = true
			for key, value in pairs(self.table) do
				local nextKey = key + 1
				local nextValue = self.table[ nextKey ]
				if (nextValue == nil) then break end
				local currentRemaining = value.expirationTime == 0 and 4294967295 or math.max(value.expirationTime - time, 0)
				local nextRemaining = nextValue.expirationTime == 0 and 4294967295 or math.max(nextValue.expirationTime - time, 0)
				if ((direction and currentRemaining < nextRemaining) or (not direction and currentRemaining > nextRemaining)) then
					self.table[ key ] = nextValue
					self.table[ nextKey ] = value
					sorted = false
				end
			end
		until (sorted == true)
	end

	local Get = function(self) return self.table end
	local Count = function(self) return #self.table end

	local AddFilter = function(self, filter, defaultColor, debuffColor)
		if (filter == nil) then return end
		for _, v in pairs(filter) do
			local clone = { }
			clone.id = v.id
			clone.castByAnyone = v.castByAnyone
			clone.color = v.color
			clone.unitType = v.unitType
			clone.castSpellId = v.castSpellId
			clone.defaultColor = defaultColor
			clone.debuffColor = debuffColor
			table.insert(self.filter, clone)
		end
	end

	local AddPlayerFilter = function(self, filter, defaultColor, debuffColor)
		if (filter == nil) then return end
		for _, v in pairs(filter) do
			local clone = { }
			clone.id = v.id
			clone.castByAnyone = v.castByAnyone
			clone.color = v.color
			clone.unitType = v.unitType
			clone.castSpellId = v.castSpellId
			clone.defaultColor = defaultColor
			clone.debuffColor = debuffColor
			table.insert(self.playerFilter, clone)
		end
	end

	local GetUnit = function(self) return self.unit end
	local GetIncludePlayer = function(self) return self.includePlayer end
	local SetIncludePlayer = function(self, value) self.includePlayer = value end

	-- constructor
	CreateUnitAuraDataSource = function(unit)
		local result = {}
		result.Sort = Sort
		result.Update = Update
		result.Get = Get
		result.Count = Count
		result.SetSortDirection = SetSortDirection
		result.GetSortDirection = GetSortDirection
		result.AddFilter = AddFilter
		result.AddPlayerFilter = AddPlayerFilter
		result.GetUnit = GetUnit
		result.SetIncludePlayer = SetIncludePlayer
		result.GetIncludePlayer = GetIncludePlayer
		result.unit = unit
		result.includePlayer = false
		result.filter = {}
		result.playerFilter = {}
		result.table = {}
		return result
	end
end

local CreateFramedTexture
do
	--public
	local SetTexture = function(self, ...) return self.texture:SetTexture(...) end
	local GetTexture = function(self) return self.texture:GetTexture() end
	local GetTexCoord = function(self) return self.texture:GetTexCoord() end
	local SetTexCoord = function(self, ...) return self.texture:SetTexCoord(...) end
	local SetBorderColor = function(self, ...) return self.border:SetVertexColor(...) end
	
	-- constructor
	CreateFramedTexture = function(parent)
		local result = parent:CreateTexture( nil, "BACKGROUND", nil );
		local border = parent:CreateTexture( nil, "BORDER", nil );
		local background = parent:CreateTexture( nil, "ARTWORK", nil );
		local texture = parent:CreateTexture( nil, "OVERLAY", nil );		
		
		result:SetColorTexture(unpack(C.media.backdrop_color));
		border:SetColorTexture(unpack(C.media.border_color));
		background:SetColorTexture(unpack(C.media.backdrop_color));
		
		border:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
		border:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
		
		background:SetPoint( "TOPLEFT", border, "TOPLEFT", 1, -1 );
		background:SetPoint( "BOTTOMRIGHT", border, "BOTTOMRIGHT", -1, 1 );

		texture:SetPoint( "TOPLEFT", background, "TOPLEFT", 1, -1 );
		texture:SetPoint( "BOTTOMRIGHT", background, "BOTTOMRIGHT", -1, 1 );
			
		result.border = border;
		result.background = background;
		result.texture = texture;
			
		result.SetBorderColor = SetBorderColor;
		
		result.SetTexture = SetTexture;
		result.GetTexture = GetTexture;
		result.SetTexCoord = SetTexCoord;
		result.GetTexCoord = GetTexCoord;
			
		return result;
	end
end

local CreateAuraBarFrame;
do
	-- classes
	local CreateAuraBar;
	do
		-- private 
		local OnUpdate = function( self, elapsed )	
			local time = GetTime();
		
			if ( time > self.expirationTime ) then
				self.bar:SetScript( "OnUpdate", nil );
				self.bar:SetValue( 0 );
				self.time:SetText( "" );
				
				local spark = self.spark;
				if ( spark ) then			
					spark:Hide();
				end
			else
				local remaining = self.expirationTime - time;
				self.bar:SetValue( remaining );
				
				local timeText = "";
				if ( remaining >= 3600 ) then
					timeText = tostring( math.floor( remaining / 3600 ) ) .. "h";
				elseif ( remaining >= 60 ) then
					timeText = tostring( math.floor( remaining / 60 ) ) .. "m";
				elseif ( remaining > TENTHS_TRESHOLD ) then
					timeText = tostring( math.floor( remaining ) );
				elseif ( remaining > 0 ) then
					timeText = tostring( math.floor( remaining * 10 ) / 10 );
				end
				self.time:SetText( timeText );
				
				local barWidth = self.bar:GetWidth();
				
				local spark = self.spark;
				if ( spark ) then			
					spark:SetPoint( "CENTER", self.bar, "LEFT", barWidth * remaining / self.duration, 0 );
				end
				
				local castSeparator = self.castSeparator;
				if ( castSeparator and self.castSpellId ) then
					local _, _, _, castTime, _, _ = GetSpellInfo(self.castSpellId)

					castTime = castTime / 1000;
					if ( castTime and remaining > castTime ) then
						castSeparator:SetPoint( "CENTER", self.bar, "LEFT", barWidth * ( remaining - castTime ) / self.duration, 0 );
					else
						castSeparator:Hide();
					end
				end
			end
		end
		
		-- public
		local SetIcon = function( self, icon )
			if ( not self.icon ) then return; end
			
			self.icon:SetTexture( icon );
		end
		
		local SetTime = function( self, expirationTime, duration )
			self.expirationTime = expirationTime;
			self.duration = duration;
			
			if ( expirationTime > 0 and duration > 0 ) then		
				self.bar:SetMinMaxValues( 0, duration );
				OnUpdate( self, 0 );
		
				local spark = self.spark;
				if ( spark ) then 
					spark:Show();
				end
		
				self:SetScript( "OnUpdate", OnUpdate );
			else
				self.bar:SetMinMaxValues( 0, 1 );
				self.bar:SetValue( PERMANENT_AURA_VALUE );
				self.time:SetText( "" );
				
				local spark = self.spark;
				if ( spark ) then 
					spark:Hide();
				end
				
				self:SetScript( "OnUpdate", nil );
			end
		end
		
		local SetName = function( self, name )
			self.name:SetText( name );
		end
		
		local SetStacks = function( self, stacks )
			if ( not self.stacks ) then
				if ( stacks ~= nil and stacks > 1 ) then
					local name = self.name;
					
					name:SetText( tostring( stacks ) .. "  " .. name:GetText() );
				end
			else			
				if ( stacks ~= nil and stacks > 1 ) then
					self.stacks:SetText( stacks );
				else
					self.stacks:SetText( "" );
				end
			end
		end
		
		local SetColor = function( self, color )
			self.bar:SetStatusBarColor( unpack( color ) );
		end
		
		local SetCastSpellId = function( self, id )
			self.castSpellId = id;
			
			local castSeparator = self.castSeparator;
			if ( castSeparator ) then
				if ( id ) then
					self.castSeparator:Show();
				else
					self.castSeparator:Hide();
				end
			end
		end
		
		local SetAuraInfo = function( self, auraInfo )
			self:SetName( auraInfo.name );
			self:SetIcon( auraInfo.texture );	
			self:SetTime( auraInfo.expirationTime, auraInfo.duration );
			self:SetStacks( auraInfo.stacks );
			self:SetCastSpellId( auraInfo.castSpellId );
		end
		
		-- constructor
		CreateAuraBar = function( parent )
			local result = CreateFrame( "Frame", nil, parent, nil );






			if ( bit.band( ICON_POSITION, 4 ) == 0 ) then		
				local icon = CreateFramedTexture( result, "ARTWORK" );
				icon:SetTexCoord( 0.15, 0.85, 0.15, 0.85 );
				icon:SetBorderColor( unpack( ICON_COLOR ) );
				
				local iconAnchor1;
				local iconAnchor2;
				local iconOffset;
				if ( bit.band( ICON_POSITION, 1 ) == 1 ) then
					iconAnchor1 = "TOPLEFT";
					iconAnchor2 = "TOPRIGHT";
					iconOffset = 1;
				else
					iconAnchor1 = "TOPRIGHT";
					iconAnchor2 = "TOPLEFT";
					iconOffset = -1;
				end			
				
				if ( bit.band( ICON_POSITION, 2 ) == 2 ) then
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * 6, 1 );
				else
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * ( -BAR_HEIGHT - 1 ), 1 );
				end			
				icon:SetWidth( BAR_HEIGHT + 2 );
				icon:SetHeight( BAR_HEIGHT + 2 );	

				result.icon = icon;
				
				local stacks = result:CreateFontString( nil, "OVERLAY", nil );
				stacks:SetFont( unpack( STACKS_FONT ) );
				stacks:SetShadowColor( 0, 0, 0 );
				stacks:SetShadowOffset( 1.25, -1.25 );
				stacks:SetJustifyH( "RIGHT" );
				stacks:SetJustifyV( "BOTTOM" );
				stacks:SetPoint( "TOPLEFT", icon, "TOPLEFT", 0, 0 );
				stacks:SetPoint( "BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 3 );
				result.stacks = stacks;
			end
			
			local bar = CreateFrame( "StatusBar", nil, result, nil );
			bar:SetStatusBarTexture( texture );
			if ( bit.band( ICON_POSITION, 2 ) == 2 or bit.band( ICON_POSITION, 4 ) == 4 ) then
				bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
				bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
			else
				if ( bit.band( ICON_POSITION, 1 ) == 1 ) then
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", -BAR_HEIGHT - 1, 0 );
				else
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", BAR_HEIGHT + 1, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );					
				end	
			end
			result.bar = bar;
			
			if ( SPARK ) then
				local spark = bar:CreateTexture( nil, "OVERLAY", nil );
				spark:SetTexture( [[Interface\CastingBar\UI-CastingBar-Spark]] );
				spark:SetWidth( 12 );
				spark:SetBlendMode( "ADD" );
				spark:Show();
				result.spark = spark;
			end
			
			if ( CAST_SEPARATOR ) then
				local castSeparator = bar:CreateTexture( nil, "OVERLAY", nil );
				castSeparator:SetTexture( unpack( CAST_SEPARATOR_COLOR ) );
				castSeparator:SetWidth( 1 );
				castSeparator:SetHeight( BAR_HEIGHT );
				castSeparator:Show();
				result.castSeparator = castSeparator;
			end
						
			local name = bar:CreateFontString( nil, "OVERLAY", nil );
			name:SetFont( unpack( MASTER_FONT ) );
			name:SetJustifyH( "LEFT" );
			name:SetShadowColor( 0, 0, 0 );
			name:SetShadowOffset( 1.25, -1.25 );
			name:SetPoint( "TOPLEFT", bar, "TOPLEFT", TEXT_MARGIN, 0 );
			name:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -45, 2 );
			result.name = name;
			
			local time = bar:CreateFontString( nil, "OVERLAY", nil );
			time:SetFont( unpack( MASTER_FONT ) );
			time:SetJustifyH( "RIGHT" );
			time:SetShadowColor( 0, 0, 0 );
			time:SetShadowOffset( 1.25, -1.25 );
			time:SetPoint( "TOPLEFT", name, "TOPRIGHT", 0, 0 );
			time:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -TEXT_MARGIN, 2 );
			result.time = time;
			
			result.SetIcon = SetIcon;
			result.SetTime = SetTime;
			result.SetName = SetName;
			result.SetStacks = SetStacks;
			result.SetAuraInfo = SetAuraInfo;
			result.SetColor = SetColor;
			result.SetCastSpellId = SetCastSpellId;
			
			return result;
		end
	end

	-- private
	local SetAuraBar = function( self, index, auraInfo )
		local line = self.lines[ index ]
		if ( line == nil ) then
			line = CreateAuraBar( self );
			if ( index == 1 ) then
				line:SetPoint( "TOPLEFT", self, "BOTTOMLEFT", 0, BAR_HEIGHT );
				line:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0 );
			else
				local anchor = self.lines[ index - 1 ];
				line:SetPoint( "TOPLEFT", anchor, "TOPLEFT", 0, BAR_HEIGHT + BAR_SPACING );
				line:SetPoint( "BOTTOMRIGHT", anchor, "TOPRIGHT", 0, BAR_SPACING );
			end
			tinsert( self.lines, index, line );
		end	
		
		line:SetAuraInfo( auraInfo );
		if ( auraInfo.color ) then
			line:SetColor( auraInfo.color );
		elseif ( auraInfo.debuffColor and auraInfo.isDebuff ) then
			line:SetColor( auraInfo.debuffColor );
		elseif ( auraInfo.defaultColor ) then
			line:SetColor( auraInfo.defaultColor );
		end
		
		line:Show();
	end
	
	local function OnUnitAura( self, unit )
		if ( unit ~= self.unit and ( self.dataSource:GetIncludePlayer() == false or unit ~= "player" ) ) then
			return;
		end
		
		self:Render();
	end
	
	local function OnPlayerTargetChanged( self, method )
		self:Render();
	end
	
	local function OnPlayerEnteringWorld( self )
		self:Render();
	end
	
	local function OnEvent( self, event, ... )
		if ( event == "UNIT_AURA" ) then
			OnUnitAura( self, ... );
		elseif ( event == "PLAYER_TARGET_CHANGED" ) then
			OnPlayerTargetChanged( self, ... );
		elseif ( event == "PLAYER_ENTERING_WORLD" ) then
			OnPlayerEnteringWorld( self );
		elseif ( event == "PLAYER_TALENT_UPDATE" ) then
			OnPlayerEnteringWorld( self );
		else
			error( "Unhandled event " .. event );
		end
	end
	
	-- public
	local function Render( self )
		local dataSource = self.dataSource;	

		dataSource:Update();
		dataSource:Sort();
		
		local count = dataSource:Count();



		for index, auraInfo in ipairs( dataSource:Get() ) do
			SetAuraBar( self, index, auraInfo );
		end
		
		for index = count + 1, 80 do
			local line = self.lines[ index ];
			if ( line == nil or not line:IsShown() ) then
				break;
			end
			line:Hide();
		end
		
		if ( count > 0 ) then
			self:SetHeight( ( BAR_HEIGHT + BAR_SPACING ) * count - BAR_SPACING );
			self:Show();
		else
			self:Hide();
			self:SetHeight( self.hiddenHeight or 1 );
		end
	end
	
	local function SetHiddenHeight( self, height )
		self.hiddenHeight = height;
	end

	-- constructor
	CreateAuraBarFrame = function( dataSource, parent )
		local result = CreateFrame( "Frame", nil, parent, nil );
		local unit = dataSource:GetUnit();
		
		result.unit = unit;
		
		result.lines = { };		
		result.dataSource = dataSource;
		
		local background = result:CreateTexture( nil, "BACKGROUND", nil );
		background:SetAlpha( BACKGROUND_ALPHA );
		background:SetTexture( texture );
		background:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
		background:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
		background:SetVertexColor( .1,.1,.1,1 );
		result.background = background;
		
		local border = CreateFrame( "Frame", nil, result, nil );
		border:SetAlpha( BACKGROUND_ALPHA );
		border:SetFrameStrata( "BACKGROUND" );
		border:SetBackdrop( {
			edgeFile = glowTex, edgeSize = 5,
			insets = { left = 3, right = 3, top = 3, bottom = 3 }
		} );
		border:SetBackdropColor( 0, 0, 0, 0 );
		border:SetBackdropBorderColor( 0, 0, 0 );
		border:SetPoint( "TOPLEFT", result, "TOPLEFT", -5, 5 );
		border:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 5, -5 );
		result.border = border;		
		frame1px1(border)
		result:RegisterEvent( "PLAYER_ENTERING_WORLD" );
		result:RegisterEvent( "UNIT_AURA" );
		if ( unit == "target" ) then
			result:RegisterEvent( "PLAYER_TARGET_CHANGED" );
		end
		
		result:SetScript( "OnEvent", OnEvent );
		
		result.Render = Render;
		result.SetHiddenHeight = SetHiddenHeight;
		
		return result;
	end
end

--local _, playerClass = UnitClass( "player" );
local classFilter = CLASS_FILTERS[ T.class ];
classtimerload = CreateFrame("Frame")
classtimerload:RegisterEvent("PLAYER_LOGIN")
classtimerload:SetScript("OnEvent", function(self, event, addon)
if ( LAYOUT == 4 ) then
	local yOffset = 11;

	local targetDataSource = CreateUnitAuraDataSource( "target" );
	local playerDataSource = CreateUnitAuraDataSource( "player" );
	local trinketDataSource = CreateUnitAuraDataSource( "player" );
	
	targetDataSource:SetSortDirection( SORT_DIRECTION );
	playerDataSource:SetSortDirection( SORT_DIRECTION );
	trinketDataSource:SetSortDirection( SORT_DIRECTION );
	
	if ( classFilter ) then
		targetDataSource:AddFilter( classFilter.target, TARGET_BAR_COLOR, TARGET_DEBUFF_COLOR );		
		playerDataSource:AddFilter( classFilter.player, PLAYER_BAR_COLOR, PLAYER_DEBUFF_COLOR );
		trinketDataSource:AddFilter( classFilter.procs, TRINKET_BAR_COLOR );
	end
	trinketDataSource:AddFilter( TRINKET_FILTER, TRINKET_BAR_COLOR );

	local playerFrame = CreateAuraBarFrame( playerDataSource,  oUF_Player );
	playerFrame:SetHiddenHeight( -yOffset );
	if (T.class == "DEATHKNIGHT" or T.class == "SHAMAN" or T.class == "WARLOCK" or T.class == "MONK") then
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20 );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20 );
	else
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 8 );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 8 );
	end
	if (T.class == "ROGUE" and C.unitframe_class_bar.combo_old ~= true) then
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20 );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20 );
	else
		playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 8 );
		playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 8 );
	end
	if ( T.class == "PALADIN") then
		if GetSpecialization() == 3 then
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20 );
		else
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 8 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 8 );
		end
	end
	if ( T.class == "DRUID" and C.unitframe_class_bar.combo_old ~= true) then
		if GetSpecialization() == 2 then
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20 );
		else
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 8 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 8 );
		end
	end
	if ( T.class == "MAGE") then
		if GetSpecialization() == 1 and C.unitframe_class_bar.arcane then
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20 );
		else
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 8 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 8 );
		end
	end
	playerFrame:Show();

	local trinketFrame = CreateAuraBarFrame( trinketDataSource,  oUF_Player );
	trinketFrame:SetHiddenHeight( -yOffset );
	trinketFrame:SetPoint( "BOTTOMLEFT", playerFrame, "TOPLEFT", 0, 10 );
	trinketFrame:SetPoint( "BOTTOMRIGHT", playerFrame, "TOPRIGHT", 0, 10 );
	trinketFrame:Show();
	
	local targetFrame = CreateAuraBarFrame( targetDataSource,  oUF_ViksTarget );
		if ((T.class == "DRUID" or T.class == "ROGUE") and C.unitframe_class_bar.combo == true and C.unitframe_class_bar.combo_old == true) then
			targetFrame:SetPoint( "BOTTOMLEFT",  oUF_ViksTarget, "TOPLEFT", 2, 20);
			targetFrame:SetPoint( "BOTTOMRIGHT",  oUF_ViksTarget, "TOPRIGHT", -2, 20);
		else
			targetFrame:SetPoint( "BOTTOMLEFT",  oUF_ViksTarget, "TOPLEFT", 2, 8);
			targetFrame:SetPoint( "BOTTOMRIGHT",  oUF_ViksTarget, "TOPRIGHT", -2, 8);
		end
	targetFrame:Show();
else
	error( "Undefined layout " .. tostring( LAYOUT ) );
end
classtimerload:UnregisterEvent("PLAYER_LOGIN")
classtimerload:SetScript("OnEvent", nil)
end)