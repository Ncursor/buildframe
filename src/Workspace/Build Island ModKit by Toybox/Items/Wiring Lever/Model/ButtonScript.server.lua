local CollectionService = game:GetService("CollectionService")

local model = script.Parent
local lever = model.Lever
local engage = lever.LeverEngage
local clicker = model.ClickDetector
local leverOn = model.LeverOn

local function onClicked()
	local isOn = not leverOn.Value
	leverOn.Value = isOn
	
	local value = (isOn and 1 or 0)
	engage:SetValue(value)
end

clicker.MouseClick:Connect(onClicked)
CollectionService:AddTag(model, "WiringLever")