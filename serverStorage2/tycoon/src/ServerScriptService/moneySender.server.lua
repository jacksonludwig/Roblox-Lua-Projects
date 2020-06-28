local replicatedStorage = game:GetService("ReplicatedStorage")
local serverStorage = game:GetService("ServerStorage")

local getMoneyFunction = replicatedStorage.getMoneyFunction

local PlayerStatManager = require(serverStorage.playerStatManager)

getMoneyFunction.OnServerInvoke = function(player)
    return PlayerStatManager.GetStat(player, "Money")
end
