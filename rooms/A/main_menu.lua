Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Menu = typeA:extend()

function Menu:new()
    current_level = 1
    start = love.graphics.newImage('art/start.png')
    options = love.graphics.newImage('art/options.png')
    credits = love.graphics.newImage('art/credits.png')
    exit = love.graphics.newImage('art/exit.png')
    background = love.graphics.newImage('art/menu/background.png')
end

function Menu:update(dt)

end

function Menu:draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(start, 300, 300)
    love.graphics.draw(options, 300, 350)
    love.graphics.draw(credits, 300, 400)
    love.graphics.draw(exit, 300, 500)
end

function Menu:mousepressed(x, y, button, istouch)
    if x >= 300 then
        if x <= 500 then
            if button == 1 then
                if y >= 300 then
                    if y <= 340 then
                        gotoRoom('Lv1', 4)
                    elseif y >= 350 then
                        if y <= 390 then
                            gotoRoom('Options', 2)
                        elseif y >= 400 then
                            if y <= 440 then
                                gotoRoom('Credits', 3)
                            elseif y >= 550 then
                                if y <= 590 then
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
