local player = {}


function player.init()
  player.isAlive = true
  player.score = 0
  player.canShoot = true
  player.canShootTimerMax = 0.2
  player.canShootTimer = canShootTimerMax

  player.x = 200
  player.y = 400
  player.speed = 150
  player.img = nil

  player.animExplosion = false
end

function player.move()

end

return player
