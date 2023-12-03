local Players = game:GetService("Players")
local Command = {
    Name = "kill",
    Aliases = {"die","death"},
    Permission = 3,
    Function = function(PlayerRan:Player,Arguments:{string})
        Players[Arguments or PlayerRan].Character:WaitForChild("Humanoid").Health = 0
    end
}

return Command