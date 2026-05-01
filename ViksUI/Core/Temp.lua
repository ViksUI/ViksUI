local T, C, L = unpack(ViksUI)
if not IsVik then return end
----------------------------------------------------------------------------------------
--	Talent Loadout Notes
----------------------------------------------------------------------------------------

local FRAME_NAME = "ViksUITalentNote"
local MAX_WORDS = 60
local MAX_LINES = 4

local noteFrame = nil
local editFrame = nil
local currentLoadoutID = nil
local isEditing = false

-- Initialize database
local function InitDB()
	if not ViksUIStats.talentNotes then
		ViksUIStats.talentNotes = {}
	end
	if not ViksUIStats.talentNotesPositions then
		ViksUIStats.talentNotesPositions = {}
	end
	if ViksUIStats.talentNotesLocked == nil then
		ViksUIStats.talentNotesLocked = false
	end
end

-- Save frame position to database for current loadout
local function SaveFramePosition()
	if not noteFrame or not currentLoadoutID then return end
	local x, y = noteFrame:GetCenter()
	if x and y then
		if not ViksUIStats.talentNotesPositions then
			ViksUIStats.talentNotesPositions = {}
		end
		ViksUIStats.talentNotesPositions[currentLoadoutID] = {
			x = x,
			y = y,
		}
	end
end

-- Restore frame position from database for current loadout
local function RestoreFramePosition()
	if not noteFrame or not currentLoadoutID then return end
	local db = ViksUIStats.talentNotesPositions
	if db and db[currentLoadoutID] and db[currentLoadoutID].x and db[currentLoadoutID].y then
		noteFrame:ClearAllPoints()
		noteFrame:SetPoint("CENTER", UIParent, "CENTER", db[currentLoadoutID].x - GetScreenWidth() / 2, db[currentLoadoutID].y - GetScreenHeight() / 2)
	end
end

-- Get current talent loadout ID using a more reliable method
local function GetCurrentLoadoutID()
	-- Try multiple methods to get the loadout ID
	if C_ClassTalents and C_ClassTalents.GetActiveConfigID then
		local configID = C_ClassTalents.GetActiveConfigID()
		if configID and configID > 0 then
			return configID
		end
	end
	
	if C_Traits and C_Traits.GetConfigID then
		local configID = C_Traits.GetConfigID()
		if configID and configID > 0 then
			return configID
		end
	end
	
	-- Fallback: use character name + realm as unique ID
	return UnitName("player") .. "-" .. T.realm
end

-- Validate note text (limit to MAX_WORDS words and MAX_LINES lines)
local function ValidateNote(text)
	if not text or text == "" then
		return ""
	end
	
	-- Simply trim excess lines and words without re-concatenating
	local lines = {}
	local currentPos = 1
	
	while currentPos <= #text and #lines < MAX_LINES do
		local nextNewline = string.find(text, "\n", currentPos, true)
		if not nextNewline then
			table.insert(lines, string.sub(text, currentPos))
			break
		else
			table.insert(lines, string.sub(text, currentPos, nextNewline - 1))
			currentPos = nextNewline + 1
		end
	end
	
	local validatedText = table.concat(lines, "\n")
	
	-- Count words
	local wordCount = 0
	for _ in validatedText:gmatch("%S+") do
		wordCount = wordCount + 1
	end
	
	-- If too many words, truncate
	if wordCount > MAX_WORDS then
		local words = {}
		for word in validatedText:gmatch("%S+") do
			table.insert(words, word)
			if #words >= MAX_WORDS then
				break
			end
		end
		validatedText = table.concat(words, " ")
	end
	
	return validatedText
end

-- Resize frame to fit content
local function ResizeFrameToContent()
	if isEditing then return end  -- Don't resize while editing
	if not noteFrame or not noteFrame.text then return end
	
	local text = noteFrame.text:GetText() or ""
	if text == "" then
		noteFrame:SetWidth(200)
		noteFrame:SetHeight(50)
		return
	end
	
	-- Get the width and height needed for the text
	noteFrame.text:SetWidth(0) -- Reset to get natural width
	local textWidth = noteFrame.text:GetStringWidth()
	local textHeight = noteFrame.text:GetStringHeight()
	
	-- Add padding
	local padding = 16
	local minWidth = 100
	local maxWidth = 400
	local minHeight = 40
	local maxHeight = 150
	
	local finalWidth = math.max(minWidth, math.min(maxWidth, textWidth + padding))
	local finalHeight = math.max(minHeight, math.min(maxHeight, textHeight + padding))
	
	noteFrame:SetWidth(finalWidth)
	noteFrame:SetHeight(finalHeight)
	
	-- Restore text width to fill the frame
	noteFrame.text:SetWidth(finalWidth - padding)
end

-- Update note text based on current loadout
local function UpdateNoteDisplay()
	if not noteFrame then return end

	currentLoadoutID = GetCurrentLoadoutID()
	if not currentLoadoutID then
		noteFrame.text:SetText("Unable to determine talent loadout")
		ResizeFrameToContent()
		return
	end

	local noteText = ViksUIStats.talentNotes[currentLoadoutID] or ""

	if noteText == "" then
		noteFrame.text:SetText("No note for this talent build\n\n(Shift+Drag to move)\n(Right-Click to edit)\n(Middle-Click to lock)")
		noteFrame.text:SetTextColor(0.7, 0.7, 0.7, 0.8) -- Muted text for placeholder
	else
		noteFrame.text:SetText(noteText)
		noteFrame.text:SetTextColor(1, 1, 1, 1) -- White text for actual notes
	end
	
	RestoreFramePosition()
	ResizeFrameToContent()
	
	-- Set initial visibility based on locked state
	if ViksUIStats.talentNotesLocked then
		noteFrame:SetAlpha(1)
	else
		noteFrame:SetAlpha(0)
	end
end

-- Open note editor
local function OpenNoteEditor()
	if InCombatLockdown() then
		print("|cffffff00Talent Note: Cannot edit while in combat|r")
		return
	end
	
	if not editFrame then
		CreateNoteEditFrame()
	end
	
	isEditing = true
	currentLoadoutID = GetCurrentLoadoutID()
	editFrame:Show()
	editFrame.editBox:SetText(ViksUIStats.talentNotes[currentLoadoutID] or "")
	editFrame.editBox:SetFocus()
end

-- Create the note editor frame
local function CreateNoteEditFrame()
	if editFrame then return end

	editFrame = CreateFrame("Frame", "ViksUITalentNoteEditor", UIParent, "BackdropTemplate")
	editFrame:SetSize(400, 300)
	editFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	editFrame:SetFrameStrata("DIALOG")
	editFrame:SetMovable(true)
	editFrame:EnableMouse(true)

	-- Use ViksUI styling
	editFrame:StripTextures()
	editFrame:CreateBackdrop("Transparent")

	-- Title
	local titleText = editFrame:CreateFontString(nil, "OVERLAY")
	titleText:SetFont(C.media.normal_font, 14, "OUTLINE")
	titleText:SetTextColor(1, 0.82, 0, 1)
	titleText:SetText("Edit Talent Build Note (Max " .. MAX_WORDS .. " words, " .. MAX_LINES .. " lines)")
	titleText:SetPoint("TOPLEFT", editFrame, "TOPLEFT", 10, -10)

	-- Edit box
	editFrame.editBox = CreateFrame("EditBox", nil, editFrame, "BackdropTemplate")
	editFrame.editBox:SetMultiLine(true)
	editFrame.editBox:SetMaxLetters(500)
	editFrame.editBox:SetFont(C.media.normal_font, 11, "OUTLINE")
	editFrame.editBox:SetTextColor(1, 1, 1, 1)
	editFrame.editBox:SetSize(380, 200)
	editFrame.editBox:SetPoint("TOPLEFT", editFrame, "TOPLEFT", 10, -40)
	editFrame.editBox:EnableMouse(true)
	editFrame.editBox:CreateBackdrop("Default")
	editFrame.editBox.backdrop:SetInside(editFrame.editBox, 2, 2)
	editFrame.editBox:SetAltArrowKeyMode(false)

	-- Save button
	editFrame.saveButton = CreateFrame("Button", nil, editFrame, "SecureActionButtonTemplate")
	editFrame.saveButton:SetSize(80, 25)
	editFrame.saveButton:SetPoint("BOTTOMLEFT", editFrame, "BOTTOMLEFT", 10, 10)
	editFrame.saveButton:SetTemplate("Default")
	editFrame.saveButton:SkinButton()

	local saveText = editFrame.saveButton:CreateFontString(nil, "OVERLAY")
	saveText:SetFont(C.media.normal_font, 11, "OUTLINE")
	saveText:SetTextColor(1, 1, 1, 1)
	saveText:SetText("Save")
	saveText:SetAllPoints()
	saveText:SetJustifyH("CENTER")
	saveText:SetJustifyV("MIDDLE")

	editFrame.saveButton:SetScript("OnClick", function()
		if currentLoadoutID then
			local rawText = editFrame.editBox:GetText()
			local noteText = ValidateNote(rawText)
			ViksUIStats.talentNotes[currentLoadoutID] = noteText
			isEditing = false
			UpdateNoteDisplay()
			editFrame:Hide()
			print("|cffffff00Talent Note: Saved successfully|r")
		else
			print("|cffffff00Talent Note: Error - Unable to determine loadout|r")
		end
	end)

	-- Close button
	editFrame.closeButton = CreateFrame("Button", nil, editFrame, "SecureActionButtonTemplate")
	editFrame.closeButton:SetSize(80, 25)
	editFrame.closeButton:SetPoint("BOTTOMRIGHT", editFrame, "BOTTOMRIGHT", -10, 10)
	editFrame.closeButton:SetTemplate("Default")
	editFrame.closeButton:SkinButton()

	local closeText = editFrame.closeButton:CreateFontString(nil, "OVERLAY")
	closeText:SetFont(C.media.normal_font, 11, "OUTLINE")
	closeText:SetTextColor(1, 1, 1, 1)
	closeText:SetText("Close")
	closeText:SetAllPoints()
	closeText:SetJustifyH("CENTER")
	closeText:SetJustifyV("MIDDLE")

	editFrame.closeButton:SetScript("OnClick", function()
		isEditing = false
		editFrame:Hide()
	end)

	-- Make draggable
	editFrame:RegisterForDrag("LeftButton")
	editFrame:SetScript("OnDragStart", function(self)
		self:StartMoving()
	end)
	editFrame:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
	end)

	-- Disable game input while editing
	editFrame:SetScript("OnShow", function(self)
		self.editBox:SetFocus()
	end)

	editFrame:Hide()
end

-- Create the main note display frame
local function CreateNoteFrame()
	if noteFrame then return end

	noteFrame = CreateFrame("Frame", FRAME_NAME, UIParent)
	noteFrame:SetSize(150, 50)
	noteFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	noteFrame:SetFrameStrata("MEDIUM")
	noteFrame:SetMovable(true)
	noteFrame:SetClampedToScreen(true)
	noteFrame:EnableMouse(true)
	noteFrame:SetAlpha(0) -- Start hidden

	-- Use ViksUI styling
	noteFrame:SetTemplate("Transparent")

	-- Create text display
	noteFrame.text = noteFrame:CreateFontString(nil, "OVERLAY")
	noteFrame.text:SetFont(C.media.normal_font, 12, "OUTLINE")
	noteFrame.text:SetTextColor(1, 1, 1, 1) -- White text
	noteFrame.text:SetPoint("TOPLEFT", noteFrame, "TOPLEFT", 8, -8)
	noteFrame.text:SetPoint("BOTTOMRIGHT", noteFrame, "BOTTOMRIGHT", -8, 8)
	noteFrame.text:SetWordWrap(true)
	noteFrame.text:SetJustifyH("LEFT")
	noteFrame.text:SetJustifyV("TOP")
	noteFrame.text:SetSpacing(0) -- Set line spacing to 0
	noteFrame.text:SetText("No note for this talent build")

	-- Make frame draggable with shift+click
	noteFrame:RegisterForDrag("LeftButton", "RightButton")
	noteFrame:SetScript("OnDragStart", function(self)
		if IsShiftKeyDown() then
			self:StartMoving()
		end
	end)
	noteFrame:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
		SaveFramePosition()
	end)

	-- Show on mouse over
	noteFrame:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)

	-- Hide on mouse leave (unless locked)
	noteFrame:SetScript("OnLeave", function(self)
		if not ViksUIStats.talentNotesLocked then
			self:SetAlpha(0)
		end
	end)

	-- Handle mouse button clicks
	noteFrame:SetScript("OnMouseUp", function(self, button)
		if button == "RightButton" then
			OpenNoteEditor()
		elseif button == "MiddleButton" then
			-- Toggle lock state
			if ViksUIStats.talentNotesLocked then
				ViksUIStats.talentNotesLocked = false
				self:SetAlpha(0)
				-- print("|cffffff00Talent Note: Unlocked (show on hover)|r")
			else
				ViksUIStats.talentNotesLocked = true
				self:SetAlpha(1)
				-- print("|cffffff00Talent Note: Locked (always show)|r")
			end
		end
	end)

	return noteFrame
end

-- Main initialization
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
frame:RegisterEvent("TRAIT_CONFIG_UPDATED")
frame:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
		InitDB()
		CreateNoteFrame()
		CreateNoteEditFrame()
		UpdateNoteDisplay()
	else
		-- Update display on any talent/spec change
		if not isEditing then
			UpdateNoteDisplay()
		end
	end
end)

-- Slash command
SLASH_TALENTLOADOUTNOTE1 = "/tnote"
SlashCmdList["TALENTLOADOUTNOTE"] = function(msg)
	if msg == "edit" or msg == "" then
		OpenNoteEditor()
	elseif msg == "hide" then
		if noteFrame then noteFrame:SetAlpha(0) end
	elseif msg == "show" then
		if noteFrame then noteFrame:SetAlpha(1) end
	else
		print("Talent Loadout Notes commands:")
		print("/tnote edit - Open note editor")
		print("/tnote show - Show note frame")
		print("/tnote hide - Hide note frame")
	end
end

-- Function to check if the player is in a dungeon or scenario
local function DisableChatBubblesInDelvesOrScenarios()
    local zoneName = GetZoneText()
    
    -- Check if the player is in a dungeon or scenario
    if string.match(zoneName, "Scenario") or string.match(zoneName, "Dungeon") then
        -- Disable chat bubbles
        SetCVar("chatBubbles", 0)
    else
        -- Enable chat bubbles if outside dungeons/scenarios
        SetCVar("chatBubbles", 1)
    end
end

-- Call the function to check the zone and adjust chat bubbles
DisableChatBubblesInDelvesOrScenarios()

-- Optionally, you can create a small event listener to check when the zone changes
local frame = CreateFrame("Frame")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:SetScript("OnEvent", DisableChatBubblesInDelvesOrScenarios)