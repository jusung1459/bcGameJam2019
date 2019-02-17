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
    walls[current_level][(self.y/40)+1][(self.x/40)+1] = 1
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
        walls[current_level][(self.y/40)+1][(self.x/40)+1] = 1
      end
      if self.push == true then
        walls[current_level][(self.y/40)+1][(self.x/40)+1] = 0
        if key == "up" then
          player.y = self.y
          player.x = self.x
          if self.y ~= 0 then
            if walls[current_level][(self.y/40)][(self.x/40)+1] == 0 then
              self.y = self.y - 40
            end
          end
        end
  
  
        if key == "down" then
          player.y = self.y
          player.x = self.x
          if self.y ~= 560 then
            if walls[current_level][(self.y/40)+2][(self.x/40)+1] == 0 then
              self.y = self.y + 40
            end
          end
        end
  
        if key == "left" then
          player.y = self.y
          player.x = self.x
          if self.x ~= 0 then
            if walls[current_level][(self.y/40)+1][(self.x/40)] == 0 then
              self.x = self.x - 40
            end
          end
        end
        if key == "right" then
          player.y = self.y
          player.x = self.x
          if self.x ~= 760 then
            if walls[current_level][(self.y/40)+1][(self.x/40)+2] == 0 then
              self.x = self.x + 40
            end
          end
        end
  
  
      end
  
  
    end
  end