#!/usr/bin/env ruby
#

def count_trees(map, right, down)
  x, y = 0, 0

  tree_count = 0

  height = map.length
  width = map.first.length

  until y == height - 1 do
    x += right; y += down

    tree_count += 1 if map[y][x%width] == "#"
  end

  tree_count
end

def main
  map = File.readlines("../input.txt").map(&:strip).map(&:chars)

  puts count_trees(map, 3, 1)

  paths = [[1,1], [3,1], [5,1], [7,1], [1,2]]
  total = 1
  paths.map do |path|
    total *= count_trees(map, path[0], path[1])
  end

  puts total
end

main
