local T, C
local _, ns = ...
local L = ns

----------------------------------------------------------------------------------------
--	GUI for ViksUI(by Haleth, Solor)
----------------------------------------------------------------------------------------
local realm = GetRealmName()
local name = UnitName("player")

local pysWidth, pysHeight = _G.GetPhysicalScreenSize()
local fixedHeight = 768 / pysHeight
local scale = tonumber(floor(fixedHeight*100 + .5)/100)
mult = fixedHeight / scale

-- [[ Variables ]]

ns.buttons = {}
ns.NextPrevButtons = {}

local checkboxes = {}
local sliders = {}
local editboxes = {}
local dropdowns = {}
local colourpickers = {}
local panels = {}

-- cache old values to check whether UI needs to be reloaded
local old = {}
local oldColours = {}

-- local overrideReload = false
local userChangedSlider = true -- to use SetValue without triggering OnValueChanged
local baseName = "ViksUIOptionsPanel"

local r, g, b

-- [[ Functions ]]

-- when an option needs a reload
local function setReloadNeeded(isNeeded)
	ViksUIOptionsPanel.reloadText:SetShown(isNeeded)
	ns.needReload = isNeeded -- for the popup when clicking okay
	if isNeeded then
		ViksUIOptionsPanelOkayButton:Enable()
	else
		ViksUIOptionsPanelOkayButton:Disable()
	end
end
ns.setReloadNeeded = setReloadNeeded

-- expose reload helpers so that external modules (e.g. Patreon_ConfigUI) can
-- integrate nested controls with the same reload-detection mechanism
ns.setOldValue = function(frame, value)
	if old[frame] == nil then
		old[frame] = value
	end
end

-- check if a reload is needed
local function checkIsReloadNeeded()
	for frame, value in pairs(old) do
		local current
		if frame.getValue then
			current = frame.getValue()
		else
			current = C[frame.group][frame.option]
		end
		if current ~= value then
			setReloadNeeded(true)
			return
		end
	end

	for colourOption, oldTable in pairs(oldColours) do
		local savedTable = C[colourOption.group][colourOption.option]
		if savedTable[1] ~= oldTable[1] or savedTable[2] ~= oldTable[2] or savedTable[3] ~= oldTable[3] then
			setReloadNeeded(true)
			return
		end
	end

	-- if the tables were empty, or all of the old values match their current ones
	setReloadNeeded(false)
end
ns.checkIsReloadNeeded = checkIsReloadNeeded

-- Called by every widget to save a value
local function SaveValue(f, value)
	if not C.options[f.group] then C.options[f.group] = {} end
	if not C.options[f.group][f.option] then C.options[f.group][f.option] = {} end

	C.options[f.group][f.option] = value -- these are the saved variables
	C[f.group][f.option] = value -- and this is from the lua options
end

-- [[ Widgets ]]

-- Check boxes

local function toggleChildren(self, checked)
	local tR, tG, tB
	if checked then
		tR, tG, tB = 1, 1, 1
	else
		tR, tG, tB = .3, .3, .3
	end

	for _, child in next, self.children do
		child:SetEnabled(checked)
		child.Text:SetTextColor(tR, tG, tB)
	end
end

local function toggle(self)
	local checked = self:GetChecked()

	if checked then
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
	else
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
	end

	SaveValue(self, checked)
	if self.children then toggleChildren(self, checked) end

	if self.needsReload then
		if old[self] == nil then
			old[self] = not checked
		end

		checkIsReloadNeeded()
	end
end

ns.CreateCheckBox = function(parent, option, text, textDesc)
	local f = CreateFrame("CheckButton", nil, parent)

	f:SetSize(26, 26)

	f.Text = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	f.Text:SetJustifyH("LEFT")
	f.Text:SetTextColor(1, 1, 1)
	f.Text:SetPoint("LEFT", f, "RIGHT", 3, 0)

	f.group = parent.tag
	f.option = option

	if text then
		f.Text:SetText(text)
	else
		f.Text:SetText(ns[parent.tag.."_"..option])
	end

	f.Text:SetWidth(540)
	f.Text:SetWordWrap(false)

	f.tooltipText = ns[parent.tag.."_"..option.."_desc"] or textDesc or ns[parent.tag.."_"..option] or text

	f:SetScript("OnEnter", function()
		GameTooltip:SetOwner(f, "ANCHOR_RIGHT", 0, 0)
		GameTooltip:SetText(f.tooltipText, nil, nil, nil, nil, true)
	end)

	f:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)

	f.needsReload = true

	f:SetScript("OnClick", toggle)
	parent[option] = f

	tinsert(checkboxes, f)

	return f
end

-- Sliders

local function onValueChanged(self, value)
	if self.step < 1 then
		if self.option == "uiscale" then
			value = tonumber(string.format("%.3f", value))
		else
			value = tonumber(string.format("%.2f", value))
		end
	else
		value = floor(value + 0.5)
	end

	if self.textInput then
		self.textInput:SetText(value)
	end

	if userChangedSlider then
		SaveValue(self, value)

		if self.needsReload then
			if self.step < 1 then
				self.oldValue = tonumber(string.format("%.2f", self.oldValue))
			end
			old[self] = self.oldValue
			checkIsReloadNeeded()
		end
	end
end

local function onMouseWheel(self, delta)
	if not IsControlKeyDown() and not IsShiftKeyDown() then
		local script = self.parent:GetScript("OnMouseWheel")
		if script then
			script(self.parent, delta)
		end
		return
	end

	local value = self.textInput:GetText()

	local step = self.step
	if IsControlKeyDown() then
		step = self.step * 5
	elseif IsShiftKeyDown() then
		step = self.step
	end

	if delta < 0 then
		value = value + step
	else
		value = value - step
	end

	if self.step < 1 then
		if self.option == "uiscale" then
			value = tonumber(string.format("%.3f", value))
		else
			value = tonumber(string.format("%.2f", value))
		end
	else
		value = floor(value + 0.5)
	end

	if value < self.min then
		value = self.min
	elseif value > self.max then
		value = self.max
	end

	if self.textInput then
		self.textInput:SetText(value)
	end

	self:SetValue(value)

	if userChangedSlider then
		SaveValue(self, value)

		if self.needsReload then
			if self.step < 1 then
				self.oldValue = tonumber(string.format("%.2f", self.oldValue))
			end
			old[self] = self.oldValue
			checkIsReloadNeeded()
		end
	end
end

local function createSlider(parent, option, lowText, highText, low, high, step, needsReload, text, textDesc)
	local sliderName = parent:GetName()..option
	local f = CreateFrame("Slider", sliderName, parent, "OptionsSliderTemplate")

	f.group = parent.tag
	f.option = option

	_G[sliderName.."Text"]:SetFontObject(GameFontHighlightSmall)
	_G[sliderName.."Text"]:SetSize(150, 20)

	if text then
		_G[sliderName.."Text"]:SetText(text)
	else
		_G[sliderName.."Text"]:SetText(ns[parent.tag.."_"..option])
	end

	_G[sliderName.."Low"]:SetText(lowText)
	_G[sliderName.."High"]:SetText(highText)

	f:SetMinMaxValues(low, high)
	f:SetObeyStepOnDrag(true)
	f:SetValueStep(step)
	f:SetWidth(150)

	f.tooltipText = ns[parent.tag.."_"..option.."_desc"] or textDesc or ns[parent.tag.."_"..option] or text

	f:SetScript("OnEnter", function()
		GameTooltip:SetOwner(f, "ANCHOR_RIGHT", 0, 0)
		GameTooltip:SetText(f.tooltipText, nil, nil, nil, nil, true)
	end)

	f:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)

	f.needsReload = needsReload
	f.step = step
	f.min = low
	f.max = high
	f.parent = parent

	f:SetScript("OnValueChanged", onValueChanged)
	f:SetScript("OnMouseWheel", onMouseWheel)
	parent[option] = f

	tinsert(sliders, f)

	return f
end

local function onSliderEscapePressed(self)
	self:ClearFocus()
end

local function onSliderEnterPressed(self)
	local slider = self:GetParent()
	local min, max = slider:GetMinMaxValues()

	local value = tonumber(self:GetText())
	if value and value >= floor(min) and value <= floor(max) then
		if slider.option == "uiscale" then
			slider:SetValueStep(0.001)
		end
		slider:SetValue(value)
	else
		self:SetText(floor(slider:GetValue()*1000)/1000)
	end

	self:ClearFocus()
end

ns.CreateNumberSlider = function(parent, option, lowText, highText, low, high, step, needsReload, text, textDesc)
	local slider = createSlider(parent, option, lowText, highText, low, high, step, needsReload, text, textDesc)

	local f = CreateFrame("EditBox", parent:GetName()..option.."TextInput", slider, "InputBoxTemplate")
	f:SetAutoFocus(false)
	f:SetWidth(50)
	f:SetHeight(18)
	f:SetMaxLetters(8)
	f:SetFontObject(GameFontHighlight)

	f:SetPoint("LEFT", slider, "RIGHT", 10, 0)

	f:SetScript("OnEscapePressed", onSliderEscapePressed)
	f:SetScript("OnEnterPressed", onSliderEnterPressed)
	f:SetScript("OnEditFocusGained", nil)
	f:SetScript("OnEditFocusLost", onSliderEnterPressed)

	slider.textInput = f

	return slider
end

-- EditBox

local function onEnterPressed(self)
	local value = self.valueNumber and tonumber(self:GetText()) or tostring(self:GetText())
	SaveValue(self, value)
	self:ClearFocus()
	old[self] = self.oldValue
	checkIsReloadNeeded()
end

ns.CreateEditBox = function(parent, option, needsReload, text, number)
	local f = CreateFrame("EditBox", parent:GetName()..option.."TextInput", parent, "InputBoxTemplate")
	f:SetAutoFocus(false)
	f:SetWidth(60)
	f:SetHeight(18)
	f:SetMaxLetters(8)
	f:SetFontObject(GameFontHighlight)

	f:SetPoint("LEFT", 40, 0)

	f.value = ""
	f.valueNumber = number and true or false

	f:SetScript("OnEscapePressed", function(self) self:ClearFocus() self:SetText(f.value) end)
	f:SetScript("OnEnterPressed", onEnterPressed)
	f:SetScript("OnEditFocusGained", function() f.value = f:GetText() end)
	f:SetScript("OnEditFocusLost", onEnterPressed)

	local label = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	label:SetWidth(440)
	label:SetHeight(20)
	label:SetJustifyH("LEFT")
	label:SetPoint("LEFT", f, "RIGHT", 10, 0)

	if text then
		label:SetText(text)
	else
		label:SetText(ns[parent.tag.."_"..option])
	end

	f.label = label
	f.tooltipText = ns[parent.tag.."_"..option.."_desc"] or text or ""

	f:SetScript("OnEnter", function()
		GameTooltip:SetOwner(f, "ANCHOR_RIGHT", 5, 5)
		GameTooltip:SetText(f.tooltipText, nil, nil, nil, nil, true)
	end)

	f:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)

	f.group = parent.tag
	f.option = option

	f.needsReload = needsReload
	parent[option] = f

	tinsert(editboxes, f)

	return f
end

-- Tag EditBox with Popup Editor

local function onTagBoxEnterPressed(self)
	local value = tostring(self:GetText())
	SaveValue(self, value)
	self:ClearFocus()
	old[self] = self.oldValue
	checkIsReloadNeeded()
end

ns.CreateTagBox = function(parent, option, needsReload, text, defaultValue)
	-- Create main container with label
	local container = CreateFrame("Frame", parent:GetName()..option.."TagContainer", parent)
	container:SetSize(550, 26)
	
	-- Label
	local label = container:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	label:SetWidth(180)
	label:SetHeight(20)
	label:SetJustifyH("LEFT")
	label:SetPoint("TOPLEFT", 0, 0)
	
	if text then
		label:SetText(text)
	else
		label:SetText(ns[parent.tag.."_"..option])
	end
	
	-- Display EditBox (read-only, shows value and button)
	local displayBox = CreateFrame("EditBox", parent:GetName()..option.."TagDisplay", container, "InputBoxTemplate")
	displayBox:SetAutoFocus(false)
	displayBox:SetWidth(280)
	displayBox:SetHeight(18)
	displayBox:SetMaxLetters(0)
	displayBox:SetFontObject(GameFontHighlightSmall)
	displayBox:SetPoint("LEFT", label, "RIGHT", 10, 0)
	displayBox:EnableMouse(true)
	displayBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
	
	-- Edit Button
	local editBtn = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
	editBtn:SetSize(60, 18)
	editBtn:SetText("Edit")
	editBtn:SetPoint("LEFT", displayBox, "RIGHT", 5, 0)
	
	-- Hidden actual editbox for storing value
	local hiddenBox = CreateFrame("EditBox", nil, container)
	hiddenBox.group = parent.tag
	hiddenBox.option = option
	hiddenBox.needsReload = needsReload
	hiddenBox.value = ""
	hiddenBox.valueNumber = false
	hiddenBox:Hide()
	parent[option] = hiddenBox
	tinsert(editboxes, hiddenBox)
	
	-- ========== POPUP EDITOR WINDOW WITH VIKS STYLING ==========
	local popupFrame = CreateFrame("Frame", parent:GetName()..option.."PopupEditor", UIParent, "BackdropTemplate")
	popupFrame:SetSize(650, 380)
	popupFrame:SetPoint("CENTER", UIParent, "CENTER")
	popupFrame:SetFrameStrata("DIALOG")
	popupFrame:SetFrameLevel(100)
	popupFrame:Hide()
	
	-- Apply basic styling first (without T methods - they're not available yet)
	popupFrame:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8X8",
		edgeFile = "Interface\\Buttons\\WHITE8X8",
		tile = false,
		tileSize = 32,
		edgeSize = 1,
		insets = { left = 0, right = 0, top = 0, bottom = 0 }
	})
	popupFrame:SetBackdropColor(0.05, 0.05, 0.05, 0.95)
	popupFrame:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
	
	-- Store reference to apply T styling later
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, popupFrame)
	
	-- Popup Title
	local popupTitle = popupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	popupTitle:SetPoint("TOPLEFT", popupFrame, "TOPLEFT", 15, -12)
	popupTitle:SetText("Edit Tag: " .. (text or option))
	
	-- Close Button (styled later)
	local closeBtn = CreateFrame("Button", nil, popupFrame)
	closeBtn:SetSize(16, 16)
	closeBtn:SetPoint("TOPRIGHT", popupFrame, "TOPRIGHT", -10, -10)
	closeBtn:SetText("×")
	closeBtn:SetNormalFontObject(GameFontNormalLarge)
	
	closeBtn:SetScript("OnClick", function()
		popupFrame:Hide()
	end)
	
	-- Tag Input Area
	local tagInput = CreateFrame("EditBox", parent:GetName()..option.."PopupInput", popupFrame, "InputBoxTemplate")
	tagInput:SetAutoFocus(true)
	tagInput:SetWidth(600)
	tagInput:SetHeight(180)
	tagInput:SetMaxLetters(0)
	tagInput:SetFontObject(GameFontHighlightSmall)
	tagInput:SetMultiLine(true)
	tagInput:EnableMouse(true)
	tagInput:SetPoint("TOPLEFT", popupTitle, "BOTTOMLEFT", 0, -20)
	
	-- Helper text box
	local helperFrame = CreateFrame("Frame", nil, popupFrame, "BackdropTemplate")
	helperFrame:SetSize(600, 50)
	helperFrame:SetPoint("TOPLEFT", tagInput, "BOTTOMLEFT", 0, -10)
	helperFrame:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8X8",
		edgeFile = "Interface\\Buttons\\WHITE8X8",
		tile = false,
		tileSize = 32,
		edgeSize = 1,
		insets = { left = 0, right = 0, top = 0, bottom = 0 }
	})
	helperFrame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
	helperFrame:SetBackdropBorderColor(0.3, 0.3, 0.3, 0.8)
	
	local helperText = helperFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	helperText:SetWidth(580)
	helperText:SetHeight(45)
	helperText:SetJustifyH("LEFT")
	helperText:SetJustifyV("TOP")
	helperText:SetTextColor(0.7, 0.8, 1)
	helperText:SetPoint("TOPLEFT", helperFrame, "TOPLEFT", 8, -5)
	
	if defaultValue and defaultValue ~= "" then
		helperText:SetText("|cff70C0F5Default:|r " .. defaultValue)
	else
		helperText:SetText("|cff70C0F5Tip:|r Use oUF tag syntax like [name], [perhp], [drk:color], etc.\nMulti-line input supported. Press Escape to cancel.")
	end
	
	-- OK Button
	local okBtn = CreateFrame("Button", nil, popupFrame, "UIPanelButtonTemplate")
	okBtn:SetSize(100, 22)
	okBtn:SetText("OK")
	okBtn:SetPoint("BOTTOMRIGHT", popupFrame, "BOTTOMRIGHT", -115, 12)
	
	okBtn:SetScript("OnClick", function()
		local value = tagInput:GetText()
		displayBox:SetText(value)
		hiddenBox:SetText(value)
		onTagBoxEnterPressed(hiddenBox)
		popupFrame:Hide()
	end)
	
	-- Cancel Button
	local cancelBtn = CreateFrame("Button", nil, popupFrame, "UIPanelButtonTemplate")
	cancelBtn:SetSize(100, 22)
	cancelBtn:SetText("Cancel")
	cancelBtn:SetPoint("LEFT", okBtn, "RIGHT", 8, 0)
	
	cancelBtn:SetScript("OnClick", function()
		tagInput:SetText(displayBox:GetText())
		popupFrame:Hide()
	end)
	
	-- Reset Button - resets to default
	if defaultValue and defaultValue ~= "" then
		local resetBtn = CreateFrame("Button", nil, popupFrame, "UIPanelButtonTemplate")
		resetBtn:SetSize(100, 22)
		resetBtn:SetText("Reset Default")
		resetBtn:SetPoint("BOTTOMLEFT", popupFrame, "BOTTOMLEFT", 12, 12)
		
		resetBtn:SetScript("OnClick", function()
			tagInput:SetText(defaultValue)
			tagInput:SetFocus()
			tagInput:HighlightText()
		end)
		
		-- Store for later skinning
		ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
		table.insert(ns.tagPopupFramesToSkin, {resetBtn, true})
	end
	
	-- Edit Button Click Handler
	editBtn:SetScript("OnClick", function()
		tagInput:SetText(displayBox:GetText())
		tagInput:SetFocus()
		tagInput:HighlightText()
		popupFrame:Show()
	end)
	
	-- Close on escape
	popupFrame:SetScript("OnKeyDown", function(self, key)
		if key == "Escape" then
			self:Hide()
		end
	end)
	
	-- Store references for later skinning
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {displayBox, true})
	table.insert(ns.tagPopupFramesToSkin, {editBtn, true})
	table.insert(ns.tagPopupFramesToSkin, {closeBtn, true})
	table.insert(ns.tagPopupFramesToSkin, {tagInput, true})
	table.insert(ns.tagPopupFramesToSkin, {okBtn, true})
	table.insert(ns.tagPopupFramesToSkin, {cancelBtn, true})
	
	-- Store references
	container.displayBox = displayBox
	container.editBtn = editBtn
	container.hiddenBox = hiddenBox
	container.popupFrame = popupFrame
	container.tagInput = tagInput
	container.tooltipText = ns[parent.tag.."_"..option.."_desc"] or text or ""
	
	-- Tooltip
	container:SetScript("OnEnter", function()
		GameTooltip:SetOwner(container, "ANCHOR_RIGHT", 5, 5)
		GameTooltip:SetText(container.tooltipText, nil, nil, nil, nil, true)
		if defaultValue and defaultValue ~= "" then
			GameTooltip:AddLine("|cff70C0F5Default: " .. defaultValue .. "|r", 0.7, 0.8, 1)
		end
		GameTooltip:Show()
	end)
	
	container:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	
	container:EnableMouse(true)
	
	return container
end

-- Custom Tag Creator UI

ns.CreateCustomTagCreator = function(parent)
	local container = CreateFrame("Frame", parent:GetName().."CustomTagCreator", parent)
	container:SetSize(550, 240)  -- Increased height for description
	
	-- Header
	local header = container:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	header:SetWidth(550)
	header:SetHeight(20)
	header:SetJustifyH("LEFT")
	header:SetPoint("TOPLEFT", 0, 0)
	header:SetText("Create Custom Tag")
	
	-- ========== TAG NAME ==========
	local nameLabel = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	nameLabel:SetWidth(100)
	nameLabel:SetHeight(20)
	nameLabel:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -15)
	nameLabel:SetText("Tag Name:")
	nameLabel:SetJustifyH("LEFT")
	
	local nameBox = CreateFrame("EditBox", parent:GetName().."CustomTagNameBox", container, "InputBoxTemplate")
	nameBox:SetAutoFocus(false)
	nameBox:SetWidth(200)
	nameBox:SetHeight(18)
	nameBox:SetMaxLetters(50)
	nameBox:SetFontObject(GameFontHighlight)
	nameBox:SetPoint("LEFT", nameLabel, "RIGHT", 10, 0)
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {nameBox, false})
	
	-- ========== TAG FUNCTION ==========
	local funcLabel = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	funcLabel:SetWidth(100)
	funcLabel:SetHeight(20)
	funcLabel:SetPoint("TOPLEFT", nameLabel, "BOTTOMLEFT", 0, -20)
	funcLabel:SetText("Function:")
	funcLabel:SetJustifyH("LEFT")
	funcLabel:SetJustifyV("TOP")
	
	local funcEditBtn = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
	funcEditBtn:SetSize(60, 18)
	funcEditBtn:SetText("Edit")
	funcEditBtn:SetPoint("LEFT", funcLabel, "RIGHT", 10, 0)
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {funcEditBtn, true})
	
	-- Function display (read-only)
	local funcDisplay = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	funcDisplay:SetWidth(420)
	funcDisplay:SetHeight(30)
	funcDisplay:SetJustifyH("LEFT")
	funcDisplay:SetTextColor(0.7, 0.8, 1)
	funcDisplay:SetPoint("TOPLEFT", funcLabel, "BOTTOMLEFT", 0, -5)
	funcDisplay:SetText("|cff70C0F5(Click Edit to enter function)|r")
	
	-- Hidden function storage
	local hiddenFunc = CreateFrame("EditBox", nil, container)
	hiddenFunc:Hide()
	
	-- ========== EVENT STRING ==========
	local eventLabel = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	eventLabel:SetWidth(100)
	eventLabel:SetHeight(20)
	eventLabel:SetPoint("TOPLEFT", funcDisplay, "BOTTOMLEFT", 0, -10)
	eventLabel:SetText("Events:")
	eventLabel:SetJustifyH("LEFT")
	
	local eventBox = CreateFrame("EditBox", parent:GetName().."CustomTagEventBox", container, "InputBoxTemplate")
	eventBox:SetAutoFocus(false)
	eventBox:SetWidth(350)
	eventBox:SetHeight(18)
	eventBox:SetMaxLetters(200)
	eventBox:SetFontObject(GameFontHighlight)
	eventBox:SetPoint("LEFT", eventLabel, "RIGHT", 10, 0)
	eventBox:SetText("UNIT_HEALTH")
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {eventBox, false})
	
	-- ========== HELPER TEXT DESCRIPTION ==========
	local helperText = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	helperText:SetWidth(530)
	helperText:SetHeight(40)
	helperText:SetJustifyH("LEFT")
	helperText:SetTextColor(0.7, 0.8, 1)
	helperText:SetPoint("TOPLEFT", eventBox, "BOTTOMLEFT", 0, -5)
	helperText:SetText("|cff70C0F5Example:|r\n" ..
		"|cffFFFFFFfunction(unit) return UnitHealthPercent(unit) .. '%' end|r\n" ..
		"|cff70C0F5Events:|r UNIT_HEALTH UNIT_MAXHEALTH")
	
	-- ========== CREATE BUTTON (Right side) ==========
	local createBtn = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
	createBtn:SetSize(100, 22)
	createBtn:SetText("Create Tag")
	createBtn:SetPoint("RIGHT", container, "RIGHT", 0, 0)
	createBtn:SetPoint("TOP", eventBox, "BOTTOM", 0, -8)
	
	createBtn:SetScript("OnClick", function()
		local tagName = nameBox:GetText()
		local tagFunc = hiddenFunc:GetText()
		local tagEvents = eventBox:GetText()
		
		if ns.RegisterCustomTag(tagName, tagFunc, tagEvents) then
			nameBox:SetText("")
			hiddenFunc:SetText("")
			funcDisplay:SetText("|cff70C0F5(Click Edit to enter function)|r")
			eventBox:SetText("UNIT_HEALTH")
			
			-- Refresh tag list if visible
			if ns.RefreshTagsList then
				ns.RefreshTagsList()
			end
		end
	end)
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {createBtn, true})
	
	-- ========== FUNCTION EDITOR POPUP ==========
	local funcPopup = CreateFrame("Frame", parent:GetName().."FuncEditorPopup", UIParent, "BackdropTemplate")
	funcPopup:SetSize(700, 450)
	funcPopup:SetPoint("CENTER", UIParent, "CENTER")
	funcPopup:SetFrameStrata("DIALOG")
	funcPopup:SetFrameLevel(100)
	funcPopup:Hide()
	
	funcPopup:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8X8",
		edgeFile = "Interface\\Buttons\\WHITE8X8",
		tile = false,
		tileSize = 32,
		edgeSize = 1,
		insets = { left = 0, right = 0, top = 0, bottom = 0 }
	})
	funcPopup:SetBackdropColor(0.05, 0.05, 0.05, 0.95)
	funcPopup:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, funcPopup)
	
	-- Popup title
	local popupTitle = funcPopup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	popupTitle:SetPoint("TOPLEFT", funcPopup, "TOPLEFT", 15, -12)
	popupTitle:SetText("Edit Tag Function")
	
	-- Close button
	local closeBtn = CreateFrame("Button", nil, funcPopup)
	closeBtn:SetSize(16, 16)
	closeBtn:SetPoint("TOPRIGHT", funcPopup, "TOPRIGHT", -10, -10)
	closeBtn:SetText("×")
	closeBtn:SetNormalFontObject(GameFontNormalLarge)
	
	closeBtn:SetScript("OnClick", function()
		funcPopup:Hide()
	end)
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {closeBtn, true})
	
	-- Function input
	local funcInput = CreateFrame("EditBox", parent:GetName().."FuncInput", funcPopup, "InputBoxTemplate")
	funcInput:SetAutoFocus(true)
	funcInput:SetWidth(650)
	funcInput:SetHeight(250)
	funcInput:SetMaxLetters(0)
	funcInput:SetFontObject(GameFontHighlightSmall)
	funcInput:SetMultiLine(true)
	funcInput:EnableMouse(true)
	funcInput:SetPoint("TOPLEFT", popupTitle, "BOTTOMLEFT", 0, -20)
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {funcInput, false})
	
	-- Helper text in popup
	local popupHelper = funcPopup:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	popupHelper:SetWidth(650)
	popupHelper:SetHeight(50)
	popupHelper:SetJustifyH("LEFT")
	popupHelper:SetTextColor(0.7, 0.8, 1)
	popupHelper:SetPoint("TOPLEFT", funcInput, "BOTTOMLEFT", 0, -5)
	popupHelper:SetText("|cff70C0F5Tip:|r Your function receives 'unit' and 'realUnit' as parameters.\n" ..
		"Use available tag functions from oUF like: UnitHealth(), UnitHealthPercent(), UnitName(), etc.")
	
	-- OK button
	local popupOk = CreateFrame("Button", nil, funcPopup, "UIPanelButtonTemplate")
	popupOk:SetSize(100, 22)
	popupOk:SetText("OK")
	popupOk:SetPoint("BOTTOMRIGHT", funcPopup, "BOTTOMRIGHT", -105, 12)
	
	popupOk:SetScript("OnClick", function()
		local funcText = funcInput:GetText()
		if funcText and funcText ~= "" then
			hiddenFunc:SetText(funcText)
			-- Show preview (first 60 chars)
			if string.len(funcText) > 60 then
				funcDisplay:SetText(funcText:sub(1, 57) .. "...")
			else
				funcDisplay:SetText(funcText)
			end
		end
		funcPopup:Hide()
	end)
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {popupOk, true})
	
	-- Cancel button
	local popupCancel = CreateFrame("Button", nil, funcPopup, "UIPanelButtonTemplate")
	popupCancel:SetSize(100, 22)
	popupCancel:SetText("Cancel")
	popupCancel:SetPoint("LEFT", popupOk, "RIGHT", 8, 0)
	
	popupCancel:SetScript("OnClick", function()
		funcInput:SetText(hiddenFunc:GetText())
		funcPopup:Hide()
	end)
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {popupCancel, true})
	
	-- Edit button click handler
	funcEditBtn:SetScript("OnClick", function()
		funcInput:SetText(hiddenFunc:GetText())
		funcInput:SetFocus()
		funcInput:HighlightText()
		funcPopup:Show()
	end)
	
	funcPopup:SetScript("OnKeyDown", function(self, key)
		if key == "Escape" then
			self:Hide()
		end
	end)
	
	container.nameBox = nameBox
	container.funcInput = hiddenFunc
	container.eventBox = eventBox
	container.createBtn = createBtn
	container.funcPopup = funcPopup
	
	return container
end

ns.CreateTagsLibraryDisplay = function(parent)
	local container = CreateFrame("Frame", parent:GetName().."TagsLibrary", parent)
	container:SetSize(550, 280)  -- Adjusted to fit in panel
	
	-- Header
	local header = container:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	header:SetWidth(550)
	header:SetHeight(20)
	header:SetJustifyH("LEFT")
	header:SetPoint("TOPLEFT", 0, 0)
	header:SetText("Available Tags - Search & Manage")
	
	-- ========== SEARCH BOX ==========
	-- local searchLabel = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	-- searchLabel:SetWidth(50)
	-- searchLabel:SetHeight(20)
	-- searchLabel:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -12)
	-- searchLabel:SetText("Search:")
	
	local searchBox = CreateFrame("EditBox", parent:GetName().."TagSearchBox", container, "InputBoxTemplate")
	searchBox:SetAutoFocus(false)
	searchBox:SetWidth(480)
	searchBox:SetHeight(18)
	searchBox:SetMaxLetters(100)
	searchBox:SetFontObject(GameFontHighlight)
	-- searchBox:SetPoint("LEFT", searchLabel, "RIGHT", 10, 0)
	searchBox:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 10, 0)
	
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {searchBox, false})
	
	-- ========== SCROLL FRAME FOR TAGS ==========
	-- Use UIPanelScrollFrameTemplate for proper scrolling
	local scrollFrame = CreateFrame("ScrollFrame", parent:GetName().."TagsScrollFrame", container, "UIPanelScrollFrameTemplate")
	scrollFrame:SetSize(480, 225)
	scrollFrame:SetPoint("TOPLEFT", searchBox, "BOTTOMLEFT", -5, -10)
	
	-- Scroll child
	local scrollChild = CreateFrame("Frame", nil, scrollFrame)
	scrollChild:SetSize(520, 1)
	scrollFrame:SetScrollChild(scrollChild)
	
	-- ========== POPULATE TAGS LIST ==========
	local function UpdateTagsList(filter)
		-- Initialize tagEntries if it doesn't exist
		if not scrollChild.tagEntries then
			scrollChild.tagEntries = {}
		end
		
		-- Clear existing
		for i = #scrollChild.tagEntries, 1, -1 do
			if scrollChild.tagEntries[i] then
				scrollChild.tagEntries[i]:Hide()
				scrollChild.tagEntries[i]:SetParent(nil)
			end
		end
		scrollChild.tagEntries = {}
		
		local allTags = ns.GetAllAvailableTags()
		local yOffset = 0
		
		for _, tagInfo in ipairs(allTags) do
			if filter == "" or tagInfo.name:lower():find(filter:lower(), 1, true) or 
			   tagInfo.desc:lower():find(filter:lower(), 1, true) then
				local tagEntry = CreateFrame("Frame", nil, scrollChild)
				tagEntry:SetSize(510, 28)
				tagEntry:SetPoint("TOPLEFT", 0, -yOffset)
				
				-- Tag name
				local tagText = tagEntry:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
				tagText:SetWidth(120)
				tagText:SetHeight(28)
				tagText:SetJustifyH("LEFT")
				tagText:SetPoint("TOPLEFT", 5, 0)
				
				local isCustom = tagInfo.source == "Custom"
				local tagDisplay = isCustom and ("|cff70C0F5[CUSTOM]|r " .. tagInfo.name) or tagInfo.name
				tagText:SetText(tagDisplay)
				
				-- Tag description
				local descText = tagEntry:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
				descText:SetWidth(280)
				descText:SetHeight(28)
				descText:SetJustifyH("LEFT")
				descText:SetTextColor(0.8, 0.8, 0.8)
				descText:SetPoint("LEFT", tagText, "RIGHT", 5, 0)
				descText:SetText(tagInfo.desc)
				
				-- Source label
				local sourceText = tagEntry:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
				sourceText:SetWidth(60)
				sourceText:SetHeight(28)
				sourceText:SetJustifyH("CENTER")
				sourceText:SetTextColor(0.6, 0.6, 0.8)
				sourceText:SetPoint("RIGHT", tagEntry, "RIGHT", -40, 0)
				sourceText:SetText(tagInfo.source)
				
				-- Delete button for custom tags
				if isCustom then
					local deleteBtn = CreateFrame("Button", nil, tagEntry)
					deleteBtn:SetSize(16, 16)
					deleteBtn:SetPoint("TOPRIGHT", tagEntry, "TOPRIGHT", -5, -6)
					deleteBtn:SetText("×")
					deleteBtn:SetNormalFontObject(GameFontHighlight)
					deleteBtn:SetTextColor(1, 0.3, 0.3)
					
					deleteBtn:SetScript("OnClick", function()
						ns.DeleteCustomTag(tagInfo.name)
						UpdateTagsList(searchBox:GetText())
					end)
					
					-- Hover effect
					deleteBtn:SetScript("OnEnter", function()
						deleteBtn:SetTextColor(1, 0.5, 0.5)
					end)
					deleteBtn:SetScript("OnLeave", function()
						deleteBtn:SetTextColor(1, 0.3, 0.3)
					end)
				end
				
				table.insert(scrollChild.tagEntries, tagEntry)
				yOffset = yOffset + 30
			end
		end
		
		scrollChild:SetHeight(math.max(yOffset, 225))
		scrollFrame:SetVerticalScroll(0)
	end
	
	searchBox:SetScript("OnTextChanged", function()
		UpdateTagsList(searchBox:GetText())
	end)
	
	-- Initial population
	UpdateTagsList("")
	
	container.UpdateTagsList = UpdateTagsList
	ns.RefreshTagsList = function()
		if container and container.UpdateTagsList then
			container.UpdateTagsList(searchBox:GetText())
		end
	end
	
	-- Store scrollframe for later skinning
	ns.tagPopupFramesToSkin = ns.tagPopupFramesToSkin or {}
	table.insert(ns.tagPopupFramesToSkin, {scrollFrame, false})
	
	return container
end

-- Colour pickers

-- we update this in onColourSwatchClicked, need it for setColour / resetColour
-- because it can't be passed as parameter
local currentColourOption

local function round(x)
	return floor((x * 100) + .5) / 100
end

local function setColour()
	local newR, newG, newB = ColorPickerFrame:GetColorRGB()
	newR, newG, newB = round(newR), round(newG), round(newB)

	currentColourOption:SetBackdropBorderColor(newR, newG, newB)
	currentColourOption:SetBackdropColor(newR, newG, newB, 0.3)
	SaveValue(currentColourOption, {newR, newG, newB})

	checkIsReloadNeeded()
end

local function resetColour(previousValues)
	local oldR, oldG, oldB = unpack(previousValues)

	currentColourOption:SetBackdropBorderColor(oldR, oldG, oldB)
	currentColourOption:SetBackdropColor(oldR, oldG, oldB, 0.3)
	SaveValue(currentColourOption, {oldR, oldG, oldB})

	checkIsReloadNeeded()
end

local function onColourSwatchClicked(self, button)
	if button == "RightButton" then
		C.options[self.group][self.option] = nil
		setReloadNeeded(true)
		return
	end

	local colourTable = C[self.group][self.option]
	local r, g, b = unpack(colourTable)
	r, g, b = round(r), round(g), round(b)
	local originalR, originalG, originalB = r, g, b

	currentColourOption = self

	if self.needsReload and oldColours[self] == nil then
		oldColours[self] = {r, g, b}
	end

	ColorPickerFrame.Content.ColorPicker:SetColorRGB(r, g, b)
	ColorPickerFrame.previousValues = {originalR, originalG, originalB}
	ColorPickerFrame.swatchFunc = setColour
	ColorPickerFrame.cancelFunc = resetColour
	ColorPickerFrame:Hide()
	ColorPickerFrame:Show()
end

ns.CreateColourPicker = function(parent, option, needsReload, text)
	local f = CreateFrame("Button", nil, parent)
	f:SetSize(40, 20)

	local colortext = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	colortext:SetText(COLOR)
	colortext:SetPoint("CENTER")
	colortext:SetJustifyH("CENTER")
	f:SetWidth(colortext:GetWidth() + 5)

	local label = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	if text then
		label:SetText(text)
	else
		label:SetText(ns[parent.tag.."_"..option])
	end
	label:SetWidth(440)
	label:SetHeight(20)
	label:SetJustifyH("LEFT")
	label:SetPoint("LEFT", 50, 0)

	f.group = parent.tag
	f.option = option

	f.needsReload = needsReload

	f:SetScript("OnMouseUp", onColourSwatchClicked)
	parent[option] = f

	tinsert(colourpickers, f)

	return f
end

-- DropDown
local DropDownText = {
	["Interface\\AddOns\\ViksUI\\Media\\Textures\\Texture.tga"] = "Normal texture",
	["Interface\\AddOns\\ViksUI\\Media\\Font\\normal_font.ttf"] = "Normal font",
	["Interface\\AddOns\\ViksUI\\Media\\Font\\pixel.ttf"] = "Pixel Font",
	[STANDARD_TEXT_FONT] = "Blizzard font",
	["BLACKLIST"] = L.general_error_blacklist,
	["WHITELIST"] = L.general_error_whitelist,
	["COMBAT"] = L.general_error_combat,
	["NONE"] = L.general_error_none,
	["RAID"] = L.automation_auto_collapse_raid,
	["RELOAD"] = L.automation_auto_collapse_reload,
	["SCENARIO"] = L.automation_auto_collapse_scenario,
	["DYNAMIC"] = L.raidframe_auto_position_dynamic,
	["STATIC"] = L.raidframe_auto_position_static,
	["HEAL"] = L.raidframe_heal_layout,
	["DPS"] = L.raidframe_dps_layout,
	["AUTO"] = L.raidframe_auto_layout,
	["BLIZZARD"] = "Blizzard",
	["ICONS"] = L.unitframe_portrait_type_icons,
	["OVERLAY"] = L.unitframe_portrait_type_overlay,
	["ICON"] = L.unitframe_castbar_focus_type_icon,
	["BAR"] = L.unitframe_castbar_focus_type_bar,
	["DOWN"] = L.enemycooldown_down,
	["LEFT"] = L.enemycooldown_left,
	["RIGHT"] = L.enemycooldown_right,
	["UP"] = L.enemycooldown_up,
}

ns.CreateDropDown = function(parent, option, needsReload, text, tableValue, LSM, isFont)
	local f = CreateFrame("Frame", parent:GetName()..option.."DropDown", parent, "UIDropDownMenuTemplate")
	UIDropDownMenu_SetWidth(f, 110)

	UIDropDownMenu_Initialize(f, function(self)
		local info = UIDropDownMenu_CreateInfo()
		info.func = self.SetValue
		for key, value in pairs(tableValue) do
			info.text = LSM and (DropDownText[value] or key) or DropDownText[value] or value
			info.arg1 = value
			info.arg2 = key
			info.checked = value == f.selectedValue

			if isFont then
				local fObject = CreateFont(info.text)
				fObject:SetFont(value, 12, "")
				info.fontObject = fObject
			end

			UIDropDownMenu_AddButton(info)
		end
	end)

	function f:SetValue(newValue, newkey)
		f.selectedValue = newValue
		local text = LSM and (DropDownText[newValue] or newkey) or DropDownText[newValue] or newValue
		if isFont then
			local style = _G[parent:GetName()..option.."_styleDropDown"]
			if style then
				if text == "Pixel Font" then
					style.selectedValue = "MONOCHROMEOUTLINE"
					UIDropDownMenu_SetText(style, "MONOCHROMEOUTLINE")
					SaveValue(style, "MONOCHROMEOUTLINE")
					old[style] = style.oldValue
				else
					local new_style = style.oldValue == "MONOCHROMEOUTLINE" and "OUTLINE" or style.oldValue
					style.selectedValue = new_style
					UIDropDownMenu_SetText(style, new_style)
					SaveValue(style, new_style)
					old[style] = style.oldValue
				end
			end
		end
		UIDropDownMenu_SetText(f, text)
		SaveValue(f, newValue)
		old[f] = f.oldValue
		checkIsReloadNeeded()
		CloseDropDownMenus()
	end

	local label = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	if text then
		label:SetText(text)
	else
		label:SetText(ns[parent.tag.."_"..option])
	end

	label:SetHeight(20)
	label:SetJustifyH("LEFT")
	label:SetPoint("LEFT", 160, 4)
	f.label = label

	f.tooltipText = ns[parent.tag.."_"..option.."_desc"]
	if f.tooltipText then
		f:SetScript("OnEnter", function()
			GameTooltip:SetOwner(f, "ANCHOR_RIGHT", 0, 0)
			GameTooltip:SetText(f.tooltipText, nil, nil, nil, nil, true)
		end)

		f:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
	end

	f.group = parent.tag
	f.option = option

	f.needsReload = needsReload

	parent[option] = f

	tinsert(dropdowns, f)

	return f
end

-- [[ Categories and tabs ]]

local offset = 50
local activeTab = nil

local function setActiveTab(tab)
	activeTab = tab

	activeTab.panel.tab.Text:SetTextColor(1, 1, 1)

	activeTab.panel:Show()

	if activeTab.panel_2 then
		activeTab.panel.PrevPageButton:Show()
		activeTab.panel.PrevPageButton:Disable()
		activeTab.panel.NextPageButton:Enable()
		activeTab.panel.pageText:SetFormattedText(COLLECTION_PAGE_NUMBER, 1, activeTab.panel.maxPages)
		activeTab.panel.currentPage = 1
		activeTab.panel_2:Hide()
	end

	C.category = tab.panel.tag
end

local onTabClick = function(tab)
	activeTab.panel:Hide()

	activeTab.panel.tab.Text:SetTextColor(1, 0.82, 0)

	if activeTab.panel_2 then
		activeTab.panel.PrevPageButton:Hide()
		activeTab.panel_2:Hide()
	end

	if activeTab.panel_3 then
		activeTab.panel_3:Hide()
	end

	if activeTab.panel_4 then
		activeTab.panel_4:Hide()
	end

	setActiveTab(tab)

	ns.HideSpellList()
end

local function CreateOptionPanel(name, text, subText)
	local panel = CreateFrame("Frame", name, ViksUIOptionsPanel)
	panel:SetSize(600, 670)
	panel:SetPoint("RIGHT", 0, 10)
	panel:EnableMouseWheel(true)
	panel:Hide()

	panel.Title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	panel.Title:SetPoint("TOPLEFT", 8, -16)
	panel.Title:SetText(text)

	panel.subText = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	panel.subText:SetPoint("TOPLEFT", panel.Title, "BOTTOMLEFT", 0, -8)
	panel.subText:SetJustifyH("LEFT")
	panel.subText:SetJustifyV("TOP")
	panel.subText:SetSize(570, 30)
	panel.subText:SetText(subText)

	return panel
end

ns.addCategory = function(name, text, subText, num)
	local tab = CreateFrame("Button", nil, ViksUIOptionsPanel)
	tab:SetPoint("TOPLEFT", 11, -offset)
	tab:SetSize(168, 22)

	tab.Text = tab:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	tab.Text:SetPoint("LEFT", tab, 8, 0)
	tab.Text:SetText(text)
	tab.Text:SetSize(160, 20)
	tab.Text:SetJustifyH("LEFT")

	tab:SetScript("OnMouseUp", onTabClick)
	offset = (offset + 24)

	local tag = strlower(name)
	local panel = CreateOptionPanel(baseName..name, text, subText)
	panel[1] = panel
	tinsert(panels, panel)

	tab.panel = panel
	panel.tab = tab
	panel.tag = tag
	ViksUIOptionsPanel[tag] = panel

	local numPages = num or 1
	if numPages > 1 then
		local name2 = name.."2"
		local tag2 = strlower(name2)
		local panel_2 = CreateOptionPanel(baseName..name2, text, subText)
		panel[2] = panel_2
		tinsert(panels, panel_2)

		if name == "general" then
			panel_2.tag = "media"
		else
			panel_2.tag = tag
		end

		ViksUIOptionsPanel[tag2] = panel_2
		tab.panel_2 = panel_2

		local PrevPageButton = CreateFrame("Button", baseName..name.."PrevButton", ViksUIOptionsPanel)
		PrevPageButton:SetPoint("TOPRIGHT", -45, -44)
		PrevPageButton:SetSize(28, 28)
		PrevPageButton:SetHighlightTexture("Interface\Buttons\UI-Common-MouseHilight")
		PrevPageButton:Hide()
		PrevPageButton:Disable()

		local pageText = PrevPageButton:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		pageText:SetPoint("RIGHT", PrevPageButton, "LEFT", -5, 0)
		panel.pageText = pageText

		local NextPageButton = CreateFrame("Button", baseName..name.."NextButton", PrevPageButton)
		NextPageButton:SetPoint("LEFT", PrevPageButton, "RIGHT", 5, 0)
		NextPageButton:SetSize(28, 28)
		NextPageButton:SetHighlightTexture("Interface\Buttons\UI-Common-MouseHilight")

		panel.currentPage = 1
		panel.maxPages = numPages
		local function SetPage(prev)
			panel.currentPage = panel.currentPage + (prev and - 1 or 1)
			pageText:SetFormattedText(COLLECTION_PAGE_NUMBER, panel.currentPage, panel.maxPages)

			for i = 1, numPages do
				panel[i]:Hide()
			end

			if panel.currentPage == 1 then
				PrevPageButton:Disable()
				NextPageButton:Enable()
				panel[1]:Show()
			elseif panel.currentPage == 2 then
				PrevPageButton:Enable()
				if numPages > 2 then
					NextPageButton:Enable()
				else
					NextPageButton:Disable()
				end
				panel[2]:Show()
			elseif panel.currentPage == 3 then
				PrevPageButton:Enable()
				if numPages > 3 then
					NextPageButton:Enable()
				else
					NextPageButton:Disable()
				end
				panel[3]:Show()
			elseif panel.currentPage == 4 then
				PrevPageButton:Enable()
				NextPageButton:Disable()
				panel[4]:Show()
			end
		end

		PrevPageButton:SetScript("OnClick", function()
			SetPage(true)
		end)

		NextPageButton:SetScript("OnClick", function()
			SetPage(false)
		end)

		tinsert(ns.NextPrevButtons, PrevPageButton)
		tinsert(ns.NextPrevButtons, NextPageButton)

		panel.PrevPageButton = PrevPageButton
		panel.NextPageButton = NextPageButton

		panel:SetScript("OnMouseWheel", function(_, delta)
			if delta < 0 then
				NextPageButton:Click()
			end
		end)

		panel_2:SetScript("OnMouseWheel", function(_, delta)
			if delta > 0 then
				PrevPageButton:Click()
			end
		end)

		if numPages > 2 then
			local name3 = name.."3"
			local tag3 = strlower(name3)
			local panel_3 = CreateOptionPanel(baseName..name3, text, subText)
			panel[3] = panel_3
			tinsert(panels, panel_3)

			tab.panel_3 = panel_3
			panel_3.tag = tag
			ViksUIOptionsPanel[tag3] = panel_3

			panel_2:SetScript("OnMouseWheel", function(_, delta)
				if delta > 0 then
					PrevPageButton:Click()
				elseif delta < 0 then
					NextPageButton:Click()
				end
			end)

			panel_3:SetScript("OnMouseWheel", function(_, delta)
				if delta > 0 then
					PrevPageButton:Click()
				end
			end)

			if numPages > 3 then
				local name4 = name.."4"
				local tag4 = strlower(name4)
				local panel_4 = CreateOptionPanel(baseName..name4, text, subText)
				panel[4] = panel_4
				tinsert(panels, panel_4)

				tab.panel_4 = panel_4
				panel_4.tag = tag
				ViksUIOptionsPanel[tag4] = panel_4

				panel_3:SetScript("OnMouseWheel", function(_, delta)
					if delta > 0 then
						PrevPageButton:Click()
					elseif delta < 0 then
						NextPageButton:Click()
					end
				end)

				panel_4:SetScript("OnMouseWheel", function(_, delta)
					if delta > 0 then
						PrevPageButton:Click()
					end
				end)
			end
		end
	end
end

ns.addSubCategory = function(category, name)
	local header = category:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	header:SetText(name)
	header:SetTextColor(179/255, 211/255, 243/255)

	local line = category:CreateTexture(nil, "ARTWORK")
	line:SetSize(500, 1)
	line:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -4)
	line:SetColorTexture(0.37, 0.3, 0.3, 1)

	return header, line
end

-- [[ Init ]]

local function displaySettings()
	for _, box in pairs(checkboxes) do
		box:SetChecked(C[box.group][box.option])
		if box.children then toggleChildren(box, box:GetChecked()) end
	end

	userChangedSlider = false

	for _, slider in pairs(sliders) do
		local value = C[slider.group][slider.option]
		if T.screenHeight > 1200 and (slider.group == "font" and slider.option ~= "nameplates_font_size") or slider.option == "pixel_font_size" then
			value = value / T.mult
		end
		slider:SetValue(value)
		slider.textInput:SetText(floor(value * 1000) / 1000)
		slider.textInput:SetCursorPosition(0)
		slider.oldValue = value
	end

	userChangedSlider = true

	for _, editbox in pairs(editboxes) do
		-- Handle both regular editboxes and tag boxes
		local value = C[editbox.group][editbox.option]
		if value then
			editbox:SetText(value)
			editbox:SetCursorPosition(0)
			editbox.oldValue = value
			
			-- If this is a tag box (has a parent container with displayBox), update the display
			local parent = editbox:GetParent()
			if parent and parent.displayBox then
				parent.displayBox:SetText(value)
			end
		end
	end

	for _, dropdown in pairs(dropdowns) do
		local text = DropDownText[C[dropdown.group][dropdown.option]] or C[dropdown.group][dropdown.option] or ""
		UIDropDownMenu_SetText(dropdown, text)
		dropdown.selectedValue = C[dropdown.group][dropdown.option]
		dropdown.oldValue = C[dropdown.group][dropdown.option]
	end
end

local init = CreateFrame("Frame")
init:RegisterEvent("PLAYER_LOGIN")
init:SetScript("OnEvent", function()
	if not ViksUI then return end

	T, C = unpack(ViksUI)

	local ViksUIOptionsPanel = ViksUIOptionsPanel

	StaticPopupDialogs.PERCHAR = {
		text = L_GUI_PER_CHAR,
		OnAccept = function()
			if ViksUIOptionsPanel.ProfileBox:GetChecked() then
				ViksUIOptionsGlobal[realm][name] = true
			else
				ViksUIOptionsGlobal[realm][name] = false
			end
			ReloadUI()
		end,
		OnCancel = function()
			if ViksUIOptionsPanel.ProfileBox:GetChecked() then
				ViksUIOptionsPanel.ProfileBox:SetChecked(false)
			else
				ViksUIOptionsPanel.ProfileBox:SetChecked(true)
			end
		end,
		button1 = ACCEPT,
		button2 = CANCEL,
		timeout = 0,
		whileDead = 1,
		preferredIndex = 5,
	}

	ViksUIOptionsPanel.ProfileBox:SetChecked(ViksUIOptionsGlobal[realm][name])
	ViksUIOptionsPanel.ProfileBox:SetScript("OnClick", function()
		StaticPopup_Show("PERCHAR")
	end)

	ViksUIOptionsPanel:SetTemplate("Transparent")

	local sunFrame = CreateFrame("Frame", nil, ViksUIOptionsPanel)
	sunFrame:SetPoint("TOPLEFT", 10, -41)
	sunFrame:SetSize(175, 690)
	sunFrame:CreateBackdrop("Overlay")
	sunFrame.backdrop:SetPoint("TOPLEFT", 0, 3)
	sunFrame.backdrop:SetPoint("BOTTOMRIGHT", -2, -4)
	ns.sunFrame = sunFrame

	T.SkinCheckBox(ViksUIOptionsPanel.ProfileBox)

	-- Load custom tags
	if ns.LoadCustomTags then
		ns.LoadCustomTags()
	end
	
	for _, panel in pairs(panels) do
		panel:CreateBackdrop("Overlay")
		panel.backdrop:SetPoint("TOPLEFT", -10, 2)
		panel.backdrop:SetPoint("BOTTOMRIGHT", -10, -5)
	end

	for _, button in pairs(ns.buttons) do
		button:SkinButton()
	end

	for _, button in pairs(ns.NextPrevButtons) do
		T.SkinNextPrevButton(button, nil, "Any")
	end

	for _, box in pairs(checkboxes) do
		T.SkinCheckBox(box)
	end

	for _, slider in pairs(sliders) do
		T.SkinSlider(slider)
		T.SkinEditBox(slider.textInput)
	end

	for _, picker in pairs(colourpickers) do
		local value = C[picker.group][picker.option]
		picker:SetTemplate("Transparent")
		picker:SetBackdropBorderColor(unpack(value))
		picker:SetBackdropColor(value[1], value[2], value[3], 0.3)
	end

	for _, editbox in pairs(editboxes) do
		-- Handle both regular editboxes and tag boxes
		if editbox:GetParent() and editbox:GetParent().displayBox then
			-- This is a tag box - skin it specially
			local container = editbox:GetParent()
			T.SkinEditBox(container.displayBox)
			container.editBtn:SkinButton()
		else
			-- Regular editbox
			T.SkinEditBox(editbox)
		end
	end

	for _, dropdown in pairs(dropdowns) do
		T.SkinDropDownBox(dropdown)
	end

	-- ========== SKIN CUSTOM TAG CREATOR AND LIBRARY FRAMES ==========
	if ns.tagPopupFramesToSkin then
		for _, item in ipairs(ns.tagPopupFramesToSkin) do
			if item and type(item) == "table" then
				-- Check if this is a {frame, isControl} pair
				if item[2] ~= nil then
					-- This is a {frame, isControl} pair
					local frame = item[1]
					if frame then
						pcall(function()
							local frameType = frame:GetObjectType()
							if item[2] == true and frameType == "Button" then
								frame:SkinButton()
							elseif item[2] == false and frameType == "EditBox" then
								T.SkinEditBox(frame)
							end
							if frameType == "ScrollFrame" then
								if frame.ScrollBar then
									T.SkinScrollBar(frame.ScrollBar)
								end
							elseif frameType == "Frame" and frame.SetTemplate then
								frame:CreateBackdrop("Overlay")
								frame.backdrop:SetOutside(frame)
							end
						end)
					end
				else
					-- item itself is a bare frame (popup or scrollframe)
					pcall(function()
						local frameType = item:GetObjectType()
						if frameType == "ScrollFrame" then
							-- Skin the scrollbar
							if item.ScrollBar then
								item.ScrollBar:SkinScrollBar()
							end
						elseif frameType == "Frame" and item.SetTemplate then
							-- This is a popup frame
							item:CreateBackdrop("Overlay")
							item.backdrop:SetOutside(item)
						end
					end)
				end
			end
		end
	end

	local title = ViksUIOptionsPanel:CreateFontString("UIConfigTitleVer", "OVERLAY", "GameFontNormal")
	title:SetPoint("TOP", 0, -10)
	title:SetText("ViksUI "..T.version)

	setActiveTab(ViksUIOptionsPanel.general.tab)

	displaySettings()
	
	ViksUIOptionsPanel:EnableMouse(true)
	ViksUIOptionsPanel:SetMovable(true)

	ViksUIOptionsPanel:SetScript("OnMouseDown", function(self, button)
	  if button == "LeftButton" and not self.isMoving then
	   self:StartMoving()
	   self.isMoving = true
	  end
	end)

	ViksUIOptionsPanel:SetScript("OnMouseUp", function(self, button)
	  if button == "LeftButton" and self.isMoving then
	   self:StopMovingOrSizing()
	   self.isMoving = false
	  end
	end)
end)