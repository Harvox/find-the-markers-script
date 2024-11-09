function check(part)
    for _, v in next, part:GetDescendants() do 
        if v:IsA("TouchTransmitter") then
            return true
        end
    end
    return false
end

function getPart(part)
    for _, v in next, part:GetDescendants() do 
        if v:IsA("TouchTransmitter") then
            game:GetService("StarterGui"):SetCore("SendNotification", {
              Title = "Harvox's Find The Marker UI",
              Text = "Currently getting: " .. v.Parent.Name
            })
            return v.Parent
        end
    end
    return nil
end

local plr = game.Players.LocalPlayer
for _, v in next, workspace:GetDescendants() do
local succ, err = pcall(function()
        if v:IsA("Model") and string.find(string.lower(v.Name), "marker") then   
        if check(v) then 
            local targetPart = getPart(v)
            if targetPart then
                for i = 1, 10 do 
                    task.wait(0.05)
                    firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("Left Leg"), getPart(v), 0)
                    plr.Character.HumanoidRootPart.CFrame = targetPart.CFrame
                end
            end
        end
    end
end)
if err then
   print(tostring(err)) 
end
end
