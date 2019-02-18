require 'game'
require 'classes/dialogue'
require 'classes/introduction'

Lv1 = Game:extend()

function Lv1:init()


    current_level = 4
    topleft = love.graphics.newImage("art/floor_tiles/topleft1.png")
    top = love.graphics.newImage("art/floor_tiles/top1.png")
    topright = love.graphics.newImage("art/floor_tiles/topright1.png")
    left = love.graphics.newImage("art/floor_tiles/left1.png")
    center = love.graphics.newImage("art/floor_tiles/center1.png")
    right = love.graphics.newImage("art/floor_tiles/right1.png")
    botleft = love.graphics.newImage("art/floor_tiles/botleft1.png")
    bot = love.graphics.newImage("art/floor_tiles/bot1.png")
    botright = love.graphics.newImage("art/floor_tiles/botright1.png")
    wall = love.graphics.newImage("art/floor_tiles/wall1.png")
    -- wall = love.graphics.newImage("art/platformergraphics-buildings/fenceLow.png")
    door = love.graphics.newImage("art/floor_tiles/door.png")



    --insert matrix here for obstacle
    --1 is a wall

    walls[current_level] = {
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }


    love.graphics.setBackgroundColor( 0, 0, 0 )

    self.width = width
    self.height = height
    self.tileblocks = tileblocks

    self.intro = true

    box = Box(360, 0)
    volcano = Volcano(360, 240)
    exit = Exit(400, 320, 2)

    key1 = Key(80, 80)
    key2 = Key(440, 440)

    npc1 = Npc(160, 160, true, "Bob", "You and your son want to go through the door? Try moving the box by pressing 'E'")
    dial1 = DialogueBox()
    intro = Intro("You are on your own kidos LMAO", true)

    door = Door(320, 240, 40, 40)

    trap = Trap(720, 520)
end

function Lv1:drawBackground()
  envs[current_level] = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
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

            elseif j == 1 and i == YTiles then
              love.graphics.draw(botleft, (j-1)*40, (i-1)*40)

            elseif j == XTiles and i == 1 then
              love.graphics.draw(topright, (j-1)*40, (i-1)*40)

            elseif j == XTiles and i == YTiles then
              love.graphics.draw(botright, (j-1)*40, (i-1)*40)

            elseif i == 1 and j ~= 1 and j ~= XTiles then
              love.graphics.draw(top, (j-1)*40, (i-1)*40)

            elseif j == 1 and i ~= 1 and i ~= YTiles then
              love.graphics.draw(left, (j-1)*40, (i-1)*40)

            elseif j == XTiles  and i ~= 1 and i ~= YTiles then
              love.graphics.draw(right, (j-1)*40, (i-1)*40)

            elseif i == YTiles and j ~= 1 and j ~= XTiles then
              love.graphics.draw(bot, (j-1)*40, (i-1)*40)

            elseif i ~= 1 and i ~= YTiles and j ~= 1 and j ~= XTiles then
              love.graphics.draw(center, (j-1) * 40, (i-1) * 40)
            end

          end
          if tile == 1 then

            love.graphics.draw(wall, (j-1)*40, (i-1)*40)
          end
      end
  end
end

function Lv1:update2()
-- box:update(dt)
  pushBox = box:checkCollision(player, box)
  if pushBox == true then
    box:update(dt, true)
  else box:update(dt, false) end

  nearNpc = npc1:checkCollision(npc1,player)
  if nearNpc == true then
    npc1:update(dt, player, true)
  else
    npc1:update(dt,player, false)
  end

  volcano:update(dt)
  if volcano.halt == true then
    collides = volcano:checkCollision(player, volcano)
    if collides == true then
      player:update(dt,true)
    else
      collides = volcano:checkCollision(son, volcano)
      if collides == true then
        son.x = player.x
        son.y = player.y
      end
    end
  end

  exit:update(dt)

  key1:update(dt)
  key2:update(dt)

  door:update(dt)

  trap:update(dt)

  intro:update(dt)

end
function Lv1:draw2()

    door:draw()


    volcano:draw()

    key1:draw()
    key2:draw()

    exit:draw()

    door:draw()
    box:draw()

    npc1:draw()
    npc1:dialogue(dial1)

    intro:dialogue(dial1)

    trap:draw()
end

function Lv1:keypressed2(key)

  box:keypressed(key,player)
end

function Lv1:activate()
    current_level = 4
    next_level = 'Lv2'
    next_level_index = 5
end

function Lv1:deactivate()
    previous_room = 'Lv1'
    previous_room_index = 4
end
