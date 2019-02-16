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

    -- image = love.graphics.newImage('image.png')
    -- icon = love.graphics.newImage('person.png')

    Object = require "classic"
    require "playerClass"

    player = Player()
    son = Son()

    -- image = love.graphics.newImage('art/image.png')
    -- person = love.graphics.newImage('art/person.png')

    Object = require "libraries/classic/classic"
    -- player = require "playerClass"

    Menu = require "rooms/main_menu"

    Object = require "map"
    map = Map(1,1,tileblocks)

    current_room = nil

end

function love.update(dt)
  player:update(dt)
  son:update(dt)
    --shade grows darker each update. make # smaller to go slower
    color = 255
    if shade > 0 then
      shade = shade - 0.5
    end

    if current_room then current_room:update(dt) end
end

function love.draw()
    -- love.graphics.setColor(shade/255, shade/255, shade/255)
    -- love.graphics.draw(person, x, y)

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
