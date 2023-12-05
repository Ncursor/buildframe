export type GateEvent = {Inputs:{CustomEventReceiver},Outputs:{CustomEvent}}
local EventBridge = {}

function EventBridge:NewEvents(Gate:Part,InputCount:number,OutputCount:number)
    local GateEvent:GateEvent = {}
    for i = 1,InputCount do
        if Gate[`Input{i}`] then
            table.insert(GateEvent.Inputs,Gate[`Input{i}`])
        end
    end
    for i = 1,OutputCount do
        if Gate[`Output{i}`] then
            table.insert(GateEvent.Outputs,Gate[`Output{i}`])
        end
    end
end

return EventBridge