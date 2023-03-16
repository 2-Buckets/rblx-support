local Player = game:GetService("Players").LocalPlayer -- required to allow other shi to load
Player.CharacterAdded:Wait(5)

--custom physical propertes

local DENSITY = 0.5
local FRICTION = 0.0025
local ELASTICITY = 5
local FRICTION_WEIGHT = 1
local ELASTICITY_WEIGHT = 1
local autospawn

-- autospawn feature (whats broken)

local ivalue = game.Players.LocalPlayer.Values["As-Toggle"]
if ivalue.Value == 0 then
	autospawn = false
else
	autospawn = true
end

--actual fun shi

local PhysicsService = game:GetService("PhysicsService")
local Balls = "Balls"
local Walls = "Walls"
local bc = game:GetService("Players").LocalPlayer.Values.cbs
local currentballspawned = 0
local debounce = false
local prox = game.Workspace.Main.BallPost.Button.SpawnProx
prox.Triggered:Connect(function()
	local physProperties = PhysicalProperties.new(DENSITY, FRICTION, ELASTICITY, FRICTION_WEIGHT, ELASTICITY_WEIGHT)
	print("proxpressed")
	if autospawn == false then
		local part = Instance.new("Part")
		part.Name = 'Ball'
		part.Shape = Enum.PartType.Ball
		part.Parent = game.Workspace.BallFolder
		part.Color = Color3.new(math.random(0.000000, 1), math.random(0.000000, 1), math.random(0.000000, 1))
		part.Position = Vector3.new(math.random(-10, 10), math.random(115, 135), math.random(-10, 10))
		part.Size = Vector3.new(1, 1, 1)
		part.Anchored = false
		part.Material = Enum.Material.Slate
		part.Reflectance = 0.125
		part.CustomPhysicalProperties = physProperties
		part.CollisionGroup = Balls
		local currentballspawned2 = currentballspawned + 1
		Player.PlayerGui.MainGui.BallCounter.Dynamic.Text = currentballspawned2
		Player.leaderstats.Parts.Value = currentballspawned2
		currentballspawned = currentballspawned2
	else
		while autospawn == true do
			local physProperties = PhysicalProperties.new(DENSITY, FRICTION, ELASTICITY, FRICTION_WEIGHT, ELASTICITY_WEIGHT)
			if debounce == false then
				debounce = true
				local part = Instance.new("Part")
				part.Name = 'Ball'
				part.Shape = Enum.PartType.Ball
				part.Parent = game.Workspace.BallFolder
				part.Color = Color3.new(math.random(0.000000, 1), math.random(0.000000, 1), math.random(0.000000, 1))
				part.Position = Vector3.new(math.random(-10, 10), math.random(115, 135), math.random(-10, 10))
				part.Size = Vector3.new(1, 1, 1)
				part.Anchored = false
				part.Material = Enum.Material.Slate
				part.Reflectance = 0.125
				part.CustomPhysicalProperties = physProperties
				part.CollisionGroup = Balls
				local currentballspawned2 = currentballspawned + 1
				Player.PlayerGui.MainGui.BallCounter.Dynamic.Text = currentballspawned2
				Player.leaderstats.Parts.Value = currentballspawned2
				currentballspawned = currentballspawned2
				wait(.25)
				debounce = false
			end
		end
	end
end)
