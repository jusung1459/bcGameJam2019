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
<<<<<<< Updated upstream
  if love.keyboard.isDown( "down" ) then
    self.y = self.y + self.speed * dt
  elseif love.keyboard.isDown( "up" ) then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown( "left" ) then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown( "right" ) then
    self.x = self.x + self.speed * dt
  end
=======
  -- if love.keyboard.isDown( "down" ) then
  --   self.y = self.y + self.speed * dt
  -- elseif love.keyboard.isDown( "up" ) then
  --   self.y = self.y - self.speed * dt
  -- elseif love.keyboard.isDown( "left" ) then
  --   self.x = self.x - self.speed * dt
  -- elseif love.keyboard.isDown( "right" ) then
  --   self.x = self.x + self.speed * dt
  -- end
>>>>>>> Stashed changes
end

function Player:draw()
  love.graphics.draw( self.image, self.x, self.y )
end

<<<<<<< Updated upstream
=======
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
>>>>>>> Stashed changes

function Son:new()
  self.image = love.graphics.newImage("art/penguin.png")
  self.x = 300
  self.y = 40
  self.speed = 500
end

function Son:update(dt)
<<<<<<< Updated upstream
  if love.keyboard.isDown( "down" ) then
    self.y = self.y + self.speed * dt
  elseif love.keyboard.isDown( "up" ) then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown( "left" ) then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown( "right" ) then
    self.x = self.x + self.speed * dt
  end
=======
  -- if love.keyboard.isDown( "down" ) then
  --   self.y = self.y + self.speed * dt
  -- elseif love.keyboard.isDown( "up" ) then
  --   self.y = self.y - self.speed * dt
  -- elseif love.keyboard.isDown( "left" ) then
  --   self.x = self.x - self.speed * dt
  -- elseif love.keyboard.isDown( "right" ) then
  --   self.x = self.x + self.speed * dt
  -- end
>>>>>>> Stashed changes
end

function Son:draw()
  love.graphics.draw( self.image, self.x, self.y )
<<<<<<< Updated upstream
=======
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
>>>>>>> Stashed changes
end
