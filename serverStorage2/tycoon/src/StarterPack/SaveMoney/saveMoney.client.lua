local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")

local tool = script.Parent
local saveMoneyFunction = replicatedStorage:WaitForChild("saveMoneyFunction")

tool.Activated:Connect(function()
	print("Activated")
	local money = saveMoneyFunction:InvokeServer(players.LocalPlayer)
	print("Money saved")
end)