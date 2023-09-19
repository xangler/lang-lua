local function he()
	error({name="demo"})
end
local sus, res = pcall(he)
print(sus)
print(res)
print(res.name)
