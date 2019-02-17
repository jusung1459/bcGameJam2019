Object = require('libraries/classic/classic')

Volcano = Object:extend()
count = 0
cross = love.graphics.newImage("/art/greenv.png")
stop = love.graphics.newImage("/art/redv.png")
whichimg = cross


function Volcano:new(x, y)
  self.image = whichimg
  self.x = x
  self.y = y
  self.halt = false
  walls[current_level][(self.y/40)+1][(self.x/40)+1] = 0
  self.width = self.image:getWidth()4
  self.height = self.image:getHeight()
end

function Volcano:update(dt)
  count = count + 0.025
  if count > 3 then
    if whichimg == stop then
      whichimg = cross
      self.halt = false
      walls[current_level][(self.y/40)+1][(self.x/40)+1] = 0
    else
      whichimg = stop
      self.halt = true
      walls[current_level][(self.y/40)+1][(self.x/40)+1] = 1
    end
    count = 0
  end
  return self.halt
end

function Volcano:draw()
  love.graphics.draw(whichimg, self.x, self.y)
end
