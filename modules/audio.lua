local audio = {}

function audio.init()
    audio.music = love.audio.newSource("Audio/XenonMusic.wav","static")
    audio.gunSound = love.audio.newSource("Audio/LazerBlast.wav", "static")
    audio.explosionSound = love.audio.newSource("Audio/Eplosion.wav", "static")

    music:setVolume(0.3)
    music:setLooping(true)
    music:play()     
end

return audio
