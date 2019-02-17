Object = require('libraries/classic/classic')

Key = Object:extend()
local obtainedKey = love.graphics.newImage("art/obtainedKey.png")

function Key:new(x, y)
  self.image = love.graphics.newImage("art/key.png")
  self.x = x
  self.y = y
  self.halt = false
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  walls[current_level][(self.y/40)+1][(self.x/40)+1] = 3
end

function Key:update(dt)
  if walls[current_level][(self.y/40)+1][(self.x/40)+1] == 0 then
    self.halt = true
  end
end

function Key:draw()
    if self.halt == false then 
        love.graphics.draw(self.image, self.x, self.y)
    else love.graphics.draw(obtainedKey, self.x, self.y)
    end
end