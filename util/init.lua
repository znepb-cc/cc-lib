local util = {}
local json
local baseDirectory = "/util/"

local function getDir(moduleName)
    return fs.combine(baseDirectory, moduleName) .. ".lua"
end

function util.loadModule(moduleName)
    if fs.exists(getDir(moduleName)) then
        return require(fs.exists(baseDirectory .. moduleName .. ".lua"))
    else
        return "Module does not exist"
    end
end

function util.listModules()
    local modules = {}
    for i, v in pairs(fs.list(baseDirectory)) do
        table.insert(modules, v:sub(1, -5))
    end
    return modules
end

return util
