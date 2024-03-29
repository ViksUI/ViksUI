local T, C, L = unpack(ViksUI)
if C.minimap.bg_map_stylization ~= true or IsAddOnLoaded("Capping") or IsAddOnLoaded("Aurora") or IsAddOnLoaded("EnhanceBattlefieldMinimap") then return end

----------------------------------------------------------------------------------------
--	BattlefieldMap style
----------------------------------------------------------------------------------------
local tinymap = CreateFrame("Frame", "UIZoneMap", UIParent)
tinymap:Hide()

multix = C.minimap.zoneMapMultilplier
zonescale = C.minimap.zoneMapScale

tinymap:RegisterEvent("ADDON_LOADED")
tinymap:SetScript("OnEvent", function(self, event, addon)
	if addon ~= "Blizzard_BattlefieldMap" then return end
	
	BattlefieldMapFrame:SetSize(223*multix, 150*multix)
	BattlefieldMapFrame:SetScale(zonescale)

	BattlefieldMapFrame:CreateBackdrop("Transparent")
	BattlefieldMapFrame.backdrop:SetPoint("TOPLEFT", -2, 4)
	BattlefieldMapFrame.backdrop:SetPoint("BOTTOMRIGHT", 0, 1)

	BattlefieldMapFrame.BorderFrame:DisableDrawLayer("BORDER")
	BattlefieldMapFrame.BorderFrame:DisableDrawLayer("ARTWORK")

	BattlefieldMapFrame.BorderFrame.CloseButton:Hide()
	BattlefieldMapFrame:SetResizable(true)

	BattlefieldMapTab:SetParent(tinymap)

	BattlefieldMapFrame.ScrollContainer:HookScript("OnMouseUp", function(self, btn)
		if btn == "LeftButton" then
			BattlefieldMapTab:StopMovingOrSizing()
			if OpacityFrame:IsShown() then OpacityFrame:Hide() end
		elseif btn == "RightButton" then
			local function InitializeOptionsDropDown(BattlefieldMapFrame)
				BattlefieldMapFrame:GetParent():InitializeOptionsDropDown()
			end
			UIDropDownMenu_Initialize(BattlefieldMapTab.OptionsDropDown, InitializeOptionsDropDown, "MENU")
			ToggleDropDownMenu(nil, nil, BattlefieldMapTab.OptionsDropDown, "cursor", 0, -4)
			if OpacityFrame:IsShown() then OpacityFrame:Hide() end
		end
	end)

	BattlefieldMapFrame.ScrollContainer:HookScript("OnMouseDown", function(self, btn)
		if btn == "LeftButton" then
			if BattlefieldMapOptions and BattlefieldMapOptions.locked then
				return
			else
				BattlefieldMapTab:StartMoving()
			end
		end
	end)
end)
