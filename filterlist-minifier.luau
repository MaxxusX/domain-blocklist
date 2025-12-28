--!strict

local process = require("@lune/process")
local fs = require("@lune/fs")
local stdio = require("@lune/stdio")

local filterlistPath = process.cwd .. process.args[1]

if not fs.isFile(filterlistPath) then
    error("file not found: "..filterlistPath)
end

local output = ""
for _,line in fs.readFile(filterlistPath).split("\n") do
    local filter = line.trim()

    if (
        filter == "" or
        filter.startsWith("#") or
        (filter.startsWith("! ")
            and not filter.startsWith("! Checksum: ")
            and not filter.startsWith("! Diff-Path: ")
            and not filter.startsWith("! Title: ")
            and not filter.startsWith("! Description: ")
            and not filter.startsWith("! Version: ")
            and not filter.startsWith("! TimeUpdated: ")
            and not filter.startsWith("! Last updated: ")
            and not filter.startsWith("! Last modified: ")
            and not filter.startsWith("! Expires: ")
            and not filter.startsWith("! Homepage: ")
            and not filter.startsWith("! Author: ")
            and not filter.startsWith("! License: ")
            and not filter.startsWith("! Redirect: ")
        )
    ) then
        continue
    end
    
    output += filter .. "\n"
end

stdio.write(output)
