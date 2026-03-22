local lualib_bundle = require('lualib_bundle')

setmetatable(_G, {__index = lualib_bundle})

--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        local value = nil
        if (select("#", ...) > 0) then value = module(...) else value = module(file) end
        ____moduleCache[file] = { value = value }
        return value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["src.autorun"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local Paths = require("Paths")
local Filesystem = require("Filesystem")
local configPath = Paths.user.applicationData .. "Customizer/Config.cfg"
if Filesystem.exists(configPath) then
    local data = Filesystem.readTable(configPath)
    __TS__ArrayForEach(
        __TS__ObjectKeys(data),
        function(____, key)
            _G.package.loaded.gui[key] = data[key]
        end
    )
end
return ____exports
 end,
}
local ____entry = require("src.autorun", ...)
return ____entry
