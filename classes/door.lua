Object = require('libraries/classic/classic')
require 'classes/pressure_plate'

Door = Object:extend()

function Door:new(x, y, px, py)
  self.image = love.graphics.newImage('art/pressure_plate.png')
  self.x = x
  self.y = y
  self.px = px
  self.py = py
  self.open = false
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Door:check()
end

function Door:update(dt)
  if walls[current_level][(self.y/40)+1][(self.x/40)+1] == -1 then
    self.occupied = true
  else self.occupied = false end
end

function Door:draw()
    love.graphics.draw(self.iamge, self.x, self.y)
end