Object = require 'libraries/classic/classic'
require 'map'
require "classes/playerClass"

Game = Object:extend()

function Game:new()

    player = Player()
    son = Son()

    map = Map(1,1,tileblocks)

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

  end

function Game:draw()

    map:draw()
    player:draw()
    son:draw()

end

function Game:keypressed(key)

    player:keypressed(key, son)
    -- son:keypressed(key)

end



function Game:mousepressed(x, y, button, istouch)
end

function Game:activate()
end

function Game:deactivate()

end
