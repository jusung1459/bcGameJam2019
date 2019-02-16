Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Options = typeA:extend()

function Options:new()
    background = love.graphics.newImage('art/menu/background.png')
end 

function Options:update(dt)
end

function Options:draw()
    love.graphics.draw(background, 0, 0)
end