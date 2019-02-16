Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Options = typeA:extend()

function Options:new()
    background = love.graphics.newImage('art/menu/background.png')
    picture = love.graphics.newImage('art/menu.png')
end 

function Options:update(dt)
end

function Options:draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(picture, 300, 550)
    love.graphics.print('nothing seems to be here!')
end

function Options:mousepressed(x, y, button, istouch)
    if x >= 300 then
        if x <= 500 then
            if button == 1 then
                if y >= 550 then
                    if y <= 590 then
                        gotoRoom('Menu', 1)
                    end
                end
            end
        end
    end
end