local collectionService = game:GetService("CollectionService")
local workspace = game:GetService("Workspace")
local id = 0

for i,v in pairs(workspace:GetDescendants()) do
	collectionService:AddTag(v, id)
	id = id + 1
end

for i,v in pairs(collectionService:GetTagged(3)) do
	print(v)
end

workspace.ChildAdded:Connect(function(part)
	print(part.Name .. " given new id")
	collectionService:AddTag(part, id)
	id = id + 1
end)

wait(5)

local part = Instance.new("Part")
part.Name = "Just made this one"
part.Parent = workspace

wait(1)
for i,v in pairs(collectionService:GetTags(part)) do
	print(v)
end

for i,v in pairs(collectionService:GetTagged(33)) do
	print(v)
end
