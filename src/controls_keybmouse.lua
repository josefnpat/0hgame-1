keybmouse = {}

keybmouse.DU = function() return love.keyboard.isDown("w") end
keybmouse.DR = function() return love.keyboard.isDown("d") end
keybmouse.DD = function() return love.keyboard.isDown("s") end
keybmouse.DL = function() return love.keyboard.isDown("a") end

keybmouse.A = function() return love.keyboard.isDown("right") end
keybmouse.B = function() return love.keyboard.isDown("down") or
love.keyboard.isDown(" ")
 end
keybmouse.X = function() return love.keyboard.isDown("up") end
keybmouse.Y = function() return love.keyboard.isDown("left") end

keybmouse.BL = function() return love.keyboard.isDown("q") end
keybmouse.BR = function() return love.keyboard.isDown("e") end

keybmouse.select = function() return love.keyboard.isDown("backspace") end
keybmouse.start = function() return love.keyboard.isDown("return") end

keybmouse.lock = function() return love.keyboard.isDown("escape") end

return keybmouse
