Object = require('libraries/classic/classic')

Volcano = Object:extend()
count = 0
whichimg = cross
cross = love.graphics.newImage("/art/greenv.png")
stop = love.graphics.newImage("/art/redv.png")


function Volcano:new()
  self.x = 280
  self.y = 0
end

function Volcano:update(dt)
  count = count + 0.025
  if count > 3 then
    if whichimg == stop then
      whichimg = cross
    else whichimg = stop end
    count = 0
  end
end

function Volcano:draw()
  love.graphics.draw(whichimg, self.x, self.y)
end
