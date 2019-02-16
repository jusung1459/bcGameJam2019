Object = require 'libraries/classic/classic'

typeA = Object:extend()

function typeA:new()
    background = love.graphics.newImage('art/menu.png')
end 

function typeA:update(dt)

end

function typeA:draw()
    love.graphics.draw(background, 0, 0)
end