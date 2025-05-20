-- Remove existing GUI if present
if game.CoreGui:FindFirstChild("HealthGui") then
    game.CoreGui.HealthGui:Destroy()
end

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HealthGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

-- Create main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 120)
mainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Text = "Infinite Health Booster"
titleLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.Parent = mainFrame

-- Minimize button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -30, 0, 0)
minimizeButton.Text = "-"
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.SourceSans
minimizeButton.TextSize = 20
minimizeButton.Parent = mainFrame

-- Activate Health Boost button
local activateButton = Instance.new("TextButton")
activateButton.Size = UDim2.new(1, -20, 0, 40)
activateButton.Position = UDim2.new(0, 10, 0, 40)
activateButton.Text = "Activate Health Boost"
activateButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.Font = Enum.Font.SourceSans
activateButton.TextSize = 18
activateButton.Parent = mainFrame

-- Minimize functionality
local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, obj in pairs(mainFrame:GetChildren()) do
        if obj ~= titleLabel and obj ~= minimizeButton then
            obj.Visible = not minimized
        end
    end
end)

-- Activate Health Boost functionality
activateButton.MouseButton1Click:Connect(function()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.MaxHealth = 50000
        humanoid.Health = 50000

        -- Start regeneration
        spawn(function()
            while humanoid and humanoid.Health < humanoid.MaxHealth do
                wait(1)
                humanoid.Health = math.min(humanoid.Health + 1000, humanoid.MaxHealth)
            end
        end)
    end
end)
