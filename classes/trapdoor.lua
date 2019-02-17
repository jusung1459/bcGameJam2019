Object = require('libraries/classic/classic')

Trap = Object:extend()
local open = love.graphics.newImage('art/open_trap.png')
local close
local img
local count = 0

function Trap:new(x, y)
    topleft = love.graphics.newImage("art/floor_tiles/topleft1.png")
    top = love.graphics.newImage("art/floor_tiles/top1.png")
    topright = love.graphics.newImage("art/floor_tiles/topright1.png")
    left = love.graphics.newImage("art/floor_tiles/left1.png")
    center = love.graphics.newImage("art/floor_tiles/center1.png")
    right = love.graphics.newImage("art/floor_tiles/right1.png")
    botleft = love.graphics.newImage("art/floor_tiles/botleft1.png")
    bot = love.graphics.newImage("art/floor_tiles/bot1.png")
    botright = love.graphics.newImage("art/floor_tiles/botright1.png")
    wall = love.graphics.newImage("art/floor_tiles/wall.png")

    if j == 1 and i == 1 then
        close = topleft
    elseif j == 1 and i == 15 then
        close = botleft
    elseif j == 20 and i == 1 then
        close = topright
    elseif j == 20 and i == 15 then
        close = botright
    elseif i == 1 and j ~= 1 and j ~= 20 then
        close = top
    elseif j == 1 and i ~= 1 and i ~= 15 then
        close = left
    elseif j == 20  and i ~= 1 and i ~= 15 then
        close = right
    elseif i == 15 and j ~= 1 and j ~= 20 then
        close = bot
    elseif i ~= 1 and i ~= 15 and j ~= 1 and j ~= 20 then
        close = center
    end
    img = close
  self.image = img
  self.x = x
  self.y = y
  self.open = false
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Trap:update(dt)
    count = count + 0.025
    if count > 3 then
      if self.open == true then
        img = close
        self.open = false
        walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 0
      else
        img = open
        self.open = true
        walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 4
      end
      count = 0
    end
    return self.open
end

function Trap:draw()
    love.graphics.draw(img, self.x, self.y)
end