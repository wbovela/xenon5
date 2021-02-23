local bullets = {}

function bullets.init()
    bullets.bulletImg = nil
    bullets.bullets = {} -- array of current bullets being drawn and updated
    bullets.bulletCollision = false
end

return bullets
