Object = require('libraries/classic/classic')

Volcano = Object:extend()
count = 0
cross = love.graphics.newImage("/art/greenv.png")
stop = love.graphics.newImage("/art/redv.png")
whichimg = cross

function Volcano:new()
  self.image = whichimg
  self.x = 280
  self.y = 0
  self.halt = false
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Volcano:update(dt)
  count = count + 0.025
  if count > 3 then
    if whichimg == stop then
      whichimg = cross
      self.halt = false
    else
      whichimg = stop
      self.halt = true 
    end
    count = 0
  end
end

function Volcano:draw()
  love.graphics.draw(whichimg, self.x, self.y)
end
