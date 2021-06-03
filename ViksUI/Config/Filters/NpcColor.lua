local T, C, L, _ = unpack(select(2, ...))
	
T.PlateDangerous = {
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
}

T.PlateImportant = {
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
}

T.PlateNuke = {
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
}

T.PlateT3Mobs = {
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