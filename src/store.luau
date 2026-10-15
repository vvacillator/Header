-- Ayden
-- Oct 15th, 2026

export type Schema = {
    name: string,
    source: string
}

local charm = require('./packages/charm')

local getSchemas, setSchemas = charm.signal({} :: {[string]: Schema})
local getSelected, setSelected = charm.signal(nil :: string?)

return table.freeze {
    getSchemas = getSchemas,
	setSchemas = setSchemas,
	getSelected = getSelected,
	setSelected = setSelected,
}