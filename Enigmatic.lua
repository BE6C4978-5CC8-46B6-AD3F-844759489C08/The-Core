local core = {}
--------------------------------------------------------------------
-- The Core of the script, holds the functions used for later use. -
--------------------------------------------------------------------

function core:ToString(fromArray)
	local toArray
	local bracket

	if #fromArray > 0 and type(fromArray) == 'table' then
		for index = 1,#fromArray do
			fromArray[index] = string.gsub(fromArray[index], ' ', '_')

			if toArray then
				toArray = toArray .. ' ' .. fromArray[index]
			else
				toArray = fromArray[index]
			end
		end
	elseif type(fromArray) == 'table' then
		for index, value in pairs(fromArray) do
			index = string.gsub(index, ' ', '_')
			value = string.gsub(value, ' ', '_')

			if toArray then
				toArray = toArray .. '[' .. index .. ' ' .. value .. '] '
			else
				toArray = '[' .. index .. ' ' .. value .. '] '
			end
		end
		
		bracket = true
	end
	
	return toArray, bracket
end

--------------------------------------------------------------------
-- Takes a table and turns it into a string. Could be done better. -
--------------------------------------------------------------------

function core:ToArray(fromString, bracket)

	local newArray = {}

	if not bracket then
		for match in string.gmatch(fromString, '%S+') do 
			table.insert(newArray, match)
		end
	else
		local number = 1
		local prev

		for match in string.gmatch(fromString, '%S+') do 
			local sub = string.gsub(match, '[%[%]]', '')
			
			if number % 2 > 0 then
				number = number + 1
				prev = sub
			else
				number = number + 1
				newArray[prev] = sub
			end			
		end
	end
end

--------------------------------------------------------------------
-- Takes a string and turns it into a table. Could be done better. -
--------------------------------------------------------------------

--------------------------------------------------------------------
------------- Core ---- SaxaphoneWalrus ---- Enigmatic -------------
--------------------------------------------------------------------
--------------------------------------------------------------------
------------------- VERSION ---- 0.0.1 ---- NOTE -------------------
--------------------------------------------------------------------
-- Early draft, could most likely be done better. Only use if you --
-- have no other option. This is not a very good script at all... --
--------------------------------------------------------------------
