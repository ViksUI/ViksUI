local T, C, L = unpack(ViksUI)
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	QuickKeybind skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = _G.QuickKeybindFrame
	T.SkinFrame(frame)

	frame.Header:StripTextures()

	T.SkinCheckBox(frame.UseCharacterBindingsButton, 26)
	frame.OkayButton:SkinButton()
	frame.DefaultsButton:SkinButton()
	frame.CancelButton:SkinButton()
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)