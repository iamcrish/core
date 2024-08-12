version '1.0'

author 'iamkrishuprety @ https://github.com/iamcrish'
description 'MrEverestRP Framework - https://mreverest.net'

fx_version 'cerulean'
game 'gta5'

lua54 'yes'
use_fxv2_oal 'yes'

server_scripts {
    '@mysql-async/lib/MySQL.lua',  -- MySQL async library
    'config.lua',
    'server/main.lua',
    'server/player.lua',
    'server/database.lua',
    'server/events.lua',
    'server/utils.lua',
    'server/security.lua'
}

client_scripts {
    'config.lua',
    'client/main.lua',
    'client/events.lua',
    'client/utils.lua'
}

-- Export functions for other resources
exports {
    'GetPlayerData',
    'SavePlayerData',
    'AddMoney',
    'RemoveMoney',
    'KickPlayer',
    'BanPlayer'
}