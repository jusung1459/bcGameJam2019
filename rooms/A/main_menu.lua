Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Menu = typeA:extend()

function Menu:new()
    current_level = 1
    title = love.graphics.newImage('art/menu/BOXES.png')
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
    local y = (window_height/2) - 40
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(title, 239, 140)
    love.graphics.draw(start, x, y)
    love.graphics.draw(options, x, y + 50)
    love.graphics.draw(credits, x, y + 100)
    love.graphics.draw(exit, x, y + 200)
end

function Menu:mousepressed(x, y, button, istouch)
    local bx = (window_width/2) - 100
    local by = (window_height/2) - 40
    if x >= bx then
        if x <= bx + 200 then
            if button == 1 then
                if y >= by then
                    if y <= by + 50 then
                        gotoRoom('Lv1', 4)
                    elseif y >= by + 50 then
                        if y <= by + 100 then
                            gotoRoom('Options', 2)
                        elseif y >= by + 100 then
                            if y <= by + 150 then
                                gotoRoom('Credits', 3)
                            elseif y >= by + 200 then
                                if y <= by + 250 then
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
