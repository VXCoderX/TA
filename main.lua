local love = require('love')
require("libs.class")
require("src.player")
require("src.utils.utils")
Camera = require("libs.camera")
Bullet = require("src.bullet")

_G.player = playerObj
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

    camera = Camera(player.x, player.y)
    love.mouse.setGrabbed(true)
end

function love.update(dt)
    player:update(dt)

    camera:lookAt(player.x, player.y)
    love.mouse.setVisible(false)

    for i, bullet in ipairs(bullets) do
        bullet:update(dt)
    end

    mouse.x, mouse.y = love.mouse.getPosition()
end

function love.draw()
    -- Attach the camera, this will apply camera transformations
    camera:attach()

    -- Draw the player (camera will handle the position based on player's world coordinates)
    player:draw()

    -- Draw each bullet (camera will handle positioning, no need for manual translation)
    for i, bullet in ipairs(bullets) do
        love.graphics.push()  -- Use push/pop if you want to apply local transformations for rotation
        love.graphics.translate(bullet.x, bullet.y)  -- This is okay since it's relative to the bullet's position
        love.graphics.rotate(bullet.angle)  -- Rotate around the bullet's center

        love.graphics.setColor(rgb(52, 180, 235))
        love.graphics.rectangle("fill", 0, 0, bullet.width, bullet.height)
        love.graphics.setColor(1, 1, 1)

        love.graphics.pop()  -- Reset the transformations after drawing the bullet
    end

    -- Detach the camera to return to the original transformation state
    camera:detach()

    -- Draw the mouse cursor and FPS
    love.graphics.circle("line", mouse.x, mouse.y, 10)
    love.graphics.setFont(game.fonts.big)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 7.5, 7.5)
end


function spawnBullet()
    local bulletDistance = 50 -- Distance from the player where the bullet spawns
    local playerCenterX = playerObj.x + playerObj.width / 2
    local playerCenterY = playerObj.y + playerObj.height / 2
    local mouseX, mouseY = love.mouse.getX(), love.mouse.getY()

    -- Calculate direction vector from player to mouse
    local directionX = mouseX - playerCenterX
    local directionY = mouseY - playerCenterY

    -- Normalize the direction vector
    local length = math.sqrt(directionX * directionX + directionY * directionY)
    local normalizedX = directionX / length
    local normalizedY = directionY / length

    -- Calculate bullet spawn position
    local bulletX = playerCenterX + normalizedX * bulletDistance
    local bulletY = playerCenterY + normalizedY * bulletDistance

    table.insert(bullets, 1, newBullet(bulletX, bulletY, mouseX, mouseY))
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
