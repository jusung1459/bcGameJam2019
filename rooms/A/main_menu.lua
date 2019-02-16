Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Menu = typeA:extend()

function Menu:new()
    background = love.graphics.newImage('art/menu.png')
end 

function Menu:update(dt)

end

function Menu:draw()
    love.graphics.draw(background, 0, 0)
end