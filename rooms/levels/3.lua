Object = require 'libraries/classic/classic'
require 'game'

Lv3 = Game:extend()

function Lv3:init()
    current_level = 6
    grass = love.graphics.newImage("/art/grass.png")
    sand = love.graphics.newImage("/art/sand.png")
    topleft = love.graphics.newImage("art/floor_tiles/topleft.png")
    top = love.graphics.newImage("art/floor_tiles/top.png")
    topright = love.graphics.newImage("art/floor_tiles/topright.png")
    left = love.graphics.newImage("art/floor_tiles/left.png")
    center = love.graphics.newImage("art/floor_tiles/center.png")
    right = love.graphics.newImage("art/floor_tiles/right.png")
    botleft = love.graphics.newImage("art/floor_tiles/botleft.png")
    bot = love.graphics.newImage("art/floor_tiles/bot.png")
    botright = love.graphics.newImage("art/floor_tiles/botright.png")
    wall = love.graphics.newImage("art/floor_tiles/wall.png")

    --insert matrix here for obstacle
    walls[current_level] = {
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
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }

    love.graphics.setBackgroundColor( 0, 0, 0 )

    self.width = width
    self.height = height
    self.tileblocks = tileblocks

    box = Box(360, 0)
    volcano = Volcano(280, 200)
    exit = Exit(260, 360, 3)

    key1 = Key(120, 80)
    key2 = Key(480, 480)
    key3 = Key(520, 240)
    --key4 = Key(100, 340)

    npc3 = Npc(160, 160, true, "Bob", "Bob is uttering his dfirst sentence!")
end

function Lv3:update2()
-- box:update(dt)
  pushBox = box:checkCollision(player, box)
  if pushBox == true then
    box:update(dt, true)
  end

  nearNpc = npc3:checkCollision(npc3,player)
  if nearNpc == true then
    npc3:update(dt, player, true)
  else
    npc3:update(dt,player, false)
  end

  volcano:update(dt)
  if volcano.halt == true then
    collides = player:checkCollision(player, volcano)
    if collides == true then
      player:update(dt,true)
    end
  end

  exit:update()

  key1:update(dt)
  key2:update(dt)
  key3:update(dt)
  --key4:update(dt)

end

function Lv3:draw2()

    for i, row in ipairs (walls[current_level]) do
        for j, tile in ipairs(row) do
            -- if tile == 0 and i != 15 and j != 20 then
            --   love.graphics.rectangle("fill", (j-1) * 40, (i-1) * 40, 40, 40)
            -- end
            -- else
            --   love.graphics.rectangle("fill", j * 40, i * 40, 40, 40)
            -- end
            if tile == 0 then
              -- if j == 1  or i == 1 then
              --   love.graphics.draw(grass, (j-1) * 40, (i-1) * 40)
              -- end
              if j == 1 and i == 1 then
                love.graphics.draw(topleft, 0, 0)

              elseif j == 1 and i == 15 then
                love.graphics.draw(botleft, (j-1)*40, (i-1)*40)

              elseif j == 20 and i == 1 then
                love.graphics.draw(topright, (j-1)*40, (i-1)*40)

              elseif j == 20 and i == 15 then
                love.graphics.draw(botright, (j-1)*40, (i-1)*40)

              elseif i == 1 and j ~= 1 and j ~= 20 then
                love.graphics.draw(top, (j-1)*40, (i-1)*40)

              elseif j == 1 and i ~= 1 and i ~= 15 then
                love.graphics.draw(left, (j-1)*40, (i-1)*40)

              elseif j == 20  and i ~= 1 and i ~= 15 then
                love.graphics.draw(right, (j-1)*40, (i-1)*40)

              elseif i == 15 and j ~= 1 and j ~= 20 then
                love.graphics.draw(bot, (j-1)*40, (i-1)*40)

              elseif i ~= 1 and i ~= 15 and j ~= 1 and j ~= 20 then
                love.graphics.draw(center, (j-1) * 40, (i-1) * 40)
              end

            end
            if tile == 1 then
              love.graphics.draw(wall, (j-1)*40, (i-1)*40)
            end
            -- love.graphics.draw(grass, j * 40, i * 40)
            -- if tile == 1 then
            --    love.graphics.draw(sand, (j-1) * 40, (i-1) * 40)
            -- end
        end
    end

    love.graphics.draw(topright, 760, 0)

    box:draw()

    volcano:draw()

    key1:draw()
    key2:draw()
    key3:draw()
    --key4:draw()

    exit:draw()

    npc3:draw()
end

function Lv3:keypressed2(key)

  box:keypressed(key,player)
  npc3:keypressed(key)
end

function Lv3:activate()
    current_level = 6
    next_level = 'Lv4'
    next_level_index = 7
end

function Lv3:deactivate()
    previous_room = 'Lv3'
    previous_room_index = 6
end
