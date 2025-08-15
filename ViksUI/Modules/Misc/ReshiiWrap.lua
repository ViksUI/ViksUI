local T, C, L = unpack(ViksUI)

if C.misc.reshiiWrapsUpgrade ~= true then return end

local WARPS_TREE_ID = 1115
local WARPS_ITEM_ID = 235499

local ScrollButtonIcon = "|TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:127:204|t"

function ReshiiWrapsUpgrade()
	_G.CharacterBackSlot:HookScript("OnMouseDown", function(_, button)
		if button == "MiddleButton" then
			local itemID = GetInventoryItemID("player", INVSLOT_BACK)
			if itemID and itemID == WARPS_ITEM_ID then
				if not InCombatLockdown() then
					GenericTraitUI_LoadUI()
					_G.GenericTraitFrame:SetTreeID(WARPS_TREE_ID)
					ShowUIPanel(_G.GenericTraitFrame)
				else
					_G.UIErrorsFrame:AddMessage(_G.ERR_NOT_IN_COMBAT)
				end
			end
		end
	end)
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(tooltip, data)
	if tooltip:GetOwner() ~= _G.CharacterBackSlot or data.id ~= WARPS_ITEM_ID then
		return
	end

	tooltip:AddLine(" ")
	tooltip:AddDoubleLine(
		format("%s %s", ScrollButtonIcon, "Middle Button"),
		"Open Upgrade Menu"
	)
end)

ReshiiWrapsUpgrade()