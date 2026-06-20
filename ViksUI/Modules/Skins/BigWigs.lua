local T, C, L = unpack(ViksUI)

if C.skins.bigwigs ~= true then return end

----------------------------------------------------------------------------------------
--	BigWigs skin (using ViksUI API)
----------------------------------------------------------------------------------------

-- Object pool for reuse
local pool = {
    backdrops = {},
    icons = {},
}

-- Get backdrop from pool
local function getBackdrop()
    if #pool.backdrops > 0 then
        return tremove(pool.backdrops)
    end
    
    local backdrop = CreateFrame("Frame", nil, UIParent)
    backdrop:SetTemplate("Transparent")
    backdrop:CreateShadow()
    backdrop:Hide()
    return backdrop
end

-- Return backdrop to pool
local function releaseBackdrop(backdrop)
    if not backdrop then return end
    backdrop:Hide()
    backdrop:ClearAllPoints()
    backdrop:SetParent(UIParent)
    tinsert(pool.backdrops, backdrop)
end

-- Store original frame properties for restoration
local function storeOriginalState(bar)
    bar:Set("bigwigs:viksui:originalheight", bar:GetHeight())
    bar:Set("bigwigs:viksui:originaliconpoints", {bar.candyBarIconFrame:GetPoint()})
    bar:Set("bigwigs:viksui:originaliconparent", bar.candyBarIconFrame:GetParent())
    bar:Set("bigwigs:viksui:originalicontexcoord", {bar.candyBarIconFrame:GetTexCoord()})
    bar:Set("bigwigs:viksui:originalbgshown", bar.candyBarBackground:IsShown())
end

-- Apply style to bar
local function applyStyle(bar)
    -- Store original state first
    storeOriginalState(bar)
    
    -- Bar sizing
    local height = bar:GetHeight()
    bar:Height(height * 0.618)
    
    -- Create or reuse backdrop
    local bg = getBackdrop()
    bg:SetParent(bar.candyBarBar)
    bg:ClearAllPoints()
    bg:SetOutside(bar.candyBarBar, 2, 2)
    bg:SetFrameStrata("BACKGROUND")
    bg:Show()
    bar:Set("bigwigs:viksui:backdrop", bg)
    
    -- Hide original background
    bar.candyBarBackground:Hide()
    
    -- Setup status bar
    bar.candyBarBar:SetStatusBarTexture(C.media.texture)
    if not bar:Get("bigwigs:emphasized") then
        bar.candyBarBar:SetStatusBarColor(T.color.r, T.color.g, T.color.b, 1)
    end
    
    -- Setup fonts
    bar.candyBarLabel:SetFont(C.font.stylization_font, C.font.stylization_font_size, C.font.stylization_font_style)
    bar.candyBarLabel:SetShadowOffset(0, 0)
    bar.candyBarLabel:ClearAllPoints()
    bar.candyBarLabel:Point("BOTTOMLEFT", bar.candyBarBar, "TOPLEFT", 3, -height * 0.22)
    
    bar.candyBarDuration:SetFont(C.font.stylization_font, C.font.stylization_font_size, C.font.stylization_font_style)
    bar.candyBarDuration:SetShadowOffset(0, 0)
    bar.candyBarDuration:ClearAllPoints()
    bar.candyBarDuration:Point("BOTTOMRIGHT", bar.candyBarBar, "TOPRIGHT", -3, -height * 0.22)
    
    -- Handle icon if exists
    local iconTex = bar:GetIcon()
    if iconTex then
        bar:SetIcon(nil)
        bar.candyBarIconFrame:SetTexture(iconTex)
        bar.candyBarIconFrame:Show()
        
        -- Position icon
        if bar.iconPosition == "RIGHT" then
            bar.candyBarIconFrame:Point("BOTTOMLEFT", bar, "BOTTOMRIGHT", 5, 0)
        else
            bar.candyBarIconFrame:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -5, 0)
        end
        
        bar.candyBarIconFrame:Size(height + 2)
        bar.candyBarIconFrame:SetTexCoord(0.1, 0.9, 0.1, 0.9)
        bar:Set("bigwigs:viksui:icontex", iconTex)
        
        -- Icon backdrop
        local iconBg = getBackdrop()
        iconBg:SetParent(bar)
        iconBg:ClearAllPoints()
        iconBg:SetOutside(bar.candyBarIconFrame, 2, 2)
        iconBg:Show()
        bar:Set("bigwigs:viksui:iconbackdrop", iconBg)
    end
end

-- Restore bar to original state
local function barStopped(bar)
    -- Restore original height
    local origHeight = bar:Get("bigwigs:viksui:originalheight")
    if origHeight then
        bar:Height(origHeight)
        bar:Set("bigwigs:viksui:originalheight", nil)
    end
    
    -- Restore icon
    local iconTex = bar:Get("bigwigs:viksui:icontex")
    if iconTex then
        bar:SetIcon(iconTex)
        bar:Set("bigwigs:viksui:icontex", nil)
        
        local iconPoints = bar:Get("bigwigs:viksui:originaliconpoints")
        if iconPoints then
            bar.candyBarIconFrame:ClearAllPoints()
            if iconPoints[1] then
                bar.candyBarIconFrame:Point(unpack(iconPoints[1]))
            end
            bar:Set("bigwigs:viksui:originaliconpoints", nil)
        end
        
        local texCoord = bar:Get("bigwigs:viksui:originalicontexcoord")
        if texCoord then
            bar.candyBarIconFrame:SetTexCoord(unpack(texCoord))
            bar:Set("bigwigs:viksui:originalicontexcoord", nil)
        end
    end
    
    -- Release icon backdrop
    local iconBg = bar:Get("bigwigs:viksui:iconbackdrop")
    if iconBg then
        releaseBackdrop(iconBg)
        bar:Set("bigwigs:viksui:iconbackdrop", nil)
    end
    
    -- Restore background visibility
    local bgShown = bar:Get("bigwigs:viksui:originalbgshown")
    if bgShown ~= nil then
        if bgShown then
            bar.candyBarBackground:Show()
        else
            bar.candyBarBackground:Hide()
        end
        bar:Set("bigwigs:viksui:originalbgshown", nil)
    end
    
    -- Release main backdrop
    local bg = bar:Get("bigwigs:viksui:backdrop")
    if bg then
        releaseBackdrop(bg)
        bar:Set("bigwigs:viksui:backdrop", nil)
    end
end

-- Register the bar style
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, _, addon)
    if addon == "BigWigs" then
        if BigWigs and BigWigsAPI then
            BigWigsAPI:RegisterBarStyle("ViksUI", {
                apiVersion = 1,
                version = 10,
                GetSpacing = function() return T.Scale(13) end,
                ApplyStyle = applyStyle,
                BarStopped = barStopped,
                GetStyleName = function() return "ViksUI" end,
            })
            
            -- Set as default if profile exists
            if BigWigs3DB and BigWigs3DB.profileKeys and BigWigs3DB.namespaces then
                local barsProfile = BigWigs3DB.namespaces.BigWigs_Plugins_Bars
                if barsProfile and barsProfile.profiles then
                    local playerKey = UnitName("player").." - "..GetRealmName()
                    local profileKey = BigWigs3DB.profileKeys[playerKey]
                    if profileKey and barsProfile.profiles[profileKey] then
                        barsProfile.profiles[profileKey].barStyle = "ViksUI"
                    end
                end
            end
        end
        f:UnregisterEvent("ADDON_LOADED")
    end
end)

-- Apply skin to other BigWigs frames
function T.SkinBigWigsFrame(frame, name)
    if not frame then return end
    
    if name == "Proximity" or name == "AltPower" then
        frame:SetTemplate("Transparent")
        frame:CreateShadow()
    elseif name == "QueueTimer" then
        frame:SetTemplate("Overlay")
        frame:SetHeight(15)
    end
end

-- Hook into BigWigs frame creation
if BigWigsLoader then
    BigWigsLoader.RegisterMessage("ViksUI", "BigWigs_FrameCreated", function(_, frame, name)
        T.SkinBigWigsFrame(frame, name)
    end)
end

-- Manual settings command
StaticPopupDialogs.VIKSUI_BIGWIGS = {
    text = L_POPUP_SETTINGS_BW or "Apply ViksUI skin to BigWigs?",
    button1 = ACCEPT,
    button2 = CANCEL,
    OnAccept = function()
        if BigWigs then
            local bars = BigWigs:GetPlugin("Bars")
            if bars then
                bars.db.profile.barStyle = "ViksUI"
            end
            if not InCombatLockdown() then
                ReloadUI()
            else
                print("|cffffff00Exit combat and type /reload to apply BigWigs skin.|r")
            end
        end
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = true,
}

SlashCmdList.VIKSUI_BW = function(msg)
    if msg == "apply" then
        StaticPopup_Show("VIKSUI_BIGWIGS")
    else
        print("|cffffff00Type /viksui_bw apply to apply BigWigs skin.|r")
    end
end
SLASH_VIKSUI_BW1 = "/viksui_bw"