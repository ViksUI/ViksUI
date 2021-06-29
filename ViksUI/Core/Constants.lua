local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	ViksUI variables
----------------------------------------------------------------------------------------
T.dummy = function() return end
T.name = UnitName("player")
T.class = select(2, UnitClass("player"))
T.level = UnitLevel("player")
T.client = GetLocale()
T.realm = GetRealmName()
T.color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[T.class]
T.version = GetAddOnMetadata("ViksUI", "Version")
T.resolution = ({GetScreenResolutions()})[GetCurrentResolution()] or GetCVar("gxWindowedResolution")
T.screenWidth, T.screenHeight = GetPhysicalScreenSize()
T.newPatch = select(4, GetBuildInfo()) >= 90100
T.TexCoords = {.1, .9, .1, .9}