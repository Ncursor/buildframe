--





sp=script.Parent

sp.Luminate.SourceValueChanged:connect(function(val)
	if val==1 then
		sp.BrickColor=BrickColor.new("Cool yellow")
		sp.Material = "Neon";
		sp.PointLight.Enabled = true
		sp.Transparency=0
	elseif val==0 then
		sp.BrickColor=BrickColor.new("Medium stone grey")
		sp.Transparency=.5
		sp.Material = "SmoothPlastic"
		sp.PointLight.Enabled = false
	end
end)




sp.BrickColor=BrickColor.new("Medium stone grey")
sp.Transparency=.5
sp.Material = "SmoothPlastic"
sp.PointLight.Enabled = false
