local utils = require("modules.utils")

local ui = {}

function ui.init()
    ui.animUi = utils.newAnimation(love.graphics.newImage("Sprites/DashText.png"), 30, 30)
    ui.animSin = utils.newAnimation(love.graphics.newImage("Sprites/SingW.png"), 30, 30)
    ui.UIImg = love.graphics.newImage('Sprites/AnimCockpit.png')
end

return ui
