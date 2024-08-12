local Utils = {}

-- Function to round a number to a specified number of decimal places
function Utils:Round(value, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(value * mult + 0.5) / mult
end

-- Function to format a number with commas
function Utils:CommaValue(amount)
    local formatted = tostring(amount)
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

-- Function to trim whitespace from the beginning and end of a string
function Utils:Trim(value)
    return string.gsub(value, "^%s*(.-)%s*$", "%1")
end

-- Function to generate a random string of a specified length
function Utils:GetRandomString(length)
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local result = ''
    for i = 1, length do
        local randomIndex = math.random(1, #chars)
        result = result .. chars:sub(randomIndex, randomIndex)
    end
    return result
end

-- Function to check if a string is a valid number
function Utils:IsNumber(value)
    return tonumber(value) ~= nil
end

-- Function to log messages to the server console with a timestamp
function Utils:Log(message)
    print('[' .. os.date('%Y-%m-%d %H:%M:%S') .. '] ' .. message)
end

-- Export utility functions
return Utils
