local T, C, L = unpack(ViksUI)

-- InfoStats.lua
-- This file contains the stats information for all classes and specializations.

InfoStats = {}
--DH Havoc

InfoStats["DEMONHUNTER-577"] = "Critical Strike = Mastery > Haste > Versatility > Agility"
--DH Vengeance
InfoStats["DEMONHUNTER-581"] = "Agility > Haste > Critical Strike = Mastery > Versatility"

--DEATHKNIGHT Blood
InfoStats["DEATHKNIGHT-250"] = "Deathbringer: Item Level > Haste (5%) > Critical Strike = Versatility = Mastery \n San'layn: Item Level > Haste > Critical Strike = Versatility = Mastery"
--DEATHKNIGHT Frost
InfoStats["DEATHKNIGHT-251"] = "Critical Strike >> Mastery > Haste > Versatility"
--DEATHKNIGHT Unholy
InfoStats["DEATHKNIGHT-252"] = "Haste ≥ Mastery >> Versatility ≥ Critical Strike"

--DRUID Balance
InfoStats["DRUID-102"] = "Intellect > Mastery > Haste > Versatility > Critical Strike"
--DRUID Feral
InfoStats["DRUID-103"] = "Mastery = Critical Strike > Versatility > Haste > Agility"
--DRUID Guardian
InfoStats["DRUID-104"] = "Survivability: Agility > Haste > Versatility > Mastery > Critical Strike \n DPS: Agility > Versatility = Haste > Critical Strike = Mastery"
--DRUID Restoration
InfoStats["DRUID-105"] = "Raid: Intellect > Haste > Mastery > Versatility > Critical Strike \n Dungeon Healing: Intellect > Mastery = Haste > Versatility > Critical Strike \n Dungeon Damage Dealing: Intellect > Haste > Versatility > Critical Strike > Mastery"

--EVOKER Devastation
InfoStats["EVOKER-1467"] = "Intellect > Haste > Critial Strike > Mastery > Versatility"
--EVOKER Preservation
InfoStats["EVOKER-1468"] = "Myth+: Intellect > Critical Strike > Haste > Versatility > Mastery \n Raid: Intellect > Mastery > Critical Strike > Haste > Versatility"
--EVOKER Augmentation
InfoStats["EVOKER-1473"] = "Intellect > Critical Strike > Haste > Mastery > Versatility"

--HUNTER BM
InfoStats["HUNTER-253"] = "Agility > Haste > Critical Strike > Mastery > Versatility"
--HUNTER MM
InfoStats["HUNTER-254"] = "Agility > Critical Strike > Mastery > Versatility > Haste"
--HUNTER SV
InfoStats["HUNTER-255"] = "Agility > Mastery > Haste > Critical Strike > Versatility"

--MAGE Arcane
InfoStats["MAGE-62"] = "Intellect > Haste > Versatility > Mastery > Critical Strike"
--MAGE Fire
InfoStats["MAGE-63"] = "Intellect > Haste > Mastery > Versatility > Critical Strike"
--MAGE Frost
InfoStats["MAGE-64"] = "Intellect > Haste > Critical Strike to 33.34% > Mastery > Versatility"

--MONK Brewmaster
InfoStats["MONK-268"] = "Agility = Armor > Versatility = Mastery = Critical Strike > Haste"
--MONK Windwalker
InfoStats["MONK-269"] = "Agility > Mastery = Haste > Versatility = Critical Strike"
--MONK Mistweaver
InfoStats["MONK-270"] = "Intellect > Haste > Critical Strike > Versatility > Mastery"

--PALA Holy
InfoStats["PALADIN-65"] = "Raid: Intellect > Haste > Mastery > Versatility \n Myth+: Intellect > Haste > Versatility > Critical Strike > Mastery"
--PALA Protection
InfoStats["PALADIN-66"] = "Strength > Haste ≥ Mastery ≥ Versatility > Critical Strike"
--PALA Retribution
InfoStats["PALADIN-70"] = "Strength > Mastery = Critical Strike > Haste > Versatility"

--PRIESTDiscipline
InfoStats["PRIEST-256"] = "Intellect > Haste to 20%-25% > Critical Strike = Mastery > Versatility"
--PRIESTHoly
InfoStats["PRIEST-257"] = "Myth+: Intellect > Critical Strike = Haste > Versatility > Mastery \n Raid: Intellect > Critical Strike = Mastery > Versatility >= Haste"
--PRIESTShadow
InfoStats["PRIEST-258"] = "Intellect > Haste > Mastery > Critical Strike > Versatility"

--ROGUE Assassination
InfoStats["ROGUE-259"] = "Agility > Critical Strike > Mastery > Haste > Versatility"
--ROGUE Outlaw
InfoStats["ROGUE-260"] = "Agility > Versatility > Haste > Critical Strike > Mastery"
--ROGUE Subtlety
InfoStats["ROGUE-261"] = "Agility > Mastery > Versatility > Critical Strike > Haste"

--SHAMAN Elemental
InfoStats["SHAMAN-262"] = "Intellect > Mastery > Haste > Versatility > Critical Strike"
--SHAMAN Enhancement
InfoStats["SHAMAN-263"] = "Mastery > Haste > Critical Strike > Versatility > Agility"
--SHAMAN Restoration
InfoStats["SHAMAN-264"] = "Intellect > Haste > Critical Strike > Versatility > Mastery"

--WARLOCK Affliction
InfoStats["WARLOCK-265"] = "Intellect > Mastery = Critical Strike > Haste > Versatility"
--WARLOCK Demonology
InfoStats["WARLOCK-266"] = "Intellect > Haste = Critical Strike = Versatility > Mastery"
--WARLOCK Destruction
InfoStats["WARLOCK-267"] = "Haste = Critical Strike > Intellect > Mastery > Versatility"

--WARR Arms
InfoStats["WARRIOR-71"] = "Strength > Critical Strike > Haste > Mastery > Versatility"
--WARR Fury
InfoStats["WARRIOR-72"] = "Strength > Mastery > Haste > Versatility > Critical Strike"
--WARR Protection
InfoStats["WARRIOR-73"] = "Strength > Haste > Critical Strike = Versatility > Mastery"

return InfoStats