local replicatedStorage = game:GetService("ReplicatedStorage")
local freezeEvent = replicatedStorage.FreezeAllEvent

local playerList = game:GetService("Players")

local function anchorParts(char)
    for _, part in ipairs(char.Character:GetChildren()) do
        if part:IsA("BasePart") then part.Anchored = true end
    end
end

local function setFreezeEvent()
    freezeEvent.OnServerEvent:Connect(function(player)
        for _, client in ipairs(playerList:GetPlayers()) do
            if client ~= player then
                print("Freezing player: " .. client.Name)
                anchorParts(client)
            end
        end
    end)
end

setFreezeEvent()
