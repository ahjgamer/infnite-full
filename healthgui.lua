-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HealthGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.05, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local HealthButton = Instance.new("TextButton")
HealthButton.Size = UDim2.new(0, 180, 0, 40)
HealthButton.Position = UDim2.new(0, 10, 0, 10)
HealthButton.Text = "Health"
HealthButton.TextColor3 = Color3.new(1, 1, 1)
HealthButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
HealthButton.Font = Enum.Font.SourceSansBold
HealthButton.TextSize = 24
HealthButton.Parent = Frame

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 180, 0, 30)
MinimizeButton.Position = UDim2.new(0, 10, 0, 60)
MinimizeButton.Text = "Minimize"
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 20
MinimizeButton.Parent = Frame

-- Toggle GUI Visibility
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		HealthButton.Visible = false
		MinimizeButton.Text = "Maximize"
	else
		HealthButton.Visible = true
		MinimizeButton.Text = "Minimize"
	end
end)

-- Health Logic
local regenActive = false
HealthButton.MouseButton1Click:Connect(function()
	local player = game:GetService("Players").LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")

	humanoid.MaxHealth = 50000
	humanoid.Health = 50000

	if not regenActive then
		regenActive = true
		coroutine.wrap(function()
			while regenActive and humanoid and humanoid.Parent do
				wait(1)
				if humanoid.Health < humanoid.MaxHealth then
					humanoid.Health = math.min(humanoid.Health + 1000, humanoid.MaxHealth)
				end
			end
		end)()
	end
end)
