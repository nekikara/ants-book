#! /usr/bin/env ruby
# coding: utf-8

require 'pp'

$input = [
['#', 's', '#', '#', '#', '#', '#', '#', '.', '#'],
['.', '.', '.', '.', '.', '.', '#', '.', '.', '#'],
['.', '#', '.', '#', '#', '.', '#', '#', '.', '#'],
['.', '#', '.', '.', '.', '.', '.', '.', '.', '.'],
['#', '#', '.', '#', '#', '.', '#', '#', '#', '#'],
['.', '.', '.', '.', '#', '.', '.', '.', '.', '#'],
['.', '#', '#', '#', '#', '#', '#', '#', '.', '#'],
['.', '.', '.', '.', '#', '.', '.', '.', '.', '.'],
['.', '#', '#', '#', '#', '.', '#', '#', '#', '.'],
['.', '.', '.', '.', '#', '.', '.', '.', 'g', '#'],
]

$y = 9
$x = 9
$dire = Array.new(10) { Array.new(10) }
$goal = []
$visited = []

def maze(y, x)
  que = []
  que << [y, x]
  $dire[y][x] = 0
  while 1 <= que.length do
    cy, cx = que.pop
    break if $input[cy][cx] == 'g'
    $visited << [cy, cx]
    [[cy+1, cx], [cy, cx+1], [cy-1, cx], [cy, cx-1]].each do |ny, nx|
      if 0 <= ny && ny <= $y && 0 <= nx && nx <= $x && $visited.all? {|w|w != [ny, nx]} && $input[ny][nx] != '#'
        que << [ny, nx]
        $dire[ny][nx] = $dire[cy][cx] + 1
        $goal = [ny, nx] if $input[ny][nx] == 'g'
      end
    end
  end
end

(0..$y).each do |y|
  (0..$x).each do |x|
    if $input[y][x] == 's'
      maze(y, x)
    end
  end
end

gy, gx =  $goal
pp $dire[gy][gx]
