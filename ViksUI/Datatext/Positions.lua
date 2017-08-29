local T, C, L, _ = unpack(select(2, ...))
LeftDatatexts = {}
function PP(p, obj)
	if p == 1 then
		obj:SetHeight(LBottom:GetHeight())
		obj:SetPoint("LEFT", LBottom, "LEFT", 5, 0)
	elseif p == 2 then
		obj:SetHeight(LBottom:GetHeight())
		obj:SetPoint("CENTER", LBottom, "CENTER", 0, 0)
	elseif p == 3 then
		obj:SetHeight(LBottom:GetHeight())
		obj:SetPoint("RIGHT", LBottom, "RIGHT", -5, 0)
	elseif p == 4 then
		obj:SetHeight(RBottom:GetHeight())
		obj:SetPoint("LEFT", RBottom,"LEFT", 5, 0)
	elseif p == 5 then
		obj:SetHeight(RBottom:GetHeight())
		obj:SetPoint("CENTER", RBottom,"CENTER", 0, 0)
	elseif p == 6 then
		obj:SetHeight(RBottom:GetHeight())
		obj:SetPoint("RIGHT", RBottom,"RIGHT", -5, 0)
	elseif p == 7 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("LEFT", CPTopp,"LEFT", 5, -2)
	elseif p == 8 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("LEFT", CPTopp,"LEFT", 350, -2)
	elseif p == 9 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("LEFT", CPTopp,"LEFT", 500, -2)
	elseif p == 10 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("TOP", CPTopp,"TOP", 0, -2)
	elseif p == 11 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("RIGHT", CPTopp,"RIGHT", -350, -2)
	elseif p == 12 then
		obj:SetHeight(CPTopp:GetHeight())
		obj:SetPoint("RIGHT", CPTopp,"RIGHT", -100, -2)
	end
end