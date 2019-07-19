local T, C, L, _ = unpack(select(2, ...))
if C.aura.player_auras ~= true then return end

local frame = ViksUIAuras
local content = ViksUIAuras.content
local wrap = 18

BuffFrame:Kill()
TemporaryEnchantFrame:Kill()
InterfaceOptionsFrameCategoriesButton12:SetScale(0.00001)
InterfaceOptionsFrameCategoriesButton12:SetAlpha(0)

for _, frame in next, {
	'ViksUIAurasPlayerBuffs',
} do
	local header
	local wrap
	wrap = wrap

	header = CreateFrame('Frame', frame, oUF_PetBattleFrameHider, 'SecureAuraHeaderTemplate')
	header:SetClampedToScreen(true)
	header:SetMovable(true)
	header:SetAttribute('minHeight', 30)
	header:SetAttribute('wrapAfter', 18)
	header:SetAttribute('wrapYOffset', -74)
	header:SetAttribute('xOffset', -35)
	header:CreateBackdrop("Overlay")
	header.backdrop:SetBackdropBorderColor(1, 0, 0)
	header.backdrop:FontString("text", C.media.normal_font, 12)
	header.backdrop.text:SetPoint('CENTER')
	header.backdrop.text:SetText("Move Buffs")
	header.backdrop:SetAlpha(0)
	header:SetAttribute(50, 18 * 35)
	header:SetAttribute('template', 'ViksUIAurasAuraTemplate')

	header:SetAttribute('weaponTemplate', 'ViksUIAurasAuraTemplate')
	header:SetSize(30, 30)

	RegisterAttributeDriver(header, 'unit', '[vehicleui] vehicle; player')
	table.insert(content, header)
end

for _, frame in next, {
	'ViksUIAurasPlayerDebuffs',
} do
	local header
	local wrap
	wrap = wrap

	header = CreateFrame('Frame', frame, oUF_PetBattleFrameHider, 'SecureAuraHeaderTemplate')
	header:SetClampedToScreen(true)
	header:SetMovable(true)
	header:SetAttribute('minHeight', 30)
	header:SetAttribute('wrapAfter', 18)
	header:SetAttribute('wrapYOffset', -74)
	header:SetAttribute('xOffset', -55)
	--header:CreateBackdropn()
	--header.backdrop:SetBackdropBorderColor(1, 0, 0)
	--header.backdrop:SetFont(C.font.auras_font, C.font.auras_font_size, C.font.auras_font_style)
	--header.backdrop.text:SetPoint('CENTER')
	--header.backdrop.text:SetText(L['move']['buffs'])
	--header.backdrop:SetAlpha(0)
	header:SetAttribute(50, 18 * 35)
	header:SetAttribute('template', 'ViksUIDebuffAuraTemplate')
	--header:SetAttribute('debuff', 'ViksUIDebuffAuraTemplate')
	--header:SetAttribute('weaponTemplate', 'ViksUIAurasAuraTemplate')
	header:SetSize(30, 30)

	RegisterAttributeDriver(header, 'unit', '[vehicleui] vehicle; player')
	table.insert(content, header)
end
local buffs = ViksUIAurasPlayerBuffs
local debuffs = ViksUIAurasPlayerDebuffs

local filter = 0

buffs:SetPoint('TOPRIGHT', Minimap, 'TOPLEFT', -7, 2)
buffs:SetAttribute('filter', 'HELPFUL')
buffs:SetAttribute('includeWeapons', 1)
buffs:Show()
--move:RegisterFrame(buffs)

debuffs:SetPoint('BOTTOMRIGHT', Minimap, 'BOTTOMLEFT', -7, -2)
debuffs:SetAttribute('filter', 'HARMFUL')
debuffs:Show()
--move:RegisterFrame(debuffs)