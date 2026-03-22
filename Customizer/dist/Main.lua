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
["src.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local GUI = require("GUI")
local System = require("System")
local Screen = require("Screen")
local Paths = require("Paths")
local Filesystem = require("Filesystem")
local path = Filesystem.path(System.getCurrentScript())
local scriptPath = path .. "autorun.lua"
local configPath = Paths.user.applicationData .. "Customizer/Config.cfg"
local userSettings = System.getUserSettings()
local config = {}
if Filesystem.exists(configPath) then
    config = Filesystem.readTable(configPath)
end
local ____, window = System.addWindow(GUI.tabbedWindow(
    1,
    1,
    70,
    Screen.getHeight() - 1
))
window.actionButtons.localX = 3
window.actionButtons.maximize:remove()
local content = window:addChild(GUI.layout(
    window.backgroundPanel.localX,
    window.backgroundPanel.localY,
    window.backgroundPanel.width,
    window.backgroundPanel.height - 3,
    1,
    1
))
function ____exports.fromScreamingSnake(self, input)
    return table.concat(
        __TS__ArrayMap(
            __TS__StringSplit(
                string.lower(input),
                "_"
            ),
            function(____, word, index)
                local ____temp_0
                if index == 0 then
                    ____temp_0 = string.upper(string.sub(word, 1, 1)) .. string.sub(word, 2)
                else
                    ____temp_0 = word
                end
                return ____temp_0
            end
        ),
        " "
    )
end
local tabs = {[1] = "WINDOW", [2] = "CONTEXT_MENU", [3] = "BACKGROUND_CONTAINER", [4] = "DURATION"}
local function updateTab(self)
    content:removeChildren()
    local library = _G.package.loaded.gui
    local keys = __TS__ArraySort(__TS__ArrayFilter(
        __TS__ObjectKeys(library),
        function(____, key) return __TS__StringIncludes(key, tabs[window.tabBar.selectedItem]) end
    ))
    for ____, key in ipairs(keys) do
        local label = ____exports.fromScreamingSnake(nil, key)
        if __TS__StringIncludes(key, "COLOR") then
            local colorSelector = content:addChild(GUI.colorSelector(
                1,
                1,
                50,
                3,
                library[key],
                label
            ))
            colorSelector.onColorSelected = function()
                library[key] = colorSelector.color
                config[key] = colorSelector.color
                Filesystem.writeTable(configPath, config)
            end
        else
            local slider = content:addChild(GUI.slider(
                1,
                1,
                50,
                6740864,
                14803425,
                16777215,
                10855845,
                0,
                1,
                library[key],
                false,
                label .. ": "
            ))
            slider.onValueChanged = function()
                library[key] = slider.value
                config[key] = slider.value
                Filesystem.writeTable(configPath, config)
            end
            content:addChild(GUI.object(1, 1, 0, 0))
        end
    end
end
updateTab(nil)
window.tabBar:addItem("Windows").onTouch = function() return updateTab(nil) end
window.tabBar:addItem("Menus").onTouch = function() return updateTab(nil) end
window.tabBar:addItem("Background").onTouch = function() return updateTab(nil) end
window.tabBar:addItem("Durations").onTouch = function() return updateTab(nil) end
local bottomBar = window:addChild(GUI.layout(
    1,
    window.height - 2,
    window.width,
    3,
    1,
    1
))
bottomBar:setDirection(1, 1, GUI.DIRECTION_HORIZONTAL)
local taskEnabledSwitch = bottomBar:addChild(GUI.roundedButton(
    1,
    1,
    11,
    1,
    16730432,
    15790320,
    46656,
    15790320,
    "Autorun"
))
taskEnabledSwitch.switchMode = true
local function findTask()
    return __TS__ArrayFind(
        userSettings.tasks,
        function(____, task) return task.path == scriptPath end
    )
end
if not findTask(nil) then
    local ____userSettings_tasks_1 = userSettings.tasks
    ____userSettings_tasks_1[#____userSettings_tasks_1 + 1] = {path = scriptPath, mode = 1, enabled = true}
    System.saveUserSettings()
end
if findTask(nil).enabled then
    taskEnabledSwitch.pressed = true
end
taskEnabledSwitch.onTouch = function()
    findTask(nil).enabled = taskEnabledSwitch.pressed
end
bottomBar:addChild(GUI.roundedButton(
    1,
    1,
    11,
    1,
    14803425,
    6908265,
    6908265,
    14803425,
    "Reset"
)).onTouch = function()
    Filesystem.remove(configPath)
    computer.shutdown(true)
end
return ____exports
 end,
}
local ____entry = require("src.index", ...)
return ____entry
