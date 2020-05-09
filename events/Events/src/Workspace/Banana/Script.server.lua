local workspace = game:GetService("Workspace")
local players = game:GetService("Players")

local bananaPart = workspace.Banana

local function setSlipListener()
    bananaPart.Touched:Connect(function(inst) -- takes in function, the argument (an obj) is passed automatically by touched
        local parent = inst.Parent
        if players:GetPlayerFromCharacter(parent) then
            parent.Humanoid.Sit = true
            print(inst.Name .. " touched banana")
        end
    end)
end

setSlipListener()
