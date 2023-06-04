local T, C, L = unpack(ViksUI)
if C.minimap.enable ~= true or C.skins.minimap_buttons ~= true then return end

----------------------------------------------------------------------------------------
--	Collect minimap buttons in one line
----------------------------------------------------------------------------------------
local BlackList = {
	["QueueStatusButton"] = true,
	["MiniMapTracking"] = true,
	["MiniMapMailFrame"] = true,
	["HelpOpenTicketButton"] = true,
	["GameTimeFrame"] = true,
}

local buttons = {}
local collectFrame = CreateFrame("Frame", "ButtonCollectFrame", UIParent)
local bsize = math.ceil(C.minimap.size / 6) -- Adjusting for 6 icons pr row
local line = math.ceil(7)

local texList = {
	["136430"] = true,	-- Interface\\Minimap\\MiniMap-TrackingBorder
	["136467"] = true,	-- Interface\\Minimap\\UI-Minimap-Background
}

local function SkinButton(f)
	f:SetPushedTexture(0)
	f:SetHighlightTexture(0)
	f:SetDisabledTexture(0)
	f:SetSize(20.8, 20.8)

	for i = 1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:IsVisible() and region:GetObjectType() == "Texture" then
			local tex = tostring(region:GetTexture())

			if tex and (texList[tex] or tex:find("Border") or tex:find("Background") or tex:find("AlphaMask")) then
				region:SetTexture(nil)
			else
				region:ClearAllPoints()
				region:SetPoint("TOPLEFT", f, "TOPLEFT", 2, -2)
				region:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
				region:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				region:SetDrawLayer("ARTWORK")
				if f:GetName() == "PS_MinimapButton" then
					region.SetPoint = T.dummy
				end
			end
		end
	end

	f:SetTemplate("Default")
end

local function PositionAndStyle()
	collectFrame:SetSize(bsize, bsize)
	collectFrame:SetPoint(unpack(C.position.minimap_buttons))
	for i = 1, #buttons do
		local f = buttons[i]
		f:ClearAllPoints()
		if i == 1 then
			if C.panels.NoPanels == true then 
				f:SetPoint("TOP", collectFrame, "TOP", 0, 0)
			else
				f:SetPoint("TOP", collectFrame, "TOP", 0, -18)
			end
		elseif i == line then
			if C.panels.NoPanels == true then 
				f:SetPoint("TOP", buttons[1], "BOTTOM", 0, -15)
			else
				f:SetPoint("TOP", buttons[1], "BOTTOM", 0, -1)
			end
		else
			f:SetPoint("TOPLEFT", buttons[i-1], "TOPRIGHT", 1, 0)
		end
		f.ClearAllPoints = T.dummy
		f.SetPoint = T.dummy
		if C.skins.minimap_buttons_mouseover then
			f:SetAlpha(0)
			f:HookScript("OnEnter", function()
				f:FadeIn()
			end)
			f:HookScript("OnLeave", function()
				f:FadeOut()
			end)
		end
		SkinButton(f)
	end
end

local collect = CreateFrame("Frame")
collect:RegisterEvent("PLAYER_ENTERING_WORLD")
collect:SetScript("OnEvent", function()
	for _, child in ipairs({Minimap:GetChildren()}) do
		if not BlackList[child:GetName()] then
			if child:GetObjectType() == "Button" and child:GetNumRegions() >= 3 and child:IsShown() then
				child:SetParent(collectFrame)
				tinsert(buttons, child)
			end
		end
	end
	if #buttons == 0 then
		collectFrame:Hide()
	end
	PositionAndStyle()

	if WIM3MinimapButton and WIM3MinimapButton:GetParent() == UIParent then
		SkinButton(WIM3MinimapButton)
		WIM3MinimapButton.backGround:Hide()
	end
	collect:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)