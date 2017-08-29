local T, C, L, _ = unpack(select(2, ...))
if C.reminder.raid_buffs_enable ~= true then return end

----------------------------------------------------------------------------------------
--	Raid buffs on player(by Elv22)
----------------------------------------------------------------------------------------
-- Locals
local flaskbuffs = T.ReminderBuffs["Flask"]
local battleelixirbuffs = T.ReminderBuffs["BattleElixir"]
local guardianelixirbuffs = T.ReminderBuffs["GuardianElixir"]
local foodbuffs = T.ReminderBuffs["Food"]
local statbuffs = T.ReminderBuffs["Stat"]
local staminabuffs = T.ReminderBuffs["Stamina"]
local visible, flask, battleelixir, guardianelixir, food, stat, stamina, spell5, spell6

-- We need to check if you have two different elixirs if your not flasked, before we say your not flasked
local function CheckElixir(unit)
	if battleelixirbuffs and battleelixirbuffs[1] then
		for i, battleelixirbuffs in pairs(battleelixirbuffs) do
			local name, _, icon = GetSpellInfo(battleelixirbuffs)
			if UnitAura("player", name) then
				FlaskFrame.t:SetTexture(icon)
				battleelixir = true
				break
			else
				battleelixir = false
			end
		end
	end

	if guardianelixirbuffs and guardianelixirbuffs[1] then
		for i, guardianelixirbuffs in pairs(guardianelixirbuffs) do
			local name, _, icon = GetSpellInfo(guardianelixirbuffs)
			if UnitAura("player", name) then
				guardianelixir = true
				if not battleelixir then
					FlaskFrame.t:SetTexture(icon)
				end
				break
			else
				guardianelixir = false
			end
		end
	end

	if guardianelixir == true and battleelixir == true then
		FlaskFrame:SetAlpha(C.reminder.raid_buffs_alpha)
		flask = true
		return
	else
		FlaskFrame:SetAlpha(1)
		flask = false
	end
end

-- Main Script
local function OnAuraChange(self, event, arg1, unit)
	if event == "UNIT_AURA" and arg1 ~= "player" then return end

	-- If We're a caster we may want to see different buffs
	if T.Role == "Caster" or T.Role == "Healer" then
		T.ReminderCasterBuffs()
	else
		T.ReminderPhysicalBuffs()
	end

	-- Start checking buffs to see if we can find a match from the list
	if flaskbuffs and flaskbuffs[1] then
		for i, flaskbuffs in pairs(flaskbuffs) do
			local name, _, icon = GetSpellInfo(flaskbuffs)
			if i == 1 then
				FlaskFrame.t:SetTexture(icon)
			end
			if UnitAura("player", name) then
				FlaskFrame:SetAlpha(C.reminder.raid_buffs_alpha)
				flask = true
				break
			else
				CheckElixir()
			end
		end
	end

	if foodbuffs and foodbuffs[1] then
		for i, foodbuffs in pairs(foodbuffs) do
			local name, _, icon = GetSpellInfo(foodbuffs)
			if i == 1 then
				FoodFrame.t:SetTexture(icon)
			end
			if UnitAura("player", name) then
				FoodFrame:SetAlpha(C.reminder.raid_buffs_alpha)
				food = true
				break
			else
				FoodFrame:SetAlpha(1)
				food = false
			end
		end
	end

	for i, statbuffs in pairs(statbuffs) do
		local name, _, icon = GetSpellInfo(statbuffs)
		if i == 1 then
			StatFrame.t:SetTexture(icon)
		end
		if UnitAura("player", name) then
			StatFrame:SetAlpha(C.reminder.raid_buffs_alpha)
			stat = true
			break
		else
			StatFrame:SetAlpha(1)
			stat = false
		end
	end

	for i, staminabuffs in pairs(staminabuffs) do
		local name, _, icon = GetSpellInfo(staminabuffs)
		if i == 1 then
			StaminaFrame.t:SetTexture(icon)
		end
		if UnitAura("player", name) then
			StaminaFrame:SetAlpha(C.reminder.raid_buffs_alpha)
			stamina = true
			break
		else
			StaminaFrame:SetAlpha(1)
			stamina = false
		end
	end

	for i, Spell5Buff in pairs(Spell5Buff) do
		local name, _, icon = GetSpellInfo(Spell5Buff)
		if i == 1 then
			Spell5Frame.t:SetTexture(icon)
		end
		if UnitAura("player", name) then
			Spell5Frame:SetAlpha(C.reminder.raid_buffs_alpha)
			spell5 = true
			break
		else
			Spell5Frame:SetAlpha(1)
			spell5 = false
		end
	end

	for i, Spell6Buff in pairs(Spell6Buff) do
		local name, _, icon = GetSpellInfo(Spell6Buff)
		if i == 1 then
			Spell6Frame.t:SetTexture(icon)
		end
		if UnitAura("player", name) then
			Spell6Frame:SetAlpha(C.reminder.raid_buffs_alpha)
			spell6 = true
			break
		else
			Spell6Frame:SetAlpha(1)
			spell6 = false
		end
	end

	local _, instanceType = IsInInstance()
	if (not IsInGroup() or instanceType ~= "raid") and C.reminder.raid_buffs_always == false then
		RaidBuffReminder:SetAlpha(0)
		visible = false
	elseif flask == true and food == true and stat == true and stamina == true and spell5 == true and spell6 == true then
		if not visible then
			RaidBuffReminder:SetAlpha(0)
			visible = false
		end
		if visible then
			UIFrameFadeOut(RaidBuffReminder, 0.5)
			visible = false
		end
	else
		if not visible then
			UIFrameFadeIn(RaidBuffReminder, 0.5)
			visible = true
		end
	end
end

-- Create Anchor
RaidBuffsAnchor = CreateFrame("Frame","Move_RaidBuffsAnchor",UIParent)
RaidBuffsAnchor:SetPoint("TOPLEFT", CPMinimb2, "BOTTOMLEFT", 0, -3)
CreateAnchor(RaidBuffsAnchor, "Move Raid Buff Reminder", C.reminder.raid_buffs_size * 6.6, C.reminder.raid_buffs_size + 2)

-- Create Main bar
local raidbuff_reminder = CreateFrame("Frame", "RaidBuffReminder", UIParent)
raidbuff_reminder:CreatePanel("Invisible", (C.reminder.raid_buffs_size * 6) + 15, C.reminder.raid_buffs_size + 4, "TOPLEFT", RaidBuffsAnchor, "TOPLEFT", 0, 4)
raidbuff_reminder:RegisterEvent("UNIT_AURA")
raidbuff_reminder:RegisterEvent("PLAYER_ENTERING_WORLD")
raidbuff_reminder:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
raidbuff_reminder:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raidbuff_reminder:SetScript("OnEvent", OnAuraChange)

-- Function to create buttons
local function CreateButton(name, relativeTo, firstbutton)
	local button = CreateFrame("Frame", name, RaidBuffReminder)
	if firstbutton == true then
		button:CreatePanel("Default", C.reminder.raid_buffs_size, C.reminder.raid_buffs_size, "BOTTOMLEFT", relativeTo, "BOTTOMLEFT", 0, 0)
	else
		button:CreatePanel("Default", C.reminder.raid_buffs_size, C.reminder.raid_buffs_size, "LEFT", relativeTo, "RIGHT", 3, 0)
	end
	button:SetFrameLevel(RaidBuffReminder:GetFrameLevel() + 2)

	button.t = button:CreateTexture(name..".t", "OVERLAY")
	button.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	button.t:SetPoint("TOPLEFT", 2, -2)
	button.t:SetPoint("BOTTOMRIGHT", -2, 2)
end

-- Create Buttons
do
	CreateButton("FlaskFrame", RaidBuffReminder, true)
	CreateButton("FoodFrame", FlaskFrame, false)
	--CreateButton("StatFrame", FoodFrame, false)
	--CreateButton("StaminaFrame", StatFrame, false)
	--CreateButton("Spell5Frame", StaminaFrame, false)
	--CreateButton("Spell6Frame", Spell5Frame, false)
end

--[[
----------------------------------------------------------------------------------------------



-- Adding in ALL RAID BUFFS
local AllBuffs = {
	["attackpower"] = {
		57330,					-- Horn of Winter
		19506,					-- Trueshot Aura
		6673,					-- Battle Shout
	},
	["haste"] = {
		55510,					-- Unholy Aura
		49868,					-- Mind Quickening
		113742,					-- Swiftblade's Cunning
		116956,					-- Grace of Air
		128432,					-- Crackling Howl (Hunterpet)
		160003,					-- Savage Vigor (Hunterpet)
		135678,					-- Energizing Spores (Hunterpet)
		160074,					-- Speed of the Swarm (Hunterpet)
		160203,					-- Lone Wolf: Haste of the Hyena
	},
	["spellpower"] = {
		1459,					-- Arcane Brilliance
		61316,					-- Dalaran Brilliance
		109773,					-- Dark Intent
		128433,					-- Serpent's Cunning (Hunterpet)
		90364,					-- Qiraji Fortitude (Hunterpet)
		126309,					-- Still Water (Hunterpet)
		160205,					-- Lone Wolf: Wisdom of the Serpent
	},
	["crit"] = {
		17007,					-- Leader of the Pack
		1459,					-- Arcane Brilliance
		61316,					-- Dalaran Brilliance
		116781,					-- Legacy of the White Tiger
		90309,					-- Terrifying Roar (Hunterpet)
		126373,					-- Fearless Roar (Hunterpet)
		160052,					-- Strength of the Pack (Hunterpet)
		90363,					-- Embrace of the Shale Spider (Hunterpet)
		126309,					-- Still Water (Hunterpet)
		24604,					-- Furious Howl (Hunterpet)
		160200,      			-- Lone Wolf: Ferocity of the Raptor
	},
	["mastery"] = {
		155522,					-- Power of the Grave
		24907,					-- Moonkin Aura
		19740,					-- Blessing of Might
		116956,					-- Grace of Air
		93435,					-- Roar of Courage (Hunterpet)
		160039,					-- Keen Senses (Hunterpet)
		128997,					-- Spirit Beast Blessing (Hunterpet)
		160073,					-- Plainswalking (Hunterpet)
		160198,					-- Lone Wolf: Grace of the Cat
	},
	["stats"] = {
		1126, 					-- Mark of the Wild
		115921,					-- Legacy of the Emperor
		116781,					-- Legacy of the White Tiger
		20217,					-- Blessing of Kings
		159988,					-- Bark of the Wild (Hunterpet)
		160017,					-- Blessing of Kongs (Hunterpet)
		90363,					-- Embrace of the Shale Spider (Hunterpet)
		160077,					-- Strength of the Earth (Hunterpet)
		160206,					-- Lone Wolf: Power of the Primates
	},
	["stamina"] = {
		21562,					-- Power Word: Fortitude
		166928,					-- Blood Pact
		469,					-- Commanding Shout
		50256,					-- Invigorating Roar (Hunterpet)
		160014,					-- Sturdiness (Hunterpet)
		160003,					-- Savage Vigor (Hunterpet)
		90364,					-- Qiraji Fortitude (Hunterpet)
		160199,					-- Lone Wolf: Fortitude of the Bear
	},
	["multistrike"] = {
		166916,					-- Windflurry
		49868,					-- Mind Quickening
		113742,					-- Swiftblade's Cunning
		109773,					-- Dark Intent
		50519,					-- Sonic Focus (Hunterpet)
		57386,					-- Wild Strength (Hunterpet)
		58604,					-- Double Bite (Hunterpet)
		34889,					-- Spry Attacks (Hunterpet)
		24844,					-- Breath of Winds (Hunterpet)
		172968,					-- Lone Wolf: Quickness of the Dragonhawk
	},
	["versatility"] = {
		55610,					-- Unholy Aura
		1126,					-- Mark of the Wild
		167187,					-- Sanctity Aura
		167188,					-- Inspiring Presence
		159735,					-- Tenacity (Hunterpet)
		35290,					-- Indomitable (Hunterpet)
		57386,					-- Wild Strength (Hunterpet)
		160045,					-- Defensive Quills (Hunterpet)
		50518,					-- Chitinous Armor (Hunterpet)
		173035,					-- Grace (Hunterpet)
		160077,					-- Strength of the Earth (Hunterpet)
		172967,					-- Lone Wolf: Versatility of the Ravager
	},
}

local function LabelType(bufftype)
	if bufftype == "attackpower" then
		return "+ " .. RAID_BUFF_3
	elseif bufftype == "haste" then
		return "+ " .. RAID_BUFF_4
	elseif bufftype == "spellpower" then
		return "+ " .. RAID_BUFF_5
	elseif bufftype == "crit" then
		return "+ " .. RAID_BUFF_6
	elseif bufftype == "mastery" then
		return "+ " .. RAID_BUFF_7
	elseif bufftype == "stats" then
		return "+ " .. RAID_BUFF_1
	elseif bufftype == "stamina" then
		return "+ " .. RAID_BUFF_2
	elseif bufftype == "multistrike" then
		return "+ " .. RAID_BUFF_8
	elseif bufftype == "versatility" then
		return "+ " .. RAID_BUFF_9
	else
		return "ERROR"
	end
end

-- Buff Check Functions
local function AnotherOnAuraChange(self, event, arg1, unit)
	for key, value in pairs(AllBuffs) do
		for i, v in ipairs(value) do
			local spellname = select(1, GetSpellInfo(v))
			_G[key.."mini"..i].spell = v
			if UnitAura("player", spellname) then _G[key.."mini"..i]:SetAlpha(1) else _G[key.."mini"..i]:SetAlpha(0.2) end
		end

		for i, v in ipairs(value) do
			local spellname = select(1, GetSpellInfo(v))
			_G[key.."Frame"].spell = v
			if UnitAura("player", spellname) then
				_G[key.."Frame"]:SetAlpha(1)
				_G[key.."Frame"].t:SetTexture(select(3, GetSpellInfo(v)))
				break
			else
				_G[key.."Frame"]:SetAlpha(0.2)
				_G[key.."Frame"].t:SetTexture(select(3, GetSpellInfo(v)))
			end
		end
	end
end

local bufftrackersummary = CreateFrame("Frame", "BuffTrackerSummary", UIParent)
BuffTrackerSummary:SetSize(608, 285)
bufftrackersummary:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
bufftrackersummary:SetTemplate("Transparent")
local close = CreateFrame("Button", "BuffTrackerSummaryCloseButton", BuffTrackerSummary, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", BuffTrackerSummary, "TOPRIGHT")
T.SkinCloseButton(close)
close:SetScript("OnClick", function() bufftrackersummary:Hide() end)
bufftrackersummary:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
bufftrackersummary:RegisterEvent("UNIT_INVENTORY_CHANGED")
bufftrackersummary:RegisterEvent("UNIT_AURA")
bufftrackersummary:RegisterEvent("PLAYER_REGEN_ENABLED")
bufftrackersummary:RegisterEvent("PLAYER_REGEN_DISABLED")
bufftrackersummary:RegisterEvent("PLAYER_ENTERING_WORLD")
bufftrackersummary:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
bufftrackersummary:RegisterEvent("CHARACTER_POINTS_CHANGED")
bufftrackersummary:RegisterEvent("ZONE_CHANGED_NEW_AREA")
bufftrackersummary:SetScript("OnEvent", AnotherOnAuraChange)

--DERP BLIZZ, cant make good spell id's
local str = "spell:%s"
local BadTotems = {
	[8076] = 8075,
	[8972] = 8071,
	[5677] = 5675,
}
local SetupTooltip = function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 0, 0)

	if BadTotems[self.spell] then GameTooltip:SetHyperlink(format(str, BadTotems[self.spell])) else GameTooltip:SetHyperlink(format(str, self.spell)) end
	GameTooltip:Show()
end

local function CreateBuffArea(bufftype, relativeTo, column)
	local bigButton = CreateFrame("Frame", bufftype.."Frame", BuffTrackerSummary)
	if column == 1 then
		bigButton:SetSize(40, 40)
		bigButton:SetPoint("TOPLEFT", BuffTrackerSummary, "TOPLEFT", 14, -14)
		bigButton:SetTemplate("Default")
	elseif column == 2 then
		bigButton:SetSize(40, 40)
		bigButton:SetPoint("TOPLEFT", BuffTrackerSummary, "TOPLEFT", 280, -14)
		bigButton:SetTemplate("Default")
	else
		bigButton:SetSize(40, 40)
		bigButton:SetPoint("TOPLEFT", relativeTo, "BOTTOMLEFT", 0, -16)
		bigButton:SetTemplate("Default")
	end
	bigButton.t = bigButton:CreateTexture(bufftype..".t", "OVERLAY")
	bigButton.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	bigButton.t:SetPoint("TOPLEFT", 2, -2)
	bigButton.t:SetPoint("BOTTOMRIGHT", -2, 2)

	local littlebutton = {}
	for i, v in pairs(AllBuffs[bufftype]) do
		littlebutton[i] = CreateFrame("Frame", bufftype.."mini"..i, bufftrackersummary)		
		if i == 1 then
			littlebutton[i]:SetSize(20, 20)
			littlebutton[i]:SetPoint("BOTTOMLEFT", bigButton, "BOTTOMRIGHT", 3, 0)
			littlebutton[i]:SetTemplate("Default")
		else
			littlebutton[i]:SetSize(20, 20)
			littlebutton[i]:SetPoint("LEFT", littlebutton[i-1], "RIGHT", 3, 0)
			littlebutton[i]:SetTemplate("Default")
		end
		littlebutton[i].t = littlebutton[i]:CreateTexture(nil, "OVERLAY")
		littlebutton[i].t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		littlebutton[i].t:SetPoint("TOPLEFT", 2, -2)
		littlebutton[i].t:SetPoint("BOTTOMRIGHT", -2, 2)
		littlebutton[i].t:SetTexture(select(3, GetSpellInfo(v)))

		littlebutton[i]:EnableMouse(true)
		littlebutton[i]:SetScript("OnEnter", SetupTooltip)
		littlebutton[i]:SetScript("OnLeave", GameTooltip_Hide)
	end
	bigButton.text = bigButton:CreateFontString(nil, "OVERLAY")
	bigButton.text:SetPoint("TOPLEFT", bigButton, "TOPRIGHT", 3, -1)
	bigButton.text:SetFont(C.media.normal_font, 13)
	bigButton.text:SetText(LabelType(bufftype))
	bigButton:EnableMouse(true)
	bigButton:SetScript("OnEnter", SetupTooltip)
	bigButton:SetScript("OnLeave", GameTooltip_Hide)
end

--ORDER MATTERS!
CreateBuffArea("attackpower", nil, 1)
CreateBuffArea("haste", "attackpowerFrame", nil)
CreateBuffArea("spellpower", "hasteFrame", nil)
CreateBuffArea("crit", "spellpowerFrame", nil)
CreateBuffArea("mastery", "critFrame", nil)
CreateBuffArea("stats", "critFrame", 2)
CreateBuffArea("stamina", "statsFrame", nil)
CreateBuffArea("multistrike", "staminaFrame", nil)
CreateBuffArea("versatility", "multistrikeFrame", nil)

bufftrackersummary:Hide()


local function ToggleBuffTracker()
	if bufftrackersummary:IsShown() then
		bufftrackersummary:Hide()
	else
		bufftrackersummary:Show()


	end
end
raidbuff_reminder:SetScript("OnMouseDown", ToggleBuffTracker)
]]--