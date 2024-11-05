local love = require('love')
require("libs.class")
require("src.player")
require("src.utils.utils")
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

_G.mouse = {
    x = 0,
    y = 0
}


function love.load()
    love.window.setTitle(game.name .. " V" .. game.version)
    love.window.setMode(game.width, game.height,
        {
            fullscreen = false,
            vsync = true,
        })

    player:init()

    function love.keypressed(key)
        if key == "escape" then
            print("IT WEORKD")
            love.mouse.setGrabbed(false)
        end
    end
    love.mouse.setGrabbed(true)
end

function love.update(dt)
    player:update(dt)

    love.mouse.setVisible(false)

    for i, bullet in ipairs(bullets) do
        bullet:update(dt)
    end

    mouse.x, mouse.y = love.mouse.getPosition()

end

function love.draw()
    player:draw()

    for i, bullet in ipairs(bullets) do
        love.graphics.push()

        love.graphics.translate(bullet.x, bullet.y)

        love.graphics.rotate(bullet.angle)

        love.graphics.setColor(rgb(52, 180, 235))
        love.graphics.rectangle("fill",0, 0, bullet.width, bullet.height)

        love.graphics.setColor(1,1, 1)
        love.graphics.pop()
    end

    love.graphics.circle("line", mouse.x, mouse.y, 10)

    love.graphics.setFont(game.fonts.big)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 7.5, 7.5)
end

function spawnBullet()
    table.insert(bullets, 1, newBullet(playerObj.x + playerObj.width / 2, playerObj.y + playerObj.height / 2, love.mouse.getX(), love.mouse.getY()))
end

function love.mousepressed(x, y, button)
    if button == 1 then
        spawnBullet()

        love.mouse.setGrabbed(true)

    end
end

function love.keypressed(key)
    if key == "escape" then
        print("IT WEORKD")
        love.mouse.setGrabbed(false)
    end
end