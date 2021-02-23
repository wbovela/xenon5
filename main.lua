-- xenon remake
local utils = require("modules.utils")
local player = require("modules.player")
local enemies = require("modules.enemies")
local bullets = require("modules.bullets")
local background = require("modules.background")
local audio = require("modules.audio")

function love.load(arg)
    love.window.setTitle("Xenon 5.0 -- a remake")
    love.graphics.setDefaultFilter('nearest', 'nearest')

    player.init()
    enemies.init()
    bullets.init()
    background.init()
    audio.init()

end


function love.update(dt)
  enemies.move()
  player.move()

end
