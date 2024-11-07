-- Execute and find out what it does...
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Torso = Character.Torso.CFrame
local Knife = Player.Backpack:FindFirstChild("Crude Knife")-- or Character:FindFirstChild("Crude Knife")
local function UpdateGrip( Position )
	Knife.Parent = Player.Backpack
	Knife.Grip = Position
	Knife.Parent = Character
end

while task.wait() do
	for i = 1,3 do
		UpdateGrip(CFrame.new(1.55, -i+5, 1.6) * CFrame.Angles(math.rad(90), 0, 0))
		task.wait(0.1)
	end
	for i = 1,3 do
		UpdateGrip(CFrame.new(1.55, i, 1.6) * CFrame.Angles(math.rad(90), 0, 0))
		task.wait(0.1)
	end
end
