require 'libraries/classic/classic'

Object = require 'libraries/classic/classic'

Intro = Object:extend()

local time = 0

function Intro:new(message, stop)
    self.message = message
    self.stop = stop
end

function Intro:dialogue(dialogue)
  if self.stop then
    dialogue:draw()
    dialogue:speak(self.message)
  end
end

function Intro:update(dt)
    time = time - 1
    if time <= 0 then
        self.stop = false
    end

end
