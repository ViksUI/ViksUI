local T, C, L = unpack(ViksUI)
if C.panels.NoPanels ~= true or C.misc.meters ~= true then return end

local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local CreateBtn = T.CreateBtn
local thickness = 1

-----------------------------------------------------------------------------------------
-- METERS
-----------------------------------------------------------------------------------------

if IsAddOnLoaded('Skada') or IsAddOnLoaded('Details') or IsAddOnLoaded('Recount') then
	CreateBtn("ShowHideMeters", RIGHTChatline, 55, 20, "", "")
	RIGHTChatline:SetFrameStrata("HIGH")
	RIGHTChatline:SetFrameLevel(15)
	ShowHideMeters:SetPoint("LEFT", RIGHTChatline, "LEFT", 0, 0)
	if IsAddOnLoaded('Skada') then
		ShowHideMeters:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(0)\n/run ChatFrame4Tab:Hide()\n/Skada toggle")
	end
	if IsAddOnLoaded('Recount') then
		ShowHideMeters:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(0)\n/run ChatFrame4Tab:Hide()\n/recount toggle")
	end
	if IsAddOnLoaded('Details') then
		ShowHideMeters:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(0)\n/run ChatFrame4Tab:Hide()\n/details toggle")
	end
	ShowHideMeters:SetAlpha(0)

	local DamageMeterText = RIGHTChatline:CreateFontString(nil, "OVERLAY")
	DamageMeterText:SetFont(C.media.pixel_font, C.media.pixel_font_size-2, C.media.pixel_font_style)
	DamageMeterText:SetPoint("LEFT", RIGHTChatline, "LEFT", 20, -2)
	DamageMeterText:SetTextColor(unpack(C.media.pxcolor1))
	DamageMeterText:SetText("Meters")
		if C.panels.CPwidth <= 300 then
		DamageMeterText:SetText("DMG")
		end

	RIGHTChatline.iconleft = RIGHTChatline:CreateTexture(nil, "OVERLAY")
	RIGHTChatline.iconleft:Size(14, 14)
	RIGHTChatline.iconleft:SetPoint("LEFT", DamageMeterText, "LEFT", -20, -2)
	RIGHTChatline.iconleft:SetTexture([[Interface\AddOns\ViksUI\Media\Menuicons\damagemeter.tga]])
	RIGHTChatline.iconleft:SetVertexColor(class.r, class.g, class.b)
	if C.panels.CPwidth <= 300 then
		RIGHTChatline.iconleft:SetPoint("LEFT", RIGHTChatline, "LEFT", C.panels.CPwidth/6, 0)
	end

	ShowHideMeters:SetScript("OnEnter", function(self)
		DamageMeterText:SetTextColor(class.r, class.g, class.b)
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 16)
		GameTooltip:AddLine("Damage Meter:")
		GameTooltip:AddLine("Toggle active Damage Meter ", 1, 1, 1, 1, 1, 1)
		GameTooltip:AddLine("(Skada, Recount, Details) ", 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	end)

	ShowHideMeters:SetScript("OnLeave", function(self)
		DamageMeterText:SetTextColor(unpack(C.media.pxcolor1))
		GameTooltip:Hide()
	end)

	CreateBtn("resetChat", RIGHTChatline, 70, 20, "", "")
	resetChat:SetPoint("LEFT", RIGHTChatline, "LEFT", 60, 0)
	if IsAddOnLoaded('Skada') then
		resetChat:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(1)\n/run ChatFrame4Tab:Show()\n/Skada toggle")
	end
	if IsAddOnLoaded('Recount') then
		resetChat:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(1)\n/run ChatFrame4Tab:Show()\n/recound toggle")
	end
	if IsAddOnLoaded('Details') then
		resetChat:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(1)\n/run ChatFrame4Tab:Show()\n/details hide")
	end

	resetChat:SetAlpha(0)

	local resetChatText = RIGHTChatline:CreateFontString(nil, "OVERLAY")
	resetChatText:SetFont(C.media.pixel_font, C.media.pixel_font_size-2, C.media.pixel_font_style)
	resetChatText:SetPoint("LEFT", RIGHTChatline, "LEFT", 65, -2)
	resetChatText:SetTextColor(unpack(C.media.pxcolor1))
	resetChatText:SetText(" CHAT")

	resetChat:SetScript("OnEnter", function(self)
		resetChatText:SetTextColor(class.r, class.g, class.b)
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 16)
		GameTooltip:AddLine("Reset Meters:")
		GameTooltip:AddLine("Reset Chat and hide Meters ", 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	end)

	resetChat:SetScript("OnLeave", function(self)
		resetChatText:SetTextColor(unpack(C.media.pxcolor1))
		GameTooltip:Hide()
	end)
end