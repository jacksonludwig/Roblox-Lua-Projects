local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteFunction = replicatedStorage.RemoteFunction

local ws = game:GetService("Workspace")
local boardlabel = ws.board.SurfaceGui.TextLabel

local function setServerInvokeOnRemoteFunc()
    remoteFunction.OnServerInvoke = function(player, code)
        if code == "1234" then
            boardlabel.Text = "UNLOCKED"
            return true
        else
            return false
        end
    end
end

setServerInvokeOnRemoteFunc()
