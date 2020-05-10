local tool = script.Parent
local player = game:GetService("Players").LocalPlayer
local ws = game:GetService("Workspace")
local debris = game:GetService("Debris")

local function shootRay(tool, mouse)
    local ray = Ray.new(tool.Handle.CFrame.p, (mouse.Hit.p - tool.Handle
        .CFrame.p).unit * 300) -- get direction to where we clicked and use .unit * x to make the ray as long as we desire
    local part, position = ws:FindPartOnRay(ray, player.Character, -- args: part hit, part to ignore, treat terrain as cube, hit water
        false, true)
    return ray, part, position
end

local function stretchBeamToHit(tool, beam, hitPosition)
    local distance = (tool.Handle.CFrame.p - hitPosition).magnitude -- subtracts to vectors to get distance
    beam.Size = Vector3.new(0.3, 0.3, distance) -- set size to .3, .3, <length of distance to where we clicked>
    beam.CFrame = CFrame.new(tool.Handle.CFrame.p, hitPosition) * -- put our beam/part in the right place (our wand)
        CFrame.new(0, 0, -distance / 2) -- parts rotate from center by default and point towards you, so: / 2 and * -1
end

local function setBeamVisuals(beam)
    beam.BrickColor = BrickColor.new("Bright red")
    beam.FormFactor = "Custom"
    beam.Material = "Neon"
    beam.Transparency = 0.25
    beam.Anchored = true
    beam.Locked = true
    beam.CanCollide = false
end

local function makeBeam(tool, hitPosition)
    local beam = Instance.new("Part") -- make the part but don't put it in workspace yet
    setBeamVisuals(beam)
    stretchBeamToHit(tool, beam, hitPosition)
    beam.Parent = ws -- put part in workspace
    debris:AddItem(beam, 0.1) -- add part to debris service so it disappears after 0.1 seconds
    return beam
end

local function doDamage(part)
    if part == nil then return end

    local humanoid = part.Parent:FindFirstChild("Humanoid") -- returns hit player or nil if miss

    if not humanoid then -- nil is false and objects are true, so this works
        humanoid = part.Parent.Parent:FindFirstChild("Humanoid") -- check part's parent to make sure we didn't hit hat, etc.
    end

    if humanoid then
        humanoid:TakeDamage(30)
    end
end

local function setToolListener()
    tool.Equipped:Connect(function(mouse) -- check for equip event
        mouse.Button1Down:Connect(function() -- check for click event
            local ray, part, position = shootRay(tool, mouse) -- make ray to clicked location
            local beam = makeBeam(tool, position) -- make part to clicked location
            doDamage(part) -- do damage if it hit a player
        end)
    end)
end

setToolListener()
