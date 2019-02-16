Object = require 'libraries/classic/classic'
require 'rooms/typeA'

Options = typeA:extend()

function Options:new()
    image = love.graphics.newImage('art/options.png')
end 

function Options:update(dt)
end

function Options:draw()
    love.graphics.draw(image, 0, 0)
end