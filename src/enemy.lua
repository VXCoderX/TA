local love = require("love")

function _G.newEnemy()
    local enemy = class()

    enemy:set {
        x = 0,
        y = 0,
        width = 30,
        height = 30
    }

    function enemy:update(dt)
        
    end

    function enemy:draw()
        love.graphics.setColor(rgb(255, 0, 0))

        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

        love.graphics.setColor(rgb(255, 255, 255))
    end

    return enemy
end