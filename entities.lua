local Display = require('display')
local World = require('world')
local Tilemap = require('tilemap')

local entities = {}
entities.tilemap = {

    update = function ()
        
    end,

    draw = function ()
        love.graphics.reset()
        for y_index, line in ipairs(Tilemap) do
            for x_index, column in ipairs(line) do
                if column == 1 then
                    love.graphics.rectangle('line', 32 * x_index - 32, 32 * y_index - 32, 32, 32)
                end
            end  
        end
        love.graphics.reset()
    end
}

return entities