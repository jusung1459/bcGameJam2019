Object = require 'libraries/classic/classic'
require 'rooms/A/main_menu'
require 'rooms/A/options'
require 'rooms/A/credits'
require 'rooms/A/death'
require 'rooms/levels/1'
require 'rooms/levels/2'
require 'rooms/levels/3'
require 'classes/npc'
Moan = require('Moan')
--require 'classes/dialogue'

function love.load()

    --control variables
    window_width = 800
    window_height = 600
    tile_size = 40
    decay_rate = 0.5


    color = 255
    pause = 1
    love.window.setMode(window_width, window_height)
    rooms = {}
    walls = {}
    current_room = Menu()
    rooms[1] = current_room
    game = Game()
    previous_room = nil
    previous_room_index = nil
    current_level = nil
    next_level = nil
    next_level_index = nil
    keys = 0
    --dialogue = DialogueBox()

    --Moan.speak("Title", {"Hello World!"})

end

function love.update(dt)
        --color = color - decay_rate COMMENT BACK AFTER
    if pause == 0 then
        love.graphics.setColor(color/255, color/255, color/255)
    end
    if pause == 1 then love.graphics.setColor(255, 255, 255) end
    if color == 0 then
      color = 255
      pause = 1
      gotoRoom("Death", 0)
    end
    if current_room then current_room:update(dt) end

    --Moan.update(dt)
end

function love.draw()

    if current_room then current_room:draw() end

    --[[if true == true then
        Moan.draw()
    end]]--
    --dialogue:draw()

end

function love.keypressed(key)
    if current_room then current_room:keypressed(key) end
end


function addRoom(room_type, room_name, ...)
    local room = _G[room_type](room_name, ...)
    rooms[room_name] = room
    return room
end

function gotoRoom(room_type, room_name, ...)
    if current_room.deactivate then current_room:deactivate() end
    if current_room and rooms[room_name] then
        current_room = rooms[room_name]
        if current_room.activate then current_room:activate() end
    else current_room = addRoom(room_type, room_name, ...)
        current_room:activate() end

end

function love.mousepressed(x, y, button, istouch)
    if current_room then current_room:mousepressed(x, y, button, istouch) end
end
-- cant mouse to press a second time on a different option

function love.mousereleased(x, y, button, istouch)
    if current_room then current_room:mousepressed(x, y, button, istouch) end
end

function love.quit()

end
