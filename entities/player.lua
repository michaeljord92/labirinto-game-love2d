local Sprite = require('sprite')
local World = require('world')

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
    entity.speed = 160
    entity.rotation = 0
    entity.radius = 25
    entity.especial = false
    entity.especial_time = 0

    entity.update = function (self, dt, upKey, downKey, leftKey, rightKey)
        
        self.rotation = World.mouseEntityAngle(self)
    
        if love.keyboard.isDown(upKey or 'w') then
            self.y = self.y - self.speed * dt
        end
        if love.keyboard.isDown(downKey or 's') then
            self.y = self.y + self.speed * dt
        end
        if love.keyboard.isDown(leftKey or 'a') then
            self.x = self.x - self.speed * dt
        end
        if love.keyboard.isDown(rightKey or 'd') then
            self.x = self.x + self.speed * dt
        end
        
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