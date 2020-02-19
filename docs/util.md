
# util.lua
A simple to make tedious tasks, like file reading and writing, easier.
Created by znepb  
**Dependencies**  
None
**Optional Dependencies**  
json.lua

# Main
## *table* `util.loadModule(string module)`
Loads specified `module`
## `table` `util.listModules()`
Returns all modules that are installed.

# File
## *string* `ufile.read(string path)`
Reads the specified `path` on the computer, and returns `content` as a string. If the file was not found, `nil` will be returned instead.
## *table* `ufile.readTable(string path)`
Reads the specified `path` and returns it as a table, if it can be parsed as a table.
## `ufile.write(string path, string contents)`
Writes `contents` to the specified `path`.
## `ufile.writeTable(string path, table table)`
Serializes `table` and writes it to `path`.
add getFileCount

# General
## `ugen.reset()`
Clears the screen and sets the cursor to 1, 1
## `ugen.resetColorScheme()`
Resets the `backgroundColor` and the `textColor` to black and white respectively.
## `ugen.resetCursorPos()`
Sets the cursor pos to 1, 1
## *bool* `ugen.tableContains(table table, any element)`
Gets whether `table` contains `element` or not.
add printTable, reverseTable, yeild and tryYeild

# HTTP
## *string* `uhttp.fetch(string url)`
Sends a GET request to the specified `url`, and returns the content of the request.

# JSON
## *table* `ujson.readTableAsJSON(string path)`
Reads JSON content in `path` and returns it as a lua table.
## `ujson.writeTableAsJSON(string path, table table)`  
Writes `table` to `path` as a JSON string.

# Math
add clamp, randomFloat, pythagoras, round, vecMagSq, dist, map and lerp