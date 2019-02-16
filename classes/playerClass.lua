-- Player and Son class
require "/classes/queue"
Player = Object:extend()
Son = Object:extend()

local window_width = love.graphics.getWidth()
local window_height = love.graphics.getHeight()

function Player:new()
  self.image = love.graphics.newImage( "/art/whale.png" )
  self.x = 40
  self.y = 0
  self.speed = 500
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Player:update(dt)
  if self.x < 0 then self.x = 0
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
  end
  if self.y < 0 then self.y = 0
  elseif self.y + self.height > window_height then
    self.y = window_height - self.height
  end

end

function Player:draw()
  love.graphics.draw( self.image, self.x, self.y )
end

function Player:keypressed(key)
  if key == "a" then
    self.x = 200
    self.y = 200
  end
  if key == "up" then
    self.y = self.y - 40
  end
  if key == "down" then
    self.y = self.y + 40
  end
  if key == "left" then
    self.x = self.x - 40
  end
  if key == "right" then
    self.x = self.x + 40
  end
end



function Son:new()
  self.image = love.graphics.newImage("art/penguin.png")
  self.x = 0
  self.y = 0
  self.speed = 500
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Son:update(dt)
  if self.x < 0 then self.x = 0
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
  end
  if self.y < 0 then self.y = 0
  elseif self.y + self.height > window_height then
    self.y = window_height - self.height
  end

end

function Son:draw()
  love.graphics.draw( self.image, self.x, self.y )
end

function Son:keypressed(key)
  if key == "a" then
    self.x = 200
    self.y = 200
  end
  if key == "up" then
    self.y = self.y - 40
  end
  if key == "down" then
    self.y = self.y + 40
  end
  if key == "left" then
    self.x = self.x - 40
  end
  if key == "right" then
    self.x = self.x + 40
  end
end
