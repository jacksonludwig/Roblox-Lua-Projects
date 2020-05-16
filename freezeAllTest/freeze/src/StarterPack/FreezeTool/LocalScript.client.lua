local replicatedStorage = game:GetService("ReplicatedStorage")
local freezeEvent = replicatedStorage.FreezeAllEvent

local tool = script.Parent
local player = game:GetService("Players").LocalPlayer

tool.Activated:Connect(function()
    print("Freeze Event Firing")
    freezeEvent:FireServer() -- player auto sent
end)
