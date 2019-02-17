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
  love.graphics.setColor(0, 0, 0, 0.3)
  love.graphics.rectangle('fill', self.xPos, self.yPos, self.width, self.height)

end

function DialogueBox:speak(message)
    local offset = 20;
    love.graphics.setColor(1, 1, 1, 1)

    font = love.graphics.newFont("orange_kid.ttf", 30)
    love.graphics.setFont(font)
    love.graphics.print(message, self.xPos+offset, self.yPos + offset)
end
