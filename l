local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Eliminar obstáculos al iniciar
task.spawn(function()
local npcPiege = game:GetService("Workspace"):FindFirstChild("NPC & Piege")
if npcPiege then
if npcPiege:FindFirstChild("LavaTower") then npcPiege.LavaTower:Destroy() end
if npcPiege:FindFirstChild("CorridorTrap") then npcPiege.CorridorTrap:Destroy() end
if npcPiege:FindFirstChild("NPC_Zone10") and npcPiege.NPC_Zone10:FindFirstChild("NPC10_AttackZone") then npcPiege.NPC_Zone10.NPC10_AttackZone:Destroy() end
end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PanelRGB"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,220,0,285)
frame.Position = UDim2.new(0.5,-110,0.5,-142)
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
local dragging, dragInput, dragStart, startPos
frame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = frame.Position
end
end)
UserInputService.InputChanged:Connect(function(input)
if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
local delta = input.Position - dragStart
frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end)
frame.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = false
end
end)
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
local btn2 = crearBoton("Stage 2", 95)
local btn3 = crearBoton("Stage 3", 150)
local btn4 = crearBoton("Stage 1K", 205)
local run1, run2, run3, run4 = false, false, false, false
local function mover(hrp, cf, tiempo)
local tween = TweenService:Create(hrp, TweenInfo.new(tiempo, Enum.EasingStyle.Linear), {CFrame = CFrame.new(cf)})
tween:Play()
tween.Completed:Wait()
end
local function apagarTodo()
run1 = false; run2 = false; run3 = false; run4 = false
btn1.Text = "Stage 1: OFF"; btn1.TextColor3 = Color3.fromRGB(255,80,80)
btn2.Text = "Stage 2: OFF"; btn2.TextColor3 = Color3.fromRGB(255,80,80)
btn3.Text = "Stage 3: OFF"; btn3.TextColor3 = Color3.fromRGB(255,80,80)
btn4.Text = "Stage 1K: OFF"; btn4.TextColor3 = Color3.fromRGB(255,80,80)
end
btn1.MouseButton1Click:Connect(function()
local activar = not run1
apagarTodo()
run1 = activar
if run1 then
btn1.Text = "Stage 1: ON"; btn1.TextColor3 = Color3.fromRGB(80,255,80)
task.spawn(function()
while run1 do
local char = player.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
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
local activar = not run2
apagarTodo()
run2 = activar
if run2 then
btn2.Text = "Stage 2: ON"; btn2.TextColor3 = Color3.fromRGB(80,255,80)
task.spawn(function()
while run2 do
local char = player.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
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
local activar = not run3
apagarTodo()
run3 = activar
if run3 then
btn3.Text = "Stage 3: ON"; btn3.TextColor3 = Color3.fromRGB(80,255,80)
task.spawn(function()
while run3 do
local char = player.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
if hrp then
mover(hrp, Vector3.new(21.965776443481445,6.700801849365234,6.971138954162598), 1)
if not run3 then break end
mover(hrp, Vector3.new(20.78496742248535,6.700801849365234,560.4197998046875), 3)
if not run3 then break end
mover(hrp, Vector3.new(19.084335327148438,73.54920959472656,746.2933349609375), 1)
if not run3 then break end
mover(hrp, Vector3.new(-16.488636016845703,75.14604187011719,774.3751220703125), 1)
task.wait(0.5)
end
task.wait(0.1)
end
end)
end
end)
btn4.MouseButton1Click:Connect(function()
local activar = not run4
apagarTodo()
run4 = activar
if run4 then
btn4.Text = "Stage 1K: ON"; btn4.TextColor3 = Color3.fromRGB(80,255,80)
task.spawn(function()
while run4 do
local char = player.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
if hrp then
mover(hrp, Vector3.new(21.965776443481445, 6.700801849365234, 6.971138954162598), 2)
if not run4 then break end
mover(hrp, Vector3.new(20.78496742248535, 6.700801849365234, 560.4197998046875), 3.5)
if not run4 then break end
mover(hrp, Vector3.new(19.084335327148438, 73.54920959472656, 746.2933349609375), 2)
if not run4 then break end
mover(hrp, Vector3.new(11.052309036254883, 74.95215606689453, 1422.516845703125), 4)
if not run4 then break end
mover(hrp, Vector3.new(-527.2881469726562, 52.30767822265625, 1489.567626953125), 3.5)
if not run4 then break end
mover(hrp, Vector3.new(-569.5850219726562, 52.30767822265625, 1467.7484130859375), 2)
if not run4 then break end
mover(hrp, Vector3.new(-1038.64501953125, 52.30767822265625, 1465.02001953125), 2)
if not run4 then break end
mover(hrp, Vector3.new(-1092.6707763671875, 294.3077087402344, 1467.7484130859375), 2)
if not run4 then break end
mover(hrp, Vector3.new(-3938.4208984375, 294.501708984375, 1447.8897705078125), 6)
task.wait(0.5)
end
task.wait(0.1)
end
end)
end
end)
RunService.RenderStepped:Connect(function()
local hue = tick()%5/5
frameStroke.Color = Color3.fromHSV(hue,1,1)
end)
