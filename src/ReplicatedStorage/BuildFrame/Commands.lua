local Players = game:GetService("Players")
local Commands = {
    kill = {
        Aliases = {"kill","die"},
        Permission = 3,
        Function = function(PlayerRan:Player,Arguments:{string})
            Players[Arguments or PlayerRan].Character:WaitForChild("Humanoid").Health = 0
        end
    }
}

return Commands