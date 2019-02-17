Object = require 'libraries/classic/classic'
require 'game'

Lv3 = Game:extend()

function Lv3:init()
    current_level = 6
    topleft = love.graphics.newImage("art/floor_tiles/topleft1.png")
    top = love.graphics.newImage("art/floor_tiles/top1.png")
    topright = love.graphics.newImage("art/floor_tiles/topright1.png")
    left = love.graphics.newImage("art/floor_tiles/left1.png")
    center = love.graphics.newImage("art/floor_tiles/center1.png")
    right = love.graphics.newImage("art/floor_tiles/right1.png")
    botleft = love.graphics.newImage("art/floor_tiles/botleft1.png")
    bot = love.graphics.newImage("art/floor_tiles/bot1.png")
    botright = love.graphics.newImage("art/floor_tiles/botright1.png")
    wall = love.graphics.newImage("art/floor_tiles/wall.png")

    --insert matrix here for obstacle
    walls[current_level] = {
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
      {0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
      {0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0},
      {0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
      {0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0},
      {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
      {0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0},
      {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
      {0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
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
    volcano2 = Volcano(560, 200)
    volcano3 = Volcano(200, 320)
    exit = Exit(480, 320, 4)

    key1 = Key(280, 160)
    key2 = Key(360, 400)
    key3 = Key(240, 320)
    key4 = Key(560, 160)

    npc3 = Npc(120, 160, true, "Bob", "Bob is uttering his first sentence!")
end

function Lv3:drawBackground()
  envs[current_level] = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  }

  for i, row in ipairs (envs[current_level]) do
      for j, tile in ipairs(row) do

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
      end
  end

  love.graphics.draw(topright, 760, 0)
end

function Lv3:update2()
-- box:update(dt)
  pushBox = box:checkCollision(player, box)
  if pushBox == true then
    box:update(dt, true)
  else box:update(dt, false) end

  nearNpc = npc3:checkCollision(npc3,player)
  if nearNpc == true then
    npc3:update(dt, player, true)
  else
    npc3:update(dt,player, false)
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

  volcano2:update(dt)
  if volcano2.halt == true then
    collides = volcano2:checkCollision(player, volcano2)
    if collides == true then
      player:update(dt,true)
    else
      collides = volcano2:checkCollision(son, volcano2)
      if collides == true then
        son.x = player.x
        son.y = player.y
      end
    end
  end

  volcano3:update(dt)
  if volcano3.halt == true then
    collides = volcano3:checkCollision(player, volcano3)
    if collides == true then
      player:update(dt,true)
    else
      collides = volcano3:checkCollision(son, volcano3)
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

function Lv3:draw2()

    box:draw()

    volcano1:draw()
    volcano2:draw()
    volcano3:draw()

    key1:draw()
    key2:draw()
    key3:draw()
    key4:draw()

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
