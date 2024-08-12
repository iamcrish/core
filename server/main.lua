Core = {}

-- Initialize the Core
function Core:Init()
    print("[CORE] Initializing server...")
    self.Players = {}
    TriggerEvent('core:server:LoadAllPlayers')
end

-- Exported function to get player data
function GetPlayerData(src)
    return Core.Players[src]
end

-- Exported function to save player data
function SavePlayerData(src, data)
    Core.Players[src] = data
end

-- Exported function to add money
function AddMoney(src, amount)
    local player = Core.Players[src]
    if player then
        player.money = math.min(player.money + amount, Config.MaxMoney)
        TriggerClientEvent('core:client:SyncMoney', src, player.money)
    end
end

-- Exported function to remove money
function RemoveMoney(src, amount)
    local player = Core.Players[src]
    if player then
        player.money = math.max(player.money - amount, 0)
        TriggerClientEvent('core:client:SyncMoney', src, player.money)
    end
end

-- Kick and ban player functionality
function KickPlayer(src, reason)
    DropPlayer(src, reason)
end

function BanPlayer(src, reason)
    local player = Core.Players[src]
    if player then
        MySQL.Async.execute('INSERT INTO bans (identifier, reason) VALUES (@identifier, @reason)', {
            ['@identifier'] = player.identifier,
            ['@reason'] = reason
        })
        DropPlayer(src, "You have been banned: " .. reason)
    end
end

Core:Init()
