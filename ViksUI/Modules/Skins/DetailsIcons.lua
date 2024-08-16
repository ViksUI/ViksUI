local T, C, L = unpack(ViksUI)
if not C_AddOns.IsAddOnLoaded("Details") then return end

local function LoadSkin()

	local iconsPath = "Interface\\AddOns\\ViksUI\\Media\\Textures\\Details\\"
	local logoPath = "Interface\\AddOns\\ViksUI\\Media\\Textures\\viksicon.blp"
	local coords = { 0, 1, 0, 1 }

	Details:AddCustomIconSet(iconsPath .. "details_roles.tga", "ViksUI", false, logoPath, coords)
	Details:AddCustomIconSet(iconsPath .. "details_white.tga", "ViksUI" .. "white", false, logoPath, coords)
	
	
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)