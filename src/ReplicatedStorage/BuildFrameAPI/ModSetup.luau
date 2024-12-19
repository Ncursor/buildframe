export type ModInstance = {Name:string,Description:string,Version:number,Credit:string}
export type ModInstanceInfo = (self:any,Name:string,Description:string,Version:number,Credit:string)->ModInstance
export type ModSetup = {New:ModInstanceInfo & (self:any,Name:string,mymod:ModuleScript)->ModInstance}
local ModSetup:ModSetup = {}
local MetaTemplate = {
    __tostring = function(self:ModInstance)
        return `{self.Name}:{self.Version}`
    end,
    __eq = function(self:ModInstance,value:ModInstance)
        if tostring(value) ~= `{self.Name}:{self.Version}` then return end
        return self.Name == value.Name
    end
}
local Data = require(script.Parent.Data)
local function NewWithTable(Name:string,mymod:ModuleScript)
    local mymodinfo = require(mymod)
    local ModInstance = setmetatable({Name = Name,
    Description = mymodinfo.description,
    Version = mymodinfo.v,
    Credit = mymodinfo.credit},MetaTemplate)
    return ModInstance
end
function ModSetup:New(Name:string,Description:string,Credit:string,Version:string)
    local ModInstance
    if Description or Version or Credit then
    ModInstance = setmetatable({Name = Name,Description = Description,Version = Version,Credit = Credit},MetaTemplate)
    else
    ModInstance = NewWithTable(Name,Description)
    end
    Data:NewDatabase(ModInstance.Name)
    Data:SetData("Data",ModInstance,ModInstance.Name)
    return ModInstance
end

return ModSetup