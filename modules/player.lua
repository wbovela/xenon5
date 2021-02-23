local player = {}

local canShoot = true
local canShootTimerMax = 0.2
local canShootTimer = canShootTimerMax

local speed = 150
local playerImg = love.graphics.newImage('Sprites/XenonShip.png')

local animExplosion = false

function player.init()
    player.isAlive = true
    player.score = 0
    player.img = love.graphics.newImage('Sprites/XenonShip.png')
    player.x = 200
    player.y = 400
end

function player.move()

end

return player
