-- Started Oct 15th, 2026

local maid = require(script.lib.maid)
local react = require(script.packages.react)
local charm = require(script.packages.charm)
local reactRoblox = require(script.packages.react_roblox)

local app = require(script.app)
local store = require(script.store)

local job = maid.new()

local toolbar = plugin:CreateToolbar('Header')
local button = toolbar:CreateButton('Header', 'Open Editor', 'rbxassetid://110458012654178')
button.ClickableWhenViewportHidden = true

local widget = plugin:CreateDockWidgetPluginGuiAsync('Header', DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, 420, 520, 320, 360))
widget.Name = 'Header'
widget.Title = 'Editor'

store.setSchemas(plugin:GetSetting('schema') or {})
job:give(charm.subscribe(store.getSchemas, function(schemas)
    plugin:SetSetting('schemas', schemas)
end))
job:give(button.Click:Connect(function()
    widget.Enabled = not widget.Enabled
end))
job:give(widget:GetPropertyChangedSignal('Enabled'):Connect(function()
    button:SetActive(widget.Enabled)
end))

local root = reactRoblox.createRoot(Instance.new('Folder'))
root:render(reactRoblox.createPortal(react.createElement(app), widget))

job:give(function()
    root:unmount()
end)
plugin.Unloading:Once(function()
    job:destroy()
end)