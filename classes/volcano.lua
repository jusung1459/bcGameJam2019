Object = require('libraries/classic/classic')

Volcano = Object:extend()
count = 0
cross = love.graphics.newImage("/art/greenv.png")
stop = love.graphics.newImage("/art/redv.png")

function Volcano:new()
  self.x = 0
  self.y = 0
end

function Volcano:update(dt)
  count = count + 0.05
  if count > 3 then
    if whichimg == stop then
      whichimg = cross
    else whichimg = stop end
    count = 0
  end
end

function Volcano:draw()
  love.graphics.draw(whichimg, x, y)
end
