local SelectedError = 1
local ErrorList = {}
local SoundTime = 0
local QueueError = {}
local EnableSound = false

-- Table for deferring Show calls while in combat lockdown
local PendingShows = {}

local function attemptShow(frame)
	if not frame or not frame.GetName then return end
	-- If we're in combat lockdown, defer the show and register to be retried
	if InCombatLockdown() then
		PendingShows[frame:GetName()] = frame
		-- ensure BaudErrorFrame will listen for PLAYER_REGEN_ENABLED to flush pending shows
		if BaudErrorFrame and not BaudErrorFrame._pendingShowRegistered then
			BaudErrorFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
			BaudErrorFrame._pendingShowRegistered = true
		end
		return
	end
	-- Use pcall to avoid the Lua error bubbling up if something is protected
	pcall(frame.Show, frame)
end

function BaudErrorFrame_OnLoad(self)
	self:RegisterEvent("VARIABLES_LOADED")
	self:RegisterEvent("ADDON_ACTION_BLOCKED")
	self:RegisterEvent("MACRO_ACTION_BLOCKED")
	self:RegisterEvent("ADDON_ACTION_FORBIDDEN")
	UIParent:UnregisterEvent("ADDON_ACTION_FORBIDDEN")
	self:RegisterEvent("MACRO_ACTION_FORBIDDEN")
	UIParent:UnregisterEvent("MACRO_ACTION_FORBIDDEN")
	UIParent:UnregisterEvent("LUA_WARNING")

	tinsert(UISpecialFrames, self:GetName())

	SlashCmdList["BaudErrorFrame"] = function()
		if BaudErrorFrame:IsShown() then
			BaudErrorFrame:Hide()
		else
			BaudErrorFrame:Show()
		end
	end
	SLASH_BaudErrorFrame1 = "/bauderror"

	seterrorhandler(BaudErrorFrameHandler)
end

function BaudErrorFrame_OnEvent(self, event, ...)
    local arg1, arg2 = ...
    if event == "VARIABLES_LOADED" then
        if type(BaudErrorFrameConfig) ~= "table" then
            BaudErrorFrameConfig = {}
        end
        if type(QueueError) ~= "table" then  -- Add this check
            QueueError = {}
        end
        for Key, Value in ipairs(QueueError) do
            BaudErrorFrameShowError(Value)
        end
        QueueError = nil
    elseif event == "ADDON_ACTION_BLOCKED" then
        BaudErrorFrameAdd(arg1.." blocked from using "..arg2, 4)
    elseif event == "MACRO_ACTION_BLOCKED" then
        BaudErrorFrameAdd("Macro blocked from using "..arg1, 4)
    elseif event == "ADDON_ACTION_FORBIDDEN" then
        BaudErrorFrameAdd(arg1.." forbidden from using "..arg2.." (Only usable by Blizzard)", 4)
    elseif event == "MACRO_ACTION_FORBIDDEN" then
        BaudErrorFrameAdd("Macro forbidden from using "..arg1.." (Only usable by Blizzard)", 4)
    elseif event == "PLAYER_REGEN_ENABLED" then
        -- Flush any pending deferred Show() calls now that combat ended
        if PendingShows then
            for name, frame in pairs(PendingShows) do
                pcall(frame.Show, frame)
                PendingShows[name] = nil
            end
        end
        -- Unregister the event until another defer is needed
        if BaudErrorFrame and BaudErrorFrame._pendingShowRegistered then
            BaudErrorFrame:UnregisterEvent("PLAYER_REGEN_ENABLED")
            BaudErrorFrame._pendingShowRegistered = nil
        end
    end
end

function BaudErrorFrameMinimapButton_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
	GameTooltip:AddLine(SHOW_LUA_ERRORS)
	GameTooltip:AddLine(L_ERRORFRAME_L, 1, 1, 1)
	GameTooltip:Show()
end

function BaudErrorFrameMinimapButton_OnLeave()
	GameTooltip:Hide()
end

function BaudErrorFrameMinimapButton_OnUpdate(self)
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)
end

function BaudErrorFrameHandler(Error)
	BaudErrorFrameAdd(Error, 3)
end

function BaudErrorFrameShowError(Error)
	if (GetTime() > SoundTime) and EnableSound then
		PlaySoundFile("Interface\\AddOns\\ViksUI\\Media\\sounds\\Whisper.mp3.ogg", "Master")
		SoundTime = GetTime() + 1
	end
end

function BaudErrorFrameAdd(Error, Retrace)
	for Key, Value in pairs(ErrorList) do
		if Value.Error == Error then
			if Value.Count < 99 then
				Value.Count = Value.Count + 1
				BaudErrorFrameEditBoxUpdate()
			end
			return
		end
	end
	if BaudErrorFrameConfig then
		BaudErrorFrameShowError(Error)
	else
		tinsert(QueueError, Error)
	end
	tinsert(ErrorList, {Error = Error, Count = 1, Stack = debugstack(Retrace)})
	-- Use pcall for SetText to avoid errors if the frame gets tainted
	pcall(function() BaudErrorFrameMinimapCount:SetText(getn(ErrorList)) end)
	-- Use attemptShow to safely show the minimap button (defers during combat lockdown)
	attemptShow(BaudErrorFrameMinimapButton)
	BaudErrorFrameScrollBar_Update()
end

function BaudErrorFrame_Select(Index)
	SelectedError = Index
	BaudErrorFrameScrollBar_Update()
	BaudErrorFrameDetailScrollFrameScrollBar:SetValue(0)
end

function BaudErrorFrame_OnShow()
	BaudErrorFrameScrollBar_Update()
end

function BaudErrorFrame_OnHide() end

function BaudErrorFrameEntry_OnClick(self)
	BaudErrorFrame_Select(self:GetID())
end

function BaudErrorFrameClearButton_OnClick(self)
	ErrorList = {}
	-- Use pcall to avoid issues
	pcall(function() BaudErrorFrameMinimapButton:Hide() end)
	self:GetParent():Hide()
end

function BaudErrorFrameScrollValue()
	if ErrorList and type(ErrorList) == "table" then
		local value = getn(ErrorList)
		return value
	end
end

local function colorStack(ret)
	ret = tostring(ret) or "" -- Yes, it gets called with nonstring from somewhere /mikk
	ret = ret:gsub("[%.I][%.n][%.t][%.e][%.r]face\\", "")
	ret = ret:gsub("%.?%.?%.?\\?AddOns\\", "")
	ret = ret:gsub("|([^chHr])", "||%1"):gsub("|$", "||") -- Pipes
	ret = ret:gsub("<(.-)>", "|cffffd200<%1>|r") -- Things wrapped in <>
	ret = ret:gsub("%[(.-)%]", "|cffffd200[%1]|r") -- Things wrapped in []
	ret = ret:gsub("([\"`'])(.-)([\"`'])", "|cff82c5ff%1%2%3|r") -- Quotes
	ret = ret:gsub(":(%d+)([%S\n])", ":|cff7fff7f%1|r%2") -- Line numbers
	ret = ret:gsub("([^\\]+%.lua)", "|cffffffff%1|r") -- Lua files
	return ret
end

function BaudErrorFrameScrollBar_Update()
	if not BaudErrorFrame:IsShown()then return end

	local Index, Button, ButtonText, Text
	local Frame = BaudErrorFrameListScrollBox
	local FrameName = Frame:GetName()
	local ScrollBar = _G[FrameName.."ScrollBar"]
	local Highlight = _G[FrameName.."Highlight"]
	local Total = getn(ErrorList)

	FauxScrollFrame_Update(ScrollBar, Total, Frame.Entries, 16)
	Highlight:Hide()
	for Line = 1, Frame.Entries do
		Index = Line + FauxScrollFrame_GetOffset(ScrollBar)
		Button = _G[FrameName.."Entry"..Line]
		ButtonText = _G[FrameName.."Entry"..Line.."Text"]
		if Index <= Total then
			Button:SetID(Index)
			ButtonText:SetText(colorStack(ErrorList[Index].Error))
			ButtonText:SetTextColor(0.7, 0.7, 0.7)
			Button:Show()
			if Index == SelectedError then
				Highlight:SetPoint("TOP", Button)
				Highlight:Show()
			end
		else
			Button:Hide()
		end
	end
	BaudErrorFrameEditBoxUpdate()
end

function BaudErrorFrameEditBoxUpdate()
	if ErrorList[SelectedError] then
		BaudErrorFrameEditBox.TextShown = colorStack(ErrorList[SelectedError].Error.."\nCount: "..ErrorList[SelectedError].Count.."\n\nCall Stack:\n"..ErrorList[SelectedError].Stack)
	else
		BaudErrorFrameEditBox.TextShown = ""
	end
	BaudErrorFrameEditBox:SetText(BaudErrorFrameEditBox.TextShown)
	BaudErrorFrameEditBox:SetTextColor(0.7, 0.7, 0.7)
end

function BaudErrorFrameEditBox_OnTextChanged(self)
	if self:GetText() ~= self.TextShown then
		self:SetText(self.TextShown)
		self:ClearFocus()
		return
	end
	BaudErrorFrameDetailScrollFrame:UpdateScrollChildRect()
end

function BaudErrorFrameEditBox_OnTextSet() end