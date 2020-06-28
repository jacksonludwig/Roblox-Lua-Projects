local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")

local tool = script.Parent
local getMoneyFunction = replicatedStorage:WaitForChild("getMoneyFunction")

tool.Activated:Connect(function()
	print("Activated")
	local money = getMoneyFunction:InvokeServer(players.LocalPlayer)
	print("Money: " .. money)
end)