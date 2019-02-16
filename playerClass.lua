-- Player and Son class

Player = Object:extend()
Son = Player:extend()

local window_width = love.graphics.getWidth()
local window_height = love.graphics.getHeight()

function Player:new()
  self.image = love.graphics.newImage( "/art/whale.png" )
  self.x = 300
  self.y = 20
  self.speed = 500
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Player:update(dt)

  if love.keyboard.isDown( "down" ) then
    self.y = self.y + self.speed * dt
  elseif love.keyboard.isDown( "up" ) then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown( "left" ) then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown( "right" ) then
    self.x = self.x + self.speed * dt
  end

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

function Son:new()
  self.image = love.graphics.newImage("art/penguin.png")
  self.x = 300
  self.y = 40
  self.speed = 500
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end
