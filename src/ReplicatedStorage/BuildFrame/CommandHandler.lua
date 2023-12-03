
-- !PART OF THE CORE SCRIPT, ONLY EDIT IF YOU KNOW WHAT YOU'RE DOING!

type Command = {Aliases:{string},Permission:number,Function:(PlayerRan:Player,Arguments:{string})->()}
local Players = game:GetService("Players")
local Commandlist:{[string]:Command} = require(script.Parent.Commands)

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message:string)
        local Command = message:split("/")
        for n,c in Commandlist do
            if table.find(c.Aliases,Command) then
                table.remove(Command,1)
                c.Function(player,Command)
            end
        end
    end)
end)