local T, C, L = unpack(ViksUI)
if C.panels.NoPanels ~= true or C.misc.meters ~= true then return end

local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local CreateBtn = T.CreateBtn
local thickness = 1

-----------------------------------------------------------------------------------------
-- METERS
-----------------------------------------------------------------------------------------

-- if C_AddOns.IsAddOnLoaded('Skada') or C_AddOns.IsAddOnLoaded('Details') or C_AddOns.IsAddOnLoaded('Recount') then
    CreateBtn("ShowHideMeters", RIGHTChatline, 55, 20, "", "")
    RIGHTChatline:SetFrameStrata("HIGH")
    RIGHTChatline:SetFrameLevel(15)
    ShowHideMeters:SetPoint("LEFT", RIGHTChatline, "LEFT", 0, 0)

    -- Add logic for each meter addon
    if C_AddOns.IsAddOnLoaded('Skada') then
        ShowHideMeters:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(0)\n/run ChatFrame4Tab:Hide()\n/Skada toggle")
    end
    if C_AddOns.IsAddOnLoaded('Recount') then
        ShowHideMeters:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(0)\n/run ChatFrame4Tab:Hide()\n/recount toggle")
    end
    if C_AddOns.IsAddOnLoaded('Details') then
        ShowHideMeters:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(0)\n/run ChatFrame4Tab:Hide()\n/details toggle")
    end
    
    -- Fallback to Blizzard's Damage Meter if Details is not loaded
    if not C_AddOns.IsAddOnLoaded('Details') then
        ShowHideMeters:SetAttribute("macrotext1", "/run local f=DamageMeter if f then local h=f:GetAlpha()>0 f:SetAlpha(h and 0 or 1) f:EnableMouse(not h) for _,c in ipairs({f:GetChildren()}) do c:EnableMouse(not h) end end")
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
        GameTooltip:AddLine("Toggle active Damage Meter", 1, 1, 1, 1, 1, 1)
        GameTooltip:AddLine("(Skada, Recount, Details, Blizzard)", 1, 1, 1, 1, 1, 1)
        GameTooltip:Show()
    end)

    ShowHideMeters:SetScript("OnLeave", function(self)
        DamageMeterText:SetTextColor(unpack(C.media.pxcolor1))
        GameTooltip:Hide()
    end)

    -- Reset Chat Button
    CreateBtn("resetChat", RIGHTChatline, 70, 20, "", "")
    resetChat:SetPoint("LEFT", RIGHTChatline, "LEFT", 60, 0)
    
    -- Set actions for Reset Chat
    if C_AddOns.IsAddOnLoaded('Skada') then
        resetChat:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(1)\n/run ChatFrame4Tab:Show()\n/Skada toggle")
    end
    if C_AddOns.IsAddOnLoaded('Recount') then
        resetChat:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(1)\n/run ChatFrame4Tab:Show()\n/recount toggle")
    end
    if C_AddOns.IsAddOnLoaded('Details') then
        resetChat:SetAttribute("macrotext1", "/run ChatFrame4:SetAlpha(1)\n/run ChatFrame4Tab:Show()\n/details hide")
    end

    -- Fallback to Blizzard's Damage Meter reset if Details is not loaded
    if not C_AddOns.IsAddOnLoaded('Details') then
        resetChat:SetAttribute("macrotext1", "/run local f=DamageMeter if f then f:SetAlpha(0) end")
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
        GameTooltip:AddLine("Reset Chat and hide Meters", 1, 1, 1, 1, 1, 1)
        GameTooltip:Show()
    end)

    resetChat:SetScript("OnLeave", function(self)
        resetChatText:SetTextColor(unpack(C.media.pxcolor1))
        GameTooltip:Hide()
    end)

    -- New logic for hiding/showing chat frame on login
    local function HideShowChatFrame()
        if C.misc.meters_show then
            if ChatFrame4 then
                ChatFrame4:SetAlpha(0)  -- Hide ChatFrame4
                if ChatFrame4Tab then
                    ChatFrame4Tab:Hide()  -- Hide Tab
                end
            end
        else
            if C_AddOns.IsAddOnLoaded('Details') then
                DEFAULT_CHAT_FRAME.editBox:SetText("/details hide") 
                ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
            end
        end
    end

    -- Event listener for player login to handle hiding/showing the chat frame
    local EventFrame = CreateFrame("Frame")
    EventFrame:RegisterEvent("PLAYER_LOGIN")
    EventFrame:SetScript("OnEvent", function(self, event, ...)
        if event == "PLAYER_LOGIN" then
            HideShowChatFrame()
        end
    end)
-- end