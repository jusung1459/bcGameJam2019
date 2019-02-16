--! map class

Map = Object:extend()

grass = love.graphics.newImage("/art/grass.png")
sand = love.graphics.newImage("art/sand.png")

function Map:new(width, height, tileblocks)

    -- tileblocks = {  {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
    --                 {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
    --                 {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
    --                 {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
    --                 {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1},
    --                 {1,1,1,0,1,0,1,0,1,0,1,0,1,0,1}
    --             }

    --21 columns bc things i/j at one?? there shouldn't actually be anything there
    tileblocks = {
      {0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }

    love.graphics.setBackgroundColor( 0, 0, 0 )

    self.width = width
    self.height = height
    self.tileblocks = tileblocks


end

function Map:update(dt)
end

function Map:draw()
    -- for i,row in ipairs(self.tileblocks) do
    --     for j,tile in ipairs(row) do
    --         if tile == 1 then
    --             -- draw something
    --             love.graphics.rectangle("fill", j * 40, i * 40, 40, 40)
    --         end
    --     end
    -- end

    for i, row in ipairs (self.tileblocks) do
        for j, tile in ipairs(row) do
            -- if tile == 0 and i != 15 and j != 20 then
            --   love.graphics.rectangle("fill", (j-1) * 40, (i-1) * 40, 40, 40)
            -- end
            -- else
            --   love.graphics.rectangle("fill", j * 40, i * 40, 40, 40)
            -- end
            if tile == 0 then
              if j == 1  or i == 1 then
                love.graphics.draw(grass, (j-1) * 40, (i-1) * 40)
              end
            end
            love.graphics.draw(grass, j * 40, i * 40)
            if tile == 1 then
               love.graphics.draw(sand, (j-1) * 40, (i-1) * 40)
            end
        end
    end
end
