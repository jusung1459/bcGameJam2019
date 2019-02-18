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
  -- self.left = true
  -- self.idle = true
  -- self.frameLimit = idleFrameLimit
  -- self.width = worm_right:getWidth()
  -- self.height = worm_left:getHeight()
  walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+1] = 4

  -- local img = worm_left
  -- for y = 0, img.getHeight() - 40, 40 do
  --   for x = 0, img.getWidth() - 40, 40 do
  --     table.insert(idleFrames.quads, love.graphics.newQuad(i * frame_width, 0, frame_width, frame_height, self.width, self.height))
  --   end
  -- end

end

function Worm:update(dt)
    --[[
    count = count + 0.025
    if count > 5 then
        self.idle = false
        local rng = love.math.random()
        if rng then
            if self.x == 0 then self.left = false
            elseif self.x == window_width - tile_size then self.left = true
            elseif rng then self.left = false
            else self.left = true
            end
        end
    end
    ]]
    currentframe = currentFrame + 1
    if currentFrame > self.frameLimit then currentFrame = 1 end
end

-- function Worm:draw()
--     if pause == 0 then
--     if self.idle == false and self.left == true and self.frameLimit == currentFrame then
--         self.frameLimit = moveFrameLimit
--         self:drawLeft()
--         self.idle = true
--         count = 0
--         self.frameLimit = idleFrameLimit
--     end
--     if self.idle == false and self.left == false and self.frameLimit == currentFrame then
--         self.frameLimit = moveFrameLimit
--         self:drawRight()
--         self.idle = true
--         count = 0
--         self.frameLimit = idleFrameLimit
--     else self:drawIdle() end
-- end
-- end

-- function Worm:drawIdle()
--     love.graphics.draw(self.image, idleFrames[math.floor(currentFrame)], self.x, self.y)
-- end
--
-- function Worm:drawLeft()
--     if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)] == 0 then
--         walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)] = 4
--         self.x = self.x - tile_size
--         walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+2] = 0
--     end
-- end
--
-- function Worm:drawRight()
--     if walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+2] == 0 then
--         walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+2] = 4
--         self.x = self.x + tile_size
--         walls[current_level][(self.y/tile_size)+1][(self.x/tile_size)+2] = 0
--     end
--
-- end
