local bullets = {}

local bulletImg = nil

local bulletCollision = false
local bulletImg = love.graphics.newImage('Sprites/Bolt.png')

function bullets.init()
    bullets.bulletTable = {} -- array of current bullets being drawn and updated
end

return bullets
