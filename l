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
title.Text = "Panel RGB"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = frame
local farmBtn = Instance.new("TextButton")
farmBtn.Size = UDim2.new(0,160,0,45)
farmBtn.Position = UDim2.new(0.5,-80,0.5,-10)
farmBtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
farmBtn.Text = "Farm: OFF"
farmBtn.TextColor3 = Color3.fromRGB(255,80,80)
farmBtn.Font = Enum.Font.GothamBold
farmBtn.TextSize = 18
farmBtn.Parent = frame
local btnStroke = Instance.new("UIStroke")
btnStroke.Thickness = 2
btnStroke.Parent = farmBtn
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
local isFarming = false
farmBtn.MouseButton1Click:Connect(function()
isFarming = not isFarming
if isFarming then
farmBtn.Text = "Farm: ON"
farmBtn.TextColor3 = Color3.fromRGB(80,255,80)
task.spawn(function()
while isFarming do
local char = player.Character
if char and char:FindFirstChild("HumanoidRootPart") then
local hrp = char.HumanoidRootPart
hrp.CFrame = CFrame.new(1.511355996131897,24.351192474365234,102.18516540527344)
task.wait(0.5)
local infoTween = TweenInfo.new(0.5,Enum.EasingStyle.Linear)
local tween = TweenService:Create(hrp,infoTween,{CFrame = CFrame.new(1.511355996131897,24.351192474365234,508.1856689453125)})
tween:Play()
tween.Completed:Wait()
hrp.CFrame = CFrame.new(-16.488636016845703,6.857143402099609,506.7339782714844)
end
task.wait(2)
end
end)
else
farmBtn.Text = "Farm: OFF"
farmBtn.TextColor3 = Color3.fromRGB(255,80,80)
end
end)
