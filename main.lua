-- xenon remake
local utils         = require("modules.utils")
local player        = require("modules.player")
local enemies       = require("modules.enemies")
local bullets       = require("modules.bullets")
local background    = require("modules.background")
local audio         = require("modules.audio")
local ui            = require("modules.ui")
local pickups       = require("modules.pickups")

local gamestate     = require("hump.gamestate")

function love.load(arg)
    love.window.setTitle("Xenon 5.0 -- a remake")
    love.graphics.setDefaultFilter('nearest', 'nearest')

    player.init()
    enemies.init()
    bullets.init()
    background.init()
    audio.init()
    ui.init()
    pickups.init()

end


function love.update(dt)
    background.move(dt)
    enemies.create(dt)
    enemies.move(dt, bullets.bulletTable, player)
    player.move()

    -- quite game
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

end
