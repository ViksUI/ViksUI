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
					["barslocked"] = true,
					["modeincombat"] = "Threat",
					["y"] = 80.5010528564453,
					["x"] = -340.9990234375,
					["name"] = "Threath",
					["point"] = "BOTTOMRIGHT",
					["barwidth"] = 167.000061035156,
					["mode"] = "Threat",
					["enablebackground"] = true,
					["background"] = {
						["borderthickness"] = 2,
						["height"] = 79.0000610351563,
					},
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
					["x"] = -340.9996006869089,
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
					["barwidth"] = 166.9996692109227,
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
						["height"] = 53.99990795077569,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
					["y"] = 5.000074473703773,
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
					["barwidth"] = 163.0001646080854,
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
						["height"] = 160.0000021883917,
						["bordertexture"] = "None",
						["margin"] = -0,
						["texture"] = "Solid",
					},
					["y"] = 5.000234226295153,
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
		},
	},
}
end

local UploadBartender = function()
Bartender4DB = {
	["namespaces"] = {
		["ActionBars"] = {
			["profiles"] = {
				["ViksUI"] = {
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
							["fadeoutalpha"] = 0.3,
							["version"] = 3,
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
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["padding"] = 3,
						}, -- [5]
						{
							["showgrid"] = true,
							["rows"] = 12,
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
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["version"] = 3,
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
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["padding"] = 3,
						}, -- [8]
						{
							["showgrid"] = true,
							["rows"] = 6,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [9]
						{
							["showgrid"] = true,
							["rows"] = 7,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["version"] = 3,
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
							["fadeoutalpha"] = 0.3,
							["version"] = 3,
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
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = false,
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
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 113,
								["x"] = 279,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["padding"] = 3,
						}, -- [5]
						{
							["showgrid"] = true,
							["rows"] = 12,
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
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["version"] = 3,
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
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["padding"] = 3,
						}, -- [8]
						{
							["showgrid"] = true,
							["rows"] = 6,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["version"] = 3,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["padding"] = 6,
						}, -- [9]
						{
							["showgrid"] = true,
							["rows"] = 7,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["enabled"] = true,
							["buttons"] = 6,
							["hidemacrotext"] = true,
							["version"] = 3,
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
							["fadeoutalpha"] = 0.3,
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["version"] = 3,
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
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["version"] = 3,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["rows"] = 6,
							["padding"] = 6,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [3]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["version"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["rows"] = 2,
							["padding"] = 3,
							["hidemacrotext"] = true,
							["showgrid"] = true,
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
							["padding"] = 11,
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["rows"] = 6,
						}, -- [6]
						{
							["position"] = {
								["y"] = 144.5,
								["x"] = 351.5,
								["point"] = "CENTER",
							},
							["version"] = 3,
							["showgrid"] = true,
							["rows"] = 6,
							["padding"] = 11,
							["visibility"] = {
								["custom"] = false,
								["customdata"] = "[mod:ctrl]show;hide",
							},
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
						}, -- [7]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["version"] = 3,
							["position"] = {
								["y"] = 112.5,
								["x"] = -372,
								["point"] = "BOTTOM",
								["scale"] = 0.75,
							},
							["rows"] = 2,
							["padding"] = 3,
							["hidemacrotext"] = true,
							["showgrid"] = true,
						}, -- [8]
						{
							["skin"] = {
								["ID"] = "ViksUI: Buttons",
								["Backdrop"] = false,
							},
							["buttons"] = 6,
							["version"] = 3,
							["position"] = {
								["y"] = 180,
								["x"] = 624,
								["point"] = "BOTTOM",
								["scale"] = 0.7,
							},
							["rows"] = 6,
							["padding"] = 6,
							["hidemacrotext"] = true,
							["showgrid"] = true,
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
			},
		},
		["APBar"] = {
		},
		["LibDualSpec-1.0"] = {
		},
		["ExtraActionBar"] = {
			["profiles"] = {
				["ViksUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = 150,
						["point"] = "CENTER",
						["scale"] = 1.5,
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogue"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = 150,
						["point"] = "CENTER",
						["scale"] = 1.5,
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
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
			},
		},
		["ZoneAbilityBar"] = {
			["profiles"] = {
				["ViksUI"] = {
					["position"] = {
						["y"] = -40.7499389648438,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
					["version"] = 3,
				},
				["ViksUIRogue"] = {
					["position"] = {
						["y"] = -40.7500305175781,
						["x"] = 181.750122070313,
						["point"] = "CENTER",
					},
					["version"] = 3,
				},
				["ViksUIDruid"] = {
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
				["ViksUI"] = {
					["position"] = {
						["y"] = 222,
						["x"] = -306,
						["point"] = "BOTTOMRIGHT",
					},
					["version"] = 3,
					["visibility"] = {
						["custom"] = true,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogue"] = {
					["fadeoutalpha"] = 0,
					["fadeoutdelay"] = 0,
					["version"] = 3,
					["position"] = {
						["y"] = 222,
						["x"] = -306,
						["point"] = "BOTTOMRIGHT",
					},
					["fadeout"] = true,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIDruid"] = {
					["version"] = 3,
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
					["fadeoutalpha"] = 0,
					["visibility"] = {
						["custom"] = false,
						["customdata"] = "[mod:ctrl-Shift]show;hide",
					},
					["fadeoutdelay"] = 0.69,
				},
			},
		},
		["XPBar"] = {
			["profiles"] = {
				["ViksUI"] = {
					["position"] = {
						["y"] = 57,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
				["ViksUIRogue"] = {
					["position"] = {
						["y"] = 57,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
				["ViksUIDruid"] = {
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
				["ViksUI"] = {
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
				["ViksUIRogue"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 47,
						["x"] = -512,
						["point"] = "BOTTOM",
					},
				},
				["ViksUIDruid"] = {
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
				["ViksUI"] = {
					["version"] = 3,
					["position"] = {
						["y"] = 83.2500610351563,
						["x"] = 203.750122070313,
						["point"] = "CENTER",
					},
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
				},
				["ViksUIRogue"] = {
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
			},
		},
		["BagBar"] = {
			["profiles"] = {
				["ViksUI"] = {
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
				["ViksUIRogue"] = {
					["enabled"] = false,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["onebag"] = true,
					["version"] = 3,
					["position"] = {
						["y"] = 41.75,
						["x"] = 463.5,
						["point"] = "BOTTOM",
					},
				},
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
			},
		},
		["StanceBar"] = {
			["profiles"] = {
				["ViksUI"] = {
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["version"] = 3,
					["padding"] = 7,
					["visibility"] = {
						["custom"] = false,
						["always"] = false,
						["possess"] = false,
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
				["ViksUIRogue"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
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
					["position"] = {
						["y"] = 238.249992370606,
						["x"] = 334.999969482422,
						["point"] = "BOTTOMLEFT",
						["scale"] = 0.75,
					},
				},
				["ViksUIDruid"] = {
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
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
					["position"] = {
						["y"] = 209,
						["x"] = 335,
						["point"] = "BOTTOMLEFT",
						["scale"] = 0.75,
					},
				},
			},
		},
		["PetBar"] = {
			["profiles"] = {
				["ViksUI"] = {
					["position"] = {
						["y"] = 43.4560381037409,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["scale"] = 0.600000023841858,
					},
					["fadeoutdelay"] = 0.1,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutalpha"] = 1,
					["padding"] = 15,
					["visibility"] = {
						["possess"] = false,
						["always"] = false,
					},
					["version"] = 3,
				},
				["ViksUIRogue"] = {
					["fadeoutdelay"] = 0.1,
					["version"] = 3,
					["skin"] = {
						["ID"] = "ViksUI: Buttons",
						["Backdrop"] = false,
					},
					["fadeoutalpha"] = 1,
					["padding"] = 15,
					["visibility"] = {
						["possess"] = false,
						["always"] = false,
					},
					["position"] = {
						["y"] = 43.4560381037409,
						["x"] = -133.200113630301,
						["point"] = "BOTTOM",
						["scale"] = 0.600000023841858,
					},
				},
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
			},
		},
		["RepBar"] = {
			["profiles"] = {
				["ViksUI"] = {
					["position"] = {
						["y"] = 65,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
				["ViksUIRogue"] = {
					["position"] = {
						["y"] = 65,
						["x"] = -516,
						["point"] = "BOTTOM",
					},
					["version"] = 3,
				},
				["ViksUIDruid"] = {
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
		["ViksUI"] = {
			["selfcastmodifier"] = false,
			["buttonlock"] = true,
			["onkeydown"] = true,
			["minimapIcon"] = {
				["hide"] = true,
			},
		},
		["ViksUIRogue"] = {
			["minimapIcon"] = {
				["hide"] = true,
			},
			["buttonlock"] = true,
			["onkeydown"] = true,
			["selfcastmodifier"] = false,
		},
		["ViksUIDruid"] = {
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
	-- Setup the Trade / Locale spam chat frame	
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddChannel(ChatFrame3, "Trade")
	ChatFrame_AddChannel(ChatFrame3, "General")
	ChatFrame_AddChannel(ChatFrame3, "LocalDefense")
	ChatFrame_AddChannel(ChatFrame3, "GuildRecruitment")
	ChatFrame_AddChannel(ChatFrame3, "LookingForGroup")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame3, "SKILL")
	ChatFrame_AddMessageGroup(ChatFrame3, "CURRENCY")
	ChatFrame_AddMessageGroup(ChatFrame3, "OPENING")
	ChatFrame_AddMessageGroup(ChatFrame3, "TRADESKILLS")
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
	--SetCVar("alternateResourceText", 1)
	SetCVar("statusTextDisplay", "BOTH")
	SetCVar("screenshotQuality", 10)
	SetCVar("cameraDistanceMaxZoomFactor", 2.6)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("showTutorials", 0)
	SetCVar("gameTip", "0")
	SetCVar("UberTooltips", 1)
	SetCVar("chatMouseScroll", 1)
	SetCVar("removeChatDelay", 1)
	SetCVar("chatStyle", "im")
	SetCVar("WholeChatWindowClickable", 0)
	--SetCVar("ConversationMode", 1)
	SetCVar("WhisperMode", "inline")
	--SetCVar("BnWhisperMode", "inline")
	SetCVar("colorblindMode", 0)
	SetCVar("lootUnderMouse", 0)
	SetCVar("autoLootDefault", 1)
	SetCVar("RotateMinimap", 0)
	--SetCVar("ConsolidateBuffs", 0)
	SetCVar("autoQuestProgress", 1)
	SetCVar("scriptErrors", 1)
	SetCVar("taintLog", 0)
	SetCVar("buffDurations", 1)
	--SetCVar("enableCombatText", 1)
	SetCVar("autoOpenLootHistory", 0)
	SetCVar("lossOfControl", 0)
	SetCVar("threatWarning", 3)
	SetCVar('SpamFilter', 0)
end

StaticPopupDialogs.SETTINGS_ALL = {
	text = L_POPUP_SETTINGS_ALL,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		if IsAddOnLoaded("DBM-Core") and C.skins.dbm then T.UploadDBM() end
		if IsAddOnLoaded("DXE") and C.skins.dxe then T.UploadDXE() end
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
	elseif msg == "dxe" then
		if IsAddOnLoaded("DXE") then
			if C.skins.dxe == true then
				StaticPopup_Show("SETTINGS_DXE")
			else
				print("|cffffff00"..L_INFO_SKIN_DISABLED1.."DXE"..L_INFO_SKIN_DISABLED2.."|r")
			end
		else
			print("|cffffff00DXE"..L_INFO_NOT_INSTALLED.."|r")
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
			ReloadUI()
	elseif msg == "cvar" then
			UploadCvar()
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
		print("|cffffff00"..L_INFO_SETTINGS_DXE.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_MSBT.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_SKADA.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_CHAT.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_CVAR.."|r")
		print("|cffffff00"..L_INFO_SETTINGS_ALL.."|r")
	end
end
SLASH_SETTINGS1 = "/settings"