local workspace = game:GetService("Workspace")

local part1 = workspace.part1

wait(1)

--part1:Destroy()

local clonedPart = part1:Clone()
clonedPart.Name = "clone"
clonedPart.Parent = workspace

wait(5)

part1:ClearAllChildren()
clonedPart:ClearAllChildren()
