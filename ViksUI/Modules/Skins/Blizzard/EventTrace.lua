local T, C, L = unpack(ViksUI)
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	EventTrace skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = EventTrace
	T.SkinCloseButton(frame.CloseButton)

	frame:StripTextures()
	frame:SetTemplate("Transparent")

	T.SkinFilter(EventTrace.SubtitleBar.OptionsDropdown, true)
	T.SkinEditBox(EventTrace.Log.Bar.SearchBox, nil, 16)

	if EventTrace.Log.Events.ScrollBar.Background then
		EventTrace.Log.Events.ScrollBar.Background:Hide()
	end

	EventTraceTooltip:HookScript("OnShow", function(self)
		self.NineSlice:SetTemplate("Transparent")
	end)
end

T.SkinFuncs["Blizzard_EventTrace"] = LoadSkin