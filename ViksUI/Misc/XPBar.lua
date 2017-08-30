local T, C, L, _ = unpack(select(2, ...))
local addon, ns = ...
if C.XPBar.enable then
-- The code starting point is from saftExperiencebar. Credits to Safturento.

--------------------------
-- Config ----------------
--------------------------
-- Anchor Positions --
-- Anchor 1 is Cooldown bar and second is based on Anchor with /ui movable
local PetBattleHider = CreateFrame("Frame", "ViksPetBattleHider", oUF_PetBattleFrameHider);
PetBattleHider:SetAllPoints(UIParent)
RegisterStateDriver(PetBattleHider, "visibility", "[petbattle] hide; show")
--Bar Height and Width
--local barHeight, barWidth = 10, 275.5
---Where you want the fame to be anchored
--------AnchorPoint, AnchorTo, RelativePoint, xOffset, yOffset

local Anchor = { "TOP", PetBattleHider, "BOTTOM", -0.5 , 32.5 }

--Fonts
local showText = true -- Set to false to hide text
local mouseoverText = true -- Set to true to only show text on mouseover
local font,fontsize,flags = C.media.pixel_font, 12, "OUTLINEMONOCHROME"

--Textures
local barTex = C.media.texture
local flatTex = C.media.texture

-----------------------------------------------------------
-- Don't edit past here unless you know what your doing! --
-----------------------------------------------------------
-- Tables ----------------
--------------------------
local FactionInfo = {
	[1] = {{ 170/255, 70/255,  70/255 }, "Hated", "FFaa4646"},
	[2] = {{ 170/255, 70/255,  70/255 }, "Hostile", "FFaa4646"},
	[3] = {{ 170/255, 70/255,  70/255 }, "Unfriendly", "FFaa4646"},
	[4] = {{ 200/255, 180/255, 100/255 }, "Neutral", "FFc8b464"},
	[5] = {{ 75/255,  175/255, 75/255 }, "Friendly", "FF4baf4b"},
	[6] = {{ 75/255,  175/255, 75/255 }, "Honored", "FF4baf4b"},
	[7] = {{ 75/255,  175/255, 75/255 }, "Revered", "FF4baf4b"},
	[8] = {{ 155/255,  255/255, 155/255 }, "Exalted","FF9bff9b"},
}
-- Functions -------------
--------------------------
local ShortValue = function(value)
	if value >= 1e6 then
		return ("%.0fm"):format(value / 1e6):gsub("%.?0+([km])$", "%1")
	elseif value >= 1e3 or value <= -1e3 then
		return ("%.0fk"):format(value / 1e3):gsub("%.?+([km])$", "%1")
	else
		return value
	end
end

function CommaValue(amount)
	local formatted = amount
	while true do  
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
			break
		end
	end
	return formatted
end

function colorize(r)
	return FactionInfo[r][3]
end

local function IsMaxLevel()
	if UnitLevel("player") == MAX_PLAYER_LEVEL then
		return true
	end
end

-- Framework -------------
--------------------------

--Prefix for naming frames
local aName = "XPBars_"

--Create Background and Border
local backdrop = CreateFrame("Frame", aName.."Backdrop", oUF_PetBattleFrameHider)
if C.XPBar.pos1 then
backdrop:SetHeight(CPCool:GetHeight()-4)
backdrop:SetWidth(CPCool:GetWidth()-4)
backdrop:SetPoint("BOTTOM", CPCool, "BOTTOM", 0, 2)
end
if C.XPBar.pos2 then
backdrop:SetHeight(C.XPBar.height)
backdrop:SetWidth(C.XPBar.width)
backdrop:SetPoint("CENTER", AnchorXPBar)
end
backdrop:SetBackdrop({
	bgFile = barTex, 
	edgeFile = barTex, 
	tile = false, tileSize = 0, edgeSize = 1, 
	insets = { left = -1, right = -1, top = -1, bottom = -1}
})
backdrop:SetBackdropColor(0, 0, 0)
backdrop:SetBackdropBorderColor(.2, .2, .2, 0)

local barHeight = backdrop:GetHeight()
local barWidth = backdrop:GetWidth()

overlay = backdrop:CreateTexture(nil, "BORDER", backdrop)
overlay:ClearAllPoints()
overlay:SetPoint("TOPLEFT", backdrop, "TOPLEFT", 1, -1)
overlay:SetPoint("BOTTOMRIGHT", backdrop, "BOTTOMRIGHT", -1, 1)
overlay:SetTexture(barTex)
overlay:SetVertexColor(.1,.1,.1)

--Create xp status bar
local xpBar = CreateFrame("StatusBar",  aName.."xpBar", backdrop, "TextStatusBar")
xpBar:SetWidth(barWidth)
xpBar:SetHeight(GetWatchedFactionInfo() and (barHeight) or barHeight)
xpBar:SetPoint("TOP", backdrop,"TOP", 0, 0)
xpBar:SetStatusBarTexture(barTex)local _, class = UnitClass("player") local color = RAID_CLASS_COLORS[class] local r, g, b = color.r, color.g, color.b 
xpBar:SetStatusBarColor(r, g, b)

--Create Rested XP Status Bar
local restedxpBar = CreateFrame("StatusBar", aName.."restedxpBar", backdrop, "TextStatusBar")
restedxpBar:SetHeight(GetWatchedFactionInfo() and (barHeight) or barHeight)
restedxpBar:SetWidth(barWidth)
restedxpBar:SetPoint("TOP", backdrop,"TOP", 0, 0)
restedxpBar:SetStatusBarTexture(barTex)
restedxpBar:Hide()

--Create reputation status bar (Only used if not max level)
local repBar = CreateFrame("StatusBar", aName.."repBar", backdrop, "TextStatusBar")
repBar:SetWidth(barWidth)
repBar:SetHeight(IsMaxLevel() and barHeight-0 or 0)
repBar:SetPoint("BOTTOM",backdrop,"BOTTOM", 0, 0)
repBar:SetStatusBarTexture(barTex)

--Create frame used for mouseover, clicks, and text
local mouseFrame = CreateFrame("Frame", aName.."mouseFrame", backdrop)
mouseFrame:SetAllPoints(backdrop)
mouseFrame:EnableMouse(true)
	
--Create XP Text
local Text = mouseFrame:CreateFontString(aName.."Text", "OVERLAY")
Text:SetFont(font, fontsize, flags)
Text:SetPoint("CENTER", mouseFrame, "CENTER", 0, 0)
if mouseoverText == true then
	Text:SetAlpha(0)
end

--Set all frame levels (easier to see if organized this way)
backdrop:SetFrameLevel(0)
restedxpBar:SetFrameLevel(1)
repBar:SetFrameLevel(2)
xpBar:SetFrameLevel(2)
mouseFrame:SetFrameLevel(3)

local function updateStatus()
	local XP, maxXP, restXP = UnitXP("player"), UnitXPMax("player"), GetXPExhaustion()
	if not maxXP or maxXP == 0 then return end
	local percXP = math.floor((XP / maxXP) * 100)
	
	if IsMaxLevel() then
		xpBar:Hide()
		restedxpBar:Hide()
		repBar:SetHeight(barHeight)
		if not GetWatchedFactionInfo() then
			backdrop:Hide()
		else
			backdrop:Show()
		end
	else
		xpBar:SetMinMaxValues(min(0, XP), maxXP)
		xpBar:SetValue(XP)
			
		if restXP then
			Text:SetText(format("%s/%s (%s%%|cffb3e1ff+%d%%|r)", ShortValue(XP), ShortValue(maxXP), percXP, restXP/maxXP*100))
			restedxpBar:Show()
		local _, class = UnitClass("player") local color = RAID_CLASS_COLORS[class] local r, g, b = color.r, color.g, color.b	restedxpBar:SetStatusBarColor(r,g,b, 0.40)
			restedxpBar:SetMinMaxValues(min(0, XP), maxXP)
			restedxpBar:SetValue(XP+restXP)
		else
			restedxpBar:Hide()
			Text:SetText(format("%s/%s (%s%%)", ShortValue(XP), ShortValue(maxXP), percXP))
		end
		
		if GetWatchedFactionInfo() then
			xpBar:SetHeight(barHeight)
			restedxpBar:SetHeight(barHeight)	
			repBar:SetHeight(2)
			repBar:Show()
		else
			xpBar:SetHeight(barHeight)
			restedxpBar:SetHeight(barHeight)
			repBar:Hide()
		end
	end
	
	if GetWatchedFactionInfo() then
		local name, rank, minRep, maxRep, value = GetWatchedFactionInfo()
		repBar:SetMinMaxValues(minRep, maxRep)
		repBar:SetValue(value)
		repBar:SetStatusBarColor(unpack(FactionInfo[rank][1]))
		if rank == 8 then
		else
		Text:SetText(format("%d / %d (%d%%)", value-minRep, maxRep-minRep, (value-minRep)/(maxRep-minRep)*100))
		end
	end
	
	--Setup Exp Tooltip
	mouseFrame:SetScript("OnEnter", function()
		if mouseoverText == true then
			Text:SetAlpha(1)
		end
		--[[GameTooltip:SetBackdrop({
			bgFile = flatTex, 
			edgeFile = flatTex, 
			tile = false, tileSize = 0, edgeSize = 1, 
			insets = { left = -1, right = -1, top = -1, bottom = -1}
		})
		GameTooltip:SetBackdropColor(0, 0, 0)
		GameTooltip:SetBackdropBorderColor(.2, .2, .2, 1)
		if not gtOverlay then
			local gtOverlay = GameTooltip:CreateTexture(nil, "BORDER", GameTooltip)
			gtOverlay:ClearAllPoints()
			gtOverlay:SetPoint("TOPLEFT", GameTooltip, "TOPLEFT", 2, -2)
			gtOverlay:SetPoint("BOTTOMRIGHT", GameTooltip, "BOTTOMRIGHT", -2, 2)
			gtOverlay:SetTexture(barTex)
			gtOverlay:SetVertexColor(.1,.1,.1)
		end]]
		GameTooltip:SetOwner(mouseFrame, "ANCHOR_BOTTOMLEFT", -3, barHeight)
		GameTooltip:ClearLines()
		if not IsMaxLevel() then
			GameTooltip:AddLine("Experience:")
			GameTooltip:AddLine(string.format('XP: %s/%s (%d%%)', CommaValue(XP), CommaValue(maxXP), (XP/maxXP)*100))
			GameTooltip:AddLine(string.format('Remaining: %s', CommaValue(maxXP-XP)))
			if restXP then
				GameTooltip:AddLine(string.format('|cffb3e1ffRested: %s (%d%%)', CommaValue(restXP), restXP/maxXP*100))
			end
		end
		if GetWatchedFactionInfo() then
			local name, rank, min, max, value = GetWatchedFactionInfo()
			if rank == 8 then return end
			if not IsMaxLevel() then GameTooltip:AddLine(" ") end
			GameTooltip:AddLine(string.format('Reputation: %s', name))
			GameTooltip:AddLine(string.format('Standing: |c'..colorize(rank)..'%s|r', FactionInfo[rank][2]))
			GameTooltip:AddLine(string.format('Rep: %s/%s (%d%%)', CommaValue(value-min), CommaValue(max-min), (value-min)/(max-min)*100))
			GameTooltip:AddLine(string.format('Remaining: %s', CommaValue(max-value)))
		end
		GameTooltip:Show()
	end)
	mouseFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
		if mouseoverText == true then
			Text:SetAlpha(0)
		end
	end)
	
	-- Right click menu
	local function sendReport(dest, rep)--Destination, if Reputation rep = true
		if rep == true then 
			local name, rank, min, max, value = GetWatchedFactionInfo()
			SendChatMessage("I'm currently "..FactionInfo[rank][2].." with "..name.." "..(value-min).."/"..(max-min).." ("..floor((((value-min)/(max-min))*100)).."%).",dest)
		else
			local XP, maxXP = UnitXP("player"), UnitXPMax("player")
			SendChatMessage("I'm currently at "..CommaValue(XP).."/"..CommaValue(maxXP).." ("..floor((XP/maxXP)*100).."%) experience.",dest)
		end
	end
			
	local reportFrame = CreateFrame("Frame", "stExperienceReportMenu", UIParent)
	if UnitLevel("player") ~= MAX_PLAYER_LEVEL then
		local reportList = {
			{text = "Sent Experience to:",
				isTitle = true, notCheckable = true, notClickable = true,
				func = function()  end},
			{text = "Party",
				func = function() 
					if GetNumGroupMembers() > 0 then
						sendReport("PARTY")
					else
						print("[stExp] Must be in a group to report to party.")
					end
				end},
			{text = "Guild",
				func = function()
					if IsInGuild() then
						sendReport("GUILD")
					else
						print("[stExp] Must be in a guild to report to guild.")
					end
				end},
			{text = "Raid",
				func = function() 
					if IsInRaid() then
						sendReport("RAID")
					elseif GetNumGroupMembers() > 0 then
						sendReport("PARTY")
					else
						print("[stExp] Must be in a group to report to party/raid.")
					end
				end},
			{text = "Target",
				func = function()
					if UnitName("target") then 
						local XP, maxXP = UnitXP("player"), UnitXPMax("player")
						SendChatMessage("I'm currently at "..CommaValue(XP).."/"..CommaValue(maxXP).." ("..floor((XP/maxXP)*100).."%) experience.","WHISPER",nil,UnitName("target"))
					end
				end},
			{text = "Sent Reputation to:",
				isTitle = true, notCheckable = true, notClickable = true,
				func = function()  end},
			{text = "Party",
				func = function() 
					if GetNumGroupMembers() > 0 then
						sendReport("PARTY", true)
					else
						print("[stExp] Must be in a group to report to party.")
					end
				end},
			{text = "Guild",
				func = function()
					if IsInGuild() then
						sendReport("GUILD", true)
					else
						print("[stExp] Must be in a guild to report to guild.")
					end
				end},
			{text = "Raid",
				func = function() 
					if IsInRaid() then
						sendReport("RAID", true)
					elseif GetNumGroupMembers() > 0 then
						sendReport("PARTY", true)
					else
						print("[stExp] Must be in a group to report to party/raid.")
					end
				end},
			{text = "Target",
				func = function() 
					if UnitName("target") then 
						local name, rank, min, max, value = GetWatchedFactionInfo()
						SendChatMessage("I'm currently "..FactionInfo[rank][2].." with "..name.." "..(value-min).."/"..(max-min).." ("..floor((((value-min)/(max-min))*100)).."%).","WHISPER",nil,UnitName("target"))
					end
				end},
			}
			mouseFrame:SetScript("OnMouseUp", function(self, btn)
			if btn == "RightButton" then
				EasyMenu(reportList, reportFrame, self, 0, 0, "menu", 2)
			end
		end)
	else
		local reportList = {
			{text = "Sent Reputation to:",
				isTitle = true, notCheckable = true, notClickable = true,
				func = function()  end},
			{text = "Party",
				func = function() 
					if GetNumGroupMembers() > 0 then
						sendReport("PARTY", true)
					else
						print("[stExp] Must be in a group to report to party.")
					end
				end},
			{text = "Guild",
				func = function()
					if IsInGuild() then
						sendReport("GUILD", true)
					else
						print("[stExp] Must be in a guild to report to guild.")
					end
				end},
			{text = "Raid",
				func = function() 
					if IsInRaid() then
						sendReport("RAID", true)
					elseif GetNumGroupMembers() > 0 then
						sendReport("PARTY", true)
					else
						print("[stExp] Must be in a group to report to party/raid.")
					end
				end},
			{text = "Target",
				func = function() 
					if UnitName("target") then 
						local name, rank, min, max, value = GetWatchedFactionInfo()
						SendChatMessage("I'm currently "..FactionInfo[rank][2].." with "..name.." "..(value-min).."/"..(max-min).." ("..floor((((value-min)/(max-min))*100)).."%).","WHISPER",nil,UnitName("target"))
					end
				end},
			}
			mouseFrame:SetScript("OnMouseUp", function(self, btn)
			if btn == "RightButton" then
				EasyMenu(reportList, reportFrame, self, 0, 0, "menu", 2)
			end
		end)
	end
end

-- Event Stuff -----------
--------------------------
local frame = CreateFrame("Frame",nil,oUF_PetBattleFrameHider)
--Event handling
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("PLAYER_XP_UPDATE")
frame:RegisterEvent("UPDATE_EXHAUSTION")
frame:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
frame:RegisterEvent("UPDATE_FACTION")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", updateStatus)

RegisterStateDriver(frame, "visibility", "[pet,novehicleui,nopossessbar,nopetbattle] show; hide")
end
