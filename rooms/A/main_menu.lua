Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Menu = typeA:extend()

function Menu:new()
    current_level = 1
    start = love.graphics.newImage('art/menu/start.png')
    options = love.graphics.newImage('art/menu/options.png')
    credits = love.graphics.newImage('art/menu/credits.png')
    exit = love.graphics.newImage('art/menu/exit.png')
    background = love.graphics.newImage('art/menu/background.png')
end

function Menu:update(dt)

end

function Menu:draw()
    local x = (window_width/2) - 100
    local y = (window_height/2)
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(start, x, y)
    love.graphics.draw(options, x, y + 50)
    love.graphics.draw(credits, x, y + 100)
    love.graphics.draw(exit, x, window_height - 100)
end

function Menu:mousepressed(x, y, button, istouch)
    local bx = (window_width/2) - 100
    local by = (window_height/2)
    if x >= bx - 100 then
        if x <= bx + 200 then
            if button == 1 then
                if y >= by then
                    if y <= by + 40 then
                        gotoRoom('Lv1', 4)
                    elseif y >= by + 50 then
                        if y <= by + 90 then
                            gotoRoom('Options', 2)
                        elseif y >= by + 100 then
                            if y <= by + 140 then
                                gotoRoom('Credits', 3)
                            elseif y >= window_height - 100 then
                                if y <= window_height - 60 then
                                    love.event.quit()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function Menu:activate()
    current_level = 1
    pause = 1
end

function Menu:deactivate()
    previous_room = "Menu"
    previous_room_index = 1
    pause = 0
end
