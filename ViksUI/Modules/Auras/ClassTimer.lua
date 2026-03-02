local T, C, L = unpack(ViksUI)
if not C.classtimer.enable then return end

local mediaPath = "Interface\\AddOns\\ViksUI\\Media\\Other\\"
local texture = "Interface\\Buttons\\WHITE8x8"
local glowTex = mediaPath.."glowTex"
fontsize = 10
fontsize1 = 10
local buttonTex = mediaPath.."buttontex"

local CreateColor = function( red, green, blue, alpha )
	return { red / 255, green / 255, blue / 255, alpha };
end

local BAR_HEIGHT = 14;
local BAR_SPACING = 1;
local LAYOUT = 4;
local BACKGROUND_ALPHA = 1;
local ICON_POSITION = 0;
local ICON_COLOR = CreateColor( 0, 0, 0, 1 );
local SPARK = true;
local CAST_SEPARATOR = true;
local CAST_SEPARATOR_COLOR = CreateColor( .1,.1,.1,.5 );
local TEXT_MARGIN = 5;
local MASTER_FONT, STACKS_FONT;
MASTER_FONT = { C.media.normal_font, fontsize };
STACKS_FONT = { C.media.normal_font, fontsize1 };
local PERMANENT_AURA_VALUE = 1;
local PLAYER_BAR_COLOR = CreateColor( 70, 70, 150, 1 );
local PLAYER_DEBUFF_COLOR = nil;
local TARGET_BAR_COLOR = CreateColor( 70, 150, 70, 1 );
local TARGET_DEBUFF_COLOR = CreateColor( 150, 70, 70, 1 );
local TRINKET_BAR_COLOR = CreateColor( 150, 150, 70, 1 );
local SORT_DIRECTION = true;
local TENTHS_TRESHOLD = 1

--[[ Build filter strings from user settings ]]--
local function BuildPlayerFilterStrings()
	local filterConfig = C.classtimer.player_filters
	local filters = {}
	
	if filterConfig.helpful_player then
		table.insert(filters, "HELPFUL|PLAYER")
	end
	if filterConfig.helpful_big_defensive then
		table.insert(filters, "HELPFUL|PLAYER|BIG_DEFENSIVE")
	end
	if filterConfig.helpful_external_defensive then
		table.insert(filters, "HELPFUL|EXTERNAL_DEFENSIVE")
	end
	if filterConfig.helpful_raid_in_combat then
		table.insert(filters, "HELPFUL|PLAYER|RAID_IN_COMBAT")
	end
	
	return filters
end

local function BuildTargetFilterStrings()
	local filterConfig = C.classtimer.target_filters
	local filters = {}
	
	if filterConfig.harmful_player then
		table.insert(filters, "HARMFUL|PLAYER")
	end
	if filterConfig.harmful_player_cc then
		table.insert(filters, "HARMFUL|PLAYER|CROWD_CONTROL")
	end
	if filterConfig.harmful_crowd_control then
		table.insert(filters, "HARMFUL|CROWD_CONTROL")
	end
	if filterConfig.helpful_big_defensive then
		table.insert(filters, "HELPFUL|BIG_DEFENSIVE")
	end
	if filterConfig.helpful_external_defensive then
		table.insert(filters, "HELPFUL|EXTERNAL_DEFENSIVE")
	end
	
	return filters
end

local CreateUnitAuraDataSource
do
	local CheckUnit = function(self, unit, userFilters, result)
		if (not UnitExists(unit)) then return 0 end
		
		-- If no filters configured, return empty
		if not userFilters or #userFilters == 0 then
			return 0
		end
		
		-- Use modern C_UnitAuras API
		local auraTypes = { 'HELPFUL', 'HARMFUL' }
		
		for _, auraType in ipairs(auraTypes) do
			local isDebuff = auraType == 'HARMFUL'
			
			-- Get all auras for the unit
			for i, auraData in ipairs(C_UnitAuras.GetUnitAuras(unit, auraType)) do
				if auraData and auraData.spellId then
					-- Check if this aura matches ANY of the user-configured filters
					local matchesFilter = false
					for _, userFilter in ipairs(userFilters) do
						-- Use C_UnitAuras to check if aura passes the filter
						if not C_UnitAuras.IsAuraFilteredOutByInstanceID(unit, auraData.auraInstanceID, userFilter) then
							matchesFilter = true
							break
						end
					end
					
					if matchesFilter then
						-- Sanitize duration and expirationTime before storing
						local duration = auraData.duration or 0
						local expirationTime = auraData.expirationTime or 0
						local stacks = auraData.applications or 0
						
						if not canaccessvalue(duration) then
							duration = 0
						end
						if not canaccessvalue(expirationTime) then
							expirationTime = 0
						end
						if not canaccessvalue(stacks) then
							stacks = 0
						end
						
						local info = {
							name = auraData.name,
							texture = auraData.icon,
							duration = duration,
							expirationTime = expirationTime,
							stacks = stacks,
							unit = unit,
							isDebuff = isDebuff,
							auraInstanceID = auraData.auraInstanceID,
							spellId = auraData.spellId,
						}
						
						-- Set default colors based on aura type
						if isDebuff then
							info.defaultColor = TARGET_DEBUFF_COLOR
						else
							info.defaultColor = TARGET_BAR_COLOR
						end
						
						table.insert(result, info)
					end
				end
			end
		end
	end
	
	-- public
	local Update = function(self)
		local result = self.table
		for index = 1, #result do table.remove(result) end
		CheckUnit(self, self.unit, self.userFilters, result)
		self.table = result
	end

	local SetSortDirection = function(self, descending) self.sortDirection = descending end
	local GetSortDirection = function(self) return self.sortDirection end

	local Sort = function(self)
		local direction = self.sortDirection
		local time = GetTime()
		local sorted
		repeat
			sorted = true
			for key, value in pairs(self.table) do
				local nextKey = key + 1
				local nextValue = self.table[ nextKey ]
				if (nextValue == nil) then break end
				
				-- Double-check that expiration times are accessible
				if not canaccessvalue(value.expirationTime) or not canaccessvalue(nextValue.expirationTime) then
					break
				end
				
				local currentRemaining = value.expirationTime == 0 and 4294967295 or math.max(value.expirationTime - time, 0)
				local nextRemaining = nextValue.expirationTime == 0 and 4294967295 or math.max(nextValue.expirationTime - time, 0)
				if ((direction and currentRemaining < nextRemaining) or (not direction and currentRemaining > nextRemaining)) then
					self.table[ key ] = nextValue
					self.table[ nextKey ] = value
					sorted = false
				end
			end
		until (sorted == true)
	end
	
	local Get = function(self) return self.table end
	local Count = function(self) return #self.table end
	local GetUnit = function(self) return self.unit end

	-- constructor
	CreateUnitAuraDataSource = function(unit, userFilters)
		local result = {}
		result.Sort = Sort
		result.Update = Update
		result.Get = Get
		result.Count = Count
		result.SetSortDirection = SetSortDirection
		result.GetSortDirection = GetSortDirection
		result.GetUnit = GetUnit
		result.unit = unit
		result.userFilters = userFilters or {}
		result.sortDirection = SORT_DIRECTION
		result.table = {}
		return result
	end
end

local CreateFramedTexture
do
	--public
	local SetTexture = function(self, ...) return self.texture:SetTexture(...) end
	local GetTexture = function(self) return self.texture:GetTexture() end
	local GetTexCoord = function(self) return self.texture:GetTexCoord() end
	local SetTexCoord = function(self, ...) return self.texture:SetTexCoord(...) end
	local SetBorderColor = function(self, ...) return self.border:SetVertexColor(...) end

	-- constructor
	CreateFramedTexture = function(parent)
		local result = parent:CreateTexture( nil, "BACKGROUND", nil );
		local border = parent:CreateTexture( nil, "BORDER", nil );
		local background = parent:CreateTexture( nil, "ARTWORK", nil );
		local texture = parent:CreateTexture( nil, "OVERLAY", nil );

		result:SetColorTexture(unpack(C.media.backdrop_color));
		border:SetColorTexture(unpack(C.media.border_color));
		background:SetColorTexture(unpack(C.media.backdrop_color));

		border:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
		border:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );

		background:SetPoint( "TOPLEFT", border, "TOPLEFT", 1, -1 );
		background:SetPoint( "BOTTOMRIGHT", border, "BOTTOMRIGHT", -1, 1 );

		texture:SetPoint( "TOPLEFT", background, "TOPLEFT", 1, -1 );
		texture:SetPoint( "BOTTOMRIGHT", background, "BOTTOMRIGHT", -1, 1 );

		result.border = border;
		result.background = background;
		result.texture = texture;

		result.SetBorderColor = SetBorderColor;

		result.SetTexture = SetTexture;
		result.GetTexture = GetTexture;
		result.SetTexCoord = SetTexCoord;
		result.GetTexCoord = GetTexCoord;

		return result;
	end
end

local CreateAuraBarFrame;
do
	-- classes
	local CreateAuraBar;
	do
		-- private
		local OnUpdate = function( self, elapsed )
			local time = GetTime();

			-- Check if expirationTime is accessible before any comparisons
			if not canaccessvalue(self.expirationTime) then
				self.bar:SetScript( "OnUpdate", nil );
				self.bar:SetValue( 0 );
				self.time:SetText( "" );

				local spark = self.spark;
				if ( spark ) then
					spark:Hide();
				end
				return
			end

			-- Now safe to compare
			if ( time > self.expirationTime ) then
				self.bar:SetScript( "OnUpdate", nil );
				self.bar:SetValue( 0 );
				self.time:SetText( "" );

				local spark = self.spark;
				if ( spark ) then
					spark:Hide();
				end
			else
				local remaining = self.expirationTime - time;
				self.bar:SetValue( remaining );

				local timeText = "";
				if ( remaining >= 3600 ) then
					timeText = tostring( math.floor( remaining / 3600 ) ) .. "h";
				elseif ( remaining >= 60 ) then
					timeText = tostring( math.floor( remaining / 60 ) ) .. "m";
				elseif ( remaining > TENTHS_TRESHOLD ) then
					timeText = tostring( math.floor( remaining ) );
				elseif ( remaining > 0 ) then
					timeText = tostring( math.floor( remaining * 10 ) / 10 );
				end
				self.time:SetText( timeText );

				local barWidth = self.bar:GetWidth();

				local spark = self.spark;
				if ( spark ) then
					spark:SetPoint( "CENTER", self.bar, "LEFT", barWidth * remaining / self.duration, 0 );
				end
			end
		end
		
		-- public
		local SetIcon = function( self, icon )
			if ( not self.icon ) then return; end
			self.icon:SetTexture( icon );
		end

		local SetTime = function( self, expirationTime, duration )
			-- Check if values are accessible BEFORE storing them
			local canAccess = canaccessvalue(expirationTime) and canaccessvalue(duration)
			
			-- If tainted, set to permanent aura values
			if not canAccess then
				expirationTime = 0
				duration = 0
			end
			
			-- Now store the safe values
			self.expirationTime = expirationTime
			self.duration = duration

			-- Now we can safely compare
			if expirationTime > 0 and duration > 0 then
				self.bar:SetMinMaxValues( 0, duration );
				OnUpdate( self, 0 );

				local spark = self.spark;
				if ( spark ) then
					spark:Show();
				end

				self:SetScript( "OnUpdate", OnUpdate );
			else
				self.bar:SetMinMaxValues( 0, 1 );
				self.bar:SetValue( PERMANENT_AURA_VALUE );
				self.time:SetText( "" );

				local spark = self.spark;
				if ( spark ) then
					spark:Hide();
				end

				self:SetScript( "OnUpdate", nil );
			end
		end

		local SetName = function( self, name )
			self.name:SetText( name );
		end

		local SetStacks = function( self, stacks )
			-- Check if stacks is accessible before comparing
			if not canaccessvalue(stacks) then
				stacks = 0
			end
			
			if ( not self.stacks ) then
				if ( stacks ~= nil and stacks > 1 ) then
					local name = self.name;
					name:SetText( tostring( stacks ) .. "  " .. name:GetText() );
				end
			else
				if ( stacks ~= nil and stacks > 1 ) then
					self.stacks:SetText( stacks );
				else
					self.stacks:SetText( "" );
				end
			end
		end

		local SetColor = function( self, color )
			self.bar:SetStatusBarColor( unpack( color ) );
		end

		local SetAuraInfo = function( self, auraInfo )
			self:SetName( auraInfo.name );
			self:SetIcon( auraInfo.texture );
			self:SetTime( auraInfo.expirationTime, auraInfo.duration );
			self:SetStacks( auraInfo.stacks );
		end

		-- constructor
		CreateAuraBar = function( parent )
			local result = CreateFrame( "Frame", nil, parent, nil , "BackdropTemplate");

			if ( bit.band( ICON_POSITION, 4 ) == 0 ) then
				local icon = CreateFramedTexture( result, "ARTWORK" );
				icon:SetTexCoord( 0.15, 0.85, 0.15, 0.85 );
				icon:SetBorderColor( unpack( ICON_COLOR ) );

				local iconAnchor1;
				local iconAnchor2;
				local iconOffset;
				if ( bit.band( ICON_POSITION, 1 ) == 1 ) then
					iconAnchor1 = "TOPLEFT";
					iconAnchor2 = "TOPRIGHT";
					iconOffset = 1;
				else
					iconAnchor1 = "TOPRIGHT";
					iconAnchor2 = "TOPLEFT";
					iconOffset = -1;
				end

				if ( bit.band( ICON_POSITION, 2 ) == 2 ) then
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * 6, 1 );
				else
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * ( -BAR_HEIGHT - 1 ), 1 );
				end
				icon:SetWidth( BAR_HEIGHT + 2 );
				icon:SetHeight( BAR_HEIGHT + 2 );

				result.icon = icon;

				local stacks = result:CreateFontString( nil, "OVERLAY", nil );
				stacks:SetFont( unpack( STACKS_FONT ) );
				stacks:SetShadowColor( 0, 0, 0 );
				stacks:SetShadowOffset( 1.25, -1.25 );
				stacks:SetJustifyH( "RIGHT" );
				stacks:SetJustifyV( "BOTTOM" );
				stacks:SetPoint( "TOPLEFT", icon, "TOPLEFT", 0, 0 );
				stacks:SetPoint( "BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 3 );
				result.stacks = stacks;
			end

			local bar = CreateFrame( "StatusBar", nil, result, nil , "BackdropTemplate");
			bar:SetStatusBarTexture( texture );
			if ( bit.band( ICON_POSITION, 2 ) == 2 or bit.band( ICON_POSITION, 4 ) == 4 ) then
				bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
				bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
			else
				if ( bit.band( ICON_POSITION, 1 ) == 1 ) then
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", -BAR_HEIGHT - 1, 0 );
				else
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", BAR_HEIGHT + 1, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
				end
			end
			result.bar = bar;

			if ( SPARK ) then
				local spark = bar:CreateTexture( nil, "OVERLAY", nil );
				spark:SetTexture( [[Interface\CastingBar\UI-CastingBar-Spark]] );
				spark:SetWidth( 12 );
				spark:SetBlendMode( "ADD" );
				spark:Show();
				result.spark = spark;
			end

			if ( CAST_SEPARATOR ) then
				local castSeparator = bar:CreateTexture( nil, "OVERLAY", nil );
				castSeparator:SetTexture( unpack( CAST_SEPARATOR_COLOR ) );
				castSeparator:SetWidth( 1 );
				castSeparator:SetHeight( BAR_HEIGHT );
				castSeparator:Show();
				result.castSeparator = castSeparator;
			end

			local name = bar:CreateFontString( nil, "OVERLAY", nil );
			name:SetFont( unpack( MASTER_FONT ) );
			name:SetJustifyH( "LEFT" );
			name:SetShadowColor( 0, 0, 0 );
			name:SetShadowOffset( 1.25, -1.25 );
			name:SetPoint( "TOPLEFT", bar, "TOPLEFT", TEXT_MARGIN, 0 );
			name:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -45, 2 );
			result.name = name;

			local time = bar:CreateFontString( nil, "OVERLAY", nil );
			time:SetFont( unpack( MASTER_FONT ) );
			time:SetJustifyH( "RIGHT" );
			time:SetShadowColor( 0, 0, 0 );
			time:SetShadowOffset( 1.25, -1.25 );
			time:SetPoint( "TOPLEFT", name, "TOPRIGHT", 0, 0 );
			time:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -TEXT_MARGIN, 2 );
			result.time = time;

			result.SetIcon = SetIcon;
			result.SetTime = SetTime;
			result.SetName = SetName;
			result.SetStacks = SetStacks;
			result.SetAuraInfo = SetAuraInfo;
			result.SetColor = SetColor;

			return result;
		end
	end

	-- private
	local SetAuraBar = function( self, index, auraInfo )
		local line = self.lines[ index ]
		if ( line == nil ) then
			line = CreateAuraBar( self );
			if ( index == 1 ) then
				line:SetPoint( "TOPLEFT", self, "BOTTOMLEFT", 0, BAR_HEIGHT );
				line:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0 );
			else
				local anchor = self.lines[ index - 1 ];
				line:SetPoint( "TOPLEFT", anchor, "TOPLEFT", 0, BAR_HEIGHT + BAR_SPACING );
				line:SetPoint( "BOTTOMRIGHT", anchor, "TOPRIGHT", 0, BAR_SPACING );
			end
			tinsert( self.lines, index, line );
		end

		line:SetAuraInfo( auraInfo );
		if ( auraInfo.defaultColor ) then
			line:SetColor( auraInfo.defaultColor );
		end

		line:Show();
	end

	local function OnUnitAura( self, unit )
		if ( unit ~= self.unit ) then
			return;
		end

		self:Render();
	end

	local function OnPlayerTargetChanged( self, method )
		self:Render();
	end

	local function OnPlayerEnteringWorld( self )
		self:Render();
	end

	local function OnEvent( self, event, ... )
		if ( event == "UNIT_AURA" ) then
			OnUnitAura( self, ... );
		elseif ( event == "PLAYER_TARGET_CHANGED" ) then
			OnPlayerTargetChanged( self, ... );
		elseif ( event == "PLAYER_ENTERING_WORLD" ) then
			OnPlayerEnteringWorld( self );
		elseif ( event == "PLAYER_TALENT_UPDATE" ) then
			OnPlayerEnteringWorld( self );
		else
			error( "Unhandled event " .. event );
		end
	end

	-- public
	local function Render( self )
		local dataSource = self.dataSource;

		dataSource:Update();
		dataSource:Sort();

		local count = dataSource:Count();

		for index, auraInfo in ipairs( dataSource:Get() ) do
			SetAuraBar( self, index, auraInfo );
		end

		for index = count + 1, 80 do
			local line = self.lines[ index ];
			if ( line == nil or not line:IsShown() ) then
				break;
			end
			line:Hide();
		end

		if ( count > 0 ) then
			self:SetHeight( ( BAR_HEIGHT + BAR_SPACING ) * count - BAR_SPACING );
			self:Show();
		else
			self:Hide();
			self:SetHeight( self.hiddenHeight or 1 );
		end
	end

	local function SetHiddenHeight( self, height )
		self.hiddenHeight = height;
	end

	-- constructor
	CreateAuraBarFrame = function( dataSource, parent )
		local result = CreateFrame( "Frame", nil, parent, nil , "BackdropTemplate");
		local unit = dataSource:GetUnit();

		result.unit = unit;

		result.lines = { };
		result.dataSource = dataSource;

		local background = result:CreateTexture(nil, 'BORDER');
		background:SetAlpha( BACKGROUND_ALPHA );
		background:SetTexture( texture );
		background:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
		background:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
		background:SetVertexColor( .1,.1,.1,1 );
		result.background = background;

		local border = CreateFrame( "Frame", nil, result, nil , "BackdropTemplate");
		border:SetAlpha( BACKGROUND_ALPHA );
		border:SetFrameStrata( "BACKGROUND" );
		border:SetTemplate('Default')
		border:SetBackdropColor( 0, 0, 0, 0 );
		border:SetBackdropBorderColor( 0, 0, 0 );
		border:SetPoint( "TOPLEFT", result, "TOPLEFT", -5, 5 );
		border:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 5, -5 );
		result.border = border;
		frame1px1(border)
		result:RegisterEvent( "PLAYER_ENTERING_WORLD" );
		result:RegisterEvent( "UNIT_AURA" );
		if ( unit == "target" ) then
			result:RegisterEvent( "PLAYER_TARGET_CHANGED" );
		end

		result:SetScript( "OnEvent", OnEvent );

		result.Render = Render;
		result.SetHiddenHeight = SetHiddenHeight;

		return result;
	end
end

classtimerload = CreateFrame("Frame", "BackdropTemplate")
classtimerload:RegisterEvent("PLAYER_LOGIN")
classtimerload:SetScript("OnEvent", function(self, event, addon)
if ( LAYOUT == 4 ) then
	local yOffset = 11;

	-- Build user-configured filter strings
	local playerFilterStrings = BuildPlayerFilterStrings()
	local targetFilterStrings = BuildTargetFilterStrings()

	-- Create data sources with user-configured filters
	local targetDataSource = CreateUnitAuraDataSource( "target", targetFilterStrings );
	local playerDataSource = CreateUnitAuraDataSource( "player", playerFilterStrings );
	local trinketDataSource = CreateUnitAuraDataSource( "player", {} );

	targetDataSource:SetSortDirection( SORT_DIRECTION );
	playerDataSource:SetSortDirection( SORT_DIRECTION );
	trinketDataSource:SetSortDirection( SORT_DIRECTION );

	-- Create player frame
	local playerFrame = CreateAuraBarFrame( playerDataSource, oUF_Player );
	playerFrame:SetHiddenHeight( -yOffset );

	local function Barmover()
		if (T.class == "DEATHKNIGHT" or T.class == "SHAMAN" or (T.class == "DRUID" and GetSpecialization() == 2) or T.class == "WARLOCK" or (T.class == "MONK" and GetSpecialization() ~= 2) or T.class == "PALADIN") then
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20);
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20);
		elseif (T.class == "ROGUE" and C.unitframe_class_bar.combo_old ~= true) then
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20);
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20);
		elseif (T.class == "DRUID" and C.unitframe_class_bar.combo_old ~= true) then
			local form = GetShapeshiftFormID()
			if not form or form == 0 then
				return
			elseif form == 1 then -- Cat Form
				playerFrame:SetPoint("BOTTOMLEFT", oUF_Player, "TOPLEFT", 1, 20)
				playerFrame:SetPoint("BOTTOMRIGHT", oUF_Player, "TOPRIGHT", -1, 20)
			else
				playerFrame:SetPoint("BOTTOMLEFT", oUF_Player, "TOPLEFT", 1, 8)
				playerFrame:SetPoint("BOTTOMRIGHT", oUF_Player, "TOPRIGHT", -1, 8)
			end
		elseif ( T.class == "MAGE") then
			if GetSpecialization() == 1 and C.unitframe_class_bar.arcane then
				playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 20);
				playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 20);
			else
				playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 8);
				playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 8);
			end
		else
			playerFrame:SetPoint( "BOTTOMLEFT",  oUF_Player, "TOPLEFT", 1, 8 );
			playerFrame:SetPoint( "BOTTOMRIGHT",  oUF_Player, "TOPRIGHT", -1, 8 );
		end
	end

	local BarUpdater = CreateFrame("Frame")
	BarUpdater:RegisterEvent("PLAYER_ENTERING_WORLD")
	BarUpdater:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
	BarUpdater:RegisterEvent("PLAYER_TALENT_UPDATE")
	BarUpdater:SetScript("OnEvent", Barmover)

	playerFrame:Show();

	-- Create trinket frame
	local trinketFrame = CreateAuraBarFrame( trinketDataSource, oUF_Player);
	trinketFrame:SetHiddenHeight( -yOffset );
	trinketFrame:SetPoint( "BOTTOMLEFT", playerFrame, "TOPLEFT", 0, 10);
	trinketFrame:SetPoint( "BOTTOMRIGHT", playerFrame, "TOPRIGHT", 0, 10);
	trinketFrame:Show();

	-- Create target frame only if enabled in config
	if C.classtimer.show_target_frame then
		local targetFrame = CreateAuraBarFrame( targetDataSource, oUF_ViksTarget );
		if ((T.class == "DRUID" or T.class == "ROGUE") and C.unitframe_class_bar.combo == true and C.unitframe_class_bar.combo_old == true) then
			targetFrame:SetPoint( "BOTTOMLEFT",  oUF_ViksTarget, "TOPLEFT", 2, 20);
			targetFrame:SetPoint( "BOTTOMRIGHT",  oUF_ViksTarget, "TOPRIGHT", -2, 20);
		else
			targetFrame:SetPoint( "BOTTOMLEFT",  oUF_ViksTarget, "TOPLEFT", 2, 8);
			targetFrame:SetPoint( "BOTTOMRIGHT",  oUF_ViksTarget, "TOPRIGHT", -2, 8);
		end
		targetFrame:Show();
	end
else
	error( "Undefined layout " .. tostring( LAYOUT ) );
end
classtimerload:UnregisterEvent("PLAYER_LOGIN")
classtimerload:SetScript("OnEvent", nil)
end)