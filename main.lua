Object = require 'libraries/classic/classic'
require 'rooms/A/main_menu'
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
    require "/classes/playerClass"
    require "/classes/queue"
    player = Player()
    son = Son()

    -- image = love.graphics.newImage('art/image.png')
    -- person = love.graphics.newImage('art/person.png')

    -- player = require "playerClass"



    require "map"
    map = Map(1,1,tileblocks)

    love.graphics.setBackgroundColor( 1, 1, 1 )


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

      -- for i,row in ipairs(tileblocks) do
      --     for j,tile in ipairs(row) do
      --         if tile == 1 then
      --             -- draw something
      --             love.graphics.rectangle("fill", j*25, i*25, 20, 20)
      --         end
      --     end
      -- end

    map:draw()
    player:draw()
    son:draw()

    -- love.graphics.draw(image, 0, 0)
    -- love.graphics.setColor(shade/255, shade/255, shade/255)
    -- love.graphics.draw(person, x, y)

    --draw tileblocks


    if current_room then current_room:draw() end
    -- love.graphics.draw(image, 0, 0)
end

function love.keypressed(key)
    player:keypressed(key)
    -- son:keypressed(key)
end

function love.gotoRoom(room_type, ...)
    current_room = _G[room_type](...)
end

function love.mousepressed(x, y, button, istouch)
    if current_room then current_room:mousepressed(x, y, button, istouch) end
end
