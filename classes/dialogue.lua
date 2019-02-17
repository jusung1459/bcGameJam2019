require 'classes/npc.lua'
Object = require 'libraries/classic/classic'

DialogueBox = Object:extend()

local winHeight = love.window.getHeight
local winWidth = love.window.getWidth

function DialogueBox:new()
  self.height = winHeight/3.0
  self.width = winWidth
  self.xPos = 0
  self.yPos = winHeight/3


end

function DialogueBox:load()

end

function DialogueBox:update()

end

function DialogueBox:draw()
  --draw the black dialogue box
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle('fill', self.xPos, self.yPos, self.width, self.height)
end
