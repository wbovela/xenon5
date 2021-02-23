local background = {}

--space
local backgroundImg = love.graphics.newImage('Sprites/space_1200.png')
local backgroundScroll = 0
local BACKGROUND_SCROLL_SPEED = 30
local BACKGROUND_LOOP = 595
--wall
local ground = love.graphics.newImage('Sprites/Xenon_wall1200.png')
local groundScroll = 0
local GROUND_SCROLL_SPEED = 60

function background.init()

end

function background.move(dt)
    backgroundScroll =
        (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOP
    groundScroll =
        (groundScroll + GROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOP
end

return background
