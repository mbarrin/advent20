#!/usr/bin/env ruby
#
def main
  lines = File.readlines("../input.txt", chomp: true).map(&:to_i).sort

  outlet = 0

  tracker = { 1 => 0, 2 => 0, 3 => 0 }

  until outlet == lines.max
    if lines.include?(outlet+1)
      outlet += 1
      tracker[1] += 1
      next
    elsif lines.include?(outlet+2)
      outlet += 2
      tracker[2] += 1
      next
    elsif lines.include?(outlet+3)
      outlet += 3
      tracker[3] += 1
      next
    end
  end

  tracker[3] += 1

  puts tracker[3] * tracker[1]
end

main
