local T, C, L, _ = unpack(select(2, ...))
if C.misc.InfoPanel_Stats ~= true then return end
----------------------------------------------------------------------------------------
-- Stats Panel with info from https://www.icy-veins.com - Credit to Wyr3d and Papasol for the idea
----------------------------------------------------------------------------------------
local IcyVeinStats = {}
IcyVeinStats["DEATHKNIGHT-250"] = "1.Str and Stam > 2.Haste > 3.Vers > 4.Mast > 5.Crit " --// Blood DK
IcyVeinStats["DEATHKNIGHT-251"] = "1.Str > 2.Mast > 3.Crit > 4.Vers > 5.Haste" --// Frost DK
IcyVeinStats["DEATHKNIGHT-252"] = "1.Str > 2.Haste > 3. Crit or Vers > 4.Mast" --// Unholy DK

IcyVeinStats["DRUID-102"] = "1.Int > 2.Haste > 3.Crit > 4.Vers > 5.Mast" --// Boomkin Druid
IcyVeinStats["DRUID-103"] = "1.Agi > 2.Haste > 3.Crit .Mast > 4.Vers" --// Feral Druid
IcyVeinStats["DRUID-104"] = "1.Armor, Agil and Stam > 2.Vers > 3.Mast > 4.Haste .Crit" --// Bear Druid
IcyVeinStats["DRUID-105"] = "|cFFFFFF00Raid:|r 1.Int > 2.Mast = Haste = Crit = Vers |cFFFFFF00Dung:|r 1.Mast = Haste > 2.Int > 3.Vers > 4.Crit" --// Restro Druid

IcyVeinStats["HUNTER-253"] = "|cFFFFFF00Single:|r 1.Agil > 2.Crit > 3.Mast > 4.Haste |cFFFFFF00Multi:|r 1.Agil > 2.Mast > 3.Haste > 4.Crit" --// Beast Master Hunter
IcyVeinStats["HUNTER-254"] = "|cFFFFFF00Single:|r 1.Agil > 2.Haste > 3.Mast > 4.Vers |cFFFFFF00Multi:|r 1.Agil > 2.Mast > 3.Haste > 4.Crit" --// Marksman Hunter
IcyVeinStats["HUNTER-255"] = "1.Agil > 2.Haste > 3.Crit > 4.Vers > 5.Mast" --// Survival Hunter

IcyVeinStats["MAGE-62"] = "1.Int > 2.Crit > 3.Haste > 4.Mast > 5.Vers" --// Arcane Mage
IcyVeinStats["MAGE-63"] = "1.Int > 2.Mast > 3.Vers > 4.Crit > 5.Haste" --// Fire Mage
IcyVeinStats["MAGE-64"] = "1.Int > 2.Crit to 33% > 3.Haste > 4.Vers > 5.Mast > 6.Crit after 33%" --// Frost Mage

IcyVeinStats["MONK-268"] = "1.Agil > 2.Crit = Vers > 3.Mast > 4.Haste" --// Brewmaster Monk
IcyVeinStats["MONK-269"] = "1.Weapon Dam > 2.Agi > 3.Vers > 4.Mast > 5.Crit > 6.Haste" --// Windwalker Monk
IcyVeinStats["MONK-270"] = "|cFFFFFF00Raid:|r 1.Int > 2.Crit > 3.Vers > 4.Haste .Mast |cFFFFFF00Dung:|r 1.Int > 2.Haste = Mast > 3.Vers > 4.Crit" --// Mistweaver Monk

IcyVeinStats["PALADIN-65"] = "|cFFFFFF00Standard:|r 1.Int > 2.Crit > 3.Mast > 4.Haste |cFFFFFF00Avenging C:|r 1.Int > 2.Crit > 3.Haste > 4.Vers" --// Holy Paladin
IcyVeinStats["PALADIN-66"] = "1.Str > 2.Haste > 3.Mast > 4.Vers > 5.Crit" --// Protection Paladin
IcyVeinStats["PALADIN-70"] = "1.Str > 2.Haste > 3.Crit = Vers = Mast" --// Retribution Paladin

IcyVeinStats["PRIEST-256"] = "1.Int > 2.Haste > 3.Crit > 4.Mast > 5.Vers" --// Disc Priest
IcyVeinStats["PRIEST-257"] = "|cFFFFFF00Raid:|r 1.Leech = Avoid > 2.Int .Mast > 3.Crit > 4.Haste |cFFFFFF00Dung:|r Leech = Avoid > 2.Int > 3.Haste > 4.Crit = Vers" --// Holy Priest
IcyVeinStats["PRIEST-258"] = "1.Int > 2.Haste > 3.Crit > 4.Mast > 5.Vers" --// Shadow Priest

IcyVeinStats["ROGUE-259"] = "1.Agi > 2.Haste > 3.Crit > 4.Mast > 5.Vers" --// Assassin Rogue
IcyVeinStats["ROGUE-260"] = "1.Agil > 2.Vers = Haste > 3.Mast > 4.Crit" --// Outlaw Rogue
IcyVeinStats["ROGUE-261"] = "1.Agil > 2.Crit .Mast > 3.Haste > 4.Vers" --// Subtley Rogue

IcyVeinStats["SHAMAN-262"] = "1.Int > 2.Crit > 3.Haste > 4.Vers > 5.Mast" --// Elemental Shaman
IcyVeinStats["SHAMAN-263"] = "1.Agil > 2.Haste > 3.Crit = Vers > 4.Mast" --// Enhancement Shaman
IcyVeinStats["SHAMAN-264"] = "|cFFFFFF00Raid:|r 1.Leech = Avoid > 2.Int > 3.Crit > 4.Vers |cFFFFFF00Dungeon:|r 1.Leech = Avoid > 2.Int > 3.Haste > 4.Crit = Vers" --// Restro Shaman

IcyVeinStats["WARLOCK-265"] = "1.Int > 2.Mast > 3.Haste > 4.Crit = Vers" --// Affliction Warlock
IcyVeinStats["WARLOCK-266"] = "|cFFFFFF00Single Tar:|r 1.Int > 2.Haste > 3.Mast > 4.Crit > 5.Vers |cFFFFFF004+Tar:|r 1.Int > 2.Mast > 3.Haste = Crit > 4.Vers" --// Demonology Warlock
IcyVeinStats["WARLOCK-267"] = "1.Int > 2.Crit = Haste > 3.Vers > 4.Mast" --// Destruction Warlock

IcyVeinStats["WARRIOR-71"] = "1.Str > 2.Crit > 3.Haste > 4.Vers > 5.Mast" --// Arms Warrior
IcyVeinStats["WARRIOR-72"] = "1.Str > 2.Haste > 3.Mast > 4.Vers > 5.Crit" --// Fury WARRIOR
IcyVeinStats["WARRIOR-73"] = "1.Haste > 2.Vers = Mast > 3.Crit > 4.Str" --// Protection Warrior

IcyVeinStats["DEMONHUNTER-577"] = "1.Agil > 2.Haste = Vers > 3.Crit > 4.Mast" --// Havoc Demon Hunter
IcyVeinStats["DEMONHUNTER-581"] = "1.Agi > 2.Haste > 3.Vers > 4.Mast > 5.Crit" --// Vengeance Demon Hunter

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