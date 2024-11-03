local love = require('love')
require("libs.classLIB.class")
require("src.player")

_G.game = {
    name = "Tonys Adventure",
    version = "0.0.1",

    width = 1024,
    height = 576,

    fonts = {
        def = love.graphics.newFont(8),
        med = love.graphics.newFont(16),
        big = love.graphics.newFont(24)
    }
}

_G.mouse = {
    x = 0,
    y = 0,
    radius = 15
}

function love.load()
    love.window.setTitle(game.name .. " V" .. game.version)
    love.window.setMode(game.width, game.height, 
    {
        fullscreen = false,
        vsync = true,
    })

end

function love.update(dt)
    mouse.x, mouse.y = love.mouse.getPosition()
    love.mouse.setVisible(false)
end

function love.draw()
    
    love.graphics.circle("fill", mouse.x, mouse.y, mouse.radius)

    love.graphics.setFont(game.fonts.big)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 7.5, 7.5)

end