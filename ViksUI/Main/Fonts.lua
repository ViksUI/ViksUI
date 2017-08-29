local T, C, L, _ = unpack(select(2, ...))
do
	SetFontString = function(parent, fontName, fontHeight, fontStyle)
		local fs = parent:CreateFontString(nil, "OVERLAY")
		fs:SetFont(C.media.normal_font, fontHeight, fontStyle)
		fs:SetJustifyH("LEFT")
		fs:SetShadowColor(0, 0, 0)
		fs:SetShadowOffset(1.25, -1.25)
		return fs
	end
end	

---------------------
-- Font
---------------------
local Fonts = CreateFrame("Frame", nil, UIParent)
SetFont = function(obj, font, size, style, r, g, b, sr, sg, sb, sox, soy)
	obj:SetFont(font, size, style)
	if sr and sg and sb then obj:SetShadowColor(sr, sg, sb) end
	if sox and soy then obj:SetShadowOffset(sox, soy) end
	if r and g and b then obj:SetTextColor(r, g, b)
	elseif r then obj:SetAlpha(r) end
end
Fonts:RegisterEvent("ADDON_LOADED")
Fonts:SetScript("OnEvent", function(self, event, addon)
	
	local NORMAL     =  C.media.normal_font
	local COMBAT     =  C.media.fontcombat
	local NUMBER     =  C.media.normal_font
	local _, editBoxFontSize, _, _, _, _, _, _, _, _ = GetChatWindowInfo(1)
	
	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12
	CHAT_FONT_HEIGHTS = {12, 13, 14, 15, 16, 17, 18, 19, 20}
	
	UNIT_NAME_FONT     = NORMAL
	NAMEPLATE_FONT     = NORMAL
	DAMAGE_TEXT_FONT   = COMBAT
	STANDARD_TEXT_FONT = NORMAL
	
	SetFont(GameTooltipHeader,                  NORMAL, C.media.fontsize)
	SetFont(NumberFont_OutlineThick_Mono_Small, NUMBER, C.media.fontsize, "OUTLINE")
	SetFont(NumberFont_Outline_Huge,            NUMBER, 28, "THICKOUTLINE", 28)
	SetFont(NumberFont_Outline_Large,           NUMBER, 15, "OUTLINE")
	SetFont(NumberFont_Outline_Med,             NUMBER, C.media.fontsize*1.1, "OUTLINE")
	SetFont(NumberFont_Shadow_Med,              NORMAL, C.media.fontsize+1) --chat editbox uses this
	SetFont(NumberFont_Shadow_Small,            NORMAL, C.media.fontsize)
	SetFont(QuestFont,                          NORMAL, C.media.fontsize)
	SetFont(QuestFont_Large,                    NORMAL, 14)
	SetFont(SystemFont_Large,                   NORMAL, 15)
	SetFont(SystemFont_Shadow_Huge1,			NORMAL, 20, "THINOUTLINE") -- Raid Warning, Boss emote frame too
	SetFont(SystemFont_Med1,                    NORMAL, C.media.fontsize)
	SetFont(SystemFont_Med3,                    NORMAL, C.media.fontsize*1.1)
	SetFont(SystemFont_OutlineThick_Huge2,      NORMAL, 20, "THICKOUTLINE")
	SetFont(SystemFont_Outline_Small,           NUMBER, C.media.fontsize, "OUTLINE")
	SetFont(SystemFont_Shadow_Large,            NORMAL, 15)
	SetFont(SystemFont_Shadow_Med1,             NORMAL, C.media.fontsize)
	SetFont(SystemFont_Shadow_Med3,             NORMAL, C.media.fontsize*1.1)
	SetFont(SystemFont_Shadow_Outline_Huge2,    NORMAL, 20, "OUTLINE")
	SetFont(SystemFont_Shadow_Small,            NORMAL, C.media.fontsize*0.9)
	SetFont(SystemFont_Small,                   NORMAL, C.media.fontsize)
	SetFont(SystemFont_Tiny,                    NORMAL, C.media.fontsize)
	SetFont(Tooltip_Med,                        NORMAL, C.media.fontsize)
	SetFont(Tooltip_Small,                      NORMAL, C.media.fontsize)
	SetFont(ZoneTextString,						NORMAL, 32, "OUTLINE")
	SetFont(SubZoneTextString,					NORMAL, 25, "OUTLINE")
	SetFont(PVPInfoTextString,					NORMAL, 22, "THINOUTLINE")
	SetFont(PVPArenaTextString,					NORMAL, 22, "THINOUTLINE")
	SetFont(CombatTextFont,                     COMBAT, 100,"THINOUTLINE") -- number here just increase the font quality.
	SetFont(InvoiceFont_Med, 					NORMAL, 13)
	SetFont(InvoiceFont_Small,					NORMAL, 10)
	SetFont(MailFont_Large, 					NORMAL, 15)
	SetFont(QuestFont_Shadow_Huge, 				NORMAL, 19)
	SetFont(QuestFont_Shadow_Small, 			NORMAL, 15)
	SetFont(ReputationDetailFont, 				NORMAL, 10)
	SetFont(SpellFont_Small, 					NORMAL, 10)
	SetFont(FriendsFont_Small, 					NORMAL, C.media.fontsize)
	SetFont(FriendsFont_Normal, 				NORMAL, C.media.fontsize)
	SetFont(FriendsFont_Large, 					NORMAL, C.media.fontsize)
	SetFont(FriendsFont_UserText, 				NORMAL, C.media.fontsize)
	SetFont(ChatBubbleFont, 					NORMAL, C.media.fontsize)
	
	SetFont = nil
	self:SetScript("OnEvent", nil)
	self:UnregisterAllEvents()
	self = nil
end)


---------- And configurate everything ----------------------------------------------------------------------

--- true = yes 
--- false = no
local font = C.media.fontcombat                           --- The font you want to have.
local fFlags = "" 
local ZoneText = true                                             --- Should the ZoneText have another font?
local CombatText = true                                         --- Should the DamageText have another font?
 
local CustomColors = true                   --ONLY ZONETEXT!                    --- Want some custom colors?
local CustomText = false                    --ONLY ZONETEXT!                      --- Want some custom text?

--- Default: pvp: 20; Zone: 100; SubZone: 30  
--- Fontsize has to be between 0 and 100
local pvpFontSize = {20}                                                                     -- pvp Fontsize
local ZoneFontSize = {40}                                                                  -- Zone Fontsize
local SubZoneFontSize = {18}                                                             -- SubZone Fontsize

local SColor = {0, 255, 255}                                                      --- Sanctuary custom color
local AColor = {255, 0, 0}														      --- Arena custom color
local FColor = {0, 255, 0}														   --- Friendly custom color
local HColor = {255, 0, 0}															--- Hostile custom color
local CColor = {255, 255, 0}												      --- Contested custom color

local SText = 'Safe Zone!'                                                         --- Sanctuary custom text
local AText = 'Arena!'									    	                	   --- Arena custom text
local FText = 'Friends inc!'                                     		    	    --- Friendly custom text
local HText = 'Enemies inc!'			                                             --- Hostile custom text
local CText = 'Letz fight!'         									           --- Contested custom text

-- Default: 24
local CTFontSize = {25}                                                               -- Combattext Fontsize

------------------------------------------------------------------------------------------------------------
---------- Zone Font ---------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

if (ZoneText == true) then

		ZoneFadeInDuration = 0.5
		ZoneHoldDuration = 1.0
		ZoneFadeOutDuration = 2.0
		ZonePVPType = nil

		function SetZoneText(showZone)
			local pvpType, isSubZonePvP, factionName = GetZonePVPInfo()
			PVPArenaTextString:SetText("")
			PVPInfoTextString:SetText("")
			local pvpTextString = PVPInfoTextString
			if ( isSubZonePvP ) then
				pvpTextString = PVPArenaTextString
			end			

			if ( pvpType == "sanctuary" ) then
				pvpTextString:SetFont(font, unpack(pvpFontSize), 'OUTLINE')					
				ZoneTextString:SetFont(font, unpack(ZoneFontSize), 'OUTLINE')
				SubZoneTextString:SetFont(font, unpack(SubZoneFontSize), 'OUTLINE') 	
				
				if (CustomText == true) then
				   pvpTextString:SetText(SText)
				else pvpTextString:SetText(SANCTUARY_TERRITORY)   
				end   				
				
				if (CustomColors == true) then 
				   pvpTextString:SetTextColor(unpack(SColor))
				   ZoneTextString:SetTextColor(unpack(SColor))
				   SubZoneTextString:SetTextColor(unpack(SColor))   
				end
				
			elseif ( pvpType == "arena" ) then
				pvpTextString:SetFont(font, unpack(pvpFontSize), 'OUTLINE')					
				ZoneTextString:SetFont(font, unpack(ZoneFontSize), 'OUTLINE')
				SubZoneTextString:SetFont(font, unpack(SubZoneFontSize), 'OUTLINE') 	
				
				if (CustomText == true) then
				   pvpTextString:SetText(AText)
				else pvpTextString:SetText(FREE_FOR_ALL_TERRITORY)  
				end   				
				
				if (CustomColors == true) then 
				   pvpTextString:SetTextColor(unpack(AColor))
				   ZoneTextString:SetTextColor(unpack(AColor))
				   SubZoneTextString:SetTextColor(unpack(AColor))
				end	
				
			elseif ( pvpType == "friendly" ) then
				pvpTextString:SetFont(font, unpack(pvpFontSize), 'OUTLINE')					
				ZoneTextString:SetFont(font, unpack(ZoneFontSize), 'OUTLINE')
				SubZoneTextString:SetFont(font, unpack(SubZoneFontSize), 'OUTLINE') 	
				
				if (CustomText == true) then
				   pvpTextString:SetText(FText)
				else pvpTextString:SetText(format(FACTION_CONTROLLED_TERRITORY, factionName))   
				end   				
				
				if (CustomColors == true) then 
				   pvpTextString:SetTextColor(unpack(FColor))
				   ZoneTextString:SetTextColor(unpack(FColor))
				   SubZoneTextString:SetTextColor(unpack(FColor))
				end		
				
			elseif ( pvpType == "hostile" ) then
				pvpTextString:SetFont(font, unpack(pvpFontSize), 'OUTLINE')					
				ZoneTextString:SetFont(font, unpack(ZoneFontSize), 'OUTLINE')
				SubZoneTextString:SetFont(font, unpack(SubZoneFontSize), 'OUTLINE') 	
				
				if (CustomText == true) then
				   pvpTextString:SetText(HText)
				else pvpTextString:SetText(format(FACTION_CONTROLLED_TERRITORY, factionName))   
				end   				
				
				if (CustomColors == true) then 
				   pvpTextString:SetTextColor(unpack(HColor))
				   ZoneTextString:SetTextColor(unpack(HColor))
				   SubZoneTextString:SetTextColor(unpack(HColor))
				end		
				
			elseif ( pvpType == "contested" ) then
				pvpTextString:SetFont(font, unpack(pvpFontSize), 'OUTLINE')					
				ZoneTextString:SetFont(font, unpack(ZoneFontSize), 'OUTLINE')
				SubZoneTextString:SetFont(font, unpack(SubZoneFontSize), 'OUTLINE') 	
				
				if (CustomText == true) then
				   pvpTextString:SetText(CText)
				else pvpTextString:SetText(CONTESTED_TERRITORY)   
				end   				
				
				if (CustomColors == true) then 
				   pvpTextString:SetTextColor(unpack(CColor))
				   ZoneTextString:SetTextColor(unpack(CColor))
				   SubZoneTextString:SetTextColor(unpack(CColor))
				end								
				
			else
				ZoneTextString:SetTextColor(1.0, 0.9294, 0.7607)
				SubZoneTextString:SetTextColor(1.0, 0.9294, 0.7607)
			end

			if ( ZonePVPType ~= pvpType ) then
				ZonePVPType = pvpType;
			elseif ( not showZone ) then
				PVPInfoTextString:SetText("");
				SubZoneTextString:SetPoint("TOP", "ZoneTextString", "BOTTOM", 0, 0)
			end

			if ( PVPInfoTextString:GetText() == "" ) then
				SubZoneTextString:SetPoint("TOP", "ZoneTextString", "BOTTOM", 0, 0)
			else
				SubZoneTextString:SetPoint("TOP", "PVPInfoTextString", "BOTTOM", 0, 0)
			end
		end	
end		

-----------------------------------------------------------------------------------------------------------
---------- Damage Font ------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

if (CombatText == true) then 

LaFont = CreateFrame("Frame", "LaFont")

local fontCT = font

function LaFont:ApplySystemFonts()

	DAMAGE_TEXT_FONT = fontCT
	COMBAT_TEXT_HEIGHT = unpack(CTFontSize)
	COMBAT_TEXT_CRIT_MAXHEIGHT = unpack(CTFontSize) + 2
	COMBAT_TEXT_CRIT_MINHEIGHT = unpack(CTFontSize) - 2
	local fName, fHeight, fFlags = CombatTextFont:GetFont()
	CombatTextFont:SetFont(fontCT, unpack(CTFontSize), fFlags)

end

LaFont:SetScript("OnEvent",
		    function() 
		       if (event == "ADDON_LOADED") then
			  LaFont:ApplySystemFonts()
		       end
		    end);
LaFont:RegisterEvent("ADDON_LOADED")

LaFont:ApplySystemFonts()
end