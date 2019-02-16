Object = require 'libraries/classic/classic'
require "classes/playerClass"
require "classes/volcano"

Game = Object:extend()

function Game:new()

    player = Player()
    son = Son()
    volcano = Volcano(200, 40)
    box = Box()


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

  function Game:update(dt)

      player:update(dt)
      son:update(dt)
      volcano:update(dt)
      if volcano.halt == true then
        collides = player:checkCollision(player, volcano)
        if collides == true then
          player:update(dt,true)
        end
      end

      -- box:update(dt)
      pushBox = box:checkCollision(player, box)
      if pushBox == true then
        box:update(dt, true)
      end
      self:update2(dt)
  end

function Game:update2(dt)
end

function Game:draw()

    self:draw2()
    player:draw()
    son:draw()
    volcano:draw()
    box:draw()

    love.graphics.draw(gear, 0, 0)
end

function Game:draw2()
end

function Game:keypressed(key)

    player:keypressed(key, son)
    box:keypressed(key,player)
    -- son:keypressed(key)

end



function Game:mousepressed(x, y, button, istouch)
    if button == 1 then
        if x >= 0 then
            if y >= 0 then
                if x <= 50 then
                    if y <= 50 then
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
