local T, C, L, _ = unpack(select(2, ...))

local Locale = GetLocale()

C["Medias"] = {
	-- Fonts
	["Font"] = [[Interface\AddOns\ViksUI\Medias\Fonts\normal_font.ttf]],
	["UnitFrameFont"] = [[Interface\AddOns\ViksUI\Medias\Fonts\uf_font.ttf]],
	["DamageFont"] = [[Interface\AddOns\ViksUI\Medias\Fonts\normal_font.ttf]],
	["PixelFont"] = [=[Interface\AddOns\ViksUI\Medias\Fonts\pixel_font.ttf]=],
	["ActionBarFont"] = [[Interface\AddOns\ViksUI\Medias\Fonts\actionbar_font.ttf]],

	-- Textures
	["Normal"] = [[Interface\AddOns\ViksUI\Medias\Textures\Status\ViksUI1]],
	["Glow"] = [[Interface\AddOns\ViksUI\Medias\Textures\Others\Glow]],
	["Bubble"] = [[Interface\AddOns\ViksUI\Medias\Textures\Others\Bubble]],
	["Copy"] = [[Interface\AddOns\ViksUI\Medias\Textures\Others\Copy]],
	["Blank"] = [[Interface\AddOns\ViksUI\Medias\Textures\Others\Blank]],
	["Logo"] = [[Interface\AddOns\ViksUI\Medias\Textures\Others\Logo]],

	-- colors
	["BorderColor"] = C.media.border_color or { .5, .5, .5 },
	["backdrop_color"] = C.media.BackdropColor or { .1,.1,.1 },

	-- sound
	["Whisper"] = [[Interface\AddOns\ViksUI\Medias\Sounds\whisper.mp3]],
	["Warning"] = [[Interface\AddOns\ViksUI\Medias\Sounds\warning.mp3]],
}

if (Locale == "esES" or Locale == "esMX" or Locale == "itIT" or Locale == "ptBR" or Locale == "ruRU") then
	C["Medias"].UnitFrameFont = C["Medias"].Font
end

if (Locale == "koKR" or Locale == "zhTW" or Locale == "zhCN") then
	C["Medias"].Font = STANDARD_TEXT_FONT
	C["Medias"].UnitFrameFont = UNIT_NAME_FONT
	C["Medias"].DamageFont = DAMAGE_TEXT_FONT
end
