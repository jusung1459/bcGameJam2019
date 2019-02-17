Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Options = typeA:extend()

function Options:new()
    current_level = 2
    background = love.graphics.newImage('art/menu/background.png')
    picture = love.graphics.newImage('art/return.png')
    suicide = love.graphics.newImage('art/menu.png')
end

function Options:update(dt)
end

function Options:draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(picture, 300, 500)
    if previous_room ~= "Menu" then love.graphics.draw(suicide, 300, 450) end
    love.graphics.print('nothing seems to be here!')
end

function Options:mousepressed(x, y, button, istouch)
    if x >= 300 then
        if x <= 500 then
            if button == 1 then
                if y >= 450 then
                    if y <= 490 then
                        gotoRoom("Death", 0)
                    elseif y >= 500 then
                        if y <= 540 then
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
