local T, C, L, _ = unpack(select(2, ...))

local Locale = GetLocale()

C["Medias"] = {
	-- Fonts
	["Font"] = [[Interface\AddOns\ViksUI\Media\Font\normal_font.ttf]],
	["UnitFrameFont"] = [[Interface\AddOns\ViksUI\Media\Font\uf_font.ttf]],
	["DamageFont"] = [[Interface\AddOns\ViksUI\Media\Font\normal_font.ttf]],
	["PixelFont"] = [=[Interface\AddOns\ViksUI\Media\Font\pixel_font.ttf]=],
	["ActionBarFont"] = [[Interface\AddOns\ViksUI\Media\Font\actionbar_font.ttf]],

	-- Textures
	["Normal"] = [[Interface\AddOns\ViksUI\Media\textures\Texture.tga]],
	["Glow"] = [[Interface\AddOns\ViksUI\Media\textures\Glow]],
	["Bubble"] = [[Interface\AddOns\ViksUI\Media\textures\bubbleTex]],
	["Copy"] = [[Interface\AddOns\ViksUI\Media\textures\copy]],
	["Blank"] = [[Interface\AddOns\ViksUI\Media\textures\Blank]],
	["Logo"] = [[Interface\AddOns\ViksUI\Media\textures\logo]],

	-- colors
	["BorderColor"] = C.media.border_color or { .5, .5, .5 },
	["backdrop_color"] = C.media.BackdropColor or { .1,.1,.1 },

	-- sound
	["Whisper"] = [[Interface\AddOns\ViksUI\Media\sounds\Whisper.ogg]],
	["Warning"] = [[Interface\AddOns\ViksUI\Media\sounds\Warning.ogg]],
}

if (Locale == "esES" or Locale == "esMX" or Locale == "itIT" or Locale == "ptBR" or Locale == "ruRU") then
	C["Medias"].UnitFrameFont = C["Medias"].Font
end

if (Locale == "koKR" or Locale == "zhTW" or Locale == "zhCN") then
	C["Medias"].Font = STANDARD_TEXT_FONT
	C["Medias"].UnitFrameFont = UNIT_NAME_FONT
	C["Medias"].DamageFont = DAMAGE_TEXT_FONT
end
