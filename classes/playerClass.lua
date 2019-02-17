
-- Player and Son class
Player = Object:extend()
Son = Object:extend()

-- Possible icons (for directions)
playerDown = love.graphics.newImage("art/Tiny Adventure Pack/Character/Char_one/char_front.png")
playerUp = love.graphics.newImage("art/Tiny Adventure Pack/Character/Char_one/char_back.png")
playerLeft = love.graphics.newImage("art/Tiny Adventure Pack/Character/Char_one/char_left.png")
playerRight = love.graphics.newImage("art/Tiny Adventure Pack/Character/Char_one/char_right.png")

sonDown = love.graphics.newImage("art/Tiny Adventure Pack/Character/Char_one/char_front.png")
sonUp = love.graphics.newImage("art/Tiny Adventure Pack/Character/Char_one/char_back.png")
sonLeft = love.graphics.newImage("art/Tiny Adventure Pack/Character/Char_one/char_left.png")
sonRight = love.graphics.newImage("art/Tiny Adventure Pack/Character/Char_one/char_right.png")

local window_width = love.graphics.getWidth()
local window_height = love.graphics.getHeight()

--create a new player
function Player:new()
  self.image = playerDown --love.graphics.newImage( "/art/alienBlue_badge2.png" )
  self.x = tile_size
  self.y = 0
  self.keys = 0
  self.speed = 500
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.prevX = tile_size;
  self.prevY = 0;
  self.sonFollow = true;
  self.box = false
  self.direction = "down"
end

function Player:checkCollision(player, b)

    local player_left = player.x
    local player_right = player.x + player.width + tile_size
    local player_top = player.y
    local player_bottom = player.y + player.height + tile_size

    local b_left = b.x
    local b_right = b.x + b.width + tile_size
    local b_top = b.y
    local b_bottom = b.y + b.height + tile_size

    --approaching the obstacle while moving to the right
    if player_right > b_left and
    --while moving to the left
    player_left < b_right and
    --while moving up
    player_bottom > b_top and
    --while moving down
    player_top < b_bottom then
        --There is collision!
        return true
    else
        --If one of these statements is false, return false.
        return false
    end
end

--check the boundaries
function Player:update(dt, stop, Son)
--when you are inside a volcano and it turns red
if stop == true then
    --send the player to prev coordinates if prev coord is free
    if walls[current_level][(self.prevY/tile_size)+1][(self.prevX/tile_size)+1] == 0 or walls[current_level][(self.prevY/tile_size)+1][(self.prevX/tile_size)+1] == -1 then
      self.x = self.prevX
      self.y = self.prevY
      son.x = self.prevX
      son.y = self.prevY
      walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
    elseif walls[current_level][(self.y/tile_size)][(self.x/tile_size)+1] == 0 then
      self.x = self.x
      self.y = self.y - tile_size
      son.x = self.x
      son.y = self.y
      walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
    elseif walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)] == 0 then
      self.x = self.x - tile_size
      self.y = self.y
      son.x = self.x
      son.y = self.y
      walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
    elseif walls[current_level][(self.y/tile_size)+2][(self.x/tile_size)+1] == 0 then
      self.x = self.x
      self.y = self.y + tile_size
      son.x = self.x
      son.y = self.y
      walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
    elseif walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+2] == 0 then
      self.x = self.x + tile_size
      self.y = self.y
      son.x = self.x
      son.y = self.y
      walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
    else gotoRoom("Death", 0) end
    return false
  end

  --check boundaries
  if self.x < 0 then self.x = 0
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
  end

  if self.y < 0 then self.y = 0
  elseif self.y + self.height > window_height then
    self.y = window_height - self.height
  end

end

--draw the player
function Player:draw()
  love.graphics.draw( self.image, self.x, self.y )
end


--move character+son
function Player:keypressed(key, son)

  if key == "x" and self:checkCollision(self, son) then
    self.sonFollow = not self.sonFollow
  end

  if key == "up" then
    --if son is following you, change his coordinates
    if self.sonFollow then
      son.direction = "up"
      son.image = sonUp
      walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] = 0
      son.y = self.y
      son.x = self.x
      if walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] == 0 then walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] = -1 end
    end

    self.direction = "up"
    self.image = playerUp

    --store the previous coordinates
    self.prevX = self.x
    self.prevY = self.y

    if self.y ~= 0 then
      --change previous player coord's from -1 to 0
      if self.sonFollow == false then walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 0 end

      if walls[current_level][(self.y/tile_size)][(self.x/tile_size)+1] ~= 1 then
        self.y = self.y - tile_size
        --below line causes black box bug
        if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] == 0 and self.box == false then walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1 end
      end
    end
  end


  if key == "down" then

    if self.sonFollow then
      son.direction = "down"
      son.image = sonDown
      walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] = 0

      son.y = self.y
      son.x = self.x
    end

    self.direction = "down"
    self.image = playerDown

    if walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] == 0 then walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] = -1 end
    self.prevX = self.x
    self.prevY = self.y
    if self.y ~= window_height - tile_size then

      if self.sonFollow == false then walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 0 end
      if walls[current_level][(self.y/tile_size)+2][(self.x/tile_size)+1] ~= 1 then
        self.y = self.y + tile_size
        if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] == 0 and self.box == false then walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1 end
      end
    end
  end

  if key == "left" then

    if self.sonFollow then
      son.direction = "left"
      son.image = sonLeft
      walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] = 0
      son.y = self.y
      son.x = self.x
    end

    self.direction = "left"
    self.image = playerLeft

    if walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] == 0 then walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] = -1 end
    self.prevX = self.x
    self.prevY = self.y
    if self.x ~= 0 then
      if self.sonFollow == false then walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 0 end
      if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)] ~= 1 then
        self.x = self.x - tile_size
        if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] == 0 and self.box == false then walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1 end
      end
    end
  end

  if key == "right" then

    if self.sonFollow then
      son.direction = "right"
      son.image = sonRight
      walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] = 0
      son.y = self.y
      son.x = self.x
    end

    self.direction = "right"
    self.image = playerRight

    if walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] == 0 then walls[current_level][(son.y/tile_size)+1][(son.x/tile_size)+1] = -1 end
    self.prevX = self.x
    self.prevY = self.y
    if self.x ~= window_width - tile_size then
      if self.sonFollow == false then walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 0 end
      if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+2] ~= 1 then
        self.x = self.x + tile_size
        if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] == 0 and self.box == false then walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1 end
      end
    end
  end

  if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] == 2 then
    self:nextLevel()
  end

  if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] == 3 then
      walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = -1
      keys = keys + 1
  end

  if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] == 4 then
      gotoRoom("Death", 0)
  end
end


function Player:nextLevel()
  self.x = tile_size
  self.y = 0
  son.x = 0
  son.y = 0
  keys = 0
  color = 255
  gotoRoom(next_level, next_level_index)
end



function Son:new()
  self.image = sonDown --love.graphics.newImage("art/alienPink_badge1.png")
  self.x = 0
  self.y = 0
  self.speed = 500
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.prevX = 0
  self.prevY = 0
  self.direction = "down"
end

function Son:update(dt)
  if self.x < 0 then Son.x = 0
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
  end
  if self.y  < 0 then self.y = 0
  elseif self.y + self.height > window_height then
    self.y  = window_height - self.height
  end
end

function Son:draw()
  love.graphics.draw( self.image, self.x, self.y )
end
