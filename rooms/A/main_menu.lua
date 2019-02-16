Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Menu = typeA:extend()

function Menu:new()
    picture = love.graphics.newImage('art/menu.png')
end 

function Menu:update(dt)

end

function Menu:draw()
    love.graphics.draw(picture, 300, 300)
    love.graphics.draw(picture, 300, 350)
    love.graphics.draw(picture, 300, 400)
    love.graphics.draw(picture, 300, 450)
    love.graphics.draw(picture, 300, 550)
end

function Menu:mousepressed(x, y, button, istouch)
    gotoRoom('Options', 1)
end
