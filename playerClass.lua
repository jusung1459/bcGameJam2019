-- Player and Son class

Player = Object:extend()
Son = Object:extend()

function Player:new()
  self.image = love.graphics.newImage( "/art/whale.png" )
  self.x = 300
  self.y = 20
  self.speed = 500
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
end

function Player:draw()
  love.graphics.draw( self.image, self.x, self.y )
end

function Son:new()
  self.image = love.graphics.newImage("art/penguin.png")
  self.x = 300
  self.y = 40
  self.speed = 500
end

function Son:update(dt)
  if love.keyboard.isDown( "down" ) then
    self.y = self.y + self.speed * dt
  elseif love.keyboard.isDown( "up" ) then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown( "left" ) then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown( "right" ) then
    self.x = self.x + self.speed * dt
  end
end

function Son:draw()
  love.graphics.draw( self.image, self.x, self.y )
end
