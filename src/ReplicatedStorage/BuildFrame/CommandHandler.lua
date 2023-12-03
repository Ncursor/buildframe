type Command = {Aliases:{string},Permission:number,Function:(PlayerRan:Player,Arguments:{string})->()}
local Players = game:GetService("Players")
local Commandlist:{[string]:Command} = require(script.Parent.Commands)

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message:string)
        local Command = message:split("/")
    end)
end)