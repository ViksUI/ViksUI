--[[
local T, C, L, _ = unpack(select(2, ...))
local myPlayerRealm = GetCVar("realmName")
local myPlayerName  = UnitName("player")

if not IsAddOnLoaded("Viks_ConfigUI") then return end

if not GUIConfigAll then GUIConfigAll = {} end		
if (GUIConfigAll[myPlayerRealm] == nil) then GUIConfigAll[myPlayerRealm] = {} end
if (GUIConfigAll[myPlayerRealm][myPlayerName] == nil) then GUIConfigAll[myPlayerRealm][myPlayerName] = false end

if GUIConfigAll[myPlayerRealm][myPlayerName] == true and not GUIConfig then return end
if GUIConfigAll[myPlayerRealm][myPlayerName] == false and not GUIConfigSettings then return end


if GUIConfigAll[myPlayerRealm][myPlayerName] == true then
	for group,options in pairs(GUIConfig) do
		if Viks[group] then
			local count = 0
			for option,value in pairs(options) do
				if Viks[group][option] ~= nil then
					if Viks[group][option] == value then
						GUIConfig[group][option] = nil	
					else
						count = count+1
						Viks[group][option] = value
					end
				end
			end
			-- keeps GUIConfig clean and small
			if count == 0 then GUIConfig[group] = nil end
		else
			GUIConfig[group] = nil
		end
	end
else
	for group,options in pairs(GUIConfigSettings) do
		if Viks[group] then
			local count = 0
			for option,value in pairs(options) do
				if Viks[group][option] ~= nil then
					if Viks[group][option] == value then
						GUIConfigSettings[group][option] = nil	
					else
						count = count+1
						Viks[group][option] = value
					end
				end
			end
			-- keeps GUIConfig clean and small
			if count == 0 then GUIConfigSettings[group] = nil end
		else
			GUIConfigSettings[group] = nil
		end
	end
end

--]]