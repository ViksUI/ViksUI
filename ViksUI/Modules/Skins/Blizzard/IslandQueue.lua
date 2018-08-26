local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

--Cache global variables
--Lua functions
local _G = _G

--WoW API / Variables

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS:

local function LoadSkin()

	local IslandsFrame = _G["IslandsQueueFrame"]
	IslandsFrame:StripTextures()
	IslandsQueueFrame.ArtOverlayFrame.PortraitFrame:SetAlpha(0)
	IslandsQueueFrame.ArtOverlayFrame.portrait:SetAlpha(0)
	IslandsQueueFrame.portrait:Hide()

	IslandsFrame:CreateBackdrop("Transparent")

	T.SkinCloseButton(IslandsQueueFrameCloseButton)
	T:HandleButton(IslandsFrame.DifficultySelectorFrame.QueueButton)

	local WeeklyQuest = IslandsFrame.WeeklyQuest
	local StatusBar = WeeklyQuest.StatusBar
	WeeklyQuest.OverlayFrame:StripTextures()

	-- StatusBar
	StatusBar:SetStatusBarTexture(C.media.texture)
	StatusBar:CreateBackdrop("Default")

	--StatusBar Icon
	WeeklyQuest.QuestReward.Icon:SetTexCoord(unpack(T.TexCoords))

	-- Maybe Adjust me
	local TutorialFrame = IslandsFrame.TutorialFrame
	T:HandleButton(TutorialFrame.Leave)
	T.SkinCloseButton(TutorialFrame.CloseButton)
end

T.SkinFuncs["Blizzard_IslandsQueueUI"] = LoadSkin
