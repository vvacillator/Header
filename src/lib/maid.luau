--!nolint
export type Item =
	(() -> ())
	| RBXScriptConnection
	| Instance
	| thread
	| { destroy: (any) -> () }
	| { Destroy: (any) -> () }

local Maid = {}
Maid.__index = Maid

export type Maid = typeof(setmetatable(
	{} :: {
		items: { Item },
	},
	Maid
))

local function cleanup(item: Item)
	local kind = typeof(item)

	if kind == "function" then
		(item :: any)()
	elseif kind == "RBXScriptConnection" then
		(item :: RBXScriptConnection):Disconnect()
	elseif kind == "Instance" then
		(item :: Instance):Destroy()
	elseif kind == "thread" then
		task.cancel(item :: thread)
	elseif kind == "table" then
		local object = item :: any
		if object.destroy then
			object:destroy()
		elseif object.Destroy then
			object:Destroy()
		end
	end
end

function Maid.new(): Maid
	return setmetatable({ items = {} }, Maid)
end

function Maid.give<T>(self: Maid, item: T & Item): T
	table.insert(self.items, item::any)
	return item
end

function Maid.extend(self: Maid): Maid
	return self:give(Maid.new())
end

function Maid.destroy(self: Maid)
	local items = self.items
	self.items = {}

	for index = #items, 1, -1 do
		cleanup(items[index])
	end
end

return Maid
