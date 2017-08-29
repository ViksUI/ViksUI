local T, C, L, _ = unpack(select(2, ...))
if C.unitframe.enable ~= true or C.unitframe_class_bar.totem ~= true then return end

----------------------------------------------------------------------------------------
--	Based on oUF_TotemBar(by Soeters)
----------------------------------------------------------------------------------------
local _, ns = ...
local oUF = ns.oUF or oUF


local _, pClass = UnitClass("player")
local total = 0
local delay = 0.01

-- In the order, fire, earth, water, air
local colors = {
	[1] = {.58,.23,.10},
	[2] = {.23,.45,.13},		
	[3] = {.19,.48,.60},
	[4] = {.42,.18,.74},	
}

local GetTotemInfo, SetValue, GetTime = GetTotemInfo, SetValue, GetTime
	
local Abbrev = function(name)	
	return (string.len(name) > 10) and string.gsub(name, "%s*(.)%S*%s*", "%1. ") or name
end
local function TotemOnClick(self,...)
	local id = self.ID
	local mouse = ...
	if IsShiftKeyDown() then
		for j = 1,4 do 
			DestroyTotem(j)
		end 
	else 
		DestroyTotem(id) 
	end
end
	
local function InitDestroy(self)
	local totem = self.TotemBar
	for i = 1 , 4 do
		local Destroy = CreateFrame("Button",nil, totem[i])
		Destroy:SetAllPoints(totem[i])
		Destroy:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		Destroy.ID = i
		Destroy:SetScript("OnClick", TotemOnClick)
	end
end
	
local function UpdateSlot(self, slot)
	local totem = self.TotemBar
	if not totem[slot] then return end
	local haveTotem, name, startTime, duration, totemIcon = GetTotemInfo(slot)

	totem[slot]:SetStatusBarColor(unpack(totem.colors[slot]))
	totem[slot]:SetValue(0)

	-- Multipliers
	if (totem[slot].bg.multiplier) then
		local mu = totem[slot].bg.multiplier
		local r, g, b = totem[slot]:GetStatusBarColor()
		r, g, b = r*mu, g*mu, b*mu
		totem[slot].bg:SetVertexColor(r, g, b) 
	end

	totem[slot].ID = slot
	-- If we have a totem then set his value 
	if(haveTotem) then
		if totem[slot].Name then
			totem[slot].Name:SetText(Abbrev(name))
		end	
		if(duration > 0) then	
			totem[slot]:SetValue(1 - ((GetTime() - startTime) / duration))	
			-- Status bar update
			totem[slot]:SetScript("OnUpdate",function(self,elapsed)
					total = total + elapsed
					if total >= delay then
						total = 0
						haveTotem, name, startTime, duration, totemIcon = GetTotemInfo(self.ID)
							if ((GetTime() - startTime) == 0) or (duration == 0) then
								self:SetValue(0)
							else
								self:SetValue(1 - ((GetTime() - startTime) / duration))
							end
					end
				end)					
		else
			-- There's no need to update because it doesn't have any duration
			totem[slot]:SetScript("OnUpdate",nil)
			totem[slot]:SetValue(0)
		end 
		-- No totem = no time 
		if totem[slot].Name then
			totem[slot].Name:SetText(" ")
		end
		if myclass ~= "SHAMAN" then
			totem:Show()
		end
	else
		totem[slot]:SetValue(0)
		if myclass ~= "SHAMAN" then
			totem:Hide()
		end
	end
end

local function Update(self, unit)
	-- Update every slot on login, still have issues with it
	for i = 1, MAX_TOTEMS do
		UpdateSlot(self, i)
	end
end

local function Event(self,event,...)
	if event == "PLAYER_TOTEM_UPDATE" then
		UpdateSlot(self, ...)
	end
end

local function Visibility(self, event, unit)
	local totem = self.TotemBar
	local spec = GetSpecialization()

	if spec == 2 then
		totem:Hide()
		if self.Debuffs then self.Debuffs:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 2, 5) end
	else
		totem:Show()
		if self.Debuffs then self.Debuffs:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 2, 19) end
	end
end

local function Enable(self, unit)
	local totem = self.TotemBar

	if(totem) then
		self:RegisterEvent("PLAYER_TOTEM_UPDATE" , Event, true)
		totem.Visibility = CreateFrame("Frame", nil, totem)
		totem.Visibility:RegisterEvent("PLAYER_TALENT_UPDATE")
		totem.Visibility:RegisterEvent("PLAYER_ENTERING_WORLD")
		totem.Visibility:SetScript("OnEvent", function(frame, event, unit) Visibility(self, event, unit) end)
		totem.colors = setmetatable(totem.colors or {}, {__index = colors})
		delay = totem.delay or delay
		if totem.Destroy then
			for i = 1, MAX_TOTEMS do
				if totem[i] then
					local t = _G["TotemFrameTotem"..i]
					t:ClearAllPoints()
					t:SetParent(totem[i])
					t:SetAllPoints(totem[i])
					t:SetFrameLevel(totem[i]:GetFrameLevel() + 1)
					t:SetFrameStrata(totem[i]:GetFrameStrata())
					t:SetAlpha(0)
					_G["TotemFrameTotem"..i.."Icon"]:Hide()
				end
			end
			hooksecurefunc("TotemFrame_Update", function()
				for i = 1, MAX_TOTEMS do
					local t = _G["TotemFrameTotem"..i]
					local slot = t.slot
					if slot and slot > 0 then
						t:ClearAllPoints()
						t:SetAllPoints(totem[slot])
					end
				end
			end)
		end
		return true
	end
end

local function Disable(self,unit)
	local totem = self.TotemBar
	if(totem) then
		self:UnregisterEvent("PLAYER_TOTEM_UPDATE", Event)
		totem.Visibility:UnregisterEvent("PLAYER_TALENT_UPDATE")
		totem.Visibility:UnregisterEvent("PLAYER_ENTERING_WORLD")
		TotemFrame:Show()
	end
end
oUF:AddElement("TotemBar",Update,Enable,Disable)