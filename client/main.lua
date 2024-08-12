local Core = {}

function Core:Init()
    print("[CORE] Initializing client...")
end

-- Sync money
RegisterNetEvent('core:client:SyncMoney')
AddEventHandler('core:client:SyncMoney', function(money)
    Core.Money = money
    Core:ShowNotification("Your money has been updated: $" .. money)
end)

function Core:ShowNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(message)
    DrawNotification(false, true)
end

Core:Init()
