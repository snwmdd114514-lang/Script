-- 感谢25毫秒提供的反编译
local _LocalPlayer = game.Players.LocalPlayer

game:GetService('RunService')

local _ScreenGui = Instance.new('ScreenGui')
local _TextButton = Instance.new('TextButton')
local _UICorner = Instance.new('UICorner')

_ScreenGui.Parent = game.CoreGui
_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_TextButton.Parent = _ScreenGui
_TextButton.BackgroundColor3 = Color3.fromRGB(0, 102, 204)
_TextButton.BorderSizePixel = 0
_TextButton.Position = UDim2.new(0.6826, 0, 0.1626, 0)
_TextButton.Size = UDim2.new(0.0666, 0, 0.1169, 0)
_TextButton.Font = Enum.Font.SourceSans
_TextButton.Text = 'Auto Kyoto'
_TextButton.TextColor3 = Color3.fromRGB(245, 245, 245)
_TextButton.TextScaled = true
_TextButton.TextWrapped = true
_TextButton.Draggable = true
_UICorner.Parent = _TextButton

local u5 = {
    'rbxassetid://12273188754',
}
local u6 = false
local u7 = nil
local u8 = nil

local function u11(p9, p10)
    game:GetService('VirtualInputManager'):SendKeyEvent(p9, p10, false, game)
end
local function u16()
    local v12 = _LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()
    local _HumanoidRootPart = v12:WaitForChild('HumanoidRootPart')

    task.wait(1.71)

    _HumanoidRootPart.CFrame = _HumanoidRootPart.CFrame + _HumanoidRootPart.CFrame.LookVector * 8.6

    u11(true, Enum.KeyCode.D)
    u11(false, Enum.KeyCode.Q)
    u11(true, Enum.KeyCode.Q)
    u11(false, Enum.KeyCode.D)

    local _CurrentCamera = workspace.CurrentCamera

    _CurrentCamera.CameraType = Enum.CameraType.Scriptable
    _CurrentCamera.CFrame = _CurrentCamera.CFrame * CFrame.Angles(0, math.rad(85), 0)

    local v15 = {
        {
            Tool = _LocalPlayer:WaitForChild('Backpack'):WaitForChild('Lethal Whirlwind Stream'),
            Goal = 'Console Move',
        },
    }

    v12:WaitForChild('Communicate'):FireServer(unpack(v15))

    _CurrentCamera.CameraType = Enum.CameraType.Custom
end
local function v22()
    u6 = not u6
    _TextButton.Text = u6 and 'ON' or 'OFF'

    if u6 then
        u7 = (_LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()):WaitForChild('Humanoid').AnimationPlayed:Connect(function(p17)
            local v18, v19, v20 = ipairs(u5)

            while true do
                local v21

                v20, v21 = v18(v19, v20)

                if v20 == nil then
                    break
                end
                if p17.Animation.AnimationId == v21 then
                    task.spawn(u16)

                    break
                end
            end
        end)
    elseif u7 then
        u7:Disconnect()

        u7 = nil
    end
end

_TextButton.MouseButton1Click:Connect(v22)
_LocalPlayer.CharacterAdded:Connect(function()
    u6 = false
    _TextButton.Text = 'OFF'

    if u7 then
        u7:Disconnect()

        u7 = nil
    end
    if u8 then
        u8:Disconnect()

        u8 = nil
    end
end)

