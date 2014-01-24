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

dingoo.DU = function() return love.mouse.isDown("l") end
dingoo.DR = function() return love.mouse.isDown("l") end
dingoo.DD = function() return love.mouse.isDown("l") end
dingoo.DL = function() return love.mouse.isDown("l") end

dingoo.A = function() return love.mouse.isDown("l") end
dingoo.B = function() return love.mouse.isDown("l") end
dingoo.X = function() return love.mouse.isDown("l") end
dingoo.Y = function() return love.mouse.isDown("l") end

dingoo.BL = function() return love.mouse.isDown("l") end
dingoo.BR = function() return love.mouse.isDown("l") end

dingoo.start = function() return false end
dingoo.select = function() return false end

dingoo.lock = function() return false end

return dingoo
