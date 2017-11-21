local T, C, L, _ = unpack(select(2, ...))
local addon, ns = ...
local cfg = ns.cfg
local lib = ns.lib
local cast = ns.cast
local _, playerClass = UnitClass("player")
local cast = CreateFrame("Frame")  
local oUF = ns.oUF or oUF

ns._Objects = {}
ns._Headers = {}

  -----------------------------
  -- Aura FUNCTIONS
  ----------------------------
   
	-- Unit has an Aura
	function hasUnitAura(unit, name)
	
		local _, _, _, count, _, _, _, caster = UnitAura(unit, name)
		if (caster and caster == "player") then
			return count
		end
	end
	
	-- Unit has a Debuff
	function hasUnitDebuff(unit, name)
		
		local _, _, _, count, _, _, _, _ = UnitDebuff(unit, name)
		if (count) then return count
		end
	end
	
-----------------------------
-- PET BATTLE FRAME HIDER
-----------------------------	
--local PetBattleHider = CreateFrame("Frame", "ViksPetBattleHider", UIParent, "SecureHandlerStateTemplate");
--PetBattleHider:SetAllPoints(UIParent)
--RegisterStateDriver(PetBattleHider, "visibility", "[petbattle] hide; show")
-----------------------------
-- PVP ICON FUNCTION - CREDITS TO oUF Drk
-----------------------------
local MyPvPUpdate = function(self, event, unit)
	if(unit ~= self.unit) then return end

	local pvp = self.MyPvP
	if(pvp) then
		local factionGroup = UnitFactionGroup(unit)
		-- FFA!
		if(UnitIsPVPFreeForAll(unit)) then
			pvp:SetTexture([[Interface\TargetingFrame\UI-PVP-FFA]])
			pvp:Show()
		elseif(UnitIsPVP(unit) and factionGroup) then
			if(factionGroup == 'Horde') then
				pvp:SetTexture(cfg.hordepvpico)
			else
				pvp:SetTexture(cfg.alliancepvpico)
			end
			pvp:Show()
		else
			pvp:Hide()
		end
	end
end

oUF.colors.smooth = {42/255,48/255,50/255, 42/255,48/255,50/255, 42/255,48/255,50/255}
  -----------------------------
  -- STYLE FUNCTIONS
  -----------------------------

local UnitSpecific = {

	player = function(self, ...)

	self.mystyle = "player"	
	--self:SetParent(PetBattleHider)
	lib.focus(self)
	--lib.spawnMenu(self)
	self.scale = cfg.scale
	self:SetSize(cfg.unit_size.Player.w,cfg.unit_size.Player.h)
	lib.gen_hpbar(self)
	lib.gen_hpstrings(self)
	lib.gen_highlight(self)
	lib.gen_ppbar(self)
	lib.gen_RaidMark(self)
	lib.gen_textbar(self)
	lib.gen_textstrings(self)
	if cfg.showPlayerAuras then
		BuffFrame:Hide()
		lib.createBuffs(self)
		lib.createDebuffs(self)
	end
	self.Health.frequentUpdates = true
	self.Health.Smooth = true
	if cfg.HealthcolorClass then
	self.Health.colorClass = true
	end
	if cfg.Powercolor then
	self.Power.colorClass = true
	else
	self.Power.colorPower = true
	end
	self.Power.frequentUpdates = true
	self.Power.Smooth = true
	self.Power.bg.multiplier = 0.5
	lib.gen_castbar(self)
	lib.gen_InfoIcons(self)
	lib.healcomm(self)	
	lib.TotemBars(self)
	lib.Experience(self)
	lib.Reputation(self)
	--lib.AltPowerBar(self)
			-- PvP Icon Credit to oUF Drk
		local pvp = self.Health:CreateTexture(nil, "OVERLAY")
		pvp:SetHeight(32)
		pvp:SetWidth(32)
		pvp:SetPoint("TOP", 10, -5)
		self.MyPvP = pvp

		-- This makes oUF update the information. 
		self:RegisterEvent("UNIT_FACTION", MyPvPUpdate)
		-- This makes oUF update the information on forced updates.
		table.insert(self.__elements, MyPvPUpdate)
	if cfg.CPoints and C.unitframe_class_bar.combo_old ~= true then lib.genCPoints(self) end
	if cfg.showHarmony then lib.genHarmony(self) end
	if cfg.showShadowOrbsBar then lib.genShadowOrbsBar(self) end
	if cfg.showPortrait or cfg.portraitHPbar then lib.gen_portrait(self) end
	if cfg.showRunebar then lib.genRunes(self) end
	if cfg.showHolybar then lib.genHolyPower(self) end
	if cfg.showShardbar then lib.genShards(self) end
	--if cfg.showEclipsebar then lib.addEclipseBar(self) end
	--lib.addAdditionalPower(self)
	if cfg.showArcaneChargesbar then lib.addArcaneCharges(self) end
	--lib.Vengeance(self)
	--addons
		
	end,
	
	target = function(self, ...)
	
		self.mystyle = "target"
		--self:SetParent(PetBattleHider)
		--lib.init(self)
		lib.focus(self)
		self.scale = cfg.scale
		self:SetSize(cfg.unit_size.Target.w,cfg.unit_size.Target.h)
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_ppbar(self)
		lib.gen_RaidMark(self)
		lib.gen_textbar(self)
		lib.gen_textstrings(self)
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		if cfg.HealthcolorClass then
		self.Health.colorClass = true
		end
		self.Power.colorTapping = true
		self.Power.colorDisconnected = true
		if cfg.Powercolor then
		self.Power.colorClass = true
		else
		self.Power.colorPower = true
		end
		self.Power.colorReaction = true
		self.Power.Smooth = true
		self.Power.bg.multiplier = 0.5
		lib.AltPowerBar(self)
		lib.healcomm(self)
		lib.gen_castbar(self)
		lib.addQuestIcon(self)
		lib.createBuffs(self)
		lib.createDebuffs(self)
		if cfg.CPoints and C.unitframe_class_bar.combo_old == true then lib.genCPoints(self) end
		--lib.createAuras(self)
		if cfg.showPortrait or cfg.portraitHPbar then lib.gen_portrait(self) end

	end,
	
	focus = function(self, ...)
	
		self.mystyle = "focus"
		--self:SetParent(PetBattleHider)
		lib.cfocus(self)
		--lib.init(self)
		self.scale = cfg.scale
		self:SetSize(cfg.unit_size.Focus.w,cfg.unit_size.Focus.h)
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_ppbar(self)
		lib.gen_textbar(self)
		lib.gen_textstrings(self)
		self.Power.colorTapping = true
		self.Power.colorDisconnected = true
		if cfg.Powercolor then
		self.Power.colorClass = true
		else
		self.Power.colorPower = true
		end
		self.Power.Smooth = true
		self.Power.colorReaction = true
		self.Power.colorHealth = true
		self.Power.bg.multiplier = 0.5
		lib.gen_RaidMark(self)
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		if cfg.HealthcolorClass then
		self.Health.colorClass = true
		end
		lib.AltPowerBar(self)
		lib.gen_castbar(self)
		lib.healcomm(self)
		lib.createAuras(self)
		if cfg.showPortrait then lib.gen_portrait(self) end
	end,
	
	targettarget = function(self, ...)

		self.mystyle = "tot"
		--self:SetParent(PetBattleHider)
		lib.focus(self)
		--lib.init(self)
		self.scale = cfg.scale
		self:SetSize(cfg.unit_size.Targettarget.w,cfg.unit_size.Targettarget.h)
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		lib.createAuras(self)
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		if cfg.HealthcolorClass then
		self.Health.colorClass = true
		end

	end,
	
	focustarget = function(self, ...)
		
		self.mystyle = "focustarget"
		--self:SetParent(PetBattleHider)
		--lib.init(self)
		self.scale = cfg.scale
		self:SetSize(cfg.unit_size.Focustarget.w,cfg.unit_size.Focustarget.h)
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		if cfg.HealthcolorClass then
		self.Health.colorClass = true
		end
	
	end,
	
	pet = function(self, ...)
		local _, playerClass = UnitClass("player")
		
		self.mystyle = "pet"
		--self:SetParent(PetBattleHider)
		--lib.init(self)
		self.scale = cfg.scale
		self:SetSize(cfg.unit_size.Pet.w,cfg.unit_size.Pet.h)
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		lib.AltPowerBar(self)
		if PlayerClass == "HUNTER" then
			self.Power.colorReaction = false
			self.Power.colorClass = false
		end

	end,

  raid = function(self, ...)
				
		self.mystyle = "raid"
		--self:SetParent(PetBattleHider)
		lib.focus(self)
		--lib.init(self)
		self.scale = cfg.scale
		self.Range = {
			insideAlpha = 1,
			outsideAlpha = .6,	}
		
		lib.gen_ppbar(self)
		self.Power.colorTapping = true
		self.Power.colorDisconnected = true
		self.Power.colorHappiness = false
		if cfg.Powercolor then
		self.Power.colorClass = true
		else
		self.Power.colorPower = true
		end
		self.Power.Smooth = true
		self.Power.colorReaction = true
		self.Power.colorHealth = true
		self.Power.bg.multiplier = 0.5
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		lib.ReadyCheck(self)
		self.Health.frequentUpdates = true
		self.Health.Smooth = true
		self.Health.colorSmooth = true
		if cfg.HealthcolorClass then
		self.Health.colorClass = true
		end
		lib.CreateTargetBorder(self)
		lib.CreateThreatBorder(self)
		lib.debuffHighlight(self)
		lib.gen_InfoIcons(self)
		lib.healcomm(self, unit)
		if cfg.IndicatorIcons2 then
		self.freebIndicators = true
		self.freebAfk = true
		-- Auras
		--local auras = CreateFrame("Frame", nil, self)
		--auras:SetSize(cfg.aurasize, cfg.aurasize)
		--auras:SetPoint("CENTER", self.Health)
		--auras.size = cfg.aurasize
		--self.freebAuras = auras
		else
		self.DrkIndicators = true
		lib.createIndicators(self)
		lib.createAuraWatch(self)
		end
		if (playerClass == "MONK") then
		self.DrkIndicators = true
		lib.createIndicators(self)
		lib.createAuraWatch(self)
		end
		lib.raidDebuffs(self)
		self.Health.PostUpdate = lib.PostUpdateRaidFrame
		self:RegisterEvent('PLAYER_TARGET_CHANGED', lib.ChangedTarget)
		self:RegisterEvent('RAID_ROSTER_UPDATE', lib.ChangedTarget)
		self:RegisterEvent("UNIT_THREAT_LIST_UPDATE", lib.UpdateThreat)
		self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", lib.UpdateThreat)
	end,

	party = function(self, ...)
				
		self.mystyle = "party"
		--self:SetParent(PetBattleHider)
		--lib.init(self)
		-- Size and Scale
		self.scale = cfg.scale
		self:SetSize(cfg.unit_size.Party.w,cfg.unit_size.Party.h)

		-- Generate Bars
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_ppbar(self)
		lib.gen_RaidMark(self)
		lib.ReadyCheck(self)
		
		--lib.gen_portrait(self)
		--style specific stuff
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		----self.Health.bg.multiplier = 0.3
		self.Power.colorTapping = true
		self.Power.colorDisconnected = true
		self.Power.colorHappiness = false
		self.Power.colorClass = true
		self.Power.colorReaction = true
		self.Power.Smooth = true
		self.Power.colorClass = true
		self.Power.bg.multiplier = 0.5
		lib.createDebuffs(self)
		lib.gen_InfoIcons(self)
		self.Health.PostUpdate = lib.PostUpdateRaidFrame
		self:RegisterEvent('PLAYER_TARGET_CHANGED', lib.ChangedTarget)
		self:RegisterEvent('RAID_ROSTER_UPDATE', lib.ChangedTarget)
		self:RegisterEvent("UNIT_THREAT_LIST_UPDATE", lib.UpdateThreat)
		self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", lib.UpdateThreat)
		
	end,


	bossStyle = function(self, ...)

		self.mystyle = "boss"
		--self:SetParent(PetBattleHider)
		self:SetSize(cfg.unit_size.Boss.w,cfg.unit_size.Boss.h)
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		lib.gen_ppbar(self)
		self.Power.colorTapping = true
		self.Power.colorDisconnected = true
		self.Power.colorClass = true
		self.Power.Smooth = true
		self.Power.colorReaction = true
		self.Power.colorHealth = true
		self.Power.bg.multiplier = 0.5
		lib.createAuraWatch(self)
		lib.gen_castbar(self)
		lib.AltPowerBar(self)
		lib.createBuffs(self)
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
	end,
	
	
	tankStyle = function(self, ...)

		self.mystyle = "oUF_tank"
		--self:SetParent(PetBattleHider)
		self:SetSize(cfg.unit_size.Tank.w,cfg.unit_size.Tank.h)
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		--lib.gen_RaidMark(self)
		lib.raidDebuffs(self)
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		if cfg.HealthcolorClass then
		self.Health.colorClass = true
		end
	end,
}	
  
-- The Shared Style Function
local GlobalStyle = function(self, unit, isSingle)

	--self.menu = lib.spawnMenu
	self:SetAttribute("type2", "togglemenu")
	self:RegisterForClicks('AnyDown')
	-- if(cfg.show_mirrorbars) then MirrorBars() end
	
	-- Call Unit Specific Styles
	if(UnitSpecific[unit]) then
		return UnitSpecific[unit](self)
	end
end

-- The Shared Style Function for Party and Raid
local GroupGlobalStyle = function(self, unit)

	--self.menu = lib.spawnMenu
	self:SetAttribute("type2", "togglemenu")
	self:RegisterForClicks('AnyDown')
	
	-- Call Unit Specific Styles
	if(UnitSpecific[unit]) then
		return UnitSpecific[unit](self)
	end
end

local tankStyle = function(self, unit, isSingle)

		--self.menu = lib.spawnMenu
		self:SetAttribute("type2", "togglemenu")
		self:RegisterForClicks('AnyDown')
				
 	-- Call Unit Specific Styles
	if(UnitSpecific[unit]) then
		return UnitSpecific[unit](self)
	end

end

local function CreateBossStyle(self)

		self.mystyle = "boss"
		--self:SetParent(PetBattleHider)
		self:SetSize(cfg.unit_size.Boss.w,cfg.unit_size.Boss.h)
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		lib.gen_ppbar(self)
		self.Power.colorTapping = true
		self.Power.colorDisconnected = true
		self.Power.colorClass = true
		self.Power.Smooth = true
		self.Power.colorReaction = true
		self.Power.colorHealth = true
		self.Power.bg.multiplier = 0.5
		lib.createAuraWatch(self)
		lib.gen_castbar(self)
		lib.AltPowerBar(self)
		lib.createBuffs(self)
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
end

local function CreateMTStyle(self)
		-- unit specifics
		self.mystyle = "tank"
		
		-- Size and Scale
		if cfg.HealFrames then
		self:SetSize(cfg.unit_size.TankH.w, cfg.unit_size.TankH.h)
		else
		self:SetSize(cfg.unit_size.Tank.w, cfg.unit_size.Tank.h)
		end
		--self:SetSize(cfg.unit_size.Tank.w, cfg.unit_size.Tank.h)

		-- Generate Bars
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		lib.raidDebuffs(self)
		--style specific stuff
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		lib.createDebuffs(self)
		--self.Health.bg.multiplier = 0.3
end

local function CreateRaid25Style(self)
				
		self.mystyle = "raid25"
		--self:SetParent(PetBattleHider)
		lib.focus(self)
		--lib.init(self)
		self.scale = cfg.scale
		self.Range = {
			insideAlpha = 1,
			outsideAlpha = .4,	}
		
		lib.gen_ppbar(self)
		self.Power.colorTapping = true
		self.Power.colorDisconnected = true
		self.Power.colorHappiness = false
		if cfg.Powercolor then
		self.Power.colorClass = true
		else
		self.Power.colorPower = true
		end
		self.Power.Smooth = true
		self.Power.colorReaction = true
		self.Power.colorHealth = true
		self.Power.bg.multiplier = 0.5
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		lib.ReadyCheck(self)
		self.Health.frequentUpdates = true
		self.Health.Smooth = true
		self.Health.colorSmooth = true
		if cfg.HealthcolorClass then
		self.Health.colorClass = true
		end
		lib.CreateTargetBorder(self)
		lib.CreateThreatBorder(self)
		lib.debuffHighlight(self)
		lib.gen_InfoIcons(self)
		lib.healcomm(self, unit)
		if cfg.IndicatorIcons2 then
		self.freebIndicators = true
		self.freebAfk = true
		-- Auras
		local auras = CreateFrame("Frame", nil, self)
		auras:SetSize(cfg.aurasize, cfg.aurasize)
		auras:SetPoint("CENTER", self.Health)
		auras.size = 12  --cfg.aurasize
		self.freebAuras = auras
		else
		lib.raidDebuffs(self)
		self.DrkIndicators = true
		lib.createIndicators(self)
		lib.createAuraWatch(self)
		end
		if (playerClass == "MONK") then
		self.DrkIndicators = true
		lib.createIndicators(self)
		lib.createAuraWatch(self)
		end
		self.Health.PostUpdate = lib.PostUpdateRaidFrame
		self:RegisterEvent('PLAYER_TARGET_CHANGED', lib.ChangedTarget)
		self:RegisterEvent('RAID_ROSTER_UPDATE', lib.ChangedTarget)
		self:RegisterEvent("UNIT_THREAT_LIST_UPDATE", lib.UpdateThreat)
		self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", lib.UpdateThreat)
	end
  -----------------------------
  -- SPAWN UNITS
  -----------------------------

oUF:RegisterStyle('Viks', GlobalStyle)
oUF:RegisterStyle('ViksGroup', GroupGlobalStyle)
oUF:RegisterStyle('Boss', CreateBossStyle)
oUF:RegisterStyle('ViksTank', tankStyle)
oUF:RegisterStyle("oUF_MT", CreateMTStyle)
oUF:RegisterStyle("raid25", CreateRaid25Style)

oUF:Factory(function(self)
	-- Single Frames
	self:SetActiveStyle('Viks')
	if cfg.HealFrames then
		local player = self:Spawn("player", "oUF_Player")
		player:SetPoint("BOTTOM", Anchorviksplayer)
		local target = self:Spawn('target')
		target:SetPoint("BOTTOM", Anchorvikstarget)
		if cfg.showtot then 
		local targettarget = self:Spawn('targettarget')
		targettarget:SetPoint("BOTTOM", Anchorvikstot)	
		end
		if cfg.showpet then 
		local pet = self:Spawn('pet')
		pet:SetPoint("BOTTOM", Anchorvikspet)		
		end
		if cfg.showfocus then
		local focus = self:Spawn('focus')
		focus:SetPoint("BOTTOM", Anchorviksfocus) end		
		if cfg.showfocustarget then 
		local focustarget = self:Spawn('focustarget')
		focustarget:SetPoint("LEFT", oUF_ViksFocus, "RIGHT", 14, -3)
		end
	else
		local player = self:Spawn("player", "oUF_Player")
		player:SetPoint("BOTTOM", AnchorviksplayerDps)
		local target = self:Spawn('target')
		target:SetPoint("BOTTOM", AnchorvikstargetDps)
		if cfg.showtot then 
		local targettarget = self:Spawn('targettarget')
		targettarget:SetPoint("BOTTOM", AnchorvikstotDps)
		end
		if cfg.showpet then 
		local pet = self:Spawn('pet')
		pet:SetPoint("BOTTOM", AnchorvikspetDps)
		end
		if cfg.showfocus then
		local focus = self:Spawn('focus')
		focus:SetPoint("BOTTOM", AnchorviksfocusDps)
		end
		if cfg.showfocustarget then 
		local focustarget = self:Spawn('focustarget')
		focustarget:SetPoint("LEFT", oUF_ViksFocus, "RIGHT", 14, -3)
		end
	end	
	

	-- Boss frames
	--if cfg.showBossFrames then
		self:SetActiveStyle('Boss')
		local boss = {}
		for i = 1, MAX_BOSS_FRAMES do
		
			boss[i] = self:Spawn("boss"..i, "oUF_Boss"..i)
				if i == 1 then
					if cfg.HealFrames then
					boss[i]:SetPoint("TOP", Anchorviksboss)
					else
					boss[i]:SetPoint("TOP", AnchorviksbossDps)
					end
				else
					boss[i]:SetPoint("BOTTOMRIGHT", boss[i-1], "BOTTOMRIGHT", 0, 59)
				end
		end 
	--end
	
		-- Tank Frame
	if cfg.showTankFrames then
			oUF:SetActiveStyle("oUF_MT")
			local tank = oUF:SpawnHeader('oUF_MT', nil, 'raid',
				'oUF-initialConfigFunction', ([[
					self:SetWidth(%d)
					self:SetHeight(%d)
				]]):format(),
				'showRaid', true,
				'groupFilter', 'MAINTANK',
				'yOffset', 3,
				'point' , 'BOTTOM',
				'template', 'oUF_MainTank'
				)
				
		if cfg.HealFrames then
		tank:SetPoint("TOP", Anchorvikstank)
		else
		tank:SetPoint("TOP", AnchorvikstankDps)
		end	

		local maxGroups = 5
		if cfg.RaidShowAllGroups then maxGroups = 8 end

	-- Raid Frames
	if cfg.ShowRaid then
		-- Hide the Blizzard raid frames
		CompactRaidFrameManager:UnregisterAllEvents()
		CompactRaidFrameManager:Hide()
		CompactRaidFrameContainer:UnregisterAllEvents()
		CompactRaidFrameContainer:Hide()

		self:SetActiveStyle('ViksGroup')
		--local raid10 = oUF:SpawnHeader("oUF_Raid10", nil, "custom [@raid11,exists] show; hide", -- Raid frames for 1-10 players.
		local raid10 = oUF:SpawnHeader("oUF_Raid10", nil, "custom [@raid11,exists] hide; [nogroup:raid,group:party,@raid1,exists] show; [@player,exists] show; hide", -- Raid frames for 1-10 players.
		"showRaid", true,  
		"showPlayer", true,
		"showSolo", cfg.RaidShowSolo,
		"showParty", cfg.ShowParty,
		"xoffset", 8,
		"yOffset", -8,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"sortMethod", "NAME", --// "INDEX" or "NAME"
		"maxColumns", maxGroups,
		"unitsPerColumn", 5,
		"columnSpacing", 5,
		"point", "LEFT",
		"columnAnchorPoint", "BOTTOM",
		"oUF-initialConfigFunction", ([[
		self:SetWidth(%d)
		self:SetHeight(%d)
		]]):format(cfg.unit_size.Raid10H.w,cfg.unit_size.Raid10H.h))
		raid10:SetPoint("BOTTOM", Anchorviksraid, 0, -30)
	if cfg.HealFrames then
		self:SetActiveStyle('raid25')
		--self:SetActiveStyle('ViksGroup')
		local raid25 = oUF:SpawnHeader("oUF_Raid25", nil, "custom [@raid26,exists] hide; [@raid11,exists] show; hide", -- Raid frames for 11-25 players.	
		--local raid25 = oUF:SpawnHeader("oUF_Raid25", nil, "custom [@player,exists] show; hide", -- Raid frames for 11-25 players.
		"showRaid", true,  
		"showPlayer", true,
		"showSolo", cfg.RaidShowSolo,
		"showParty", cfg.ShowParty,
		"xoffset", 10,
		"yOffset", 5,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"sortMethod", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 5,
		"columnSpacing", 5,
		"point", "LEFT",
		"columnAnchorPoint", "Bottom",
		"oUF-initialConfigFunction", ([[
		self:SetWidth(%d)
		self:SetHeight(%d)
		]]):format(cfg.unit_size.Raid25H.w,cfg.unit_size.Raid25H.h))
		raid25:SetPoint("BOTTOM", Anchorviksraid, 0, -30)
		
		self:SetActiveStyle('raid25')
		local raid40 = oUF:SpawnHeader("oUF_Raid40", nil, "custom [@raid26,exists] show; hide", -- Raid frames for 26-40 players.
		"showRaid", true,  
		"showPlayer", true,
		"showSolo", cfg.RaidShowSolo,
		"showParty", cfg.ShowParty,
		"xoffset", 5,
		"yOffset", 0,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"sortMethod", "INDEX",
		"maxColumns", 8,
		"unitsPerColumn", 10,
		"columnSpacing", 2,
		"point", "LEFT",
		"columnAnchorPoint", "BOTTOM",
		"oUF-initialConfigFunction", ([[
		self:SetWidth(%d)
		self:SetHeight(%d)
		]]):format(cfg.unit_size.Raid40H.w,cfg.unit_size.Raid40H.h))
		raid40:SetPoint("BOTTOM", Anchorviksraid, 0, -50)
	else
	self:SetActiveStyle('raid25')
		local raid25 = oUF:SpawnHeader("oUF_Raid25", nil, "custom [@raid26,exists] hide; [@raid11,exists] show; hide", -- Raid frames for 11-25 players.
		"showRaid", true,  
		"showPlayer", true,
		"showSolo", cfg.RaidShowSolo,
		"showParty", cfg.ShowParty,
		"xoffset", 5,
		"yOffset", 5,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"sortMethod", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 10,
		"columnSpacing", 2,
		"point", "LEFT",
		"columnAnchorPoint", "Bottom",
		"oUF-initialConfigFunction", ([[
		self:SetWidth(%d)
		self:SetHeight(%d)
		]]):format(cfg.unit_size.Raid25.w,cfg.unit_size.Raid25.h))
		raid25:SetPoint("BOTTOM", Anchorviksraid, 0, -55)
		
		self:SetActiveStyle('raid25')		
		local raid40 = oUF:SpawnHeader("oUF_Raid40", nil, "custom [@raid26,exists] show; hide", -- Raid frames for 26-40 players.
		"showRaid", true,  
		"showPlayer", true,
		"showSolo", cfg.RaidShowSolo,
		"showParty", cfg.ShowParty,
		"xoffset", 5,
		"yOffset", 0,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"sortMethod", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 10,
		"columnSpacing", 2,
		"point", "LEFT",
		"columnAnchorPoint", "BOTTOM",
		"oUF-initialConfigFunction", ([[
		self:SetWidth(%d)
		self:SetHeight(%d)
		]]):format(cfg.unit_size.Raid40.w,cfg.unit_size.Raid40.h))
		raid40:SetPoint("BOTTOM", Anchorviksraid40dps, -30, 4)
	end
	
	
	end
end
end)


SlashCmdList["SHOW_BOSS"] = function()
    oUF_Boss1:Show(); oUF_Boss1.Hide = function() end oUF_Boss1.unit = "player"
    oUF_Boss2:Show(); oUF_Boss2.Hide = function() end oUF_Boss2.unit = "player"
    oUF_Boss3:Show(); oUF_Boss3.Hide = function() end oUF_Boss3.unit = "player"
    oUF_Boss4:Show(); oUF_Boss4.Hide = function() end oUF_Boss4.unit = "player"
end
SLASH_SHOW_BOSS1 = "/tboss" 

----------------------------------------------------------------------------------------
--	Testmode
----------------------------------------------------------------------------------------
local moving = false
SlashCmdList.TEST_UF = function(msg)
	if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return end
	if not moving then
			for _, frames in pairs({"oUF_ViksTarget", "oUF_ViksTargetTarget", "oUF_ViksPet", "oUF_ViksFocus", "oUF_ViksFocusTarget"}) do
			_G[frames].oldunit = _G[frames].unit
			_G[frames]:SetAttribute("unit", "player")
		end

			for i = 1, MAX_BOSS_FRAMES do
				_G["oUF_Boss"..i].Hide = function() end
				_G["oUF_Boss"..i].unit = "player"
				_G["oUF_Boss"..i]:Show()
				_G["oUF_Boss"..i]:UpdateAllElements()
			end

		moving = true

	else
		for _, frames in pairs({"oUF_ViksTarget", "oUF_ViksTargetTarget", "oUF_ViksPet", "oUF_ViksFocus", "oUF_ViksFocusTarget"}) do
			_G[frames]:SetAttribute("unit", _G[frames].oldunit)
		end

			for i = 1, MAX_BOSS_FRAMES do
				_G["oUF_Boss"..i].Hide = nil
			end
		moving = false
	end
end
SLASH_TEST_UF1 = "/testui"
SLASH_TEST_UF2 = "/??????"
SLASH_TEST_UF3 = "/testuf"
SLASH_TEST_UF4 = "/??????"