local T, C, L, _ = unpack(select(2, ...))

if C.misc.GameMenuBar ~= true then return end
local Panels = CreateFrame("Frame")
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local spacing = 1
local size = 24
local numbuttons = 21
local CreateBtn = T.CreateBtn
--local Movers = T["Movers"]
local thickness = thickness 
local buttonsize = buttonsize
local GameMenuDataTextEnable = true
local AltGameMenuEnable = true

------------------------------------------------------------------------------------------
-- GAME MENU BAR
------------------------------------------------------------------------------------------
local function Enable()
	thickness = 1

	-- GAME MENU
	local GameMenuBG = CreateFrame("Frame", "GameMenuBG", UIParent)
	GameMenuBG:SetTemplate()
	GameMenuBG:CreateShadow()
	GameMenuBG:SetHeight(size + spacing*2)
	GameMenuBG:SetWidth(size*numbuttons + spacing*(numbuttons+1) )
	GameMenuBG:Point("BOTTOM", UIParent, "BOTTOM", 0, 3)
	GameMenuBG:SetFrameLevel(1)
	GameMenuBG:SetFrameStrata("TOOLTIP")
	GameMenuBG:Hide()

	--Button 1 - Character Info
	T.CreateBtn("GameMenuButton01", GameMenuBG, size, size, "Character Info", "", GameMenuBG)
	GameMenuButton01:Point("TOPLEFT", GameMenuBG, "TOPLEFT", spacing, -spacing)
	GameMenuButton01.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\char.tga]])
	GameMenuButton01:SetScript("OnMouseDown", function(self)
		ToggleCharacter("PaperDollFrame")
	end)

	--Button 2 - Spellbook
	T.CreateBtn("GameMenuButton02", GameMenuBG, size, size, "Spellbook & Abililties", "", GameMenuBG)
	GameMenuButton02:Point("LEFT", GameMenuButton01, "RIGHT", spacing, 0)
	GameMenuButton02.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\spell.tga]])
	GameMenuButton02:SetScript("OnMouseDown", function(self)
		ToggleFrame(SpellBookFrame)
	end)

	--Button 3 - Talent
	T.CreateBtn("GameMenuButton03", GameMenuBG, size, size, "Specialization & Talents", "", GameMenuBG)
	GameMenuButton03:Point("LEFT", GameMenuButton02, "RIGHT", spacing, 0)
	GameMenuButton03:SetAttribute("macrotext1", "/qs")
	GameMenuButton03.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\talent.tga]])
	GameMenuButton03:SetScript("OnMouseDown", function(self)
		if (not PlayerTalentFrame) then
		TalentFrame_LoadUI()
		end
		ShowUIPanel(PlayerTalentFrame)
	end)

	--Button 4 - Achievements
	T.CreateBtn("GameMenuButton04", GameMenuBG, size, size, "Achievements", "", GameMenuBG)
	GameMenuButton04:Point("LEFT", GameMenuButton03, "RIGHT", spacing, 0)
	GameMenuButton04.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\ach.tga]])
	GameMenuButton04:SetScript("OnMouseDown", function(self)
		ToggleAchievementFrame()
	end)

	--Button 5 - Mounts
	T.CreateBtn("GameMenuButton05", GameMenuBG, size, size, "Collection Journal: Mounts", "", GameMenuBG)
	GameMenuButton05:Point("LEFT", GameMenuButton04, "RIGHT", spacing, 0)
	GameMenuButton05.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\pet.tga]])
	GameMenuButton05:SetScript("OnMouseDown", function(self)
		ToggleCollectionsJournal(1)
	end)

	--Button 6 - Pets
	T.CreateBtn("GameMenuButton06", GameMenuBG, size, size, "Collection Journal: Pets", "", GameMenuBG)
	GameMenuButton06:Point("LEFT", GameMenuButton05, "RIGHT", spacing, 0)
	GameMenuButton06.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\pet.tga]])
	GameMenuButton06:SetScript("OnMouseDown", function(self)
		ToggleCollectionsJournal(2)
	end)

	--Button 7 - Toy Box
	T.CreateBtn("GameMenuButton07", GameMenuBG, size, size, "Collection Journal: Toy Box", "", GameMenuBG)
	GameMenuButton07:Point("LEFT", GameMenuButton06, "RIGHT", spacing, 0)
	GameMenuButton07.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\pet.tga]])
	GameMenuButton07:SetScript("OnMouseDown", function(self)
		ToggleCollectionsJournal(3)
	end)

	--Button 8 - Heirlooms
	T.CreateBtn("GameMenuButton08", GameMenuBG, size, size, "Collection Journal: Heirlooms", "", GameMenuBG)
	GameMenuButton08:Point("LEFT", GameMenuButton07, "RIGHT", spacing, 0)
	GameMenuButton08.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\pet.tga]])
	GameMenuButton08:SetScript("OnMouseDown", function(self)
		ToggleCollectionsJournal(4)
	end)

	--Button 9 - Dressing room
	T.CreateBtn("GameMenuButton09", GameMenuBG, size, size, "Collection Journal: Transmogrification", "", GameMenuBG)
	GameMenuButton09:Point("LEFT", GameMenuButton08, "RIGHT", spacing, 0)
	GameMenuButton09.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\pet.tga]])
	GameMenuButton09:SetScript("OnMouseDown", function(self)
		ToggleCollectionsJournal(5)
	end)

	--Button 10 - Social
	T.CreateBtn("GameMenuButton10", GameMenuBG, size, size, "Social", "", GameMenuBG)
	GameMenuButton10:Point("LEFT", GameMenuButton09, "RIGHT", spacing, 0)
	GameMenuButton10.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\social.tga]])
	GameMenuButton10:SetScript("OnMouseDown", function(self)
		ToggleFriendsFrame(1)
	end)

	--Button 11 - PVE LF group tool
	T.CreateBtn("GameMenuButton11", GameMenuBG, size, size, "PVE LF Tool", "", GameMenuBG)
	GameMenuButton11:Point("LEFT", GameMenuButton10, "RIGHT", spacing, 0)
	GameMenuButton11.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\pvp.tga]])
	GameMenuButton11:SetScript("OnMouseDown", function(self)
		PVEFrame_ToggleFrame()
	end)

	--Button 12 - PVP LF tool
	T.CreateBtn("GameMenuButton12", GameMenuBG, size, size, "PVP LF Tool", "", GameMenuBG)
	GameMenuButton12:Point("LEFT", GameMenuButton11, "RIGHT", spacing, 0)
	GameMenuButton12.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\pvp.tga]])
	GameMenuButton12:SetScript("OnMouseDown", function(self)
		--PVPFrame_ToggleFrame()
	end)

	--Button 13 - Guild
	T.CreateBtn("GameMenuButton13", GameMenuBG, size, size, "Guild", "", GameMenuBG)
	GameMenuButton13:Point("LEFT", GameMenuButton12, "RIGHT", spacing, 0)
	GameMenuButton13.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\guild.tga]])
	GameMenuButton13:SetScript("OnMouseDown", function(self)
		if IsInGuild() then
			if (not GuildFrame) then
			GuildFrame_LoadUI()
			end
			GuildFrame_Toggle()
		else
			if (not LookingForGuildFrame) then
			LookingForGuildFrame_LoadUI()
			end
			LookingForGuildFrame_Toggle()
		end
	end)

	--Button 14 - Raid
	T.CreateBtn("GameMenuButton14", GameMenuBG, size, size, "Raid", "", GameMenuBG)
	GameMenuButton14:Point("LEFT", GameMenuButton13, "RIGHT", spacing, 0)
	GameMenuButton14.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\social.tga]])
	GameMenuButton14:SetScript("OnMouseDown", function(self)
		ToggleFriendsFrame(4)
	end)

	--Button 15 - Customer Support
	T.CreateBtn("GameMenuButton15", GameMenuBG, size, size, "Customer Support", "", GameMenuBG)
	GameMenuButton15:Point("LEFT", GameMenuButton14, "RIGHT", spacing, 0)
	GameMenuButton15.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\help.tga]])
	GameMenuButton15:SetScript("OnMouseDown", function(self)
		ToggleHelpFrame()
	end)

	--Button 16 - Event Calendar
	T.CreateBtn("GameMenuButton16", GameMenuBG, size, size, "Event Calendar", "", GameMenuBG)
	GameMenuButton16:Point("LEFT", GameMenuButton15, "RIGHT", spacing, 0)
	GameMenuButton16.icon:SetTexture([[Interface\AddOns\ViksUI\media\menuicons\calendar.tga]])
	GameMenuButton16:SetScript("OnMouseDown", function(self)
		if (not CalendarFrame) then
		LoadAddOn("Blizzard_Calendar")
		end
		Calendar_Toggle()
	end)

	--Button 17 - Dungeon Journal
	T.CreateBtn("GameMenuButton17", GameMenuBG, size, size, "Dungeon Journal", "", GameMenuBG)
	GameMenuButton17:Point("LEFT", GameMenuButton16, "RIGHT", spacing, 0)
	GameMenuButton17.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\journal.tga]])
	GameMenuButton17:SetScript("OnMouseDown", function(self)
		ToggleEncounterJournal()
	end)

	--Button 18 - Garrison Report
	T.CreateBtn("GameMenuButton18", GameMenuBG, size, size, "Garrison Report", "", GameMenuBG)
	GameMenuButton18:Point("LEFT", GameMenuButton17, "RIGHT", spacing, 0)
	GameMenuButton18.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\garrison.tga]])
	GameMenuButton18.icon:Size(size-10, size-10)
	GameMenuButton18:SetScript("OnMouseDown", function(self)
		GarrisonLandingPageMinimapButton_OnClick()
	end)

	--Button 19 - Compose a Tweet
	T.CreateBtn("GameMenuButton19", GameMenuBG, size, size, "Compose a Tweet", "", GameMenuBG)
	GameMenuButton19:Point("LEFT", GameMenuButton18, "RIGHT", spacing, 0)
	GameMenuButton19.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\chat.tga]])
	GameMenuButton19:SetScript("OnMouseDown", function(self)
			if not SocialPostFrame then
			LoadAddOn("Blizzard_SocialUI")
			end
			local IsTwitterEnabled = C_Social.IsSocialEnabled()
			if IsTwitterEnabled then
			Social_SetShown(true)
			else
			T.Print(SOCIAL_TWITTER_TWEET_NOT_LINKED)
			end
	end)

	--Button 20 - ViksUI config
	T.CreateBtn("GameMenuButton20", GameMenuBG, size, size, "ViksUI Config", "", GameMenuBG)
	GameMenuButton20:Point("LEFT", GameMenuButton19, "RIGHT", spacing, 0)
	GameMenuButton20.icon:SetTexture([[Interface\AddOns\ViksUI\media\menuicons\config.tga]])
	--GameMenuButton20.icon:Size(size-10, size-10)
	GameMenuButton20:SetAttribute("macrotext1", "/config")

	--Button 21 - Hide Game Menu
	T.CreateBtn("GameMenuButton21", GameMenuBG, size, size, "Close Game Menu", "", GameMenuBG)
	GameMenuButton21:Point("LEFT", GameMenuButton20, "RIGHT", spacing, 0)
	GameMenuButton21:SetAttribute("macrotext1", "/")
	GameMenuButton21.icon:SetTexture([[Interface\AddOns\ViksUI\media\microbar\menu.tga]])
	GameMenuButton21:SetScript("OnMouseDown", function(self)
	GameMenuBG:Hide()
	end)
	
	RegisterStateDriver(GameMenuBG, "visibility", "[combat] hide; nil")
end
Enable()

------------------------------------------------------------------------------------------
-- GAME MENU DATATEXT
------------------------------------------------------------------------------------------
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

local Update = function(self)
	self.Text:SetText("Game Menu")
	
	self:SetScript("OnEnter", function(self)
	self.Text:SetTextColor(class.r, class.g, class.b)
	end)
	
	self:SetScript("OnLeave", function(self)
	self.Text:SetTextColor(1, 1, 1)
	end)
	
end

local Enable = function(self)
	self:SetScript("OnMouseUp", function()
		GameMenuBG:Show()
	end)
	
	self:Update()
end

local Disable = function(self)
	self:SetScript("OnMouseUp", nil)
end

------------------------------------------------------------------------------------------
-- GAME MENU DATATEXT REPLACEMENT
------------------------------------------------------------------------------------------
local function Enable()

	--if C["DataTexts"]["GameMenu"] == true then
		local BottomLineAlt = CreateFrame("Frame", "BottomLineAlt", UIParent)
		BottomLineAlt:ClearAllPoints()
		BottomLineAlt:SetTemplate()
		BottomLineAlt:Point("BOTTOM", UIParent, "BOTTOM", 0, 10)
		BottomLineAlt:Size(300, thickness)
		BottomLineAlt:SetFrameLevel(2)
		BottomLineAlt:SetFrameStrata("BACKGROUND")
		BottomLineAlt:SetAlpha(1)
		BottomLineAlt:Hide()
		
		CreateBtn("GameMenuButton", BottomLineAlt, 280, 20, "Open the Game Menu Bar", "Game Menu", BottomLineAlt)
		GameMenuButton:Point("CENTER", BottomLineAlt, "CENTER", 0, 0)
		GameMenuButton:SetAlpha(0)
			
		local GameMenuText = BottomLineAlt:CreateFontString(nil, "OVERLAY")
		GameMenuText:SetTextColor(class.r, class.g, class.b)
		GameMenuText:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
		GameMenuText:Point("CENTER", BottomLineAlt, "CENTER", 0, 0)
		GameMenuText:SetText("Game Menu")

		GameMenuButton:SetScript("OnEnter", function(self)
			GameMenuText:SetTextColor(unpack(C.media.pxcolor1))
			
		end)
		
		GameMenuButton:SetScript("OnLeave", function(self)
			GameMenuText:SetTextColor(class.r, class.g, class.b)
		end)
		
		GameMenuButton:SetScript("OnMouseDown", function(self)
			GameMenuBG:Show()
		end)
		BottomLineAlt:Show()
end
Enable()