function love.load()

    -- tileblocks
    tileblocks = {  {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1} 
                }





    image = love.graphics.newImage('image.png')
end

function love.update(dt)

end

function love.draw()

    -- draw tileblocks
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