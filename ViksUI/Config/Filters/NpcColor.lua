local T, C, L = unpack(ViksUI)
	
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
	-- The Nokhud Offensive
	["195878"] = "Stun/Disturb: Desecrating Roar ".. "\n".. "Tank: Defensives for Heavy Slash", -- Ukhel Beastcaller
	["195842"] = "Dodge: Necrotic Eruption", -- Ukhel Corruptor
	["195851"] = "Interrupt: Chant of the Dead ".. "\n".. "Dispell: Grasp of the Dead", -- Ukhel Deathspeaker
	["195847"] = "Interrupt: Dominate or get MC", -- Ukhel Willcrusher
	-- Algeth'ar Academy
	["196798"] = "Interrupt: Mana Void if spare interruptShattered Psyche stacks so priority", -- Corrupted Manafiend
	["196044"] = "Interrupt: Monotonous Lecture, long sleep cc", -- Unruly Textbook
	["197905"] = "Mystic Blast is AoE Dmg ".. "\n".. "Dodge! : Arcane Rain", -- Spellbound Scepter
	["196203"] = "Interrupt: Celestial Shield absorb + 50% haste", -- Ethereal Restorer
	["196576"] = "Mystic Blast is AoE Dmg ".. "\n".. "Dodge! : Arcane Rain", -- Spellbound Scepter
	-- The Azure Vault
	["187154"] = "Interrupt: Heavy Tome (tank damage)", -- Unstable Curator
	["187155"] = "Interrupt: Icy Bindings to avoid the groupwide root", -- Rune Seal Keeper
	-- Ruby Life Pools
	["197985"] = "Interrupt: Flashfire at all cost, dmg + Heals", -- Flame Channeler
	["188067"] = "Interrupt: Ice Shield, will make immune to cc/interupt".. "\n".. "Interrupt: Icebolt, but no priority int", -- Flashfrost Chillweaver
	["190207"] = "Interrupt: Cinderbolt, targets random".. "\n".. "Burning Ambition is 50% haste increase, but also 25% extra dmg taken", -- Primalist Cinderweaver
	["198047"] = "Interrupt: Thunderbolt", -- Tempest Channeler
	["197535"] = "Interrupt: Shock Blast Icon Shock Blast at all cost".. "\n".. "Use defensives during Lightning Storm", -- High Channeler Ryvati
	["195119"] = "Interrupt: Unlucky Strike", -- Primalist Shockcaster
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
	["190407"] = "At 20% Interrupt: Tidal Divergence", -- Aqua Rager
	["190405"] = "Interrupt: Aqueous Barrier (absorb shield) ".. "\n".. "Dodge: Flash Flood, AOE", -- Infuser Sariya
	-- Shadowmoon Burial Ground
	["75459"] = "Interrupt: Plague Spit", -- Plagued Bat
	["75652"] = "Dodge: Void Eruptions, Swirl on ground ".. "\n".. "Corner LOS Void Pulse", -- Void Spawn
	["75713"] = "Interrupt (!!!): Shadow Mend  ".. "\n".. "Interrupt: Shadow Bolts", -- Shadowmoon Bone-Mender
	-- Temple of the Jade Serpent
	["59555"] = "Interrupt: Haunting Scream ".. "\n".. "Frontal: Haunting Gaze. Heavy dmg", -- Haunting Sha
	["58856"] = "Interrupt: Haunting Scream ".. "\n".. "Frontal: Haunting Gaze. Heavy dmg", -- Haunting Sha
	["200131"] = "Leg Sweep: stuns and do dmg to anyone close ".. "\n".. "Tank: Setting sun kick do heavy dmg and debuff", -- Sha-Touched Guardian
	["56511"] = "Dodge: Surging Deluge on the floor ".. "\n".. "ALL: Corner LoS Tainted Ripple", -- Corrupt Living Water
	-- Halls of Valor
	["96640"] = "Dodge: Penetrating Shot, frontal cone ".. "\n".. "Dodge: Leap to Safety, gains 25% dmg reduct if fail", -- Valarjar Marksman
	["96934"] = "Dodge: Bear Trap ".. "\n".. "Tank: On Fortify Quick Chop hurts", -- Valarjar Trapper
	-- Brackenhide Hollow
	["186226"] = "Interrupt: -  Burst of Decay ".. "\n".. "Nuke: Decay Totem", -- Fetid Rotsinger
	["186246"] = "Interrupt: -  Screech, 40y aoe dmg", -- Fleshripper Vulture
	["186125"] = "Interrupt: Greater Healing Rapids at all costs ".. "\n".. "Nuke Hextrick Totem when casted ".. "\n".. "Bloodfrenzy – When ally's drops below 15%", -- Tricktotem
	-- Freehold
	["127111"] = "Interrupt or Dodge: Sea Spout", -- Irontide Oarsman
	["129547"] = "Interrupt(!): Shattering Bellow, dmg & interrupts ".. "\n".. "Bellow only has a 30 yard range", -- Blacktooth Knuckleduster
	["129788"] = "Interrupt (or purge): Healing Balm (medium HoT) ".. "\n".. "Dispel: Infected Wound", -- Irontide Bonesaw
	["126919"] = "Interrupt: Thundering Squall (moderate 12s 10yrd AoE)", -- Irontide Stormcaller
	["130012"] = "Painful Motivation (45% dmg buff) ".. "\n".. "The buff also deals heavy damage to the mobs", -- Irontide Ravager
	-- The Underrot
	["133685"] = "Interrupt(!!!): Harrowing Despair (BIG AoE) ".. "\n".. "Spread a little so you don't share the channeling damage ".. "\n".. "Healer: Dark Omen is big dmg", -- Befouled Spirit
	["133835"] = "Will fixate a random player. Kite, CC, don't get hit ".. "\n".. "Interrupt: Sonic Screech (AoE damage, interrupts spells)", -- Feral Bloodswarmer
	["138187"] = "Interrupt(!!): Death Bolt (AoE dmg + DoT) ".. "\n".. "You really need to interrupt every Death Bolt here", -- Grotesque Horror
	["134284"] = "Interrupt: Raise Dead (summons a Guardian) ".. "\n".. "Interrupt or Soothe: Wicked Frenzy (+100% haste)", -- Fallen Deathspeaker
	["133912"] = "Interrupt(!!): Withering Curse (+dmg taken, -dmg done) ".. "\n".. "Interrupt(!): Shadowbolt Volley (Medium AoE) ".. "\n".. "Summons a totem: Kill or move 6yard away", -- Bloodsworn Defiler
	-- Uldaman: Legacy of Tyr
	["186658"] = "Interrupt: Chain Lightning ".. "\n".. "Interrupt, low pri: Stone Spile", -- Stonevault Geomancer
	["186420"] = "Interrupt: Stone Bolt ".. "\n".. "Stun/Disturb: Hail of Stone, channeled on random", -- Earthen Weaver
	["184132"] = "Interrupt or Purge: Earth Ward, put on random npc ".. "\n".. "Interrupt: Curse of Stone. Decurse of fail", -- Earthen Warder
	["184301"] = "Interrupt: Sonic Burst, 10y aoe silence ", -- Cavern Seeker
	-- Neltharion's Lair
	["92610"] = "Interrupt his cast to stop the drumming ".. "\n".. "Animation still plays but harmless", -- Understone Drummer
	["92351"] = "Interrupt his cast to stop the drumming ".. "\n".. "Animation still plays but harmless", -- Understone Drummer
	["91008"] = "Attacks allies at random. ".. "\n".. "Won't cast if tank is 40 yards+ away", -- Rockbound Pelter
	-- Dawn of the Infinite
	["199748"] = "Interrupt: Displace Chronosequence - AoE dmg ".. "\n".. "Stun/CC Int: Infinite Schism - Heavy AoE Dmg", -- Timeline Marauder
	["201756"] = "Kite throu Time Traps", -- Familiar Face
	["201788"] = "Boss", -- Dazhak
	["203857"] = "Boss Add", -- Horde Warlock
	["204262"] = "Kill ASAP", -- Necrofrost
	["204918"] = "Interrupt: Stonebolt", -- Iridikron's Creation
	["205212"] = "Kill ASAP before reinforcement swap", -- Infinite Keeper
	["205337"] = "Summons adds and buffs them", -- Infinite Timebender
	["205384"] = "Interrupt: Chronomelt - Dmg & Haste/Movement speed reduction", -- Infinite Chronoweaver
	["206065"] = "Explode on death, 8yd", -- Interval
	["206066"] = "Interrupt: Enervate. ".. "\n".. "Healer: Dispelled when player is out, it 'cleaves' dmg for 8y", -- Timestream Leech
	["206230"] = "Dodge: Timeless Curse - Ground pool ".. "\n".. "Use defensive on Infinite Fury", -- Infinite Diversionist
	["208698"] = "Dodge Frontal? ".. "\n".. "Stun / CC Int: Infinite Burn", -- Infinite Riftmage
	-- The Everbloom
	["81985"] = "Interupt Enraged Growth", -- Everbloom Cultivator
	["83893"] = "After Gola is dead; ".. "\n".. "interrupts and stuns to prevent  Bramble Patch and  Briarskin ".. "\n".. "Pri 2", -- Earthshaper Telu
	-- Atal'Dazar
	["122969"] = "Interrupt or decurse: Unstable Hex (long CC) ".. "\n".. "The Hex spreads to allies within 8 yards when dispelled", -- Zanchuli Witch-Doctor
	["122972"] = "Interrupt(!!): Fiery Enchant (buffs a nearby Juggernaut to throw fire) ".. "\n".. "Will also cast Wild Fire (dmg + DoT) on random players ".. "\n".. "", -- Dazar'ai Augur
	["122973"] = "Interrupt(!): Bwonsamdi's Mantle (big CC immunity bubble) ".. "\n".. "Interrupt: Mending Word ".. "\n".. "Drag mob out of bubble if up", -- Dazar'ai Confessor
	["128434"] = "Interrupt(!!): Terrifying Screech (long AoE fear)", -- Feasting Skyscreamer
	["128455"] = "Will charge a random player", -- T'lonja
	["131009"] = "CC and kill ASAP ".. "\n".. "Soaking blood pools heals boss", -- Spirit of Gold
	-- Waycrest Manor
	["131812"] = "Interrupts", "Interrupt: Soul Volley (AoE nuke) ".. "\n".. "Warding Candles; ground area 50%dmg reduction", -- Heartsbane Soulcharmer
	["131850"] = "Will throw out traps. One deals heavy damage, one stuns for 8s ".. "\n".. "Important to Dodge traps ".. "\n".. "Interrupt(!): Serving Serpents (AoE disease DoT)", -- Maddened Survivalist
	["133361"] = "Slow / Stun and kill before reach boss", -- Wasting Servant
	["134024"] = "Harmless UNLESS it has the Parasitic debuff ".. "\n".. "Successful Infest casts will spawn two more maggots", -- Devouring Maggot
	["135049"] = "Warding Candles; ground area 50%dmg reduction ".. "\n".. "3 Sec disorient on random player", -- Dreadwing Raven
	["135552"] = "Will leap to furthest player and deal 5yd AoE DoT ".. "\n".. "Have one player stand out", -- Deathtouched Slaver
	-- Black Rook Hold
	["98275"] = "Shoot has a 30 yard range ".. "\n".. "Hits slightly further than the animation ".. "\n".. "Can Los", -- Risen Archer
	["98370"] = "Interrupt: Dark Mending (Heal)", -- Ghostly Councilor
	["98691"] = "Stun Interrupt: Knife Dance (AoE)", -- Risen Scout
	["100486"] = "Interupt Arcane Blitz, stacking 50% dmg buff", -- Risen Arcanist
	["102095"] = "Dodge the brown swirls on the floor", -- Risen Lancer
	["118489"] = "Run away when fixated", -- Corrupted Risen Soldier
	-- Throne of the Tides
	["41096"] = "Interrupt or CC: Hex on random player".. "\n".. "Interrupt Healing Wave", -- Naz'jar Oracle
	["44404"] = "Frostbolt slows tank".. "\n".. "Purge Icy Veins", -- Naz'jar Frost Witch
	["212778"] = "Use CC to stop Psionic Pulse if possible", -- Minion of Ghur'sha
	["213806"] = "Interrupt Ink Blast to help group them", -- Splotch
	["214117"] = "Stormflurry Totem drastically increases the tank damage intake", -- Stormflurry Totem
	-- Darkheart Thicket
	["99359"] = "Corrupted Infusion makes other unkillable", -- Rotheart Keeper
	["99366"] = "Interrupt: Curse of Isolation", -- Taintheart Summoner
	["100527"] = "Target random with Dread Inferno. Use personals", -- Dreadfire Imp
	["100991"] = "Move out of trap - Kill if player rooted.", -- Strangling Roots
	["102962"] = "Run away with Fixate ".. "\n".. "Kite so trail don't go under tank/boss", -- Nightmare Abomination
	["109908"] = "Run away with Fixate ".. "\n".. "Kite so trail don't go under tank/boss", -- Nightmare Abomination
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
	-- Shadowmoon Burial Ground
	["75506"] = "Purge: Sinister Focus", -- Shadowmoon Loyalist
	["75979"] = "Purge/Dispell: ShieldInterrupt (!!): Death Blast", -- Exhumed Spirit
	["77700"] = "Interrupt (!!): Void Bolt, high dmg on random", -- Shadowmoon Exhumer
	["76446"] = "Don't interrupt! Fairly harmless channeling", -- Shadowmoon Enslaver
	-- Temple of the Jade Serpent
	["200137"] = "Interrupt: Defiling Mist ".. "\n".. "Healer: Touch of Ruin is healing absorb. Detonates", -- Depraved Mistweaver
	["59546"] = "Dispell: Sleepy Soliloquy", -- The Talking Fish
	-- The Nokhud Offensive
	["195265"] = "Interrupt: Totemic Overload", -- Stormcaller Arynga
	["194317"] = "Interrupt: Totemic Overload", -- Stormcaller Boroo
	["194315"] = "Interrupt: Totemic Overload", -- Stormcaller Solongo
	["194316"] = "Interrupt: Totemic Overload", -- Stormcaller Zarii
	-- Halls of Valor
	["97197"] = "Interrupt: Cleansing Flame", -- Valarjar Purifier
	["95842"] = "Interrupts: Thunderous Bolt - Dispel: Thunderstrike", -- Valarjar Thundercaller
	-- Algeth'ar Academy
	["196202"] = "Note: Astral Bomb hit's enemy as well", -- Algeth'ar Educator
	["192333"] = "Interrupt: Call of the Flock Buff ".. "\n".. "Dodge: Gust frontal cone", -- Alpha Eagle
	["196548"] = "Interrupt: Healing Touch ".. "\n".. "On death, heals all inside circle", -- Ancient Branch
	["196045"] = "Interrupt: Mana Void if spare interrupt", -- Corrupted Manafiend
	["196198"] = "Can Los dmg from Distrupting Pulse ".. "\n".. "Will instantly recast if interupted", -- Algeth'ar Security
	["196203"] = "Interrupt: Celestial Shield", -- Algeth'ar Nurse
	["196200"] = "Dodge: Astral Whirlwind", -- Algeth'ar Enforcer
	-- The Azure Vault
	["186741"] = "Interrupt: Waking Bane to prevent this sleep cast from going off".. "\n".. "If dispelled, else dispel", -- Arcane Elemental
	["196102"] = "Interrupt: Interrupt Mystic Vapors to avoid stacking DoT", -- Conjured Lasher
	["191164"] = "Interrupt: Erratic Growth to avoid turning player into sapling".. "\n".. "If dispelled, spreads sapling debuff to nearby players", -- Arcane Tender
	["187246"] = "Important: Frogs will jump to a random ranged player's location".. "\n".. "Stack to keep them grouped/CCed", -- Nullmagic Hornswog
	["189555"] = "Dodge: The dark blue swirlies from Unstable Power casts.", -- Astral Attendant
	["187159"] = "Important: CC the Shriek cast or nearby mobs will be called", -- Shrieking Whelp
	-- Ruby Life Pools
	["189893"] = "Cast Cold Claws on their primary target".. "\n".. "At 8 stacks ur frosen solid", -- Infused Whelp
	["187894"] = "Cast Cold Claws on their primary target".. "\n".. "At 8 stacks ur frosen solid", -- Infused Whelp
	["188011"] = "Dodge: Stone Missile on ground, massive dmg", -- Primal Terrasentry
	["197982"] = "Cast Thunderclap, dmg + 10% haste reduction".. "\n".. "Also 20% slow. 5yard range", -- Storm Warrior
	-- Brackenhide Hollow
	["186246"] = "Interrupt Screech.", -- Fleshripper Vulture
	["186220"] = "Interrupt Touch of Decay", -- Brackenhide Shaper
	["189531"] = "Summons Infected Lashers", -- Decayed Elder
	["186229"] = "Deals aoe damage and summons Infected Lashers.", -- Wilted Oak
	-- Neltharus
	["189247"] = "Interrupt: Ember Reach", -- Tamed Phoenix
	["189227"] = "Dodge: Binding Spear".. "\n".. "Stuns and root player if hit", -- Qalashi Hunter
	["189470"] = "Interrupt: Melt - Hits random player", -- Lava Flare
	["189466"] = "Scorching Fusillade: Spread out ".. "\n".. "Dodge: Conflagrant Battery swirls", -- Irontorch Commander
	-- Halls of Infusion
	["190362"] = "Interrupt: Dazzle frontal disorientation ".. "\n".. "Can sidestep or outrange 10y", -- Dazzling Dragonfly
	["195399"] = "Harmless, BUT: At 10 stacks it instantly kills you ".. "\n".. "Avoid been meled by them", -- Curious Swoglet
	["190377"] = "Interrupt: Ice Shards ".. "\n".. "Note: Primal Affinity lets Glacial Proto-Dragon  cast slow", -- Primalist Icecaller
	-- Brackenhide Hollow
	["186220"] = "Interrupt: Touch of Decay", -- Brackenhide Shaper
	["185528"] = "NOTE: Kill Rotchanting Totem ".. "\n".. "Totem empowers and unlocks Witherbolt", -- Trickclaw Mystic
	["186124"] = "Healer: Heal above 90% to remove Gash Frenzy bleed ".. "\n".. "Healer: Dispell Decayed Senses to remove cc", -- Gashtooth
	-- Freehold
	["129529"] = "Fixates random allies ".. "\n".. "DRUID - Soothe: Blind Rage or TQ Shot", -- Blacktooth Scrapper
	["129559"] = "Cast Duelist Dash on random player ".. "\n".. "Stuns all between mob and targeted player", -- Cutwater Duelist
	["129600"] = "Interupt Water Bolt to help stack", -- Bilge Rat Brinescale
	["128551"] = "Moderate tank damage ".. "\n".. "Soothe or Tranq shot: Beastial Wrath +50%dmg", -- Irontide Mastiff
	["129599"] = "Spread 8y to minimize bouncing blade dmg", -- Cutwater Knife Juggler
	-- The Underrot
	["133663"] = "Will pelt random allies ".. "\n".. "Hooked Snare is a DoT", -- Fanatical Headhunter
	-- The Vortex Pinnacle
	["45924"] = "Dodge: Hurricane. Dmg attack speed reduction", -- Turbulent Squall
	["45930"] = "Note: Lightning Nova is 10y knockback", -- Minister of Air
	-- Neltharion's Lair
	["91001"] = "Submerges ".. "\n".. "Dodge: Viscid Bile damage when come up", -- Tarspitter Lurker
	["90998"] = "Interrupt: Stone Bolt (Heavy ST nuke)", -- Blightshard Shaper
	["102232"] = "Interrupt: Bound (Long stun on random player) ".. "\n".. "Pelts random players. ".. "\n".. "Consider CC'ing while you kill the scorpion", -- Rockbound Trapper	
	-- Dawn of the Infinite
	["201223"] = "Interrupt: Epoch Bolt ".. "\n".. "Stun Int: Corroding Volley", -- Infinite Twilight Magus
	["201790"] = "Boss", -- Loszkeleth
	["203799"] = "Boss Add: Priority Target due to bleed from Serrated Axe", -- Horde Axe Thrower
	["204536"] = "Note: Buffs nearby enemy on death (+20% mele dmg)", -- Blight Chunk
	["205363"] = "Interrupt: Fish Bolt Volley", -- Time-Lost Waveshaper
	["205691"] = "Interrupt: Stonebolt", -- Iridikron's Creation
	["205727"] = "Interrupt: Rocket Bolt Volley", -- Time-Lost Rocketeer
	["206064"] = "Interrupt: Infinite Bolt ".. "\n".. "Healer: Dispell Tainted Sands debuff", -- Coalesced Moment
	-- The Everbloom
	["81819"] = "Barrage of Leaves", -- Everbloom Naturalist
	["82039"] = "Spread 5yd for Venom Burst", -- Rockspine Stinger
	["83894"] = "Pri 3", -- Dulhu
	["84989"] = "Move out of Frozen Snap", -- Infested Icecaller
	["86547"] = "Low pri kill in group", -- Venom Sprayer
	["86552"] = "Fixate and burst when reach target ".. "\n".. "Kill first", -- Gorged Burster
	-- Atal'Dazar
	["129517"] = "Tank and Cleave", -- Reanimated Raptor
	["132126"] = "Stand in blood pools before transfusion to kill them more quickly", -- Gilded Priestess
	-- Waycrest Manor
	["131587"] = "Interrupt or Purge: Spirited Defense", -- Bewitched Captain
	["131819"] = "Interrupt or Purge(!!): Soul Fetish (buffs allies on death) ".. "\n".. "Dispel: Fragment Soul (DoT, buffs the mob later)", -- Coven Diviner
	["131849"] = "Will fire a rocket at a random player ".. "\n".. "Spread out so only one person gets hit", -- Crazed Marksman
	["135474"] = "Interrupt: Bone Splinter, Drain Essence (both DoTs)", -- Thistle Acolyte
	["136541"] = "Explode on death, 5yd", -- Bile Oozeling
	["137830"] = "Will leap to furthest player and deal 5yd AoE DoT ".. "\n".. "Have one player stand out", -- Pallid Gorger
	["139269"] = "Will leap to furthest player and deal 5yd AoE DoT ".. "\n".. "Have one player stand out", -- Gloom Horror
	-- Black Rook Hold
	["98280"] = "Interrupt: Arcane Blitz (ST Nuke)", -- Risen Arcanist
	["98792"] = "Abilities change after potion drink", -- Wyrmtongue Scavenger
	["100485"] = "Face away from grp ".. "\n".. "Kill quickly", -- Soul-torn Vanguard
	["118491"] = "Interupt Arcane Blitz, stacking 50% dmg buff", -- Corrupted Risen Mage
	-- Throne of the Tides
	["40633"] = "Sooth Slithering Assult".. "\n".. "Dodge Trident Flurry cone, use cc to stop cast", -- Naz'jar Honor Guard
	["40634"] = "Lightning Bolt targets a random player".. "\n".. "Magic Dispell: Lightning Surge debuffs a random player", -- Naz'jar Tempest Witch
	["40935"] = "Throw Spear on random player, use a CC to stop the cast", -- Gilgoblin Hunter
	["212681"] = "Ravenous Pursuit fixate random player".. "\n".. "Apply Razor Jaws stacking debuff on mele attack", -- Vicious Snap Dragon
	["212775"] = "Interrupt Mind Flay".. "\n".. "Avoid line from Null Blast", -- Faceless Seer
	["213942"] = "Grimy Dot stacks on tank".. "\n".. "Leave puddle when killed", -- Sludge
	-- Darkheart Thicket
	["95771"] = "Interrupt: Despair is Pri -> Rest", -- Dreadsoul Ruiner
	["99358"] = "Dispell Poison is helpfull", -- Rotheart Dryad
	["99360"] = "Can not be killed if Keepers are alive", -- Vilethorn Blossom
	["100539"] = "Dispell Scorching Shot debuff if needed ".. "\n".. "Cleave/Kill Decoys", -- Taintheart Deadeye
	["107288"] = "harmless", -- Vilethorn Sapling
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
	["195876"] = "Dodge: Necrotic Eruption ".. "\n".. "Shattered Psyche stacks, hence kill pri", -- Desecrated Ohuna
	["192796"] = "Stun/Disturb: Rally the Clan (50% dmg done buff)", -- Nokhud Hornsounder
	["194896"] = "Purge: Stormshield ".. "\n".. "Casters: Be 15yard away too avoid Shield Bash", -- Primal Stormshield
	["199717"] = "Interrupt: Bloodcurdling Shout, AOE Fear!!!!", -- Nokhud Defender
	-- Shadowmoon Burial Ground
	["76104"] = "Interrupt (!!!): Necrotic Burst. Disease spreads", -- Monstrous Corpse Spider
	["76518"] = "Note: Debuff from hitting wall, goes away ".. "\n".. "when they despawn. So cross at last second if not kill", -- Ritual of Bones
	-- Temple of the Jade Serpent
	["59545"] = "Tank: Staggering Blow hurts alot and stack debuff ".. "\n".. "ALL: Golden Barrier explodes when breakes", -- The Golden Beetle
	["59547"] = "Healer: Dispell Throw Torch debuff on random", -- Jiang
	["200387"] = "Frontal: Flames of Doubt ".. "\n".. "ALL: Lesser Sha adds explodes on death", -- Shambling Infester
	["65317"] = "Healer: Dispell Throw Torch debuff on random", -- Xiang
	["56792"] = "Kill ASAP before Gathering Doubt finish", -- Figment of Doubt
	["59552"] = "Sooth: Fit of Rage ".. "\n".. "Dodge: Tears of Pain swirls on floor", -- The Crybaby Hozen
	-- Halls of Valor
	["97081"] = "Do last! Due to Wicked Dagger, 50% heal reduce", -- King Bjorn
	["95843"] = "Do as nr 2. Only deals tank dmg", -- King Haldor
	["97083"] = "Do as nr 1. ", -- King Ranulf
	["97084"] = "Do last! Due to add spawn", -- King Tor
	["97202"] = "Interrupt: Searing Light ".. "\n".. "Dodge: Sanctify orbs", -- Olmyr the Enlightened
	["97219"] = "Spread to avoid Arcane Bolt jumping ".. "\n".. "Stack inside Lightning Shield during Eye of the Storm", -- Solsten
	["99891"] = "Dodge: Frontal, Lightning Breath ".. "\n".. "Dodge: Crackling Storm pools on ground", -- Storm Drake
	["97788"] = "Dodge: Frontal, Lightning Breath ".. "\n".. "Dodge: Crackling Storm pools on ground", -- Storm Drake
	["97068"] = "Dodge: Frontal, Lightning Breath ".. "\n".. "Dodge: Crackling Storm pools on ground", -- Storm Drake
	["96608"] = "Healer: Dispell Throw Torch debuff on random ".. "\n".. "All: Stack losely, but spread more then 3y", -- Ebonclaw Worg
	["96664"] = "Interrupt: Etch", -- Valarjar Runecarver
	["95834"] = "Interrupt(!!!): Holy Radiance, AoE Heal ".. "\n".. "Stand in Rune of Healing for free heal! Move npc out", -- Valarjar Mystic
	-- Algeth'ar Academy
	["197406"] = "High dmg from Darting Stings, random charge ".. "\n".. "Cast's - Agitation, a stackable Enrage", -- Aggravated Skitterfly
	["197219"] = "Dodge: Detonation Seeds ground effect.", -- Vile Lasher
	-- The Azure Vault
	["187240"] = "Important: Shoulder Slam is a knock back".. "\n".. "Position to avoid triggering runes", -- Drakonid Breaker
	-- Ruby Life Pools
	["187969"] = "Stun/Disturb Tectonic Slam 40yard AOE", -- Flashfrost Earthshaper
	["190034"] = "Run away with Living Bomb - Healer focus".. "\n".. "Get out of explosion when dying", -- Blazebound Destroyer
	["187897"] = "Dodge: Bait Blazing Rush into wall", -- Defier Draghar
	-- Brackenhide Hollow
	["195135"] = "INTERRUPT(!!): Hideous Cackle, Mass-fear".. "\n".. "Do not pull the Warscourge with other mobs".. "\n".. "as it will empower them".. "\n".. "Interrupt: Hideous Cackle or get mass-feared", -- Bracken Warscourge
	["186191"] = "Kill it immediately, else it will stack up Withering Burst", -- Decay Speaker
	["189363"] = "Kill them quickly before the bleeds stack up", -- Infected Lasher
	["193799"] = "Kill them quickly. Empowers Trickclaw Mystics with dangerous spell", -- Rotchanting Totem
	-- Neltharus
	["192788"] = "Interrupt (!!!!) : Molten Core", -- Qalashi Thaumaturge
	["192782"] = "Pulse a ramping DoT onto your team with  Molten Core", -- Molten Elementals
	["189235"] = "Interrupt: Burning Roar".. "\n".. "Tank: Dmg from Imbued Magma (healer dispell dot)".. "\n".. "Dodge: Eruptive Crush, 6y aoe	", -- 	Overseer Lahar
	["189464"] = "Interrupt: Mote of Combustion cast on random".. "\n".. "Healer: Dispell Mote of Combustion".. "\n".. "Frontal: Scorching Breath	", -- 	Qalashi Irontorch
	["189467"] = "Pierce Marrow: Charges a target, decent dmg".. "\n".. "Dragonbone Axe:  Massive bleed on a random target", -- Qalashi Bonesplitter
	["194816"] = "Healers: Heavy aoe dmg every 2sec", -- Forgewrought Monstrosity
	["193291"] = "Tank: Scalding Chomp hit's hard".. "\n".. "ALL: Pushback from Candescent Tempest", -- Apex Blazewing
	-- Halls of Infusion
	["190342"] = "Interrupt: Expulse, heavy AOE dmg ".. "\n".. "Containment Beam, deal high damage and immobilize", -- Containment Apparatus
	-- Brackenhide Hollow
	["185534"] = "Dodge: Toxic Trap at all costs ".. "\n".. "Healer: Bone Bolt deals heavy dmg and leave bleed. Random", -- Bonebolt Hunter
	["185508"] = "Tank: Bloody Bite leaves Bleed dmg", -- Claw Fighter
	["185529"] = "Interrupt: Hideous Cackle at all costs, mass-fear ".. "\n".. "Kill asap due to Pack Tactics, buffing all nearby mobs", -- Bracken Warscourge
	["195135"] = "Interrupt: Hideous Cackle at all costs, mass-fear ".. "\n".. "Kill asap due to Pack Tactics, buffing all nearby mobs", -- Bracken Warscourge
	["186229"] = "Summons Lashers every 12s ".. "\n".. "Stomp is aoe dmg", -- Wilted Oak
	["193352"] = "NUKE! It CC random", -- Hextrick Totem
	["194745"] = "Nuke! ".. "\n".. "Kite: With Meat Toss on you, kite over traps", -- Rotfang Hyena
	["189363"] = "Nuke!", -- Infected Lasher
	["190426"] = "Nuke! ".. "\n".. "Group Dmg: Withering Disease effect.", -- Decay Totem
	["186191"] = "High dmg from Decay Surge & Withering Burst ".. "\n".. "Spawns Rotchanting Totem", -- Decay Speaker
	["186208"] = "Dodge: Bone Bolt Volley frontal damage ".. "\n".. "Dmg to random players, and empower Vulture & Hyena", -- Rotbow Stalker
	-- Freehold
	["130404"] = "lay traps around the area ".. "\n".. "roots you and deals very heavy damage", -- Vermin Trapper
	-- The Underrot
	["131436"] = "Frontal Cleave (Savage Cleave, heavy damage + DoT) ".. "\n".. "Warcry heavily buffs all nearby enemies", -- Chosen Blood Matron
	["131492"] = "Interrupt(!!): Dark Reconstitution (big heal) ".. "\n".. "Interrupt or Purge(!): Gift of G'huun (+100% damage, unkillable)", -- Devout Blood Priest
	["133870"] = "Interrupt(!!): Decaying Mind (Long CC) ".. "\n".. "cleansed by healing through the healing absorb", -- Diseased Lasher
	["133836"] = "Bone Shield, a big absorb on themselves ".. "\n".. "Try and AoE CC them and burn", -- Reanimated Guardian
	["138338"] = "Bone Shield, a big absorb on themselves ".. "\n".. "Try and AoE CC them and burn", -- Reanimated Guardian
	-- Uldaman: Legacy of Tyr
	["184300"] = "Healer: Thunderous Clap is 30y heavy aoe dmg ".. "\n".. "Ranged: Stay 30y away", -- Ebonstone Golem
	["184331"] = "Applies Stolen Time debuff (Dispellable) to all ".. "\n".. "Does not apply when stunned ".. "\n".. "Be careful how many of them you pull", -- Infinite Timereaver
	-- The Vortex Pinnacle
	["45915"] = "Rising Winds stacks over time increasing buff", -- Armored Mistral
	["45919"] = "Kite out of healing circle. Party can get free heal ".. "\n".. "Party: Help splitt dmg from Brutal StrikesDodge: Chilling Blast beside tank", -- Young Storm Dragon
	["45935"] = "Interrupt: Greater healing (30% health) ".. "\n".. "Desperate Speed: Increases casting speed by 50%", -- Temple Adept
	-- Neltharion's Lair
	["102404"] = "Stoneshatter is an AoE targeted on tank ".. "\n".. "Grubs MUST be CC'd or immediately killed or they'll transform", -- Stoneclaw Grubmaster
	["113537"] = "Frontal cleave. Face away from the party ".. "\n".. "Stun Interrupt: Frenzy (Huge damage buff) ".. "\n".. "Defensives: throughout and stay grouped", -- Emberhusk Dominator
	["102287"] = "Frontal cleave. Face away from the party ".. "\n".. "Stun Interrupt: Frenzy (Huge damage buff) ".. "\n".. "Defensives: throughout and stay grouped", -- Emberhusk Dominator
	["102295"] = "Frontal cleave. Face away from the party ".. "\n".. "Stun Interrupt: Frenzy (Huge damage buff) ".. "\n".. "Defensives: throughout and stay grouped", -- Emberhusk Dominator
	["98406"] = "Minor tank dmg from Impaling Shard", -- Embershard Scorpion
	["92538"] = "KILL ASAP! ".. "\n".. "CC can be used to interupt cast", -- Tarspitter Grub
	-- Dawn of the Infinite
	["198933"] = "Boss", -- Iridikron
	["198995"] = "Boss", -- Chronikar
	["198996"] = "Boss", -- Manifested Timeways
	["198997"] = "Boss", -- Blight of Galakrond
	["198998"] = "Boss", -- Tyr, the Infinite Keeper
	["198999"] = "Boss", -- Morchie
	["199000"] = "Boss", -- Chrono-Lord Deios
	["201222"] = "Move away from his  Titanic Bulwark 'sphere' ".. "\n".. "Party stand inside Sphear for dmg reduction", -- Valow, Timesworn Keeper
	["201792"] = "Boss", -- Ahnzon
	["203678"] = "Boss", -- Grommash Hellscream
	["203861"] = "Dodge: Volatile Mortar ground animation ".. "\n".. "Stun / CC Int: Deploy Goblin Sappers", -- Horde Destroyer
	["204206"] = "Interrupt: Healing Wave ".. "\n".. "Move out of Earthquake", -- Horde Farseer
	["205152"] = "Dodge: Frontal Orb of Contemplation - Stuns", -- Lerai, Timesworn Maiden
	["205158"] = "Interrupt: Binding Grasp quickly", -- Spurlok, Timesworn Sentinel
	["205435"] = "Dodge: Timerip", -- Epoch Ripper
	["206070"] = "Move away from Chronal Eruption, 5yd aoe ".. "\n".. "Int: Temporal Link", -- Chronaxie
	["206140"] = "interrupt: Infinite Bolt Volley at all costs ".. "\n".. "Healer: Dispelled Chronoburst", -- Coalesced Time
	["206214"] = "Dodge: Timeless Curse - Ground pool ".. "\n".. "Use defensive on Infinite Fury", -- Infinite Infiltrator
	["207177"] = "Dodge: Timeless Curse - Ground pool ".. "\n".. "Use defensive on Infinite Fury", -- Infinite Watchkeeper
	-- The Everbloom
	["81820"] = "Interupt Healing Waters ".. "\n".. "Stun Choking Vines", -- Everbloom Mender
	["81984"] = "Mini Boss: Dodge Living Leaves ".. "\n".. "Have room to fight", -- Gnarlroot
	["83892"] = "interrupts and stuns Revitalize and Rapid Tides ".. "\n".. "Stop Dps if having Briarskin buff ".. "\n".. "Pri 1", -- Life Warden Gola
	["84554"] = "Quickly kill. Gains Toxic Blood buff stack pr 10sec", -- Venom-Crazed Pale One
	["84957"] = "Interupt Dragon's Breath", -- Putrid Pyromancer
	-- Atal'Dazar
	["122963"] = "Line of Sight: Terrifying Visage ".. "\n".. "Tank close to Pillar for easy los", -- Rezan
	["122965"] = "Totems MUST die within 7 seconds of each other ".. "\n".. "Healer: Heavy Dot", -- Vol'kaal
	["122967"] = "Stand in the blood pools before Transfusion is cast ".. "\n".. "Priority Target (or CC): Spirit of Gold", -- Priestess Alun'za
	["122968"] = "Put down a raid marker 40 yards from the boss ".. "\n".. "During Soulrend, DPS / Healers stack on this point ".. "\n".. "Healing CD: Soulrend. Otherwise spot heal anyone who stands in spiders.", -- Yazma
	["122971"] = "Ranged Spread 8yd ".. "\n".. "Enrage: Dispel or Kite away during Fanatic's Rage", -- Dazar'ai Juggernaut
	["122984"] = "Heal and gain damage every time a nearby mob dies ".. "\n".. "Defensive: Soul Burn (Heavy DoT on one player)", -- Dazar'ai Colossus
	["125977"] = "Nuke", -- Reanimation Totem
	["127315"] = "Nuke", -- Reanimation Totem
	["127757"] = "MUST kill the reanimation totem first ".. "\n".. "Will pulse HEAVY AoE to the party after totem is dead. Kill quickly", -- Reanimated Honor Guard
	["128435"] = "Will jump to random allies and deal damage in a small AoE ".. "\n".. "Stay grouped but with a 3yd gap", -- Toxic Saurid
	["129553"] = "Interrupt or Purge: Dino Might (medium HoT)", -- Dinomancer Kish'o
	-- Waycrest Manor
	["131527"] = "Run out the debuff, stay out of purple swirls ".. "\n".. "Virulent Pathogen debuff (green circle): run it out of the group", -- Lord Waycrest
	["131545"] = "Run out the debuff, stay out of purple swirls ".. "\n".. "Lady Waycrest will fly over at 10% health", -- Lady Waycrest
	["131586"] = "Interrupt: Dinner Bell (AoE 8yd silence)", -- Banquet Steward
	["131666"] = "Interrupt(!!): Effigy Reconstruction (full AoE heal) ".. "\n".. "Interrupt or Purge(!!): Soul Fetish (buffs allies on death) ".. "\n".. "Dispel or heal: Infested Thorn", -- Coven Thornshaper
	["131667"] = "Priority Target: Soul Thorns (stuns random player until dead) ".. "\n".. "Drag the boss into fire to reset his stacks", -- Soulbound Goliath
	["131670"] = "Interrupt or Purge(!): Grasping Thorns (Stun, DoT)", -- Heartsbane Vinetwister
	["131823"] = "Aura of Dread: you MUST keep moving. ".. "\n".. "Aura of Thorns: You'll take damage after every attack ".. "\n".. "Dps MC to break free", -- Sister Malady
	["131824"] = "Aura of Dread: you MUST keep moving. ".. "\n".. "Aura of Thorns: You'll take damage after every attack ".. "\n".. "Dps MC to break free", -- Sister Solena
	["131825"] = "Aura of Dread: you MUST keep moving. ".. "\n".. "Aura of Thorns: You'll take damage after every attack ".. "\n".. "Dps MC to break free", -- Sister Briar
	["131863"] = "Dodge: Rotten Expulsion, Tenderize (Cone AoEs) ".. "\n".. "If Wasting Servants get to boss he gets damage buff ".. "\n".. "Priority Target: Wasting Servants > Boss. AoE oozelings", -- Raal the Gluttonous
	["131864"] = "Kill slaves or knock back to stop Death Lense ".. "\n".. "Kill the adds near the boss & use Alchemical Fire on corpsese", -- Gorak Tul
	["135365"] = "Interrupt(!): Ruinous Volley (AoE nuke) ".. "\n".. "Spread with Dread Mark ".. "\n".. "TANK: Use defensive for Decaying Touch (+dmg taken)", -- Matron Alma
	["136330"] = "Nuke to free player", -- Soul Thorns
	-- Black Rook Hold
	["98538"] = "Stay spread out ".. "\n".. "Moderately high tank & party damage", -- Lady Velandras Ravencrest
	["98542"] = "P2: CC a spirit to delay Soul Burst until 15% ".. "\n".. "Use ALL of your defensives on Soul Burst ".. "\n".. "Pull to one side of the room. Run out of Reap Soul", -- Amalgam of Souls
	["101549"] = "Move out of blue swirls on ground", -- Arcane Minion
	["111068"] = "Interupt Arcane Blitz, stacking 50% dmg buff", -- Archmage Galeorn
	-- Throne of the Tides
	["40577"] = "Tank used defensive for Shellbreaker and dmg taken stack".. "\n".. "Crushing Depths targets a random player, defensive", -- Naz'jar Sentinel
	["40586"] = "Interupt Water Bolt".. "\n".. "Run out with Shock Blast", -- Lady Naz'jar
	["40765"] = "Tank defensive for Crushing Claw", -- Commander Ulthok
	["40788"] = "Magic Dispell Flame Shock".. "\n".. "Kill Stormflurry Totem fast, increase tank dmg taken", -- Mindbender Ghur'sha
	["40825"] = "Earth Shards is 5yd aoe".. "\n".. "Lava Bolt also knockbacks", -- Erunak Stonespeaker
	["40925"] = "Purge the Swell magic buff", -- Tainted Sentry
	["40943"] = "Aquablast targets a random player", -- Gilgoblin Aquamage
	["44566"] = "Spam Foul Bolt if none in mele range".. "\n".. "Heal & defensives for Putrid Roar", -- Ozumat
	["213770"] = "Will buff you, and give constant damage to you", -- Ink of Ozumat
	-- Darkheart Thicket
	["95769"] = "Interrupt: Unnerving Screech (Disorient tank)", -- Mindshattered Screecher
	["95779"] = "Tank: Heavy unavoidable frontal dmg ".. "\n".. "Healer: Maddening Roar is aoe dmg", -- Festerhide Grizzly
	["96512"] = "Face away from grp", -- Archdruid Glaidalis
	["99192"] = "Tank: Defensive on Festering Rip ".. "\n".. "Stack with Nightmare Bolt, Spread with Induced Paranoia", -- Shade of Xavius
	["101991"] = "Interrupt / Stun: Tormenting Eye (Fear player) ".. "\n".. "Healer: dispel the  Tormenting Fear", -- Nightmare Dweller
	["103344"] = "Tank: Defensive on Crushing Grip ".. "\n".. "Watch traps: Shattered Earth knock back ".. "\n".. "Party: Dodge tank throw after Grip", -- Oakheart
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
	["192789"] = "Dodge: Rain of Arrows (ground) and Multi-Shot frontal cone", -- Nokhud Longbow
	["192791"] = "Tank: Pierce stacks bleed on you ".. "\n".. "Priority kill due to stacking bleed", -- Nokhud Warspear
	["199320"] = "Tank: Pierce stacks bleed on you ".. "\n".. "Priority kill due to stacking bleed", -- Nokhud Warspear
	["199321"] = "Tank: Pierce stacks bleed on you ".. "\n".. "Priority kill due to stacking bleed", -- Nokhud Warspear
	-- Shadowmoon Burial Ground
	["75451"] = "Dodge: Cry of Anguish! 6y aoe", -- Defiled Spirit
	["75966"] = "Dodge: Cry of Anguish! 6y aoe", -- Defiled Spirit
	["76057"] = "Dodge: Body Slam (cast on tank)", -- Carrion Worm
	-- Temple of the Jade Serpent
	["57109"] = "Tank: Dark Claw deals Shadow dmg", -- Minion of Doubt
	["65362"] = "Tank: Dark Claw deals Shadow dmg", -- Minion of Doubt
	["59553"] = "Dodge: Territorial Display, circle around itself ".. "\n".. "Tank: Vicious Peck stacking bleed", -- The Songbird Queen
	["200126"] = "Interrupt: Hydrolance, cast on random ".. "\n".. "Interrupt: Tidal Burst, aoe dmg", -- Fallen Waterspeaker
	["59544"] = "Interrupt: Cat Nap, Healing spell ".. "\n".. "Healer: Savage Leap, cast on random and leaves bleed", -- The Nodding Tiger
	-- Halls of Valor
	["96611"] = "Dodge: Rumbling Stomp  ".. "\n".. "Dispell: Enrage", -- Angerhoof Bull
	["96574"] = "Dodge: Charged Pulse & Crackles ".. "\n".. "Purge or Dispell at 30%: Protective Light (Shield)", -- Stormforged Sentinel
	["101637"] = "Dodge: Blast of Light, 1 shot frontal ".. "\n".. "Valkyra's Advance is leap on random", -- Valarjar Aspirant
	["95832"] = "Tank: Dodge Mortal Hew, Frontal ".. "\n".. "Tank: Watch Breach Armor debuff, stacks", -- Valarjar Shieldmaiden
	["101639"] = "Tank: Dodge Mortal Hew, Frontal ".. "\n".. "Tank: Watch Breach Armor debuff, stacks", -- Valarjar Shieldmaiden
	-- Algeth'ar Academy
	["196577"] = "Tank: Heavy dmg from Severing Slash ".. "\n".. "Also bad bleed effect", -- Spellbound Battleaxe
	["197904"] = "Tank: Heavy dmg from Severing Slash ".. "\n".. "Also bad bleed effect", -- Spellbound Battleaxe
	["196671"] = "Dodge: Riftbreath !!! ".. "\n".. "Charges furthest target with Vicious Ambush", -- Arcane Ravager
	-- The Azure Vault
	["186740"] = "DODGE: Frontal cone aimed at tank.", -- Arcane Construct
	["196115"] = "ToDo", -- Arcane Tender
	["187160"] = "DODGE: Frontal cone aimed at tank.", -- Crystal Fury
	["191739"] = "Frontal: Aimed at tank ".. "\n".. "Defensive: Ice Cutter", -- Scalebane Lieutenant
	["190510"] = "TANK, Defensive: Ice Cutter", -- Vault Guard
	-- Ruby Life Pools
	["190206"] = "High Pri: Stun/Disturb Flame Dance", -- Primalist Flamedancer
	["197697"] = "Dodge: Flame Breath frontal cast".. "\n".. "DPS: Use cooldowns when below 50%", -- Flamegullet
	["197698"] = "Dodge: Storm Breath at all cost!!!".. "\n".. "Tank: Defensives for Thunder Jaw".. "\n".. "Healer: Dispell first Rolling tunder fast", -- 	Thunderhead
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
	["192787"] = "Frontal knockback", -- Qalashi Spinecrusher
	["189266"] = "Deadly Frontal: Magma Fist! DODGE".. "\n".. "Dispell/Sooth: Fired Up", -- Qalashi Trainee
	["189471"] = "Tank: Reverberating Slam, hit hard and leave a DoT".. "\n".. "Stop Cast: Forgestomp", -- Qalashi Blacksmith
	-- Halls of Infusion
	["190340"] = "Interrupt: Demoralizing Shout ".. "\n".. "Tank: Both bleed and Spear Flurry hurts", -- Refti Defender
	["190359"] = "Increasing dmg the longer they live ".. "\n".. "Only important for ramp-up dmg (Fortify)", -- Skulking Zealot
	["190401"] = "Dispell: Binding Winds if pulled with Primalist Galesinger ".. "\n".. "Note: Only priority if buffed with Affinity. Else they are equal", -- Gusting Proto-DragonLight
	["190404"] = "DODGE!! : Tectonic Breath, frontal ".. "\n".. "Beware of its  Creeping Mold, as it stacks", -- Subterranean Proto-DragonLight
	-- Brackenhide Hollow
	["186122"] = "Tank: Cleave is 8y frontal dmg ".. "\n".. "Tank: Soak Savage Charge cast on random player", -- Rira Hackclaw
	["186116"] = "Tank: Gut Shot ability, high damage and knocks you back. ", -- Gutshot
	-- Freehold
	["130400"] = "Dodge: Boulder toss & Ground Shatter", -- Irontide Crusher
	["129602"] = "Frontal cleave (tank can dodge after cast starts) ".. "\n".. "Pull one at a time if possible", -- Irontide Enforcer
	["127106"] = "Heavy tank damage ".. "\n".. "Dispel(!): Oiled Blade", -- Irontide Officer
	["129527"] = "Goin' Bananas is 5y aoe", -- Bilge Rat Buccaneer
	["130011"] = "Frontal cleave (tank can dodge after cast starts)", -- Irontide Buccaneer
	["126928"] = "Moderate tank damage ".. "\n".. "Healer: Dispell Poisoning Strike at 2 stacks", -- Irontide Corsair
	["129601"] = "Will drag random ranged players into him ".. "\n".. "Carefull when close to Crusher's Ground shatter", -- Cutwater Harpooner
	-- The Underrot
	["131402"] = "Stacks HEAVY DoT on the tank ".. "\n".. "explodes on death", -- Underrot Tick
	["130909"] = "Frontal breath on random. Dodge after cast starts", -- Fetid Maggot
	["138281"] = "Dodge: Maddening Gaze (Long fear, Frontal) ".. "\n".. "Dodge tentacles that spawns", -- Faceless Corruptor
	-- Uldaman: Legacy of Tyr
	["184023"] = "Tank: Chomp & it's bleed deals alot of dmg", -- Vicious Basilisk
	["184020"] = "Dodge: Brutal Slam or get stunned ".. "\n".. "Buffs everyone when below 40%", -- Hulking Berserker
	["184130"] = "Frontal Cleave ".. "\n".. "Apply Rending Slash bleed on mele attack", -- Earthen Custodian
	["184107"] = "Dodge: Fissuring Slam pools ".. "\n".. "Use personals during Earthquake", -- Runic Protector
	["184303"] = "Healer: Pounce on random target is heavy dmg ".. "\n".. "Auto attack leaves poison debuff. Can be dispelled", -- Skittering Crawler
	["184131"] = "Tank: Kite mobs out of Blessing of Tyr bubble ".. "\n".. "Tank: Bulwark Slam hit's hard", -- Earthen Guardian 
	-- The Vortex Pinnacle
	["45477"] = "Charge stunns player ".. "\n".. "Air Nova: Knock back when killed ".. "\n".. "Frontal: Wind Blast, reduce 75% attack speed", -- Gust Soldier
	["45928"] = "Tank: Shockwave is frontal stun, 10y", -- Executor of the Caliph
	-- Neltharion's Lair
	["91006"] = "Moderate tank damage ".. "\n".. "Easily kited", -- Rockback Gnasher
	["92612"] = "Dodge: Avalanche cast ".. "\n".. "Watch where party players was standing", -- Mightstone Breaker
	["90997"] = "Dodge: Avalanche cast ".. "\n".. "Watch where party players was standing", -- Mightstone Breaker
	["113998"] = "Dodge: Avalanche cast ".. "\n".. "Watch where party players was standing", -- Mightstone Breaker
	["91000"] = "Stun interrupt: Piercing Shards (Huge cone AoE damage) ".. "\n".. "Face mob away from the party to minimize damage ".. "\n".. "Shards ALWAYS follow Fracture knock back", -- Vileshard Hulk
	-- Dawn of the Infinite
	["199749"] = "Frontal: Untwist ", -- Timestream Anomaly
	["205408"] = "Stun/CC Int: Temposlice ", -- Infinite Timeslicer
	["205804"] = "Aura damages party every 2sec", -- Risen Dragon
	["207969"] = "Interrupt Rallying Cry ".. "\n".. "Dodge Frontal Sundering Slam", -- Horde Raider
	["208438"] = "Dodge Frontal Bronze Exhalation ".. "\n".. "Dodge: Timeless Curse - Ground pool", -- Infinite Saboteur
	["208440"] = "Dodge Frontal Bronze Exhalation ".. "\n".. "Dodge: Timeless Curse - Ground pool", -- Infinite Slayer
	-- The Everbloom
	["81864"] = "Stacking tank debuff", -- Dreadpetal
	["84400"] = "Lumbering Swipe is frontal", -- Flourishing Ancient
	["84767"] = "Watch knockback from Noxious Eruption ".. "\n".. "debuff the tank with  Poisonous Claws", -- Twisted Abomination
	["85232"] = "Spore Breath is frontal", -- Infested Venomfang
	["86372"] = "Dodge Bounding Whirl (Leap) ".. "\n".. "Sooth/TQ Enrage ".. "\n".. "Dodge Vile Breath Cone", -- Melded Berserker
	["212981"] = "Fungal Fist is 5yd range", -- Hapless Assistant
	-- Atal'Dazar
	["122970"] = "Heavy tank damage. Particularly during Venonfang Strike", -- Shadowblade Stalker
	["127799"] = "Minor tank damage. Not dangerous.", -- Dazar'ai Honor Guard
	["127879"] = "Channels a big damage reduction shield that protects nearby enemies ".. "\n".. "Use Knockbacks", -- Shieldbearer of Zul
	["129552"] = "Wild Trash is 8y Aoe", -- Monzumi
	["135989"] = "Channels a big damage reduction shield that protects nearby enemies ".. "\n".. "Use Knockbacks", -- Shieldbearer of Zul
	-- Waycrest Manor
	["131585"] = "Frontal Cleave (Shadow Cleave)", -- Enthralled Guard
	["131677"] = "Frontal Cleave (Marking Cleave, tank can dodge after cast start) ".. "\n".. "Interrupt(!): Etch (ST damage channel)", -- Heartsbane Runeweaver
	["131858"] = "Heavy tank damage & Explode on death ".. "\n".. "Sooth or TQ Shot Enrage (+25% dmg)", -- Thornguard
	["135329"] = "Tank: Use CD's on Thorned Barrage (heavy dmg) ".. "\n".. "All move out of brown swirls/Splinter Spike", -- Matron Bryndle
	-- Black Rook Hold
	["98243"] = "Beware: Bonebreaking Strike stuns in a frontal line", -- Soul-Torn Champion
	["98706"] = "Beware: Bonebreaking Strike stuns in a frontal line", -- Commander Shemdah'sohn
	["98810"] = "Stun Interrupt: Brutal Assault ".. "\n".. "Brutal Assault deals heavy tank damage. Stun or run away", -- Wrathguard Bladelord
	["102094"] = "Coup de Grace deals heavy damage", -- Risen Swordsman
	["102788"] = "Interrupt: Felfrenzy", -- Felspite Dominator
	-- Throne of the Tides
	["40936"] = "Dodge: Combo of Clenching Tentacles into Shadow Smash".. "\n".. "Crush targets the tank", -- Faceless Watcher
	["212673"] = "Acid Barrage is frontal. Face away from grp", -- Naz'jar Ravager
	-- Darkheart Thicket
	["95766"] = "Dodge: Crazed Razorbeak - Frontal Charge", -- Crazed Razorbeak
	["100526"] = "Disease dispel to avoid drain and heal", -- Tormented Bloodseeker
	["100531"] = "Frontal Charge: Face into wall", -- Bloodtainted Fury
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
