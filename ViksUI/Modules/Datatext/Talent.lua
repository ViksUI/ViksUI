local T, C, L, _ = unpack(select(2, ...))
if not C.datatext.Talents or C.datatext.Talents == 0 then return end

local Stat = CreateFrame("Frame", "ViksUIStatTalent", UIParent)
Stat:EnableMouse(true)
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)
Stat.Option = C.datatext.Talents

local Text  = Stat:CreateFontString(nil, "OVERLAY")

if C.datatext.Talents >= 9 then
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pxfontHeader, C.media.pxfontHsize, C.media.pxfontHFlag)
else
Text:SetTextColor(unpack(C.media.pxcolor1))
Text:SetFont(C.media.pixel_font, C.media.pixel_font_size, C.media.pixel_font_style)
end
PP(C.datatext.Talents, Text)


local LeftClickMenu = { }
LeftClickMenu[1] = { text = "ViksUI Specialization Selector", isTitle = true, notCheckable = true}

local ViksUISpecSwap = CreateFrame("Frame", "ViksUISpecSwap", UIParent, "UIDropDownMenuTemplate") --Setting up the menu for later for each spec regardless of class, thanks to Simca for helping out with the function.
ViksUISpecSwap:SetTemplate("Transparent")
ViksUISpecSwap:RegisterEvent("PLAYER_LOGIN")
ViksUISpecSwap:SetScript("OnEvent", function(...)
	local specIndex
	for specIndex = 1, GetNumSpecializations() do
		LeftClickMenu[specIndex + 1] = {
			text = tostring(select(2, GetSpecializationInfo(specIndex))),
			notCheckable = true,
			func = (function()
				local getSpec = GetSpecialization()
				if getSpec and getSpec == specIndex then
					UIErrorsFrame:AddMessage("You're already in that spec!", 1.0, 0.0, 0.0, 53, 5);
					return
				end
				SetSpecialization(specIndex)
			end)
		}
	end
end)

local function Update(self) --The pretty part of the data text, displays the name of the spec.
	if not GetSpecialization() then
		Text:SetText(L_TOOLTIP_NO_TALENT) 
	else
		local tree = GetSpecialization()
		local spec = select(2,GetSpecializationInfo(tree)) or ""
		Text:SetText("|r "..spec.."|r")
	end
	self:SetAllPoints(Text)
end

Stat:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
Stat:RegisterEvent("CONFIRM_TALENT_WIPE")
Stat:RegisterEvent("PLAYER_TALENT_UPDATE")
Stat:SetScript("OnEvent", Update)
Stat:SetScript("OnMouseDown", function(self, btn)
	if btn == "LeftButton" then 
		EasyMenu(LeftClickMenu, ViksUISpecSwap, "cursor", 0, 0, "MENU", 2) --Dropdown/popup menu for spec selection.
	end
end)
