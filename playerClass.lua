-- Player and Son class

Player = Object:extend()
Son = Object:extend()

function Player:new()
  self.image = love.graphics.newImage( "/art/kenney_animalpackredux/PNG/Round/whale.png" )
end

function Player:draw()
end


function Son:new()
  self.image = love.graphics.newImage("art/kenney_animalpackredux/PNG/Round/penguin.png")
end

function Son:draw()
end
