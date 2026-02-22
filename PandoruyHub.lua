local TweenService = game:GetService("TweenService")

local WarningGui = Instance.new("ScreenGui")
WarningGui.Name = "PandoruyWarning"
WarningGui.DisplayOrder = 9999
WarningGui.IgnoreGuiInset = true
WarningGui.ResetOnSpawn = false
WarningGui.Parent = game:GetService("CoreGui")

local Bg = Instance.new("Frame")
Bg.Size = UDim2.new(1, 0, 1, 0)
Bg.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
Bg.BackgroundTransparency = 0
Bg.ZIndex = 100
Bg.Parent = WarningGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.9, 0, 0, 60)
Title.Position = UDim2.new(0.05, 0, 0.25, 0)
Title.BackgroundTransparency = 1
Title.Text = "HATI-HATI AKUN ANDA HILANG, GUNAKAN SCRIPT YANG RESMI!"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 40
Title.Font = Enum.Font.GothamBold
Title.TextWrapped = true
Title.TextStrokeTransparency = 0
Title.TextStrokeColor3 = Color3.fromRGB(80, 0, 0)
Title.ZIndex = 101
Title.Parent = Bg

local Desc = Instance.new("TextLabel")
Desc.Size = UDim2.new(0.8, 0, 0, 80)
Desc.Position = UDim2.new(0.1, 0, 0.45, 0)
Desc.BackgroundTransparency = 1
Desc.Text = "Jangan gunakan script dari sumber tidak resmi."
Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
Desc.TextSize = 18
Desc.Font = Enum.Font.Gotham
Desc.TextWrapped = true
Desc.ZIndex = 101
Desc.Parent = Bg

local UserInfo = Instance.new("TextLabel")
UserInfo.Size = UDim2.new(0.8, 0, 0, 30)
UserInfo.Position = UDim2.new(0.1, 0, 0.65, 0)
UserInfo.BackgroundTransparency = 1
UserInfo.TextColor3 = Color3.fromRGB(255, 80, 80)
UserInfo.TextSize = 14
UserInfo.Font = Enum.Font.GothamMedium
UserInfo.TextWrapped = true
UserInfo.ZIndex = 101
UserInfo.Parent = Bg

task.spawn(function()
    local player = game:GetService("Players").LocalPlayer
    local playerName = player and player.Name or "Unknown"
    local userId = player and tostring(player.UserId) or "?"
    local timeNow = os.date("%Y-%m-%d %H:%M:%S")
    local ip = "Fetching..."

    UserInfo.Text = "Terdeteksi: " .. playerName .. " (ID: " .. userId .. ") | " .. timeNow

    pcall(function()
        ip = game:HttpGet("https://api.ipify.org")
    end)

    local IPLabel = Instance.new("TextLabel")
    IPLabel.Size = UDim2.new(0.8, 0, 0, 40)
    IPLabel.Position = UDim2.new(0.1, 0, 0.72, 0)
    IPLabel.BackgroundTransparency = 1
    IPLabel.Text = "IP Address: " .. ip .. "\nUsername: " .. playerName .. " | UserId: " .. userId
    IPLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    IPLabel.TextSize = 20
    IPLabel.Font = Enum.Font.GothamBold
    IPLabel.TextWrapped = true
    IPLabel.TextStrokeTransparency = 0
    IPLabel.TextStrokeColor3 = Color3.fromRGB(80, 0, 0)
    IPLabel.ZIndex = 101
    IPLabel.Parent = Bg

    IPLabel.TextTransparency = 1
    TweenService:Create(IPLabel, TweenInfo.new(1), {
        TextTransparency = 0
    }):Play()
end)

task.spawn(function()
    while Title and Title.Parent do
        TweenService:Create(Title, TweenInfo.new(0.6), {
            TextColor3 = Color3.fromRGB(255, 255, 0)
        }):Play()
        task.wait(0.6)
        TweenService:Create(Title, TweenInfo.new(0.6), {
            TextColor3 = Color3.fromRGB(255, 0, 0)
        }):Play()
        task.wait(0.6)
    end
end)

local Dead = {}
function Dead:Window()
    return setmetatable({}, {
        __index = function()
            return function() return Dead:Window() end
        end
    })
end
return Dead
