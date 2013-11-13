--[[

DINGOO nlove Buttons
====================
D-pad up            KEY_UP
D-pad down          KEY_DOWN
D-pad left          KEY_LEFT
D-pad right         KEY_RIGHT
A button            KEY_LEFTCTRL
B button            KEY_LEFTALT
X button            KEY_SPACE
Y button            KEY_LEFTSHIFT
Left shoulder       KEY_TAB
Right shoulder      KEY_BACKSPACE
START button        KEY_ENTER
SELECT button       KEY_ESC
POWER UP button HOLD KEY_PAUSE

--]]

dingoo = {}


dingoo.DU = function() return love.keyboard.isDown("up") end
dingoo.DR = function() return love.keyboard.isDown("right") end
dingoo.DD = function() return love.keyboard.isDown("down") end
dingoo.DL = function() return love.keyboard.isDown("left") end

dingoo.A = function() return love.keyboard.isDown("lctrl") end
dingoo.B = function() return love.keyboard.isDown("lalt") end
dingoo.X = function() return love.keyboard.isDown(" ") end
dingoo.Y = function() return love.keyboard.isDown("lshift") end

dingoo.BL = function() return love.keyboard.isDown("tab") end
dingoo.BR = function() return love.keyboard.isDown("backspace") end

dingoo.start = function() return love.keyboard.isDown("return") end
dingoo.select = function() return love.keyboard.isDown("escape") end

dingoo.lock = function() return love.keyboard.isDown("pause") end


return dingoo
