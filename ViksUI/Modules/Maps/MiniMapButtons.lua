local T, C, L, _ = unpack(select(2, ...))
if C.minimapp.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Switch layout mouseover button on minimap
----------------------------------------------------------------------------------------
local switch = CreateFrame("Button", "SwitchLayout", UIParent)
switch:SetTemplate("ClassColor")
if C.actionbar.toggle_mode == true then
	switch:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", -3, 39)
else
	switch:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", -3, 39)
end
switch:SetSize(19, 19)
switch:SetAlpha(0)

switch.t = switch:CreateTexture(nil, "OVERLAY")
switch.t:SetTexture("Interface\\LFGFrame\\LFGROLE")
switch.t:SetPoint("TOPLEFT", switch, 2, -2)
switch.t:SetPoint("BOTTOMRIGHT", switch, -2, 2)

switch:EnableMouse(true)
switch:RegisterForClicks("AnyUp")
switch:SetScript("OnClick", function(self, button)
	if button == "LeftButton" then
		GUIConfig.unitframe.HealFrames = true
		GUIConfigSettings.unitframe.HealFrames = true
		--DBT_AllPersistentOptions["Default"]["DBM"].HugeTimerY = -210
		ReloadUI()
	elseif button == "RightButton" then
		GUIConfig.unitframe.HealFrames = false
		GUIConfigSettings.unitframe.HealFrames = false
		--DBT_AllPersistentOptions["Default"]["DBM"].HugeTimerY = -240
		ReloadUI()
	end
end)

switch:SetScript("OnEnter", function()
	switch:FadeIn()
	GameTooltip:SetOwner(switch, "ANCHOR_LEFT")
	GameTooltip:AddLine(RAID_FRAMES_LABEL)
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(L_MINIMAP_HEAL_LAYOUT)
	GameTooltip:AddLine(L_MINIMAP_DPS_LAYOUT)
	--GameTooltip:AddLine(L_MINIMAP_BLIZZ_LAYOUT)
	GameTooltip:Show()
end)

switch:SetScript("OnLeave", function()
	switch:FadeOut()
	GameTooltip:Hide()
end)

switch:RegisterEvent("PLAYER_LOGIN")
switch:SetScript("OnEvent", function(self)
	if SavedOptions and (GUIConfig.unitframe.HealFrames ~= true or GUIConfigSettings.unitframe.HealFrames ~= true) then
		switch.t:SetTexCoord(0.25, 0.5, 0, 1)
	elseif SavedOptions and (GUIConfig.unitframe.HealFrames == true or GUIConfigSettings.unitframe.HealFrames == true) then
		switch.t:SetTexCoord(0.75, 1, 0, 1)
	end
end)

----------------------------------------------------------------------------------------
--	Farm mode for minimap(by Elv22)
----------------------------------------------------------------------------------------
local show = false
SlashCmdList.FARMMODE = function()
	if show == false then
		Minimap:SetSize(C.minimapp.size * 1.65, C.minimapp.size * 1.65)
		AnchorMinimap:SetPoint("TOPRIGHT", MinimapBackdrop, "TOPRIGHT", -46, -46)
		MBFToggle:SetAlpha(0)
		show = true
	else
		Minimap:SetSize(C.minimapp.size-4, C.minimapp.size-4)
		AnchorMinimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 0, -(C.panels.yoffset+C.panels.CPbarsheight+2))
		MBFToggle:SetAlpha(1)
		show = false
	end
end
SLASH_FARMMODE1 = "/farmmode"
SLASH_FARMMODE2 = "/афкььщву"
SLASH_FARMMODE3 = "/fm"
SLASH_FARMMODE4 = "/аь"

----------------------------------------------------------------------------------------
--	Farm mode mouseover button(by m2jest1c)
----------------------------------------------------------------------------------------
local farm = CreateFrame("Button", "FarmMode", UIParent)
farm:SetTemplate("ClassColor")
farm:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", -3, 18)
farm:SetSize(19, 19)
farm:SetAlpha(0)

farm.t = farm:CreateTexture(nil, "OVERLAY")
farm.t:SetTexture("Interface\\Icons\\inv_misc_map_01")
farm.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
farm.t:SetPoint("TOPLEFT", farm, 2, -2)
farm.t:SetPoint("BOTTOMRIGHT", farm, -2, 2)

farm:SetScript("OnClick", function()
	SlashCmdList.FARMMODE()
end)

farm:SetScript("OnEnter", function()

	farm:FadeIn()
end)

farm:SetScript("OnLeave", function()
	farm:FadeOut()
end)