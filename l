local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MEnu"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,220,0,120)
frame.Position = UDim2.new(0.5,-110,0.5,-60)
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
local moveBtn = Instance.new("TextButton")
moveBtn.Size = UDim2.new(0,160,0,45)
moveBtn.Position = UDim2.new(0.5,-80,0.5,-10)
moveBtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
moveBtn.Text = "Boton 1: OFF"
moveBtn.TextColor3 = Color3.fromRGB(255,80,80)
moveBtn.Font = Enum.Font.GothamBold
moveBtn.TextSize = 18
moveBtn.Parent = frame
local btnStroke = Instance.new("UIStroke")
btnStroke.Thickness = 2
btnStroke.Parent = moveBtn
RunService.RenderStepped:Connect(function()
local hue = tick()%5/5
local rgbColor = Color3.fromHSV(hue,1,1)
frameStroke.Color = rgbColor
btnStroke.Color = rgbColor
end)
local dragging, dragInput, dragStart, startPos
frame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = frame.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)
frame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)
UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end)
local isRunning = false
moveBtn.MouseButton1Click:Connect(function()
isRunning = not isRunning
if isRunning then
moveBtn.Text = "Stage 1: ON"
moveBtn.TextColor3 = Color3.fromRGB(80,255,80)
task.spawn(function()
while isRunning do
local char = player.Character
if char and char:FindFirstChild("HumanoidRootPart") then
local hrp = char.HumanoidRootPart
local tween1 = TweenService:Create(hrp,TweenInfo.new(1,Enum.EasingStyle.Linear),{CFrame = CFrame.new(5.066667556762695,10.603286743164062,3.919901132583618)})
tween1:Play()
tween1.Completed:Wait()
if not isRunning then break end
local tween2 = TweenService:Create(hrp,TweenInfo.new(1.5,Enum.EasingStyle.Linear),{CFrame = CFrame.new(-16.488636016845703,6.857143402099609,284.7413024902344)})
tween2:Play()
tween2.Completed:Wait()
end
task.wait(0.1)
end
end)
else
moveBtn.Text = "Stage 1: OFF"
moveBtn.TextColor3 = Color3.fromRGB(255,80,80)
end
end)
