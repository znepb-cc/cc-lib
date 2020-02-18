local util = {}
local json

if fs.exists("/json.lua") or fs.exists("/lib/json.lua") then
    json = require("json")
end

function util.resetColorScheme()
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
end

function util.resetPalleteColors()
end

function util.resetCursorPos()
    term.setCursorPos(1,1)
end

function util.reset()
    util.resetColorScheme()
    term.clear()
    util.resetCursorPos()
    return true
end

function util.read(path)
    if fs.exists(path) then
        local file = fs.open(path, "r")
        local content = file.readAll()
        file.close()
        return content
    end
end

function util.write(path, contents)
    local file = fs.open(path, "w")
    file.write(contents)
    file.close()
    return true
end

function util.writeTable(path, table)
    return util.write(path, textutils.serialize(table))
end

function util.readTable(path)
    if fs.exists(path) then
        return textutils.unserialize(util.read(path))
    end
end

function util.readTableAsJSON(path)
    if json then
        local content = util.read(path)
        return json.decode(content)
    end
end

function util.writeTableAsJSON(path, tbl)
    if json then
        local content = util.write(path, json.encode(tbl))
    end
end

function util.fetch(url)
    local file = http.get(url)
    local content = file.readAll()
    return content
end

function util.tableContains(tbl, elem)
    for i, e in pairs(tbl) do
        if elem == e then
            return true
        end
    end
    return false
end

-- Constrains value between min and max.
function util.clamp(n, min, max)
    if n < min then
        return min
    elseif n > max then
        return max
    else
        return n
    end
end
 
function util.randomFloat(min, max)
    if max then
        return min + math.random() * (max - min)
    else
        -- When only one argument is provided, min means max.
        return math.random() * min
    end
end
 
-- Pythagorean theorem.
function util.pythagoras(a, b)
    return math.sqrt(a^2 + b^2)
end

-- Rounds a number to a specified number of decimals.
-- If the number of decimals isn't provided, it'll round to 0 decimals.
-- Written with help from Brutal_McLegend.
function util.round(input, decimals)
	decimals = decimals or 0
	if decimals < 0 then error("cf.round(n, d) doesn't take a negative decimal count") end
	local mult = math.pow(10, decimals)
    return math.floor(input * mult + 0.5) / mult
end

function util.clearTerm()
	term.clear()
	term.setCursorPos(1, 1)
end

-- Get the squared magnitude of a vector.
function util.vecMagSq(vector)
	return vector.x * vector.x + vector.y * vector.y
end

-- Get the distance between two vectors.
function util.dist(a, b)
  local dx = b.pos.x - a.pos.x
  local dy = b.pos.y - a.pos.y
  return util.pythagoras(dx, dy)
end

-- Reverses the order of the elements in a table.
function util.reverseTable(tab)
	reversedTable = {}
	for i = #tab, 1, -1 do
		reversedTable[#reversedTable + 1] = tab[i]
	end
	return reversedTable
end

-- Removes an element from a table.
function util.tableRemove(t, e)
	for i = 1, #t do
		if t[i] == e then
			table.remove(t, i)
			break -- Breaking is necessary, because the loop's #t max iterations has changed, because t changed.
		end
	end
	return t
end

-- Prevents the program from crashing after 5 seconds.
-- Executes faster than 'sleep(0.05)'.
function util.yield()
	os.queueEvent("randomEvent")
	os.pullEvent("randomEvent")
end

-- Yields when more than t seconds have passed since the last yield. t is 4 by default.
function util.tryYield(t)
    t = t or 4
    local currentClock = os.clock()
    if currentClock - previousClock > t then
        previousClock = currentClock
        yield()
    end
end

-- Re-maps a number from one range to another.
function util.map(value, minVar, maxVar, minResult, maxResult)
	local a = (value - minVar) / (maxVar - minVar)
	return (1 - a) * minResult + a * maxResult;
end

-- Gets the number of files inside of a folder.
function util.getFileCount(folder)
	return #fs.list(folder)
end

-- Puts a string in a file inside of a folder.
function util.saveData(string, folder, name)	
	-- Creates a folder if it doesn't already exist.
	if not fs.exists(folder) then
		fs.makeDir(folder)
	end

	-- Creates a save file in write mode.
    if not name then
	    local fileCount = cf.getFileCount(folder)
	    name = fileCount + 1
    end
	local file = fs.open(folder.."/"..name, "w")

	file.write(string)
	file.close()
end

-- Returns the data of a file as a string.
function util.loadData(folder, name)
	local file = fs.open(folder.."/"..name, "r")
	local string = file.readAll()
	file.close()
	return string
end

-- Calculates a number between two numbers at a specific increment.
function util.lerp(start, end_, amt)
  local difference = end_ - start
  local extra = amt * difference
  return start + extra
end

-- Prints the contents of a table much like 'textutils.serialize(tab)',
-- but the output is much more readable and it has the option to toggle recursion.
function util.printTable(tab, recursive, depth)
	recursive = not (recursive == false) -- True by default.
	depth = depth or 0 -- The depth starts at 0.
	
	-- Getting the longest key, so all printed values will line up.
	local longestKey = 1
	for key, _ in pairs(tab) do
		local keyLength = #tostring(key)
		if keyLength > longestKey then
			longestKey = keyLength
		end
	end
	
	if depth == 0 then
		print()
	end
	
	-- Print the keys and values, with extra spaces so the values line up.
	for key, value in pairs(tab) do
		yield() -- Need to yield, as the next bit of code can be recursive.
		
		local spacingCount = longestKey - #tostring(key) -- How many spaces are added between the key and value.
		print(
			string.rep('    ', depth).. -- Shift tables that are deep inside the original table.
			tostring(key)..
			string.rep(' ', spacingCount)..
			', '..
			tostring(type(value) == 'table' and 'table' or value)
		)
		
		local isTable = type(value) == 'table'
		local valueIsTable = (tab == value)
		if recursive and isTable and not valueIsTable then
			printTable(value, recursive, depth + 1) -- Go into the table.
		end
	end
	
	if depth == 0 then
		print()
	end
end

return util
