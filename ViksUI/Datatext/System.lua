local T, C, L, _ = unpack(select(2, ...))
--------------------------------------------------------------------
-- System Stats
--------------------------------------------------------------------
if C.datatext.System and C.datatext.System > 0 then
	local Stat = CreateFrame("Frame", "DataTextSystem", UIParent)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)
	Stat:EnableMouse(true)
	
	local Text  = Stat:CreateFontString(nil, "OVERLAY")
if C.datatext.Talents >= 9 then
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
	PP(C.datatext.System, Text)
	local colorme = string.format("%02x%02x%02x", 1*255, 1*255, 1*255)
	
	local function formatMem(memory, color)
		if color then
			statColor = { "|cff"..colorme, "|r" }
		else
			statColor = { "", "" }
		end
		
		local mult = 10^1
		if memory > 999 then
			local mem = floor((memory/1024) * mult + 0.5) / mult
			if mem % 1 == 0 then
				return mem..string.format(".0 %sMib%s", unpack(statColor))
			else
				return mem..string.format(" %sMib%s", unpack(statColor))
			end
		else
			local mem = floor(memory * mult + 0.5) / mult
				if mem % 1 == 0 then
					return mem..string.format(".0 %sKib%s", unpack(statColor))
				else
					return mem..string.format(" %sKib%s", unpack(statColor))
				end
		end

	end

	local Total, Mem, MEMORY_TEXT, LATENCY_TEXT, Memory
	local function RefreshMem(self)
		Memory = {}
		UpdateAddOnMemoryUsage()
		Total = 0
		for i = 1, GetNumAddOns() do
			Mem = GetAddOnMemoryUsage(i)
			Memory[i] = { select(2, GetAddOnInfo(i)), Mem, IsAddOnLoaded(i) }
			Total = Total + Mem
		end
		
		MEMORY_TEXT = formatMem(Total, true)
		table.sort(Memory, function(a, b)
			if a and b then
				return a[2] > b[2]
			end
		end)
		self:SetAllPoints(Text)
	end
	
	local int, int2 = 10, 1
	local function Update(self, t)
		int = int - t
		int2 = int2 - t
		local fpscolor
		local latencycolor
		
		if int < 0 then
			RefreshMem(self)
			int = 10
		end
		if int2 < 0 then
			if select(3, GetNetStats()) < 300 then
				latencycolor = "|cff0CD809"
			elseif (select(3, GetNetStats()) > 300 and select(3, GetNetStats()) < 500) then
				latencycolor = "|cffE8DA0F"
			else
				latencycolor = "|cffD80909"
			end
			if floor(GetFramerate()) >= 30 then
				fpscolor = "|cff0CD809"
			elseif (floor(GetFramerate()) > 15 and floor(GetFramerate()) < 30) then
				fpscolor = "|cffE8DA0F"
			else
				fpscolor = "|cffD80909"
			end
			Text:SetText(fpscolor..floor(GetFramerate()).."|r".."fps "..latencycolor..select(3, GetNetStats()).."|r".."ms "..fpscolor..formatMem(Total).."|r".."mb")
			int2 = 0.8
		end
	
	end
	Stat:SetScript("OnMouseDown", function () collectgarbage("collect") Update(Stat, 20) end)
	Stat:SetScript("OnEnter", function(self)
		if not InCombatLockdown() then
			local bandwidth = GetAvailableBandwidth()
			GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6);
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("CENTER", self, "CENTER", 0, 0)
			GameTooltip:ClearLines()
			local _, _, latencyHome, latencyWorld = GetNetStats()
			local latency = format(MAINMENUBAR_LATENCY_LABEL, latencyHome, latencyWorld)
			GameTooltip:AddLine(qColor..latency)
			GameTooltip:AddLine(" ")
			GameTooltip:AddDoubleLine("Total Memory Usage:",formatMem(Total).."|r".."", 0, 0.6, 1, 1, 1, 1)
			GameTooltip:AddLine(" ")
			for i = 1, #Memory do
				if Memory[i][3] then 
					local red = Memory[i][2]/Total*2
					local green = 1 - red
					GameTooltip:AddDoubleLine(Memory[i][1], formatMem(Memory[i][2], false), 1, 1, 1, red, green+1, 0)						
				end
			end
			GameTooltip:Show()
		end
		
	end)
	Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
	Stat:SetScript("OnUpdate", Update) 
	Update(Stat, 20)
end