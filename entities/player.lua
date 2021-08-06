local Sprite = require('sprite')
local World = require('world')
local Tilemap = require('tilemap')


---
---Criar um novo [player].
---
---@param x number # Posicao no eixo x.
---@param y number # Posicao no eixo y.
---@param sprite love.Image # Imagem do [player].
---@return table table # O [player] novo.
return function (x, y, sprite)
    local entity = {}
    entity.x = x or 96
    entity.y = y or 96
    entity.sprite = sprite or Sprite.player
    entity.speed = 64
    entity.rotation = math.pi
    entity.radius = 25

    entity.up = function (self)
        local x = (self.x-32)/64 + 1
        local y = (self.y-32)/64 + 1
        local sizeTable = 0

        for _ in pairs(Tilemap) do
            sizeTable = sizeTable + 1
        end

        if y - 1 <= sizeTable and y > 1 then
            if Tilemap[y - 1][x] ~= 1 then
                self.y = self.y - self.speed   
            end
        else
            if y > 1 then
                self.y = self.y - self.speed                   
            end
        end
        
        self.rotation = math.pi * 1.5
    end
    entity.down = function (self)
        local x = (self.x-32)/64 + 1
        local y = (self.y-32)/64 + 1
        local sizeTable = 0

        for _ in pairs(Tilemap) do
            sizeTable = sizeTable + 1
        end

        if y + 1 <= sizeTable and  y + 1 > 0 then
            if Tilemap[y + 1][x] ~= 1 then
                self.y = self.y + self.speed
            end 
        else
            self.y = self.y + self.speed        
        end
        
        self.rotation = math.pi * 0.5
    end
    entity.left = function (self)
        local x = (self.x-32)/64 + 1
        local y = (self.y-32)/64 + 1
        local sizeTable = 0

        for _ in pairs(Tilemap) do
            sizeTable = sizeTable + 1
        end

        if y <= sizeTable and y > 0 and x - 1 > 0 then
            if Tilemap[y][x - 1] ~= 1 then
                self.x = self.x - self.speed
            end
        else
            if x - 1 > 0 then
                self.x = self.x - self.speed 
            end
        end
        self.rotation = math.pi * 1
    end
    entity.right = function (self)
        local x = (self.x-32)/64 + 1
        local y = (self.y-32)/64 + 1
        local sizeTable = 0

        for _ in pairs(Tilemap) do
            sizeTable = sizeTable + 1
        end

        if y <= sizeTable and  y > 0 and x > 0 then
            if Tilemap[y][x + 1] ~= 1 then
                self.x = self.x + self.speed
            end
        else 
            if x > 0 then
                self.x = self.x + self.speed
            end
        end
        self.rotation = math.pi * 0
    end

    entity.update = function (self, dt)
        
        -- self.rotation = World.mouseEntityAngle(self)
    end

    entity.draw = function (self) 
        love.graphics.reset()
        love.graphics.setDefaultFilter('nearest', 'nearest')
        love.graphics.draw(
            self.sprite, 
            self.x, self.y, -- posição
            self.rotation,  -- rotação
            nil, nil, -- escala
            self.sprite:getWidth()/2, -- centro no eixo x
            self.sprite:getHeight()/2 -- centro no eixo y
        )
        -- love.graphics.circle('line', self.x, self.y, self.radius)
        love.graphics.reset()
    end

    return entity
end