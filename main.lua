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
    image = love.graphics.newImage('image.png')
    Object = require "classic"
    -- player = require "playerClass"

end

function love.update(dt)
    --shade grows darker each update. make # smaller to go slower
    if shade > 0 then
      color = color - 0.5
    end
end

function love.draw()
    love.graphics.setColor(shade)/255, shade/255, shade/255)


    draw tileblocks
    function love.draw()
        for i,row in ipairs(tileblocks) do
            for j,tile in ipairs(row) do
                if tile == 1 then
                    -- draw something
                    love.graphics.draw(image, 0, 0)
                end
            end
        end
    end

    love.graphics.draw(image, 0, 0)
end
