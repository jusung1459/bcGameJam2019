require 'libraries/classic/classic'

Object = require 'libraries/classic/classic'

Intro = Object:extend()

function Intro:new(message, )
    self.message = message
end

function Intro:dialogue(dialogue)
  
    dialogue:draw()
    dialogue:speak(self.message)
end


