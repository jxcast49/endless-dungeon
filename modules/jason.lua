love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local Entity = require 'core/entity'
local Util = require 'core/util'
local gamera = require 'core/gamera'
function love.load()
  f = love.graphics.newFont(200)
  love.graphics.setFont(f)
  arrow = love.graphics.newImage('assets-1/dungeon/traps/down-arrow.png')

  ex = 100
    ey = 100
    eimg = love.graphics.newImage('assets-1/player/base/octopode_2.png')

time = 159 -- store a big number in time

  x = 250
  y = 100
cam = gamera.new(10, 10, 2000, 2000)
  tile = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_4.png')
  tile2 = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_9.png')
  tile3 = love.graphics.newImage('assets-1/dungeon/wall/bars_red_1.png')
  playerImg = love.graphics.newImage('assets-1/player/base/naga_red_female.png')

wall = love.graphics.newImage('assets-1/dungeon/wall/transparent_stone.png')
  map = {
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile ,tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile3},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile2, tile2, tile2, tile2, tile2, tile2, tile2, tile, tile},
    {tile, tile, tile, tile2, tile2, tile, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile2, tile2, tile, tile, tile, tile},
    {tile, tile, tile, tile2, tile3, tile3, tile, tile, tile, tile}
}
collision = {
    {wall, wall, wall, wall,wall,wall,wall,wall,wall,wall},
    {wall, 'nil', 'nil', wall,'nil','nil','nil',wall,'nil'},
    {wall, 'nil', 'nil', wall,'nil','nil','nil',wall,'nil'},
    {wall, 'nil', 'nil', wall,'nil','nil','nil',wall,'nil'},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil',wall,'nil'},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil',wall,'nil'},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil',wall,'nil'},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil',wall,'nil'},
    {wall, 'nil', 'nil', wall,'nil',wall,'nil',wall,'nil'},
    {wall, 'nil', 'nil', 'nil','nil',wall,'nil','nil','nil'},
    {wall, 'nil', 'nil', 'nil','nil',wall,'nil','nil','nil'},
    {wall, wall, wall, wall,wall,wall,wall,wall,wall},
  }
cam:setPosition(400, 400)
  bkgrnd = Map:new(map)
  collision = Map:new(collision)

  --background = Map:new(background)
end



function love.update(dt)
  if love.keyboard.isDown('up') then
    if collision:cc(x, y - 10, 50, 50) == false then
      y = y - 10
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y + 10 , 50, 50)  == false then
      y = y + 10
    end
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x + 10, y, 50, 50)  == false then

      x = x + 10
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x - 10, y, 50, 50)  == false then
      x = x - 10
    end
  end

time = time - 1
if time < 0 then
love.load()
end

if y > 580 then
  love.exitModule()
end


  if ex > x then
  ex = ex - 4
  end
  if ex < x then
  ex = ex + 4
  end
  if ey > y then
  ey = ey - 4
  end
  if ey < y then
  ey = ey + 4
  end
if love.keyboard.isDown('escape')then
love.exitModule()
  end
end


function love.draw()
  bkgrnd:draw()
  collision:draw()
  love.graphics.setColor(0, 0, 0.8,0.9)
  love.graphics.print(math.floor(time/159 * 10) + 1, 0, 0)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(playerImg, x, y)
    love.graphics.draw(eimg, ex, ey)
    love.graphics.draw(arrow, 265, 325, 0, 0.2)
    love.graphics.draw(arrow, 520, 200, 0, 0.2)
    love.graphics.draw(arrow, 520, 455, 0, 0.2)
end
