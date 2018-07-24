------------------------------------------------------------------------------------------
-- Credit to MaxUI
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- LOCALS/FUNCTIONS/VARIABLES
------------------------------------------------------------------------------------------
local T, C, L, _ = unpack(select(2, ...))
if C.panels.NoPanels ~= true then return end
local class = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local CreateBtn = T.CreateBtn
local thickness = 1

----------------------------------------------------------------------------------------- 27583916e80
-- METERS 
------------------------------------------------------------------------------------------
--local function updatepanels()

	if IsAddOnLoaded('Skada') or IsAddOnLoaded('Details!') or IsAddOnLoaded('Recount') then
		CreateBtn("ShowHideMeters", RIGHTChatline, 55, 20, "", "")
		ShowHideMeters:SetPoint("LEFT", RIGHTChatline, "LEFT", 0, 0)
		if IsAddOnLoaded('Skada') then
			ShowHideMeters:SetAttribute("macrotext1", "/chatU\n/Skada toggle")
		end
		if IsAddOnLoaded('Recount') then
			ShowHideMeters:SetAttribute("macrotext1", "/recount config")
		end	
		if IsAddOnLoaded('Details!') then
			ShowHideMeters:SetAttribute("macrotext1", "/details option")
		end	
		ShowHideMeters:SetAlpha(0)

		local DamageMeterText = RIGHTChatline:CreateFontString(nil, "OVERLAY")
		DamageMeterText:SetFontObject(CombatLogFont)
		DamageMeterText:SetPoint("LEFT", RIGHTChatline, "LEFT", 20, 0)
		DamageMeterText:SetText("Meters")
			if C.panels.CPwidth <= 300 then
			DamageMeterText:SetText("DPS")
			end

		RIGHTChatline.iconleft = RIGHTChatline:CreateTexture(nil, "OVERLAY")
		RIGHTChatline.iconleft:Size(17, 17)
		RIGHTChatline.iconleft:SetPoint("LEFT", DamageMeterText, "LEFT", -20, 0)
		RIGHTChatline.iconleft:SetTexture([[Interface\AddOns\ViksUI\Media\menuicons\damagemeter.tga]])
			if C.panels.CPwidth <= 300 then
			RIGHTChatline.iconleft:SetPoint("LEFT", RIGHTChatline, "LEFT", C.panels.CPwidth/6, 0)
			end
		
		ShowHideMeters:SetScript("OnEnter", function(self)
			DamageMeterText:SetTextColor(class.r, class.g, class.b)
			RIGHTChatline.iconleft:SetVertexColor(class.r, class.g, class.b)
		end)
		
		ShowHideMeters:SetScript("OnLeave", function(self)
			DamageMeterText:SetTextColor(1, 1, 1)
			RIGHTChatline.iconleft:SetVertexColor(1, 1, 1)
		end)
		
	-- SHOW HIDE FUNCTIONALITY 
		ShowHideMeters:SetScript("OnMouseDown", function(self)
			raidtoolbg:Hide()
			Line01:Hide()
			Line02:Hide()
			Line03:Hide()
			--Line04:Hide()
		end)
		
		-- Close Button // Not perfect solution
		CreateBtn("resetChat", RIGHTChatline, 70, 20, "", "")
		resetChat:SetPoint("LEFT", RIGHTChatline, "LEFT", 60, 0)
		resetChat:SetAttribute("macrotext1", "/chatS\n/Skada toggle")
		resetChat:SetAlpha(0)
		
		local resetChatText = RIGHTChatline:CreateFontString(nil, "OVERLAY")
		resetChatText:SetFontObject(CombatLogFont)
		resetChatText:SetPoint("LEFT", RIGHTChatline, "LEFT", 65, 0)
		resetChatText:SetText("x")
		
		resetChat:SetScript("OnEnter", function(self)
			resetChatText:SetTextColor(class.r, class.g, class.b)
		end)
		
		resetChat:SetScript("OnLeave", function(self)
			resetChatText:SetTextColor(1, 1, 1)
		end)
		
	-- SHOW HIDE FUNCTIONALITY 
		resetChat:SetScript("OnMouseDown", function(self)
			raidtoolbg:Hide()
			Line01:Hide()
			Line02:Hide()
			Line03:Hide()
			--Line04:Hide()
		end)	
	end