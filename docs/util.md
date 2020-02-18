
# util.lua
A simple to make tedious tasks, like file reading and writing, easier.
Created by znepb  
**Dependencies**  
None
**Optional Dependencies**  
json.lua

## *string* `util.fetch(string url)`
Sends a GET request to the specified `url`, and returns the content of the request.
## *string* `util.read(string path)`
Reads the specified `path` on the computer, and returns `content` as a string. If the file was not found, `nil` will be returned instead.
## *table* `util.readTable(string path)`
Reads the specified `path` and returns it as a table, if it can be parsed as a table.
## *table* `util.readTableAsJSON(string path)`
**Requires json.lua**  
Reads JSON content in `path` and returns it as a lua table.
## `util.reset()`
Clears the screen and sets the cursor to 1, 1
## `util.resetColorScheme()`
Resets the `backgroundColor` and the `textColor` to black and white respectively.
## `util.resetCursorPos()`
Sets the cursor pos to 1, 1
## *bool* `util.tableContains(table table, any element)`
Gets whether `table` contains `element` or not.
## `util.write(string path, string contents)`
Writes `contents` to the specified `path`.
## `util.writeTable(string path, table table)`
Serializes `table` and writes it to `path`.
## `util.writeTableAsJSON(string path, table table)`
**Requires json.lua**  
Writes `table` to `path` as a JSON string.
