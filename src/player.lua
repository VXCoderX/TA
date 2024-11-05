local love = require("love")

_G.playerObj = class()

function playerObj:init()
    playerObj:set {
        x = 300,
        y = 300,
        width = 50,
        height = 50,
        speed = 350,
        angle = 0 -- Add an angle property to store the rotation angle
    }
end

function playerObj:update(dt)
    _G.isUp = love.keyboard.isDown(game.controls.up)
    _G.isDown = love.keyboard.isDown(game.controls.down)
    _G.isLeft = love.keyboard.isDown(game.controls.left)
    _G.isRight = love.keyboard.isDown(game.controls.right)

    if isUp then
        playerObj.y = playerObj.y - playerObj.speed * dt
    elseif isDown then
        playerObj.y = playerObj.y + playerObj.speed * dt
    elseif isLeft then
        playerObj.x = playerObj.x - playerObj.speed * dt
    elseif isRight then
        playerObj.x = playerObj.x + playerObj.speed * dt
    end

    local mouseX, mouseY = love.mouse.getPosition()
    local playerCenterX = playerObj.x + playerObj.width / 2
    local playerCenterY = playerObj.y + playerObj.height / 2
    playerObj.angle = math.atan2(mouseY - playerCenterY, mouseX - playerCenterX)
end

function playerObj:draw()
    love.graphics.push()
    love.graphics.translate(playerObj.x + playerObj.width / 2, playerObj.y + playerObj.height / 2)
    love.graphics.rotate(playerObj.angle)
    love.graphics.rectangle('fill', -playerObj.width / 2, -playerObj.height / 2, playerObj.width, playerObj.height)
    love.graphics.pop()
end
