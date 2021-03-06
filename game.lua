Object = require 'libraries/classic/classic'
require "classes/playerClass"
require "classes/volcano"
require "classes/box"
require "classes/key"
require "classes/exit"
require "classes/npc"
require "classes/door"
require "classes/dialogue"
require "classes/trapdoor"
require "classes/worm"


Game = Object:extend()

function Game:new()
    player = Player()
    son = Son()
    gear = love.graphics.newImage('art/menu/gear_wheel.png')
    self:init()
end

function Game:init()
end

function Game:extend()
    local cls = {}
    for k, v in pairs(self) do
      if k:find("__") == 1 then
        cls[k] = v
      end
    end
    cls.__index = cls
    cls.super = self
    setmetatable(cls, self)
    return cls
end
function Game:background()
  self:drawBackground()
end
function Game:update(dt)
    player:update(dt, son)
    son:update(dt)

    self:update2(dt)
end

function Game:update2(dt)
end

function Game:draw()

    
    self:background()
    self:draw2()
    player:draw()
    son:draw()

    love.graphics.draw(gear, window_width - tile_size, 0)
end

function Game:draw2()
end

function Game:keypressed(key)

    player:keypressed(key, son)
    -- son:keypressed(key)
    self:keypressed2(key)
end

function Game:keypressed2(key)

end


function Game:mousepressed(x, y, button, istouch)
    if button == 1 then
        if x >= window_width - gear:getWidth() then
            if y >= 0 then
                if x <= window_width then
                    if y <= gear:getHeight() then
                        gotoRoom('Options', 2)
                    end
                end
            end
        end
    end
end

function Game:mousereleased(x, y, button, istouch)
end


function Game:activate()
end

function Game:deactivate()

end
