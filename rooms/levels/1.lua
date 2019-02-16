Object = require 'libraries/classic/classic'
require 'game'

Lv1 = Game:extend()

function Lv1:init()
    local obstacle = {}
    --insert matrix here for obstacle
    walls[4] = obstacle
    return obstacle
end

function Lv1:activate()
    previous_room = 'Lv1'
    previous_room_index = 4
end
