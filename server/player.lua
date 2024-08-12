local Player = {}

function Player:Create(src)
    local self = {}

    self.src = src
    self.identifier = GetPlayerIdentifiers(src)[1]
    self.name = GetPlayerName(src)
    self.money = 0
    self.isBanned = false

    -- Load data from database
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = self.identifier
    }, function(result)
        if result[1] then
            self.money = result[1].money
        else
            -- Register new player
            MySQL.Async.execute('INSERT INTO users (identifier, name, money) VALUES (@identifier, @name, @money)', {
                ['@identifier'] = self.identifier,
                ['@name'] = self.name,
                ['@money'] = self.money
            })
        end
    end)

    return self
end

function Player:GetMoney()
    return self.money
end

function Player:AddMoney(amount)
    self.money = math.min(self.money + amount, Config.MaxMoney)
end

function Player:RemoveMoney(amount)
    self.money = math.max(self.money - amount, 0)
end

-- Export the Player module
return Player
