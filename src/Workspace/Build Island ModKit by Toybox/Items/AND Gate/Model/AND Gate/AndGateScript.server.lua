local base = script.Parent
local model = base.Parent

local visuals = base:WaitForChild("Visuals")
local config = model:WaitForChild("Configuration")

local gates = {}
local gateNames = {"Input1", "Input2", "Output"}

local offColor = BrickColor.new("Bright red")
local onColor = BrickColor.new("Dark green")

local function onInputChanged()
	local input1:CustomEventReceiver = gates.Input1
	local input2:CustomEventReceiver = gates.Input2
	local output:CustomEvent = gates.Output

	if input1.Value > .5 and input2.Value > .5 then
		output.Light.BrickColor = onColor
		output.Event:SetValue(1)
	else
		output.Light.BrickColor = offColor
		output.Event:SetValue(0)
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
	
	local oldName = Instance.new("StringValue")
	oldName.Value = data.Event.Name
	oldName.Name = "OriginalName"
	oldName.Parent = data.Event
	
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