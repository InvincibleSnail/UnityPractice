local add = function()
	local sum = 0; 
	local tmp = nil
	tmp = function(x)
		sum = sum + x; 
		return tmp,sum;
	end
	return tmp; 
end


local f = function ()
	local i = 10
	local ff = function ()
		i = i + 1
		print(i)
	end
	return ff
end

local function getlist()
	local l = {}
	for i = 1,5 do
		l[i] = function ()
			return i
		end
	end
	return l
end

local list = getlist()

tA = {1, 3}
tB = {5, 7}
 
--tSum = tA + tB
mt = {}
 
mt.__add = function(t1, t2)
	for _, item in ipairs(t2) do
		t1[_] = t1[_] + t2[_]
	end
return t1
end
setmetatable(tA, mt)
tSum = tA + tB
 
for k, v in pairs(tSum) do
	print(v)
end