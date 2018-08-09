local T, C, L, _ = unpack(select(2, ...))
----------------------------------------------------------------------------------------
-- Default Size Values
----------------------------------------------------------------------------------------

CPwidth = C.panels.CPwidth 					-- Width for Left and RIght side panels that holds text. 
CPTextheight = C.panels.CPTextheight 			-- Hight for panel where chat window is inside
CPbarsheight = C.panels.CPbarsheight 			-- Hight for Panels under/above Chat window
CPABarSide = C.panels.CPABarSide 				-- Width for Action Bars next to chat windows
CPXPBa_r = C.panels.CPXPBa_r 					-- Hight for the XP bar above Left Chat
xoffset = C.panels.xoffset 					-- Horisontal spacing between panels
yoffset = C.panels.yoffset 					-- Vertical spacing between panels
CPSidesWidth = C.panels.CPSidesWidth 			-- Width of panels that is used to hold dmg meter and threathbar (Recount & Omen) 
CPMABwidth = C.panels.CPMABwidth				-- Width for Main Actionbar
CPMABheight = C.panels.CPMABheight 			-- Hight for Main Actionbar
CPMAByoffset = C.panels.CPMAByoffset 			-- Hight for Main Actionbar
CPCooldheight = C.panels.CPCooldheight 		-- Hight for Cooldown Bar
CPTop = C.panels.CPTop 						-- Width for Top Panels
CPMinimap = C.minimap.size 					-- Width/Hight for Minimap Panel
Pscale = C.misc.Pscale						-- Can be used to resize all panels. It does not change X Y Values


local _, class = UnitClass("player")
local r, g, b = 0,.38,.651
qColor = ("|cff%.2x%.2x%.2x"):format(r * 255, g * 255, b * 255)
qColor2 = ("|cff%.2x%.2x%.2x"):format(0 * 255, .38 * 255, .651 * 255)

----------------------------------------------------------------------------------------
-- General options   
----------------------------------------------------------------------------------------

mult = T.mult


function CreateShadow(f)--
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", 1, -1)
	shadow:SetPoint("BOTTOMRIGHT", -1, 1)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor( .05,.05,.05, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 1)
	f.shadow = shadow
	return shadow
end

buttonsize = C.actionbar.button_size
buttonspacing = C.actionbar.button_space
petbuttonsize = C.actionbar.petbuttonsize
petbuttonspacing = C.actionbar.button_space

----------------------------------------------------------------------------------------
-- Backdrop/Shadow/Glow/Border
----------------------------------------------------------------------------------------
function CreatePanel(f, w, h, a1, p, a2, x, y)
	local _, class = UnitClass("player")
	local r, g, b = RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b
	sh = T.Scale(h)
	sw = T.Scale(w)
	f:SetFrameLevel(1)
	f:SetHeight(sh)
	f:SetWidth(sw)
	f:SetFrameStrata("BACKGROUND")
	f:SetPoint(a1, p, a2, x, y)
	f:SetBackdrop({
	  bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
      edgeFile = "Interface\\Buttons\\WHITE8x8", 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	f:SetBackdropColor(unpack(C.media.backdrop_color))
	f:SetBackdropBorderColor(unpack(C.media.border_color))
	if C.misc.panelsh then
	f:SetAlpha(1)
	else
	f:SetAlpha(0)
	end
end
function altCreatePanel(f, w, h, a1, p, a2, x, y)
	local _, class = UnitClass("player")
	local r, g, b = RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b
	sh = T.Scale(h)
	sw = T.Scale(w)
	f:SetFrameLevel(1)
	f:SetHeight(sh)
	f:SetWidth(sw)
	f:SetFrameStrata("BACKGROUND")
	f:SetPoint(a1, p, a2, x, y)
	f:SetBackdrop({
	  bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
      edgeFile = "Interface\\Buttons\\WHITE8x8", 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	f:SetBackdropColor(unpack(C.media.backdrop_color))
	f:SetBackdropBorderColor(unpack(C.media.border_color))
end
local function SetTex(f, t, texture)
	f:SetBackdrop({
	  bgFile = C.media.blank, 
	  edgeFile = C.media.blank, 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	
	local tex = f:CreateTexture(nil, "BORDER")
	tex:SetPoint("TOPLEFT", f, "TOPLEFT", 2, -2)
	tex:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
	tex:SetTexture("Interface\\Addons\\ViksUI\\Media\\Other\\statusbar3")
	tex:SetVertexColor(unpack(C.media.backdrop_color))
	tex:SetDrawLayer("BORDER", -8)
	f.tex = tex
	
	f:SetBackdropColor(unpack(C.media.backdrop_color))
	f:SetBackdropBorderColor(unpack(C.media.border_color))
end

local shadows = {
	edgeFile = "Interface\\AddOns\\ViksUI\\Media\\Other\\glowTex", 
	edgeSize = 4,
	insets = { left = 3, right = 3, top = 3, bottom = 3 }
}
function CreateShadow(f)
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(1)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -4, 4)
	shadow:SetPoint("BOTTOMRIGHT", 4, -4)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor(0, 0, 0, 0)
	shadow:SetBackdropBorderColor(0,0,0, 1)
	f.shadow = shadow
	return shadow
end
function CreateBorder(f)
	if f.border then return end
	local border = CreateFrame("Frame", nil, f)
	border:SetFrameLevel(1)
	border:SetFrameStrata(f:GetFrameStrata())
	border:SetPoint("TOPLEFT", 0, 0)
	border:SetPoint("BOTTOMRIGHT", 0, 0)
	border:SetBackdrop({
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	border:SetBackdropColor(0, 0, 0, 0)
	border:SetBackdropBorderColor(unpack(C.media.border_color))
	f.border = border
	return border
end

local function SetTex2(f, t, texture)
	f:SetBackdrop({
	  bgFile = C.media.blank, 
	  edgeFile = C.media.blank, 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	
	local tex = f:CreateTexture(nil, "BORDER")
	tex:SetPoint("TOPLEFT", f, "TOPLEFT", 2, -2)
	tex:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
	tex:SetTexture("Interface\\Addons\\ViksUI\\Media\\Other\\statusbar3")
	tex:SetVertexColor(unpack(C.media.backdrop_color))
	tex:SetDrawLayer("BORDER", -8)
	f.tex = tex
	
	f:SetBackdropColor(unpack(C.media.backdrop_color))
	f:SetBackdropBorderColor(unpack(C.media.border_color))
end
function frametexpx(f)
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	f:SetBackdropColor(unpack(C.media.backdrop_color))
	f:SetBackdropBorderColor(unpack(C.media.border_color))
	SetTex2(f)	
end
function frame1px(f)
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	f:SetBackdropColor(unpack(C.media.backdrop_color))
	f:SetBackdropBorderColor(unpack(C.media.border_color))	
end
function frameskada(f)
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	f:SetBackdropColor(.06,.06,.06,0)



	f:SetBackdropBorderColor(unpack(C.media.border_color))	
end
function frame11px(f)
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	f:SetBackdropColor(.1,.1,.1,0)
	f:SetBackdropBorderColor(unpack(C.media.border_color))
end
function frame1px1(f)
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	f:SetPoint("TOPLEFT", -2, 2)
	f:SetPoint("BOTTOMRIGHT", 2, -2)
	f:SetBackdropColor(unpack(C.media.backdrop_color))
	f:SetBackdropBorderColor(unpack(C.media.border_color))
end
function frame1px2_2(f) --//Viks
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	f:SetPoint("TOPLEFT", -1, 1)
	f:SetPoint("BOTTOMRIGHT", 1, -1)
	f:SetBackdropColor(unpack(C.media.backdrop_color))
	f:SetBackdropBorderColor(unpack(C.media.border_color))
	--f:SetFrameLevel(12)
end

function frame1px2(f)
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	f:SetFrameLevel(31)
	f:SetPoint("TOPLEFT", 1, -1)
	f:SetPoint("BOTTOMRIGHT", -1, 1)
	f:SetBackdropColor(.1,.1,.1,0)
	f:SetBackdropBorderColor(unpack(C.media.border_color))
end
function frame1px3(f)
	f:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = mult, 
		insets = {left = -mult, right = -mult, top = -mult, bottom = -mult} 
	})
	f:SetBackdropColor(unpack(C.media.backdrop_color))
	f:SetBackdropBorderColor(unpack(C.media.border_color))
end
--fucking icon for castbar
function frame12(f)
    if f.frame==nil then
      local frame = CreateFrame("Frame", nil, f)
      frame = CreateFrame("Frame", nil, f)
      frame:SetFrameLevel(12)
      frame:SetFrameStrata(f:GetFrameStrata())
      frame:SetPoint("TOPLEFT", 4, -4)
      frame:SetPoint("BOTTOMLEFT", 4, 4)
      frame:SetPoint("TOPRIGHT", -4, -4)
      frame:SetPoint("BOTTOMRIGHT", -4, 4)
      frame:SetBackdrop( { 
        edgeFile = "Interface\\Buttons\\WHITE8x8", 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
      })
     
      frame:SetBackdropColor(unpack(C.media.backdrop_color))
      frame:SetBackdropBorderColor(unpack(C.media.border_color))
      f.frame = frame
    end
end 
function frame(f)
    if f.frame==nil then
      local frame = CreateFrame("Frame", nil, f)
      frame = CreateFrame("Frame", nil, f)
      frame:SetFrameLevel(12)
      frame:SetFrameStrata(f:GetFrameStrata())
      frame:SetPoint("TOPLEFT", 4, -4)
      frame:SetPoint("BOTTOMLEFT", 4, 4)
      frame:SetPoint("TOPRIGHT", -4, -4)
      frame:SetPoint("BOTTOMRIGHT", -4, 4)
      frame:SetBackdrop( { 
        edgeFile = "Interface\\Buttons\\WHITE8x8", 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
      })
     
      frame:SetBackdropColor(.1,.1,.1,1)
      frame:SetBackdropBorderColor(unpack(C.media.border_color))
      f.frame = frame
    end
end 
function frame123(f)
    if f.frame==nil then
      local frame = CreateFrame("Frame", nil, f)
      frame = CreateFrame("Frame", nil, f)
      frame:SetFrameLevel(2)
      frame:SetFrameStrata(f:GetFrameStrata())
      frame:SetPoint("TOPLEFT", 9, -9)
      frame:SetPoint("BOTTOMLEFT", 9, 9)
      frame:SetPoint("TOPRIGHT", -9, -9)
      frame:SetPoint("BOTTOMRIGHT", -9, 9)
      frame:SetBackdrop( {
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],	  
        edgeFile = "Interface\\Buttons\\WHITE8x8", 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
      })
	  frame:SetBackdropColor(unpack(C.media.backdrop_color))
      frame:SetBackdropBorderColor(unpack(C.media.border_color))
      f.frame = frame
    end
end 
function CreateShadow1(f)
    if f.frameBD==nil then
      local frameBD = CreateFrame("Frame", nil, f)
      frameBD = CreateFrame("Frame", nil, f)
      frameBD:SetFrameLevel(1)
      frameBD:SetFrameStrata(f:GetFrameStrata())
      frameBD:SetPoint("TOPLEFT", 0, 0)
      frameBD:SetPoint("BOTTOMLEFT", 0, 0)
      frameBD:SetPoint("TOPRIGHT", 0, 0)
      frameBD:SetPoint("BOTTOMRIGHT", 0, 0)
      frameBD:SetBackdrop( { 
         edgeFile = "Interface\\AddOns\\ViksUI\\media\\Other\\glowTex", edgeSize = 4,
         insets = {left = 3, right = 3, top = 3, bottom = 3},
         tile = false, tileSize = 0,
      })
      frameBD:SetBackdropColor(0, 0, 0, 0)
      frameBD:SetBackdropBorderColor(0, 0, 0, 1)
      f.frameBD = frameBD
    end
end
function CreateShadow2(f)
    if f.frameBD==nil then
      local frameBD = CreateFrame("Frame", nil, f)
      frameBD = CreateFrame("Frame", nil, f)
      frameBD:SetFrameLevel(0)
      frameBD:SetFrameStrata(f:GetFrameStrata())
      frameBD:SetPoint("TOPLEFT", 5, -5)
      frameBD:SetPoint("BOTTOMLEFT", 5, 5)
      frameBD:SetPoint("TOPRIGHT", -5, -5)
      frameBD:SetPoint("BOTTOMRIGHT", -5, 5)
      frameBD:SetBackdrop( { 
         edgeFile = "Interface\\AddOns\\ViksUI\\media\\Other\\glowTex", edgeSize = 4,
         insets = {left = 3, right = 3, top = 3, bottom = 3},
         tile = false, tileSize = 0,
      })
      frameBD:SetBackdropColor(0, 0, 0, 0)
      frameBD:SetBackdropBorderColor(0, 0, 0, 0)
      f.frameBD = frameBD
    end
end

function CreateShadow3(f)--
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -3, 3)
	shadow:SetPoint("BOTTOMRIGHT", 3, -3)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor( .05,.05,.05, 0)
	shadow:SetBackdropBorderColor(0, 0, 0, 1)
	f.shadow = shadow
	return shadow
end

function CreateShadowNameplates(f)
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -4, 4)
	shadow:SetPoint("BOTTOMRIGHT", 4, -4)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor( .05,.05,.05, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 1)
	f.shadow = shadow
	return shadow
end

if C.datatext.classcolor == true then
	local classcolor = RAID_CLASS_COLORS[T.class]
	C.datatext.color = {classcolor.r,classcolor.g,classcolor.b,1}
end
local r, g, b = unpack(C.datatext.color)
qColor = ("|cff%.2x%.2x%.2x"):format(r * 255, g * 255, b * 255)


-- convert datatext color from rgb decimal to hex 
local dr, dg, db = unpack(C.datatext.color)
panelcolor = ("|cff%.2x%.2x%.2x"):format(dr * 255, dg * 255, db * 255)

do
	SetFontString = function(parent, fontName, fontHeight, fontStyle)
		local fs = parent:CreateFontString(nil, "OVERLAY")
		fs:SetFont(C.media.normal_font, fontHeight, fontStyle)
		fs:SetJustifyH("LEFT")
		fs:SetShadowColor(0, 0, 0)
		fs:SetShadowOffset(1.25, -1.25)
		return fs
	end
end	

