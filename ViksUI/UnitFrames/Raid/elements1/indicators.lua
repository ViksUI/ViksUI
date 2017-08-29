--[[
local _, ns = ...
local oUF =  ns.oUF or oUF

local _, class = UnitClass("player")
local indicator = "Interface\\AddOns\\ViksUI\\Media\\Font\\squares.ttf"
local symbols =  "Interface\\AddOns\\ViksUI\\Media\\Font\\PIZZADUDEBULLETS.ttf"

local update = .25

local Enable = function(self)
    if(self.freebIndicators) then
        self.AuraStatusTL = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusTL:ClearAllPoints()
        self.AuraStatusTL:SetPoint("TOPLEFT", self.Health, 0, -1)
        self.AuraStatusTL:SetFont(indicator, C.raidframes.indicatorsize, "THINOUTLINE")
        self.AuraStatusTL.frequentUpdates = update
        self:Tag(self.AuraStatusTL, ns.classIndicators[class]["TL"])

        self.AuraStatusTR = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusTR:ClearAllPoints()
        self.AuraStatusTR:SetPoint("TOPRIGHT", self.Health, 2, -1)
        self.AuraStatusTR:SetFont(indicator, C.raidframes.indicatorsize, "THINOUTLINE")
        self.AuraStatusTR.frequentUpdates = update
        self:Tag(self.AuraStatusTR, ns.classIndicators[class]["TR"])

        self.AuraStatusBL = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusBL:ClearAllPoints()
        self.AuraStatusBL:SetPoint("BOTTOMLEFT", self.Health, 0, 0)
        self.AuraStatusBL:SetFont(indicator, C.raidframes.indicatorsize, "THINOUTLINE")
        self.AuraStatusBL.frequentUpdates = update
        self:Tag(self.AuraStatusBL, ns.classIndicators[class]["BL"])	

        self.AuraStatusBR = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusBR:ClearAllPoints()
        self.AuraStatusBR:SetPoint("BOTTOMRIGHT", self.Health, 6, -2)
        self.AuraStatusBR:SetFont(symbols, C.raidframes.symbolsize, "THINOUTLINE")
        self.AuraStatusBR.frequentUpdates = update
        self:Tag(self.AuraStatusBR, ns.classIndicators[class]["BR"])

        self.AuraStatusCen = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusCen:SetPoint("TOP")
        self.AuraStatusCen:SetJustifyH("CENTER")
        self.AuraStatusCen:SetFont(C.media.normal_font, C.raidframes.fontsizeEdge, C.raidframes.outline)
        self.AuraStatusCen:SetShadowOffset(1.25, -1.25)
        self.AuraStatusCen:SetWidth(C.raidframes.width)
        self.AuraStatusCen.frequentUpdates = update
        self:Tag(self.AuraStatusCen, ns.classIndicators[class]["Cen"])
    end
end

oUF:AddElement('freebIndicators', nil, Enable, nil)
--]]