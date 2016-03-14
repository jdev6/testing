#!/bin/env lua

local signal = require("posix.signal")
local time = os.clock()
local EXITCODE = 0

signal.signal(signal.SIGINT, function(signum)
        io.write('\n')
        os.exit(128 + signum)
    end
)

local files  = {}

if #arg > 0 then
    for k,v in pairs(arg) do
        if k > 0 then
            if v == '-' then --Read from stdin
                table.insert(files, io.stdin)
            else
                local f = io.open(v)
                if f then
                    table.insert(files, io.open(v))
                else
                    table.insert(files, v)
                end
            end
        end
    end
else
    table.insert(files, io.stdin)
end

for _,f in pairs(files) do
    if type(f) ~= "string" then
        io.write(f:read("*a"))
    else
        print(string.format("%s: %s: No such file or directory", arg[0], f))
        EXITCODE = 1
    end
end

os.exit(EXITCODE)
