require 'libraries/classic/classic'
require 'classes/playerClass'

Box = Player:extend()

local window_width = love.graphics.getWidth()
local window_height = love.graphics.getHeight()

function Box:new(x, y)
    self.image = love.graphics.newImage("art/box.png")
    self.x = x
    self.y = y
    self.push = false
    self.intact = false
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 1
  end
  
  function Box:draw()
    love.graphics.draw( self.image, self.x, self.y )
  end
  function Box:update(dt, bool)
    if bool == true then
      self.intact = true
    end
  end
  function Box:keypressed(key,player)
    if self.intact == true then
      if key == "a" then
        self.push = not self.push
      end
      if self.push == false then
        walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 1
      end
      if self.push == true then
        if key == "up" then
          if self.y ~= 0 and walls[current_level][(self.y/tile_size)][(self.x/tile_size)+1] == 0 then
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 0
            player.y = self.y
            player.x = self.x
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
            self.y = self.y - tile_size
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
          end
        end
        if key == "down" then
          if self.y ~= window_height - tile_size and walls[current_level][(self.y/tile_size)+2][(self.x/tile_size)+1] == 0 then
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 0
            player.y = self.y
            player.x = self.x
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
            self.y = self.y + tile_size
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
          end
        end
        if key == "left" then
          if self.x ~= 0 and walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)] == 0 then
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 0
            player.y = self.y
            player.x = self.x
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
            self.x = self.x - tile_size
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
          end
        end
        if key == "right" then
          if self.x ~= window_width - tile_size and walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+2] == 0 then
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 0
            player.y = self.y
            player.x = self.x
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
            self.x = self.x + tile_size
            walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
          end
        end
  
  
      end
  
  
    end
  end