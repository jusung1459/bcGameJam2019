Object = require('libraries/classic/classic')

Volcano = Object:extend()
count = 0
cross = love.graphics.newImage("/art/greenv.png")
stop = love.graphics.newImage("/art/redv.png")
whichimg = cross


function Volcano:new(x, y)
  self.image = whichimg
  self.x = x
  self.y = y
  self.halt = false
  walls[current_level][(self.y/40)+1][(self.x/40)+1] = 0
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
end

function Volcano:update(dt)
  count = count + 0.025
  if count > 3 then
    if whichimg == stop then
      whichimg = cross
      self.halt = false
      walls[current_level][(self.y/40)+1][(self.x/40)+1] = 0
    else
      whichimg = stop
      self.halt = true
      walls[current_level][(self.y/40)+1][(self.x/40)+1] = 1
    end
    count = 0
  end
  return self.halt
end

function Volcano:draw()
  love.graphics.draw(whichimg, self.x, self.y)
end

function Volcano:checkCollision(player, b)
  --With locals it's common usage to use underscores instead of camelCasing
  local player_left = player.x
  local player_right = player.x + player.width
  local player_top = player.y
  local player_bottom = player.y + player.height

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
