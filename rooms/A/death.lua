Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Death = typeA:extend()

function Death:new()
    current_level = 0
    background = love.graphics.newImage('art/menu/background.png')
    picture = love.graphics.newImage('art/menu.png')
end

function Death:update(dt)
end

function Death:draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(picture, window_width/2 - 100 , window_height - 100)
    love.graphics.print('you died!')
end

function Death:mousepressed(x, y, button, istouch)
    if x >= window_width/2 - 100 then
        if x <= window_width/2 + 100 then
            if button == 1 then
                if y >= window_height - 100 then
                    if y <= window_height - 60 then
                        rooms = {}
                        keys = 0
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
