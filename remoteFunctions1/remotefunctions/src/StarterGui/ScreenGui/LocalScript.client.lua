local replicatedStorage = game:GetService("ReplicatedStorage")
local textbox = script.Parent:WaitForChild("TextBox")
local button = script.Parent:WaitForChild("TextButton")

local remoteFunction = replicatedStorage.RemoteFunction

local function connectButton()
    button.MouseButton1Click:Connect(function()
        local result = remoteFunction:InvokeServer(textbox.Text)
        print("Was code successful: " .. tostring(result))
    end)
end

connectButton()
