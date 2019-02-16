Object = require 'libraries/classic/classic'
require 'rooms/A/main_menu'
require 'rooms/A/options'
require 'rooms/A/credits'
require 'rooms/levels/1'

function love.load()

    love.window.setMode(800, 600)

    rooms = {}
    walls = {}
    current_room = Menu()
    rooms[1] = current_room
    game = Game()
    previous_room = nil
    previous_room_index = nil

end

function love.update(dt)
    if current_room then current_room:update(dt) end
end

function love.draw()

    if current_room then current_room:draw() end

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
    if current_room and rooms[room_name] then
        if current_room.deactivate then current_room:deactivate() end
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
