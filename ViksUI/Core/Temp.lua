local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	Temporary stuff
----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	Talent Advisor
----------------------------------------------------------------------------------------

Builds = {
	DEATHKNIGHT = {
		["Leveling Blood"] = {1,false, {1,2,2,1,3,3,1}},
		["Leveling Frost"] = {2,false, {1,2,2,1,2,1,2}},
		["Leveling Unholy"] = {3,false, {3,3,3,3,2,2,1}},
	},
	DEMONHUNTER = {
		["Leveling Havoc"] = {1,false, {1,1,3,1,1,3,1}},
		["Leveling Vengeance"] = {2, false, {1,2,3,3,3,2,1}},
	},
	DRUID = {
		["Leveling Balance"] = {1,false, {1,2,2,1,1,1,2}},
		["Leveling Feral"] = {2,false, {1,1,3,1,1,3,3}},
		["Leveling Guardian"] = {3,false, {1,3,3,3,2,2,2}},
		["Leveling Restoration"] = {4,false, {3,3,2,3,1,3,1}},
	},
	HUNTER = {
		["Leveling Beast Mastery"] = {1,false, {2,3,1,3,2,2,1},"Ferocity"},
		["Leveling Marksmanship"] = {2,false, {3,3,1,2,1,2,2},"Ferocity"},
		["Leveling Survival"] = {3,false, {1,1,2,1,1,1,1},"Ferocity"},
	},
	MAGE = {
		["Leveling Arcane"] = {1,false, {1,2,1,2,1,2,3}},
		["Leveling Fire"] = {2,false, {3,2,1,1,1,2,3}},
		["Leveling Frost"] = {3,false, {2,2,1,1,1,2,1}},
	},
	MONK = {
		["Leveling Brewmaster"] = {1,false, {1,2,1,2,2,2,1}},
		["Leveling Mistweaver"] = {2,false, {1,2,2,1,1,3,3}},
		["Leveling Windwalker"] = {3,false, {1,2,2,2,1,3,2}},
	},
	PALADIN = {
		["Leveling Holy"] = {1,false, {1,3,1,2,2,3,3}},
		["Leveling Protection"] = {2,false, {3,1,1,2,1,2,1}},
		["Leveling Retribution"] = {3,false, {3,2,2,2,1,3,3}},
	},
	PRIEST = {
		["Leveling Discipline"] = {1,false, {3,3,3,3,1,1,1}},
		["Leveling Holy"] = {2,false, {2,3,2,2,1,2,2}},
		["Leveling Shadow"] = {3,false, {2,1,2,3,1,1,1}},
	},
	ROGUE = {
		["Leveling Assassination"] = {1,false, {3,2,3,1,1,2,1}},
		["Leveling Outlaw"] = {2,false, {2,2,3,1,3,2,2}},
		["Leveling Subtlety"] = {3,false, {1,2,3,1,2,3,2}},
	},
	SHAMAN = {
		["Leveling Elemental"] = {1,false, {1,1,2,1,1,1,2}},
		["Leveling Enhancement"] = {2,false, {1,1,1,2,2,3,3}},
		["Leveling Restoration"] = {3,false, {1,1,1,2,1,1,3}},
	},
	WARLOCK = {
		["Leveling Affliction"] = {1,false, {1,2,2,2,2,2,1}},
		["Leveling Demonology"] = {2,false, {2,1,2,2,2,2,2}},
		["Leveling Destruction"] = {3,false, {3,3,2,2,2,2,2}},
	},
	WARRIOR = {
		["Leveling Arms"] = {1,false, {1,1,2,2,3,1,2}},
		["Leveling Fury"] = {2,false, {3,1,3,2,2,3,1}},
		["Leveling Protection"] = {3,false, {2,1,3,2,2,2,1}},
	},
}

PetSpecs = {
	Ferocity=1,
	Tenacity=2,
	Cunning=3,
}

local TA = T.TalentAdvisor
local CHAIN = ChainCall

function Initialise()
	if Initialised then return end

	hooksecurefunc("PlayerTalentFrame_ShowTalentTab",SetTalents)
	hooksecurefunc("PlayerTalentFrame_ShowsPetSpecTab",SetPetSpec)
	hooksecurefunc("PlayerTalentFrame_ShowsSpecTab",SetSpec)

	-- make spec icon
	SpecIcon  = CreateFrame("Button", "ViksUITASpec" , PlayerTalentFrameSpecializationSpecButton1)
	SpecIcon:SetSize(30,30)
	SpecIcon:SetPoint("TOPRIGHT")
	SpecIcon:SetNormalTexture([[Interface\AddOns\ViksUI\Media\textures\viksicon.blp]])
	SpecIcon:SetFrameStrata("HIGH")
	SpecIcon:SetFrameLevel(76)
	SpecIcon:SetScript("OnEnter", function() ShowTooltip(SpecIcon) end)
	SpecIcon:Hide()

	-- make talent icons
	TalentIcons = {}
	for i=1,MAX_TALENT_TIERS do
		local blizz_talent=_G["PlayerTalentFrameTalentsTalentRow"..i.."Talent1"]
		local icon = CreateFrame("Button", "ViksUITATalent"..i, blizz_talent)
		icon:SetSize(20,20)
		icon:SetPoint("TOPRIGHT")
		icon:SetNormalTexture([[Interface\AddOns\ViksUI\Media\textures\viksicon.blp]])
		icon:SetFrameStrata("HIGH")
		icon:SetFrameLevel(76)
		icon:SetScript("OnEnter", function() ShowTooltip(TalentIcons[i]) end)
		icon:Hide()
		TalentIcons[i]=icon
	end

	-- make pet spec icon
	PetSpecIcon  = CreateFrame("Button", "ViksUITAPetSpec" , PlayerTalentFramePetSpecializationSpecButton1)
	PetSpecIcon:SetSize(30,30)
	PetSpecIcon:SetPoint("TOPRIGHT")
	PetSpecIcon:SetNormalTexture([[Interface\AddOns\ViksUI\Media\textures\viksicon.blp]])
	PetSpecIcon:SetFrameStrata("HIGH")
	PetSpecIcon:SetFrameLevel(76)
	PetSpecIcon:SetScript("OnEnter", function() ShowTooltip(PetSpecIcon) end)
	PetSpecIcon:Hide()

	-- record player class

	local _
	_,PlayerClass = UnitClass("player")

	Initialised = true
end

function ShowTooltip(object)
	GameTooltip:SetOwner(object,"ANCHOR_TOP")
	GameTooltip:SetText("Vik's goto talent for leveling")
	GameTooltip:Show()
end

function SetSpec()

	if not Builds[PlayerClass] then 
		SpecIcon:Hide()
		return 
	end

	local suggested_spec
	for _,specdata in pairs(Builds[PlayerClass]) do
		if specdata[2]==true then
			suggested_spec = specdata[1]
		end
	end
	if suggested_spec then
		SpecIcon:SetParent(_G["PlayerTalentFrameSpecializationSpecButton"..suggested_spec])
		SpecIcon:ClearAllPoints()
		SpecIcon:SetPoint("TOPRIGHT")
		SpecIcon:Show()
	end	
end

function SetTalents() 

	local spec = GetSpecialization()
	if not spec then return end

	local suggested_spec
	if Builds[PlayerClass] then
		for specname,specdata in pairs(Builds[PlayerClass]) do
			if specdata[1]==spec then
				suggested_spec = specdata
			end
		end
	end

	if not suggested_spec then 
		for _,icon in pairs(TalentIcons) do icon:Hide() end
		return 
	end

	local talents = suggested_spec[3]

	for row,talent in pairs(talents) do
		local blizz_talent = _G["PlayerTalentFrameTalentsTalentRow"..row.."Talent"..talent]
		local icon = TalentIcons[row]
		icon:SetParent(blizz_talent)
		icon:ClearAllPoints()
		icon:SetPoint("TOPRIGHT")
		icon:Show()
	end
 
--[=[	
	local panel = CreateFrame("Frame", nil, PlayerTalentFrameTalents)
	panel:CreatePanel("Transparent", 250, PlayerTalentFrame:GetHeight(), "TOP", UIParent, "TOP", 12, -1)
	panel:SetPoint("TOPLEFT", PlayerTalentFrame, "TOPRIGHT", 5, 0)
	panel:EnableMouseWheel(true)

	panel.Title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	panel.Title:SetPoint("TOPLEFT", 8, -16)
	
	local headers = suggested_spec[5]
	for row,talent in pairs(talents) do
		panel.Title:SetText(headers)
	end
	

	panel.subText = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	panel.subText:SetPoint("TOPLEFT", panel.Title, "BOTTOMLEFT", 0, -8)
	panel.subText:SetJustifyH("LEFT")
	panel.subText:SetJustifyV("TOP")
	panel.subText:SetSize(570, 30)
	
	local subtekst = suggested_spec[6]
	for row,talent in pairs(talents) do
		panel.subText:SetText(subtekst)
	end
]=]
end

function SetPetSpec() 

	if not Builds[PlayerClass] then 
		PetSpecIcon:Hide()
		return 
	end

	local spec = GetSpecialization()

	local suggested_spec
	if Builds[PlayerClass] then
		for _,specdata in pairs(Builds[PlayerClass]) do
			if specdata[1]==spec then
				suggested_spec = specdata
			end
		end
	end

	if not suggested_spec then 
		PetSpecIcon:Hide() 
		return 
	end

	local suggested_pet_spec = PetSpecs[suggested_spec[4]]

	if suggested_pet_spec then
		PetSpecIcon:SetParent(_G["PlayerTalentFramePetSpecializationSpecButton"..suggested_pet_spec])
		PetSpecIcon:ClearAllPoints()
		PetSpecIcon:SetPoint("TOPRIGHT")
		PetSpecIcon:Show()
	end	

end

function Toggle(enable)
	if not Initialised then return end

	if enable then
		for _,icon in pairs(TalentIcons) do icon:Show() end
		SpecIcon:Show()
		PetSpecIcon:Show()
	else
		for _,icon in pairs(TalentIcons) do icon:Hide() end
		SpecIcon:Hide()
		PetSpecIcon:Hide()
	end
end


hooksecurefunc("TalentFrame_LoadUI",Initialise)
