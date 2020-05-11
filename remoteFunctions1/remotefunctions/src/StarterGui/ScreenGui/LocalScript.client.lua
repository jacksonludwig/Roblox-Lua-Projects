local parent = script.Parent
local textbox = parent:WaitForChild("TextBox")
local startButton = parent:WaitForChild("TextButton")
local workspace = game:GetService("Workspace")
local boardlabel = workspace.board.SurfaceGui.TextLabel

local function setButtonListener()
    startButton.MouseButton1Click:Connect(function()
        if textbox.text == "1234" then
            --boardlabel.Text = "UNLOCKED"
        else
            print("Password incorrect!")
        end
    end)
end

setButtonListener()
