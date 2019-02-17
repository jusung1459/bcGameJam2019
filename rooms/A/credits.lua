Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Credits = typeA:extend()

function Credits:new()
    current_level = 3
    background = love.graphics.newImage('art/menu/background.png')
    picture = love.graphics.newImage('art/return.png')
end

function Credits:update(dt)
end

function Credits:draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(picture, window_width/2 - 100, window_height - 100)
    love.graphics.print('nothing seems to be here!')
end

function Credits:mousepressed(x, y, button, istouch)
    if x >= window_width/2 - 100 then
        if x <= window_width/2 + 100 then
            if button == 1 then
                if y >= window_height - 100 then
                    if y <= window_height - 60 then
                        gotoRoom(previous_room, previous_room_index)
                    end
                end
            end
        end
    end
end

function Credits:activate()
    current_level = 3
    pause = 1
end

function Credits:deactivate()
    pause = 0
end
