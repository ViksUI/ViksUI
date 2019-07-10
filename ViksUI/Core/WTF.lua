local T, C, L, _ = unpack(select(2, ...))
----------------------------------------------------------------------------------------
--	MSBT settings
----------------------------------------------------------------------------------------
local UploadMSBT = function()
	if MSBTProfiles_SavedVars then table.wipe(MSBTProfiles_SavedVars) end
	if MSBT_SavedMedia then table.wipe(MSBT_SavedMedia) end
	MSBTProfiles_SavedVars = {
		["profiles"] = {
			["Default"] = {
				["powerThrottleDuration"] = 5,
				["normalOutlineIndex"] = 2,
				["partialColoringDisabled"] = true,
				["alwaysShowQuestItems"] = false,
				["hideFullOverheals"] = true,
				["normalFontSize"] = 16,
				["scrollAreas"] = {
					["Incoming"] = {
						["scrollHeight"] = 250,
						["offsetX"] = -215,
						["animationStyle"] = "Straight",
						["behavior"] = "MSBT_NORMAL",
						["offsetY"] = 151,
						["skillIconsDisabled"] = true,
						["direction"] = "Up",
					},
					["Outgoing"] = {
						["scrollHeight"] = 250,
						["offsetX"] = 174,
						["animationStyle"] = "Straight",
						["behavior"] = "MSBT_NORMAL",
						["offsetY"] = 151,
						["skillIconsDisabled"] = true,
						["direction"] = "Up",
					},
					["Notification"] = {
						["offsetX"] = -176,
						["offsetY"] = 201,
					},
					["Static"] = {
						["offsetX"] = -7,
						["offsetY"] = -33,
					},
				},
				["soundsDisabled"] = true,
				["hideMergeTrailer"] = true,
				["triggers"] = {
					["MSBT_TRIGGER_RIPOSTE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_KILL_SHOT"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_DECIMATION"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_BACKLASH"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_OVERPOWER"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_SWORD_AND_BOARD"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_RAMPAGE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_RIME"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_THE_ART_OF_WAR"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_RUNE_STRIKE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_PREDATORS_SWIFTNESS"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_ECLIPSE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_TASTE_FOR_BLOOD"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_LOW_HEALTH"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_LOCK_AND_LOAD"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_TIDAL_WAVES"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_VIPER_STING"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_NIGHTFALL"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_HOT_STREAK"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_LOW_MANA"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_SUDDEN_DEATH"] = {
						["disabled"] = true,
					},
					["MSBT_TRIGGER_IMPACT"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_OWLKIN_FRENZY"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_BRAIN_FREEZE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_ERADICATION"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_LOW_PET_HEALTH"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_KILLING_MACHINE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_PVP_TRINKET"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_MISSILE_BARRAGE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_VICTORY_RUSH"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_BLOODSURGE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_CLEARCASTING"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_MOLTEN_CORE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_FINGERS_OF_FROST"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_COUNTER_ATTACK"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_HAMMER_OF_WRATH"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_REVENGE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_EXECUTE"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["MSBT_TRIGGER_FROSTBITE"] = {
						["disabled"] = true,
					},
					["MSBT_TRIGGER_MAELSTROM_WEAPON"] = {
						["disabled"] = true,
					},
				},
				["regenAbilitiesDisabled"] = true,
				["critFontName"] = "ViksUI",
				["hotThrottleDuration"] = 5,
				["critOutlineIndex"] = 2,
				["animationSpeed"] = 140,
				["skillIconsDisabled"] = true,
				["dotThrottleDuration"] = 5,
				["creationVersion"] = "5.4.75",
				["critFontSize"] = 16,
				["hideSkills"] = true,
				["events"] = {
					["NOTIFICATION_COMBAT_ENTER"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_PC_KILLING_BLOW"] = {
						["disabled"] = true,
						["fontSize"] = false,
					},
					["NOTIFICATION_MONEY"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_REP_GAIN"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_DEBUFF_FADE"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_REP_LOSS"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_BUFF"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_LOOT"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_SOUL_SHARD_CREATED"] = {
						["disabled"] = true,
						["fontSize"] = false,
					},
					["OUTGOING_EVADE"] = {
						["fontSize"] = 16,
					},
					["NOTIFICATION_SKILL_GAIN"] = {
						["disabled"] = true,
					},
					["INCOMING_HEAL_CRIT"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_POWER_LOSS"] = {
						["disabled"] = true,
					},
					["OUTGOING_HEAL_CRIT"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_DEBUFF_STACK"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_ITEM_BUFF_FADE"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_EXPERIENCE_GAIN"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_BUFF_FADE"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_MONSTER_EMOTE"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_COMBAT_LEAVE"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_POWER_GAIN"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_CP_FULL"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["NOTIFICATION_ENEMY_BUFF"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_BUFF_STACK"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_EXTRA_ATTACK"] = {
						["disabled"] = true,
						["fontSize"] = false,
					},
					["NOTIFICATION_COOLDOWN"] = {
						["disabled"] = true,
						["fontSize"] = 16,
					},
					["NOTIFICATION_ITEM_BUFF"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_CP_GAIN"] = {
						["disabled"] = true,
					},
					["PET_OUTGOING_EVADE"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_HONOR_GAIN"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_DEBUFF"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_NPC_KILLING_BLOW"] = {
						["fontSize"] = false,
					},
				},
				["cooldownThreshold"] = 60,
				["hideNames"] = true,
				["normalFontName"] = "ViksUI",
				["healThreshold"] = 1000,
				["qualityExclusions"] = {
					true, -- [1]
				},
			},
		},
	}
	MSBT_SavedMedia = {
		["fonts"] = {
			["ViksUI"] = "Interface\\AddOns\\ViksUI\\Media\\Fonts\\Pixel.ttf",
		},
		["sounds"] = {
		},
	}
end

----------------------------------------------------------------------------------------
--	Skada settings
----------------------------------------------------------------------------------------
local UploadSkada = function()
	if SkadaDB then table.wipe(SkadaDB) end
SkadaDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["hasUpgraded"] = true,
	["profileKeys"] = {
		["Mørk - Quel'Thalas"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["modulesBlocked"] = {
				["CC"] = true,
				["Power"] = true,
			},
			["windows"] = {
				{
					["titleset"] = false,
					["barheight"] = 12,
					["classicons"] = false,
					["barslocked"] = true,
					["wipemode"] = "Overhealing",
					["y"] = 92,
					["x"] = -341,
					["name"] = "Threath",
					["barfontsize"] = 12,
					["point"] = "BOTTOMRIGHT",
					["spellschoolcolors"] = false,
					["modeincombat"] = "Threat",
					["roleicons"] = true,
					["mode"] = "Threat",
					["bartexture"] = "Armory",
					["buttons"] = {
						["report"] = false,
						["menu"] = false,
						["stop"] = false,
						["mode"] = false,
						["segment"] = false,
						["reset"] = false,
					},
					["enablebackground"] = true,
					["title"] = {
						["color"] = {
							["a"] = 0.8,
							["r"] = 0.1,
							["g"] = 0.1,
							["b"] = 0.3,
						},
						["fontsize"] = 11,
						["height"] = 10,
						["texture"] = "Aluminium",
					},
					["background"] = {
						["color"] = {
							["a"] = 0.2,
							["r"] = -0,
							["g"] = -0,
							["b"] = 0.5,
						},
						["bordertexture"] = "None",
						["borderthickness"] = 0,
						["height"] = 80,
					},
					["barwidth"] = 167,
				}, -- [1]
				{
					["point"] = "BOTTOMRIGHT",
					["barcolor"] = {
						["a"] = 1,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.8,
					},
					["classcolortext"] = false,
					["mode"] = "Healing",
					["scale"] = 1,
					["reversegrowth"] = false,
					["snapto"] = true,
					["barfontsize"] = 12,
					["modeincombat"] = "",
					["name"] = "Heal",
					["barslocked"] = true,
					["x"] = -341,
					["barorientation"] = 1,
					["enabletitle"] = true,
					["wipemode"] = "",
					["returnaftercombat"] = false,
					["barbgcolor"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["bartexture"] = "Armory",
					["set"] = "current",
					["buttons"] = {
						["segment"] = true,
						["menu"] = true,
						["mode"] = true,
						["report"] = true,
						["reset"] = true,
					},
					["barwidth"] = 167,
					["barspacing"] = -0,
					["hidden"] = false,
					["background"] = {
						["borderthickness"] = -0,
						["color"] = {
							["a"] = 0.2,
							["r"] = -0,
							["g"] = -0,
							["b"] = 0.5,
						},
						["height"] = 66,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
					["y"] = 5,
					["barfont"] = "Accidental Presidency",
					["title"] = {
						["fontsize"] = 11,
						["font"] = "Accidental Presidency",
						["borderthickness"] = 2,
						["color"] = {
							["a"] = 0.8,
							["r"] = 0.1,
							["g"] = 0.1,
							["b"] = 0.3,
						},
						["fontflags"] = "",
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Aluminium",
					},
					["classcolorbars"] = false,
					["display"] = "bar",
					["clickthrough"] = false,
					["barfontflags"] = "",
					["barheight"] = 12,
				}, -- [2]
				{
					["classcolortext"] = false,
					["barcolor"] = {
						["a"] = 1,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.8,
					},
					["barheight"] = 15,
					["clickthrough"] = false,
					["scale"] = 1,
					["reversegrowth"] = false,
					["modeincombat"] = "DPS",
					["barfontsize"] = 11,
					["enabletitle"] = true,
					["name"] = "Dps",
					["barslocked"] = true,
					["x"] = 341.000020858108,
					["barorientation"] = 1,
					["mode"] = "DPS",
					["wipemode"] = "",
					["returnaftercombat"] = false,
					["barbgcolor"] = {
						["a"] = 0.6,
						["r"] = 0.3,
						["g"] = 0.3,
						["b"] = 0.3,
					},
					["buttons"] = {
						["segment"] = true,
						["menu"] = true,
						["mode"] = true,
						["report"] = true,
						["reset"] = true,
					},
					["bartexture"] = "BantoBar",
					["set"] = "current",
					["barwidth"] = 163,
					["barspacing"] = -0,
					["hidden"] = false,
					["background"] = {
						["borderthickness"] = -0,
						["color"] = {
							["a"] = 0.2,
							["r"] = -0,
							["g"] = -0,
							["b"] = 0.5,
						},
						["height"] = 162,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
					["y"] = 5,
					["barfont"] = "Accidental Presidency",
					["title"] = {
						["fontsize"] = 11,
						["font"] = "Accidental Presidency",
						["borderthickness"] = 2,
						["color"] = {
							["a"] = 0.8,
							["r"] = 0.1,
							["g"] = 0.1,
							["b"] = 0.3,
						},
						["fontflags"] = "",
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Aluminium",
					},
					["classcolorbars"] = false,
					["display"] = "bar",
					["snapto"] = true,
					["barfontflags"] = "",
					["point"] = "BOTTOMLEFT",
				}, -- [3]
			},
			["feed"] = "Damage: Raid DPS",
			["report"] = {
				["number"] = 6,
				["channel"] = "raid",
				["mode"] = "Healing",
			},
			["columns"] = {
				["Absorbs and healing_HPS"] = true,
			},
			["versions"] = {
				["1.6.3"] = true,
				["1.6.4"] = true,
				["1.6.7"] = true,
			},
		},
	},
}
end

local UploadBartender = function()

Bartender4DB = {
	["namespaces"] = {
		["StatusTrackingBar"] = {
		},
		["ActionBars"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["actionbars"] = {
						{
							["showgrid"] = true,
							["padding"] = 8,
							["version"] = 3,
							["position"] = {
								["y"] = 125,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
						}, -- [1]
						{
							["showgrid"] = true,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["fadeoutalpha"] = 0.3,
							["padding"] = 8,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["states"] = {
								["enabled"] = true,
								["default"] = 2,
							},
						}, -- [2]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 6,
							["hidemacrotext"] = true,
							["padding"] = 6,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
						}, -- [3]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["hidemacrotext"] = true,
							["padding"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
						}, -- [4]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["hidemacrotext"] = true,
							["padding"] = 3,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
						}, -- [5]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["rows"] = 6,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["padding"] = 11,
						}, -- [6]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["rows"] = 6,
							["padding"] = 11,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["showgrid"] = true,
						}, -- [7]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["hidemacrotext"] = true,
							["padding"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
						}, -- [8]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 6,
							["hidemacrotext"] = true,
							["padding"] = 6,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
						}, -- [9]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 7,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["position"] = {
								["y"] = 180,
								["x"] = -654.5,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [10]
					},
				},
				["ViksUIRogue"] = {
					["actionbars"] = {
						{
							["version"] = 3,
							["showgrid"] = true,
							["padding"] = 8,
							["position"] = {
								["y"] = 125,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["states"] = {
								["stance"] = {
									["ROGUE"] = {
										["stealth"] = 3,
									},
								},
							},
						}, -- [1]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["showgrid"] = true,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["padding"] = 8,
							["fadeoutalpha"] = 0.3,
							["states"] = {
								["enabled"] = true,
								["default"] = 2,
							},
						}, -- [2]
						{
							["enabled"] = false,
							["version"] = 3,
							["showgrid"] = true,
							["position"] = {
								["y"] = 116.5,
								["x"] = 0.4,
								["point"] = "LEFT",
								["scale"] = 0.8,
							},
							["padding"] = 9,
							["alpha"] = 0.5,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
						}, -- [3]
						{
							["version"] = 3,
							["showgrid"] = true,
							["position"] = {
								["y"] = 82,
								["x"] = 0.4,
								["point"] = "LEFT",
								["scale"] = 0.8,
							},
							["padding"] = 9,
							["alpha"] = 0.5,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
						}, -- [4]
						{
							["showgrid"] = true,
							["padding"] = 3,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["hidemacrotext"] = true,
							["rows"] = 2,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["buttons"] = 6,
						}, -- [5]
						{
							["version"] = 3,
							["showgrid"] = true,
							["rows"] = 12,
							["padding"] = 8,
							["position"] = {
								["y"] = 201.4,
								["x"] = -35,
								["point"] = "RIGHT",
								["scale"] = 0.76,
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
						}, -- [6]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 11,
							["rows"] = 6,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
						}, -- [7]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 2,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["hidemacrotext"] = true,
							["padding"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["buttons"] = 6,
						}, -- [8]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 6,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["hidemacrotext"] = true,
							["padding"] = 6,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["buttons"] = 6,
						}, -- [9]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 7,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["hidemacrotext"] = true,
							["padding"] = 6,
							["position"] = {
								["y"] = 180,
								["x"] = -654.5,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["buttons"] = 6,
						}, -- [10]
					},
				},
				["ViksUIRogueLine"] = {
					["actionbars"] = {
						{
							["version"] = 3,
							["showgrid"] = true,
							["padding"] = 8,
							["position"] = {
								["y"] = 125,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["states"] = {
								["stance"] = {
									["ROGUE"] = {
										["stealth"] = 3,
									},
								},
							},
						}, -- [1]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["showgrid"] = true,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["padding"] = 8,
							["fadeoutalpha"] = 0.3,
							["states"] = {
								["enabled"] = true,
								["default"] = 2,
							},
						}, -- [2]
						{
							["enabled"] = false,
							["version"] = 3,
							["showgrid"] = true,
							["position"] = {
								["scale"] = 0.8,
								["x"] = 0.4,
								["point"] = "LEFT",
								["y"] = 116.5,
							},
							["padding"] = 9,
							["alpha"] = 0.5,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
						}, -- [3]
						{
							["version"] = 3,
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["position"] = {
								["scale"] = 0.8,
								["x"] = 0.4,
								["point"] = "LEFT",
								["y"] = 82,
							},
							["padding"] = 9,
							["alpha"] = 0.5,
							["showgrid"] = true,
						}, -- [4]
						{
							["padding"] = 3,
							["position"] = {
								["scale"] = 0.75,
								["x"] = 279,
								["point"] = "BOTTOM",
								["y"] = 113,
							},
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["hidemacrotext"] = true,
							["rows"] = 2,
							["showgrid"] = true,
							["buttons"] = 6,
						}, -- [5]
						{
							["position"] = {
								["scale"] = 0.76,
								["x"] = -35,
								["point"] = "RIGHT",
								["y"] = 201.4,
							},
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["rows"] = 12,
							["padding"] = 8,
							["fadeout"] = true,
							["showgrid"] = true,
						}, -- [6]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 6,
							["version"] = 3,
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["padding"] = 11,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["fadeoutalpha"] = 0.3,
						}, -- [7]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 2,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 3,
							["hidemacrotext"] = true,
							["position"] = {
								["scale"] = 0.75,
								["x"] = -372,
								["point"] = "BOTTOM",
								["y"] = 112.5,
							},
							["buttons"] = 6,
						}, -- [8]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 6,
							["position"] = {
								["scale"] = 0.7,
								["x"] = 524,
								["point"] = "BOTTOM",
								["y"] = 188,
							},
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 6,
							["hidemacrotext"] = true,
							["fadeout"] = true,
							["buttons"] = 6,
						}, -- [9]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 7,
							["position"] = {
								["scale"] = 0.7,
								["x"] = -557,
								["point"] = "BOTTOM",
								["y"] = 188,
							},
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 6,
							["hidemacrotext"] = true,
							["fadeout"] = true,
							["buttons"] = 6,
						}, -- [10]
					},
				},
				["ViksUI"] = {
					["actionbars"] = {
						{
							["version"] = 3,
							["showgrid"] = true,
							["padding"] = 8,
							["position"] = {
								["y"] = 125,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["states"] = {
								["stance"] = {
									["ROGUE"] = {
										["stealth"] = 3,
									},
								},
							},
						}, -- [1]
						{
							["showgrid"] = true,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["fadeoutalpha"] = 0.3,
							["padding"] = 8,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["states"] = {
								["enabled"] = true,
								["default"] = 2,
							},
						}, -- [2]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 9,
							["alpha"] = 0.5,
							["position"] = {
								["y"] = 116.5,
								["x"] = 0.4,
								["point"] = "LEFT",
								["scale"] = 0.8,
							},
						}, -- [3]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 9,
							["alpha"] = 0.5,
							["position"] = {
								["y"] = 82,
								["x"] = 0.4,
								["point"] = "LEFT",
								["scale"] = 0.8,
							},
						}, -- [4]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["version"] = 3,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["rows"] = 2,
							["hidemacrotext"] = true,
							["padding"] = 3,
							["showgrid"] = true,
						}, -- [5]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["padding"] = 8,
							["position"] = {
								["y"] = 201.4,
								["x"] = -35,
								["point"] = "RIGHT",
								["scale"] = 0.76,
							},
							["rows"] = 12,
						}, -- [6]
						{
							["enabled"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["rows"] = 6,
							["padding"] = 11,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["showgrid"] = true,
						}, -- [7]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 2,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["padding"] = 3,
						}, -- [8]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 6,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [9]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 7,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["position"] = {
								["y"] = 180,
								["x"] = -654.5,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [10]
					},
				},
				["ViksUILine"] = {
					["actionbars"] = {
						{
							["showgrid"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 125,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["padding"] = 8,
							["states"] = {
								["stance"] = {
									["ROGUE"] = {
										["stealth"] = 3,
									},
								},
							},
						}, -- [1]
						{
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["fadeoutalpha"] = 0.3,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["padding"] = 8,
							["states"] = {
								["enabled"] = true,
								["default"] = 2,
							},
						}, -- [2]
						{
							["showgrid"] = true,
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["alpha"] = 0.5,
							["version"] = 3,
							["position"] = {
								["y"] = 116.5,
								["x"] = 0.4,
								["point"] = "LEFT",
								["scale"] = 0.8,
							},
							["padding"] = 9,
						}, -- [3]
						{
							["showgrid"] = true,
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["alpha"] = 0.5,
							["version"] = 3,
							["position"] = {
								["y"] = 82,
								["x"] = 0.4,
								["point"] = "LEFT",
								["scale"] = 0.8,
							},
							["padding"] = 9,
						}, -- [4]
						{
							["showgrid"] = true,
							["rows"] = 2,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["padding"] = 3,
							["version"] = 3,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["hidemacrotext"] = true,
						}, -- [5]
						{
							["showgrid"] = true,
							["rows"] = 12,
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["position"] = {
								["y"] = 201.4,
								["x"] = -35,
								["point"] = "RIGHT",
								["scale"] = 0.76,
							},
							["padding"] = 8,
						}, -- [6]
						{
							["showgrid"] = true,
							["rows"] = 6,
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["version"] = 3,
							["fadeoutalpha"] = 0.3,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["padding"] = 11,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
						}, -- [7]
						{
							["showgrid"] = true,
							["rows"] = 2,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["buttons"] = 6,
							["padding"] = 3,
							["version"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["hidemacrotext"] = true,
						}, -- [8]
						{
							["showgrid"] = true,
							["rows"] = 6,
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 187,
								["x"] = 524,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [9]
						{
							["showgrid"] = true,
							["rows"] = 7,
							["fadeout"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 188,
								["x"] = -557,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [10]
					},
				},
				["ViksUIDruidLine"] = {
					["actionbars"] = {
						{
							["showgrid"] = true,
							["padding"] = 8,
							["version"] = 3,
							["position"] = {
								["y"] = 125,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
						}, -- [1]
						{
							["showgrid"] = true,
							["version"] = 3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["fadeoutalpha"] = 0.3,
							["padding"] = 8,
							["position"] = {
								["y"] = 82,
								["x"] = -265.5,
								["point"] = "BOTTOM",
							},
							["states"] = {
								["enabled"] = true,
								["default"] = 2,
							},
						}, -- [2]
						{
							["showgrid"] = true,
							["rows"] = 6,
							["buttons"] = 6,
							["fadeout"] = true,
							["position"] = {
								["scale"] = 0.7,
								["x"] = 524,
								["point"] = "BOTTOM",
								["y"] = 188,
							},
							["version"] = 3,
							["padding"] = 6,
							["hidemacrotext"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
						}, -- [3]
						{
							["position"] = {
								["scale"] = 0.75,
								["x"] = -372,
								["point"] = "BOTTOM",
								["y"] = 112.5,
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["padding"] = 3,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [4]
						{
							["position"] = {
								["scale"] = 0.75,
								["x"] = 279,
								["point"] = "BOTTOM",
								["y"] = 113,
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["padding"] = 3,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [5]
						{
							["version"] = 3,
							["showgrid"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["rows"] = 6,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["padding"] = 11,
						}, -- [6]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["rows"] = 6,
							["padding"] = 11,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["showgrid"] = true,
						}, -- [7]
						{
							["position"] = {
								["scale"] = 0.75,
								["x"] = -372,
								["point"] = "BOTTOM",
								["y"] = 112.5,
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 2,
							["padding"] = 3,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [8]
						{
							["position"] = {
								["scale"] = 0.7,
								["x"] = 624,
								["point"] = "BOTTOM",
								["y"] = 180,
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
							["buttons"] = 6,
							["rows"] = 6,
							["padding"] = 6,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [9]
						{
							["enabled"] = true,
							["showgrid"] = true,
							["rows"] = 7,
							["buttons"] = 6,
							["fadeout"] = true,
							["position"] = {
								["scale"] = 0.7,
								["x"] = -557,
								["point"] = "BOTTOM",
								["y"] = 188,
							},
							["version"] = 3,
							["padding"] = 6,
							["hidemacrotext"] = true,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
						}, -- [10]
					},
				},
			},
		},
		["APBar"] = {
		},
		["LibDualSpec-1.0"] = {
		},
		["ExtraActionBar"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["position"] = {
						["y"] = 47,
						["x"] = 150,
						["point"] = "CENTER",
						["scale"] = 1.5,
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogue"] = {
					["position"] = {
						["y"] = 47,
						["x"] = 150,
						["point"] = "CENTER",
						["scale"] = 1.5,
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogueLine"] = {
					["position"] = {
						["scale"] = 1.5,
						["x"] = 150,
						["point"] = "CENTER",
						["y"] = 47,
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUI"] = {
					["position"] = {
						["y"] = 47,
						["x"] = 150,
						["point"] = "CENTER",
						["scale"] = 1.5,
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUILine"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["position"] = {
						["y"] = 47,
						["x"] = 150,
						["point"] = "CENTER",
						["scale"] = 1.5,
					},
				},
				["ViksUIDruidLine"] = {
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["version"] = 3,
					["position"] = {
						["scale"] = 1.5,
						["x"] = 150,
						["point"] = "CENTER",
						["y"] = 47,
					},
				},
			},
		},
		["ZoneAbilityBar"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["version"] = 3,
					["position"] = {
						["y"] = -40.7500305175781,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUIRogue"] = {
					["version"] = 3,
					["position"] = {
						["y"] = -40.7500305175781,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["position"] = {
						["y"] = -40.7500305175781,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = -40.7499389648438,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUILine"] = {
					["position"] = {
						["y"] = -40.7499389648438,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
					["version"] = 3,
				},
				["ViksUIDruidLine"] = {
					["version"] = 3,
					["position"] = {
						["y"] = -40.7500305175781,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
				},
			},
		},
		["MicroMenu"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["fadeoutalpha"] = 0,
					["fadeout"] = true,
					["position"] = {
						["y"] = 222,
						["x"] = -306,
						["point"] = "BOTTOMRIGHT",
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutdelay"] = 0.69,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["version"] = 3,
				},
				["ViksUIRogue"] = {
					["version"] = 3,
					["fadeoutalpha"] = 0,
					["position"] = {
						["y"] = 222,
						["x"] = -306,
						["point"] = "BOTTOMRIGHT",
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutdelay"] = 0,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["fadeout"] = true,
				},
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutdelay"] = 0,
					["position"] = {
						["y"] = 150,
						["x"] = -65,
						["point"] = "RIGHT",
					},
					["fadeoutalpha"] = 0,
					["rows"] = 11,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["fadeout"] = true,
				},
				["ViksUI"] = {
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["version"] = 3,
					["visibility"] = {
						["custom"] = true,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["position"] = {
						["y"] = 222,
						["x"] = -306,
						["point"] = "BOTTOMRIGHT",
					},
				},
				["ViksUILine"] = {
					["rows"] = 11,
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["visibility"] = {
						["custom"] = true,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["position"] = {
						["y"] = 150,
						["x"] = -65,
						["point"] = "RIGHT",
						["scale"] = 0.800000011920929,
					},
				},
				["ViksUIDruidLine"] = {
					["fadeout"] = true,
					["position"] = {
						["y"] = 150,
						["x"] = -65,
						["point"] = "RIGHT",
					},
					["fadeoutalpha"] = 0,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutdelay"] = 0.69,
					["rows"] = 11,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["version"] = 3,
				},
			},
		},
		["XPBar"] = {
			["profiles"] = {
				["ViksUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 57,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
				},
				["ViksUIDruid"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 57,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
				},
				["ViksUIRogue"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 57,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
				},
			},
		},
		["MultiCast"] = {
			["profiles"] = {
				["ViksUI"] = {
					["enabled"] = false,
					["position"] = {
						["y"] = 35.0000026671023,
						["x"] = 284.333404478858,
						["point"] = "BOTTOMLEFT",
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
			},
		},
		["BlizzardArt"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
				["ViksUIRogue"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
				["ViksUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
				["ViksUILine"] = {
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
				["ViksUIDruidLine"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
			},
		},
		["Vehicle"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["position"] = {
						["y"] = 144.500122070313,
						["x"] = 315.5,
						["point"] = "CENTER",
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogue"] = {
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["version"] = 3,
					["position"] = {
						["y"] = 83.2500610351563,
						["x"] = 203.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUIRogueLine"] = {
					["position"] = {
						["y"] = 83.2500610351563,
						["x"] = 203.750122070313,
						["point"] = "CENTER",
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUI"] = {
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["version"] = 3,
					["position"] = {
						["y"] = 83.2500610351563,
						["x"] = 203.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUILine"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["position"] = {
						["y"] = 83.2500610351563,
						["x"] = 203.750122070313,
						["point"] = "CENTER",
					},
				},
				["ViksUIDruidLine"] = {
					["position"] = {
						["y"] = 144.500122070313,
						["x"] = 315.5,
						["point"] = "CENTER",
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
			},
		},
		["BagBar"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["enabled"] = false,
					["version"] = 3,
					["position"] = {
						["y"] = 41.75,
						["x"] = 463.5,
						["point"] = "BOTTOM",
					},
					["onebag"] = true,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogue"] = {
					["enabled"] = false,
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["onebag"] = true,
					["position"] = {
						["y"] = 41.75,
						["x"] = 463.5,
						["point"] = "BOTTOM",
					},
				},
				["ViksUIRogueLine"] = {
					["enabled"] = false,
					["version"] = 3,
					["position"] = {
						["y"] = 41.75,
						["x"] = 463.5,
						["point"] = "BOTTOM",
					},
					["onebag"] = true,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUI"] = {
					["enabled"] = false,
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["onebag"] = true,
					["position"] = {
						["y"] = 41.75,
						["x"] = 463.5,
						["point"] = "BOTTOM",
					},
				},
				["ViksUILine"] = {
					["enabled"] = false,
					["position"] = {
						["y"] = 41.75,
						["x"] = 463.5,
						["point"] = "BOTTOM",
					},
					["onebag"] = true,
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIDruidLine"] = {
					["enabled"] = false,
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["onebag"] = true,
					["position"] = {
						["y"] = 41.75,
						["x"] = 463.5,
						["point"] = "BOTTOM",
					},
				},
			},
		},
		["StanceBar"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 209,
						["x"] = 335,
						["point"] = "BOTTOMLEFT",
						["scale"] = 0.75,
					},
					["padding"] = 7,
					["visibility"] = {
						["custom"] = false,
						["always"] = false,
						["customdata"] = "[mod:ctrl]show;hide",
						["possess"] = false,
						["stance"] = {
							false, -- [1]
						},
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogue"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 238.249992370606,
						["x"] = 334.999969482422,
						["point"] = "BOTTOMLEFT",
						["scale"] = 0.75,
					},
					["padding"] = 7,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl]show;hide",
						["always"] = false,
						["possess"] = false,
						["stance"] = {
							false, -- [1]
						},
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["padding"] = 7,
					["visibility"] = {
						["custom"] = false,
						["possess"] = false,
						["always"] = false,
						["customdata"] = "[mod:ctrl]show;hide",
						["stance"] = {
							false, -- [1]
						},
					},
					["position"] = {
						["scale"] = 0.75,
						["x"] = 334.999969482422,
						["point"] = "BOTTOMLEFT",
						["y"] = 238.249992370606,
					},
				},
				["ViksUI"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["padding"] = 7,
					["visibility"] = {
						["custom"] = false,
						["possess"] = false,
						["always"] = false,
						["customdata"] = "[mod:ctrl]show;hide",
						["stance"] = {
							false, -- [1]
						},
					},
					["position"] = {
						["y"] = 238.249992370606,
						["x"] = 334.999969482422,
						["point"] = "BOTTOMLEFT",
						["scale"] = 0.75,
					},
				},
				["ViksUILine"] = {
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["version"] = 3,
					["padding"] = 7,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl]show;hide",
						["always"] = false,
						["possess"] = false,
						["stance"] = {
							false, -- [1]
						},
					},
					["position"] = {
						["y"] = 238.249992370606,
						["x"] = 334.999969482422,
						["point"] = "BOTTOMLEFT",
						["scale"] = 0.75,
					},
				},
				["ViksUIDruidLine"] = {
					["version"] = 3,
					["position"] = {
						["scale"] = 0.75,
						["x"] = 335,
						["point"] = "BOTTOMLEFT",
						["y"] = 209,
					},
					["padding"] = 7,
					["visibility"] = {
						["custom"] = false,
						["possess"] = false,
						["customdata"] = "[mod:ctrl]show;hide",
						["always"] = false,
						["stance"] = {
							false, -- [1]
						},
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
			},
		},
		["PetBar"] = {
			["profiles"] = {
				["ViksUIDruid"] = {
					["fadeoutalpha"] = 1,
					["version"] = 3,
					["position"] = {
						["y"] = 43.4560381037409,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["scale"] = 0.600000023841858,
					},
					["fadeoutdelay"] = 0.1,
					["padding"] = 15,
					["visibility"] = {
						["always"] = false,
						["possess"] = false,
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogue"] = {
					["fadeoutdelay"] = 0.1,
					["fadeoutalpha"] = 1,
					["position"] = {
						["y"] = 43.4560381037409,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["scale"] = 0.600000023841858,
					},
					["version"] = 3,
					["padding"] = 15,
					["visibility"] = {
						["possess"] = false,
						["always"] = false,
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogueLine"] = {
					["version"] = 3,
					["fadeoutalpha"] = 1,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["position"] = {
						["scale"] = 0.600000023841858,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["y"] = 43.4560381037409,
					},
					["padding"] = 15,
					["visibility"] = {
						["always"] = false,
						["possess"] = false,
					},
					["fadeoutdelay"] = 0.1,
				},
				["ViksUI"] = {
					["position"] = {
						["y"] = 43.4560381037409,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["scale"] = 0.600000023841858,
					},
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutdelay"] = 0.1,
					["padding"] = 15,
					["visibility"] = {
						["always"] = false,
						["possess"] = false,
					},
					["fadeoutalpha"] = 1,
				},
				["ViksUILine"] = {
					["version"] = 3,
					["fadeoutdelay"] = 0.1,
					["position"] = {
						["y"] = 43.4560381037409,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["scale"] = 0.600000023841858,
					},
					["fadeoutalpha"] = 1,
					["padding"] = 15,
					["visibility"] = {
						["always"] = false,
						["possess"] = false,
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIDruidLine"] = {
					["version"] = 3,
					["fadeoutdelay"] = 0.1,
					["position"] = {
						["scale"] = 0.600000023841858,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["y"] = 43.4560381037409,
					},
					["fadeoutalpha"] = 1,
					["padding"] = 15,
					["visibility"] = {
						["always"] = false,
						["possess"] = false,
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
			},
		},
		["RepBar"] = {
			["profiles"] = {
				["ViksUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 65,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
				},
				["ViksUIDruid"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 65,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
				},
				["ViksUIRogue"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 65,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
				},
			},
		},
	},
	["profiles"] = {
		["ViksUIDruid"] = {
			["onkeydown"] = false,
			["minimapIcon"] = {
				["hide"] = true,
			},
			["selfcastmodifier"] = false,
			["buttonlock"] = true,
		},
		["ViksUIRogue"] = {
			["onkeydown"] = true,
			["minimapIcon"] = {
				["hide"] = true,
			},
			["selfcastmodifier"] = false,
			["buttonlock"] = true,
		},
		["ViksUIRogueLine"] = {
			["onkeydown"] = true,
			["minimapIcon"] = {
				["hide"] = true,
			},
			["selfcastmodifier"] = false,
			["buttonlock"] = true,
		},
		["ViksUI"] = {
			["onkeydown"] = false,
			["selfcastmodifier"] = false,
			["minimapIcon"] = {
				["hide"] = true,
			},
			["buttonlock"] = true,
		},
		["ViksUILine"] = {
			["minimapIcon"] = {
				["hide"] = true,
			},
			["buttonlock"] = true,
			["onkeydown"] = false,
			["selfcastmodifier"] = false,
		},
		["ViksUIDruidLine"] = {
			["onkeydown"] = false,
			["minimapIcon"] = {
				["hide"] = true,
			},
			["selfcastmodifier"] = false,
			["buttonlock"] = true,
		},
	},
}
end
local UploadDetails = function()

_detalhes_global = {
	["death_recap"] = {
		["show_segments"] = false,
		["enabled"] = true,
		["show_life_percent"] = false,
		["relevance_time"] = 7,
	},
	["spell_pool"] = {
		[154253] = 3,
		[75] = 3,
		[34026] = 3,
		[176984] = 3,
		[131894] = 3,
		[19574] = 3,
		[5384] = 3,
		[131900] = 3,
		[186406] = 3,
	},
	["encounter_spell_pool"] = {
	},
	["report_where"] = "SAY",
	["got_first_run"] = true,
	["report_pos"] = {
		1, -- [1]
		1, -- [2]
	},
	["latest_report_table"] = {
	},
	["always_use_profile"] = true,
	["boss_mods_timers"] = {
		["encounter_timers_bw"] = {
		},
		["encounter_timers_dbm"] = {
		},
	},
	["spell_school_cache"] = {
	},
	["deathlog_healingdone_min"] = 1,
	["tutorial"] = {
		["unlock_button"] = 1,
		["main_help_button"] = 42,
		["FORGE_TUTORIAL"] = true,
		["SWITCH_PANEL_FIRST_OPENED"] = true,
		["alert_frames"] = {
			false, -- [1]
			false, -- [2]
			false, -- [3]
			false, -- [4]
			false, -- [5]
			false, -- [6]
		},
		["WINDOW_GROUP_MAKING1"] = true,
		["ATTRIBUTE_SELECT_TUTORIAL1"] = true,
		["logons"] = 42,
		["version_announce"] = 0,
		["ctrl_click_close_tutorial"] = false,
		["WINDOW_LOCK_UNLOCK1"] = true,
		["OPTIONS_PANEL_OPENED"] = true,
		["bookmark_tutorial"] = false,
	},
	["mythic_plus"] = {
		["make_overall_boss_only"] = false,
		["mythicrun_chart_frame"] = {
		},
		["merge_boss_trash"] = true,
		["delay_to_show_graphic"] = 5,
		["always_in_combat"] = false,
		["make_overall_when_done"] = true,
		["delete_trash_after_merge"] = true,
		["show_damage_graphic"] = true,
		["boss_dedicated_segment"] = true,
		["mythicrun_chart_frame_minimized"] = {
		},
		["last_mythicrun_chart"] = {
		},
	},
	["realm_sync"] = true,
	["createauraframe"] = {
		["y"] = 7.629394531250e-006,
		["x"] = -3.05175781250e-005,
		["point"] = "CENTER",
		["scale"] = 1,
	},
	["global_plugin_database"] = {
		["DETAILS_PLUGIN_ENCOUNTER_DETAILS"] = {
			["encounter_timers_bw"] = {
			},
			["encounter_timers_dbm"] = {
			},
		},
	},
	["update_warning_timeout"] = 10,
	["run_code"] = {
		["on_groupchange"] = "\n-- this code runs when the player enter or leave a group",
		["on_zonechanged"] = "\n-- when the player changes zone, this code will run",
		["on_init"] = "\n-- code to run when Details! initializes, put here code which only will run once\n-- this also will run then the profile is changed\n\n--size of the death log tooltip in the Deaths display (default 350)\nDetails.death_tooltip_width = 350;\n\n--when in arena or battleground, details! silently switch to activity time (goes back to the old setting on leaving, default true)\nDetails.force_activity_time_pvp = true;\n\n--speed of the bar animations (default 33)\nDetails.animation_speed = 33;\n\n--threshold to trigger slow or fast speed (default 0.45)\nDetails.animation_speed_mintravel = 0.45;\n\n--call to update animations\nDetails:RefreshAnimationFunctions();\n\n--max window size, does require a /reload to work (default 480 x 450)\nDetails.max_window_size.width = 480;\nDetails.max_window_size.height = 450;\n\n--use the arena team color as the class color (default true)\nDetails.color_by_arena_team = true;\n\n--use the role icon in the player bar when inside an arena (default false)\nDetails.show_arena_role_icon = false;\n\n--how much time the update warning is shown (default 10)\nDetails.update_warning_timeout = 10;",
		["on_leavecombat"] = "\n-- this code runs when the player leave combat",
		["on_specchanged"] = "\n-- run when the player changes its spec",
		["on_entercombat"] = "\n-- this code runs when the player enters in combat",
	},
	["switchSaved"] = {
		["slots"] = 21,
		["table"] = {
			{
				["atributo"] = 1,
				["sub_atributo"] = 1,
			}, -- [1]
			{
				["atributo"] = 2,
				["sub_atributo"] = 1,
			}, -- [2]
			{
				["atributo"] = 1,
				["sub_atributo"] = 6,
			}, -- [3]
			{
				["atributo"] = 4,
				["sub_atributo"] = 5,
			}, -- [4]
			{
				["atributo"] = 1,
				["sub_atributo"] = 2,
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
		},
	},
	["item_level_pool"] = {
	},
	["__profiles"] = {
		["ViksUI"] = {
			["show_arena_role_icon"] = false,
			["capture_real"] = {
				["heal"] = true,
				["spellcast"] = true,
				["miscdata"] = true,
				["aura"] = true,
				["energy"] = true,
				["damage"] = true,
			},
			["row_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["streamer_config"] = {
				["faster_updates"] = false,
				["quick_detection"] = false,
				["reset_spec_cache"] = false,
				["no_alerts"] = false,
				["disable_mythic_dungeon"] = false,
				["use_animation_accel"] = true,
			},
			["all_players_are_group"] = false,
			["use_row_animations"] = true,
			["report_heal_links"] = false,
			["remove_realm_from_name"] = true,
			["event_tracker"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["line_height"] = 16,
				["line_color"] = {
					0.1, -- [1]
					0.1, -- [2]
					0.1, -- [3]
					0.3, -- [4]
				},
				["font_shadow"] = "NONE",
				["font_size"] = 10,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = true,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["locked"] = false,
					["height"] = 300,
					["width"] = 250,
				},
				["line_texture"] = "Details Serenity",
				["options_frame"] = {
				},
			},
			["report_to_who"] = "",
			["class_specs_coords"] = {
				[62] = {
					0.251953125, -- [1]
					0.375, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[63] = {
					0.375, -- [1]
					0.5, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[250] = {
					0, -- [1]
					0.125, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[251] = {
					0.125, -- [1]
					0.25, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[252] = {
					0.25, -- [1]
					0.375, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[253] = {
					0.875, -- [1]
					1, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[254] = {
					0, -- [1]
					0.125, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[255] = {
					0.125, -- [1]
					0.25, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[66] = {
					0.125, -- [1]
					0.25, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[257] = {
					0.5, -- [1]
					0.625, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[258] = {
					0.6328125, -- [1]
					0.75, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[259] = {
					0.75, -- [1]
					0.875, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[260] = {
					0.875, -- [1]
					1, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[577] = {
					0.25, -- [1]
					0.375, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[262] = {
					0.125, -- [1]
					0.25, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[581] = {
					0.375, -- [1]
					0.5, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[264] = {
					0.375, -- [1]
					0.5, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[265] = {
					0.5, -- [1]
					0.625, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[266] = {
					0.625, -- [1]
					0.75, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[267] = {
					0.75, -- [1]
					0.875, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[268] = {
					0.625, -- [1]
					0.75, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[269] = {
					0.875, -- [1]
					1, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[270] = {
					0.75, -- [1]
					0.875, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[70] = {
					0.251953125, -- [1]
					0.375, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[102] = {
					0.375, -- [1]
					0.5, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[71] = {
					0.875, -- [1]
					1, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[103] = {
					0.5, -- [1]
					0.625, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[72] = {
					0, -- [1]
					0.125, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[104] = {
					0.625, -- [1]
					0.75, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[73] = {
					0.125, -- [1]
					0.25, -- [2]
					0.5, -- [3]
					0.625, -- [4]
				},
				[64] = {
					0.5, -- [1]
					0.625, -- [2]
					0.125, -- [3]
					0.25, -- [4]
				},
				[105] = {
					0.75, -- [1]
					0.875, -- [2]
					0, -- [3]
					0.125, -- [4]
				},
				[65] = {
					0, -- [1]
					0.125, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[256] = {
					0.375, -- [1]
					0.5, -- [2]
					0.25, -- [3]
					0.375, -- [4]
				},
				[261] = {
					0, -- [1]
					0.125, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
				[263] = {
					0.25, -- [1]
					0.375, -- [2]
					0.375, -- [3]
					0.5, -- [4]
				},
			},
			["profile_save_pos"] = true,
			["tooltip"] = {
				["header_statusbar"] = {
					0.3, -- [1]
					0.3, -- [2]
					0.3, -- [3]
					0.8, -- [4]
					false, -- [5]
					false, -- [6]
					"WorldState Score", -- [7]
				},
				["fontcolor_right"] = {
					1, -- [1]
					0.7, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["tooltip_max_targets"] = 2,
				["icon_size"] = {
					["W"] = 13,
					["H"] = 13,
				},
				["tooltip_max_pets"] = 2,
				["anchor_relative"] = "top",
				["abbreviation"] = 2,
				["anchored_to"] = 1,
				["show_amount"] = false,
				["header_text_color"] = {
					1, -- [1]
					0.9176, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["fontsize"] = 10,
				["background"] = {
					0.196, -- [1]
					0.196, -- [2]
					0.196, -- [3]
					0.8697, -- [4]
				},
				["submenu_wallpaper"] = true,
				["fontsize_title"] = 10,
				["fontcolor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["commands"] = {
				},
				["tooltip_max_abilities"] = 6,
				["fontface"] = "Friz Quadrata TT",
				["border_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["border_texture"] = "Details BarBorder 3",
				["anchor_offset"] = {
					0, -- [1]
					0, -- [2]
				},
				["fontshadow"] = false,
				["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
				["border_size"] = 14,
				["maximize_method"] = 1,
				["anchor_screen_pos"] = {
					507.7, -- [1]
					-350.5, -- [2]
				},
				["anchor_point"] = "bottom",
				["menus_bg_coords"] = {
					0.309777336120606, -- [1]
					0.924000015258789, -- [2]
					0.213000011444092, -- [3]
					0.279000015258789, -- [4]
				},
				["icon_border_texcoord"] = {
					["R"] = 0.921875,
					["L"] = 0.078125,
					["T"] = 0.078125,
					["B"] = 0.921875,
				},
				["menus_bg_color"] = {
					0.8, -- [1]
					0.8, -- [2]
					0.8, -- [3]
					0.2, -- [4]
				},
			},
			["ps_abbreviation"] = 3,
			["world_combat_is_trash"] = false,
			["update_speed"] = 0.2,
			["animation_speed_mintravel"] = 0.45,
			["track_item_level"] = true,
			["windows_fade_in"] = {
				"in", -- [1]
				0.2, -- [2]
			},
			["instances_menu_click_to_open"] = false,
			["overall_clear_newchallenge"] = true,
			["current_dps_meter"] = {
				["enabled"] = false,
				["font_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["arena_enabled"] = true,
				["font_shadow"] = "NONE",
				["font_size"] = 18,
				["mythic_dungeon_enabled"] = true,
				["sample_size"] = 5,
				["font_face"] = "Friz Quadrata TT",
				["frame"] = {
					["show_title"] = false,
					["strata"] = "LOW",
					["backdrop_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.2, -- [4]
					},
					["locked"] = false,
					["height"] = 65,
					["width"] = 220,
				},
				["update_interval"] = 0.3,
				["options_frame"] = {
				},
			},
			["data_cleanup_logout"] = false,
			["instances_disable_bar_highlight"] = false,
			["trash_concatenate"] = false,
			["color_by_arena_team"] = true,
			["animation_speed"] = 33,
			["disable_stretch_from_toolbar"] = false,
			["disable_lock_ungroup_buttons"] = false,
			["memory_ram"] = 64,
			["disable_window_groups"] = false,
			["instances_suppress_trash"] = 0,
			["animation_speed_maxtravel"] = 3,
			["instances_segments_locked"] = false,
			["deadlog_limit"] = 16,
			["font_faces"] = {
				["menus"] = "Friz Quadrata TT",
			},
			["instances_no_libwindow"] = false,
			["segments_amount"] = 18,
			["data_broker_text"] = "",
			["instances"] = {
				{
					["__snapV"] = false,
					["__pos"] = {
						["normal"] = {
							["y"] = -498.499908447266,
							["x"] = 539.001220703125,
							["w"] = 174.000625610352,
							["h"] = 77.0000915527344,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["show_statusbar"] = false,
					["menu_icons_size"] = 0.75,
					["color"] = {
						0.0588235294117647, -- [1]
						0.0588235294117647, -- [2]
						0.0588235294117647, -- [3]
						0.5, -- [4]
					},
					["menu_anchor"] = {
						16, -- [1]
						-3, -- [2]
						["side"] = 2,
					},
					["__snapH"] = false,
					["bars_grow_direction"] = 1,
					["bg_r"] = 0.0588235294117647,
					["hide_in_combat_type"] = 1,
					["__was_opened"] = true,
					["hide_out_of_combat"] = false,
					["bars_sort_direction"] = 1,
					["following"] = {
						["enabled"] = false,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["skin_custom"] = "",
					["switch_tank"] = false,
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["stretch_button_side"] = 1,
					["switch_damager_in_combat"] = false,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textAlign"] = 0,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 0,
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["timeType"] = 1,
								["textXMod"] = 6,
								["textAlign"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["micro_displays_locked"] = true,
					["switch_all_roles_in_combat"] = false,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["attribute_text"] = {
						["show_timer"] = {
							true, -- [1]
							true, -- [2]
							true, -- [3]
						},
						["shadow"] = true,
						["side"] = 1,
						["text_color"] = {
							0.933333333333333, -- [1]
							0.933333333333333, -- [2]
							0.933333333333333, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Accidental Presidency",
						["anchor"] = {
							-18, -- [1]
							-1, -- [2]
						},
						["enabled"] = true,
						["enable_custom_text"] = false,
						["text_size"] = 12,
					},
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onleave"] = 1,
						["ignorebars"] = false,
						["iconstoo"] = true,
						["onenter"] = 1,
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["switch_healer"] = false,
					["switch_healer_in_combat"] = false,
					["strata"] = "LOW",
					["grab_on_top"] = false,
					["__snap"] = {
					},
					["ignore_mass_showhide"] = false,
					["hide_in_combat_alpha"] = 0,
					["plugins_grow_direction"] = 1,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = false,
					},
					["switch_damager"] = false,
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["bg_alpha"] = 0.5,
					["window_scale"] = 1,
					["statusbar_info"] = {
						["alpha"] = 0.5,
						["overlay"] = {
							0.0588235294117647, -- [1]
							0.0588235294117647, -- [2]
							0.0588235294117647, -- [3]
						},
					},
					["libwindow"] = {
						["y"] = 2.99998164176941,
						["x"] = -333.998413085938,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["switch_tank_in_combat"] = false,
					["hide_icon"] = true,
					["backdrop_texture"] = "ViksBlank",
					["bg_b"] = 0.0588235294117647,
					["auto_current"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.0588235294117647,
					["skin"] = "New Gray",
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -498.499908447266,
							["x"] = 539.001220703125,
							["w"] = 174.000625610352,
							["h"] = 77.0000915527344,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["switch_all_roles_after_wipe"] = false,
					["micro_displays_side"] = 2,
					["wallpaper"] = {
						["enabled"] = false,
						["width"] = 266.000061035156,
						["texcoord"] = {
							0.00100000001490116, -- [1]
							1, -- [2]
							0.00100000001490116, -- [3]
							0.703000030517578, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.498038113117218, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.498039245605469,
						["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = true,
					["desaturated_menu"] = true,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
						["textL_outline"] = true,
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textL_outline_small"] = false,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 12,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "1 Pixel",
						},
						["font_size"] = 14,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\Details\\images\\BantoBar",
						["textR_bracket"] = "(",
						["icon_file"] = "",
						["icon_grayscale"] = false,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["use_spec_icons"] = false,
						["textR_enable_custom_text"] = false,
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["fixed_texture_color"] = {
							0.301960784313726, -- [1]
							0.301960784313726, -- [2]
							0.8, -- [3]
							0.439999997615814, -- [4]
						},
						["textL_show_number"] = true,
						["fixed_texture_background_color"] = {
							0.188235294117647, -- [1]
							0.188235294117647, -- [2]
							0.188235294117647, -- [3]
							0, -- [4]
						},
						["percent_type"] = 1,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "BantoBar",
						["textR_outline_small"] = false,
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["start_after_icon"] = false,
						["texture_background"] = "ViksGloss",
						["alpha"] = 0.439999997615814,
						["textL_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = true,
						["textR_class_colors"] = false,
						["texture_custom"] = "",
						["font_face"] = "Accidental Presidency",
						["texture_class_colors"] = false,
						["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["height"] = 15,
					},
					["bars_inverted"] = false,
				}, -- [1]
				{
					["__snapV"] = false,
					["__pos"] = {
						["normal"] = {
							["y"] = -409.999710083008,
							["x"] = 537.501220703125,
							["w"] = 171.00048828125,
							["h"] = 68.0000228881836,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["show_statusbar"] = false,
					["menu_icons_size"] = 0.850000023841858,
					["color"] = {
						0.0588235294117647, -- [1]
						0.0588235294117647, -- [2]
						0.0588235294117647, -- [3]
						0.5, -- [4]
					},
					["menu_anchor"] = {
						16, -- [1]
						0, -- [2]
						["side"] = 2,
					},
					["__snapH"] = false,
					["bars_grow_direction"] = 1,
					["bg_r"] = 0.0588235294117647,
					["hide_in_combat_type"] = 1,
					["__was_opened"] = true,
					["hide_out_of_combat"] = false,
					["bars_sort_direction"] = 1,
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = false,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["skin_custom"] = "",
					["switch_tank"] = false,
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["stretch_button_side"] = 1,
					["switch_damager_in_combat"] = false,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textAlign"] = 0,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["segmentType"] = 2,
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 0,
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["timeType"] = 1,
								["textXMod"] = 6,
								["textAlign"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
					},
					["micro_displays_locked"] = true,
					["switch_all_roles_in_combat"] = false,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["attribute_text"] = {
						["show_timer"] = {
							true, -- [1]
							true, -- [2]
							true, -- [3]
						},
						["shadow"] = true,
						["side"] = 1,
						["text_color"] = {
							0.933333333333333, -- [1]
							0.933333333333333, -- [2]
							0.933333333333333, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Accidental Presidency",
						["anchor"] = {
							-18, -- [1]
							4, -- [2]
						},
						["enabled"] = true,
						["enable_custom_text"] = false,
						["text_size"] = 12,
					},
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["switch_healer"] = false,
					["switch_healer_in_combat"] = false,
					["strata"] = "LOW",
					["grab_on_top"] = false,
					["__snap"] = {
					},
					["ignore_mass_showhide"] = false,
					["hide_in_combat_alpha"] = 0,
					["plugins_grow_direction"] = 1,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = false,
					},
					["switch_damager"] = false,
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["bg_alpha"] = 0.5,
					["window_scale"] = 1,
					["statusbar_info"] = {
						["alpha"] = 0.5,
						["overlay"] = {
							0.0588235294117647, -- [1]
							0.0588235294117647, -- [2]
							0.0588235294117647, -- [3]
						},
					},
					["libwindow"] = {
						["y"] = 96.0002136230469,
						["x"] = -336.99853515625,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["switch_tank_in_combat"] = false,
					["hide_icon"] = true,
					["backdrop_texture"] = "ViksBlank",
					["bg_b"] = 0.0588235294117647,
					["auto_current"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.0588235294117647,
					["skin"] = "New Gray",
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -409.999710083008,
							["x"] = 537.501220703125,
							["w"] = 171.00048828125,
							["h"] = 68.0000228881836,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["switch_all_roles_after_wipe"] = false,
					["micro_displays_side"] = 2,
					["wallpaper"] = {
						["enabled"] = false,
						["width"] = 266.000061035156,
						["texcoord"] = {
							0.00100000001490116, -- [1]
							1, -- [2]
							0.00100000001490116, -- [3]
							0.703000030517578, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.498038113117218, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.498039245605469,
						["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = true,
					["desaturated_menu"] = true,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
						["textL_outline"] = true,
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textL_outline_small"] = false,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 12,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "1 Pixel",
						},
						["font_size"] = 14,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\Details\\images\\BantoBar",
						["textR_bracket"] = "(",
						["icon_file"] = "",
						["icon_grayscale"] = false,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["use_spec_icons"] = false,
						["textR_enable_custom_text"] = false,
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["fixed_texture_color"] = {
							0.301960784313726, -- [1]
							0.301960784313726, -- [2]
							0.8, -- [3]
							0.439999997615814, -- [4]
						},
						["textL_show_number"] = true,
						["fixed_texture_background_color"] = {
							0.188235294117647, -- [1]
							0.188235294117647, -- [2]
							0.188235294117647, -- [3]
							0, -- [4]
						},
						["percent_type"] = 1,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "BantoBar",
						["textR_outline_small"] = false,
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["start_after_icon"] = false,
						["texture_background"] = "ViksGloss",
						["alpha"] = 0.439999997615814,
						["textL_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = true,
						["textR_class_colors"] = false,
						["texture_custom"] = "",
						["font_face"] = "Accidental Presidency",
						["texture_class_colors"] = false,
						["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["height"] = 15,
					},
					["bars_inverted"] = false,
				}, -- [2]
				{
					["__pos"] = {
						["normal"] = {
							["y"] = -452.999893188477,
							["x"] = -536.999694824219,
							["w"] = 166.000045776367,
							["h"] = 166.000076293945,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["show_statusbar"] = false,
					["menu_icons_size"] = 0.799999952316284,
					["color"] = {
						0.0588235294117647, -- [1]
						0.0588235294117647, -- [2]
						0.0588235294117647, -- [3]
						0.5, -- [4]
					},
					["menu_anchor"] = {
						16, -- [1]
						-2, -- [2]
						["side"] = 2,
					},
					["switch_tank_in_combat"] = false,
					["bg_r"] = 0.0588235294117647,
					["ignore_mass_showhide"] = false,
					["__was_opened"] = true,
					["skin"] = "New Gray",
					["switch_healer"] = false,
					["following"] = {
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["enabled"] = false,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["skin_custom"] = "",
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["menu_anchor_down"] = {
						16, -- [1]
						-3, -- [2]
					},
					["stretch_button_side"] = 1,
					["grab_on_top"] = false,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["StatusBarSaved"] = {
						["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
						["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
						["options"] = {
							["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textAlign"] = 0,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
							["DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE"] = {
								["isHidden"] = false,
								["textStyle"] = 2,
								["textYMod"] = 1,
								["segmentType"] = 2,
								["textXMod"] = 0,
								["textFace"] = "Accidental Presidency",
								["textAlign"] = 0,
								["textSize"] = 10,
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
								["textColor"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["timeType"] = 1,
								["textXMod"] = 6,
								["textAlign"] = 0,
								["textFace"] = "Accidental Presidency",
								["textStyle"] = 2,
								["textSize"] = 10,
								["textYMod"] = 1,
							},
						},
						["left"] = "DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE",
					},
					["switch_damager"] = false,
					["switch_all_roles_in_combat"] = false,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["attribute_text"] = {
						["show_timer"] = {
							true, -- [1]
							true, -- [2]
							true, -- [3]
						},
						["shadow"] = true,
						["side"] = 1,
						["text_color"] = {
							0.933333333333333, -- [1]
							0.933333333333333, -- [2]
							0.933333333333333, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "Accidental Presidency",
						["anchor"] = {
							-18, -- [1]
							0, -- [2]
						},
						["enabled"] = true,
						["enable_custom_text"] = false,
						["text_size"] = 12,
					},
					["__locked"] = true,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["switch_healer_in_combat"] = false,
					["micro_displays_locked"] = true,
					["strata"] = "LOW",
					["switch_damager_in_combat"] = false,
					["__snap"] = {
					},
					["switch_tank"] = false,
					["hide_in_combat_alpha"] = 0,
					["plugins_grow_direction"] = 1,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = -2,
						["shadow"] = true,
					},
					["desaturated_menu"] = true,
					["micro_displays_side"] = 2,
					["bars_grow_direction"] = 1,
					["window_scale"] = 1,
					["statusbar_info"] = {
						["alpha"] = 0.5,
						["overlay"] = {
							0.0588235294117647, -- [1]
							0.0588235294117647, -- [2]
							0.0588235294117647, -- [3]
						},
					},
					["libwindow"] = {
						["y"] = 3.99999690055847,
						["x"] = 340.000305175781,
						["point"] = "BOTTOMLEFT",
						["scale"] = 1,
					},
					["backdrop_texture"] = "ViksBlank",
					["hide_icon"] = true,
					["show_sidebars"] = true,
					["bg_b"] = 0.0588235294117647,
					["auto_current"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.0588235294117647,
					["bg_alpha"] = 0.5,
					["hide_in_combat"] = false,
					["posicao"] = {
						["normal"] = {
							["y"] = -452.999893188477,
							["x"] = -536.999694824219,
							["w"] = 166.000045776367,
							["h"] = 166.000076293945,
						},
						["solo"] = {
							["y"] = 2,
							["x"] = 1,
							["w"] = 300,
							["h"] = 200,
						},
					},
					["hide_in_combat_type"] = 1,
					["switch_all_roles_after_wipe"] = false,
					["wallpaper"] = {
						["enabled"] = false,
						["width"] = 266.000061035156,
						["texcoord"] = {
							0.00100000001490116, -- [1]
							1, -- [2]
							0.00100000001490116, -- [3]
							0.703000030517578, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.498038113117218, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.498039245605469,
						["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["hide_out_of_combat"] = false,
					["bars_sort_direction"] = 1,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
						["textL_outline"] = true,
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textL_outline_small"] = false,
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
						["backdrop"] = {
							["enabled"] = false,
							["size"] = 12,
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["texture"] = "1 Pixel",
						},
						["font_size"] = 14,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\Details\\images\\BantoBar",
						["textR_bracket"] = "(",
						["icon_file"] = "",
						["icon_grayscale"] = false,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["use_spec_icons"] = false,
						["textR_enable_custom_text"] = false,
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["fixed_texture_color"] = {
							0.301960784313726, -- [1]
							0.301960784313726, -- [2]
							0.8, -- [3]
							0.439999997615814, -- [4]
						},
						["textL_show_number"] = true,
						["fixed_texture_background_color"] = {
							0.188235294117647, -- [1]
							0.188235294117647, -- [2]
							0.188235294117647, -- [3]
							0, -- [4]
						},
						["percent_type"] = 1,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "BantoBar",
						["textR_outline_small"] = false,
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["start_after_icon"] = false,
						["texture_background"] = "ViksGloss",
						["alpha"] = 0.439999997615814,
						["textL_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = true,
						["textR_class_colors"] = false,
						["texture_custom"] = "",
						["font_face"] = "Accidental Presidency",
						["texture_class_colors"] = false,
						["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["height"] = 15,
					},
					["bars_inverted"] = false,
				}, -- [3]
			},
			["report_lines"] = 5,
			["clear_ungrouped"] = true,
			["use_battleground_server_parser"] = false,
			["skin"] = "WoW Interface",
			["override_spellids"] = true,
			["use_scroll"] = false,
			["report_schema"] = 1,
			["overall_flag"] = 16,
			["numerical_system"] = 1,
			["overall_clear_logout"] = false,
			["new_window_size"] = {
				["height"] = 158,
				["width"] = 310,
			},
			["cloud_capture"] = true,
			["damage_taken_everything"] = false,
			["scroll_speed"] = 2,
			["font_sizes"] = {
				["menus"] = 8,
			},
			["memory_threshold"] = 3,
			["deadlog_events"] = 32,
			["window_clamp"] = {
				-8, -- [1]
				0, -- [2]
				21, -- [3]
				-14, -- [4]
			},
			["close_shields"] = false,
			["class_coords"] = {
				["HUNTER"] = {
					0, -- [1]
					0.25, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["WARRIOR"] = {
					0, -- [1]
					0.25, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["SHAMAN"] = {
					0.25, -- [1]
					0.49609375, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["MAGE"] = {
					0.25, -- [1]
					0.49609375, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["PET"] = {
					0.25, -- [1]
					0.49609375, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["DRUID"] = {
					0.7421875, -- [1]
					0.98828125, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["MONK"] = {
					0.5, -- [1]
					0.73828125, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["DEATHKNIGHT"] = {
					0.25, -- [1]
					0.5, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["ENEMY"] = {
					0, -- [1]
					0.25, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["UNKNOW"] = {
					0.5, -- [1]
					0.75, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["PRIEST"] = {
					0.49609375, -- [1]
					0.7421875, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["UNGROUPPLAYER"] = {
					0.5, -- [1]
					0.75, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["Alliance"] = {
					0.49609375, -- [1]
					0.7421875, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["WARLOCK"] = {
					0.7421875, -- [1]
					0.98828125, -- [2]
					0.25, -- [3]
					0.5, -- [4]
				},
				["DEMONHUNTER"] = {
					0.73828126, -- [1]
					1, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["Horde"] = {
					0.7421875, -- [1]
					0.98828125, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
				["PALADIN"] = {
					0, -- [1]
					0.25, -- [2]
					0.5, -- [3]
					0.75, -- [4]
				},
				["ROGUE"] = {
					0.49609375, -- [1]
					0.7421875, -- [2]
					0, -- [3]
					0.25, -- [4]
				},
				["MONSTER"] = {
					0, -- [1]
					0.25, -- [2]
					0.75, -- [3]
					1, -- [4]
				},
			},
			["windows_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["disable_alldisplays_window"] = false,
			["standard_skin"] = false,
			["total_abbreviation"] = 2,
			["class_colors"] = {
				["HUNTER"] = {
					0.67, -- [1]
					0.83, -- [2]
					0.45, -- [3]
				},
				["WARRIOR"] = {
					0.78, -- [1]
					0.61, -- [2]
					0.43, -- [3]
				},
				["ROGUE"] = {
					1, -- [1]
					0.96, -- [2]
					0.41, -- [3]
				},
				["MAGE"] = {
					0.41, -- [1]
					0.8, -- [2]
					0.94, -- [3]
				},
				["ARENA_YELLOW"] = {
					1, -- [1]
					1, -- [2]
					0.25, -- [3]
				},
				["UNGROUPPLAYER"] = {
					0.4, -- [1]
					0.4, -- [2]
					0.4, -- [3]
				},
				["DRUID"] = {
					1, -- [1]
					0.49, -- [2]
					0.04, -- [3]
				},
				["MONK"] = {
					0, -- [1]
					1, -- [2]
					0.59, -- [3]
				},
				["DEATHKNIGHT"] = {
					0.77, -- [1]
					0.12, -- [2]
					0.23, -- [3]
				},
				["PET"] = {
					0.3, -- [1]
					0.4, -- [2]
					0.5, -- [3]
				},
				["UNKNOW"] = {
					0.2, -- [1]
					0.2, -- [2]
					0.2, -- [3]
				},
				["PRIEST"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["ENEMY"] = {
					0.94117, -- [1]
					0, -- [2]
					0.0196, -- [3]
					1, -- [4]
				},
				["SHAMAN"] = {
					0, -- [1]
					0.44, -- [2]
					0.87, -- [3]
				},
				["WARLOCK"] = {
					0.58, -- [1]
					0.51, -- [2]
					0.79, -- [3]
				},
				["DEMONHUNTER"] = {
					0.64, -- [1]
					0.19, -- [2]
					0.79, -- [3]
				},
				["version"] = 1,
				["NEUTRAL"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
				},
				["PALADIN"] = {
					0.96, -- [1]
					0.55, -- [2]
					0.73, -- [3]
				},
				["ARENA_GREEN"] = {
					0.4, -- [1]
					1, -- [2]
					0.4, -- [3]
				},
			},
			["segments_auto_erase"] = 1,
			["clear_graphic"] = true,
			["trash_auto_remove"] = true,
			["animation_speed_triggertravel"] = 5,
			["options_group_edit"] = true,
			["segments_amount_to_save"] = 18,
			["minimap"] = {
				["onclick_what_todo"] = 1,
				["radius"] = 160,
				["hide"] = false,
				["minimapPos"] = 220,
				["text_format"] = 3,
				["text_type"] = 1,
			},
			["instances_amount"] = 5,
			["max_window_size"] = {
				["height"] = 450,
				["width"] = 480,
			},
			["deny_score_messages"] = false,
			["only_pvp_frags"] = false,
			["disable_stretch_button"] = false,
			["default_bg_color"] = 0.0941,
			["broadcaster_enabled"] = false,
			["hotcorner_topleft"] = {
				["hide"] = false,
			},
			["segments_panic_mode"] = false,
			["numerical_system_symbols"] = "auto",
			["player_details_window"] = {
				["scale"] = 1,
				["skin"] = "ElvUI",
				["bar_texture"] = "Skyline",
			},
			["row_fade_out"] = {
				"out", -- [1]
				0.2, -- [2]
			},
			["chat_tab_embed"] = {
				["enabled"] = false,
				["tab_name"] = "",
				["x_offset"] = 0,
				["single_window"] = false,
				["w2_pos"] = {
					["point"] = "TOP",
					["scale"] = 1,
					["y_legacy"] = 236.000305175781,
					["w"] = 309.999938964844,
					["y"] = -224.999694824219,
					["h"] = 157.999984741211,
					["x_legacy"] = 41.0000610351563,
					["x"] = 40.9999389648438,
					["pos_table"] = true,
				},
				["y_offset"] = 0,
				["w1_pos"] = {
					["point"] = "CENTER",
					["scale"] = 1,
					["y_legacy"] = 212.00048828125,
					["w"] = 309.999938964844,
					["y"] = 212.000457763672,
					["h"] = 157.999984741211,
					["x_legacy"] = -361.000366210938,
					["x"] = -361.000396728516,
					["pos_table"] = true,
				},
			},
			["minimum_combat_time"] = 5,
			["overall_clear_newboss"] = true,
			["force_activity_time_pvp"] = true,
			["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
			["pvp_as_group"] = true,
			["disable_reset_button"] = false,
			["animate_scroll"] = false,
			["death_tooltip_width"] = 350,
			["time_type"] = 2,
			["default_bg_alpha"] = 0.5,
			["time_type_original"] = 2,
		},
	},
	["always_use_profile_name"] = "ViksUI",
	["savedStyles"] = {
		{
			["show_statusbar"] = false,
			["menu_icons_size"] = 0.799999952316284,
			["color"] = {
				0.0588235294117647, -- [1]
				0.0588235294117647, -- [2]
				0.0588235294117647, -- [3]
				0.5, -- [4]
			},
			["menu_anchor"] = {
				16, -- [1]
				0, -- [2]
				["side"] = 2,
			},
			["bg_r"] = 0.0588235294117647,
			["hide_out_of_combat"] = false,
			["following"] = {
				["bar_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["enabled"] = false,
				["text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["color_buttons"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
			["bars_sort_direction"] = 1,
			["bg_b"] = 0.0588235294117647,
			["micro_displays_locked"] = true,
			["skin_custom"] = "",
			["bg_alpha"] = 0.5,
			["tooltip"] = {
				["n_abilities"] = 3,
				["n_enemies"] = 3,
			},
			["stretch_button_side"] = 1,
			["libwindow"] = {
				["y"] = 4.999840259552,
				["x"] = 340.000335693359,
				["point"] = "BOTTOMLEFT",
				["scale"] = 1,
			},
			["switch_all_roles_in_combat"] = false,
			["instance_button_anchor"] = {
				-27, -- [1]
				1, -- [2]
			},
			["name"] = "ViksUI",
			["row_info"] = {
				["textR_outline"] = true,
				["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
				["textL_outline"] = true,
				["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
				["textR_show_data"] = {
					true, -- [1]
					true, -- [2]
					false, -- [3]
				},
				["textL_enable_custom_text"] = false,
				["fixed_text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["space"] = {
					["right"] = 0,
					["left"] = 0,
					["between"] = 1,
				},
				["texture_background_class_color"] = false,
				["start_after_icon"] = false,
				["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
				["backdrop"] = {
					["enabled"] = false,
					["size"] = 12,
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["texture"] = "1 Pixel",
				},
				["models"] = {
					["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
					["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
					["upper_alpha"] = 0.5,
					["lower_enabled"] = false,
					["lower_alpha"] = 0.1,
					["upper_enabled"] = false,
				},
				["texture_custom_file"] = "Interface\\",
				["texture_file"] = "Interface\\AddOns\\Details\\images\\BantoBar",
				["font_size"] = 14,
				["icon_file"] = "",
				["icon_grayscale"] = false,
				["textR_bracket"] = "(",
				["use_spec_icons"] = false,
				["textR_enable_custom_text"] = false,
				["textL_custom_text"] = "{data1}. {data3}{data2}",
				["fixed_texture_color"] = {
					0.301960784313726, -- [1]
					0.301960784313726, -- [2]
					0.8, -- [3]
					0.439999997615814, -- [4]
				},
				["textL_show_number"] = true,
				["percent_type"] = 1,
				["texture_custom"] = "",
				["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
				["texture"] = "BantoBar",
				["textR_outline_small"] = false,
				["textL_outline_small"] = false,
				["textL_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["texture_background"] = "ViksGloss",
				["alpha"] = 0.439999997615814,
				["textR_class_colors"] = false,
				["textR_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["no_icon"] = true,
				["textL_class_colors"] = false,
				["fixed_texture_background_color"] = {
					0.188235294117647, -- [1]
					0.188235294117647, -- [2]
					0.188235294117647, -- [3]
					0, -- [4]
				},
				["font_face"] = "Accidental Presidency",
				["texture_class_colors"] = false,
				["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
				["fast_ps_update"] = false,
				["textR_separator"] = "NONE",
				["height"] = 15,
			},
			["bars_grow_direction"] = 1,
			["menu_alpha"] = {
				["enabled"] = false,
				["onenter"] = 1,
				["iconstoo"] = true,
				["ignorebars"] = false,
				["onleave"] = 1,
			},
			["switch_tank"] = false,
			["switch_all_roles_after_wipe"] = false,
			["desaturated_menu"] = true,
			["strata"] = "LOW",
			["micro_displays_side"] = 2,
			["menu_anchor_down"] = {
				16, -- [1]
				-3, -- [2]
			},
			["ignore_mass_showhide"] = false,
			["hide_in_combat_alpha"] = 0,
			["plugins_grow_direction"] = 1,
			["menu_icons"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				false, -- [6]
				["space"] = -2,
				["shadow"] = true,
			},
			["switch_damager"] = false,
			["auto_hide_menu"] = {
				["left"] = false,
				["right"] = false,
			},
			["window_scale"] = 1,
			["row_show_animation"] = {
				["anim"] = "Fade",
				["options"] = {
				},
			},
			["switch_healer"] = false,
			["hide_icon"] = true,
			["grab_on_top"] = false,
			["switch_damager_in_combat"] = false,
			["backdrop_texture"] = "ViksBlank",
			["skin"] = "New Gray",
			["auto_current"] = true,
			["toolbar_side"] = 1,
			["bg_g"] = 0.0588235294117647,
			["show_sidebars"] = true,
			["hide_in_combat"] = false,
			["hide_in_combat_type"] = 1,
			["switch_healer_in_combat"] = false,
			["statusbar_info"] = {
				["alpha"] = 0.5,
				["overlay"] = {
					0.0588235294117647, -- [1]
					0.0588235294117647, -- [2]
					0.0588235294117647, -- [3]
				},
			},
			["wallpaper"] = {
				["enabled"] = false,
				["width"] = 266.000061035156,
				["texcoord"] = {
					0.00100000001490116, -- [1]
					1, -- [2]
					0.00100000001490116, -- [3]
					0.703000030517578, -- [4]
				},
				["overlay"] = {
					0.999997794628143, -- [1]
					0.999997794628143, -- [2]
					0.999997794628143, -- [3]
					0.498038113117218, -- [4]
				},
				["anchor"] = "all",
				["height"] = 225.999984741211,
				["alpha"] = 0.498039245605469,
				["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
			},
			["total_bar"] = {
				["enabled"] = false,
				["only_in_group"] = true,
				["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["attribute_text"] = {
				["show_timer"] = {
					true, -- [1]
					true, -- [2]
					true, -- [3]
				},
				["shadow"] = true,
				["side"] = 1,
				["text_color"] = {
					0.933333333333333, -- [1]
					0.933333333333333, -- [2]
					0.933333333333333, -- [3]
					1, -- [4]
				},
				["custom_text"] = "{name}",
				["text_face"] = "Accidental Presidency",
				["anchor"] = {
					-18, -- [1]
					2, -- [2]
				},
				["enabled"] = true,
				["enable_custom_text"] = false,
				["text_size"] = 12,
			},
			["version"] = 3,
			["switch_tank_in_combat"] = false,
			["bars_inverted"] = false,
		}, -- [1]
		{
			["hide_in_combat_type"] = 1,
			["backdrop_texture"] = "ViksBlank",
			["color"] = {
				0.0588235294117647, -- [1]
				0.0588235294117647, -- [2]
				0.0588235294117647, -- [3]
				0.5, -- [4]
			},
			["menu_anchor"] = {
				16, -- [1]
				0, -- [2]
				["side"] = 2,
			},
			["bg_r"] = 0.0588235294117647,
			["hide_out_of_combat"] = false,
			["following"] = {
				["enabled"] = false,
				["bar_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["color_buttons"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["switch_healer"] = false,
			["micro_displays_locked"] = true,
			["bars_inverted"] = false,
			["skin"] = "New Gray",
			["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
			["bars_sort_direction"] = 1,
			["tooltip"] = {
				["n_abilities"] = 3,
				["n_enemies"] = 3,
			},
			["stretch_button_side"] = 1,
			["libwindow"] = {
				["y"] = 96.0001754760742,
				["x"] = -336.99853515625,
				["point"] = "BOTTOMRIGHT",
				["scale"] = 1,
			},
			["switch_all_roles_in_combat"] = false,
			["instance_button_anchor"] = {
				-27, -- [1]
				1, -- [2]
			},
			["version"] = 3,
			["attribute_text"] = {
				["show_timer"] = {
					true, -- [1]
					true, -- [2]
					true, -- [3]
				},
				["shadow"] = true,
				["side"] = 1,
				["text_size"] = 12,
				["custom_text"] = "{name}",
				["text_face"] = "Accidental Presidency",
				["anchor"] = {
					-18, -- [1]
					4, -- [2]
				},
				["text_color"] = {
					0.933333333333333, -- [1]
					0.933333333333333, -- [2]
					0.933333333333333, -- [3]
					1, -- [4]
				},
				["enable_custom_text"] = false,
				["enabled"] = true,
			},
			["auto_hide_menu"] = {
				["left"] = false,
				["right"] = false,
			},
			["menu_alpha"] = {
				["enabled"] = false,
				["onleave"] = 1,
				["ignorebars"] = false,
				["iconstoo"] = true,
				["onenter"] = 1,
			},
			["bars_grow_direction"] = 1,
			["ignore_mass_showhide"] = false,
			["switch_damager"] = false,
			["strata"] = "LOW",
			["show_sidebars"] = true,
			["window_scale"] = 1,
			["switch_tank"] = false,
			["hide_in_combat_alpha"] = 0,
			["switch_all_roles_after_wipe"] = false,
			["menu_icons"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				false, -- [6]
				["space"] = -2,
				["shadow"] = false,
			},
			["desaturated_menu"] = true,
			["micro_displays_side"] = 2,
			["menu_anchor_down"] = {
				16, -- [1]
				-3, -- [2]
			},
			["row_show_animation"] = {
				["anim"] = "Fade",
				["options"] = {
				},
			},
			["row_info"] = {
				["textR_outline"] = true,
				["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal_alpha",
				["textL_outline"] = true,
				["textR_outline_small"] = false,
				["textL_outline_small"] = false,
				["percent_type"] = 1,
				["fixed_text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["space"] = {
					["right"] = 0,
					["left"] = 0,
					["between"] = 0,
				},
				["texture_background_class_color"] = false,
				["textL_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
				["textL_custom_text"] = "{data1}. {data3}{data2}",
				["models"] = {
					["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
					["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
					["upper_alpha"] = 0.5,
					["lower_enabled"] = false,
					["lower_alpha"] = 0.1,
					["upper_enabled"] = false,
				},
				["height"] = 15,
				["texture_file"] = "Interface\\AddOns\\Details\\images\\BantoBar",
				["texture_custom_file"] = "Interface\\",
				["icon_file"] = "",
				["icon_grayscale"] = false,
				["font_size"] = 14,
				["use_spec_icons"] = false,
				["textR_enable_custom_text"] = false,
				["backdrop"] = {
					["enabled"] = false,
					["texture"] = "1 Pixel",
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["size"] = 12,
				},
				["fixed_texture_color"] = {
					0.301960784313726, -- [1]
					0.301960784313726, -- [2]
					0.8, -- [3]
					0.439999997615814, -- [4]
				},
				["textL_show_number"] = true,
				["texture_custom"] = "",
				["textR_show_data"] = {
					true, -- [1]
					true, -- [2]
					false, -- [3]
				},
				["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
				["texture"] = "BantoBar",
				["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
				["start_after_icon"] = false,
				["textL_class_colors"] = false,
				["textR_class_colors"] = false,
				["textR_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["texture_background"] = "ViksGloss",
				["alpha"] = 0.439999997615814,
				["no_icon"] = true,
				["textL_enable_custom_text"] = false,
				["fixed_texture_background_color"] = {
					0.188235294117647, -- [1]
					0.188235294117647, -- [2]
					0.188235294117647, -- [3]
					0, -- [4]
				},
				["font_face"] = "Accidental Presidency",
				["texture_class_colors"] = false,
				["texture_background_file"] = "Interface\\Buttons\\WHITE8x8",
				["fast_ps_update"] = false,
				["textR_separator"] = "NONE",
				["textR_bracket"] = "(",
			},
			["bg_alpha"] = 0.5,
			["grab_on_top"] = false,
			["hide_icon"] = true,
			["switch_damager_in_combat"] = false,
			["skin_custom"] = "",
			["auto_current"] = true,
			["toolbar_side"] = 1,
			["bg_g"] = 0.0588235294117647,
			["statusbar_info"] = {
				["alpha"] = 0.5,
				["overlay"] = {
					0.0588235294117647, -- [1]
					0.0588235294117647, -- [2]
					0.0588235294117647, -- [3]
				},
			},
			["hide_in_combat"] = false,
			["plugins_grow_direction"] = 1,
			["show_statusbar"] = false,
			["menu_icons_size"] = 0.850000023841858,
			["wallpaper"] = {
				["overlay"] = {
					0.999997794628143, -- [1]
					0.999997794628143, -- [2]
					0.999997794628143, -- [3]
					0.498038113117218, -- [4]
				},
				["texture"] = "Interface\\TALENTFRAME\\bg-priest-shadow",
				["texcoord"] = {
					0.00100000001490116, -- [1]
					1, -- [2]
					0.00100000001490116, -- [3]
					0.703000030517578, -- [4]
				},
				["enabled"] = false,
				["anchor"] = "all",
				["height"] = 225.999984741211,
				["alpha"] = 0.498039245605469,
				["width"] = 266.000061035156,
			},
			["total_bar"] = {
				["enabled"] = false,
				["only_in_group"] = true,
				["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["switch_healer_in_combat"] = false,
			["name"] = "ViksUI",
			["switch_tank_in_combat"] = false,
			["bg_b"] = 0.0588235294117647,
		}, -- [2]
	},
	["always_use_profile_exception"] = {
	},
	["details_auras"] = {
	},
	["latest_news_saw"] = "v8.0.1.6035",
	["savedTimeCaptures"] = {
	},
	["plugin_window_pos"] = {
		["y"] = -41.999267578125,
		["x"] = -20.5001983642578,
		["point"] = "TOP",
		["scale"] = 1,
	},
	["custom"] = {
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Show who in your raid used a potion during the encounter.",
			["tooltip"] = "			--init:\n			local player, combat, instance = ...\n\n			--get the debuff container for potion of focus\n			local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n			if (debuff_uptime_container) then\n			    local focus_potion = debuff_uptime_container [188030] --Legion\n			    if (focus_potion) then\n				local name, _, icon = GetSpellInfo (188030) --Legion\n				GameCooltip:AddLine (name, 1) --> can use only 1 focus potion (can't be pre-potion)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			end\n\n			--get the buff container for all the others potions\n			local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n			if (buff_uptime_container) then\n			    --potion of the jade serpent\n			    local jade_serpent_potion = buff_uptime_container [188027] --Legion\n			    if (jade_serpent_potion) then\n				local name, _, icon = GetSpellInfo (188027) --Legion\n				GameCooltip:AddLine (name, jade_serpent_potion.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			    \n			    --potion of mogu power\n			    local mogu_power_potion = buff_uptime_container [188028] --Legion\n			    if (mogu_power_potion) then\n				local name, _, icon = GetSpellInfo (188028) --Legion\n				GameCooltip:AddLine (name, mogu_power_potion.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			    \n			    --mana potion\n			    local mana_potion = buff_uptime_container [188017] --Legion\n			    if (mana_potion) then\n				local name, _, icon = GetSpellInfo (188017) --Legion\n				GameCooltip:AddLine (name, mana_potion.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			    \n			    --prolongued power\n			    local prolongued_power = buff_uptime_container [229206] --Legion\n			    if (prolongued_power) then\n				local name, _, icon = GetSpellInfo (229206) --Legion\n				GameCooltip:AddLine (name, prolongued_power.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			    \n			    --potion of the mountains\n			    local mountains_potion = buff_uptime_container [188029] --Legion\n			    if (mountains_potion) then\n				local name, _, icon = GetSpellInfo (188029) --Legion\n				GameCooltip:AddLine (name, mountains_potion.activedamt)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n			    end\n			end\n		",
			["icon"] = "Interface\\ICONS\\Trade_Alchemy_PotionD4",
			["name"] = "Potion Used",
			["spellid"] = false,
			["target"] = false,
			["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the misc actor container\n				local misc_container = combat:GetActorList ( DETAILS_ATTRIBUTE_MISC )\n\n				--do the loop:\n				for _, player in ipairs ( misc_container ) do \n				    \n				    --only player in group\n				    if (player:IsGroupPlayer()) then\n					\n					local found_potion = false\n					\n					--get the spell debuff uptime container\n					local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n					if (debuff_uptime_container) then\n					    --potion of focus (can't use as pre-potion, so, its amount is always 1\n					    local focus_potion = debuff_uptime_container [188030] --Legion\n					    if (focus_potion) then\n						total = total + 1\n						found_potion = true\n						if (top < 1) then\n						    top = 1\n						end\n						--add amount to the player \n						instance_container:AddValue (player, 1)\n					    end\n					end\n					\n					--get the spell buff uptime container\n					local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n					if (buff_uptime_container) then\n					    \n					    --potion of the jade serpent\n					    local jade_serpent_potion = buff_uptime_container [188027] --Legion\n					    if (jade_serpent_potion) then\n						local used = jade_serpent_potion.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					    \n					    --potion of mogu power\n					    local mogu_power_potion = buff_uptime_container [188028] --Legion\n					    if (mogu_power_potion) then\n						local used = mogu_power_potion.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					    \n					    --mana potion\n					    local mana_potion = buff_uptime_container [188017] --Legion\n					    if (mana_potion) then\n						local used = mana_potion.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					    \n					    --potion of prolongued power\n					    local prolongued_power = buff_uptime_container [229206] --Legion\n					    if (prolongued_power) then\n						local used = prolongued_power.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					    \n					    --potion of the mountains\n					    local mountains_potion = buff_uptime_container [188029] --Legion\n					    if (mountains_potion) then\n						local used = mountains_potion.activedamt\n						if (used > 0) then\n						    total = total + used\n						    found_potion = true\n						    if (used > top) then\n							top = used\n						    end\n						    --add amount to the player \n						    instance_container:AddValue (player, used)\n						end\n					    end\n					end\n					\n					if (found_potion) then\n					    amount = amount + 1\n					end    \n				    end\n				end\n\n				--return:\n				return total, top, amount\n				",
			["attribute"] = false,
			["script_version"] = 3,
		}, -- [1]
		{
			["source"] = false,
			["total_script"] = false,
			["author"] = "Details! Team",
			["percent_script"] = false,
			["desc"] = "Show who in your raid group used the healthstone or a heal potion.",
			["icon"] = "Interface\\ICONS\\warlock_ healthstone",
			["spellid"] = false,
			["name"] = "Health Potion & Stone",
			["script"] = "			--get the parameters passed\n			local combat, instance_container, instance = ...\n			--declade the values to return\n			local total, top, amount = 0, 0, 0\n			\n			--do the loop\n			local AllHealCharacters = combat:GetActorList (DETAILS_ATTRIBUTE_HEAL)\n			for index, character in ipairs (AllHealCharacters) do\n				local AllSpells = character:GetSpellList()\n				local found = false\n				for spellid, spell in pairs (AllSpells) do\n					if (DETAILS_HEALTH_POTION_LIST [spellid]) then\n						instance_container:AddValue (character, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						found = true\n					end\n				end\n			\n				if (found) then\n					amount = amount + 1\n				end\n			end\n			--loop end\n			--return the values\n			return total, top, amount\n			",
			["target"] = false,
			["tooltip"] = "			--get the parameters passed\n			local actor, combat, instance = ...\n			\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GameCooltip = GameCooltip\n			local R, G, B, A = 0, 0, 0, 0.75\n			\n			local hs = actor:GetSpell (6262)\n			if (hs) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(6262)),  _detalhes:ToK(hs.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (6262)), 1, 1, 16, 16)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_HEALTH_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_HEALTH_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_HEALTH_POTION_ID)), 1, 1, 16, 16)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_REJU_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_REJU_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_REJU_POTION_ID)), 1, 1, 16, 16)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n\n			--Cooltip code\n			",
			["attribute"] = false,
			["script_version"] = 13,
		}, -- [2]
		{
			["source"] = false,
			["author"] = "Details!",
			["tooltip"] = "				\n			",
			["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
			["desc"] = "Tells how much time each character spent doing damage.",
			["icon"] = "Interface\\ICONS\\Achievement_PVP_H_06",
			["spellid"] = false,
			["name"] = "Damage Activity Time",
			["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, amount = 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
			["target"] = false,
			["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
			["attribute"] = false,
			["script_version"] = 1,
		}, -- [3]
		{
			["source"] = false,
			["author"] = "Details!",
			["tooltip"] = "				\n			",
			["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
			["desc"] = "Tells how much time each character spent doing healing.",
			["icon"] = "Interface\\ICONS\\Achievement_PVP_G_06",
			["spellid"] = false,
			["name"] = "Healing Activity Time",
			["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_HEAL )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
			["target"] = false,
			["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
			["attribute"] = false,
			["script_version"] = 1,
		}, -- [4]
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Show the crowd control amount for each player.",
			["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
			["icon"] = "Interface\\ICONS\\Spell_Frost_FreezingBreath",
			["spellid"] = false,
			["name"] = "Crowd Control Done",
			["tooltip"] = "				local actor, combat, instance = ...\n				local spells = {}\n				for spellid, spell in pairs (actor.cc_done_spells._ActorTable) do\n				    tinsert (spells, {spellid, spell.counter})\n				end\n\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, 14, 14)\n				end\n\n				local targets = {}\n				for playername, amount in pairs (actor.cc_done_targets) do\n				    tinsert (targets, {playername, amount})\n				end\n\n				table.sort (targets, _detalhes.Sort2)\n\n				_detalhes:AddTooltipSpellHeaderText (\"Targets\", \"yellow\", #targets)\n				local class, _, _, _, _, r, g, b = _detalhes:GetClass (actor.nome)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, target in ipairs (targets) do\n				    GameCooltip:AddLine (target[1], target [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (target [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, 14, 14, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, 14, 14)\n				    end\n				    --\n				end\n			",
			["target"] = false,
			["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n					if (character.cc_done and character:IsPlayer()) then\n						local cc_done = floor (character.cc_done)\n						instance_container:AddValue (character, cc_done)\n						total = total + cc_done\n						if (cc_done > top) then\n							top = cc_done\n						end\n						amount = amount + 1\n					end\n				end\n\n				return total, top, amount\n			",
			["attribute"] = false,
			["script_version"] = 9,
		}, -- [5]
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Show the amount of crowd control received for each player.",
			["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
			["icon"] = "Interface\\ICONS\\Spell_Mage_IceNova",
			["spellid"] = false,
			["name"] = "Crowd Control Received",
			["tooltip"] = "				local actor, combat, instance = ...\n				local name = actor:name()\n				local spells, from = {}, {}\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					local on_actor = character.cc_done_targets [name]\n					if (on_actor) then\n					    tinsert (from, {character:name(), on_actor})\n					    \n					    for spellid, spell in pairs (character.cc_done_spells._ActorTable) do\n						\n						local spell_on_actor = spell.targets [name]\n						if (spell_on_actor) then\n						    local has_spell\n						    for index, spell_table in ipairs (spells) do\n							if (spell_table [1] == spellid) then\n							    spell_table [2] = spell_table [2] + spell_on_actor\n							    has_spell = true\n							end\n						    end\n						    if (not has_spell) then\n							tinsert (spells, {spellid, spell_on_actor}) \n						    end\n						end\n						\n					    end            \n					end\n				    end\n				end\n\n				table.sort (from, _detalhes.Sort2)\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, 14, 14)    \n				end\n\n				_detalhes:AddTooltipSpellHeaderText (\"From\", \"yellow\", #from)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, t in ipairs (from) do\n				    GameCooltip:AddLine (t[1], t[2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (t [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, 14, 14, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, 14, 14)\n				    end     \n				    \n				end\n			",
			["target"] = false,
			["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amt = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n				DETAILS_CUSTOM_CC_RECEIVED_CACHE = DETAILS_CUSTOM_CC_RECEIVED_CACHE or {}\n				wipe (DETAILS_CUSTOM_CC_RECEIVED_CACHE)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					\n					for player_name, amount in pairs (character.cc_done_targets) do\n					    local target = combat (1, player_name) or combat (2, player_name)\n					    if (target and target:IsPlayer()) then\n						instance_container:AddValue (target, amount)\n						total = total + amount\n						if (amount > top) then\n						    top = amount\n						end\n						if (not DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name]) then\n						    DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name] = true\n						    amt = amt + 1\n						end\n					    end\n					end\n					\n				    end\n				end\n\n				return total, top, amt\n			",
			["attribute"] = false,
			["script_version"] = 1,
		}, -- [6]
		{
			["source"] = false,
			["author"] = "Details!",
			["percent_script"] = "				local value, top, total, combat, instance = ...\n				local dps = _detalhes:ToK (floor (value) / combat:GetCombatTime())\n				local percent = string.format (\"%.1f\", value/total*100)\n				return dps .. \", \" .. percent\n			",
			["desc"] = "Show your spells in the window.",
			["tooltip"] = "			--config:\n			--Background RBG and Alpha:\n			local R, G, B, A = 0, 0, 0, 0.75\n			local R, G, B, A = 0.1960, 0.1960, 0.1960, 0.8697\n\n			--get the parameters passed\n			local spell, combat, instance = ...\n\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GC = GameCooltip\n			GC:SetOption (\"YSpacingMod\", 0)\n\n			local role = UnitGroupRolesAssigned (\"player\")\n\n			if (spell.n_dmg) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    local debuff_uptime_total, cast_string = \"\", \"\"\n			    local misc_actor = instance.showing (4, _detalhes.playername)\n			    if (misc_actor) then\n				local debuff_uptime = misc_actor.debuff_uptime_spells and misc_actor.debuff_uptime_spells._ActorTable [spell.id] and misc_actor.debuff_uptime_spells._ActorTable [spell.id].uptime\n				if (debuff_uptime) then\n				    debuff_uptime_total = floor (debuff_uptime / instance.showing:GetCombatTime() * 100)\n				end\n				\n				local spell_cast = misc_actor.spell_cast and misc_actor.spell_cast [spell.id]\n				\n				if (not spell_cast and misc_actor.spell_cast) then\n				    local spellname = GetSpellInfo (spell.id)\n				    for casted_spellid, amount in pairs (misc_actor.spell_cast) do\n					local casted_spellname = GetSpellInfo (casted_spellid)\n					if (casted_spellname == spellname) then\n					    spell_cast = amount .. \" (|cFFFFFF00?|r)\"\n					end\n				    end\n				end\n				if (not spell_cast) then\n				    spell_cast = \"(|cFFFFFF00?|r)\"\n				end\n				cast_string = cast_string .. spell_cast\n			    end\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Casts:\", cast_string or \"?\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (debuff_uptime_total ~= \"\") then\n				GC:AddLine (\"Uptime:\", (debuff_uptime_total or \"?\") .. \"%\")\n				GC:AddStatusBar (100, 1, R, G, B, A)\n			    end\n			    \n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Dps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_dmg / spell.n_amt\n			    local T = (combat_time*spell.n_dmg)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_dmg / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_dmg/spell.c_amt\n				local T = (combat_time*spell.c_dmg)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_dmg / T\n				\n				GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Dps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Multistrike: \", spell.m_amt .. \" (\" ..floor ( spell.m_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"On Normal / On Critical:\", spell.m_amt - spell.m_crit .. \"  / \" .. spell.m_crit)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			elseif (spell.n_curado) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Hps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_curado / spell.n_amt\n			    local T = (combat_time*spell.n_curado)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_curado / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_curado/spell.c_amt\n				local T = (combat_time*spell.c_curado)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_curado / T\n				\n				GC:AddLine (\"Average / E-Hps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Hps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Multistrike: \", spell.m_amt .. \" (\" ..floor ( spell.m_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"On Normal / On Critical:\", spell.m_amt - spell.m_crit .. \"  / \" .. spell.m_crit)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			end\n			",
			["icon"] = "Interface\\ICONS\\ABILITY_MAGE_ARCANEBARRAGE",
			["name"] = "My Spells",
			["spellid"] = false,
			["target"] = false,
			["script"] = "				--get the parameters passed\n				local combat, instance_container, instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				local player\n				local role = UnitGroupRolesAssigned (\"player\")\n				local pet_attribute\n\n				if (role == \"DAMAGER\") then\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				elseif (role == \"HEALER\") then    \n					player = combat (DETAILS_ATTRIBUTE_HEAL, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_HEAL\n				else\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				end\n\n				--do the loop\n\n				if (player) then\n					local spells = player:GetSpellList()\n					for spellid, spell in pairs (spells) do\n						instance_container:AddValue (spell, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						amount = amount + 1\n					end\n				    \n					for _, PetName in ipairs (player.pets) do\n						local pet = combat (pet_attribute, PetName)\n						if (pet) then\n							for spellid, spell in pairs (pet:GetSpellList()) do\n								instance_container:AddValue (spell, spell.total, nil, \" (\" .. PetName:gsub ((\" <.*\"), \"\") .. \")\")\n								total = total + spell.total\n								if (top < spell.total) then\n									top = spell.total\n								end\n								amount = amount + 1\n							end\n						end\n					end\n				end\n\n				--return the values\n				return total, top, amount\n			",
			["attribute"] = false,
			["script_version"] = 5,
		}, -- [7]
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Show the amount of damage applied on targets marked with skull.",
			["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [128]\n				if (DamageOnStar) then\n				    --RAID_TARGET_8 is the built-in localized word for 'Skull'.\n				    GameCooltip:AddLine (RAID_TARGET_8 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_8\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
			["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8",
			["name"] = "Damage On Skull Marked Targets",
			["spellid"] = false,
			["target"] = false,
			["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n				\n				--raid target flags: \n				-- 128: skull \n				-- 64: cross\n				-- 32: square\n				-- 16: moon\n				-- 8: triangle\n				-- 4: diamond\n				-- 2: circle\n				-- 1: star\n				\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					if (actor.raid_targets [128]) then\n					    CustomContainer:AddValue (actor, actor.raid_targets [128])\n					end        \n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
			["attribute"] = false,
			["script_version"] = 2,
		}, -- [8]
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Show the amount of damage applied on targets marked with any other mark.",
			["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object\n				local GameCooltip = GameCooltip\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [1]\n				if (DamageOnStar) then\n				    GameCooltip:AddLine (RAID_TARGET_1 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_1\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCircle = RaidTargets [2]\n				if (DamageOnCircle) then\n				    GameCooltip:AddLine (RAID_TARGET_2 .. \":\", format_func (_, DamageOnCircle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_2\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnDiamond = RaidTargets [4]\n				if (DamageOnDiamond) then\n				    GameCooltip:AddLine (RAID_TARGET_3 .. \":\", format_func (_, DamageOnDiamond))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_3\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnTriangle = RaidTargets [8]\n				if (DamageOnTriangle) then\n				    GameCooltip:AddLine (RAID_TARGET_4 .. \":\", format_func (_, DamageOnTriangle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_4\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnMoon = RaidTargets [16]\n				if (DamageOnMoon) then\n				    GameCooltip:AddLine (RAID_TARGET_5 .. \":\", format_func (_, DamageOnMoon))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_5\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnSquare = RaidTargets [32]\n				if (DamageOnSquare) then\n				    GameCooltip:AddLine (RAID_TARGET_6 .. \":\", format_func (_, DamageOnSquare))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_6\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCross = RaidTargets [64]\n				if (DamageOnCross) then\n				    GameCooltip:AddLine (RAID_TARGET_7 .. \":\", format_func (_, DamageOnCross))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_7\", 1, 1, 14, 14)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
			["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_5",
			["name"] = "Damage On Other Marked Targets",
			["spellid"] = false,
			["target"] = false,
			["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					local total = (actor.raid_targets [1] or 0) --star\n					total = total + (actor.raid_targets [2] or 0) --circle\n					total = total + (actor.raid_targets [4] or 0) --diamond\n					total = total + (actor.raid_targets [8] or 0) --tiangle\n					total = total + (actor.raid_targets [16] or 0) --moon\n					total = total + (actor.raid_targets [32] or 0) --square\n					total = total + (actor.raid_targets [64] or 0) --cross\n					\n					if (total > 0) then\n					    CustomContainer:AddValue (actor, total)\n					end\n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
			["attribute"] = false,
			["script_version"] = 2,
		}, -- [9]
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Show overall damage done on the fly.",
			["total_script"] = "				local value, top, total, combat, instance = ...\n\n				--get the time of overall combat\n				local OverallCombatTime = Details:GetCombat (-1):GetCombatTime()\n\n				--get the time of current combat if the player is in combat\n				if (Details.in_combat) then\n				    local CurrentCombatTime = Details:GetCombat (0):GetCombatTime()\n				    OverallCombatTime = OverallCombatTime + CurrentCombatTime\n				end\n\n				--build the string\n				local ToK = Details:GetCurrentToKFunction()\n				local s = ToK (_, total / OverallCombatTime)\n				s = ToK (_, total) .. \" (\" .. s .. \", \"\n\n				return s\n			",
			["icon"] = "Interface\\ICONS\\Achievement_Quests_Completed_08",
			["spellid"] = false,
			["name"] = "Dynamic Overall Damage",
			["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip2\n\n				--Cooltip code\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				local AllSpells = {}\n\n				--overall\n				local player = OverallCombat [1]:GetActor (actor.nome)\n				local playerSpells = player:GetSpellList()\n				for spellID, spellTable in pairs (playerSpells) do\n				    AllSpells [spellID] = spellTable.total\n				end\n\n				--current\n				local player = CurrentCombat [1]:GetActor (actor.nome)\n				local playerSpells = player:GetSpellList()\n				for spellID, spellTable in pairs (playerSpells) do\n				    AllSpells [spellID] = (AllSpells [spellID] or 0) + (spellTable.total or 0)\n				end\n\n				local sortedList = {}\n				for spellID, total in pairs (AllSpells) do\n				    tinsert (sortedList, {spellID, total})\n				end\n				table.sort (sortedList, Details.Sort2)\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--build the tooltip\n				for i, t in ipairs (sortedList) do\n				    local spellID, total = unpack (t)\n				    if (total > 1) then\n					local spellName, _, spellIcon = Details.GetSpellInfo (spellID)\n					\n					GameCooltip:AddLine (spellName, format_func (_, total))\n					Details:AddTooltipBackgroundStatusbar()\n					GameCooltip:AddIcon (spellIcon, 1, 1, 14, 14)\n				    end\n				end\n			",
			["target"] = false,
			["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				if (not OverallCombat.GetActorList or not CurrentCombat.GetActorList) then\n				    return 0, 0, 0\n				end\n\n				--get the damage actor container for overall\n				local damage_container_overall = OverallCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				--get the damage actor container for current\n				local damage_container_current = CurrentCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n\n				--do the loop:\n				for _, player in ipairs ( damage_container_overall ) do \n				    --only player in group\n				    if (player:IsGroupPlayer()) then\n					instance_container:AddValue (player, player.total)\n				    end\n				end\n\n				if (Details.in_combat) then\n				    for _, player in ipairs ( damage_container_current ) do \n					--only player in group\n					if (player:IsGroupPlayer()) then\n					    instance_container:AddValue (player, player.total)        \n					end\n				    end\n				end\n\n				total, top =  instance_container:GetTotalAndHighestValue()\n				amount =  instance_container:GetNumActors()\n\n				--return:\n				return total, top, amount\n			",
			["attribute"] = false,
			["script_version"] = 2,
		}, -- [10]
		{
			["source"] = false,
			["author"] = "Details!",
			["desc"] = "Damage done to shields",
			["tooltip"] = "				--get the parameters passed\n				local actor, Combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				--get the actor total damage absorbed\n				local totalAbsorb = actor.totalabsorbed\n				local format_func = Details:GetCurrentToKFunction()\n\n				--get the damage absorbed by all the actor pets\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n				    end\n				end\n\n				GameCooltip:AddLine (actor:Name(), format_func (_, actor.totalabsorbed))\n				Details:AddTooltipBackgroundStatusbar()\n\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n					\n					GameCooltip:AddLine (petName, format_func (_, pet.totalabsorbed))\n					Details:AddTooltipBackgroundStatusbar()        \n					\n				    end\n				end\n			",
			["icon"] = "Interface\\ICONS\\Spell_Holy_PowerWordShield",
			["name"] = "Damage on Shields",
			["spellid"] = false,
			["target"] = false,
			["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for index, actor in ipairs (Combat:GetActorList(1)) do\n				    if (actor:IsPlayer()) then\n					\n					--get the actor total damage absorbed\n					local totalAbsorb = actor.totalabsorbed\n					\n					--get the damage absorbed by all the actor pets\n					for petIndex, petName in ipairs (actor.pets) do\n					    local pet = Combat :GetActor (1, petName)\n					    if (pet) then\n						totalAbsorb = totalAbsorb + pet.totalabsorbed\n					    end\n					end\n					\n					--add the value to the actor on the custom container\n					CustomContainer:AddValue (actor, totalAbsorb)        \n					\n				    end\n				end\n				--loop end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
			["attribute"] = false,
			["script_version"] = 1,
		}, -- [11]
	},
	["performance_profiles"] = {
		["Dungeon"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["RaidFinder"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Battleground15"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Battleground40"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Mythic"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Arena"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Raid30"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
		["Raid15"] = {
			["enabled"] = false,
			["update_speed"] = 1,
			["miscdata"] = true,
			["aura"] = true,
			["heal"] = true,
			["use_row_animations"] = false,
			["energy"] = false,
			["damage"] = true,
		},
	},
	["exit_log"] = {
		"1 - Closing Janela Info.", -- [1]
		"2 - Clearing user place from instances.", -- [2]
		"4 - Reversing switches.", -- [3]
		"6 - Saving Config.", -- [4]
		"7 - Saving Profiles.", -- [5]
		"8 - Saving nicktag cache.", -- [6]
	},
	["savedCustomSpells"] = {
		{
			1, -- [1]
			"Melee", -- [2]
			"Interface\\ICONS\\INV_Sword_04", -- [3]
		}, -- [1]
		{
			2, -- [1]
			"Auto Shot", -- [2]
			"Interface\\ICONS\\INV_Weapon_Bow_07", -- [3]
		}, -- [2]
		{
			4, -- [1]
			"Environment (Drowning)", -- [2]
			"Interface\\ICONS\\Ability_Suffocate", -- [3]
		}, -- [3]
		{
			8, -- [1]
			"Environment (Slime)", -- [2]
			"Interface\\ICONS\\Ability_Creature_Poison_02", -- [3]
		}, -- [4]
		{
			88082, -- [1]
			"Fireball (Mirror Image)", -- [2]
			135812, -- [3]
		}, -- [5]
		{
			94472, -- [1]
			"Atonement (critical)", -- [2]
			135887, -- [3]
		}, -- [6]
		{
			59638, -- [1]
			"Frostbolt (Mirror Image)", -- [2]
			135846, -- [3]
		}, -- [7]
		{
			5, -- [1]
			"Environment (Fatigue)", -- [2]
			"Interface\\ICONS\\Spell_Arcane_MindMastery", -- [3]
		}, -- [8]
		{
			158336, -- [1]
			"Pulverize (wave #1)", -- [2]
			135242, -- [3]
		}, -- [9]
		{
			3, -- [1]
			"Environment (Falling)", -- [2]
			"Interface\\ICONS\\Spell_Magic_FeatherFall", -- [3]
		}, -- [10]
		{
			6, -- [1]
			"Environment (Fire)", -- [2]
			"Interface\\ICONS\\INV_SummerFest_FireSpirit", -- [3]
		}, -- [11]
		{
			224078, -- [1]
			"Devilsaur Shock Leash (trinket)", -- [2]
			136048, -- [3]
		}, -- [12]
		{
			214350, -- [1]
			"Nightmare Essence (trinket)", -- [2]
			1357816, -- [3]
		}, -- [13]
		{
			44461, -- [1]
			"Living Bomb (explosion)", -- [2]
			236220, -- [3]
		}, -- [14]
		{
			213786, -- [1]
			"Nightfall (trinket)", -- [2]
			236168, -- [3]
		}, -- [15]
		{
			120761, -- [1]
			"Glaive Toss (Glaive #2)", -- [2]
			132330, -- [3]
		}, -- [16]
		{
			121414, -- [1]
			"Glaive Toss (Glaive #1)", -- [2]
			132330, -- [3]
		}, -- [17]
		{
			33778, -- [1]
			"Lifebloom (bloom)", -- [2]
			134206, -- [3]
		}, -- [18]
		{
			7, -- [1]
			"Environment (Lava)", -- [2]
			"Interface\\ICONS\\Ability_Rhyolith_Volcano", -- [3]
		}, -- [19]
		{
			158420, -- [1]
			"Pulverize (wave #3)", -- [2]
			135242, -- [3]
		}, -- [20]
		{
			158417, -- [1]
			"Pulverize (wave #2)", -- [2]
			135242, -- [3]
		}, -- [21]
		{
			161612, -- [1]
			"Overflowing Energy (caught)", -- [2]
			841219, -- [3]
		}, -- [22]
		{
			98021, -- [1]
			"Health Exchange", -- [2]
			237586, -- [3]
		}, -- [23]
		{
			161576, -- [1]
			"Overflowing Energy (explosion)", -- [2]
			841219, -- [3]
		}, -- [24]
	},
	["lastUpdateWarning"] = 0,
	["plater"] = {
		["realtime_dps_enabled"] = false,
		["damage_taken_anchor"] = {
			["y"] = 0,
			["x"] = 0,
			["side"] = 7,
		},
		["realtime_dps_player_shadow"] = true,
		["damage_taken_enabled"] = false,
		["realtime_dps_player_size"] = 12,
		["damage_taken_size"] = 12,
		["realtime_dps_color"] = {
			1, -- [1]
			1, -- [2]
			0, -- [3]
			1, -- [4]
		},
		["realtime_dps_anchor"] = {
			["y"] = 0,
			["x"] = 0,
			["side"] = 7,
		},
		["realtime_dps_size"] = 12,
		["damage_taken_shadow"] = true,
		["damage_taken_color"] = {
			1, -- [1]
			1, -- [2]
			0, -- [3]
			1, -- [4]
		},
		["realtime_dps_player_color"] = {
			1, -- [1]
			1, -- [2]
			0, -- [3]
			1, -- [4]
		},
		["realtime_dps_player_anchor"] = {
			["y"] = 0,
			["x"] = 0,
			["side"] = 7,
		},
		["realtime_dps_player_enabled"] = false,
		["realtime_dps_shadow"] = true,
	},
}

end
local UploadMasque = function()
MasqueDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["profiles"] = {
		["Default"] = {
			["Preload"] = true,
			["LDB"] = {
				["hide"] = false,
			},
			["Groups"] = {
				["Bartender4_StanceBar"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_Vehicle"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_1"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["ExtraActionButton1_"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_3"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_2"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_BagBar"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_4"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_10"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_9"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_5"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_PetBar"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Masque"] = {
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_7"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_MicroMenu"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_8"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
				["Bartender4_6"] = {
					["Inherit"] = false,
					["SkinID"] = "ViksUI: Buttons",
				},
			},
			["Button"] = {
				["Bartender4_4"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_BagBar"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_StanceBar"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_9"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_Vehicle"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_8"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_7"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_10"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_PetBar"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_3"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_5"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_2"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_MicroMenu"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_1"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
				["Bartender4_6"] = {
					["Gloss"] = 0,
					["SkinID"] = "ViksUI: Buttons",
					["Import"] = false,
				},
			},
			["LDB"] = {
				["hide"] = false,
			},
		},
	},
}	
end
local UploadMBF = function()
MBFDB = {
	["profiles"] = {
		["Default"] = {
			["ButtonOverride"] = {
				[11] = "QueueStatusMinimapButton",
			},
			["columns_or_rows"] = 4,
			["locked"] = true,
			["currentMinimapIcon"] = "QueueStatusMinimapButtonIcon",
			["mbfHidden"] = true,
			["GrowUp"] = false,
			["currentButtonOverride"] = "QueueStatusMinimapButton",
			["minimapButton"] = {
				["minimapPos"] = 192.7577142010699,
			},
			["mbfAnchor"] = "TOPLEFT",
			["MBF_FrameLocation"] = {
				"TOPLEFT", -- [1]
				nil, -- [2]
				-172.2963331240912, -- [3]
				-223.7184393402793, -- [4]
			},
			["currentChild"] = "LibDBIcon10_KLE",
			["colorLocked"] = "All",
			["MinimapIcons"] = {
				[14] = "Compass",
				[17] = "ArchyMinimap",
				[18] = "QueueStatusMinimapButtonIcon",
			},
			["currentTexture"] = "simple Square",
			["customChildren"] = {
				"MinimapButtonFrameDragButton", -- [1]
				"MiniMapMailFrameDisabled", -- [2]
				"LibDBIcon10_MrPlowLDB", -- [3]
				"LibDBIcon10_Bartender4", -- [4]
				"DBMMinimapButton", -- [5]
				"LibDBIcon10_PitBull4", -- [6]
				"LibDBIcon10_Broker_Auditor", -- [7]
				"LibDBIcon10_TravelAgent", -- [8]
				"LibDBIcon10_Omen", -- [9]
				"LibDBIcon10_Skada", -- [10]
				"tdpsButtonFrame", -- [11]
				"LibDBIcon10_DXE", -- [12]
				"LibDBIcon10_Broker_Portals", -- [13]
				"ZygorGuidesViewerMapIcon", -- [14]
				"LibDBIcon10_BugSack", -- [15]
				"FuBarPluginAtlasLootFuFrameMinimapButton", -- [16]
				"OutfitterMinimapButton", -- [17]
				"VuhDoMinimapButton", -- [18]
				"LibDBIcon10_MorgDKP2", -- [19]
				"MageNug_MinimapFrame", -- [20]
				"LibDBIcon10_Broker_Calendar", -- [21]
				"BT_Minimapbtn", -- [22]
				"FuBarPluginBig BrotherFrameMinimapButton", -- [23]
				"LibDBIcon10_ElkGuild", -- [24]
				"RA_MinimapButton", -- [25]
				"Minimalist_Map", -- [26]
				"LibDBIcon10_WoWProIcon", -- [27]
				"LibDBIcon10_AtlasLoot", -- [28]
				"LibDBIcon10_ArchyLDB", -- [29]
				"ArchyMinimap_POI1", -- [30]
				"ArchyMinimap_POI2", -- [31]
				"ArchyMinimap_POI3", -- [32]
				"ArchyMinimap_POI4", -- [33]
				"ArchyMinimap_POI5", -- [34]
				"ArchyMinimap_POI6", -- [35]
				"ArchyMinimap_POI7", -- [36]
				"ArchyMinimap_POI8", -- [37]
				"ArchyMinimap_POI9", -- [38]
				"ArchyMinimap_POI10", -- [39]
				"ArchyMinimap_POI11", -- [40]
				"ArchyMinimap_POI12", -- [41]
				"ArchyMinimap_POI13", -- [42]
				"ArchyMinimap_POI14", -- [43]
				"PS_MinimapButton", -- [44]
				"RBSMinimapButton", -- [45]
				"LibDBIcon10_BigWigs", -- [46]
				"kgPanel7", -- [47]
				"TenTonHammer_MinimapButton", -- [48]
				"LibDBIcon10_KLE", -- [49]
				"Compass", -- [50]
				"LibDBIcon10_MBF", -- [51]
				"LibDBIcon10_Archy", -- [52]
				"LibDBIcon10_TradeSkillMaster", -- [53]
				"bUnitFrames_MinimapButton", -- [54]
				"LibDBIcon10_Masque", -- [55]
				"QueueStatusMinimapButton", -- [56]
				"HealBot_ButtonFrame", -- [57]
				"MMHolder", -- [58]
				"LeftMiniPanel", -- [59]
				"RightMiniPanel", -- [60]
			},
			["padding"] = 3,
		},
	},
}
end

local UploadChat = function()
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)

	FCF_OpenNewWindow("T & L")
	FCF_OpenNewWindow("Guild")
	FCF_DockFrame(ChatFrame3)
	FCF_SetLocked(ChatFrame3, 1)
	FCF_UnDockFrame(ChatFrame4)
	FCF_SetLocked(ChatFrame4, 1)
	ChatFrame4:Show()			
			
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		local chatFrameId = frame:GetID()
		local chatName = FCF_GetChatWindowInfo(chatFrameId)
		
		-- move general bottom left
		if i == 1 then
			frame:ClearAllPoints()
			frame:SetWidth(LChat:GetWidth()-8)
			frame:SetHeight(LChat:GetHeight()-8)
			frame:SetPoint("BOTTOMLEFT",LChat,"BOTTOMLEFT",4,6)
			frame:SetPoint("TOPRIGHT",LChat,"TOPRIGHT",-4,-2)		
		elseif i == 4 then
			frame:ClearAllPoints()
			frame:SetWidth(RChat:GetWidth()-8)
			frame:SetHeight(RChat:GetHeight()-8)
			frame:SetPoint("BOTTOMLEFT",RChat,"BOTTOMLEFT",4,4)
			frame:SetPoint("TOPRIGHT",RChat,"TOPRIGHT",-4,-2)
		end
		
		FCF_SavePositionAndDimensions(frame)
		FCF_StopDragging(frame)
		
		-- set default font size
		FCF_SetChatWindowFontSize(nil, frame, 11)
		
		-- rename windows general because moved to chat #3
		if i == 1 then
			FCF_SetWindowName(frame, "GROUP")
		elseif i == 2 then
			FCF_SetWindowName(frame, "LOG")
		elseif i == 3 then 
			FCF_SetWindowName(frame, "T&G")
		elseif i == 4 then 
			FCF_SetWindowName(frame, "GUILD") 			
		end
	end
	---Chat Channels Setup
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_RemoveChannel(ChatFrame1, TRADE)
	ChatFrame_RemoveChannel(ChatFrame1, GENERAL)
	ChatFrame_RemoveChannel(ChatFrame1, "LocalDefense")
	ChatFrame_RemoveChannel(ChatFrame1, "GuildRecruitment")
	ChatFrame_RemoveChannel(ChatFrame1, "LookingForGroup")
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame1, "PET_BATTLE_INFO")
	-- Setup the Trade / Locale spam chat frame	
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	for _, Channel in pairs(ChatFrame1.channelList) do
		ChatFrame_AddChannel(ChatFrame3, Channel)
	end
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_MISC_INFO")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
	ChatFrame_AddChannel(ChatFrame3, TRADE)
	ChatFrame_AddChannel(ChatFrame3, GENERAL)
	ChatFrame_AddChannel(ChatFrame3, "LocalDefense")
	ChatFrame_AddChannel(ChatFrame3, "GuildRecruitment")
	ChatFrame_AddChannel(ChatFrame3, "LookingForGroup")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame3, "SKILL")
	ChatFrame_AddMessageGroup(ChatFrame3, "CURRENCY")
	ChatFrame_AddMessageGroup(ChatFrame3, "OPENING")
	-- Setup the guild chat frame
	ChatFrame_RemoveAllMessageGroups(ChatFrame4)
	ChatFrame_AddMessageGroup(ChatFrame4, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame4, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame4, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame4, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame4, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame4, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_GUILD_XP_GAIN")
	-- enable classcolor automatically on login and on each character without doing /configure each time.
	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")	
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")		
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL6")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL7")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL8")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL9")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL10")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL11")
	--Adjust Chat Colors
	--General
	ChangeChatColor("CHANNEL1", 195/255, 230/255, 232/255)
	--Trade
	ChangeChatColor("CHANNEL2", 232/255, 158/255, 121/255)
	--Local Defense
	ChangeChatColor("CHANNEL3", 232/255, 228/255, 121/255)
end


local UploadCvar = function()
	SetCVar("statusTextDisplay", "BOTH")
	SetCVar("screenshotQuality", 8)
	SetCVar("cameraDistanceMaxZoomFactor", 2.6)
	SetCVar("showTutorials", 0)
	SetCVar("gameTip", "0")
	SetCVar("UberTooltips", 1)
	SetCVar("chatMouseScroll", 1)
	SetCVar("removeChatDelay", 1)
	SetCVar("chatStyle", "im")
	SetCVar("WholeChatWindowClickable", 0)
	SetCVar("WhisperMode", "inline")
	SetCVar("colorblindMode", 0)
	SetCVar("lootUnderMouse", 0)
	SetCVar("autoLootDefault", 1)
	SetCVar("RotateMinimap", 0)
	SetCVar("autoQuestWatch", 1)
	SetCVar("autoQuestProgress", 1)
	SetCVar("scriptErrors", 1)
	SetCVar("taintLog", 0)
	SetCVar("buffDurations", 1)
	SetCVar("autoOpenLootHistory", 0)
	SetCVar("violenceLevel", 5)
	SetCVar("lossOfControl", 0)
	SetCVar("threatWarning", 3)
	SetCVar('SpamFilter', 0)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("nameplateShowSelf", 0)
	SetCVar("nameplateShowEnemyMinions", 1)
	SetCVar("nameplateShowEnemyPets", 1)
	SetCVar("nameplateShowEnemyGuardians", 1)
	SetCVar("nameplateShowEnemyTotems", 1)
	SetCVar("nameplateShowAll", 1)
	SetCVar("nameplateMaxDistance", 40)
	SetCVar("nameplateTargetBehindMaxDistance", 17)
	SetCVar("nameplateMotionSpeed", 0.16)
	SetCVar("nameplateMinScale", 1)
	SetCVar("nameplateMaxScale", 1)
	SetCVar("nameplateLargerScale", 1)
	SetCVar("nameplateMinAlpha", 1)
	SetCVar("nameplateMaxAlpha", 1)
	SetCVar("nameplateOccludedAlphaMult", 1)
	SetCVar("nameplateMinAlphaDistance", -158489)
	SetCVar("nameplateSelectedScale", 1.15)
	SetCVar("nameplateOtherBottomInSet", -1)
	SetCVar("nameplateOtherTopInSet", -1)
	SetCVar("nameplateSelfBottomInSet", -1)
	SetCVar("nameplateSelfTopInSet", -1)
	SetCVar("nameplateOverlapH", 0.30)
	SetCVar("nameplateOverlapV", 0.50)
	SetCVar("NamePlateHorizontalScale", 1.4)
	SetCVar("NamePlateVerticalScale", 2.7)
	SetCVar("NameplatePersonalHideDelaySeconds", 0.2)
	SetCVar("nameplateShowFriendlyNPCs",1)
end

StaticPopupDialogs.SETTINGS_ALL = {
	text = L_POPUP_SETTINGS_ALL,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		if IsAddOnLoaded("DBM-Core") and C.skins.dbm then T.UploadDBM() end
		if IsAddOnLoaded("BigWigs") and C.skins.bigwigs then T.UploadBW() end
		if IsAddOnLoaded("MikScrollingBattleText") then UploadMSBT() end
		if IsAddOnLoaded("Skada") then UploadSkada() end
		if IsAddOnLoaded("Bartender4") then UploadBartender() end
		UploadChat()
		UploadCvar()
		ReloadUI()
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	preferredIndex = 5,
}

SlashCmdList.SETTINGS = function(msg)
	if msg == "dbm" then
		if IsAddOnLoaded("DBM-Core") then
			if C.skins.dbm == true then
				StaticPopup_Show("SETTINGS_DBM")
			else
				print("|cffffff00"..L_INFO_SKIN_DISABLED1.."DBM"..L_INFO_SKIN_DISABLED2.."|r")
			end
		else
			print("|cffffff00DBM"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "bw" then
		if IsAddOnLoaded("BigWigs") then
			if C.skins.bigwigs == true then
				StaticPopup_Show("SETTINGS_BIGWIGS")
			else
				print("|cffffff00"..L_INFO_SKIN_DISABLED1.."BigWigs"..L_INFO_SKIN_DISABLED2.."|r")
			end
		else
			print("|cffffff00BigWigs"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "msbt" then
		if IsAddOnLoaded("MikScrollingBattleText") then
			UploadMSBT()
			ReloadUI()
		else
			print("|cffffff00MSBT"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "skada" then
		if IsAddOnLoaded("Skada") then
			UploadSkada()
			ReloadUI()
		else
			print("|cffffff00Skada"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "chat" then
			UploadChat()
	elseif msg == "cvar" then
			UploadCvar()
	elseif msg == "details" then
		if IsAddOnLoaded("Details") then
			UploadDetails()
			ReloadUI()
		else
			print("|cffffff00Bartender"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "bartender" then
		if IsAddOnLoaded("Bartender4") then
			UploadBartender()
			ReloadUI()
		else
			print("|cffffff00Bartender"..L_INFO_NOT_INSTALLED.."|r")
		end
	elseif msg == "all" then
		StaticPopup_Show("SETTINGS_ALL")
	else
		print("|cffffff00"..L_INFO_SETTINGS_DBM.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_BIGWIGS.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_MSBT.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_SKADA.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_CHAT.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_CVAR.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_ALL.."|r")
	end
end
SLASH_SETTINGS1 = "/settings"