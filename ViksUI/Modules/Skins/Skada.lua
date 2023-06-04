local T, C, L = unpack(ViksUI)
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
	if C.panels.NoPanels ~= true then
		skada:SetBackdrop(nil)
		if not skada.backdrop then
			CreateBackdrop(skada)
			skada.backdrop:ClearAllPoints()
			skada.backdrop:SetPoint('TOPLEFT', win.bargroup.button or win.bargroup, 'TOPLEFT', 0, 0)
			skada.backdrop:SetPoint('BOTTOMRIGHT', win.bargroup, 'BOTTOMRIGHT', 0, 0)
		end
	end
		
	hooksecurefunc(Skada, "OpenReportWindow", function(self)
		if not self.ReportWindow.frame.reskinned then
			self.ReportWindow.frame:StripTextures()
			self.ReportWindow.frame:SetTemplate("Transparent")
			self.ReportWindow.frame.reskinned = true
		end
	end)
end
if C.skins.userControll == false then -- Let the user select to control this themself
	hooksecurefunc(Skada, "UpdateDisplay", function(self)
		for _, win in ipairs(self:GetWindows()) do
			for i, v in pairs(win.bargroup:GetBars()) do
				if not v.BarStyled then
					if not v.backdrop then
						v:CreateBackdrop("Transparent")
						v.backdrop:SetAlpha(0)
					end

					v:SetHeight(12)

					v.label:ClearAllPoints()
					v.label.ClearAllPoints = T.dummy
					v.label:SetPoint("LEFT", v, "LEFT", 2, 0)
					v.label.SetPoint = T.dummy

					v.label:SetFont(C.font.stylization_font, C.font.stylization_font_size, C.font.stylization_font_style)
					v.label.SetFont = T.dummy
					v.label:SetShadowOffset(0, 0)
					v.label.SetShadowOffset = T.dummy

					v.timerLabel:ClearAllPoints()
					v.timerLabel.ClearAllPoints = T.dummy
					v.timerLabel:SetPoint("RIGHT", v, "RIGHT", 0, 0)
					v.timerLabel.SetPoint = T.dummy

					v.timerLabel:SetFont(C.font.stylization_font, C.font.stylization_font_size, C.font.stylization_font_style)
					v.timerLabel.SetFont = T.dummy
					v.timerLabel:SetShadowOffset(0, 0)
					v.timerLabel.SetShadowOffset = T.dummy

					v.BarStyled = true
				end
				if v.icon and v.icon:IsShown() then
					v.backdrop:SetPoint("TOPLEFT", -14, 2)
					v.backdrop:SetPoint("BOTTOMRIGHT", 2, -2)
				else
					v.backdrop:SetPoint("TOPLEFT", -2, 2)
					v.backdrop:SetPoint("BOTTOMRIGHT", 2, -2)
				end
			end
		end
	end)
end
for _, window in ipairs(Skada:GetWindows()) do
	window:UpdateDisplay()
end
