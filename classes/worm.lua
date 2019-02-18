require 'libraries/classic/classic'
require 'classes/playerClass'

Worm = Player:extend()
local idleFrames = {}
idleFrames.quads = {}
local moveFrames = {}
-- local worm_right = love.graphics.newImage('art/worm.png')
-- local worm_left = love.graphics.newImage('art/worm_left.png')
local wormSequence = love.graphics.newImage("art/wormSequence.png")
local currentFrame = 1
local idleFrameLimit = 8
local moveFrameLimit = 8
local count = 0
local frame_width = 40
local frame_height = 40

function Worm:new(x, y)
  self.frames = idleFrames
  self.image = worm_left
  self.x = x
  self.y = y
  walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 4


end

function Worm:update(dt)
  animation.currentTime = animation.currentTime + love.timer.getDelta()
  if animation.currentTime >= animation.duration then
      animation.currentTime = animation.currentTime - animation.duration
  end

end

function Worm:draw()
    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], worm.x, worm.y, 0, 1)
end
