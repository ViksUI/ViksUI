
local _, ns = ...
local cfg = ns.cfg
local oUF =  ns.oUF or oUF

if cfg.IndicatorIcons2 then

local _, class = UnitClass("player")

local update = .25

local indicator = cfg.squarefont
local symbols = cfg.symbols2

if (class == "MONK") then
local Enable = function(self)
	if self.DrkIndicators then
		self.NumbersIndicator = self.Health:CreateFontString(nil,"OVERLAY")
		self.NumbersIndicator:ClearAllPoints()
		self.NumbersIndicator:SetPoint("BOTTOMRIGHT",self.Health,"BOTTOMRIGHT",4,-4)
		self.NumbersIndicator:SetFont(cfg.font,13,"THINOUTLINE")
		self.NumbersIndicator.frequentUpdates = .25
		self:Tag(self.NumbersIndicator,cfg.IndicatorList["NUMBERS"][class])
	
		self.SquareIndicator = self.Health:CreateFontString(nil,"OVERLAY")
		self.SquareIndicator:ClearAllPoints()
		self.SquareIndicator:SetPoint("BOTTOMRIGHT",self.NumbersIndicator,"BOTTOMLEFT",3,1)
		self.SquareIndicator:SetFont(cfg.squarefont,10,"THINOUTLINE")
		self.SquareIndicator.frequentUpdates = .25
		self:Tag(self.SquareIndicator,cfg.IndicatorList["SQUARE"][class])
	end
end

oUF:AddElement('DrkIndicators',nil,Enable,nil)
else
local Enable = function(self)
    if(self.freebIndicators) then
        self.AuraStatusTL = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusTL:ClearAllPoints()
        self.AuraStatusTL:SetPoint("TOPLEFT", self.Health, 0, -1)
        self.AuraStatusTL:SetFont(indicator, cfg.indicatorsize, "THINOUTLINE")
        self.AuraStatusTL.frequentUpdates = update
        self:Tag(self.AuraStatusTL, ns.classIndicators[class]["TL"])

        self.AuraStatusTR = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusTR:ClearAllPoints()
        self.AuraStatusTR:SetPoint("TOPRIGHT", self.Health, 2, -1)
        self.AuraStatusTR:SetFont(indicator, cfg.indicatorsize, "THINOUTLINE")
        self.AuraStatusTR.frequentUpdates = update
        self:Tag(self.AuraStatusTR, ns.classIndicators[class]["TR"])

        self.AuraStatusBL = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusBL:ClearAllPoints()
        self.AuraStatusBL:SetPoint("BOTTOMLEFT", self.Health, 0, 0)
        self.AuraStatusBL:SetFont(indicator, cfg.indicatorsize, "THINOUTLINE")
        self.AuraStatusBL.frequentUpdates = update
        self:Tag(self.AuraStatusBL, ns.classIndicators[class]["BL"])	

        self.AuraStatusBR = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusBR:ClearAllPoints()
        self.AuraStatusBR:SetPoint("BOTTOMRIGHT", self.Health, 6, -2)
        self.AuraStatusBR:SetFont(symbols, cfg.symbolsize, "THINOUTLINE")
        self.AuraStatusBR.frequentUpdates = update
        self:Tag(self.AuraStatusBR, ns.classIndicators[class]["BR"])

        self.AuraStatusCen = self.Health:CreateFontString(nil, "OVERLAY")
        self.AuraStatusCen:SetPoint("TOP")
        self.AuraStatusCen:SetJustifyH("CENTER")
        self.AuraStatusCen:SetFont(cfg.font, cfg.fontsizeEdge, cfg.Findoutline)
        self.AuraStatusCen:SetShadowOffset(1.25, -1.25)
        self.AuraStatusCen:SetWidth(cfg.unit_size.Raid10H.w)
        self.AuraStatusCen.frequentUpdates = update
        self:Tag(self.AuraStatusCen, ns.classIndicators[class]["Cen"])
    end
end

oUF:AddElement('freebIndicators', nil, Enable, nil)
end
end