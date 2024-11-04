local love = require('love')
require("libs.classLIB.class")
require("src.player")
Bullet = require("src.bullet")

_G.player = playerObj()
_G.bullets = {}

_G.game = {
    name = "Tonys Adventure",
    version = "0.0.1",

    width = 1024,
    height = 576,

    fonts = {
        def = love.graphics.newFont(8),
        med = love.graphics.newFont(16),
        big = love.graphics.newFont(24)
    },

    controls = {
        up = "w",
        down = "s",
        left = "a",
        right = "d"
    }
}


function love.load()
    love.window.setTitle(game.name .. " V" .. game.version)
    love.window.setMode(game.width, game.height,
        {
            fullscreen = false,
            vsync = true,
        })

    player:init()

end

function love.update(dt)
    player:update(dt)

    love.mouse.setVisible(false)

    for i, bullet in ipairs(bullets) do
        bullet:update(dt)
    end

    if love.mouse.isDown('1') then

    end

end

function love.draw()
    player:draw()

    for i, bullet in ipairs(bullets) do
        love.graphics.push()

        love.graphics.translate(bullet.x, bullet.y)

        love.graphics.rotate(bullet.angle)

        love.graphics.rectangle("fill",-bullet.width/2,-bullet.height/2, bullet.width, bullet.height)

        love.graphics.pop()
    end

    love.graphics.setFont(game.fonts.big)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 7.5, 7.5)
end

function spawnBullet()
    table.insert(bullets, 1, newBullet(playerObj.x, playerObj.y, love.mouse.getX(), love.mouse.getY()))
end

function love.mousepressed(x, y, button)
    if button == 1 then
        spawnBullet()
    end
end