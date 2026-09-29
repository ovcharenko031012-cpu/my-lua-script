local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

local flying = false
local speed = 50

local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
bodyVelocity.Velocity = Vector3.zero

local bodyGyro = Instance.new("BodyGyro")
bodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
bodyGyro.CFrame = RootPart.CFrame

-- Перемикання польоту на клавішу E
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        flying = not flying
        
        if flying then
            bodyVelocity.Parent = RootPart
            bodyGyro.Parent = RootPart
            Humanoid.PlatformStand = true
        else
            bodyVelocity.Parent = nil
            bodyGyro.Parent = nil
            Humanoid.PlatformStand = false
        end
    end
end)

-- Оновлення напрямку та руху
RunService.RenderStepped:Connect(function()
    if flying and RootPart then
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.zero

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(EnumОсь простий та універсальний скрипт для польоту (Fly) у Roblox Studio, який працює за допомогою клавіш керування (**WASD**, **Space** для підйому, **Shift** для спуску):

### 1. Інструкція зі створення

1. У вікні **Explorer** знайдіть папку `StarterPlayer` $\rightarrow$ `StarterPlayerScripts`.
2. Натисніть **`+`** біля `StarterPlayerScripts` та додайте **LocalScript**.
3. Назвіть його `FlyScript`.
4. Вставте наступний код всередину скрипта.

---

### 2. Код скрипта (`LocalScript`)

```lua
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local flying = false
local speed = 50

local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
bodyVelocity.Velocity = Vector3.zero

local bodyGyro = Instance.new("BodyGyro")
bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
bodyGyro.CFrame = rootPart.CFrame

-- Перемикання режиму польоту на клавішу E
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.E then
		flying = not flying
		
		if flying then
			bodyVelocity.Parent = rootPart
			bodyGyro.Parent = rootPart
			humanoid.PlatformStand = true
		else
			bodyVelocity.Parent = nil
			bodyGyro.Parent = nil
			humanoid.PlatformStand = false
		end
	end
end)

-- Оновлення напрямку та швидкості руху
RunService.RenderStepped:Connect(function()
	if not flying then return end
	
	local camera = workspace.CurrentCamera
	local moveDirection = Vector3.zero
	
	if UserInputService:IsKeyDown(Enum.KeyCode.W) then
		moveDirection = moveDirection + camera.CFrame.LookVector
	end
	if UserInputService:IsKeyDown(Enum.KeyCode.S) then
		moveDirection = moveDirection - camera.CFrame.LookVector
	end
	if UserInputService:IsKeyDown(Enum.KeyCode.A) then
		moveDirection = moveDirection - camera.CFrame.RightVector
	end
	if UserInputService:IsKeyDown
