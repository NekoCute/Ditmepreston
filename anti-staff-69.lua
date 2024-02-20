local Players = game:GetService("Players")
local GroupService = game:GetService("GroupService")

local groupIdToDetect = 5060810
local kickMessage = "Detected staff in server"

local function onPlayerAdded(player)
    local userId = player.UserId

    local success, groups = pcall(function()
        return GroupService:GetGroupsAsync(userId)
    end)

    if success then
        for _, group in pairs(groups) do
            if group.Id == groupIdToDetect then
                player:Kick(kickMessage)
                warn("Detected staff in server: " .. player.Name)
                break
            end
        end
    else
        warn("Failed to get groups for player: " .. player.Name)
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)
