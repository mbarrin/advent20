#!/usr/bin/env ruby

lines = File.readlines("../input.txt", chomp: true).map(&:split)

accumulator = 0
visited = []
index = 0

until visited.include?(index)
  cmd = lines[index][0]
  val = lines[index][1].to_i

  visited << index

  case cmd
  when "nop"
    index += 1
  when "acc"
    accumulator += val
    index += 1
  when "jmp"
    index += val
  end
end

puts accumulator
