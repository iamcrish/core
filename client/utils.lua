local Utils = {}

-- Rounds a number to the specified number of decimal places
function Utils:Round(value, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(value * mult + 0.5) / mult
end

-- Formats a number with commas for thousands
function Utils:CommaValue(amount)
    local formatted = tostring(amount)
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then break end
    end
    return formatted
end

-- Trims whitespace from the start and end of a string
function Utils:Trim(value)
    return string.gsub(value, "^%s*(.-)%s*$", "%1")
end

-- Converts a vector to a string representation
function Utils:VectorToString(vector)
    return string.format("x: %.2f, y: %.2f, z: %.2f", vector.x, vector.y, vector.z)
end

-- Returns the player's current coordinates
function Utils:GetPlayerCoords()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    return coords
end

-- Sets a marker at the player's location
function Utils:SetPlayerMarker(markerColor)
    local coords = self:GetPlayerCoords()
    DrawMarker(1, coords.x, coords.y, coords.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, markerColor.r, markerColor.g, markerColor.b, 255, false, true, 2, false, false, false, false)
end

-- Displays a message on the screen
function Utils:ShowMessage(message, duration)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostMessagery(duration, true)
end

-- Gets the current timestamp formatted as a string
function Utils:GetCurrentTimestamp()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- Gets the player's name
function Utils:GetPlayerName()
    return GetPlayerName(PlayerId())
end

-- Gets a random number within a specified range
function Utils:GetRandomNumber(min, max)
    return math.random(min, max)
end

-- Converts a string to lowercase
function Utils:ToLowerCase(str)
    return string.lower(str)
end

-- Converts a string to uppercase
function Utils:ToUpperCase(str)
    return string.upper(str)
end

-- Checks if a value is a number
function Utils:IsNumber(value)
    return tonumber(value) ~= nil
end

-- Checks if a value is a string
function Utils:IsString(value)
    return type(value) == "string"
end

-- Converts a string to a number
function Utils:ToNumber(value)
    return tonumber(value) or 0
end

-- Checks if the player's current vehicle is in motion
function Utils:IsVehicleInMotion(vehicle)
    return IsVehicleInMotion(vehicle)
end

-- Gets the heading of a vehicle
function Utils:GetVehicleHeading(vehicle)
    return GetEntityHeading(vehicle)
end

-- Sets the heading of a vehicle
function Utils:SetVehicleHeading(vehicle, heading)
    SetEntityHeading(vehicle, heading)
end

-- Converts a hex color to RGB
function Utils:HexToRGB(hex)
    local r = tonumber(hex:sub(1, 2), 16)
    local g = tonumber(hex:sub(3, 4), 16)
    local b = tonumber(hex:sub(5, 6), 16)
    return {r = r, g = g, b = b}
end

-- Export utility functions for client scripts
exports('round', function(value, numDecimalPlaces)
    return Utils:Round(value, numDecimalPlaces)
end)

exports('commaValue', function(amount)
    return Utils:CommaValue(amount)
end)

exports('trim', function(value)
    return Utils:Trim(value)
end)

exports('vectorToString', function(vector)
    return Utils:VectorToString(vector)
end)

exports('getPlayerCoords', function()
    return Utils:GetPlayerCoords()
end)

exports('setPlayerMarker', function(markerColor)
    Utils:SetPlayerMarker(markerColor)
end)

exports('showMessage', function(message, duration)
    Utils:ShowMessage(message, duration)
end)

exports('getCurrentTimestamp', function()
    return Utils:GetCurrentTimestamp()
end)

exports('getPlayerName', function()
    return Utils:GetPlayerName()
end)

exports('getRandomNumber', function(min, max)
    return Utils:GetRandomNumber(min, max)
end)

exports('toLowerCase', function(str)
    return Utils:ToLowerCase(str)
end)

exports('toUpperCase', function(str)
    return Utils:ToUpperCase(str)
end)

exports('isNumber', function(value)
    return Utils:IsNumber(value)
end)

exports('isString', function(value)
    return Utils:IsString(value)
end)

exports('toNumber', function(value)
    return Utils:ToNumber(value)
end)

exports('isVehicleInMotion', function(vehicle)
    return Utils:IsVehicleInMotion(vehicle)
end)

exports('getVehicleHeading', function(vehicle)
    return Utils:GetVehicleHeading(vehicle)
end)

exports('setVehicleHeading', function(vehicle, heading)
    Utils:SetVehicleHeading(vehicle, heading)
end)

exports('hexToRGB', function(hex)
    return Utils:HexToRGB(hex)
end)