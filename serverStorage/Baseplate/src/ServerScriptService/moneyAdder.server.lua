local replicatedStorage = game:GetService("ReplicatedStorage")
local serverStorage = game:GetService("ServerStorage")

local addMoneyFunction = replicatedStorage.addMoneyFunction

local PlayerStatManager = require(serverStorage.playerStatManager)

addMoneyFunction.OnServerInvoke = function(player)
    PlayerStatManager.ChangeStat(player, "Money", 100)
    return true
end
