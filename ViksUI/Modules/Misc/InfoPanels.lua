local T, C, L, _ = unpack(select(2, ...))
if C.misc.InfoPanel_Stats ~= true then return end
----------------------------------------------------------------------------------------
-- Stats Panel with info from https://www.icy-veins.com - Credit to Wyr3d and Papasol for the idea
----------------------------------------------------------------------------------------
local IcyVeinStats = {}
IcyVeinStats["DEATHKNIGHT-250"] = "iLvL > Haste > Crit = Mast > Vers" --// Blood DK
IcyVeinStats["DEATHKNIGHT-251"] = "Crit > Mast > Haste > Vers" --// Frost DK
IcyVeinStats["DEATHKNIGHT-252"] = "|cFFFFFF00General:|r Haste > Mast > Crit > Vers |cFFFFFF00AoE:|r Mast > Crit > Haste > Vers" --// Unholy DK

IcyVeinStats["DRUID-102"] = "Int > Mast > Haste > Crit > Vers" --// Boomkin Druid
IcyVeinStats["DRUID-103"] = "Agil > Crit > Mast > Haste > Vers" --// Feral Druid
IcyVeinStats["DRUID-104"] = "|cFFFFFF00Surv:|r iLvL > Armor = Agil = Stam > Haste > Vers > Mast |cFFFFFF00Dmg:|r Agil > Vers = Haste > Crit = Mast" --// Bear Druid
IcyVeinStats["DRUID-105"] = "|cFFFFFF00Raid:|r Int > Haste > Mast > Crit = Vers|cFFFFFF00Dung+dmg:|r Int > Haste > Vers > Crit > Mast" --// Restro Druid

IcyVeinStats["EVOKER-1467"] = "Int/iLvL > Mast > Haste > Crit > Vers" --// Devastation
IcyVeinStats["EVOKER-1468"] = "|cFFFFFF00Raid:|r Int > Mast > Crit  > Vers > Haste |cFFFFFF00Dung:|r Int > Crit > Haste > Vers > Mast" --// Preservation

IcyVeinStats["HUNTER-253"] = "Haste > Crit > Mast > Vers" --// Beast Master Hunter
IcyVeinStats["HUNTER-254"] = "Mast > Crit > Vers > Haste" --// Marksman Hunter
IcyVeinStats["HUNTER-255"] = "Haste > Crit > Vers > Mast" --// Survival Hunter

IcyVeinStats["MAGE-62"] = "Int > Crit > Mast > Vers > Haste" --// Arcane Mage
IcyVeinStats["MAGE-63"] = "Int > Haste > Vers > Mast > Crit" --// Fire Mage
IcyVeinStats["MAGE-64"] = "Int > Mast > Haste > Crit (to 33.34%) > Vers" --// Frost Mage

IcyVeinStats["MONK-268"] = "|cFFFFFF00Defensive:|r iLvL > Vers = Mast = Crit > Haste |cFFFFFF00Offensive:|r Vers = Crit > Haste > Mast" --// Brewmaster Monk
IcyVeinStats["MONK-269"] = "Weapon Dmg > Agil > Vers = Crit > Mast > Haste" --// Windwalker Monk
IcyVeinStats["MONK-270"] = "|cFFFFFF00Raid:|r Int > Haste > Crit = Mast > Vers |cFFFFFF00Dung:|r Int > Haste > Mast > Vers > Crit" --// Mistweaver Monk

IcyVeinStats["PALADIN-65"] = "|cFFFFFF00Raid:|r Int > Haste > Mast > Vers > Crit |cFFFFFF00Dung:|r Int > Haste > Vers > Crit > Mast" --// Holy Paladin
IcyVeinStats["PALADIN-66"] = "Haste ≥ Mast ≥ Vers > Crit" --// Protection Paladin
IcyVeinStats["PALADIN-70"] = "Str > Mast > Haste ~ Crit = Vers" --// Retribution Paladin

IcyVeinStats["PRIEST-256"] = "Int > Haste > Crit > Vers > Mast" --// Disc Priest
IcyVeinStats["PRIEST-257"] = "|cFFFFFF00Raid:|r Int > Mast = Crit > Vers > Haste |cFFFFFF00Dung:|r Int > Crit = Haste > Vers > Mast" --// Holy Priest
IcyVeinStats["PRIEST-258"] = "Int > Haste > Mast > Crit = Vers" --// Shadow Priest

IcyVeinStats["ROGUE-259"] = "Crit > Mast > Haste > Vers" --// Assassin Rogue
IcyVeinStats["ROGUE-260"] = "Vers > Crit > Mast > Haste" --// Outlaw Rogue
IcyVeinStats["ROGUE-261"] = "|cFFFFFF00ST:|r Crit > Vers > Haste > Mast |cFFFFFF00AoE:|r Crit > Vers > Mast > Haste" --// Subtley Rogue

IcyVeinStats["SHAMAN-262"] = "|cFFFFFF00ST:|r Int > Mast > Haste > Vers > Crit |cFFFFFF00AoE:|r Int > Haste > Crit > Vers > Mast" --// Elemental Shaman
IcyVeinStats["SHAMAN-263"] = "Agil > Haste = Mast > Vers > Crit" --// Enhancement Shaman
IcyVeinStats["SHAMAN-264"] = "Int > Vers = Crit > Haste = Mast"  --// Restro Shaman

IcyVeinStats["WARLOCK-265"] = "Int > Mast > Haste > Crit > Vers" --// Affliction Warlock
IcyVeinStats["WARLOCK-266"] = "|cFFFFFF00ST:|r Int > Haste > Crit > Mast ~ Vers |cFFFFFF00AoE:|r Int > Haste > Crit ~ Mast > Vers" --// Demonology Warlock
IcyVeinStats["WARLOCK-267"] = "Int > Haste ≥ Mast > Crit > Vers" --// Destruction Warlock

IcyVeinStats["WARRIOR-71"] = "Str > Crit > Haste > Mast > Vers" --// Arms Warrior
IcyVeinStats["WARRIOR-72"] = "Str > Haste > Mast > Crit > Vers" --// Fury WARRIOR
IcyVeinStats["WARRIOR-73"] = "Str > Haste > Vers ≥ Crit > Mast" --// Protection Warrior

IcyVeinStats["DEMONHUNTER-577"] = "|cFFFFFF00ST:|r Crit > Haste > Mast > Vers |cFFFFFF00AoE:|r Crit > Mast > Vers > Haste" --// Havoc Demon Hunter
IcyVeinStats["DEMONHUNTER-581"] = "Agil > Haste > Vers = Crit > Mast" --// Vengeance Demon Hunter

ViksUI_StatTable = IcyVeinStats

ViksUI_STATS = CreateFrame("Frame",ViksUI_STATS,UIParent)

function ViksUI_STATS:CreateWin()
    if PaperDollFrame:IsVisible() then
        if not ViksUI_STATSwin then
            ViksUI_STATSwin = CreateFrame("Frame",ViksUI_STATSwin,ViksUI_STATS)
			local f = ViksUI_STATS
			f:SetTemplate("Overlay")
            f:SetFrameStrata("TOOLTIP")
   
            f:SetWidth(CharacterFrame:GetWidth()) 
            f:SetHeight(25)
    	    ViksUI_STATStxt = f:CreateFontString(nil,"OVERLAY","GameFontWhite")
			local ft = ViksUI_STATStxt 
			ft:ClearAllPoints()
			ft:SetAllPoints(ViksUI_STATS) 
			ft:SetJustifyH("CENTER")
			ft:SetJustifyV("CENTER")
            f:ClearAllPoints()
            f:SetPoint("BOTTOMRIGHT",PaperDollFrame,"TOPRIGHT", 0,3)
            f:SetParent(PaperDollFrame)
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
		local classcolor = T.RGBToHex(class.r, class.g, class.b)
        local sId, specName = GetSpecializationInfo(GetSpecialization())
        local s = ViksUI_StatTable[className .. "-" .. sId]
        if s then
            s = gsub(s,"Str","STR")
            s = gsub(s,"Agil","AGI")
            s = gsub(s,"Intelligence","INT")
            s = gsub(s,"Stamina","STA")
            ViksUI_STATStxt:SetText(classcolor..specName..": "..s) 
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