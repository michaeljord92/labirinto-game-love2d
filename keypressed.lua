local States = require('states')
local World = require('world')


local key_map = {
    -- Dar player no jogo ou atira
    space = function ()

        -- Dar player no jogo
        if World.state == "pause" then
            World.state = "play"
        
        -- Reinicia o jogo
        elseif World.state == "failed" then
            World.state = "start"
        
        -- Inicia o jogo
        elseif  World.state == "start" then            
            World.state = "play"
        end

    end,
    
    -- Pausa ou sai do jogo
    escape = function ()
        -- Pausa o jogo 
        if World.state == "play" then
            World.state = "pause"
        
        -- Sai do jogo
        else
            States.sair()
        end
    end,
}

return key_map