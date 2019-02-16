Object = require 'libraries/classic/classic'

typeA = Object:extend()

function typeA:new()
    
end 

function typeA:extend()
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

function typeA:update(dt)

end

function typeA:draw()

end

function typeA:keypressed(key)

end

function typeA:mousepressed(x, y, button, istouch)
end

function typeA:mousepressed(x, y, button, istouch)
end

function typeA:activate()
end

function typeA:deactivate()

end