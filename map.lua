--! map class

Map = Object:extend()

function Map:new(width, height, tileblocks)

    tileblocks = {  {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
                    {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1}
                }

    love.graphics.setBackgroundColor( 1, 1, 1 )

    self.width = width
    self.height = height
    self.tileblocks = tileblocks


end

function Map:update(dt)
end

function Map:draw()
    for i,row in ipairs(self.tileblocks) do
        for j,tile in ipairs(row) do
            if tile == 1 then
                -- draw something
                love.graphics.rectangle("fill", j * 25, i * 25, 25, 25)
            end
        end
    end
end