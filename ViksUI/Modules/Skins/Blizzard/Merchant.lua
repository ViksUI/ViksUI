local T, C, L = unpack(ViksUI)
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Merchant skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	-- Main frames
	MerchantFrame:StripTextures(true)
	MerchantFrame:CreateBackdrop("Transparent")
	MerchantFrame.backdrop:SetPoint("TOPLEFT", 0, 0)
	MerchantFrame.backdrop:SetPoint("BOTTOMRIGHT", 2, 0)

	MerchantFrameInset:StripTextures()
	MerchantMoneyBg:StripTextures()
	MerchantMoneyInset:StripTextures()
	MerchantExtraCurrencyBg:StripTextures()
	MerchantExtraCurrencyInset:StripTextures()
	MerchantFramePortrait:SetAlpha(0)

	-- Skin tabs
	for i = 1, 2 do
		T.SkinTab(_G["MerchantFrameTab"..i])
	end

	-- Icons/merchant slots
	for i = 1, BUYBACK_ITEMS_PER_PAGE do
		local b = _G["MerchantItem"..i.."ItemButton"]
		local t = _G["MerchantItem"..i.."ItemButtonIconTexture"]
		local item_bar = _G["MerchantItem"..i]
		local c = _G["MerchantItem"..i.."AltCurrencyFrameItem1"]

		item_bar:StripTextures(true)
		item_bar:CreateBackdrop("Overlay")

		b:StripTextures()
		b:StyleButton()
		b:SetTemplate("Default")
		b:SetPoint("TOPLEFT", item_bar, "TOPLEFT", 4, -4)

		b.IconBorder:SetAlpha(0)
		if T.newPatch then
			b.IconOverlay:SetAlpha(0) -- Housing decor (maybe change border color instead?)
		end

		t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		t:ClearAllPoints()
		t:SetPoint("TOPLEFT", 2, -2)
		t:SetPoint("BOTTOMRIGHT", -2, 2)

		hooksecurefunc(_G["MerchantItem"..i.."AltCurrencyFrame"], "SetPoint", function(self, _, _, _, x)
			if x == -14 then
				c:SetPoint("LEFT", self, "LEFT", 15, 0)
			elseif x == 0 then
				c:SetPoint("LEFT", self, "LEFT", 14, 5)
			end
		end)

		for j = 1, 3 do
			local c = _G["MerchantItem"..i.."AltCurrencyFrameItem"..j]
			local ct = _G["MerchantItem"..i.."AltCurrencyFrameItem"..j.."Texture"]
			c:CreateBackdrop("Default")
			c.backdrop:SetPoint("TOPLEFT", ct, "TOPLEFT", -2, 2)
			c.backdrop:SetPoint("BOTTOMRIGHT", ct, "BOTTOMRIGHT", 2, -2)
			ct:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		end

		_G["MerchantItem"..i.."MoneyFrame"]:ClearAllPoints()
		_G["MerchantItem"..i.."MoneyFrame"]:SetPoint("BOTTOMLEFT", b, "BOTTOMRIGHT", 3, 0)
	end

	-- Buyback item frame + icon
	MerchantBuyBackItem:StripTextures(true)
	MerchantBuyBackItem:CreateBackdrop("Overlay")
	MerchantBuyBackItem.backdrop:SetPoint("TOPLEFT", -2, 6)
	MerchantBuyBackItem.backdrop:SetPoint("BOTTOMRIGHT", 2, -5)
	MerchantBuyBackItemItemButton:SetPoint("TOPLEFT", MerchantBuyBackItem, "TOPLEFT", 4, 0)

	MerchantBuyBackItemItemButton:StripTextures()
	MerchantBuyBackItemItemButton:StyleButton()
	MerchantBuyBackItemItemButton:SetTemplate("Default")
	MerchantBuyBackItemItemButtonIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	MerchantBuyBackItemItemButtonIconTexture:ClearAllPoints()
	MerchantBuyBackItemItemButtonIconTexture:SetPoint("TOPLEFT", 2, -2)
	MerchantBuyBackItemItemButtonIconTexture:SetPoint("BOTTOMRIGHT", -2, 2)
	MerchantBuyBackItemItemButton.IconBorder:SetAlpha(0)

	MerchantRepairItemButton:StyleButton()
	MerchantRepairItemButton:SetTemplate("Default")
	MerchantRepairItemButton:GetRegions():SetTexCoord(0.04, 0.24, 0.06, 0.5)
	MerchantRepairItemButton:GetRegions():SetInside()
	MerchantRepairItemButton.Icon:CropIcon()

	MerchantRepairAllButton:StyleButton()
	MerchantRepairAllButton:SetTemplate("Default")
	MerchantRepairAllButton:GetRegions():SetTexCoord(0.61, 0.82, 0.1, 0.52)
	MerchantRepairAllButton:GetRegions():SetInside()
	MerchantRepairAllButton.Icon:CropIcon()

	MerchantGuildBankRepairButton:StyleButton()
	MerchantGuildBankRepairButton:SetTemplate("Default")
	MerchantGuildBankRepairButton:GetRegions():SetTexCoord(0.61, 0.82, 0.1, 0.52)
	MerchantGuildBankRepairButton:GetRegions():SetInside()
	MerchantGuildBankRepairButton.Icon:CropIcon()

	local junk = MerchantSellAllJunkButton
	if junk then
		junk:StyleButton()
		junk:SetTemplate("Default")
		junk:GetRegions():SetTexCoord(0.61, 0.82, 0.1, 0.52)
		junk:GetRegions():SetInside()
		junk.Icon:CropIcon()
	end

	-- Misc frames
	T.SkinCloseButton(MerchantFrameCloseButton, MerchantFrame.backdrop)
	T.SkinNextPrevButton(MerchantNextPageButton)
	T.SkinNextPrevButton(MerchantPrevPageButton)
	T.SkinDropDownBox(MerchantFrame.FilterDropdown)

	-- Reposition tabs
	MerchantFrameTab1:ClearAllPoints()
	MerchantFrameTab1:SetPoint("TOPLEFT", MerchantFrame.backdrop, "BOTTOMLEFT", 0, 2)

	hooksecurefunc("MerchantFrame_UpdateCurrencies", function()
		for i = 1, MAX_MERCHANT_CURRENCIES do
			local b = _G["MerchantToken"..i]

			if b and not b.reskinned then
				local t = _G["MerchantToken"..i].Icon
				local c = _G["MerchantToken"..i].Count
				t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				c:SetPoint("RIGHT", t, "LEFT", -3, 0)

				b:CreateBackdrop("Default")
				b.backdrop:SetPoint("TOPLEFT", t, "TOPLEFT", -2, 2)
				b.backdrop:SetPoint("BOTTOMRIGHT", t, "BOTTOMRIGHT", 2, -2)

				b.reskinned = true
			end
		end
	end)
end

tinsert(T.SkinFuncs["ViksUI"], LoadSkin)