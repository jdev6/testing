local s = {already=false}

function s:case(x,f)
    if x == self.value or (x == "*" and not self.already) then
        self.already = true
        f()
    end
end

function switch(var)
    local o = s
    o.value = var
    o.already = false
    return o
end
