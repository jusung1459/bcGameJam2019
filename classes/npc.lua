require 'libraries/classic/classic'
require 'classes/playerClass'

Npc = Player:extend()

local window_width = love.graphics.getWidth()
local window_height = love.graphics.getHeight()

function Npc:new(x, y, move, name, message, imageLocation)
    if imageLocation == nil then self.image = love.graphics.newImage('art/villager.png')
    else self.image = love.graphics.newImage(imageLocation) end
    self.x = x
    self.y = y
    self.move = move
    self.name = name
    self.message = message
    self.intact = false
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
  end

function Npc:update(dt, player)
end

function Npc:draw()
    love.graphics.draw(self.image, self.x, self.y)
end
                
function Npc:keypressed(key)
    if self.move == true then
        if key == "up" or key == "down" or key == "left" or key == "right" then
            rng = love.math.random(4)
            if rng == 1 and self.x ~= 0 then
                if walls[current_level][(self.y/40)+1][(self.x/40)] == 0 then
                    self.x = self.x - 40 end
            end
            if rng == 2 and self.y ~= 0 then
                if walls[current_level][(self.y/40)][(self.x/40)+1] == 0 then
                    self.y = self.y - 40 end
            end
            if rng == 3 and self.x ~= 760 then
                if walls[current_level][(self.y/40)+1][(self.x/40)+2] == 0 then
                    self.x = self.x + 40 end
            end
            if rng == 4 and self.y ~= 560 then
                if walls[current_level][(self.y/40)+2][(self.x/40)+1] == 0 then
                    self.y = self.y + 40 end
            end
        end
    end
end