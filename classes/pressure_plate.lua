Object = require('libraries/classic/classic')

Plate = Object:extend()

function Plate:new(x, y)
  self.image = love.graphics.newImage('art/pressure_plate.png')
  self.x = x
  self.y = y
  self.occupied = false
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] == -1 then self.occupied = true end
end

function Plate:check()
  return self.occupied
end

function Plate:update(dt)
  if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] == -1 then
    self.occupied = true
  else self.occupied = false end
end

function Plate:draw()
    love.graphics.draw(self.image, self.x, self.y)
end
