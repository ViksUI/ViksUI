local T, C, L = unpack(ViksUI)

if C.misc.InfoPanel_Stats ~= true then return end
----------------------------------------------------------------------------------------
-- Stats Panel with info currently from Wowhead
----------------------------------------------------------------------------------------
local InfoStats = {}
--DH Havoc
InfoStats["DEMONHUNTER-577"] = "Fel-Scarred: Mastery > Critical Strike > Agility > Haste > Versatility \n Aldrachi Reaver: Critical Strike > Agility > Mastery > Haste > Versatility "
--DH Vengeance
InfoStats["DEMONHUNTER-581"] = "Aldrachi Reaver: Item Level >> Haste > Critical Strike > Versatility > Mastery \n Fel-Scarred: Item Level >> Haste > Critical Strike > Versatility > Mastery"

--DEATHKNIGHT Blood
InfoStats["DEATHKNIGHT-250"] = "Deathbringer: Item Level > Haste (5%) >> Critical Strike > Versatility = Mastery > Haste \n San'layn: Item Level > Haste > Critical Strike = Versatility = Mastery"
--DEATHKNIGHT Frost
InfoStats["DEATHKNIGHT-251"] = "Critical Strike >> Mastery > Haste > Versatility"
--DEATHKNIGHT Unholy
InfoStats["DEATHKNIGHT-252"] = "Haste ≥ Mastery >> Versatility ≥ Critical Strike"

--DRUID Balance
InfoStats["DRUID-102"] = "Intellect > Mastery > Haste > Critical Strike > Versatility "
--DRUID Feral
InfoStats["DRUID-103"] = "Agility > Critical Strike ≥ Mastery  Haste > Versatility"
--DRUID Guardian
InfoStats["DRUID-104"] = "Surv: Agility > Versatility > Haste > Mastery > Critical Strike \n DPS: Agility > Haste > Versatility > Critical Strike = Mastery"
--DRUID Restoration
InfoStats["DRUID-105"] = "Raid: Intellect > Haste > Mastery > Versatility > Critical Strike \n Dungeon Healing: Intellect > Mastery = Haste > Versatility > Critical Strike \n Dungeon Damage Dealing: Intellect > Haste > Versatility > Critical Strike > Mastery"

--EVOKER Devastation
InfoStats["EVOKER-1467"] = "Scalecommander: Intellect > Critical Strike > Haste > Mastery > Versatility \n Flameshaper: Intellect > Critical Strike > Mastery > Versatility > Haste"
--EVOKER Preservation
InfoStats["EVOKER-1468"] = "Myth+: Intellect > Critical Strike ≥ Mastery > Haste ≥ Versatility >  \n Raid: Intellect > Mastery > Critical Strike > Versatility > Haste"
--EVOKER Augmentation
InfoStats["EVOKER-1473"] = "Chronowarden: Intellect > Mastery > Critical Strike > Haste > Versatility \n Scalecommander: Intellect > Mastery > Critical Strike > Haste > Versatility"

--HUNTER BM
InfoStats["HUNTER-253"] = "Pack Leader ST: Wep Dmg >> Critical Strike ≥ Mastery > Haste > Agility > Versatility \n Dark Ranger ST: Wep DMG >> Haste > Critical Strike ≥ Mastery > Agility > Versatility \n Multi-Target: Wep DMG >> Mastery > Haste ≥ Critical Strike > Agility > Versatility"
--HUNTER MM
InfoStats["HUNTER-254"] = "Sentinel: Weapon Damage > Critical Strike > Mastery > Agility > Versatility > Haste \n Dark Ranger: Weapon Damage > Critical Strike > Haste > Mastery > Agility > Versatility"
--HUNTER SV
InfoStats["HUNTER-255"] = "Pack Leader: Agility > Mastery ≥ Critical Strike  > Haste > Versatility \n Sentinel: Agility > Mastery > Critical Strike  > Haste ≥ Versatility"

--MAGE Arcane
InfoStats["MAGE-62"] = "Sunfury: Intellect > Haste > Mastery > Critical Strike > Versatility \n Spellslinger: Intellect > Haste > Critical Strike > Versatility > Mastery"
--MAGE Fire
InfoStats["MAGE-63"] = "Sunfury: Intellect > Haste > Mastery > Versatility > Critical Strike \n Frostfire: Intellect > Haste > Versatility > Mastery > Critical Strike"
--MAGE Frost
InfoStats["MAGE-64"] = "Frostfire: Intellect > Haste ≥ Critical Strike > Mastery > Versatility \n Spellslinger: Intellect > Haste ≥ Critical Strike ≥ Mastery > Versatility"

--MONK Brewmaster
InfoStats["MONK-268"] = "Defensive: Agility >> Versatility = Mastery = Critical Strike > Haste \n Offensive: Agility >> Versatility = Critical Strike > Mastery > Haste"
--MONK Windwalker
InfoStats["MONK-269"] = "Weapon Damage > Agility > Haste >> Versatility > Critical Strike > Mastery"
--MONK Mistweaver
InfoStats["MONK-270"] = "Myth+: Intellect >> Haste > Critical Strike ≥ Mastery > Versatility \n Raid: Intellect >> Haste > Versatility > Critical Strike > Mastery"

--PALA Holy
InfoStats["PALADIN-65"] = "Raid: Intellect > Haste > Mastery > Critical Strike > Versatility \n Myth+: Intellect > Haste > Critical Strike ≥ Versatility > Mastery"
--PALA Protection
InfoStats["PALADIN-66"] = "Strength > Haste > Mastery > Versatility ≥ Critical Strike"
--PALA Retribution
InfoStats["PALADIN-70"] = "Strength > Mastery >> Haste ≥ Critical Strike > Versatility"

--PRIESTDiscipline
InfoStats["PRIEST-256"] = "Raid: Intellect >> Haste > Critical Strike ≥ Mastery > Versatility \n M+: Intellect >> Haste > Critical Strike > Versatility ≥ Mastery"
--PRIESTHoly
InfoStats["PRIEST-257"] = "Myth+: Intellect >> Haste > Versatility > Critical Strike > Mastery \n Raid: Intellect >> Critical Strike = Mastery > Versatility > Haste"
--PRIESTShadow
InfoStats["PRIEST-258"] = "Archon: Intellect > Haste > Mastery > Critical Strike > Versatility \n Voidweaver: Intellect > Haste (20%) > Mastery > Critical Strike > Versatility"

--ROGUE Assassination
InfoStats["ROGUE-259"] = "Agility > Critical Strike ≥ Mastery ≥ Haste > Versatility"
--ROGUE Outlaw
InfoStats["ROGUE-260"] = "Agility >> Versatility ≥ Haste > Critical Strike > Mastery"
--ROGUE Subtlety
InfoStats["ROGUE-261"] = "Agility > Mastery ≥ Versatility > Critical Strike >> Haste"

--SHAMAN Elemental
InfoStats["SHAMAN-262"] = "Intellect > Haste > Critical Strike ≥ Versatility > Mastery"
--SHAMAN Enhancement
InfoStats["SHAMAN-263"] = "Totemic: Agility ≥ Haste > Mastery> Critical Strike ≥ Versatility \n Stormbringer: Haste = Agility > Mastery > Versatility > Critical Strike"
--SHAMAN Restoration
InfoStats["SHAMAN-264"] = "Intellect > Critical Strike ≥ Versatility > Haste > Mastery"

--WARLOCK Affliction
InfoStats["WARLOCK-265"] = "Intellect > Critical Strike > Mastery > Haste > Versatility"
--WARLOCK Demonology
InfoStats["WARLOCK-266"] = "Intellect >> Haste 24% > Critical Strike ≥ Versatility > Mastery"
--WARLOCK Destruction
InfoStats["WARLOCK-267"] = "Intellect > Haste > Mastery > Critical Strike > Versatility"

--WARR Arms
InfoStats["WARRIOR-71"] = "Strength >> Critical Strike > Haste > Mastery ≥ Versatility"
--WARR Fury
InfoStats["WARRIOR-72"] = "Strength >> Mastery > Haste > Versatility > Critical Strike"
--WARR Protection
InfoStats["WARRIOR-73"] = "Strength > Haste > Critical Strike ≥ Versatility > Mastery"

ViksUI_StatTable = InfoStats

ViksUI_STATS = CreateFrame("Frame",ViksUI_STATS,UIParent)

function ViksUI_STATS:CreateWin()
    if PaperDollFrame:IsVisible() then
        if not ViksUI_STATSwin then
			ViksUI_STATSwin = CreateFrame("Frame",ViksUI_STATSwin,ViksUI_STATS)
			local f = ViksUI_STATS
			f:SetParent(CharacterFrame)
			f:SetTemplate("Overlay")
			f:SetFrameStrata("TOOLTIP")
			f:ClearAllPoints()
			f:SetPoint("BOTTOMRIGHT",CharacterFrame,"TOPRIGHT", 0,3)
			f:SetPoint("TOPLEFT",CharacterFrame,"TOPLEFT", 0,30)

			ViksUI_STATStxt = f:CreateFontString(nil,"OVERLAY")
			ViksUI_STATStxt:SetFont(C.media.pxfontHeader, C.media.pxfontHsize)
			local ft = ViksUI_STATStxt 
			ft:ClearAllPoints()
			ft:SetAllPoints(ViksUI_STATS) 
			ft:SetJustifyH("CENTER")
			ft:SetJustifyV("MIDDLE")            
			f:Show()            
        end
        return true
    end
    return false
end

function ViksUI_STATS:Update()
    if ViksUI_STATS:CreateWin() then
        local _, className = UnitClass("player")
		local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
		local classcolor = T.RGBToHex(unpack(C.media.border_color))
		local statcolor = T.RGBToHex(class.r, class.g, class.b)
        local sId, specName = GetSpecializationInfo(GetSpecialization())
        local s = ViksUI_StatTable[className .. "-" .. sId]
        if s then
            s = gsub(s,"Agility","AGI")
            s = gsub(s,"Intellect","INT")
            s = gsub(s,"Critical Strike","CRIT")
            s = gsub(s,"Single Target:","|cFFFFFF00ST:|r")
            s = gsub(s,"Multiple Target:","|cFFFFFF00AoE:|r")
            s = gsub(s,"Item Level","iLvL")
            s = gsub(s,"Haste","HAST")
            s = gsub(s,"Versatility","VERS")
            s = gsub(s,"Mastery","MAST")
            s = gsub(s,"Strength","STR")
            s = gsub(s,"Myth+:","|cFFFFFF00M+:|r")
            s = gsub(s,"Raid:","|cFFFFFF00Raid:|r")
            s = gsub(s,"Weapon Damage","WDMG")
            ViksUI_STATStxt:SetText(classcolor..specName..": "..statcolor..s) 
        end
		if strlen(s) > 70 then
			ViksUI_STATS:SetPoint("TOPLEFT",CharacterFrame,"TOPLEFT", 0,48)
		else
			ViksUI_STATS:SetPoint("TOPLEFT",CharacterFrame,"TOPLEFT", 0,30)
		end
	end
end

local f = ViksUI_STATS
f:RegisterEvent("SPELLS_CHANGED") 
f:RegisterEvent("ADDON_LOADED") 
f:SetScript("OnEvent", function(self, event, ...)
	ViksUI_STATS:Update()
	PaperDollFrame:HookScript("OnShow", function() ViksUI_STATS:Update() end)
    if event == "SPELLS_CHANGED" then
		ViksUI_STATS:Update()
    end
end)