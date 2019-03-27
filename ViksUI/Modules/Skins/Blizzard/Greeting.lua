local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	QuestGreeting skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	-- QuestGreeting
	local function UpdateGreetingPanel()
		QuestFrameGreetingPanel:StripTextures()
		QuestFrameGreetingGoodbyeButton:SkinButton()
		GreetingText:SetTextColor(1, 1, 1)
		CurrentQuestsText:SetTextColor(1, 0.8, 0)
		AvailableQuestsText:SetTextColor(1, 0.8, 0)
		QuestGreetingFrameHorizontalBreak:Kill()

		for button in QuestFrameGreetingPanel.titleButtonPool:EnumerateActive() do
			local text = button:GetFontString():GetText()
			if text and strfind(text, "|cff000000") then
				button:GetFontString():SetText(gsub(text, "|cff000000", "|cffFFFF00"))
			end
		end
	end

	QuestFrameGreetingPanel:HookScript("OnShow", UpdateGreetingPanel)
	hooksecurefunc("QuestFrameGreetingPanel_OnShow", UpdateGreetingPanel)
end


tinsert(T.SkinFuncs["ViksUI"], LoadSkin)