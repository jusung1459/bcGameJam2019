--! map class

Map = Object:extend()

function Map.new(width, height, tiles)
    self.width = width
    self.height = height
    self.tiles = tiles
end