Object = require 'libraries/classic/classic'
require 'rooms/A/main_menu'
require 'rooms/A/options'
require 'game'

function love.load()
    
    love.window.setMode(800, 600)
    
    rooms = {}
    current_room = Menu()

end

function love.update(dt)

end

function love.draw()

    if current_room then current_room:draw() end

end

function love.keypressed(key)

    if current_room then current_room:keypressed(key) end
    
end

function love.keypressed(key)
    player:keypressed(key)
    -- son:keypressed(key)

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
    else current_room = addRoom(room_type, room_name, ...) end
end

function love.mousepressed(x, y, button, istouch)
    if current_room then current_room:mousepressed(x, y, button, istouch) end
end
