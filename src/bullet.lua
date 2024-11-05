function _G.newBullet(_x, _y, targetX, targetY)
    local bullet = class()

    local angle = math.atan2(targetY - _y, targetX - _x)

    local speed = 300  
    local dx = math.cos(angle) * speed
    local dy = math.sin(angle) * speed

    bullet:set {
        x = _x,
        y = _y,
        dx = dx,
        dy = dy,
        width = 35,
        height = 10,
        angle = angle
    }


    function bullet:update(dt)
        bullet.x = bullet.x + bullet.dx * dt
        bullet.y = bullet.y + bullet.dy * dt
    end

    return bullet
end
