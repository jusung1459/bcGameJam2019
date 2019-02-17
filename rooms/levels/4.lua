Object = require 'libraries/classic/classic'
require 'game'

Lv4 = Game:extend()

function Lv4:init()
    current_level = 7
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

    box = Box(680, 480)
    volcano1 = Volcano(280, 200)
    exit = Exit(480, 320, 4)

    key1 = Key(280, 160)
    key2 = Key(360, 400)
    key3 = Key(240, 320)
    key4 = Key(560, 160)

    npc4 = Npc(120, 160, true, "Bob", "Bob is uttering his first sentence!")
end

function Lv4:update2()
-- box:update(dt)
  pushBox = box:checkCollision(player, box)
  if pushBox == true then
    box:update(dt, true)
  else box:update(dt, false) end

  nearNpc = npc4:checkCollision(npc3,player)
  if nearNpc == true then
    npc3:update(dt, player, true)
  else
    npc4:update(dt,player, false)
  end

  volcano1:update(dt)
  if volcano1.halt == true then
    collides = volcano1:checkCollision(player, volcano1)
    if collides == true then
      player:update(dt,true)
    else
      collides = volcano1:checkCollision(son, volcano1)
      if collides == true then
        son.x = player.x
        son.y = player.y
      end
    end
  end

  exit:update()

  key1:update(dt)
  key2:update(dt)
  key3:update(dt)
  key4:update(dt)

end

function Lv4:draw2()

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
    key4:draw()

    exit:draw()

    npc4:draw()
end

function Lv4:keypressed2(key)

  box:keypressed(key,player)
  npc4:keypressed(key)
end

function Lv4:activate()
    current_level = 7
    next_level = 'Lv4'
    next_level_index = 8
end

function Lv4:deactivate()
    previous_room = 'Lv3'
    previous_room_index = 7
end