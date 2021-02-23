local audio = {}

function audio.init()
    audio.music = love.audio.newSource("Audio/XenonMusic.wav","static")
    audio.gunSound = love.audio.newSource("Audio/LazerBlast.wav", "static")
    audio.explosionSound = love.audio.newSource("Audio/Eplosion.wav", "static")

    audio.music:setVolume(0.3)
    audio.music:setLooping(true)
    audio.music:play()
end

return audio
