Object = require 'libraries/classic/classic'
require 'map'
require "classes/playerClass"
require "classes/volcano"

Game = Object:extend()

function Game:new()

    player = Player()
    son = Son()
    volcano = Volcano()


    map = Map(1,1,tileblocks)
    gear = love.graphics.newImage('art/menu/gear_wheel.png')
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

  end

function Game:draw()

    map:draw()
    player:draw()
    son:draw()
    volcano:draw()

    --love.graphics.draw(gear, 5, 5)

end

function Game:keypressed(key)

    player:keypressed(key, son)
    -- son:keypressed(key)

end



function Game:mousepressed(x, y, button, istouch)
    if button == 1 then
        if x >= 5 then
            if y >= 5 then
                if x <= 55 then
                    if y <= 55 then
                        gotoRoom('Options', 3)
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
