local T, C, L, _ = unpack(select(2, ...))
LeftDatatexts = {}
function PP(p, obj)
	if p == 1 then
		obj:SetHeight(LBottom:GetHeight())
		obj:SetPoint("LEFT", DataTextP1, "LEFT", 5, 0)
	elseif p == 2 then
		obj:SetHeight(LBottom:GetHeight())
		obj:SetPoint("CENTER", DataTextP2, "CENTER", 0, 0)
	elseif p == 3 then
		obj:SetHeight(LBottom:GetHeight())
		obj:SetPoint("RIGHT", DataTextP3, "RIGHT", -5, 0)
	elseif p == 4 then
		obj:SetHeight(RBottom:GetHeight())
		obj:SetPoint("LEFT", DataTextP4,"LEFT", 5, 0)
	elseif p == 5 then
		obj:SetHeight(RBottom:GetHeight())
		obj:SetPoint("CENTER", DataTextP5,"CENTER", 0, 0)
	elseif p == 6 then
		obj:SetHeight(RBottom:GetHeight())
		obj:SetPoint("RIGHT", DataTextP6,"RIGHT", -5, 0)
	elseif p == 7 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("LEFT", DataTextP8,"LEFT", 5, -3)
	elseif p == 8 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("LEFT", DataTextP8,"LEFT", 250, -3)
	elseif p == 9 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("LEFT", DataTextP8,"LEFT", 500, -3)
	elseif p == 10 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("TOP", DataTextP7,"TOP", 0, -3)
	elseif p == 11 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("RIGHT", DataTextP9,"RIGHT", -500, -3)
	elseif p == 12 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("RIGHT", DataTextP9,"RIGHT", -350, -3)
	elseif p == 13 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("RIGHT", DataTextP9,"RIGHT", -50, -3)
	elseif p == 14 then
		obj:SetHeight(LBottom:GetHeight())
		obj:SetPoint("CENTER", DataTextP11, "CENTER", 0, 0)
	elseif p == 15 then
		obj:SetHeight(LBottom:GetHeight())
		obj:SetPoint("CENTER", DataTextP10, "CENTER", 0, 0)
	elseif p == 16 then
		obj:SetHeight(LBottom:GetHeight())
		obj:SetPoint("CENTER", DataTextP12, "CENTER", 0, 0)
	end
end