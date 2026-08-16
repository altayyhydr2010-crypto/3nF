-- =========================================== --
-- Script: TimeBomb Advanced V4.5
-- Developer: 3nF
-- Executor: Delta | Keyless
-- Telegram: xxx9ooo
-- =========================================== --

local player=game.Players.LocalPlayer
local gui=Instance.new("ScreenGui")
local frame=Instance.new("Frame")
local title=Instance.new("TextLabel")
local btns={}
local credit=Instance.new("TextLabel")
local telegram=Instance.new("TextLabel")

gui.Name="3nF_Hub"
gui.Parent=player.PlayerGui

frame.Size=UDim2.new(0,300,0,710)
frame.Position=UDim2.new(0.5,-150,0.5,-355)
frame.BackgroundColor3=Color3.fromRGB(10,10,25)
frame.BackgroundTransparency=0.15
frame.BorderSizePixel=2
frame.BorderColor3=Color3.fromRGB(255,170,0)
frame.Parent=gui

title.Size=UDim2.new(1,0,0,45)
title.BackgroundColor3=Color3.fromRGB(30,30,50)
title.BorderSizePixel=0
title.Text="💣 TimeBomb V4 | By 3nF"
title.TextColor3=Color3.fromRGB(255,200,50)
title.TextScaled=true
title.Font=Enum.Font.GothamBold
title.Parent=frame

local function createButton(text,yPos,color)
    local btn=Instance.new("TextButton")
    btn.Size=UDim2.new(0.85,0,0,29)
    btn.Position=UDim2.new(0.075,0,yPos,0)
    btn.BackgroundColor3=Color3.fromRGB(50,50,80)
    btn.BorderSizePixel=1
    btn.BorderColor3=color or Color3.fromRGB(255,170,0)
    btn.Text=text
    btn.TextColor3=Color3.fromRGB(255,255,255)
    btn.TextScaled=true
    btn.Font=Enum.Font.GothamBold
    btn.Parent=frame
    return btn
end

local autoPassBtn=createButton("⚡ Auto Pass [OFF]",0.10,Color3.fromRGB(255,170,0))
local speedBtn=createButton("🏃 Speed [OFF]",0.17,Color3.fromRGB(255,170,0))
local reachBtn=createButton("🖐️ Reach [OFF]",0.24,Color3.fromRGB(200,100,255))
local silentAimBtn=createButton("🔫 Silent Aim [OFF]",0.31,Color3.fromRGB(255,50,50))
local autoWinBtn=createButton("🔄 Auto Win [OFF]",0.38,Color3.fromRGB(50,200,50))
local aimbotBtn=createButton("🎯 Aimbot [OFF]",0.45,Color3.fromRGB(255,150,0))
local antiAFKBtn=createButton("🔔 Anti-AFK [OFF]",0.52,Color3.fromRGB(0,200,255))
local godModeBtn=createButton("🛡️ God Mode [OFF]",0.59,Color3.fromRGB(0,255,150))
local espBtn=createButton("👁️ ESP [OFF]",0.66,Color3.fromRGB(255,100,200))
local antiCrashBtn=createButton("🔒 Anti-Crash [OFF]",0.73,Color3.fromRGB(255,50,100))
local radarBtn=createButton("📡 Radar [OFF]",0.80,Color3.fromRGB(0,200,200))
local explosionBtn=createButton("💥 Explosion [OFF]",0.87,Color3.fromRGB(255,100,0))
local replayBtn=createButton("📸 Replay [OFF]",0.94,Color3.fromRGB(255,200,0))
local colorBtn=createButton("🌈 Custom Colors",1.01,Color3.fromRGB(255,100,200))

credit.Size=UDim2.new(1,0,0,16)
credit.Position=UDim2.new(0,0,1.08,0)
credit.BackgroundTransparency=1
credit.Text="⭐ Script by 3nF ⭐"
credit.TextColor3=Color3.fromRGB(255,170,0)
credit.TextScaled=true
credit.Font=Enum.Font.GothamBold
credit.Parent=frame

telegram.Size=UDim2.new(1,0,0,16)
telegram.Position=UDim2.new(0,0,1.14,0)
telegram.BackgroundTransparency=1
telegram.Text="📱 Telegram: xxx9ooo"
telegram.TextColor3=Color3.fromRGB(100,200,255)
telegram.TextScaled=true
telegram.Font=Enum.Font.Gotham
telegram.Parent=frame

-- المتغيرات
local autoPass=false
local speedBoost=false
local reachEnabled=false
local silentAim=false
local autoWin=false
local aimbot=false
local antiAFK=false
local godMode=false
local espEnabled=false
local antiCrash=false
local radarEnabled=false
local explosionEnabled=false
local replayEnabled=false
local originalSpeed=player.Character and player.Character.Humanoid.WalkSpeed or 16
local espObjects={}
local radarObjects={}
local colorIndex=1
local replayData={}

-- Auto Pass
autoPassBtn.MouseButton1Click:Connect(function()
    autoPass=not autoPass
    autoPassBtn.Text=autoPass and "⚡ Auto Pass [ON]" or "⚡ Auto Pass [OFF]"
    autoPassBtn.BackgroundColor3=autoPass and Color3.fromRGB(0,170,0) or Color3.fromRGB(50,50,80)
    if autoPass then
        spawn(function()
            while autoPass do
                wait(0.5)
                local bomb=workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    local nearest=nil
                    local minDist=10
                    for _,v in pairs(game.Players:GetPlayers()) do
                        if v~=player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local dist=(v.Character.HumanoidRootPart.Position-bomb.Position).Magnitude
                            if dist<minDist then
                                nearest=v
                                minDist=dist
                            end
                        end
                    end
                    if nearest then
                        bomb.CFrame=CFrame.new(nearest.Character.HumanoidRootPart.Position+Vector3.new(0,2,0))
                    end
                end
            end
        end)
    end
end)

-- Speed
speedBtn.MouseButton1Click:Connect(function()
    speedBoost=not speedBoost
    speedBtn.Text=speedBoost and "🏃 Speed [ON]" or "🏃 Speed [OFF]"
    speedBtn.BackgroundColor3=speedBoost and Color3.fromRGB(0,170,0) or Color3.fromRGB(50,50,80)
    local humanoid=player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed=speedBoost and 50 or originalSpeed
    end
end)

-- Reach
reachBtn.MouseButton1Click:Connect(function()
    reachEnabled=not reachEnabled
    reachBtn.Text=reachEnabled and "🖐️ Reach [ON]" or "🖐️ Reach [OFF]"
    reachBtn.BackgroundColor3=reachEnabled and Color3.fromRGB(150,50,200) or Color3.fromRGB(50,50,80)
    if reachEnabled then
        spawn(function()
            while reachEnabled do
                wait(0.1)
                local char=player.Character
                if not char then continue end
                local hrp=char:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end
                local bomb=workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    local dist=(bomb.Position-hrp.Position).Magnitude
                    if dist>5 and dist<50 then
                        bomb.CFrame=CFrame.new(hrp.Position+hrp.CFrame.LookVector*3)
                    end
                end
            end
        end)
    end
end)

-- Silent Aim
silentAimBtn.MouseButton1Click:Connect(function()
    silentAim=not silentAim
    silentAimBtn.Text=silentAim and "🔫 Silent Aim [ON]" or "🔫 Silent Aim [OFF]"
    silentAimBtn.BackgroundColor3=silentAim and Color3.fromRGB(200,0,0) or Color3.fromRGB(50,50,80)
    if silentAim then
        spawn(function()
            while silentAim do
                wait(0.1)
                local bomb=workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    local nearest=nil
                    local minDist=50
                    for _,v in pairs(game.Players:GetPlayers()) do
                        if v~=player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local dist=(v.Character.HumanoidRootPart.Position-bomb.Position).Magnitude
                            if dist<minDist then
                                nearest=v
                                minDist=dist
                            end
                        end
                    end
                    if nearest then
                        bomb.Velocity=(nearest.Character.HumanoidRootPart.Position-bomb.Position).Unit*50
                    end
                end
            end
        end)
    end
end)

-- Auto Win
autoWinBtn.MouseButton1Click:Connect(function()
    autoWin=not autoWin
    autoWinBtn.Text=autoWin and "🔄 Auto Win [ON]" or "🔄 Auto Win [OFF]"
    autoWinBtn.BackgroundColor3=autoWin and Color3.fromRGB(0,150,0) or Color3.fromRGB(50,50,80)
    if autoWin then
        spawn(function()
            while autoWin do
                wait(1)
                local bomb=workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    for _,v in pairs(game.Players:GetPlayers()) do
                        if v~=player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local clone=bomb:Clone()
                            clone.Parent=workspace
                            clone.CFrame=CFrame.new(v.Character.HumanoidRootPart.Position+Vector3.new(0,5,0))
                            clone.Velocity=Vector3.new(0,-30,0)
                            game:GetService("Debris"):AddItem(clone,2)
                        end
                    end
                end
            end
        end)
    end
end)

-- Aimbot
aimbotBtn.MouseButton1Click:Connect(function()
    aimbot=not aimbot
    aimbotBtn.Text=aimbot and "🎯 Aimbot [ON]" or "🎯 Aimbot [OFF]"
    aimbotBtn.BackgroundColor3=aimbot and Color3.fromRGB(200,100,0) or Color3.fromRGB(50,50,80)
    if aimbot then
        spawn(function()
            while aimbot do
                wait(0.05)
                local bomb=workspace:FindFirstChild("Bomb")
                if bomb and bomb:IsA("Part") then
                    local nearest=nil
                    local minDist=50
                    for _,v in pairs(game.Players:GetPlayers()) do
                        if v~=player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local dist=(v.Character.HumanoidRootPart.Position-bomb.Position).Magnitude
                            if dist<minDist then
                                nearest=v
                                minDist=dist
                            end
                        end
                    end
                    if nearest then
                        local targetPos=nearest.Character.HumanoidRootPart.Position+Vector3.new(0,2,0)
                        bomb.CFrame=CFrame.new(bomb.Position,targetPos)
                        bomb.Velocity=(targetPos-bomb.Position).Unit*60
                    end
                end
            end
        end)
    end
end)

-- Anti-AFK
antiAFKBtn.MouseButton1Click:Connect(function()
    antiAFK=not antiAFK
    antiAFKBtn.Text=antiAFK and "🔔 Anti-AFK [ON]" or "🔔 Anti-AFK [OFF]"
    antiAFKBtn.BackgroundColor3=antiAFK and Color3.fromRGB(0,150,200) or Color3.fromRGB(50,50,80)
    if antiAFK then
        spawn(function()
            while antiAFK do
                wait(60)
                local char=player.Character
                if char and char:FindFirstChild("Humanoid") then
                    local humanoid=char.Humanoid
                    humanoid:Move(Vector3.new(math.random(-1,1),0,math.random(-1,1)),true)
                    wait(0.1)
                    humanoid:Move(Vector3.new(0,0,0),true)
                end
            end
        end)
    end
end)

-- God Mode
godModeBtn.MouseButton1Click:Connect(function()
    godMode=not godMode
    godModeBtn.Text=godMode and "🛡️ God Mode [ON]" or "🛡️ God Mode [OFF]"
    godModeBtn.BackgroundColor3=godMode and Color3.fromRGB(0,200,100) or Color3.fromRGB(50,50,80)
    if godMode then
        spawn(function()
            while godMode do
                wait(0.1)
                local char=player.Character
                if char then
                    local humanoid=char:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.MaxHealth=math.huge
                        humanoid.Health=humanoid.MaxHealth
                        humanoid.BreakJointsOnDeath=false
                    end
                end
            end
        end)
    else
        local char=player.Character
        if char then
            local humanoid=char:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.MaxHealth=100
                humanoid.Health=100
                humanoid.BreakJointsOnDeath=true
            end
        end
    end
end)

-- ESP
local function createESP(plr)
    if not plr or not plr.Character then return end
    local char=plr.Character
    local hrp=char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local line=Instance.new("BillboardGui")
    line.Size=UDim2.new(0,50,0,50)
    line.AlwaysOnTop=true
    line.Parent=hrp
    local f=Instance.new("Frame")
    f.Size=UDim2.new(1,0,1,0)
    f.BackgroundTransparency=0.5
    f.BackgroundColor3=Color3.fromRGB(255,0,0)
    f.BorderColor3=Color3.fromRGB(255,255,255)
    f.BorderSizePixel=2
    f.Parent=line
    local name=Instance.new("TextLabel")
    name.Size=UDim2.new(1,0,0.3,0)
    name.Position=UDim2.new(0,0,-0.3,0)
    name.BackgroundTransparency=1
    name.Text=plr.Name
    name.TextColor3=Color3.fromRGB(255,255,255)
    name.TextScaled=true
    name.Font=Enum.Font.GothamBold
    name.Parent=line
    table.insert(espObjects,line)
    return line
end

local function clearESP()
    for _,obj in pairs(espObjects) do pcall(function() obj:Destroy() end) end
    espObjects={}
end

espBtn.MouseButton1Click:Connect(function()
    espEnabled=not espEnabled
    espBtn.Text=espEnabled and "👁️ ESP [ON]" or "👁️ ESP [OFF]"
    espBtn.BackgroundColor3=espEnabled and Color3.fromRGB(200,50,150) or Color3.fromRGB(50,50,80)
    if espEnabled then
        clearESP()
        spawn(function()
            while espEnabled do
                wait(0.5)
                clearESP()
                for _,v in pairs(game.Players:GetPlayers()) do
                    if v~=player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        createESP(v)
                    end
                end
            end
        end)
    else
        clearESP()
    end
end)

-- Anti-Crash
antiCrashBtn.MouseButton1Click:Connect(function()
    antiCrash=not antiCrash
    antiCrashBtn.Text=antiCrash and "🔒 Anti-Crash [ON]" or "🔒 Anti-Crash [OFF]"
    antiCrashBtn.BackgroundColor3=antiCrash and Color3.fromRGB(200,0,50) or Color3.fromRGB(50,50,80)
    if antiCrash then
        spawn(function()
            while antiCrash do
                wait(5)
                local garbage=0
                for _,obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name=="Bomb" then
                        if obj:FindFirstChild("Attachment") then
                            local attach=obj.Attachment
                            if attach:FindFirstChild("Trail") then
                                local trail=attach.Trail
                                if trail.Enabled==false then
                                    game:GetService("Debris"):AddItem(obj,0.1)
                                    garbage=garbage+1
                                end
                            end
                        end
                    end
                end
                for _,bomb in pairs(workspace:GetChildren()) do
                    if bomb:IsA("Part") and bomb.Name=="Bomb" then
                        if bomb:FindFirstChild("BodyVelocity") then
                            local vel=bomb.BodyVelocity
                            if vel.Velocity.Magnitude<1 then
                                game:GetService("Debris"):AddItem(bomb,0.5)
                                garbage=garbage+1
                            end
                        end
                    end
                end
                if garbage>5 then print("🧹 Anti-Crash cleaned "..garbage.." objects") end
            end
        end)
    end
end)

-- Radar
local function createRadar()
    local rGui=Instance.new("ScreenGui")
    rGui.Name="3nF_Radar"
    rGui.Parent=player.PlayerGui
    local rFrame=Instance.new("Frame")
    rFrame.Size=UDim2.new(0,200,0,200)
    rFrame.Position=UDim2.new(0.8,-100,0.1,0)
    rFrame.BackgroundColor3=Color3.fromRGB(0,0,0)
    rFrame.BackgroundTransparency=0.3
    rFrame.BorderSizePixel=2
    rFrame.BorderColor3=Color3.fromRGB(0,200,200)
    rFrame.Parent=rGui
    local circle=Instance.new("Frame")
    circle.Size=UDim2.new(0.9,0,0.9,0)
    circle.Position=UDim2.new(0.05,0,0.05,0)
    circle.BackgroundColor3=Color3.fromRGB(0,50,50)
    circle.BackgroundTransparency=0.5
    circle.BorderSizePixel=1
    circle.BorderColor3=Color3.fromRGB(0,200,200)
    circle.Parent=rFrame
    local center=Instance.new("Frame")
    center.Size=UDim2.new(0.05,0,0.05,0)
    center.Position=UDim2.new(0.475,0,0.475,0)
    center.BackgroundColor3=Color3.fromRGB(0,255,0)
    center.BorderSizePixel=0
    center.Parent=circle
    local titleR=Instance.new("TextLabel")
    titleR.Size=UDim2.new(1,0,0,20)
    titleR.Position=UDim2.new(0,0,-0.15,0)
    titleR.BackgroundTransparency=1
    titleR.Text="📡 RADAR"
    titleR.TextColor3=Color3.fromRGB(0,200,200)
    titleR.TextScaled=true
    titleR.Font=Enum.Font.GothamBold
    titleR.Parent=rFrame
    table.insert(radarObjects,rGui)
    table.insert(radarObjects,rFrame)
    table.insert(radarObjects,circle)
    table.insert(radarObjects,center)
    table.insert(radarObjects,titleR)
    return rGui,circle
end

local function updateRadar(circle)
    if not circle then return end
    for _,child in pairs(circle:GetChildren()) do
        if child.Name=="RadarDot" then child:Destroy() end
    end
    local centerPos=player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position or Vector3.new(0,0,0)
    for _,v in pairs(game.Players:GetPlayers()) do
        if v~=player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos=v.Character.HumanoidRootPart.Position
            local relPos=targetPos-centerPos
            local scale=0.4
            local x=relPos.X*scale/20
            local z=relPos.Z*scale/20
            local dist=math.sqrt(x^2+z^2)
            if dist<0.45 then
                local dot=Instance.new("Frame")
                dot.Name="RadarDot"
                dot.Size=UDim2.new(0.04,0,0.04,0)
                dot.Position=UDim2.new(0.5+x,0,0.5+z,0)
                dot.BackgroundColor3=Color3.fromRGB(255,0,0)
                dot.BorderSizePixel=0
                dot.Parent=circle
                table.insert(radarObjects,dot)
            end
        end
    end
end

local radarGui=nil
local radarCircle=nil

radarBtn.MouseButton1Click:Connect(function()
    radarEnabled=not radarEnabled
    radarBtn.Text=radarEnabled and "📡 Radar [ON]" or "📡 Radar [OFF]"
    radarBtn.BackgroundColor3=radarEnabled and Color3.fromRGB(0,150,150) or Color3.fromRGB(50,50,80)
    if radarEnabled then
        radarGui,radarCircle=createRadar()
        spawn(function()
            while radarEnabled do
                wait(0.1)
                if radarCircle then updateRadar(radarCircle) end
            end
        end)
    else
        for _,obj in pairs(radarObjects) do pcall(function() obj:Destroy() end) end
        radarObjects={}
        radarGui=nil
        radarCircle=nil
    end
end)

-- Explosion
explosionBtn.MouseButton1Click:Connect(function()
    explosionEnabled=not explosionEnabled
    explosionBtn.Text=explosionEnabled and "💥 Explosion [ON]" or "💥 Explosion [OFF]"
    explosionBtn.BackgroundColor3=explosionEnabled and Color3.fromRGB(200,80,0) or Color3.fromRGB(50,50,80)
    if explosionEnabled then
        spawn(function()
            while explosionEnabled do
                wait(0.5)
                for _,obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name=="Bomb" then
                        if obj:FindFirstChild("ExplosionEffect")==nil then
                            local exp=Instance.new("Explosion")
                            exp.BlastRadius=15
                            exp.BlastPressure=0
                            exp.Position=obj.Position
                            exp.Parent=workspace
                            local tag=Instance.new("BoolValue")
                            tag.Name="ExplosionEffect"
                            tag.Parent=obj
                            for i=1,10 do
                                local part=Instance.new("Part")
                                part.Size=Vector3.new(1,1,1)
                                part.Shape=Enum.PartType.Ball
                                part.BrickColor=BrickColor.new("Bright orange")
                                part.Material=Enum.Material.Neon
                                part.CFrame=CFrame.new(obj.Position+Vector3.new(math.random(-5,5),math.random(-5,5),math.random(-5,5)))
                                part.Velocity=Vector3.new(math.random(-30,30),math.random(10,50),math.random(-30,30))
                                part.Parent=workspace
                                game:GetService("Debris"):AddItem(part,1.5)
                                local light=Instance.new("PointLight")
                                light.Range=20
                                light.Brightness=10
                                light.Color=Color3.new(1,0.5,0)
                                light.Parent=part
                            end
                            local shock=Instance.new("Part")
                            shock.Size=Vector3.new(20,1,20)
                            shock.Shape=Enum.PartType.Cylinder
                            shock.BrickColor=BrickColor.new("White")
                            shock.Material=Enum.Material.Neon
                            shock.Transparency=0.8
                            shock.CFrame=CFrame.new(obj.Position)
                            shock.Parent=workspace
                            spawn(function()
                                for i=1,10 do
                                    wait(0.05)
                                    shock.Transparency=shock.Transparency+0.08
                                    shock.Size=shock.Size+Vector3.new(2,0,2)
                                end
                                shock:Destroy()
                            end)
                            game:GetService("Debris"):AddItem(obj,0.1)
                        end
                    end
                end
            end
        end)
    end
end)

-- Replay
local function saveReplayData()
    if not replayEnabled then return end
    local char=player.Character
    if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart")
    local humanoid=char:FindFirstChild("Humanoid")
    if not hrp or not humanoid then return end
    local data={position=hrp.Position,cframe=hrp.CFrame,health=humanoid.Health,walkSpeed=humanoid.WalkSpeed,jumpPower=humanoid.JumpPower,time=tick(),bombs={}}
    for _,obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Part") and obj.Name=="Bomb" then
            table.insert(data.bombs,{position=obj.Position,cframe=obj.CFrame,velocity=obj.Velocity})
        end
    end
    table.insert(replayData,data)
    local currentTime=tick()
    while #replayData>0 and currentTime-replayData[1].time>5 do table.remove(replayData,1) end
end

local function loadReplay()
    if #replayData==0 then
        game:GetService("StarterGui"):SetCore("SendNotification",{Title="3nF Hub",Text="❌ No replay data!",Duration=2})
        return
    end
    local data=replayData[#replayData]
    local char=player.Character
    if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart")
    local humanoid=char:FindFirstChild("Humanoid")
    if not hrp or not humanoid then return end
    hrp.CFrame=data.cframe
    humanoid.Health=data.health
    humanoid.WalkSpeed=data.walkSpeed
    humanoid.JumpPower=data.jumpPower
    for _,bombData in pairs(data.bombs) do
        local bomb=Instance.new("Part")
        bomb.Name="Bomb"
        bomb.Size=Vector3.new(2,2,2)
        bomb.Shape=Enum.PartType.Ball
        bomb.BrickColor=BrickColor.new("Bright red")
        bomb.Material=Enum.Material.Neon
        bomb.CFrame=bombData.cframe
        bomb.Velocity=bombData.velocity
        bomb.Parent=workspace
        local effect=Instance.new("Explosion")
        effect.BlastRadius=5
        effect.BlastPressure=0
        effect.Position=bombData.position
        effect.Parent=workspace
        game:GetService("Debris"):AddItem(bomb,5)
    end
    game:GetService("StarterGui"):SetCore("SendNotification",{Title="3nF Hub",Text="📸 Replay loaded!",Duration=2})
end

replayBtn.MouseButton1Click:Connect(function()
    replayEnabled=not replayEnabled
    replayBtn.Text=replayEnabled and "📸 Replay [ON]" or "📸 Replay [OFF]"
    replayBtn.BackgroundColor3=replayEnabled and Color3.fromRGB(200,150,0) or Color3.fromRGB(50,50,80)
    if replayEnabled then
        replayData={}
        spawn(function() while replayEnabled do wait(0.1) saveReplayData() end end)
        spawn(function()
            while replayEnabled do
                wait(0.5)
                local char=player.Character
                if char then
                    local humanoid=char:FindFirstChild("Humanoid")
                    if humanoid and humanoid.Health<=0 then wait(0.5) loadReplay() end
                end
            end
        end)
        game:GetService("StarterGui"):SetCore("SendNotification",{Title="3nF Hub",Text="📸 Replay activated!",Duration=3})
    else
        replayData={}
        game:GetService("StarterGui"):SetCore("SendNotification",{Title="3nF Hub",Text="📸 Replay deactivated",Duration=2})
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode==Enum.KeyCode.R and replayEnabled then loadReplay() end
end)

-- Custom Colors
local colorSchemes={
    {frame=Color3.fromRGB(10,10,25),border=Color3.fromRGB(255,170,0),title=Color3.fromRGB(30,30,50),text=Color3.fromRGB(255,200,50),credit=Color3.fromRGB(255,170,0),telegram=Color3.fromRGB(100,200,255)},
    {frame=Color3.fromRGB(25,5,5),border=Color3.fromRGB(255,0,0),title=Color3.fromRGB(50,10,10),text=Color3.fromRGB(255,100,100),credit=Color3.fromRGB(255,50,50),telegram=Color3.fromRGB(255,100,100)},
    {frame=Color3.fromRGB(5,25,5),border=Color3.fromRGB(0,255,0),title=Color3.fromRGB(10,50,10),text=Color3.fromRGB(100,255,100),credit=Color3.fromRGB(50,255,50),telegram=Color3.fromRGB(100,255,100)},
    {frame=Color3.fromRGB(5,5,25),border=Color3.fromRGB(0,100,255),title=Color3.fromRGB(10,10,50),text=Color3.fromRGB(100,200,255),credit=Color3.fromRGB(50,150,255),telegram=Color3.fromRGB(100,200,255)},
    {frame=Color3.fromRGB(25,5,25),border=Color3.fromRGB(255,0,255),title=Color3.fromRGB(50,10,50),text=Color3.fromRGB(255,100,255),credit=Color3.fromRGB(255,50,255),telegram=Color3.fromRGB(255,100,255)}
}

local function applyColors(scheme)
    frame.BackgroundColor3=scheme.frame
    frame.BorderColor3=scheme.border
    title.BackgroundColor3=scheme.title
    title.TextColor3=scheme.text
    credit.TextColor3=scheme.credit
    telegram.TextColor3=scheme.telegram
    for _,btn in pairs(frame:GetChildren()) do
        if btn:IsA("TextButton") and btn~=colorBtn then btn.BorderColor3=scheme.border end
    end
end

colorBtn.MouseButton1Click:Connect(function()
    colorIndex=colorIndex%#colorSchemes+1
    applyColors(colorSchemes[colorIndex])
    game:GetService("StarterGui"):SetCore("SendNotification",{Title="3nF Hub",Text="🌈 Color changed!",Duration=2})
end)

player.CharacterAdded:Connect(function(char)
    wait(1)
    local humanoid=char:FindFirstChild("Humanoid")
    if humanoid then
        originalSpeed=humanoid.WalkSpeed
        if speedBoost then humanoid.WalkSpeed=50 end
    end
end)

print("✅ TimeBomb V4.5 Loaded! | Script by 3nF")
game:GetService("StarterGui"):SetCore("SendNotification",{Title="3nF Hub",Text="TimeBomb V4.5 Loaded! | Telegram: xxx9ooo",Duration=5})
