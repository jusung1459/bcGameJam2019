--! map class

Map = Object:extend()

function Map:new(width, height, tileblocks)
    self.width = width
    self.height = height
    self.tileblocks = tileblocks
end

function Map:update()
end

function Map:draw()
    for i,row in ipairs(self.tileblocks) do
        for j,tile in ipairs(row) do
            if tileblocks == 1 then
                -- draw something
                love.graphics.rectangle("fill", j*25, i*25, 20, 20)
            end
        end
    end
end