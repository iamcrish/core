local Database = {}

function Database:Init()
    print("[DATABASE] Initializing...")
end

function Database:SavePlayerData(player)
    MySQL.Async.execute('UPDATE users SET money = @money WHERE identifier = @identifier', {
        ['@money'] = player.money,
        ['@identifier'] = player.identifier
    })
end

function Database:LoadPlayerData(identifier, callback)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result[1] then
            callback(result[1])
        else
            callback(nil)
        end
    end)
end

Database:Init()
