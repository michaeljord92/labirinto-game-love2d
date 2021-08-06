local Display = require('display')
local World = require('world')
local Tilemap = require('tilemap')
local Sprite = require('sprite')
local Player = require('entities/player')


local entities = {}
entities.tilemap = {

    update = function (dt)
        
    end,

    draw = function ()
        love.graphics.reset()
        for y_index, line in ipairs(Tilemap) do
            for x_index, column in ipairs(line) do
                if column == 1 then
                    love.graphics.draw(Sprite.block, 64 * x_index - 64, 64 * y_index - 64)
                end
            end  
        end
        love.graphics.reset()
    end
}

entities.player = {
    entitie = Player(),
    update = function (self,dt)
        self.entitie:update(dt)        
    end,
    draw = function (self)
        self.entitie:draw()        
    end
}

return entities