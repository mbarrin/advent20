#!/usr/bin/env ruby
#
lines = File.readlines("../input.txt", chomp: true)

ids = []
lines.each do |line|
  instructions = line.chars

  rmin = 0
  rmax = 127

  cmin = 0
  cmax = 7

  instructions.each_with_index do |instruction, i|
    if instruction == "F" # low
      rmax = rmax - ((rmax - rmin) / 2) - 1
    elsif instruction == "B" # high
      rmin = rmin + ((rmax - rmin) / 2) + 1
    elsif instruction == "L" # low
      cmax = cmax - ((cmax - cmin) / 2) - 1
    elsif instruction == "R" # high
      cmin = cmin + ((cmax - cmin) / 2) + 1
    end
  end

  ids << (rmin * 8) + cmin
end

ids.sort!

min = ids.first
max = ids.last

# part 1
puts max

#part 2
puts (min..max).to_a - ids
