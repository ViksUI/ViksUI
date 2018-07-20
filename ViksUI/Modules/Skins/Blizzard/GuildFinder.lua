local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

--Cache global variables
--Lua functions
local _G = _G
local pairs = pairs
--WoW API / Variables

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS:

local function SkinLFGuild()

	LookingForGuildFrame:StripTextures()
	LookingForGuildFrame:SetTemplate("Transparent")
	LookingForGuildFrameInset:StripTextures(false)

	local checkbox = {
		"LookingForGuildPvPButton",
		"LookingForGuildWeekendsButton",
		"LookingForGuildWeekdaysButton",
		"LookingForGuildRPButton",
		"LookingForGuildRaidButton",
		"LookingForGuildQuestButton",
		"LookingForGuildDungeonButton",
	}

	-- skin checkboxes
	for _, v in pairs(checkbox) do
		T.SkinCheckBox(_G[v])
	end

	-- have to skin these checkboxes seperate for some reason o_O
	T.SkinCheckBox(LookingForGuildTankButton.checkButton)
	T.SkinCheckBox(LookingForGuildHealerButton.checkButton)
	T.SkinCheckBox(LookingForGuildDamagerButton.checkButton)

	LookingForGuildBrowseButton_LeftSeparator:Kill()
	LookingForGuildRequestButton_RightSeparator:Kill()
	T:HandleScrollBar(LookingForGuildBrowseFrameContainerScrollBar)
	T:HandleButton(LookingForGuildBrowseButton)
	T:HandleButton(LookingForGuildRequestButton)
	T.SkinCloseButton(LookingForGuildFrameCloseButton)
	LookingForGuildCommentInputFrame:CreateBackdrop("Default")
	LookingForGuildCommentInputFrame:StripTextures(false)

	-- skin container buttons on browse and request page
	for i = 1, 5 do
		local b = _G["LookingForGuildBrowseFrameContainerButton"..i]
		local t = _G["LookingForGuildAppsFrameContainerButton"..i]
		b:SetBackdrop(nil)
		t:SetBackdrop(nil)
	end

	-- skin tabs
	for i= 1, 3 do
		T.SkinTab(_G["LookingForGuildFrameTab"..i])
	end

	GuildFinderRequestMembershipFrame:StripTextures(true)
	GuildFinderRequestMembershipFrame:SetTemplate("Transparent")
	T:HandleButton(GuildFinderRequestMembershipFrameAcceptButton)
	T:HandleButton(GuildFinderRequestMembershipFrameCancelButton)
	GuildFinderRequestMembershipFrameInputFrame:StripTextures()
	GuildFinderRequestMembershipFrameInputFrame:SetTemplate("Default")
end

local function LoadSkin()
	if LookingForGuildFrame then
		--Frame already created
		SkinLFGuild()
	else
		--Frame not created yet, wait until it is
		hooksecurefunc("LookingForGuildFrame_CreateUIElements", SkinLFGuild)
	end
end

T.SkinFuncs["Blizzard_LookingForGuildUI"] = LoadSkin