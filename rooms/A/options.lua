Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Options = typeA:extend()

function Options:new()
    current_level = 2
    background = love.graphics.newImage('art/menu/background.png')
    picture = love.graphics.newImage('art/menu/cancel.png')
    suicide = love.graphics.newImage('art/menu/exit.png')
end

function Options:update(dt)
end

function Options:draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(picture, window_width/2 - 100, window_height - 100)
    if previous_room ~= "Menu" then love.graphics.draw(suicide, window_width/2 - 100, window_height - 150) end
    font = love.graphics.newFont("orange_kid.ttf", 30)
    love.graphics.setFont(font)
    love.graphics.print('nothing seems to be here!')
end

function Options:mousepressed(x, y, button, istouch)
    if x >= window_width/2 - 100 then
        if x <= window_width/2 + 100 then
            if button == 1 then
                if y >= window_height - 150 then
                    if y <= window_height - 110 then
                        gotoRoom("Death", 0)
                    elseif y >= window_height - 100 then
                        if y <= window_height - 60 then
                            gotoRoom(previous_room, previous_room_index)
                        end
                    end
                end
            end
        end
    end
end

function Options:activate()
    current_level = 2
    pause = 1
end

function Options:deactivate()
    pause = 0
end
