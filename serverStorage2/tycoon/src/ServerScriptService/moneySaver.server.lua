local replicatedStorage = game:GetService("ReplicatedStorage")
local serverStorage = game:GetService("ServerStorage")

local saveMoneyFunction = replicatedStorage.saveMoneyFunction

local PlayerStatManager = require(serverStorage.playerStatManager)

saveMoneyFunction.OnServerInvoke = function(player)
    PlayerStatManager.ManualSave(player)
    return true
end
