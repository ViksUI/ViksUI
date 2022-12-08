local T, C, L, _ = unpack(select(2, ...))
	
T.PlateDangerous = { --NpcColor_HighPri /Blue Hex 1242b0
	----- Mists of Tirna Scithe -----
	["167111"] = "Interrupt(!!): Stimulate Resistance (AoE absorb, purgeable)".. "\n".. "Interrupt(!!):Stiumlate Regeneration (large AoE heal)", -- Spinemaw Staghorn
	["164920"] = "Dispel: Soul Split (Increased Damage Taken, DANGEROUS)", -- Drust Soulcleaver
	----- De Other Side -----
	["169905"] = "Soothe Undying Rage", -- Risen Warlord
	["167962"] = "LOS Haywire (Large AoE damage)",	-- Defunct Dental Drill		
	["164873"] = "Very large AoE".. "\n".. "small missiles that deal damage on impact", -- Runestag Elderhorn
	["168942"] = "Purge/Steal (!!): Death's Embrace (100% haste)".. "\n".. "Erupting Darkness is a line knockback", -- Death Speaker
	["170572"] = "Interrupt (!!): Lightning Discharge (AoE Nuke)".. "\n".. "Healing Wave (A heal, in wave form)".. "\n".. "Hex (ST CC)", -- Atal'ai Hoodoo Hexxer
	["171343"] = "Soothe: Angering Shriek (AoE dmg increase)".. "\n".. "Stacks a debuff on the tank", -- Bladebeak Matriarch
	["168992"] = "Dodge the little purple flowers".. "\n".. "You can also stun the cast (Dark Lotus)".. "\n".. "DK can use Controll Undead on them for high dps gain", -- Risen Cultist
	----- Sanguine Depths -----
	["162039"] = "Interrupt (!): Wrack Soul (Dispellable DoT)".. "\n".. "Interrupt (!!): Curse of Suppression (5s silence)", -- Wicked Oppressor
	["171448"] = "Avoid the big red traps", -- Dreadful Huntmaster
	----- Halls of Atonement -----
	["164557"] = "Thrash is a large AoE damage ability (40y)".. "\n".. "Can be outranged.", -- Shard of Halkias
	["164562"] = "Stun Interrupt (!!): Loyal Beasts ".. "\n".. "Large enrage effect, soothable)", -- Depraved Houndmaster
	["167612"] = "Dispel (!!): Stony Veins. Kills at 10 stacks".. "\n".. "Interrupt: Turn to Stone", -- Stoneborn Reaver
	----- Plaguefall -----
	["164737"] = "Will hide Stealthlings somewhere".. "\n".. "AoE CC them or they'll hard nuke a random player", -- Brood Ambusher
	["168572"] = "Stunable Bladestorm (60y)", -- Fungi Stormer
	["169159"] = "Explodes on death. Hits enemy mobs!", -- Unstable Canister
	["164707"] = "Reduces nearby enemy damage taken by 75%", -- Congealed Slime
	----- Theater of Pain -----
	["167998"] = "Soulstorm is a massive AoE. Defensives and healing CDs here".. "\n".. "Dispel (Curse): Shadow Vulnerability.", --Portal Guardian
	["170838"] = "Soothe: Death Wish ".. "\n".. "(+20% dmg done, +20% phys dmg taken)", -- Unyielding Contender
	["164506"] = "Gives allies an AoE damage reduction aura.", -- Ancient Captain
	["174210"] = "Interrupt (!!): Withering Discharge".. "\n".. "(AoE disease that reduces dam / healing)", -- Blighted Sludge-Spewer
	----- Necrotic Wake -----
	["165824"] = "Dodge: Death Orbs (silence + dam)".. "\n".. "Purge / Steal: Dark Shroud (Phys immunity, AoE damage)", -- Nar'zudah	
	["165137"] = "Stacking DoT that increases over time".. "\n".. "When dispelled it resets to 0 and jumps target.", -- Zolramus Gatekeeper
	["163121"] = "Stun Interrupt: Meat Shield (absorb)".. "\n".. "Soothe: Seething Rage (atk spd, stacks)", -- Stitched Vanguard
	----- Spires of Ascension -----
	["168318"] = "Interrupt (!!): Rebellious Fist (AoE)".. "\n".. "Burst mob during Recharge Anima to break shield.", -- Forsworn Goliath
	["168681"] = "AoE DMG every 3".. "\n".. "drops void zones on the ground.", -- Forsworn Helion
	["168418"] = "Interrupt: Dark Lash (tank dmg)".. "\n".. "Interrupt: Internal Strife (DoT on random players that AoEs", -- Forsworn Inquisitor
	----- Torghast -----
	["155828"] = "Interrupt (!!): Terrifying Roar (Fear)", -- Runecarved Colossus
	["172005"] = "Interrupt (!!): Terrifying Roar (Fear)", -- Furrowed Colossus
	["168098"] = "Interrupt (!!): Fear", -- Empowered Coldheart Agent
	["156212"] = "Interrupt (!!): Fear", -- Coldheart Agent
	----- Tazavesh, the Veiled Market -----
	["178392"] = "Interrupt (!!): Spark Burn".. "\n".. "Also: Glyph of Restraint places a dispellable DoT. Ticks very hard", -- Gatewarden Zo'mazz
	["179841"] = "Interrupt (!!): Hyperlight Salvo (Big ST damage on random player)".. "\n".. "Tank can intercept it", -- Sparkcaster
	["180429"] = "Summon a little star. Blow up your group. Kill it quickly".. "\n".. "Drifting Star: Circle behind mob", -- Adorned Starseer
	["179386"] = "Dodge: Sword Toss. HEAVY, channeled AoE damage in a random direction.", -- Corsair Officer
	["180431"] = "Interrupt (!!): Unstable Rift (big AoE damage)", -- Focused Ritualist
	-- Lower Karazhan High Pri
	["114627"] = "Interrupt: Terrifying Wail".. "\n".. "Dispel: Cursed Touch", -- Shrieking Terror (spirit)
	["114796"] = "Interrupt: Banshee Wail".. "\n".. "Dispel anyone near 100 stacks to avoid MC", -- Wholesome Hostess
	-- Grimrail Depot High Pri
	["89064"] = "Kill to get Blackrock Grenades".. "\n".. "Deals heavy aoe dmg", -- Grom'kar Grenadier
	["82590"] = "Avoid arcane pool".. "\n".. "Can stun Arcane Blitz", -- Grimrail Scout
	-- Operation Mechagon: Junkyard High Pri
	["150165"] = "Interrupt: Slimebolt", -- 
	["150292"] = "DODGE: Rapid Fire cast after a Charge", -- Mechagon Cavalry 
	-- Court of Stars
	["104295"] = "Interrupt: All casts. Use AoE stuns and kill quickly", -- Blazing Imp
	["104247"] = "Interrupt: Nightfall Orb", -- Duskwatch Arcanist
	["104300"] = "Dispel: Bewitch", -- Shadow Mistress
	-- Shadowmoon Burial Ground
	["75713"] = "ToDo", -- Shadowmoon Bone-Mender
	["76446"] = "ToDo", -- Shadowmoon Enslaver
	-- The Nokhud Offensive
	["195878"] = "ToDo", -- Ukhel Beastcaller
	["195842"] = "ToDo", -- Ukhel Corruptor
	["195851"] = "ToDo", -- Ukhel Deathspeaker
	-- Halls of Valor
	["95834"] = "Interrupts: Holy Radiance > Rune of Healing", -- Valarjar Mystic
	["96664"] = "Interrupts: Etch > Shattered Rune", -- Valarjar Runecarver
	-- Algeth'ar Academy
	["196798"] = "ToDo", -- Corrupted Manafiend
	-- The Azure Vault
	["187154"] = "Interrupt: Heavy Tome (tank damage)", -- Unstable Curator
	["187155"] = "Interrupt: Icy Bindings to avoid the groupwide root", -- Rune Seal Keeper
	-- Ruby Life Pools
	["197985"] = "ToDo", -- Flame Channeler
	["188067"] = "ToDo", -- Flashfrost Chillweaver
	["190207"] = "ToDo", -- Primalist Cinderweaver
	["198047"] = "ToDo", -- Tempest Channeler
	["197535"] = "ToDo", -- High Channeler Ryvati
	["195119"] = "ToDo", -- Primalist Shockcaster
	-- Halls of Infusion
	["190368"] = "ToDo", -- Flamecaller Aymi
	-- Brackenhide Hollow
	["185656"] = "Interrupt Decay Surge".. "\n".. "Dodge the Rotting Surge puddles", -- Filth Caller
	["187224"] = "Spread at least 5 yards".. "\n".. "To avoid spreading Withering Contagion".. "\n".. "Run away from Siphon Decay", -- Vile Rothexer
	-- Neltharus
	["193944"] = "Interrupt: Lava Bolt".. "\n".. "ALL: Break Molten Barrier ASAP to stop Lava Spawns and to interupt again", -- Qalashi Lavamancer
	-- Halls of Infusion
	["190345"] = "Interrupt: Earth Shield, healing random npc", -- Primalist Geomancer
	["190348"] = "Interrupt: Blasting Gust, 40y AOE ".. "\n".. "Note: Tailwind aura. buffs other none boss npc", -- Primalist Ravager
	["199037"] = "Interrupt: Elemental Focus ".. "\n".. "Will cast Chain Lighning if fail to interrupt", -- Primalist Shocktrooper
	["190368"] = "Interrupt: Pyretic Burst ".. "\n".. "Cauterize, selfheals ".. "\n".. "Dodge: Molten Subduction", -- Flamecaller Aymi
	["190371"] = "Interrupt: Rumbling Earth, AOE dmg and stun 8yard", -- Primalist Earthshaker
	["190373"] = "Interrupt: Thunderstorm ".. "\n".. "Note: Primal Affinity lets Gusting Proto-Dragon cast stun", -- Primalist Galesinger
	["190407"] = "At 20% Interrupt: Tidal Divergence ".. "\n".. "", -- Aqua Rager
	["190405"] = "Interrupt: Aqueous Barrier (absorb shield) ".. "\n".. "Dodge: Flash Flood, AOE", -- Infuser Sariya
}

T.PlateImportant = { -- NpcColor_SemiPri / Baby Blue color, Hex 65cccc   - Mobs that have spells that should be tracked/interupted.
	----- Mists of Tirna Scithe -----
	["164921"] = "Interrupt(!): Harvest Essence ".. "\n".. "(AoE Channel + Heal", -- Drust Harvester
	["166299"] = "Interrupt(!): Nourish the Forest ".. "\n".. "(large AoE HoT, can also be purged / spellstolen", -- Mistveil Tender
	["166275"] = "Interrupt(!!): Bramblethorn Coat ".. "\n".. "(shield that AoE roots when broken)", -- Mistveil Shaper
	----- De Other Side -----
	["170490"] = "Interrupt (!) Heal".. "\n".. "Dispel the Shadow Word: Pain", -- Atal'ai High Priest
	["167965"] = "Interrupt (!) Self-Cleaning Cycle", -- Lubricator
	----- Sanguine Depths -----
	["166396"] = "Stun Interrupt: Animate Weapon", -- Noble Skirmisher
	["165076"] = "Interrupt Engorge".."\n".."(Explodes on death x Engorge stacks", -- Gluttonous Tick
	["172265"] = "Interrupt (!): Explosive Anger".. "\n".. "(AoE damage, does increase player dmg)", -- Remnant of Fury
	----- Halls of Atonement -----
	["165529"] = "Interrupt (!!): Collect Sins (Add summon)".. "\n".. "Interrupt (!): Siphon Life (health drain)", -- Depraved Collector /imp
	["165414"] = "Interrupt (!): Curse of Obliteration".. "\n".. "Interrupt (!): Wicked Bolt (high fort keys)", -- Depraved Obliterator /imp
	["167610"] = "Micro stun random", -- Stonefiend Anklebiter /imp?
	----- Plaguefall -----
	["163882"] = "Interrupt: Creepy Crawlers (summons adds)", -- Decaying Flesh Giant
	["168153"] = "Frontal knock back", -- Plagueroc
	["168396"] = "Summon oozes that run to him and heal", -- Plaguebelcher
	["168578"] = "Interrupt (!): Wonder Grow (dmg buff, stealable)", -- Fungalmancer
	["163862"] = "Stun Interrupt (!): Bulwark of Maldraxxus", -- Defender of Many Eyes
	----- Theater of Pain -----
	----- Necrotic Wake -----
	["173016"] = "Interrupt (!!): Drain Fluids (ST Stun)".. "\n".. "Interrupt (!): Goresplatter (AoE DoT)", -- Corpse Collector
	["165872"] = "Hooks random players".. "\n".. "Stand behind monsters and it'll hit them instead".. "\n".. "Interrupt (!): Repair Flesh (Heals loyal creation)", -- Flesh Crafter
	["167731"] = "Hooks random players".. "\n".. "Stand behind monsters and it'll hit them instead".. "\n".. "RUN if fixated", -- Separation Assistant
	["165138"] = "Explodes on death which hits allies AND enemies.", -- Blight Bag
	["173044"] = "Hooks random players".. "\n".. "Stand behind monsters and it'll hit them instead".. "\n".. "Interrupt (!!): Drain Fluids (ST Stun)", -- Stitching Assistant
	["165222"] = "Interrupt (!!): Final Bargain (huge heal)".. "\n".. "Interrupt (!): Bonemend (small heal)", -- Zolramus Bonemender
	["163126"] = "Interrupt (!): Frostbolt Volley (AoE damage)".. "\n".. "NUKE OR CC".. "\n".. "DK can CU for big dps gain", -- Brittlebone Mage
	----- Spires of Ascension -----
	["163459"] = "Interrupt (!!): Forsworn Doctrine (HoT)".. "\n".. "Purge: Imbue Weapon (Arcane dmg on autoattack)", -- Forsworn Mender
	["163458"] = "Interrupt (!): Burden of Knowledge (DoT)", -- Forsworn Castigator
	["168718"] = "Interrupt (!!): Greater Mending (AoE Heal)".. "\n".. "Purge / Steal: Bless Weapon (Dmg + Heal on atk)", -- Forsworn Warden
	["168420"] = "Interrupt (!!): Forsworn Doctrine (HoT)".. "\n".. "Purge: Infuse Weapon (Extra dmg to 5 melee attacks)", -- Forsworn Champion
	----- Torghast -----
	["157571"] = "Interrupt (!!): Inner Flames (AOE Heal)", -- Mawsworn Flametender
	["152898"] = "Interrupt (!!): Death Blast (Hit hard and Dot)", -- Deadsoul Chorus
	----- Tazavesh, the Veiled Market -----
	["178392"] = "Priority (!!): Radiant Pulse, applying a DoT to everybody", -- Gatewarden Zo'mazz
	["177816"] = "Interrupt / Dispel (!!!) Statis Beam (Stun / Heavy damage)".. "\n".. "Dispel (!): Glyph of Restraint (DoT)", -- Interrogation Specialist
	["179334"] = "Important: Summon first boss on death".. "\n".. "Dispel (!): Glyph of Restraint (DoT) Party wide".. "\n".. "Dodge portals and lines", -- Portalmancer Zo'honn
	["176396"] = "Will try and open the creature cages. CC/stun to interrupt the cast", -- Defective Sorter
	["176395"] = "Interrupt / Purge (!): Spam Filter".. "\n".. "Throws Junk Mail at random players".. "\n".. "On death: Purple bubble gives +50% haste to players / enemies", -- Overloaded Mailemental
	["175677"] = "Soothe: Feral (Damage increase)", -- Smuggled Creature
	["179840"] = "STACK in mele or it charges".. "\n".. "Stun Interrupt: Phalanx Field (75% magic DR)", -- Market Peacekeeper
	["179842"] = "BIG Tank knockback".. "\n".. "Soothe: Force Multiplier (AoE dmg inc)", -- Commerce Enforcer
	["178142"] = "Dodge / Interrupt: Volatile Pufferfish (blue AoE swirl)".. "\n".. "Interrupt: Waterbolt (Medium ST dmg)", -- Murkbrine Fishmancer
	["178139"] = "Stun Interrupt (!): Cry of Mrrggllrrgg (AoE Enrage, +50% dmg)", -- Murkbrine Shellcrusher
	["178171"] = "Dodge: Charged Pulse (3s cast - blue AoE circle)", -- Stormforged Guardian
	["180015"] = "Stun Interrupt: Disruptive Shout (AoE damage)".. "\n".. "Soothe: Super Saison (+100% dmg buff)", -- Burly Deckhand
	-- Lower Karazhan Semi
	["114626"] = "Interrupt: Soul Leech".. "\n".. "Dispel: Shadow Rend", -- Forlorn Spirit (spirit)
	["114544"] = "Face away from the mobs during Flashlight!", -- Skeletal Usher 
	["114632"] = "Interrupt: Shadow Rejuvenation (Heal)", -- Spectral Attendant
	["114803"] = "Interrupt: Healing Touch", -- Spectral Stable Hand
	["115440"] = "Interrupt: Mana Drain".. "\n".. "Chain-cast Arcane Blast at random players", -- Moroes: Baroness Dorothea Millstipe
	-- Upper Karazhan Semi
	["115765"] = "Soul always appears in the same place. Gives +100% damage to you", -- Abstract Nullifier
	["115419"] = "Avoid pulling".. "\n".. "Interrupt: Consume Magic", -- Ancient Tome
	-- Grimrail Depot Semi
	["88165"] = "Spread: Lava Wreath silences player".. "\n".. "Refreshes if player stand within 10y", -- Grom'kar Cinderseer
	["82579"] = "Cast Storm Shield".. "\n".. "Does Chainlightning when shield takes dmg", -- Grom'kar Far Seer
	-- Operation Mechagon: Junkyard Semi
	["150169"] = "Interrupt: Suffocating Smog".. "\n".. "Stunns a player for 10 sec", -- Toxic Lurker
	["150297"] = "Interrupt: Enlarge and Shrink".. "\n".. "Magic Dispel shrink", -- Mechagon Renormalizer
	["150276"] = "Interrupt: Repair Protocol", -- Heavy Scrapbot
	-- Court of Stars
	["105704"] = "Interrupt: Drain Magic", -- Arcane Manifestation
	["104274"] = "Interrupt: Nightfall Orb", -- Baalgar the Watchful
	["105715"] = "Stun / Knockback Interrupt: Eye Storm", -- Watchful Inquisitor
	-- Temple of the Jade Serpent
	["200137"] = "ToDo", -- Depraved Mistweaver
	["200126"] = "ToDo", -- Fallen Waterspeaker
	["59555"] = "ToDo", -- Haunting Sha
	["59552"] = "ToDo", -- The Crybaby Hozen
	["59544"] = "ToDo", -- The Nodding Tiger
	["59546"] = "ToDo", -- The Talking Fish
	-- Shadowmoon Burial Ground
	["76104"] = "ToDo", -- Monstrous Corpse Spider
	["75459"] = "ToDo", -- Plagued Bat
	["77700"] = "ToDo", -- Shadowmoon Exhumer
	["75506"] = "ToDo", -- Shadowmoon Loyalist
	-- The Nokhud Offensive
	["195265"] = "ToDo", -- Stormcaller Arynga
	["194317"] = "ToDo", -- Stormcaller Boroo
	["194315"] = "ToDo", -- Stormcaller Solongo
	["194316"] = "ToDo", -- Stormcaller Zarii
	-- Halls of Valor
	["97197"] = "Interrupt: Cleansing Flame", -- Valarjar Purifier
	-- Algeth'ar Academy
	["196202"] = "ToDo", -- Algeth'ar Educator
	["192333"] = "ToDo", -- Alpha Eagle
	["196548"] = "ToDo", -- Ancient Branch
	["196045"] = "ToDo", -- Corrupted Manafiend
	["196044"] = "ToDo", -- Unruly Textbook
	["197406"] = "ToDo", -- Aggravated Skitterfly
	["196198"] = "ToDo", -- Algeth'ar Security
	["196694"] = "ToDo", -- Arcane Forager
	["196577"] = "ToDo", -- Spellbound Battleaxe
	["197904"] = "ToDo", -- Spellbound Battleaxe
	["196203"] = "ToDo", -- Algeth'ar Nurse
	["197905"] = "ToDo", -- Spellbound Scepter
	["196200"] = "ToDo", -- Algeth'ar Enforcer
	["196576"] = "ToDo", -- Spellbound Scepter
	-- The Azure Vault
	["186741"] = "Interrupt: Waking Bane to prevent this sleep cast from going off".. "\n".. "If dispelled, else dispel", -- Arcane Elemental
	["196102"] = "Interrupt: Interrupt Mystic Vapors to avoid stacking DoT", -- Conjured Lasher
	["191164"] = "Interrupt: Erratic Growth to avoid turning player into sapling".. "\n".. "If dispelled, spreads sapling debuff to nearby players", -- Arcane Tender
	["187246"] = "Important: Frogs will jump to a random ranged player's location".. "\n".. "Stack to keep them grouped/CCed", -- Nullmagic Hornswog
	["189555"] = "Dodge: The dark blue swirlies from Unstable Power casts.", -- Astral Attendant
	["187159"] = "Important: CC the Shriek cast or nearby mobs will be called", -- Shrieking Whelp
	-- Ruby Life Pools
	["189893"] = "ToDo", -- Infused Whelp
	["187894"] = "ToDo", -- Infused Whelp
	["190205"] = "ToDo", -- Scorchling
	["188011"] = "ToDo", -- Primal Terrasentry
	["197982"] = "ToDo", -- Storm Warrior
	["187969"] = "ToDo", -- Flashfrost Earthshaper
	-- Brackenhide Hollow
	["186246"] = "Interrupt Screech.", -- Fleshripper Vulture
	["186220"] = "Interrupt Touch of Decay", -- Brackenhide Shaper
	["189531"] = "Summons Infected Lashers", -- Decayed Elder
	["186229"] = "Deals aoe damage and summons Infected Lashers.", -- Wilted Oak
	-- Neltharus
	["189247"] = "Interrupt: Ember Reach".. "\n".. "", -- Tamed Phoenix
	["189227"] = "Dodge: Binding Spear".. "\n".. "Stuns and root player if hit", -- Qalashi Hunter
	["189470"] = "Interrupt: Melt - Hits random player".. "\n".. "", -- Lava Flare
	["189466"] = "Scorching Fusillade: Spread out ".. "\n".. "Dodge: Conflagrant Battery swirls", -- Irontorch Commander
	-- Halls of Infusion
	["190362"] = "Interrupt: Dazzle frontal disorientation ".. "\n".. "Can sidestep or outrange 10y", -- Dazzling Dragonfly
	["195399"] = "Harmless, BUT: At 10 stacks it instantly kills you ".. "\n".. "Avoid been meled by them", -- Curious Swoglet
	["190377"] = "Interrupt: Ice Shards ".. "\n".. "Note: Primal Affinity lets Glacial Proto-Dragon  cast slow", -- Primalist Icecaller
}

T.PlateNuke = { -- NpcColor_Nuke / Green Hex 1cdb5c
	----- Tormented Seasonal Mythic+ Affix  -----
	["179446"] = "Aura if Alive: Damage over Time Effect".. "\n".. "Avoid fire on floor".. "\n".. "Dispell: Melt Soul - Increases fire damage taken", -- Incinerator Arkolath
	["179892"] = "Aura if Alive: 50% Movement Speed Reduction".. "\n".. "Dodge Frost lance".. "\n".. "Move away with biting cold", -- Oros Coldheart
	["179890"] = "Aura if Alive: 50% Reduced Healing".. "\n".. "Interrupt?: Sever - High physical damage to tank + short bleed effect. ".. "\n".. "Carnage - High physical damage to target + all in 5yard", -- Executioner Varruth
	["179891"] = "Aura if Alive: 50% increased physical damage".. "\n".. "Dodge Massive Smash", -- Soggodon the Breaker
	----- Mists of Tirna Scithe -----
	["166301"] = "Stun(!!) deal physical damage and a bleed. ".. "\n".. "Not kitable and Unlimited range", -- Mistveil Stalker
	----- De Other Side -----
	["170488"] = "Fixates a random player. ".. "\n".. "Drops a large red pool on death", -- Son of Hakkar
	["165905"] = "Fixates a random player. ".. "\n".. "Drops a large red pool on death", -- Son of Hakkar
	----- Sanguine Depths -----
	["162040"] = "Interrupt (!): Gloom Burst (ST Nuke)".. "\n".. "When chained move away from the boss to break".. "\n".. "Stacking debuff on all!", -- Grand Overseer
	["162038"] = "Will thrust in front of him. ".. "\n".. "Next thrust cast will reactivate previous thrusts".. "\n".. "Drop a pool that increases his dmg", -- Regal Mistdancer
	----- Halls of Atonement -----
	----- Plaguefall -----
	["169498"] = "Prio Target. Must die before cast ends.", -- Plague Bomb
	----- Theater of Pain -----
	["170882"] = "Stun Interrupt (!!): Bone Spear ".. "\n".. "Big bleed, will one shot on high keys", -- Bone Magus
	----- Necrotic Wake -----
	["163618"] = "Nearby minions die when he dies".. "\n".. "Grim Fate: Spread out", -- Zolramus Necromancer
	["166302"] = "Interrupt (!!!!)".. "\n".. "Drain Fluids", -- Corpse Harvester
	----- Spires of Ascension -----
	["163520"] = "Nearby enemies take 75% reduced AoE dmg.", -- Forsworn Squad-Leader
	----- Tazavesh, the Veiled Market -----
	["179821"] = "Big Tank knockback".. "\n".. "Stay spread when linked".. "\n".. "Dodge orbs", -- Commander Zo'far (Miniboss)
	["178165"] = "Tidal Stomp: Big AoE damage, stacks. 50y range".. "\n".. "Dodge: Boulder Throw (brown swirl)".. "\n".. "Hard Burn or outrange", -- Coastwalker Goliath
	["180432"] = "Interrupt (!!): Reinvigorate (Heal + haste buff)".. "\n".. "Stacks dmg taken increase on the tank".. "\n".. "Kill quickly or kite", -- Devoted Accomplice
	["178141"] = "Stun Interrupt (!!): Invig Fish Stick (AoE healing totem)".. "\n".. "Burn down totem if missed stun", -- Murkbrine Scalebinder
	-- Lower Karazhan Nuke
	["116549"] = "Interrupt(!!): Firelands Portal".. "\n".. "Use AoE stuns. They HURT.", -- Backup Singer
	["114629"] = "Dangerous mob. Pull with caution".. "\n".. "Interrupt: Oath of Fealty (MC)",-- Spectral Retainer
	["114783"] = "Stun and focus at 50% to avoid Heartbreaker".. "\n".. "Dispel Flirt. Tank priority", -- Reformed Maiden
	["114801"] = "Spreadout with Burning Brand. It hurts. A lot.", -- Spectral Apprentice
	["17007"] = "Buffs Moroes with 100% dmg and 75% attack Speed".. "\n".. "Should be CC/Focused)", -- Moroes: Lady Keira Berrybuck 
	["19872"] = "Heals Moroes and smite random target".. "\n".. "Should be CC/Focused)", -- Moroes: Lady Catriona Von'Indi
	-- Grimrail Depot Nuke
	["81236"] = "Interrupt: Activating ".. "\n".. "Stun/CC: 50,000 Volts! HURTS and Stuns", -- Grimrail Technician 
	["80935"] = "Nuke to gain Blackrock Mortar Shells".. "\n".. "Loot and use Blackrock Turret", -- Grom'kar Boomer 
	-- Iron Docks Nuke
	["81603"] = "Buffs all close mobs".. "\n".. "Orders wall mobs to attack with heavy dmg", -- Champion Druna
	["84520"] = "Very heavy tank damage".. "\n".. "Avoid Bladestorm", -- Pitwarden Gwarnok
	["86526"] = "Iron Warcry buffs all mobs", -- Grom'kar Chainmaster
	["80816"] = "STOP DPS if affected by Sanguine Sphere", -- Ahri'ok Dugru
	-- Operation Mechagon: Junkyard Nuke
	["150251"] = "Interrupt: Overclock & Repair (below 50%)".. "\n".. "Shield Bash does high physical damage on tank", -- Pistonhead Mechanic 
	["150143"] = "Interrupt: Enrage or dispell it".. "\n".. "Skullcracker does high physical damage on tank", -- Scrapbone Grinder
	["150146"] = "Interrupt: Stoneskin and Grasping Hex", -- Scrapbone Shamans
	-- Operation Mechagon: Workshop Nuke
	["151657"] = "Interrupt: Detonate", -- Bomb Tonk
	-- The Nokhud Offensive
	["195876"] = "ToDo", -- Desecrated Ohuna
	["192796"] = "ToDo", -- Nokhud Hornsounder
	["194896"] = "ToDo", -- Primal Stormshield
	-- Halls of Valor
	["102019"] = "ToDo", -- Stormforged Obliterator
	["95842"] = "Interrupts: Thunderous Bolt - Dispel: Thunderstrike", -- Valarjar Thundercaller
	-- Algeth'ar Academy
	["196482"] = "ToDo", -- Overgrown Ancient
	["197219"] = "ToDo", -- Vile Lasher
	-- The Azure Vault
	["187240"] = "Important: Shoulder Slam is a knock back".. "\n".. "Position to avoid triggering runes", -- Drakonid Breaker
	-- Ruby Life Pools
	["190034"] = "ToDo", -- Blazebound Destroyer
	["187897"] = "ToDo", -- Defier Draghar
	-- Brackenhide Hollow
	["195135"] = "INTERRUPT(!!): Hideous Cackle, Mass-fear".. "\n".. "Do not pull the Warscourge with other mobs".. "\n".. "as it will empower them".. "\n".. "Interrupt: Hideous Cackle or get mass-feared", -- Bracken Warscourge
	["186191"] = "Kill it immediately, else it will stack up Withering Burst", -- Decay Speaker
	["189363"] = "Kill them quickly before the bleeds stack up", -- Infected Lasher
	["193799"] = "Kill them quickly. Empowers Trickclaw Mystics with dangerous spell", -- Rotchanting Totem
	-- Neltharus
	["192788"] = "Interrupt (!!!!) : Molten Core".. "\n".. "", -- Qalashi Thaumaturge
	["192782"] = "Pulse a ramping DoT onto your team with  Molten Core".. "\n".. "", -- Molten Elementals
	["189235"] = "Interrupt: Burning Roar".. "\n".. "Tank: Dmg from Imbued Magma (healer dispell dot)".. "\n".. "Dodge: Eruptive Crush, 6y aoe	", -- 	Overseer Lahar
	["189464"] = "Interrupt: Mote of Combustion cast on random".. "\n".. "Healer: Dispell Mote of Combustion".. "\n".. "Frontal: Scorching Breath	", -- 	Qalashi Irontorch
	["189467"] = "Pierce Marrow: Charges a target, decent dmg".. "\n".. "Dragonbone Axe:  Massive bleed on a random target", -- Qalashi Bonesplitter
	["194816"] = "Healers: Heavy aoe dmg every 2sec".. "\n".. "", -- Forgewrought Monstrosity
	["193291"] = "Tank: Scalding Chomp hit's hard".. "\n".. "ALL: Pushback from Candescent Tempest", -- Apex Blazewing
	-- Halls of Infusion
	["190342"] = "Interrupt: Expulse, heavy AOE dmg ".. "\n".. "Containment Beam, deal high damage and immobilize", -- Containment Apparatus
}

T.PlateT3Mobs = { -- NpcColor_T3, Light Orange Color, Hex ff9e82. This is mobs that are dangerous due to dmg done to tank or group
	----- Mists of Tirna Scithe -----
	["173655"] = "Puts down a large healing pool".. "\n".. "Has a large AoE frontal cone".. "\n".. "Dodge it after cast begins", -- Mistveil Matriarch
	["173720"] = "Frontal attack!".. "\n".. "Run 12+ yards away during the Poisonous Secretions", -- Mistveil Gorgegullet
	["164929"] = "LARGE FRONTAL CONE".. "\n".. "Cocoon a random player, Break it with damage".. "\n".. "Becomes friendly at 20% and heals / restores mana", -- Tirnenn Villager
	["171772"] = "Frontal Cleave!".. "\n".. "SOOTHE: Protector's Rage (50%dmg)".. "\n".. "move out of Spear Flurry once the cast begins", -- Mistveil Defender
	["163058"] = "Frontal Cleave!".. "\n".. "SOOTHE: Protector's Rage (50%dmg)".. "\n".. "move out of Spear Flurry once the cast begins", -- Mistveil Defender
	----- De Other Side ----- 	
	["171333"] = "Stun Interrupt (!!): Devoted Sacrifice".. "\n".. "(Transforms into dangerous mob)", -- Atal'ai Devoted
	["168934"] = "Rage is a heavy AoE damage channel".. "\n".. "It can be interrupted via displacement".. "\n".. "Else, pop defensive cooldowns", -- Enraged Spirit
	["168949"] = "Frontal knockback", -- Risen Bonesoldier
	----- Sanguine Depths -----
	["162057"] = "DANGEROUS frontal cone bleed".. "\n".. "Dodge: The brown swirls will knock you up".. "\n".. "Interrupt (!): Stoneskin (dmg reduction)", -- Chamber Sentinel
	----- Halls of Atonement -----
	["164563"] = "Enraged by nearby Houndmasters".. "\n".. "Soothe or kite".. "\n".. "VERY high tank damage.", -- Vicious Gargon
	["167607"] = "FRONTAL CONE - Knocks back targets".. "\n".."Short range. avoidable", -- Stoneborn Slasher
	----- Plaguefall -----
	["163857"] = "HEAVY tank damage, but slow. Easy to kite.", -- Plaguebound Devoted
	["163894"] = "FRONTAL CONE: Festering Belch ".. "\n".. "(tank can dodge after cast start", -- Blighted Spinebreaker
	----- Theater of Pain -----
	["170690"] = "Disease: Reduces tank health by 5% per stack".. "\n".. "Interrupt: Meat Shield (Absorb)", -- Diseased Horror
	["170850"] = "Soothe: Raging Tantrum (AoE channeled damage)".. "\n".. "Dodge Horn Rush", -- Raging Bloodhorn
	["174197"] = "Adds healing absorb to target. OutHeal".. "\n".. "Interrupt (!): Unholy Fervor", -- Battlefield Ritualist
	["169927"] = "Stun Interrupt: Devour Flesh (health drain)".. "\n".. "DK can CU for big dmg", -- Putrid Butcher
	["167534"] = "Very heavy damage to the tank, and moderate to the party.", -- Rek the Hardened
	----- Necrotic Wake -----
	["172981"] = "Stacks damage taken debuff on tank.", -- Kyrian Stitchwerk
	["165919"] = "Interrupt (!!): Rasping Scream (15yd AoE Fear)".. "\n".. "FRONTAL CLEAVE", -- Skeletal Marauder
	["163621"] = "Stacks damage taken increase on tank".. "\n".. "FRONTAL CLEAVE", -- Goregrind
	["165197"] = "Very large tank damage, stacking debuff".. "\n".. "Pop DPS cooldowns and kill quickly.",-- Skeletal Monstrosity
	["163619"] = "Stun Interrupt (!): Boneflay (reduces tank MaxHP)", -- Zolramus Bonecarver
	----- Spires of Ascension -----
	["163457"] = "FRONTAL CLEAVE", -- Forsworn Vanguard
	----- Torghast -----
	["168106"] = "Dodge (!!): Massive Strike (Frontal cone)", -- Empowered Mawsworn Guard
	["150958"] = "Dodge (!!): Massive Strike (Frontal cone)", -- Mawsworn Guard
	["151127"] = "Interrupt (!!): Wave of Suffering (Massive AOE)", -- Lord of Torment
	["156241"] = "Don't Move them (!!): Enrage if enemy moving", -- Monstrous Guardians
	----- Tazavesh, the Veiled Market -----
	["177817"] = "Refraction Shield - Deals dmg to player when attacking. Spellstealable".. "\n".. "Interrupt (i) Hyperlight Bolt - Heavy damage to a random target".. "\n".. "Interrupt (!): Hard Light Barrier - large damage absorb shield", -- Support Officer
	["177808"] = "Pull Solo into area with big space".. "\n".. "Rotating beam. Big DoT if hit by it", -- Armored Overseer
	["180348"] = "During his Chronolight Enhancer buff: kite.".. "\n".. "Massive damage but verry slow", -- Cartel Muscle
	["178388"] = "Fixate whoever is carrying the event item".. "\n".. "Hits VERY hard. Kite and kill", -- Bazaar Strongarm
	-- Lower Karazhan T3
	["114526"] = "Standing in the spotlights increases everyones damage by 50%".. "\n".. "Final Curtain, 5 y one shot",-- Ghostly Understudy
	["114542"] = "Important, Dodge coins on the ground", -- Ghostly Philanthropist
	["114636"] = "Frontal Cleave that 3sec stuns with Shield Slam".. "\n".. "TANK, dodge also",	-- Phantom Guardsman
	["114794"] = "TANK, Defensive: Rotting Bite", -- Skeletal Hound
	["114715"] = "Moderate frontal cleave. Stay at max range", -- Ghostly Chef
	["114714"] = "Important", "Will stun the tank", -- Ghostly Steward
	["115441"] = "Dodge: Will Breaker, heavy dmg frontal".. "\n".. "Just dodge", -- Moroes: Lord Crispin Ference
	["115439"] = "Avoid: Iron Whirlwind".. "\n".. " heavy damage to nearby players", -- Moroes: Baron Rafe Dreuger 
	-- Upper Karazhan T3
	["115488"] = "Soak the Fel Orbs by standing in them".. "\n".. "They explode if not soaked. Use defensive",-- Infused Pyromancer
	["115484"] = "Cast Fel Breath is a 60-yard-long cone".. "\n".. "Tank should side-step out ", -- Fel Bat
	["115757"] = "Nasty frontal cleave".. "\n".. "Kite him up into the tunnel to avoid flame floor", -- Wrathguard Flamebringer
	-- Grimrail Depot T3
	["80937"] = "Dodge: Shrapnel Blast", -- Grom'kar Gunner
	-- Iron Docks T3
	["83026"] = "Dodge Gatecrasher".. "\n".. "Shattering Strike hits all in 6y", -- Siegemaster Olugar 
	["83775"] = "Flurry deal very heavy tank damage", -- Ogron Laborer
	["86231"] = "Watch carefully for the  Flaming Slash ".. "\n".. "Pre-Cast:Dripping flame of sword, then move away", -- Makogg Emberblade
	-- Operation Mechagon: Junkyard T3
	["154758"] = "Must be killed for boss spwan", -- Toxic Monstrosity
	["150249"] = "Sledgehammer: Massive armor reduction to your Tank", -- Pistonhead Scrapper
	["150160"] = "DODGE Shockwave or die", -- Scrapbone Bully 
	-- Operation Mechagon: Workshop T3
	["144301"] = "Explode on death, dealing heavy dmg".. "\n".. "Carefull with to many (Can LOS)", -- Living Waste 
	["151476"] = "Frontal: Sonic Pulse ".. "\n".. "DODGE: Capacitor Discharge", -- Blastatron X-80 
	["144296"] = "Frontal: Sonic Pulse ".. "\n".. "DODGE: Launch High-Explosive Rockets.", -- Spider Tank
	-- Court of Stars
	["104246"] = "Cone frontal cleave (visible)", -- Duskwatch Guard
	["111563"] = "Cone frontal cleave (visible)", -- Duskwatch Guard
	["104270"] = "Interrupt: Charging Station".. "\n".. "Interrupt: Suppress (Can also be dispelled)", -- Guardian Construct
	["105705"] = "Interrupt: Charged Blast", -- Bound Energy
	["104273"] = "Dodge: Shockwave (frontal cleave)", -- Jazshariu
	["104251"] = "Carrion Swarm is a frontal cone".. "\n".. "Fortified Shadowbolt Volley REALLY hurts", -- Duskwatch Sentry
	-- The Nokhud Offensive
	["192789"] = "ToDo", -- Nokhud Longbow
	["192791"] = "ToDo", -- Nokhud Warspear
	["199320"] = "ToDo", -- Nokhud Warspear
	["199321"] = "ToDo", -- Nokhud Warspear
	-- Halls of Valor
	["97068"] = "Heavy Frontal dmg from Lightning Breath", -- Storm Drake
	["97788"] = "Heavy Frontal dmg from Lightning Breath", -- Storm Drake
	["99891"] = "Heavy Frontal dmg from Lightning Breath", -- Storm Drake
	["96640"] = "ToDo", -- Valarjar Marksman
	["97087"] = "ToDo", -- Valarjar Champion
	-- Algeth'ar Academy
	["196671"] = "ToDo", -- Arcane Ravager
	-- The Azure Vault
	["186740"] = "DODGE: Frontal cone aimed at tank.", -- Arcane Construct
	["196115"] = "ToDo", -- Arcane Tender
	["187160"] = "DODGE: Frontal cone aimed at tank.", -- Crystal Fury
	["191739"] = "Frontal: Aimed at tank ".. "\n".. "Defensive: Ice Cutter", -- Scalebane Lieutenant
	["190510"] = "TANK, Defensive: Ice Cutter", -- Vault Guard
	-- Ruby Life Pools
	["190206"] = "ToDo", -- Primalist Flamedancer
	["197697"] = "ToDo", -- Flamegullet
	["197698"] = "ToDo", -- Thunderhead
	-- Brackenhide Hollow
	["185508"] = "Tank buster, applies stacking bleed".. "\n".. "HEALER: Heal above 90% to remove stack.".. "\n".. "On fixate run away or use Shadowmeld/Vanish/etc", -- Claw Fighter
	["186206"] = "Tank buster, applies stacking bleed".. "\n".. "HEALER: Heal above 90% to remove stack.", -- Cruel Bonecrusher
	["197857"] = "Tank buster, applies stacking bleed".. "\n".. "HEALER: Heal above 90% to remove stack.", -- Gutstabber
	["187315"] = "Tank buster, applies stacking bleed".. "\n".. "HEALER: Heal above 90% to remove stack.", -- Disease Slasher
	["187231"] = "Tank buster, applies stacking bleed".. "\n".. "HEALER: Heal above 90% to remove stack.", -- Wither Biter
	["185534"] = "Casts high damage on random players".. "\n".. "Dodge the Toxic Traps", -- Bonebolt Hunter
	["186284"] = "Deals high tank damage with Maul", -- Gutchewer Bear
	["186208"] = "Do not pull the Warscourge with other mobs".. "\n".. "as it will empower them".. "\n".. "Casts high damage on random players", -- Rotbow Stalker
	["186226"] = "Do not pull the Warscourge with other mobs".. "\n".. "as it will empower them".. "\n".. "Interrupt Burst of Decay", -- Fetid Rotsinger
	["187033"] = "Dodge the frontal cone".. "\n".. "Run away from Violent Whirlwind", -- Stinkbreath
	["185691"] = "Infected Bite reduce the tank's healing taken", -- Vicious Hyena
	-- Neltharus
	["193293"] = "Frontal: Volcanic Guard".. "\n".. "Tank Dmg: Blazing Slash", -- Qalashi Warden
	["192787"] = "Frontal knockback".. "\n".. "", -- Qalashi Spinecrusher
	["189266"] = "Deadly Frontal: Magma Fist! DODGE".. "\n".. "Dispell/Sooth: Fired Up", -- Qalashi Trainee
	["189471"] = "Tank: Reverberating Slam, hit hard and leave a DoT".. "\n".. "Stop Cast: Forgestomp", -- Qalashi Blacksmith
	-- Halls of Infusion
	["190340"] = "Interrupt: Demoralizing Shout ".. "\n".. "Tank: Both bleed and Spear Flurry hurts", -- Refti Defender
	["190359"] = "Increasing dmg the longer they live ".. "\n".. "Only important for ramp-up dmg (Fortify)", -- Skulking Zealot
	["190401"] = "Dispell: Binding Winds if pulled with Primalist Galesinger ".. "\n".. "Note: Only priority if buffed with Affinity. Else they are equal", -- Gusting Proto-DragonLight
	["190404"] = "DODGE!! : Tectonic Breath, frontal ".. "\n".. "Beware of its  Creeping Mold, as it stacks", -- Subterranean Proto-DragonLight
}

T.PlateTides = {
	["Emissary of the Tides"] = true,
	["Void-Touched Emissary"] = true,
}

T.PlateExplosive = {
	["Fel Explosives"] = false,
	["Fel Explosive"] = false,
	["Explosives"] = true,
}

T.PlatePvP = {
	["Twisted Appendage"] = true,
	["Grounding Totem"] = true,
}
