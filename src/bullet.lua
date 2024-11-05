local love = require("love")

function _G.newBullet(_x, _y, targetX, targetY)
    local bullet = class()

    local angle = math.atan2(targetY - _y, targetX - _x)
    local speed = 300

    bullet:set {
        x = _x,
        y = _y,
        dx = math.cos(angle) * speed,
        dy = math.sin(angle) * speed,
        width = 20,
        height = 10,
        angle = angle
    }

    function bullet:update(dt)
        bullet.x = bullet.x + bullet.dx * dt
        bullet.y = bullet.y + bullet.dy * dt
    end

    return bullet
end
