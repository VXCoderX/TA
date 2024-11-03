local love = require("love")

_G.playerObj = class()

function playerObj:init()
    playerObj:set {
        x = 300,
        y = 300,
        width = 25,
        height = 25,
        speed = 350
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
end

function playerObj:draw()
    love.graphics.rectangle('fill', playerObj.x, playerObj.y, playerObj.width, playerObj.height)
end
