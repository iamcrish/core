local Security = {}

function Security:Init()
    print("[SECURITY] Initializing...")
end

function Security:ValidatePlayer(src)
    local player = Core.Players[src]
    if player then
        -- Example of basic anti-cheat: check for large amounts of money
        if player.money > Config.MaxMoney then
            KickPlayer(src, "Cheating detected: Money value too high.")
        end
    end
end

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    Security:ValidatePlayer(src)
end)

Security:Init()
