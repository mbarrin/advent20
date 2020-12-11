#!/usr/bin/env ruby
#
require 'pry'
def part1(lines)
  outlet = 0

  tracker = { 1 => 0, 2 => 0, 3 => 0 }

  until outlet == lines.max
    if lines.include?(outlet+1)
      outlet += 1
      tracker[1] += 1
    elsif lines.include?(outlet+2)
      outlet += 2
      tracker[2] += 1
    elsif lines.include?(outlet+3)
      outlet += 3
      tracker[3] += 1
    end
  end

  tracker[3] += 1

  tracker[3] * tracker[1]
end

def part2(lines)
  fork_indexes = {}
  fork_count = 0
  lines.to_enum.with_index.reverse_each do |line, index|
    foo = [1,2,3].map do |i|
      index+i if lines.include?(line+i)
    end
    foo = foo.compact
    if foo.size >= 2
      fork_indexes[index] = foo
    end
  end
  fork_indexes
end

def main
  lines = File.readlines("../test.txt", chomp: true).map(&:to_i).sort

  # puts part1(lines)
  puts part2(lines)
end


main
