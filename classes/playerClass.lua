-- Player and Son class
Player = Object:extend()
Son = Object:extend()


local window_width = love.graphics.getWidth()
local window_height = love.graphics.getHeight()

--create a new player
function Player:new()
  self.image = love.graphics.newImage( "/art/whale.png" )
  self.x = 40
  self.y = 0
  self.speed = 500
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

--check the boundaries
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

--draw the player
function Player:draw()
  love.graphics.draw( self.image, self.x, self.y )
end

--move character+son
function Player:keypressed(key, son)
  if key == "a" then
    self.x = 200
    self.y = 200
  end
  if key == "up" then
    son.y = self.y
    son.x = self.x
    self.y = self.y - 40

  end
  if key == "down" then
    son.y = self.y
    son.x = self.x
    self.y = self.y + 40
  end
  if key == "left" then
    son.y = self.y
    son.x = self.x
    self.x = self.x - 40
  end
  if key == "right" then
    son.y = self.y
    son.x = self.x
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
  if self.x < 0 then Son.x = 0
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
  end
  if self.y  < 0 then self.y = 0
  elseif self.y + self.height > window_height then
    self.y  = window_height - self.height
  end

  
end

function Son:draw()
  love.graphics.draw( self.image, self.x, self.y )
end

