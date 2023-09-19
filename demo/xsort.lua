local Obj = {}

function Obj:new(w,h)
    local o = {}
    setmetatable(o, {__index = self})
    o.w = w
    o.h = h
    return o
end

local a = Obj:new(1,3)
local b = Obj:new(1,1)
local c = Obj:new(2,2)

local function cmpObj(m,n) 
    if m.w * m.h < n.w * n.h then return false end
    return true
end

local x = {a, b ,c}
for _,k in pairs(x) do
    print(k.w*k.h)
end
table.sort(x, cmpObj)
for _,k in pairs(x) do
    print(k.w*k.h)
end