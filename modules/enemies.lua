local enemies = {}

local utils     = require("modules.utils")
local bullets   = require("modules.bullets")
local player    = require("modules.player")
local audio     = require("modules.audio")

local createEnemyTimerMax = 0.4
local createEnemyTimer = createEnemyTimerMax
local enemyImg = nil-- Like other images we'll pull this in during our love.load function
local enemies = {}

local animExplosion = false
local animPowerUp = false

local animation = utils.newAnimation(love.graphics.newImage("Sprites/powerup.png"), 30, 30)
local animThrust = utils.newAnimation(love.graphics.newImage("Sprites/RocketPlume.png"), 30, 30)
local animExplode = utils.newAnimation(love.graphics.newImage("Sprites/Explosion.png"), 30, 30)

local enemyImg = love.graphics.newImage('Sprites/Baddie1.png')
local enemyImg1 = love.graphics.newImage('Sprites/BaddieG1.png')

local baddySpinImg = love.graphics.newImage('Sprites/BaddySpin.png')
local alphaNil = love.graphics.newImage('Sprites/AlphaNil.png')

local randomNumber = 0

local baddySpin = {
    type = 1,
    x = 200,
    y = 400,
    width = 30,
    height = 30,
    speed = 150,
    img = nil,
    animBaddySpin = utils.newAnimation(love.graphics.newImage("Sprites/BaddySpin.png"), 30, 30),
    baddy_Scroll_Speed = 40,
    baddyLoop = 600,
    bulletCollision = false,
    score = 20
}

local snake = {
    type = 2,
    y = 0,
    x = -180,
    Snake_w = 30,
    Snake_h = 30,
    xdirection = 1,
    ydirection = 1,
    image = love.graphics.newArrayImage({"Sprites/BaddySnakeBody.png","Sprites/BaddySnake.png"}),
    bulletCollision = false,
    score = 100
}

local birdOfPrey = {
    type = 3,
    img = love.graphics.newImage('Sprites/Type2.png'),
    x = -10,
    y = -10,
    tw = 30,
    th = 30,
    tsp= 50,
    thp= 5,
    bulletCollision = false,
    score = 50
}

function enemies.init()

end

function enemies.create(dt)
    createEnemyTimer = createEnemyTimer - (0.5 * dt)
    if (createEnemyTimer < 0) then
        createEnemyTimer = createEnemyTimerMax
        -- Create an enemy
    	local randomNumber = math.random(40, love.graphics.getWidth() - 80)

        bug1 = {
            type = 4,
            x = randomNumber,
            y = -10,
            img = enemyImg,
            bulletCollision = false,
            explAnimation = utils.newAnimation(love.graphics.newImage("Sprites/Explosion.png"), 30, 30),
            score = 5
        }

        bug2 = {
            type = 4,
            x = randomNumber,
            y = -100,
            img = enemyImg1,
            bulletCollision = false,
            explAnimation = utils.newAnimation(love.graphics.newImage("Sprites/Explosion.png"), 30, 30),
            score = 5
        }

      	table.insert(enemies, bug1)
        table.insert(enemies, bug2)
    end
end

--
-- move enemies in enemy table, animate them and check for collisions
-- parameters:
--  dt = time displacement
--  bulllets = bullets.bullets table
--
function enemies.move(dt, bulletTable, player)
    -- enemy movement, animation and collision
    for enemyIndex, enemy in ipairs(enemies) do

        -- baddySpin
        if (enemy.type == 1) then
            enemy.animBaddySpin = updateAnimation(enemy.animBaddySpin, dt);
            enemy.y =
                (enemy.y + enemy.baddy_Scroll_Speed * dt) % enemy.baddyLoop
        end -- baddySpin

        -- snake
        if (enemy.type == 2) then
            enemy.y = enemy.y + 2
            if (enemy.y > 610) then
              enemy.y = - 1
            end
            enemy.x = enemy.x + ( 2 * enemy.xdirection )
             if  (enemy.x == 20) or (enemy.x < -180) then
                 enemy.xdirection = enemy.xdirection * -1
            end
        end -- snake

        -- bird of prey
        if (enemy.type == 3) then
            enemy.y = enemy.y + 1
            enemy.x = enemy.x + 1
            if (enemy.x > 400) then
              enemy.x = enemy.x - 400
              enemy.y = enemy.y + 600
            end
        end -- bird of prey

        -- normal bugs
        if (enemy.type == 4) then
            if (enemy.bulletCollision == false) then
              enemy.y = enemy.y + (200 * dt)
            else
              enemy.explAnimation = utils.updateAnimation(enemy.explAnimation, dt)
            end
            -- remove enemies when they pass off the screen
            if (enemy.y > 610) then
                table.remove(enemies, enemyIndex)
            end
        end -- normal bugs

        -- check each enemy for collision with a bullet
        for bulletIndex, bullet in ipairs(bulletTable) do
   		    if utils.CheckCollision(enemy.x, enemy.y, enemy.img:getWidth(), enemy.img:getHeight(),
                bullet.x, bullet.y, bullet.img:getWidth(), bullet.img:getHeight()) then
   	                table.remove(bullets, bulletIndex)
   	                player.score = player.score + enemy.score
                    audio.explosionSound:play()
                    enemy.bulletCollision = true
            end
        end -- bullet loop

        if utils.CheckCollision(enemy.x, enemy.y, enemy.img:getWidth(), enemy.img:getHeight(),
            player.x, player.y, player.img:getWidth(), player.img:getHeight()) and player.isAlive then
        		table.remove(enemies, i)
        		player.isAlive = false
                audio.explosionSound:play()
          end

    end -- enemy loop
end

return enemies
