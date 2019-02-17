require 'classes/npc'
Object = require 'libraries/classic/classic'

DialogueBox = Object:extend()

local winHeight = love.graphics.getHeight()
local winWidth = love.graphics.getWidth()

function DialogueBox:new()
  self.height = winHeight/4.0
  self.width = winWidth
  self.xPos = 0
  self.yPos = winHeight - winHeight/4


end

function DialogueBox:load()

end

function DialogueBox:update()

end

function DialogueBox:draw()
  --draw the black dialogue box
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle('fill', self.xPos, self.yPos, self.width, self.height)
end
