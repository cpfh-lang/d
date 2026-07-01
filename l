local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PanelRGB"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,220,0,230)
frame.Position = UDim2.new(0.5,-110,0.5,-115)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = screenGui
local frameStroke = Instance.new("UIStroke")
frameStroke.Thickness = 3
frameStroke.Parent = frame
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "Panel Movimiento"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = frame

local function crearBoton(nombre, posY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,160,0,45)
    btn.Position = UDim2.new(0.5,-80,0,posY)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.Text = nombre .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(255,80,80)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Parent = frame
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Parent = btn
    return btn
end

local btn1 = crearBoton("Stage 1", 40)
local btn2 = crearBoton("Stage 2", 100)
local btn3 = crearBoton("Stage 3", 160)

local run1, run2, run3 = false, false, false

local function mover(hrp, cf, tiempo)
    local tween = TweenService:Create(hrp, TweenInfo.new(tiempo, Enum.EasingStyle.Linear), {CFrame = CFrame.new(cf)})
    tween:Play()
    tween.Completed:Wait()
end

local function toggleStage(stageNum)
    -- Apaga todos los otros
    if stageNum ~= 1 then run1 = false; btn1.Text = "Stage 1: OFF"; btn1.TextColor3 = Color3.fromRGB(255,80,80) end
    if stageNum ~= 2 then run2 = false; btn2.Text = "Stage 2: OFF"; btn2.TextColor3 = Color3.fromRGB(255,80,80) end
    if stageNum ~= 3 then run3 = false; btn3.Text = "Stage 3: OFF"; btn3.TextColor3 = Color3.fromRGB(255,80,80) end
end

btn1.MouseButton1Click:Connect(function()
    run1 = not run1
    toggleStage(run1 and 1 or 0)
    btn1.Text = run1 and "Stage 1: ON" or "Stage 1: OFF"
    btn1.TextColor3 = run1 and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,80,80)
    if run1 then
        task.spawn(function()
            while run1 do
                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    mover(hrp, Vector3.new(5.066667556762695,10.603286743164062,3.919901132583618), 0.3)
                    if not run1 then break end
                    mover(hrp, Vector3.new(-16.488636016845703,6.857143402099609,284.7413024902344), 2)
                    task.wait(0.5)
                end
                task.wait(0.1)
            end
        end)
    end
end)

btn2.MouseButton1Click:Connect(function()
    run2 = not run2
    toggleStage(run2 and 2 or 0)
    btn2.Text = run2 and "Stage 2: ON" or "Stage 2: OFF"
    btn2.TextColor3 = run2 and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,80,80)
    if run2 then
        task.spawn(function()
            while run2 do
                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    mover(hrp, Vector3.new(-2.5895214080810547,7.700801849365234,298.72705078125), 1.5)
                    if not run2 then break end
                    mover(hrp, Vector3.new(-21.688749313354492,7.700801849365234,298.72705078125), 0.1)
                    if not run2 then break end
                    mover(hrp, Vector3.new(-16.488636016845703,7.857143402099609,506.7339782714844), 1)
                    task.wait(0.8)
                end
                task.wait(0.1)
            end
        end)
    end
end)

btn3.MouseButton1Click:Connect(function()
    run3 = not run3
    toggleStage(run3 and 3 or 0)
    btn3.Text = run3 and "Stage 3: ON" or "Stage 3: OFF"
    btn3.TextColor3 = run3 and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,80,80)
    if run3 then
        task.spawn(function()
            while run3 do
                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    mover(hrp, Vector3.new(21.965776443481445,6.700801849365234,6.971138954162598), 1) -- Ajustado a 1s
                    if not run3 then break end
                    mover(hrp, Vector3.new(20.78496742248535,6.700801849365234,560.4197998046875), 3)
                    if not run3 then break end
                    mover(hrp, Vector3.new(19.084335327148438,73.54920959472656,746.2933349609375), 1)
                    if not run3 then break end
                    mover(hrp, Vector3.new(-16.488636016845703,75.14604187011719,774.3751220703125), 1) -- Ajustado a 1s
                    task.wait(0.5)
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- (El resto de la lógica de arrastre y colores se mantiene igual)
