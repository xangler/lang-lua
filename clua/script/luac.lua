mylib = require("luac_compose")
mylib.test()
print(mylib.avg(1,2,4,6))

local t = mylib.map({1,3,9}, function (v) return v*v end)
for k,v in pairs(t) do
    print(k, v)
end

c1 = require("luac_simple")
print(xcount(), xcount())
print(xprint(2))