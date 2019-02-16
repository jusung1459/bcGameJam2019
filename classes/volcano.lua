Object = require('libraries/classic/classic')

Volcano = Object:extend()
count = 0
whichimg = cross
cross = love.graphics.newImage("/art/greenv.png")
stop = love.graphics.newImage("/art/redv.png")
whichimg = cross


function Volcano:new()
  self.image = whichimg
  self.x = 280
  self.y = 0
  self.stop = false
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Volcano:update(dt)
  count = count + 0.025
  if count > 3 then
    if whichimg == stop then
      self.stop = false
      whichimg = cross
    else
      self.stop = true
      whichimg = stop
    end
    count = 0
  end
  return self.stop
end

function Volcano:draw()
  love.graphics.draw(whichimg, self.x, self.y)
end
