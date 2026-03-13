local T, C, L = unpack(ViksUI)
if C.skins.follow_the_arrow ~= true then return end

----------------------------------------------------------------------------------------
--	FollowTheArrow skin BETA, more work needed
----------------------------------------------------------------------------------------
local skinned = false

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
	if skinned then return end
	if not C_AddOns.IsAddOnLoaded("FollowTheArrow") then return end
	
	C_Timer.After(0.5, function()
		if not FollowTheArrowMainFrame then return end
		skinned = true
		
		local main = FollowTheArrowMainFrame
		
		-- Main frame
		main:StripTextures(true)
		main:CreateBackdrop("Transparent")
		main.backdrop:SetPoint("TOPLEFT", 0, 0)
		main.backdrop:SetPoint("BOTTOMRIGHT", 0, 0)
		
		-- print("|cff00FF00[FollowTheArrow Skin]|r Main frame backdrop created")
		
		-- DROPDOWN - Use T.SkinDropDownBox
		if FollowTheArrowRouteDropdown then
			local dropdown = FollowTheArrowRouteDropdown
			T.SkinDropDownBox(dropdown, 120)
			-- print("|cff00FF00[FollowTheArrow Skin]|r Dropdown skinned")
		end
		
		-- BUTTONS - Skin by searching for all children and matching button types
		local skinCount = 0
		for _, child in ipairs({main:GetChildren()}) do
			if child:GetObjectType() == "Button" then
				local name = child:GetName() or ""
				
				-- Close button (skip - has atlas)
				if name:find("Close") then
					T.SkinCloseButton(child, main.backdrop)
					-- print("|cff00FF00[FollowTheArrow Skin]|r Close button skinned")
					
				-- Prev button
				elseif name:find("Prev") or (child:GetText() and child:GetText() == "Prev") then
					child:StripTextures()
					child:SkinButton()
					skinCount = skinCount + 1
					-- print("|cff00FF00[FollowTheArrow Skin]|r Prev button skinned")
					
				-- Next button
				elseif name:find("Next") or (child:GetText() and child:GetText() == "Next") then
					child:StripTextures()
					child:SkinButton()
					skinCount = skinCount + 1
					-- print("|cff00FF00[FollowTheArrow Skin]|r Next button skinned")
					
				-- Sync button (unnamed, has icon)
				elseif name == "" and child._icon then
					child:StripTextures()
					child:StyleButton()
					child:SetTemplate("Default")
					if child._icon then
						child._icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
						child._icon:ClearAllPoints()
						child._icon:SetPoint("TOPLEFT", 2, -2)
						child._icon:SetPoint("BOTTOMRIGHT", -2, 2)
					end
					skinCount = skinCount + 1
					-- print("|cff00FF00[FollowTheArrow Skin]|r Sync button skinned")
					
				-- Settings gear button
				-- elseif name == "" and child:GetWidth() < 30 and child:GetHeight() < 30 then
					-- This might be the settings button
					-- child:StripTextures()
					-- child:StyleButton()
					-- child:SetTemplate("Default")
					-- skinCount = skinCount + 1
					-- print("|cff00FF00[FollowTheArrow Skin]|r Settings button skinned")
				end
			end
		end
		-- print("|cff00FF00[FollowTheArrow Skin]|r Total buttons skinned: " .. skinCount)
		
		-- Max/Min buttons frame
		for _, child in ipairs({main:GetChildren()}) do
			if child:GetObjectType() == "Frame" then
				if child.MinimizeButton or child.MaximizeButton then
					T.SkinMaxMinFrame(child)
					-- print("|cff00FF00[FollowTheArrow Skin]|r Min/Max frame skinned")
				end
			end
		end
		
		-- SCROLLFRAME
		for _, child in ipairs({main:GetChildren()}) do
			if child:GetObjectType() == "ScrollFrame" then
				child:StripTextures(true)
				if child.ScrollBar then
					T.SkinScrollBar(child.ScrollBar)
					-- print("|cff00FF00[FollowTheArrow Skin]|r ScrollBar skinned")
				end
				
				-- Hook for dynamic content
				local scrollChild = child:GetScrollChild()
				if scrollChild then
					hooksecurefunc(scrollChild, "SetHeight", function(self)
						SkinDynamicButtons(scrollChild)
					end)
					SkinDynamicButtons(scrollChild)
				end
			end
		end
		
		-- Image popup hook
		main:HookScript("OnShow", function(self)
			local popup = FollowTheArrow_ImagePopup
			if popup and not popup._skinned then
				popup._skinned = true
				popup:StripTextures(true)
				popup:CreateBackdrop("Transparent")
				popup.backdrop:SetPoint("TOPLEFT", 0, 0)
				popup.backdrop:SetPoint("BOTTOMRIGHT", 0, 0)
				
				for _, child in ipairs({popup:GetChildren()}) do
					if child:GetObjectType() == "Button" then
						child:StripTextures()
						child:SkinButton()
					end
				end
			end
		end)
	end)
end)

function SkinDynamicButtons(scrollChild)
	if not scrollChild then return end
	
	for _, row in ipairs({scrollChild:GetChildren()}) do
		if row then
			-- Skin row buttons
			if row.btn and not row.btn._ftaSkinned then
				row.btn:StripTextures()
				row.btn:SkinButton()
				row.btn._ftaSkinned = true
			end
			
			-- Update border colors
			if row.thumbBorderFrame and not row.thumbBorderFrame._ftaSkinned then
				row.thumbBorderFrame:SetBackdropBorderColor(unpack(C.media.border_color))
				row.thumbBorderFrame._ftaSkinned = true
			end
			
			-- Skin choice tiles
			if row._choiceTiles then
				for _, tile in ipairs(row._choiceTiles) do
					if tile then
						if tile.btn and not tile.btn._ftaSkinned then
							tile.btn:StripTextures()
							tile.btn:SkinButton()
							tile.btn._ftaSkinned = true
						end
						if tile.thumbBorderFrame and not tile.thumbBorderFrame._ftaSkinned then
							tile.thumbBorderFrame:SetBackdropBorderColor(unpack(C.media.border_color))
							tile.thumbBorderFrame._ftaSkinned = true
						end
					end
				end
			end
		end
	end
end