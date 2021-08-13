-- Programa: Aula 5.0 a 5.4 - tilemaps, tilesets e animação
-- Autor: Michael Jordan S Chagas
-- Curso: Ciência da Computação - UFMT-CUA
-- Disclina: Design e Programação de Games (Opt)
-- Docente: Maxwell Silva Carmo
-- Data: 2021-08-05
-- Update: 2021-08-06
-- 
-- Este programa simula um jogo de labirinto.
-- Os comandos e controles do atirador são:
--      - mover para cima:      'w'
--      - mover para baixo:     's'
--      - mover para esquerda:  'a'
--      - mover para direita:   'd'
-------------------------------------------------------

local Display = require('display')
local World = require('world')
local States = require('states')
local Keypressed = require('keypressed')


function love.load()
    math.randomseed(os.time())

    -- Display:fullscreen()
    love.window.setMode(Display.width, Display.height, {
        fullscreen = Display.isFullScreen,
        resizable = true
    })
end

function love.update(dt)
    if States[World.state] then
        States[World.state].update(dt) 
    end

    fps = love.timer.getFPS()
end

function love.draw()
    if States[World.state] then
        States[World.state].draw() 
    end
    
    -- love.graphics.print('FPS: ' .. fps, 10, 12)
end

function love.keypressed(key)
    if Keypressed[key] then
        Keypressed[key]()
    end
end