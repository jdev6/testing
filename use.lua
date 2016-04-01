function use(ord)
    local function split(str, sep)
        local accum = ""
        local t = {}
        for i=1,#str do
            local ch = str:sub(i,i)
            if i == #str then
                t[#t+1] = accum..ch
            elseif ch == sep then
                t[#t+1] = accum
                accum = ""
            else
                accum = accum..ch
            end
        end
        return t
    end

    local tables_string = split(ord, ".")
    local t_accumulator = _G[tables_string[1]]

    if #tables_string > 1 then
        for k,v in pairs(tables_string) do
            if k > 1 then
                t_accumulator = t_accumulator[v]
            end
        end
        _G[tables_string[#tables_string]] = t_accumulator
    end

end
