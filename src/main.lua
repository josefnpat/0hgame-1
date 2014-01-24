love.mouse.setVisible(false)

c = love.audio.newSource("198896__bone666138__8-bit-circus-music.wav")
c:setLooping(true)
c:play()

f = love.graphics.newFont("SigmarOne.ttf",16)
love.graphics.setFont(f)
using_nlove = debug.getregistry()["love.graphics.sdl"] ~= nil

if love.system and love.system.getOS and love.system.getOS() == "Android" then
  controls = require("../controls_android")
elseif using_nlove then
  controls = require("../controls_dingoo")
else
  controls = require("../controls_keybmouse")
end

colors = {}
colors.on = {255,0,0}
colors.off = {63,63,63}
colors.reset = {255,255,255}

w = love.graphics.getWidth()
h = love.graphics.getHeight()

scale = {
  x = w/320,
  y = h/240
}

say = {
  "Whatcha' lookin at?",
  "What's sexy about poop?",
  "Oh god, what the hell?",
  "I'm leaving you.",
  "I've never heard of this fetish.",
  "No more internet for you.",
  "I'm not doing that...",
}

images = {"bg","closed","dudeanddoor","girl","notsafe1","open","safe"}
im = {}

for i,v in pairs(images) do
  im[v] = love.graphics.newImage(v..".png")
end

open_time = 1 + 0.05

tclosed = function() return math.random(2,4) end
topen = function()
  open_time = open_time - 0.05 
  if open_time <= 0.05 then
    open_time = 0.05
  end
  return open_time
end
tcheck = function() return math.random(1,3) end

closed_dt = tclosed()
open_dt = 0
check_dt = 0

score = 0
hiscore = 0

function love.update(dt)

  if controls.select() or controls.lock() then
    if love._version == 70 then
      love.event.push("q")
    else
      love.event.quit()
    end
  end

  if lost then
    lost = lost - dt
    if lost < 0 and watching_porn() then
      lost = nil
      closed_dt = tclosed()
      open_dt = 0
      check_dt = 0
      if score > hiscore then
        hiscore = score
      end
      score = 0
      open_time = 1 + 0.05
    end
  else

    if watching_porn() then
      score = score + dt*100
    end

    if closed_dt > 0 then
      closed_dt = closed_dt - dt
      if closed_dt <= 0 then
        closed_dt = 0
        open_dt = topen()
      end
    end

    if open_dt > 0 then
      open_dt = open_dt - dt
      if open_dt <= 0 then
        open_dt = 0
        check_dt = tcheck()
      end
    end

    if check_dt > 0 then
      check_dt = check_dt - dt
      if check_dt <= 0 then
        check_dt = 0
        closed_dt = tclosed()
      end

      if watching_porn() then
        lost = 2
lost_say = say[math.random(1,#say)]
      end


    end

  end

end

function love.draw()

  love.graphics.push()
  love.graphics.scale(scale.x,scale.y)

  love.graphics.draw(im["bg"])

  if watching_porn() or lost then
    love.graphics.draw(im["notsafe1"])
  else
    love.graphics.draw(im["safe"])
  end

  love.graphics.draw(im["dudeanddoor"])

  if closed_dt > 0 then
    love.graphics.draw(im["closed"])
  elseif open_dt > 0 then
    love.graphics.draw(im["open"])
  elseif check_dt > 0 then
    love.graphics.draw(im["open"])
    love.graphics.draw(im["girl"])
  end

if lost then
  love.graphics.setColor(0,0,0,191)
  love.graphics.rectangle("fill",0,0,320,240)
  love.graphics.setColor(colors.reset)
  love.graphics.printf(lost_say.."\n\nYOU LOSE.\nScore: "..math.floor(score).."\nHigh Score: "..math.floor(hiscore).."\nBY @josefnpat and @Amanda_Gibbs18 ",0,30,320,"center")
else
  love.graphics.printf(math.floor(score).." POINTS",0,8,320,"center")
end

--  draw_controls()
  love.graphics.pop()

end

function watching_porn()
  if controls.B() then
    return true
  end
end

function draw_controls()
  if not controls.lock() then love.graphics.print("lock",0,0) end

  if not controls.DU() then love.graphics.print("DU"    ,w*2/7,h*1/5) end
  if not controls.DR() then love.graphics.print("DR"    ,w*3/7,h*2/5) end
  if not controls.DD() then love.graphics.print("DD"    ,w*2/7,h*3/5) end
  if not controls.DL() then love.graphics.print("DL"    ,w*1/7,h*2/5) end

  if not controls.A() then love.graphics.print("A"     ,w*6/7,h*2/5) end
  if not controls.B() then love.graphics.print("B"     ,w*5/7,h*3/5) end
  if not controls.X() then love.graphics.print("X"     ,w*5/7,h*1/5) end
  if not controls.Y() then love.graphics.print("Y"     ,w*4/7,h*2/5) end

  if not controls.select() then love.graphics.print("select",w*2/7,h*4/5) end
  if not controls.start() then love.graphics.print("start" ,w*5/7,h*4/5) end

  if not controls.BL() then love.graphics.print("BL"    ,w*2/7,0) end
  if not controls.BR() then love.graphics.print("BR"    ,w*5/7,0) end

end
