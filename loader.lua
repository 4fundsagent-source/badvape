-- badvape loader

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Config
local DISCORD_INVITE = "https://discord.gg/VN7cAbFaMW"

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BadvapeLoader"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "Main"
mainFrame.Size = UDim2.new(0, 450, 0, 320)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Gradient accent bar at top
local accentBar = Instance.new("Frame")
accentBar.Name = "AccentBar"
accentBar.Size = UDim2.new(1, 0, 0, 4)
accentBar.Position = UDim2.new(0, 0, 0, 0)
accentBar.BorderSizePixel = 0
accentBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
accentBar.Parent = mainFrame

local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(0, 12)
accentCorner.Parent = accentBar

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 85, 85)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 120, 85)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 150))
})
gradient.Parent = accentBar

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "Close"
closeButton.Size = UDim2.new(0, 36, 0, 36)
closeButton.Position = UDim2.new(1, -12, 0, 12)
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
closeButton.BackgroundTransparency = 0.9
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(180, 180, 180)
closeButton.TextSize = 18
closeButton.Font = Enum.Font.GothamBold
closeButton.AutoButtonColor = false
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

-- Warning icon area
local iconFrame = Instance.new("Frame")
iconFrame.Name = "IconFrame"
iconFrame.Size = UDim2.new(0, 70, 0, 70)
iconFrame.Position = UDim2.new(0.5, 0, 0, 40)
iconFrame.AnchorPoint = Vector2.new(0.5, 0)
iconFrame.BackgroundColor3 = Color3.fromRGB(255, 90, 90)
iconFrame.BackgroundTransparency = 0.85
iconFrame.BorderSizePixel = 0
iconFrame.Parent = mainFrame

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = iconFrame

local warningIcon = Instance.new("TextLabel")
warningIcon.Name = "Icon"
warningIcon.Size = UDim2.new(1, 0, 1, 0)
warningIcon.BackgroundTransparency = 1
warningIcon.Text = "!"
warningIcon.TextColor3 = Color3.fromRGB(255, 100, 100)
warningIcon.TextSize = 42
warningIcon.Font = Enum.Font.GothamBold
warningIcon.Parent = iconFrame

-- Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 35)
title.Position = UDim2.new(0, 0, 0, 120)
title.BackgroundTransparency = 1
title.Text = "Script Outdated"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 28
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Message
local message = Instance.new("TextLabel")
message.Name = "Message"
message.Size = UDim2.new(1, -60, 0, 50)
message.Position = UDim2.new(0, 30, 0, 158)
message.BackgroundTransparency = 1
message.Text = "This loadstring is outdated. Get the newest script below.\nIt's completely free and keyless!"
message.TextColor3 = Color3.fromRGB(160, 165, 180)
message.TextSize = 16
message.Font = Enum.Font.Gotham
message.TextWrapped = true
message.TextYAlignment = Enum.TextYAlignment.Top
message.Parent = mainFrame

-- Copy Button
local copyButton = Instance.new("TextButton")
copyButton.Name = "CopyButton"
copyButton.Size = UDim2.new(0, 280, 0, 48)
copyButton.Position = UDim2.new(0.5, 0, 0, 220)
copyButton.AnchorPoint = Vector2.new(0.5, 0)
copyButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
copyButton.BackgroundTransparency = 0.3
copyButton.BorderSizePixel = 0
copyButton.Text = "Copy Discord Invite"
copyButton.TextColor3 = Color3.fromRGB(220, 220, 230)
copyButton.TextSize = 17
copyButton.Font = Enum.Font.GothamBold
copyButton.AutoButtonColor = false
copyButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = copyButton

-- Link text below button
local linkText = Instance.new("TextLabel")
linkText.Name = "LinkText"
linkText.Size = UDim2.new(1, 0, 0, 25)
linkText.Position = UDim2.new(0, 0, 0, 278)
linkText.BackgroundTransparency = 1
linkText.Text = DISCORD_INVITE
linkText.TextColor3 = Color3.fromRGB(100, 110, 150)
linkText.TextSize = 14
linkText.Font = Enum.Font.GothamMedium
linkText.Parent = mainFrame

-- Close button hover & click
closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.15), {
        BackgroundTransparency = 0.7,
        TextColor3 = Color3.fromRGB(255, 100, 100)
    }):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.15), {
        BackgroundTransparency = 0.9,
        TextColor3 = Color3.fromRGB(180, 180, 180)
    }):Play()
end)

closeButton.MouseButton1Click:Connect(function()
    -- Fade everything together smoothly
    for _, obj in ipairs(mainFrame:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            TweenService:Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 1,
                BackgroundTransparency = 1
            }):Play()
        end
        if obj:IsA("Frame") then
            TweenService:Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1
            }):Play()
        end
    end

    -- Shrink and fade frame simultaneously
    TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 400, 0, 0),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0.5, 20)
    }):Play()

    task.wait(0.3)
    screenGui:Destroy()
end)

-- Copy button hover & click
copyButton.MouseEnter:Connect(function()
    TweenService:Create(copyButton, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(105, 120, 255),
        BackgroundTransparency = 0,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(0, 290, 0, 50)
    }):Play()
end)

copyButton.MouseLeave:Connect(function()
    TweenService:Create(copyButton, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(88, 101, 242),
        BackgroundTransparency = 0.3,
        TextColor3 = Color3.fromRGB(220, 220, 230),
        Size = UDim2.new(0, 280, 0, 48)
    }):Play()
end)

copyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DISCORD_INVITE)
    elseif toclipboard then
        toclipboard(DISCORD_INVITE)
    end

    -- Visual feedback
    local originalText = copyButton.Text
    TweenService:Create(copyButton, TweenInfo.new(0.1), {
        BackgroundColor3 = Color3.fromRGB(67, 181, 129)
    }):Play()
    copyButton.Text = "Copied!"

    task.wait(1.5)

    copyButton.Text = originalText
    TweenService:Create(copyButton, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    }):Play()
end)

-- Fade in animation
mainFrame.Size = UDim2.new(0, 450, 0, 0)
mainFrame.BackgroundTransparency = 1

for _, obj in ipairs(mainFrame:GetDescendants()) do
    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
        obj.TextTransparency = 1
    end
    if obj:IsA("Frame") then
        obj.BackgroundTransparency = 1
    end
end

-- Animate in
TweenService:Create(mainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 450, 0, 320),
    BackgroundTransparency = 0
}):Play()

task.wait(0.15)

for _, obj in ipairs(mainFrame:GetDescendants()) do
    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
        TweenService:Create(obj, TweenInfo.new(0.25), {TextTransparency = 0}):Play()
    end
    if obj:IsA("Frame") then
        local targetTrans = 0
        if obj.Name == "IconFrame" then targetTrans = 0.85 end
        TweenService:Create(obj, TweenInfo.new(0.25), {BackgroundTransparency = targetTrans}):Play()
    end
end
