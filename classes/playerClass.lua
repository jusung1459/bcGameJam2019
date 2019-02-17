


-- Player and Son class
Player = Object:extend()
Son = Object:extend()



local window_width = love.graphics.getWidth()
local window_height = love.graphics.getHeight()

--create a new player
function Player:new()
  self.image = love.graphics.newImage( "/art/whale.png" )
  self.x = 40
  self.y = 0
  self.keys = 0
  self.speed = 500
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.prevX = 40;
  self.prevY = 0;
end

function Player:checkCollision(player, b)
    --With locals it's common usage to use underscores instead of camelCasing
    local player_left = self.x
    local player_right = self.x + self.width
    local player_top = self.y
    local player_bottom = self.y + self.height

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    --If Red's right side is further to the right than Blue's left side.
    if player_right > b_left and
    --and Red's left side is further to the left than Blue's right side.
    player_left < b_right and
    --and Red's bottom side is further to the bottom than Blue's top side.
    player_bottom > b_top and
    --and Red's top side is further to the top than Blue's bottom side then..
    player_top < b_bottom then
        --There is collision!
        return true
    else
        --If one of these statements is false, return false.
        return false
    end
end


--check the boundaries
function Player:update(dt, stop)

  if stop == true then
    self.x = self.x - self.width
    self.y = self.y - self.height
    --[[self.x = self.width - self.x
    self.y = self.height - self.y]]--
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

  --when you are inside a volcano and it turns red
  if self.y ~= 560 and self.y ~= 0 and self.x ~= 0 and self.x ~= 760 then
    if walls[current_level][(self.y/40)][(self.x/40)] == 1 then
      self.x = self.prevX
      self.y = self.prevY
    end
  end
end

--draw the player
function Player:draw()
  love.graphics.draw( self.image, self.x, self.y )
end


--move character+son
function Player:keypressed(key, son)

  if key == "up" then
    son.y = self.y
    son.x = self.x
    self.prevX = self.x
    self.prevY = self.y
    if self.y ~= 0 then
      if walls[current_level][(self.y/40)][(self.x/40)+1] ~= 1 then
        self.y = self.y - 40
      end
    end
  end

  if key == "down" then
    son.y = self.y
    son.x = self.x
    self.prevX = self.x
    self.prevY = self.y
    if self.y ~= 560 then
      if walls[current_level][(self.y/40)+2][(self.x/40)+1] ~= 1 then
        self.y = self.y + 40
      end
    end
  end

  if key == "left" then
    son.y = self.y
    son.x = self.x
    self.prevX = self.x
    self.prevY = self.y
    if self.x ~= 0 then
      if walls[current_level][(self.y/40)+1][(self.x/40)] ~= 1 then
        self.x = self.x - 40
      end
    end
  end
  if key == "right" then
    son.y = self.y
    son.x = self.x
    self.prevX = self.x
    self.prevY = self.y
    if self.x ~= 760 then
      if walls[current_level][(self.y/40)+1][(self.x/40)+2] ~= 1 then
        self.x = self.x + 40
      end
    end
  end

  if walls[current_level][(self.y/40)+1][(self.x/40)+1] == 2 then
    self:nextLevel()
  end
  if walls[current_level][(self.y/40)+1][(self.x/40)+1] == 3 then
      walls[current_level][(self.y/40)+1][(self.x/40)+1] = 0
      keys = keys + 1
end
end


function Player:nextLevel()
  self.x = 40
  self.y = 0
  son.x = 0
  son.y = 0
  keys = 0
  gotoRoom(next_level, next_level_index)
end



function Son:new()
  self.image = love.graphics.newImage("art/penguin.png")
  self.x = 0
  self.y = 0
  self.speed = 500
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
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
