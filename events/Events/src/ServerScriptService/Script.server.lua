local workspace = game:GetService("Workspace")
local storage = game:GetService("ServerStorage")

local boolValue = storage.someBoolValue

print(boolValue.Value)

wait(5)

boolValue.Value = true

print(boolValue.Value)
