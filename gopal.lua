-- Roblox Dead Rails Health Booster Script by ahj gamer
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

-- Set Max Health and Current Health to 5000
humanoid.MaxHealth = 5000
humanoid.Health = 5000

-- Heal 1000 HP per second
while true do
    wait(1)
    if humanoid.Health < humanoid.MaxHealth then
        humanoid.Health = math.min(humanoid.Health + 1000, humanoid.MaxHealth)
    end
end
