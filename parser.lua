-- TODO: replace with the new parser for the new blocklist format

local function parseLine(line)
    local filter = line.trim()

    if filter.startsWith("#") then
        return ""
    end

    if filter.startsWith("!") then
        if filter.startsWith("!title: ") then
            return "! Title: " .. filter.substr(8).trimStart()
        end
        if filter.startsWith("!desc: ") then
            return "! Description: " .. filter.substr(7).trimStart()
        end
        if filter.startsWith("!author: ") then
            return "! Author: " .. filter.substr(9).trimStart()
        end
        if filter.startsWith("!homepage: ") then
            return "! Homepage: " .. filter.substr(11).trimStart()
        end
        if filter.startsWith("!expires: ") then
            return "! Expires: " .. filter.substr(10).trimStart()
        end
        if filter.startsWith("!modified: ") then
            return "! Last modified: " .. filter.substr(11).trimStart()
        end

        error("unsupported metadata")
    end

    local actionType; if filter.startsWith("@") then
        actionType = "block"
    elseif filter.startsWith("~") then
        actionType = "unblock"
    else
        error("unknown actionType")
    end

    local resource = filter.substr(1)

    -- /^([a-z\-]), *(.*)$/
end

-- local blocklist = os readfile "a/list.txt"
local blocklistLines = blocklist.split("\n")

local output = "[Adblock Plus 3.13]\n"

for idx, line in ipairs(blocklistLines) do
    local converted = parseLine(line)
    if converted == "" then
        continue
    else
        output += converted .. "\n"
    end
end

-- os writefile "output.txt" output
