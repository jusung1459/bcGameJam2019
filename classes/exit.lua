Object = require('libraries/classic/classic')

Exit = Object:extend()
local passable = 0
local open = love.graphics.newImage("/art/floor_tiles/door_open.png")
local close = love.graphics.newImage("/art/floor_tiles/door.png")


function Exit:new(x, y, num)
  self.image = door
  self.x = x
  self.y = y
  self.door = close
  self.num = num
  walls[current_level][(self.y/40)+1][(self.x/40)+1] = 1
  if num == 0 then 
    walls[current_level][(self.y/40)+1][(self.x/40)+1] = 2
    self.door = open
  end
end

function Exit:update(dt)
    if self.num == keys then
    walls[current_level][(self.y/40)+1][(self.x/40)+1] = 2
    self.door = open
end
end


function Exit:draw()
    if self.door == close then love.graphics.draw(close, self.x, self.y)
else love.graphics.draw(open, self.x, self.y) end
end