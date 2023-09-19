a = { x = 99}
a.__index = a
a.__add = function (m ,n)
    local out = {}
    setmetatable(out, a)
    out.x = m.x + n.x
    return out
end
function a:Xprint()
    print("x:"..self.x)
end
function a.Yprint()
    print("y:"..a.x)
end
print(collectgarbage("count"))
b = {x = 2}
c = {x = 3}
setmetatable(b, a)
setmetatable(c, a)
b:Xprint()
b.Yprint()
z = b + c
z:Xprint()
z.Yprint()
print(collectgarbage("count"))
a = nil
print(collectgarbage("count"))
print(collectgarbage("collect"))
print(collectgarbage("count"))

function Terr(m)
    -- error("test error")
    m.x = 2*m.x
end
function Tdebug()
    print(debug.traceback())
end

Itest = {x=5}
g = xpcall(Terr, Tdebug, Itest)
print(g)
print(Itest.x)


fp = io.open("ltest", "w")
fp:write("one\n")
fp:write("two\n")
fp:close()
xp = io.open("ltest", "r")
while true do
    local x = xp:read()
    if (x == nil)
    then
        break
    end
    print(x)
end
xp:close()


function Producer()
    local i = 0
    while true do
        i = i + 1
        coroutine.yield(i)
    end
end
function Consumer(co)
    local i = 0
    while i < 10 do
        _,j = coroutine.resume(co)
        print("current consumer:"..i..", current producer:"..j)
        i = i + 1
    end
end
local co = coroutine.create(Producer)
Consumer(co)

if 5 < 1 then
print("demo x")
else
print("demo y")
end
