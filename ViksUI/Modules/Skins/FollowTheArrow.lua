local T, C, L = unpack(ViksUI)
if C.skins.follow_the_arrow ~= true then return end

----------------------------------------------------------------------------------------
--	FollowTheArrow skin
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self)
	if not C_AddOns.IsAddOnLoaded("FollowTheArrow") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

	local main = FollowTheArrowMainFrame
	if not main then return end

	-- Main window (MainWindow.lua)
	main:StripTextures()
	main:SetTemplate("Transparent")

	-- Skin direct child buttons (close, prev, next, sync) and the scroll bar
	for _, child in ipairs({main:GetChildren()}) do
		local objType = child:GetObjectType()
		if objType == "Button" then
			local norm = child:GetNormalTexture()
			local normTex = norm and norm:GetTexture()
			-- Skip the gear button (OptionsButton) and the resize grip (SizeGrabber)
			if normTex == nil or (type(normTex) == "string"
				and not normTex:find("OptionsButton")
				and not normTex:find("SizeGrabber")) then
				child:SkinButton()
			end
		elseif objType == "ScrollFrame" then
			if child.ScrollBar then
				T.SkinScrollBar(child.ScrollBar)
			end
		end
	end

	-- Skin dynamically created step list rows (StepList.lua)
	local scrollChild
	for _, child in ipairs({main:GetChildren()}) do
		if child:GetObjectType() == "ScrollFrame" then
			scrollChild = child:GetScrollChild()
			break
		end
	end

	if scrollChild then
		scrollChild:HookScript("OnUpdate", function(self)
			for _, row in ipairs({self:GetChildren()}) do
				-- Module selection button
				if row.btn and not row.btn._ftaSkinned then
					row.btn._ftaSkinned = true
					row.btn:SkinButton()
				end
				-- Thumbnail button border
				if row.thumbBorderFrame and not row.thumbBorderFrame._ftaSkinned then
					row.thumbBorderFrame._ftaSkinned = true
					row.thumbBorderFrame:SetBackdropBorderColor(unpack(C.media.border_color))
				end
				-- Choice tile grid (module selection thumbnails with buttons)
				if row._choiceTiles then
					for _, tile in ipairs(row._choiceTiles) do
						if tile then
							if tile.btn and not tile.btn._ftaSkinned then
								tile.btn._ftaSkinned = true
								tile.btn:SkinButton()
							end
							if tile.thumbBorderFrame and not tile.thumbBorderFrame._ftaSkinned then
								tile.thumbBorderFrame._ftaSkinned = true
								tile.thumbBorderFrame:SetBackdropBorderColor(unpack(C.media.border_color))
							end
						end
					end
				end
			end
		end)
	end

	-- Image popup is lazily created (StepList.lua) – skin it once it appears
	main:HookScript("OnUpdate", function(self)
		if self._ftaPopupDone then return end
		local popup = FollowTheArrow_ImagePopup
		if not popup then return end
		self._ftaPopupDone = true
		popup:StripTextures()
		popup:SetTemplate("Transparent")
		for _, child in ipairs({popup:GetChildren()}) do
			if child:GetObjectType() == "Button" then
				child:SkinButton()
			end
		end
	end)
end)
