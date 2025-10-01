local GUI = require("GUI")
local screen = require("Screen")

local workspace = GUI.workspace()

local w, h = screen.getResolution()

local object = workspace:addChild(GUI.object(1, 1, w, h))

local colors = {0xFF4940, 0xFFB640, 0xFFFF40, 0x66FF40, 0x336DFF, 0x9924FF}

object.draw = function(object)
  local hd6 = math.floor(object.height / 6)

  for i, color in ipairs(colors) do
    local y = (i - 1) * hd6 + 1
    screen.drawRectangle(object.x, y, object.width, hd6, color, color, " ")
  end
end

workspace:draw()
workspace:start()
