local T, C, L = unpack(ViksUI)
local addon, ns = ...
local cfg = CreateFrame("Frame")

	-----------------------------
	-- Media Defaults
	-----------------------------
local mediapath = "Interface\\AddOns\\ViksUI\\Media\\"
cfg.statusbar_texture = mediapath.."textures\\normTex"
cfg.powerbar_texture = mediapath.."textures\\normTex"
cfg.Textbar_texture = mediapath.."textures\\backdrop"
cfg.highlight_texture = mediapath.."textures\\raidbg"
cfg.debuffBorder = mediapath.."textures\\iconborder"
cfg.squarefont = mediapath.."Font\\squares.ttf"
cfg.font = C.unitframe.UFfont
cfg.symbol = mediapath.."Font\\symbol.ttf"
cfg.symbols2 = mediapath.."Font\\PIZZADUDEBULLETS.ttf"
cfg.fontsize = 12
cfg.raidmarkicon = mediapath.."Other\\raidicons"
cfg.hordepvpico = mediapath.."Other\\Horde"									-- Icon to show for PVP Horde Side.
cfg.alliancepvpico = mediapath.."Other\\Alliance"								-- Icon to show for PVP Horde Side.
cfg.combatico = mediapath.."Other\\combat2"									-- Setting the icon to show when in combat on unitframe
cfg.restico = mediapath.."Other\\resting"										-- Setting the icon to show when in resting on unitframe. Credit to Karma for the icon.
cfg.oUFfont = C.unitframe.UFNamefont								-- Font to use on Names
cfg.shadowedge = mediapath.."Other\\glowTex"
cfg.backdropcolor = C.media.backdrop_color
cfg.bordercolor = C.media.border_color
cfg.aurasize = C.unitframe.aurasize								-- Aura Size for indicator type 2
cfg.insideAlpha = C.unitframe.insideAlpha						-- Alpha when Unitframe is in range	
cfg.outsideAlpha = C.unitframe.outsideAlpha						-- Alpha when Unitframe is out of range
cfg.pixelfont = mediapath.."Font\\pixel.ttf"							-- Pixelfont, working on adding this atm!


	-----------------------------
	-- Enable / disable parts (true/false)
	-----------------------------
cfg.ShowRaid = C.unitframe.ShowRaid								-- Show Raid Frames
cfg.portraitHPbar = C.unitframe.showPortraitHPbar				-- show portraits on Healthbar
cfg.showPortrait = C.unitframe.showPortrait						-- show portraits Icon
cfg.portrait_type = C.unitframe.portrait_type					-- Type of portraits (3D, 2D, ICONS, OVERLAY)
cfg.HealFrames = C.unitframe.HealFrames							-- Healing layout/positions
cfg.HealthcolorClass = C.unitframe.HealthcolorClass				-- health color = class color
cfg.showLFDIcons = C.unitframe.showLFDIcons						-- Show LFD Icons, must be true to show the other 2 options. False on next 2 to show default icons.
cfg.customLFDIcons = C.unitframe.customLFDIcons					-- Use Custom Icons; cfg.customLFDText must be false
cfg.customLFDText = C.unitframe.customLFDText					-- Use Text instead of Icon; Tank/Dps/Heal. cfg.customLFDIcons must be false
cfg.RCheckIcon = C.unitframe.RCheckIcon							-- Show Ready Check Icons On Health Frames
cfg.Experiencebar = C.unitframe.plugins_experience_bar			-- show experience bar
cfg.Reputationbar = C.unitframe.plugins_reputation_bar			-- show reputation bar
cfg.enableDebuffHighlight = C.unitframe.enableDebuffHighlight	-- Highlight Unit Frame if having a Debuffs
cfg.showIndicators = C.unitframe.showIndicators					-- Show Indicators on frames
cfg.plugins_healcomm = C.unitframe.plugins_healcomm				-- Show incoming heals in player and raid frames
cfg.Castbars = C.unitframe.Castbars								-- Show built-in castbars
cfg.debuffsOnlyShowPlayer = C.unitframe.debuffsOnlyShowPlayer 	-- only show your debuffs on target
cfg.buffsOnlyShowPlayer = C.unitframe.buffsOnlyShowPlayer 		-- only show your buffs
cfg.plugins_aura_watch = C.unitframe.plugins_aura_watch 				-- Shows debuff as icon on your raid frames
cfg.scale = 1
cfg.showPlayerAuras = C.unitframe.showPlayerAuras				-- use a custom player buffs/debuffs frame instead of blizzard's default
cfg.Powercolor = C.unitframe.Powercolor							-- power color = class color

cfg.showEclipsebar = C.unitframe_class_bar.eclipse				-- Eclipse bar
cfg.showShardbar = C.unitframe_class_bar.shard					-- Shard/Burning bar
cfg.showHolybar = C.unitframe_class_bar.holy					-- Holy Power bar
cfg.showRunebar = C.unitframe_class_bar.rune					-- Rune bar
cfg.showHarmony = C.unitframe_class_bar.chi						-- Chi bar
cfg.showShadowOrbsBar = C.unitframe_class_bar.shadow			-- Shadow Orbs bar
cfg.TotemBars = C.unitframe_class_bar.totem						-- Totem bar
cfg.showArcaneChargesbar = C.unitframe_class_bar.arcane			-- show Mage Arcane Charges bar
cfg.showVengeance = C.unitframe_class_bar.vengeance				-- Vengeance bar
cfg.class_bar_range = C.unitframe_class_bar.range				-- Range bar (only for Priest)
cfg.ComboPoints = C.unitframe_class_bar.combo					-- Rogue/Druid Combo bar
cfg.IndicatorIcons2 = C.unitframe.IndicatorIcons2				-- Toggles different Indicator types.
cfg.RaidShowAllGroups = C.unitframe.RaidShowAllGroups			-- Show All 8 Raid Groups, if not then 5
cfg.RaidShowSolo = C.unitframe.RaidShowSolo						-- show raid frames even when solo
cfg.ShowParty = C.unitframe.ShowParty							-- show party frames (shown as 5man raid)
cfg.showtot = C.unitframe.showtot								-- show target of target frame
cfg.showpet = C.unitframe.showpet								-- show pet frame 
cfg.showfocus = C.unitframe.showfocus							-- show focus frame
cfg.showfocustarget = C.unitframe.showfocustarget				-- show focus targets frame		
cfg.showBossFrames = C.unitframe.showBossFrames					-- show boss frame
cfg.showTankFrames = C.unitframe.MTFrames						-- show main tank frames			
cfg.indicatorsize = C.unitframe.indicatorsize					-- Size on Squares on Indicator type 2
cfg.symbolsize = C.unitframe.symbolsize							-- Size on Symbols on Indicator type 2
cfg.fontsizeEdge = C.unitframe.fontsizeEdge
cfg.Findoutline = C.unitframe.Findoutline
cfg.show_target = true
cfg.show_pet = true




cfg.ABspacing = 59
cfg.showarena = false

--Flytt denne til move.lua
	-----------------------------
	-- Frames Size and Positions
	-----------------------------
 cfg.unit_size = { 			
             Portrait = { w=   C.unitframe.Portrait_w, 	h= C.unitframe.Portrait_h},  
               Player = { w=  C.unitframe.Player_w, 	h= C.unitframe.Player_h},  
               Target = { w=  C.unitframe.Target_w, 	h= C.unitframe.Target_h},  
         Targettarget = { w=  C.unitframe.Targettarget_w, 	h= C.unitframe.Targettarget_h},  
                Focus = { w=  C.unitframe.Focus_w, 	h= C.unitframe.Focus_h},  
          Focustarget = { w=  C.unitframe.Focustarget_w, 	h= C.unitframe.Focustarget_h},  
                  Pet = { w=  C.unitframe.Pet_w, 	h= C.unitframe.Pet_h},
            PetTarget = { w=   C.unitframe.PetTarget_w, 	h= C.unitframe.PetTarget_h}, 				  
                 Boss = { w=  C.unitframe.Boss_w,	h= C.unitframe.Boss_h},  
                 Tank = { w=  C.unitframe.Tank_w, 	h= C.unitframe.Tank_h},
                TankH = { w=  C.unitframe.TankH_w, 	h= C.unitframe.TankH_h},				 
              Raid10H = { w=  C.unitframe.Raid10H_w, 	h= C.unitframe.Raid10H_h},
              Raid25H = { w=   C.unitframe.Raid25H_w, 	h= C.unitframe.Raid25H_h},		
			   Raid25 = { w=   C.unitframe.Raid25_w, 	h= C.unitframe.Raid25_h},
              Raid40H = { w=   C.unitframe.Raid40H_w, 	h= C.unitframe.Raid40H_h},
               Raid40 = { w=   C.unitframe.Raid40_w, 	h= C.unitframe.Raid40_h},				  
	            Party = { w=  C.unitframe.Party_w,	h= C.unitframe.Party_h},
                Arena = { w=  C.unitframe.Arena_w, 	h= C.unitframe.Arena_h},
		CastbarPlayer = { w=   	C.unitframe.CastbarPlayer_w, 	h= C.unitframe.CastbarPlayer_h},		--Only Hight	
		CastbarTarget = { w=   	C.unitframe.CastbarTarget_w, 	h= C.unitframe.CastbarTarget_h},		--Only Hight
		 CastbarArena = { w=   	C.unitframe.CastbarArena_w, 	h= C.unitframe.CastbarArena_h},		--Only Hight
		  CastbarBoss = { w=   	C.unitframe.CastbarBoss_w, 	h= C.unitframe.CastbarBoss_h},		--Only Hight
		 CastbarFocus = { w=   	C.unitframe.CastbarFocus_w, 	h= C.unitframe.CastbarFocus_h},		--Only Hight		  
}

--Position if healframes
 cfg.unit_positionsH = { 				
             Player = { x= -270, y=   305},  
             Target = { x=	270, y=   305},  
       Targettarget = { x=  560, y=   200},  
              Focus = { x=  196, y=   230},  
                Pet = { x=	  0, y=   289},  
               Boss = { x= -100, y=   -90},  
               Tank = { x=	  0, y=     0},  
               Raid = { x=	  0, y=   150},   
	          Party = { x=	  0, y=     0},
              Arena = { x= 	  0, y=     0},
           PCastbar = { x= 	  0, y=     0},
           TCastbar = { x= 	  0, y=     0},
           FCastbar = { x= 	  0, y=     0},	
           ACastbar = { x= 	  0, y=     0},			   
}
--Positions if not Healframes
 cfg.unit_positions = { 				
             Player = { x= -158, y=   320},  
             Target = { x=	158, y=   320},  
       Targettarget = { x=    0, y=   259},  
              Focus = { x=  430, y=   382},  
                Pet = { x=	  0, y=   289},  
               Boss = { x= -100, y=   -90},  
               Tank = { x=	  0, y=     0},  
               Raid = { x=	  0, y=   180},   
	          Party = { x=	  0, y=     0},
              Arena = { x= 	  0, y=     0},	
           PCastbar = { x= 	 32, y=    -2},
           TCastbar = { x= 	 -4, y=    -2},
           FCastbar = { x= 	 -5, y=   -12},
           ACastbar = { x= 	 -6, y=   -2},		   
}
	-----------------------------
	-- Debuff List
	-----------------------------
	
-- Credit to oUF_Drk Fanupdate for the idea on creating this.
------------------------------------------------------------------------------------------------
-- Indicator list to show on raid frames. These are tags that have to be created inside tag.lua
------------------------------------------------------------------------------------------------
	cfg.IndicatorList = {
		["NUMBERS"] = {
			--["DEATHKNIGHT"] 	= ,
			--["DRUID"]			= "[Druid:Innervate][Druid:Ironbark][Druid:Lifebloom][Druid:Rejuv][Druid:Germination][Druid:Regrowth]",
			--["HUNTER"]			= "[Hunter:Misdirection]",
			--["MAGE"]			= ,
			--["MONK"]			= "[Monk:EnvelopingMist][Monk:RenewingMist]",
			--["PALADIN"]		= ,
			--["PRIEST"]			= "[Priest:Renew][Priest:Atonement][Priest:ClarityOfWill][Priest:PowerWordShield][Priest:PrayerOfMending]",
			--["ROGUE"]			= tricks,
			--["SHAMAN"]			= "[Shaman:Riptide]",
			--["WARLOCK"]		= ,
			--["WARRIOR"]		= ,
		},
		["SQUARE"] = {
			--["DEATHKNIGHT"] 	= ,
			--["DRUID"]			= "[Druid:WildGrowth]",
			--["HUNTER"]		= ,
			--["MAGE"]			= ,
			--["MONK"]			= "[Monk:LifeCocoon][Monk:SoothingMist]",
			--["PALADIN"]			= "[Paladin:Forbearance][Paladin:Beacon][Paladin:BeaconOfFaith]",
			--["PRIEST"]		= ,
			--["ROGUE"]			= ,
			--["SHAMAN"]		= ,
			--["WARLOCK"]		= ,
			--["WARRIOR"]		= ,
		},
	}
	
------------------------------------------------------------------------------------------------
-- Aura Watch list to show on raid frames. Add the spell id below to add it.
------------------------------------------------------------------------------------------------
	cfg.AuraWatchList = T.RaidBuffs -- List of all buffs you want to watch on raid frames, sorted by class

	cfg.DebuffWatchList = {
		debuffs = T.RaidDebuffs

}



cfg.spec = nil
cfg.updateSpec = function()
	cfg.spec = GetSpecialization()
end
------------------------------------------------------------------

--Hand it over :)	
ns.cfg = cfg
