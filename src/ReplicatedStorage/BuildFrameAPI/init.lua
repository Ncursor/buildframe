local rs = game:GetService("ReplicatedStorage")
local BuildFrame = {}
if not rs:FindFirstChild("BuildFrameAPI") then
	script.Parent = rs
end
BuildFrame.Commands = require(script.Commands)
BuildFrame.ConfigBases = require(script.Configbases)
BuildFrame.Data = require(script.Data)
BuildFrame.Databases = require(script.Databases)
BuildFrame.EventBridge = require(script.EventBridge)
BuildFrame.ModList = require(script.ModList)
BuildFrame.ModSetup = require(script.ModSetup)

return BuildFrame