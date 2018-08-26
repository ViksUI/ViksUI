local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

--Cache global variables
--Lua functions
local _G = _G

--WoW API / Variables

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS:

local function LoadSkin()

	local IslandsPartyPoseFrame = _G["IslandsPartyPoseFrame"]
	IslandsPartyPoseFrame:StripTextures()
	IslandsPartyPoseFrame:CreateBackdrop("Transparent")

	T:HandleButton(IslandsPartyPoseFrame.LeaveButton)
end

T.SkinFuncs["Blizzard_IslandsPartyPoseUI"] = LoadSkin