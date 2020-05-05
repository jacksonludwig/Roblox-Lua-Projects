local workspace = game:GetService("Workspace")

local part = Instance.new("Part")

part.Name = "coreBlock"
part.Transparency = 0.5
part.Anchored = true
part.Position = Vector3.new(5, 5, 0)
part.Reflectance = 0.6
part.CanCollide = false

part.Parent = workspace

local partList = {}
local function makePart(name, zPos)
    local genPart = Instance.new("Part")
    genPart.Name = name
    genPart.Color = Color3.new(math.random(0, 255), math.random(0, 255), 
        math.random(0, 255))
    genPart.Anchored = true
    genPart.Position = Vector3.new(5, 5, zPos)

    genPart.Parent = workspace
    partList[#partList + 1] = genPart
end

local count = 0
for i = 0, 100, 1 do
    count = count + 10 
    makePart("genPart" .. i, count)
end

wait(5)

for _, block in ipairs(partList) do
    block.Color = Color3.new(0, 0, 0)
    wait(1)
end
