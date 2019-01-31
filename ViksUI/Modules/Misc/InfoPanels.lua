local T, C, L, _ = unpack(select(2, ...))
if C.misc.InfoPanel_Stats ~= true then return end
----------------------------------------------------------------------------------------
-- Stats Panel with info from https://www.icy-veins.com - Credit to Wyr3d and Papasol for the idea
----------------------------------------------------------------------------------------
local IcyVeinStats = {}
IcyVeinStats["DEATHKNIGHT-250"] = "ilvl > Vers > Haste > Mast > Crit" --// Blood DK
IcyVeinStats["DEATHKNIGHT-251"] = "Str > Mast > Crit > Vers > Haste" --// Frost DK
IcyVeinStats["DEATHKNIGHT-252"] = "Str > Haste > Crit = Vers > Mast" --// Unholy DK

IcyVeinStats["DRUID-102"] = "Int > Haste > Mast > Crit > Vers" --// Boomkin Druid
IcyVeinStats["DRUID-103"] = "Crit > Mast > Haste > Agil > Vers" --// Feral Druid
IcyVeinStats["DRUID-104"] = "|cFFFFFF00Survival:|r Armor/Agil/Stam > Mast > Vers > Haste > Crit |cFFFFFF00Damage:|r Agil > Haste > Crit > Vers > Mast" --// Bear Druid
IcyVeinStats["DRUID-105"] = "|cFFFFFF00Raid:|r Int > Haste/Crit/Vers > Mast|cFFFFFF00Dung:|r Mast = Haste > Int > Vers > Crit" --// Restro Druid

IcyVeinStats["HUNTER-253"] = "|cFFFFFF00Single:|r Agil > Haste > Crit > Mast > Vers |cFFFFFF00Multi:|r Agil > Mast > Haste > Crit > Vers" --// Beast Master Hunter
IcyVeinStats["HUNTER-254"] = "|cFFFFFF00Single:|r Agil > Mast > Haste> Crit > Vers |cFFFFFF00Multi:|r Agil > Mast > Crit > Vers > Haste" --// Marksman Hunter
IcyVeinStats["HUNTER-255"] = "|cFFFFFF00Single:|r Agil > Haste > Crit > Vers > Mast |cFFFFFF00Multi:|r Agil > Haste > Crit > Vers > Mast" --// Survival Hunter

IcyVeinStats["MAGE-62"] = "Int > Crit > Haste > Mast > Vers" --// Arcane Mage
IcyVeinStats["MAGE-63"] = "Int > Mast > Vers > Hate > Crit" --// Fire Mage
IcyVeinStats["MAGE-64"] = "Int > Crit to 33% > Haste > Vers > Mast > Crit after 33%" --// Frost Mage

IcyVeinStats["MONK-268"] = "Agil > Crit = Vers = Mast > Haste" --// Brewmaster Monk
IcyVeinStats["MONK-269"] = "Weapon Dam > Agi > Vers > Mast > Crit > Haste" --// Windwalker Monk
IcyVeinStats["MONK-270"] = "|cFFFFFF00Raid:|r Int > Crit > Mast = Vers > Haste |cFFFFFF00Dung:|r Int > Mast = Haste > Vers > Crit" --// Mistweaver Monk

IcyVeinStats["PALADIN-65"] = "|cFFFFFF00Standard:|r Int > Crit > Mast > Haste > Vers |cFFFFFF00Avenging C:|r Int > Crit > Haste > Vers > Mast" --// Holy Paladin
IcyVeinStats["PALADIN-66"] = "Str > Haste > Mast > Vers > Crit" --// Protection Paladin
IcyVeinStats["PALADIN-70"] = "Str > Haste > Crit = Vers = Mast" --// Retribution Paladin

IcyVeinStats["PRIEST-256"] = "Int > Haste > Crit > Mast > Vers" --// Disc Priest
IcyVeinStats["PRIEST-257"] = "|cFFFFFF00Raid:|r (Leech = Avoid) > Int > Mast = Crit > Vers > Haste |cFFFFFF00Dung:|r (Leech = Avoid) > Int > Crit > Haste > Vers > Mast" --// Holy Priest
IcyVeinStats["PRIEST-258"] = "Int > Haste = Crit > Mast > Vers" --// Shadow Priest

IcyVeinStats["ROGUE-259"] = "Agi > Haste > Crit > Mast > Vers" --// Assassin Rogue
IcyVeinStats["ROGUE-260"] = "Agil > Haste > Vers > Crit > Mast" --// Outlaw Rogue
IcyVeinStats["ROGUE-261"] = "Agil > Vers > Crit > Mast > Haste" --// Subtley Rogue

IcyVeinStats["SHAMAN-262"] = "Int > Crit > Haste > Vers > Mast" --// Elemental Shaman
IcyVeinStats["SHAMAN-263"] = "Agil > Haste > Crit = Vers > Mast" --// Enhancement Shaman
IcyVeinStats["SHAMAN-264"] = "(Leech = Avoid) > Int > Crit > Vers > Haste = Mast"  --// Restro Shaman

IcyVeinStats["WARLOCK-265"] = "Mast > Int > Haste > Crit = Vers" --// Affliction Warlock
IcyVeinStats["WARLOCK-266"] = "Int > Haste > Crit > Vers > Mast" --// Demonology Warlock
IcyVeinStats["WARLOCK-267"] = "Int > Haste > Crit = Mast > Vers" --// Destruction Warlock

IcyVeinStats["WARRIOR-71"] = "Str > Haste > Crit > Mast > Vers" --// Arms Warrior
IcyVeinStats["WARRIOR-72"] = "Str > Haste > Mast > Vers > Crit" --// Fury WARRIOR
IcyVeinStats["WARRIOR-73"] = "Haste > Armor > Vers > Mast > Crit > Str" --// Protection Warrior

IcyVeinStats["DEMONHUNTER-577"] = "Agi > Haste = Vers > Crit > Mast" --// Havoc Demon Hunter
IcyVeinStats["DEMONHUNTER-581"] = "Agi > Haste > Vers > Mast > Crit" --// Vengeance Demon Hunter

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
            s = gsub(s,"Strength","STR")
            s = gsub(s,"Agility","AGI")
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