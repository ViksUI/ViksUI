local T, C, L, _ = unpack(select(2, ...))
if C.skins.skada ~= true then return end
if not IsAddOnLoaded("Skada") then return end
local Skada = Skada

local function CreateBackdrop(f, t, tex)
	if f.backdrop then return end
	
	local b = CreateFrame("Frame", nil, f)
	b:SetPoint("TOPLEFT", -2, 2)
	b:SetPoint("BOTTOMRIGHT", 2, -2)
	b:CreateBackdrop("Transparent")
	
	f.backdrop = b
end

local function StripTextures(object, kill)
	for i = 1, object:GetNumRegions() do
		local region = select(i, object:GetRegions())
		if region:GetObjectType() == "Texture" then
			if kill then
				Kill(region)
			else
				region:SetTexture(nil)
			end
		end
	end
end

local Skada = Skada
local barSpacing = 1, 1
local borderWidth = 2, 2

local barmod = Skada.displays["bar"]

local titleBG = {
	bgFile = "Interface\\Addons\\ViksUI\\Media\\Other\\statusbar",
	tile = false,
	tileSize = 0
}

barmod.ApplySettings_ = barmod.ApplySettings
barmod.ApplySettings = function(self, win)
	barmod.ApplySettings_(self, win)
	
	local skada = win.bargroup

	if win.db.enabletitle then
		skada.button:SetBackdrop(titleBG)
		if C.panels.NoPanels == true then
			skada.button:SetBackdropColor(.05,.05,.05, .4)
			else
			skada.button:SetBackdropColor(.05,.05,.05, .9)
		end
	end

	skada:SetSpacing(barSpacing)
	skada:SetFrameLevel(5)
	
	skada:SetBackdrop(nil)
	if not skada.backdrop then
		CreateBackdrop(skada)
		skada.backdrop:ClearAllPoints()
		if C.panels.NoPanels == true then
		skada.backdrop:SetAlpha(0.6)
		end
		skada.backdrop:SetPoint('TOPLEFT', win.bargroup.button or win.bargroup, 'TOPLEFT', 0, 0)
		skada.backdrop:SetPoint('BOTTOMRIGHT', win.bargroup, 'BOTTOMRIGHT', 0, 0)
	end
		
	hooksecurefunc(Skada, "OpenReportWindow", function(self)
		if not self.ReportWindow.frame.reskinned then
			self.ReportWindow.frame:StripTextures()
			self.ReportWindow.frame:SetTemplate("Transparent")
			self.ReportWindow.frame.reskinned = true
		end
	end)
end

for _, window in ipairs(Skada:GetWindows()) do
	window:UpdateDisplay()
end