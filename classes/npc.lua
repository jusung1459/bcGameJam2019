require 'libraries/classic/classic'
require 'classes/playerClass'

Npc = Player:extend()

local window_width = love.graphics.getWidth()
local window_height = love.graphics.getHeight()

function Npc:new(x, y, move, name, message, imageLocation)
    if imageLocation == nil then self.image = love.graphics.newImage('art/sensei.png')
    else self.image = love.graphics.newImage(imageLocation) end
    self.x = x
    self.y = y
    self.move = move
    self.name = name
    self.message = message
    self.intact = false --for the encounter with the player
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.frame = 1
  end

function Npc:update(dt, player,bool)
    self.intact = bool
    self.frame = self.frame + 0.05
    if self.frame > 3 then
      rng = love.math.random(4)
      if rng == 1 and self.x ~= 0 then
          if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)] == 0 then
              self.x = self.x - tile_size end
      end
      if rng == 2 and self.y ~= 0 then
          if walls[current_level][(self.y/tile_size)][(self.x/tile_size)+1] == 0 then
              self.y = self.y - tile_size end
      end
      if rng == 3 and self.x ~= window_width - tile_size then
          if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+2] == 0 then
              self.x = self.x + tile_size end
      end
      if rng == 4 and self.y ~= window_height - tile_size then
          if walls[current_level][(self.y/tile_size)+2][(self.x/tile_size)+1] == 0 then
              self.y = self.y + tile_size end
      end
      self.frame = 1
    end
end

function Npc:draw()
    love.graphics.draw(self.image, self.x, self.y)
    --[[if self.intact then
      Moan.draw()
    end]]--
end


function Npc:dialogue(dialogue)
  if self.intact then

    dialogue:draw()
    dialogue:speak(self.message)
  end
end

function Npc:getIntact()
    return intact
end
