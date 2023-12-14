export type ModInstance = {Name:string,Description:string,Version:number,Credit:string}
export type ModInstanceInfo = (self:any,Name:string,Description:string,Version:number,Credit:string)->ModInstance
export type ModSetup = {New:ModInstanceInfo & (self:any,mymod:ModuleScript)->ModInstance}
local ModSetup:ModSetup = {}
local MetaTemplate = {
    __tostring = function(self:ModInstance)
        return `{self.Name}:{self.Version}`
    end,
    __eq = function(self:ModInstance,value:ModInstance)
        if not tostring(value) == `{self.Name}:{self.Version}` then return end
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

function ModSetup:CreateConfig(ModInstance:ModInstance)
    
end

return ModSetup