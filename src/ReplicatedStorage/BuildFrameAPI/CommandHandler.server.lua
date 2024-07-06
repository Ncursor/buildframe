
-- !PART OF THE CORE SCRIPT, ONLY EDIT IF YOU KNOW WHAT YOU'RE DOING!

export type Command = {Aliases:{string},Permission:number,Function:(PlayerRan:Player,Arguments:{string})->()}
local Players = game:GetService("Players")
local Commandlist:{[string]:Command} = require(script.Parent.Commands)