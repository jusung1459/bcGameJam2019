Object = require 'libraries/classic/classic'
require 'rooms/main_menu'

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

    image = love.graphics.newImage('art/image.png')
    person = love.graphics.newImage('art/person.png')
  
    -- player = require "playerClass"

    current_room = Menu()
end

function love.update(dt)
    --shade grows darker each update. make # smaller to go slower
    color = 255
    if shade > 0 then
      color = color - 0.5
    end

    if current_room then current_room:update(dt) end
end

function love.draw()
    love.graphics.setColor(shade/255, shade/255, shade/255)
    --love.graphics.draw(person, x, y)

    --draw tileblocks

    if current_room then current_room:draw() end
    --love.graphics.draw(image, 0, 0)
end
