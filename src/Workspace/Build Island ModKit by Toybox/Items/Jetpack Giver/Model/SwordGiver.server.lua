local DB = true

for i,v in pairs(script.Parent:GetChildren()) do
	if v.Name == "Sword" and v:IsA("BasePart") then
		v.Touched:connect(function(hit)
			if DB then
				local Player = game.Players:GetPlayerFromCharacter(hit.Parent)
				if Player then
					DB = false
					game.Lighting.Jetpack:Clone().Parent = Player.Backpack
					wait(3)
					DB = true
				end
			end
		end)
	end
end