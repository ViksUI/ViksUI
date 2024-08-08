local T, C, L = unpack(ViksUI)

if C.misc.InfoPanel_Stats ~= true then return end
----------------------------------------------------------------------------------------
-- Stats Panel with info currently from Wowhead
----------------------------------------------------------------------------------------
local InfoStats = {}
--DH Havoc
InfoStats["DEMONHUNTER-577"] = "Single Target: Agility > Critical Strike > Mastery > Haste > Versatility \n Multiple Target: Agility > Critical Strike > Mastery > Versatility > Haste"
--DH Vengeance
InfoStats["DEMONHUNTER-581"] = "Agility > Critical Strike > Haste > Versatility > Mastery"

--DEATHKNIGHT Blood
InfoStats["DEATHKNIGHT-250"] = "Item Level > Haste = Critical Strike = Versatility = Mastery"
--DEATHKNIGHT Frost
InfoStats["DEATHKNIGHT-251"] = "Critical Strike > Mastery > Haste > Versatility"
--DEATHKNIGHT Unholy
InfoStats["DEATHKNIGHT-252"] = "Single Target: Mastery > Haste > Critical Strike > Versatility \n Multiple Target: Mastery > Critical Strike > Haste > Versatility"

--DRUID Balance
InfoStats["DRUID-102"] = "Intellect > Mastery > Haste > Critical Strike > Versatility"
--DRUID Feral
InfoStats["DRUID-103"] = "Single Target: Agility > Mastery > Critical Strike > Haste > Versatility \n Multiple Target: Agility > Mastery > Critical Strike > Haste = Versatility"
--DRUID Guardian
InfoStats["DRUID-104"] = "Surv: Agility > Haste > Versatility > Mastery > Critical Strike \n DPS: Agility > Versatility = Haste > Critical Strike = Mastery"
--DRUID Restoration
InfoStats["DRUID-105"] = "Raid: Intellect > Haste > Mastery > Critical Strike = Versatility \n Dung: Intellect > Mastery = Haste > Versatility > Critical Strike \n Dung Dps: Intellect > Haste > Versatility > Critical Strike > Mastery"

--EVOKER Devastation
InfoStats["EVOKER-1467"] = "Intellect > Critical Strike >= Versatility = Mastery = Haste"
--EVOKER Preservation
InfoStats["EVOKER-1468"] = "Myth+: Intellect > Critical Strike > Haste > Versatility > Mastery \n Raid: Intellect > Mastery > Critical Strike > Versatility > Haste"
--EVOKER Augmentation
InfoStats["EVOKER-1473"] = "Intellect > Mastery > Critical Strike > Haste > Versatility"

--HUNTER BM
InfoStats["HUNTER-253"] = "Haste 30% > Critical Strike 44% > Mastery 540 > Versatility"
--HUNTER MM
InfoStats["HUNTER-254"] = "Haste 30% > Critical Strike 44% > Mastery = Versatility"
--HUNTER SV
InfoStats["HUNTER-255"] = "Haste 30% > Critical Strike 44% > Versatility > Haste = Critical Strike > Mastery"

--MAGE Arcane
InfoStats["MAGE-62"] = "Intellect > Critical Strike > Mastery > Haste > Versatility"
--MAGE Fire
InfoStats["MAGE-63"] = "Intellect > Haste > Critical Strike > Versatility > Mastery"
--MAGE Frost
InfoStats["MAGE-64"] = "Intellect > Mastery > Haste > Critical Strike 33.34% > Versatility"

--MONK Brewmaster
InfoStats["MONK-268"] = "Defensive: Agility > Versatility = Mastery = Critical Strike > Haste \n Offensive: Agility > Versatility = Critical Strike > Mastery > Haste"
--MONK Windwalker
InfoStats["MONK-269"] = "Weapon Damage > Agility > Versatility = Critical Strike > Mastery > Haste"
--MONK Mistweaver
InfoStats["MONK-270"] = "Myth+: Intellect > Haste > Mastery > Versatility > Critical Strike \n Raid: Intellect > Haste > Critical Strike > Versatility > Mastery"

--PALA Holy
InfoStats["PALADIN-65"] = "Raid: Intellect > Mastery = Critical Strike > Versatility > Haste \n Myth+: Intellect > Critical Strike = Haste > Versatility > Mastery"
--PALA Protection
InfoStats["PALADIN-66"] = "Strength > Haste ≥ Mastery ≥ Versatility > Critical Strike"
--PALA Retribution
InfoStats["PALADIN-70"] = "Strength > Haste > Versatility = Critical Strike > Mastery"

--PRIESTDiscipline
InfoStats["PRIEST-256"] = "Intellect > Haste > Critical Strike > Versatility > Mastery"
--PRIESTHoly
InfoStats["PRIEST-257"] = "Myth+: Intellect > Critical Strike = Haste > Versatility > Mastery \n Raid: Intellect > Mastery = Critical Strike > Versatility > Haste"
--PRIESTShadow
InfoStats["PRIEST-258"] = "Intellect > Haste > Mastery > Critical Strike > Versatility"

--ROGUE Assassination
InfoStats["ROGUE-259"] = "Critical Strike > Mastery > Versatility > Haste"
--ROGUE Outlaw
InfoStats["ROGUE-260"] = "Versatility > Critical Strike > Mastery > Haste"
--ROGUE Subtlety
InfoStats["ROGUE-261"] = "Critical Strike > Mastery > Versatility > Haste"

--SHAMAN Elemental
InfoStats["SHAMAN-262"] = "Fire: Intellect > Mastery > Haste > Versatility > Critical Strike \n Lightning: Intellect > Haste > Critical Strike > Versatility > Mastery"
--SHAMAN Enhancement
InfoStats["SHAMAN-263"] = "Elem: Agility > Mastery > Haste > Critical Strike > Versatility > Critical Strike \n Storm: Agility > Haste > Mastery > Critical Strike > Versatility"
--SHAMAN Restoration
InfoStats["SHAMAN-264"] = "Intellect > Versatility = Critical Strike > Haste = Mastery"

--WARLOCK Affliction
InfoStats["WARLOCK-265"] = "Intellect > Haste 30% > Mastery > Versatility = Critical Strike"
--WARLOCK Demonology
InfoStats["WARLOCK-266"] = "Intellect > Haste 24% > Critical Strike = Versatility > Mastery"
--WARLOCK Destruction
InfoStats["WARLOCK-267"] = "Intellect > Haste 30% > Critical Strike = Versatility > Mastery"

--WARR Arms
L["WARRIORArms"] = "Strength > Haste > Critical Strike > Versatility > Mastery"
--WARR Fury
L["WARRIORFury"] = "Strength > Haste > Mastery > Versatility > Critical Strike"
--WARR Protection
L["WARRIORProtection"] = "Strength > Haste > Versatility = Critical Strike > Mastery"

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