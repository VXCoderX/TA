local love = require("love")

function _G.rgb(red, green , blue)
    
    red = red / 255
    green = green / 255
    blue = blue / 255

    return red, green, blue
end