local BF = script.Parent
local Databases = require(BF.Databases)
local BFData = {}

BFData.GlobalData = Databases.Global
function BFData:SetData(Key:string,Data:any,Database:string?)
	Databases[Database or "Global"][Key] = Data
end

function BFData:NewValue(Key:string,Type:string,Data:any,Valuebase:string?)
	if BF.Valuebases[Valuebase or "Global"]:FindFirstChild(Key) then
		warn(`Value "{Key}" of Valuebase "{Valuebase or "Global"}" already exist`)
	end
	local Value:ValueBase = Instance.new(`{Type}Value`)
	Value.Value = Data
	Value.Name = Key
	Value.Parent =  BF.Valuebases[Valuebase or "Global"]
	return Value
end

function BFData:NewDatabase(Name:string)
	if Databases[Name] then
		warn(`Database "{Name}" already exist`)
		return
	end
	Databases[Name] = {}
end

function BFData:NewValuebase(Name:string)
	if BF.Valuebases[Name] then
		warn(`Valuebase "{Name}" already exist`)
		return
	end
	local Valuebase = Instance.new("Folder")
	Valuebase.Name = Name
	Valuebase.Parent = BF.Valuebases
end

function BFData:SetValue(Name:string,Data:any,Valuebase:string?)
	if not typeof(BF.Valuebases[Valuebase or "Global"].Value) ~= typeof(Data) then
		return
	end
	BF.Valuebases[Valuebase or "Global"].Value = Data
end

function BFData:NewConfigbase(Name:string)
	local Configbase = require(BF.Configbase)
	Configbase[Name] = {}
end

return BFData
