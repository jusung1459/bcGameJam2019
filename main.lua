Object = require 'libraries/classic/classic'
require 'rooms/A/main_menu'
require 'rooms/A/options'
require 'map'

function love.load()

    -- tileblocks
    tileblocks = {  {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1}
                }

    shade = 255
    x = 0
    y = 0
    
    love.window.setMode(800, 600)
    -- image = love.graphics.newImage('image.png')
    -- icon = love.graphics.newImage('person.png')

    Object = require "classic"
    require "classes/playerClass"

    player = Player()
    son = Son()

    -- image = love.graphics.newImage('art/image.png')
    -- person = love.graphics.newImage('art/person.png')

    -- player = require "playerClass"



    require "map"
    map = Map(1,1,tileblocks)

    love.graphics.setBackgroundColor( 1, 1, 1 )
    
    rooms = {}
    current_room = Menu()

end

function love.update(dt)
  player:update(dt)
  son:update(dt)
    --shade grows darker each update. make # smaller to go slower
    color = 255
    if shade > 0 then
      shade = shade - 0.5
    end

end

function love.draw()
    -- love.graphics.setColor(shade/255, shade/255, shade/255)
    -- love.graphics.draw(person, x, y)

      for i,row in ipairs(tileblocks) do
          for j,tile in ipairs(row) do
              if tile == 1 then
                  -- draw something
                  love.graphics.rectangle("fill", j*25, i*25, 20, 20)
              end
          end
      end
      -- for i,row in ipairs(tileblocks) do
      --     for j,tile in ipairs(row) do
      --         if tile == 1 then
      --             -- draw something
      --             love.graphics.rectangle("fill", j*25, i*25, 20, 20)
      --         end
      --     end
      -- end

    player:draw()
    son:draw()

    map:draw()

    -- love.graphics.draw(image, 0, 0)
    -- love.graphics.setColor(shade/255, shade/255, shade/255)
    -- love.graphics.draw(person, x, y)

    --draw tileblocks


    if current_room then current_room:draw() end
    -- love.graphics.draw(image, 0, 0)
end

function love.keypressed(key)
    player:keypressed(key)
    son:keypressed(key)
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
    else current_room = addRoom(room_type, room_name, ...) end
end

function love.mousepressed(x, y, button, istouch)
    if current_room then current_room:mousepressed(x, y, button, istouch) end
end
