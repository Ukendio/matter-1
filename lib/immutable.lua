local None = {}

-- https://github.com/freddylist/llama/blob/master/src/Dictionary/merge.lua
local function merge(...)
	local new = {}

	for dictionaryIndex = 1, select("#", ...) do
		local dictionary = select(dictionaryIndex, ...)

		if dictionary ~= nil then
			for key, value in pairs(dictionary) do
				if value == None then
					new[key] = nil
				else
					new[key] = value
				end
			end
		end
	end

	return new
end

-- https://github.com/freddylist/llama/blob/master/src/List/toSet.lua
local function toSet(list)
	local set = {}

	for _, v in ipairs(list) do
		set[v] = true
	end

	return set
end

-- https://github.com/freddylist/llama/blob/master/src/Dictionary/values.lua
local function values(dictionary)
	local valuesList = {}

	local index = 1

	for _, value in pairs(dictionary) do
		valuesList[index] = value
		index = index + 1
	end

	return valuesList
end

return {
	None = None,
	merge = merge,
	toSet = toSet,
	values = values,
}
