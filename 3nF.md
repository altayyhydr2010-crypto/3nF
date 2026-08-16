-- =========================================== --
-- Script: TimeBomb Advanced V4.5
-- Developer: 3nF
-- Executor: Delta | Keyless
-- Telegram: xxx9ooo
-- =========================================== --

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local title = Instance.new("TextLabel")
local closeBtn = Instance.new("TextButton")
local minimizeBtn = Instance.new("TextButton")
local dragArea = Instance.new("Frame")
local credit = Instance.new("TextLabel")
local telegram = Instance.new("TextLabel")
local btns = {}

-- =========================================== --
-- إعداد الواجهة الرئيسية
-- =========================================== --
gui.Name = "3nF_TimeBomb"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

mainFrame.Size = UDim2.new(0, 320, 0, 520)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
mainFrame.BackgroundTransparency = 0.05
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 170, 0)
mainFrame.Parent = gui

-- منطقة السحب
dragArea = Instance.new("Frame")
dragArea.Size = UDim2.new(1, 0, 0, 40)
dragArea.Position = UDim2.new(0, 0, 0, 0)
dragArea.BackgroundTransparency = 1
dragArea.Parent = mainFrame

-- عنوان السكربت
title.Size = UDim2.new(1, -80, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "💣 TimeBomb V4 | By 3nF"
title.TextColor3 = Color3.fromRGB(255, 200, 50)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = dragArea

-- زر الإغلاق
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -33, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = dragArea

local uiVisible = true
closeBtn.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    mainFrame.Visible = uiVisible
end)

-- زر التصغير
minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
minimizeBtn.Position = UDim2.new(1, -65, 0, 6)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
minimizeBtn.BorderSizePixel = 1
minimizeBtn.BorderColor3 = Color3.fromRGB(255, 170, 0)
minimizeBtn.Text = "─"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextScaled = true
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = dragArea

local isMinimized = false
local savedSize = mainFrame.Size

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        mainFrame.Size = UDim2.new(0, 250, 0, 40)
        minimizeBtn.Text = "□"
        for _, child in pairs(mainFrame:GetChildren()) do
            if child ~= dragArea and child ~= title and child ~= closeBtn and child ~= minimizeBtn then
                child.Visible = false
            end
        end
    else
        mainFrame.Size = savedSize
        minimizeBtn.Text = "─"
        for _, child in pairs(mainFrame:GetChildren()) do
            if child ~= dragArea and child ~= title and child ~= closeBtn and child ~= minimizeBtn then
                child.Visible = true
            end
        end
    end
end)

-- اختصار F5
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F5 then
        uiVisible = not uiVisible
        mainFrame.Visible = uiVisible
    end
end)

-- =========================================== --
-- دالة إنشاء الأزرار
-- =========================================== --
local function createButton(text, yPos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 30)
    btn.Position = UDim2.new(0.075, 0, yPos, 0)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
    btn.BorderSizePixel = 1
    btn.BorderColor3 = color or Color3.fromRGB(255, 170, 0)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = mainFrame
    return btn
end

-- الأزرار
local autoPassBtn = createButton("⚡ Auto Pass [OFF]", 0.12, Color3.fromRGB(255, 170, 0))
local speedBtn = createButton("🏃 Speed [OFF]", 0.20, Color3.fromRGB(255, 170, 0))
local reachBtn = createButton("🖐️ Reach [OFF]", 0.28, Color3.fromRGB(200, 100, 255))
local silentAimBtn = createButton("🔫 Silent Aim [OFF]", 0.36, Color3.fromRGB(255, 50, 50))
local autoWinBtn = createButton("🔄 Auto Win [OFF]", 0.44, Color3.fromRGB(50, 200, 50))
local aimbotBtn = createButton("🎯 Aimbot [OFF]", 0.52, Color3.fromRGB(255, 150, 0))
local antiAFKBtn = createButton("🔔 Anti-AFK [OFF]", 0.60, Color3.fromRGB(0, 200, 255))
local godModeBtn = createButton("🛡️ God Mode [OFF]", 0.68, Color3.fromRGB(0, 255, 150))
local espBtn = createButton("👁️ ESP [OFF]", 0.76, Color3.fromRGB(255, 100, 200))
local antiCrashBtn = createButton("🔒 Anti-Crash [OFF]", 0.84, Color3.fromRGB(255, 50, 100))
local explosionBtn = createButton("💥 Explosion [OFF]", 0.92, Color3.fromRGB(255, 100, 0))

-- اسم الصانع
credit.Size = UDim2.new(1, 0, 0, 16)
credit.Position = UDim2.new(0, 0, 1.00, 0)
credit.BackgroundTransparency = 1
credit.Text = "⭐ Script by 3nF ⭐"
credit.TextColor3 = Color3.fromRGB(255, 170, 0)
credit.TextScaled = true
credit.Font = Enum.Font.GothamBold
credit.Parent = mainFrame

-- سطر التليجرام
telegram.Size = UDim2.new(1, 0, 0, 16)
telegram.Position = UDim2.new(0, 0, 1.06, 0)
telegram.BackgroundTransparency = 1
telegram.Text = "📱 Telegram: xxx9ooo"
telegram.TextColor3 = Color3.fromRGB(100, 200, 255)
telegram.TextScaled = true
telegram.Font = Enum.Font.Gotham
telegram.Parent = mainFrame

-- =========================================== --
-- المتغيرات
-- =========================================== --
local autoPass = false
local speedBoost = false
local reachEnabled = false
local silentAim = false
local autoWin = false
local aimbot = false
local antiAFK = false
local godMode = false
local espEnabled = false
local antiCrash = false
local explosionEnabled = false
local originalSpeed = player.Character and player.Character.Humanoid.WalkSpeed or 16
local espObjects = {}

-- =========================================== --
-- 1. ⚡ Auto Pass
-- =========================================== --
autoPassBtn.MouseButton1Click:Connect(function()
    autoPass = not autoPass
    autoPassBtn.Text = autoPass and "⚡ Auto Pass [ON]" or "⚡ Auto Pass [OFF]"
    autoPassBtn.BackgroundColor3 = autoPass and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(50, 50, 80)
    if autoPass then
        spawn(function()
            while autoPass do
                wait(0.5)
                local bomb = workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    local nearest = nil
                    local minDist = 10
                    for _, v in pairs(game.Players:GetPlayers()) do
                        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local dist = (v.Character.HumanoidRootPart.Position - bomb.Position).Magnitude
                            if dist < minDist then
                                nearest = v
                                minDist = dist
                            end
                        end
                    end
                    if nearest then
                        bomb.CFrame = CFrame.new(nearest.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0))
                    end
                end
            end
        end)
    end
end)

-- =========================================== --
-- 2. 🏃 Speed
-- =========================================== --
speedBtn.MouseButton1Click:Connect(function()
    speedBoost = not speedBoost
    speedBtn.Text = speedBoost and "🏃 Speed [ON]" or "🏃 Speed [OFF]"
    speedBtn.BackgroundColor3 = speedBoost and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(50, 50, 80)
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speedBoost and 50 or originalSpeed
    end
end)

-- =========================================== --
-- 3. 🖐️ Reach
-- =========================================== --
reachBtn.MouseButton1Click:Connect(function()
    reachEnabled = not reachEnabled
    reachBtn.Text = reachEnabled and "🖐️ Reach [ON]" or "🖐️ Reach [OFF]"
    reachBtn.BackgroundColor3 = reachEnabled and Color3.fromRGB(150, 50, 200) or Color3.fromRGB(50, 50, 80)
    if reachEnabled then
        spawn(function()
            while reachEnabled do
                wait(0.1)
                local char = player.Character
                if not char then continue end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end
                local bomb = workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    local dist = (bomb.Position - hrp.Position).Magnitude
                    if dist > 5 and dist < 50 then
                        bomb.CFrame = CFrame.new(hrp.Position + hrp.CFrame.LookVector * 3)
                    end
                end
            end
        end)
    end
end)

-- =========================================== --
-- 4. 🔫 Silent Aim
-- =========================================== --
silentAimBtn.MouseButton1Click:Connect(function()
    silentAim = not silentAim
    silentAimBtn.Text = silentAim and "🔫 Silent Aim [ON]" or "🔫 Silent Aim [OFF]"
    silentAimBtn.BackgroundColor3 = silentAim and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(50, 50, 80)
    if silentAim then
        spawn(function()
            while silentAim do
                wait(0.1)
                local bomb = workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    local nearest = nil
                    local minDist = 50
                    for _, v in pairs(game.Players:GetPlayers()) do
                        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local dist = (v.Character.HumanoidRootPart.Position - bomb.Position).Magnitude
                            if dist < minDist then
                                nearest = v
                                minDist = dist
                            end
                        end
                    end
                    if nearest then
                        bomb.Velocity = (nearest.Character.HumanoidRootPart.Position - bomb.Position).Unit * 50
                    end
                end
            end
        end)
    end
end)

-- =========================================== --
-- 5. 🔄 Auto Win
-- =========================================== --
autoWinBtn.MouseButton1Click:Connect(function()
    autoWin = not autoWin
    autoWinBtn.Text = autoWin and "🔄 Auto Win [ON]" or "🔄 Auto Win [OFF]"
    autoWinBtn.BackgroundColor3 = autoWin and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(50, 50, 80)
    if autoWin then
        spawn(function()
            while autoWin do
                wait(1)
                local bomb = workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    for _, v in pairs(game.Players:GetPlayers()) do
                        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local clone = bomb:Clone()
                            clone.Parent = workspace
                            clone.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                            clone.Velocity = Vector3.new(0, -30, 0)
                            game:GetService("Debris"):AddItem(clone, 2)
                        end
                    end
                end
            end
        end)
    end
end)

-- =========================================== --
-- 6. 🎯 Aimbot
-- =========================================== --
aimbotBtn.MouseButton1Click:Connect(function()
    aimbot = not aimbot
    aimbotBtn.Text = aimbot and "🎯 Aimbot [ON]" or "🎯 Aimbot [OFF]"
    aimbotBtn.BackgroundColor3 = aimbot and Color3.fromRGB(200, 100, 0) or Color3.fromRGB(50, 50, 80)
    if aimbot then
        spawn(function()
            while aimbot do
                wait(0.05)
                local bomb = workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    local nearest = nil
                    local minDist = 50
                    for _, v in pairs(game.Players:GetPlayers()) do
                        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local dist = (v.Character.HumanoidRootPart.Position - bomb.Position).Magnitude
                            if dist < minDist then
                                nearest = v
                                minDist = dist
                            end
                        end
                    end
                    if nearest then
                        local targetPos = nearest.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)
                        bomb.CFrame = CFrame.new(bomb.Position, targetPos)
                        bomb.Velocity = (targetPos - bomb.Position).Unit * 60
                    end
                end
            end
        end)
    end
end)

-- =========================================== --
-- 7. 🔔 Anti-AFK
-- =========================================== --
antiAFKBtn.MouseButton1Click:Connect(function()
    antiAFK = not antiAFK
    antiAFKBtn.Text = antiAFK and "🔔 Anti-AFK [ON]" or "🔔 Anti-AFK [OFF]"
    antiAFKBtn.BackgroundColor3 = antiAFK and Color3.fromRGB(0, 150, 200) or Color3.fromRGB(50, 50, 80)
    if antiAFK then
        spawn(function()
            while antiAFK do
                wait(60)
                local char = player.Character
                if char and char:FindFirstChild("Humanoid") then
                    local humanoid = char.Humanoid
                    humanoid:Move(Vector3.new(math.random(-1, 1), 0, math.random(-1, 1)), true)
                    wait(0.1)
                    humanoid:Move(Vector3.new(0, 0, 0), true)
                end
            end
        end)
    end
end)

-- =========================================== --
-- 8. 🛡️ God Mode
-- =========================================== --
godModeBtn.MouseButton1Click:Connect(function()
    godMode = not godMode
    godModeBtn.Text = godMode and "🛡️ God Mode [ON]" or "🛡️ God Mode [OFF]"
    godModeBtn.BackgroundColor3 = godMode and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(50, 50, 80)
    if godMode then
        spawn(function()
            while godMode do
                wait(0.1)
                local char = player.Character
                if char then
                    local humanoid = char:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.MaxHealth = math.huge
                        humanoid.Health = humanoid.MaxHealth
                        humanoid.BreakJointsOnDeath = false
                    end
                end
            end
        end)
    else
        local char = player.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.MaxHealth = 100
                humanoid.Health = 100
                humanoid.BreakJointsOnDeath = true
            end
        end
    end
end)

-- =========================================== --
-- 9. 👁️ ESP
-- =========================================== --
local function createESP(plr)
    if not plr or not plr.Character then return end
    local char = plr.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local line = Instance.new("BillboardGui")
    line.Size = UDim2.new(0, 50, 0, 50)
    line.AlwaysOnTop = true
    line.Parent = hrp
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundTransparency = 0.5
    f.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    f.BorderColor3 = Color3.fromRGB(255, 255, 255)
    f.BorderSizePixel = 2
    f.Parent = line
    local name = Instance.new("TextLabel")
    name.Size = UDim2.new(1, 0, 0.3, 0)
    name.Position = UDim2.new(0, 0, -0.3, 0)
    name.BackgroundTransparency = 1
    name.Text = plr.Name
    name.TextColor3 = Color3.fromRGB(255, 255, 255)
    name.TextScaled = true
    name.Font = Enum.Font.GothamBold
    name.Parent = line
    table.insert(espObjects, line)
    return line
end

local function clearESP()
    for _, obj in pairs(espObjects) do pcall(function() obj:Destroy() end) end
    espObjects = {}
end

espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espBtn.Text = espEnabled and "👁️ ESP [ON]" or "👁️ ESP [OFF]"
    espBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(200, 50, 150) or Color3.fromRGB(50, 50, 80)
    if espEnabled then
        clearESP()
        spawn(function()
            while espEnabled do
                wait(0.5)
                clearESP()
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        createESP(v)
                    end
                end
            end
        end)
    else
        clearESP()
    end
end)

-- =========================================== --
-- 10. 🔒 Anti-Crash
-- =========================================== --
antiCrashBtn.MouseButton1Click:Connect(function()
    antiCrash = not antiCrash
    antiCrashBtn.Text = antiCrash and "🔒 Anti-Crash [ON]" or "🔒 Anti-Crash [OFF]"
    antiCrashBtn.BackgroundColor3 = antiCrash and Color3.fromRGB(200, 0, 50) or Color3.fromRGB(50, 50, 80)
    if antiCrash then
        spawn(function()
            while antiCrash do
                wait(5)
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name == "Bomb" then
                        if obj:FindFirstChild("Attachment") then
                            local attach = obj.Attachment
                            if attach:FindFirstChild("Trail") then
                                local trail = attach.Trail
                                if trail.Enabled == false then
                                    game:GetService("Debris"):AddItem(obj, 0.1)
                                end
                            end
                        end
                    end
                end
                for _, bomb in pairs(workspace:GetChildren()) do
                    if bomb:IsA("Part") and bomb.Name == "Bomb" then
                        if bomb:FindFirstChild("BodyVelocity") then
                            local vel = bomb.BodyVelocity
                            if vel.Velocity.Magnitude < 1 then
                                game:GetService("Debris"):AddItem(bomb, 0.5)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

-- =========================================== --
-- 11. 💥 Explosion
-- =========================================== --
explosionBtn.MouseButton1Click:Connect(function()
    explosionEnabled = not explosionEnabled
    explosionBtn.Text = explosionEnabled and "💥 Explosion [ON]" or "💥 Explosion [OFF]"
    explosionBtn.BackgroundColor3 = explosionEnabled and Color3.fromRGB(200, 80, 0) or Color3.fromRGB(50, 50, 80)
    if explosionEnabled then
        spawn(function()
            while explosionEnabled do
                wait(0.5)
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name == "Bomb" then
                        if obj:FindFirstChild("ExplosionEffect") == nil then
                            local exp = Instance.new("Explosion")
                            exp.BlastRadius = 15
                            exp.BlastPressure = 0
                            exp.Position = obj.Position
                            exp.Parent = workspace
                            local tag = Instance.new("BoolValue")
                            tag.Name = "ExplosionEffect"
                            tag.Parent = obj
                            for i = 1, 10 do
                                local part = Instance.new("Part")
                                part.Size = Vector3.new(1, 1, 1)
                                part.Shape = Enum.PartType.Ball
                                part.BrickColor = BrickColor.new("Bright orange")
                                part.Material = Enum.Material.Neon
                                part.CFrame = CFrame.new(obj.Position + Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5)))
                                part.Velocity = Vector3.new(math.random(-30, 30), math.random(10, 50), math.random(-30, 30))
                                part.Parent = workspace
                                game:GetService("Debris"):AddItem(part, 1.5)
                                local light = Instance.new("PointLight")
                                light.Range = 20
                                light.Brightness = 10
                                light.Color = Color3.new(1, 0.5, 0)
                                light.Parent = part
                            end
                            local shock = Instance.new("Part")
                            shock.Size = Vector3.new(20, 1, 20)
                            shock.Shape = Enum.PartType.Cylinder
                            shock.BrickColor = BrickColor.new("White")
                            shock.Material = Enum.Material.Neon
                            shock.Transparency = 0.8
                            shock.CFrame = CFrame.new(obj.Position)
                            shock.Parent = workspace
                            spawn(function()
                                for i = 1, 10 do
                                    wait(0.05)
                                    shock.Transparency = shock.Transparency + 0.08
                                    shock.Size = shock.Size + Vector3.new(2, 0, 2)
                                end
                                shock:Destroy()
                            end)
                            game:GetService("Debris"):AddItem(obj, 0.1)
                        end
                    end
                end
            end
        end)
    end
end)

-- =========================================== --
-- حفظ السرعة بعد الموت
-- =========================================== --
player.CharacterAdded:Connect(function(char)
    wait(1)
    local humanoid = char:FindFirstChild("Humanoid")
    if humanoid then
        originalSpeed = humanoid.WalkSpeed
        if speedBoost then
            humanoid.WalkSpeed = 50
        end
    end
end)

-- =========================================== --
-- إشعار التشغيل
-- =========================================== --
print("✅ TimeBomb V4.5 Loaded! | Script by 3nF")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "3nF TimeBomb",
    Text = "💣 TimeBomb V4.5 Loaded! | F5 to hide | Drag to move",
    Duration = 5
})
