local love = require('love')
require("libs.class")
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

--[[
# SUMMARY (IN PLAIN-ENGLISH)

Congratulations, you’ve got something with the best licence ever.

Basically, you’re free to do what you want with it; as long as you do something good (help someone out, smile; just be nice), you can use this on anything you fancy.

Of course, if it all breaks, it’s totally not the author’s fault.
Enjoy!


# THE FULL LICENSE AGREEMENT

By attaching this document to the given files (the “work”), you, the licensee, are hereby granted free usage in both personal and commerical environments, without any obligation of attribution or payment (monetary or otherwise). The licensee is free to use, copy, modify, publish, distribute, sublicence, and/or merchandise the work, subject to the licensee inflecting a positive message unto someone. This includes (but is not limited to): smiling, being nice, saying “thank you”, assisting other persons, or any similar actions percolating the given concept.

The above copyright notice serves as a permissions notice also, and may optionally be included in copies or portions of the work.

The work is provided “as is”, without warranty or support, express or implied. The author(s) are not liable for any damages, misuse, or other claim, whether from or as a consequence of usage of the given work.

]]--