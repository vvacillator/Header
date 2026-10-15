-- Ayden
-- Oct 15th, 2026

local r = require('./packages/react')

function App()
    return r.createElement('Frame', {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromHex('0E0C14'),
    })
end

return App