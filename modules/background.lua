local background = {}

function background.init()
    --space
    background.background = love.graphics.newImage('Sprites/space_1200.png')
    background.backgroundScroll = 0
    background.BACKGROUND_SCROLL_SPEED = 30
    background.BACKGROUND_LOOP = 595
    --wall
    background.ground = love.graphics.newImage('Sprites/Xenon_wall1200.png')
    background.groundScroll = 0
    background.GROUND_SCROLL_SPEED = 60
end

return background
