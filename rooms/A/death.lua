Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Death = typeA:extend()

function Death:new()
    current_level = 2
    background = love.graphics.newImage('art/menu/background.png')
    picture = love.graphics.newImage('art/menu.png')
end

function Death:update(dt)
end

function Death:draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(picture, 300, 500)
    love.graphics.print('you died!')
end

function Death:mousepressed(x, y, button, istouch)
    if x >= 300 then
        if x <= 500 then
            if button == 1 then
                if y >= 500 then
                    if y <= 540 then
                        rooms = {}
                        gotoRoom("Menu", 1)
                    end
                end
            end
        end
    end
end

function Death:activate()
    current_level = 0
    pause = 1
end

function Death:deactivate()
    pause = 0
end
