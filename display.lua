WIDTH = 1024
HEIGHT = 576

local display = {}
display.title = "Aula 5 - tilemaps, tilesets e animação"
-- display.icon = "assets/images/icon.png"
display.resizable = true
display.width, display.height = WIDTH, HEIGHT
display.isFullScreen = false
display.fullscreen = function (self)
    _, _, self.flags = love.window.getMode()
    self.width, self.height = love.window.getDesktopDimensions(self.flags.display)
    self.isFullScreen = true
end

return display