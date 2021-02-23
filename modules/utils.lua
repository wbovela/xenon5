local utils = {}

function utils.CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
    x2 < x1+w1 and
    y1 < y2+h2 and
    y2 < y1+h1
end

function utils.newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
    animation.duration = duration or 1
    animation.currentTime = 0
    animation.done = false
    return animation
end

function utils.updateAnimation(animation, dt)
  animation.currentTime = animation.currentTime + dt
  if animation.currentTime >= animation.duration then
    animation.currentTime = animation.currentTime - animation.duration
  end
  return animation
end

return utils
