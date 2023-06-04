local T, C, L = unpack(ViksUI)
local MSQ = LibStub("Masque", true)
if not MSQ then return end

local _, class = UnitClass("player")
local r, g, b = unpack(C.media.border_color)


-- ViksUI: Buffs
MSQ:AddSkin("ViksUI: Buffs", {
	Author = "Viking",
	Version = "4.3",
	Shape = "Square",
	Masque_Version = 40200,
	Backdrop = {
		Width = 40,
		Height = 40,
		Color = {0.2, 0.2, 0.2, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Overlay]],
	},
	Icon = {
		Width = 36,
		Height = 36,
		TexCoords = {0.08, 0.92, 0.08, 0.92},
		OffsetX = 0,
		OffsetY = 0,
	},
	Flash = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Overlay]],
	},
	Cooldown = {
		Width = 40,
		Height = 40,
	},
	AutoCast = {
		Width = 40,
		Height = 40,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 40,
		Height = 40,
		Static = true,
		Color = {r, g, b, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Normal]],
	},
	Pushed = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Highlight]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "BLEND",
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Border]],
	},
	Disabled = {
		Width = 40,
		Height = 40,
		BlendMode = "BLEND",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Border]],
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Highlight]],
	},
	Gloss = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "TOP",
		OffsetX = -4,
		OffsetY = -4,
		Font = "Interface\\Addons\\ViksUI\\Media\\Masque\\HOOG0555.ttf",
		FontSize = 16
	},
	Count = {
		Width = 40,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "BOTTOM",
	},
	Name = {
		Width = 40,
		Height = 10,
		JustifyH = "CENTER",
		JustifyV = "BOTTOM",
		Font = "Interface\\Addons\\ViksUI\\Media\\Masque\\HOOG0555.ttf",
		FontSize = 14
	},
}, true)


-- ViksUI: Debuffs
MSQ:AddSkin("ViksUI: Debuffs", {
MSQ_Version = 40000,
	Backdrop = {
		Width = 40,
		Height = 40,
		Color = {0.2, 0.2, 0.2, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Background]],
	},
	Icon = {
		Width = 36,
		Height = 36,
		TexCoords = {0.08, 0.92, 0.08, 0.92},
		OffsetX = 0,
		OffsetY = 0,
	},
	Flash = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Overlay]],
	},
	Cooldown = {
		Width = 40,
		Height = 40,
	},
	AutoCast = {
		Width = 40,
		Height = 40,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 40,
		Height = 40,
		Static = true,
		Color = {1, 0, 0, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Normal]],
	},
	Pushed = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Highlight]],
	},
	Border = {
		Width = 50,
		Height = 50,
		BlendMode = "BLEND",
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Border]],
	},
	Disabled = {
		Width = 40,
		Height = 40,
		BlendMode = "BLEND",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Border]],
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Highlight]],
	},
	Gloss = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 14,
		JustifyH = "RIGHT",
		JustifyV = "TOP",
		OffsetX = -4,
		OffsetY = -4,
		Font = "Interface\\Addons\\ViksUI\\Media\\Masque\\HOOG0555.ttf",
		FontSize = 16
	},
	Count = {
		Width = 40,
		Height = 14,
		JustifyH = "RIGHT",
		JustifyV = "BOTTOM",
	},
	Name = {
		Width = 40,
		Height = 10,
		JustifyH = "CENTER",
		JustifyV = "BOTTOM",
		Font = "Interface\\Addons\\ViksUI\\Media\\Masque\\HOOG0555.ttf",
		FontSize = 14
	},
}, true)


-- ViksUI: Buttons
MSQ:AddSkin("ViksUI: Buttons", {
	Author = "ViksUI",
	Version = "5.4",
	Shape = "Square",
	Masque_Version = 40300,
	Backdrop = {
		Width = 42,
		Height = 42,
		Color = {0.4, 0.4, 0.4, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Backdrop]],
	},
	Icon = {
		Width = 29,
		Height = 29,
		TexCoords = {0.08, 0.92, 0.08, 0.92},
	},
	Flash = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Overlay]],
	},
	Cooldown = {
		Width = 30,
		Height = 30,
	},
	AutoCast = {
		Width = 36,
		Height = 36,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 34,
		Height = 34,
		Static = true,
		Color = {r, g, b, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Normal]],
	},
	Pushed = {
		Width = 38,
		Height = 38,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Highlight]],
	},
	Border = {
		Width = 34,
		Height = 34,
		BlendMode = "BLEND",
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Border]],
	},
	Disabled = {
		Width = 44,
		Height = 44,
		BlendMode = "BLEND",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Border]],
	},
	Checked = {
		Width = 38,
		Height = 38,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Highlight]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\Addons\ViksUI\Media\Masque\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "TOP",
		OffsetX = -4,
		OffsetY = -4,
		Font = "Interface\\Addons\\ViksUI\\Media\\Masque\\HOOG0555.ttf",
		FontSize = 16
	},
		Duration = {
		Width = 42,
		Height = 10,
		OffsetY = -3,
	},
	Count = {
		Width = 42,
		Height = 10,
		JustifyH = "RIGHT",
		JustifyV = "BOTTOM",
	},
	Name = {
		Width = 42,
		Height = 10,
		JustifyH = "CENTER",
		JustifyV = "BOTTOM",
		Font = "Interface\\Addons\\ViksUI\\Media\\Masque\\HOOG0555.ttf",
		FontSize = 14
	},
}, true)

------------------------------------------------------------------------------------------
--	Kill textture for ExtraActionBarFrame & Add new profile to Masque
------------------------------------------------------------------------------------------
local button = ExtraActionButton1
local texture = button.style
local icon = button.icon
local disableTexture = function(style, texture)
	if texture then
		style:SetTexture(nil)
	end
end
icon:SetTexCoord(.08, .92, .08, .92)
icon:SetPoint("TOPLEFT", button, 2,-2)
icon:SetPoint("BOTTOMRIGHT", button, -2,2)
button.style:SetTexture(nil)
hooksecurefunc(texture, "SetTexture", disableTexture)

--Creating Masque group for the button
local MSQ = LibStub and LibStub("Masque", true)
if MSQ then
	MSQ:Group("ExtraActionButton1_"):AddButton(ExtraActionButton1)
end
