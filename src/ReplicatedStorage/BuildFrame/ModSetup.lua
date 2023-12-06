export type ModInstance = {Description:string,Version:number,Credit:string}
export type ModInstanceInfo = (self:any,Name:string,Description:string,Version:number,Credit:string)->ModInstance
export type ModSetup = {New:ModInstanceInfo & (self:any,mymod:ModuleScript)->ModInstance}
local ModSetup:ModSetup = {}
local Data = require(script.Parent.Data)
local function NewWithTable(Name:string,mymod:ModuleScript)
    local mymodinfo = require(mymod)
    local ModInstance:ModInstance = {Name = Name,Description = mymodinfo.description,Version = mymodinfo.v,Credit = mymodinfo.credit}
    return ModInstance
end
function ModSetup:New(Name,Description,Credit,Version)
    local ModInstance:ModInstance
    if Description or Version or Credit then
    ModInstance = {Name = Name,Description = Description,Version = Version,Credit = Credit}
    else
    ModInstance = NewWithTable(Description)
    end
    Data:NewDatabase(ModInstance.Name)
    Data:SetData("Data",ModInstance,ModInstance.Name)
    return ModInstance
end

return ModSetup