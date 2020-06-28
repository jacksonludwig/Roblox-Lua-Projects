local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")

local tool = script.Parent
local addMoneyFunction = replicatedStorage:WaitForChild("addMoneyFunction")

tool.Activated:Connect(function()
	print("Activated")
	local money = addMoneyFunction:InvokeServer(players.LocalPlayer)
	print("Money added")
end)