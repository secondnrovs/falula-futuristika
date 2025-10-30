local canoe = {}

function canoe.random_pick(tbl)
    if type(tbl) ~= "table" or #tbl == 0 then
        return nil, "empty table"
    end
    local i = math.random(1, #tbl)
    return tbl[i]
end

function canoe.reverse_str(str)
    if type(str) ~= "string" then
        return nil, "not a string"
    end
    return str:reverse()
end

function canoe.unique(tbl)
    if type(tbl) ~= "table" then
        return nil, "not a table"
    end
    local seen, result = {}, {}
    for _, v in ipairs(tbl) do
        if not seen[v] then
            table.insert(result, v)
            seen[v] = true
        end
    end
    return result
end

function canoe.join(tbl, sep)
    sep = sep or " 🤡 "
    return table.concat(tbl, sep)
end

return canoe
