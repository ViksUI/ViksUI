local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

local _G = _G

local function LoadSkin()
	local MissionFrame = _G["BFAMissionFrame"]
	MissionFrame.GarrCorners:Hide()
	MissionFrame.CloseButtonBorder:Hide()
	MissionFrame.TitleScroll:Hide()
	MissionFrame.BackgroundTile:Kill()
	MissionFrame.Left:Hide()
	MissionFrame.Bottom:Hide()
	MissionFrame.Top:Hide()
	MissionFrame.Right:Hide()

	MissionFrame:CreateBackdrop("Transparent")

	T.SkinCloseButton(MissionFrame.CloseButton)

	for i = 1, 3 do
		T.SkinTab(_G["BFAMissionFrameTab"..i])
	end

	-- Missions
	T:HandleButton(BFAMissionFrameMissions.CompleteDialog.BorderFrame.ViewButton)

	-- Mission Tab
	local MissionTab = MissionFrame.MissionTab

	T.SkinCloseButton(MissionTab.MissionPage.CloseButton)
	T:HandleButton(MissionTab.MissionPage.StartMissionButton)
	T:HandleScrollBar(_G["BFAMissionFrameMissionsListScrollFrameScrollBar"])

	-- Follower Tab
	local Follower = _G["BFAMissionFrameFollowers"]
	local XPBar = MissionFrame.FollowerTab.XPBar
	local Class = MissionFrame.FollowerTab.Class
	Follower:StripTextures()
	Follower:SetTemplate("Transparent")
	T.SkinEditBox:HandleEditBox(Follower.SearchBox)
	hooksecurefunc(Follower, "ShowFollower", function(self)
		T:HandleFollowerPage(self, true, true)
	end)
	T:HandleScrollBar(_G["BFAMissionFrameFollowersListScrollFrameScrollBar"])

	T:HandleFollowerListOnUpdateData("BFAMissionFrameFollowers") -- The function needs to be updated for BFA

	XPBar:StripTextures()
	XPBar:SetStatusBarTexture(C["media"].normTex)
	XPBar:CreateBackdrop()

	Class:SetSize(50, 43)
end
T.SkinFuncs["Blizzard_GarrisonUI"] = LoadSkin
