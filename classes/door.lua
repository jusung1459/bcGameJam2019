Object = require('libraries/classic/classic')
require 'classes/pressure_plate'

Door = Object:extend()
local close = love.graphics.newImage('art/gate.png')
local open = love.graphics.newImage('art/open_gate.png')


function Door:new(x, y, px, py)
  self.image = close
  self.x = x
  self.y = y
  self.px = px
  self.py = py
  self.open = false
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  plate = Plate(self.px, self.py)
end

function Door:update(dt)
    plate:update(dt)
  if plate:check() == true then
    walls[current_level][(self.y/40)+1][(self.x/40)+1] = 0
    self.image = open
  else 
    walls[current_level][(self.y/40)+1][(self.x/40)+1] = 1
    self.image = close
  end
end

function Door:draw()
    plate:draw()
    love.graphics.draw(self.image, self.x, self.y)
end