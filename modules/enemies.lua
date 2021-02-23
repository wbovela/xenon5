local enemies = {}

local baddySpin = {
    type = 1,
    x=200,
    y=400,
    width= 30,
    height = 30,
    speed = 150,
    img = nil
}

local snake = {
    type = 2,
    Snake_y = 0,
    Snake_x = -180,
    Snake_w = 30,
    Snake_h = 30,
    xdirection = 1,
    ydirection = 1
}

type1 = {
    type = 3,
    img = love.graphics.newImage('Sprites/Type2.png'),
    tx = -10,
    ty = -10,
    tw = 30,
    th = 30,
    tsp= 50,
    thp= 5
}

function enemies.init()
  enemies.createEnemyTimerMax = 0.4
  enemies.createEnemyTimer = createEnemyTimerMax
  enemies.enemyImg = nil-- Like other images we'll pull this in during our love.load function
  enemies.objects = {}

  enemies.baddyScroll = 0
  enemies.baddy_Scroll_Speed = 40
  enemies.baddyLoop = 600

  enemies.animExplosion = false
  enemies.animPowerUp = false
end

function enemies.move()

end

return enemies
