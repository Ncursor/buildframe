-- local wait = require(game.ServerStorage.PrivateModules.FastWait)

local base = script.Parent
local model = base.Parent

local visuals = base:WaitForChild("Visuals")
local config = model:WaitForChild("Configuration")

local timeOff = config:WaitForChild("TimeOff")
local timeOn = config:WaitForChild("TimeOn")

local gates = {}
local gateNames = {"Input", "RepeaterOutput"}

local offColor = BrickColor.new("Bright red")
local onColor = BrickColor.new("Dark green")

local enabled = false

local function onInputChanged()
	local input = gates.Input
	local output = gates.RepeaterOutput
	
	if input.Value > .5 then
		enabled = true
		
		while enabled do
			output.Light.BrickColor = onColor
			output.Event:SetValue(1)
			
			wait(timeOn.Value)
			
			output.Light.BrickColor = offColor
			output.Event:SetValue(0)
			
			wait(timeOff.Value)
		end
	else
		enabled = false
	end
end

for _,gate in pairs(gateNames) do
	local data = 
	{
		Event = base:WaitForChild(gate);
		Light = model:WaitForChild(gate);
		
		Visual = visuals:WaitForChild(gate);
		Label = config:WaitForChild(gate .. " Label");
	}
	
	local function onLabelChanged()
		local newLabel = data.Label.Value
		data.Visual.Text = newLabel
		data.Event.Name = newLabel
	end
	
	onLabelChanged()
	data.Label.Changed:Connect(onLabelChanged)
	
	if data.Event:IsA("CustomEventReceiver") then
		local function onSourceChanged(value, init)
			if value > .5 then
				data.Light.BrickColor = onColor
			else
				data.Light.BrickColor = offColor
			end
			
			data.Value = value
			
			if not init then
				onInputChanged()
			end
		end
		
		onSourceChanged(data.Event:GetCurrentValue(), true)
		data.Event.SourceValueChanged:Connect(onSourceChanged)
	end
	
	gates[gate] = data
end

onInputChanged()