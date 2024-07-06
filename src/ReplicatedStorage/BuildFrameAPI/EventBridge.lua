export type GateSignal = {Connect:(Enabled:boolean)->()}
export type Input = {OnInput:RBXScriptSignal,Object:CustomEventReceiver}
export type Output = {SendSignal:GateSignal,Object:CustomEvent}
export type GateEvent = {Inputs:{Input},Output:Output}
local EventBridge = {}

function EventBridge:NewEvents(Gate:Part,InputCount:number,OutputCount:number)
    local GateEvent:GateEvent = {}
    for i = 1,InputCount do
        local InputObject:CustomEventReceiver = Gate:FindFirstChild(`Input{i}`)
        if InputObject then
            table.insert(GateEvent.Inputs[i].Object,InputObject)
            table.insert(GateEvent.Inputs[i].OnInput,InputObject.SourceValueChanged)
        else
            error(`Gate "{Gate.Name}" Missing Input`)
        end
    end
    if Gate:FindFirstChild(`Output`) then
        GateEvent.Output.Object = Gate:FindFirstChild(`Output`)
        GateEvent.Output.SendSignal = function(Enabled:boolean)
            if Enabled then
                GateEvent.Output.Object:SetValue(1)
            else
                GateEvent.Output.Object:SetValue(0)
            end
        end
    else
        error(`Gate "{Gate.Name}" Missing Output`)
    end
    return GateEvent
end

return EventBridge