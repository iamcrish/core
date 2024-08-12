AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    deferrals.defer()
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]

    MySQL.Async.fetchAll('SELECT * FROM bans WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result[1] then
            deferrals.done("You are banned from this server: " .. result[1].reason)
            CancelEvent()
        else
            deferrals.done()
        end
    end)
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    local player = Core.Players[src]

    if player then
        MySQL.Async.execute('UPDATE users SET money = @money WHERE identifier = @identifier', {
            ['@money'] = player.money,
            ['@identifier'] = player.identifier
        })
        print("[CORE] Player " .. player.name .. " data saved.")
        Core.Players[src] = nil
    end
end)
