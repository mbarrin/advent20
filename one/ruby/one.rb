#!/usr/bin/env ruby

TOTAL = 2020

def combo(numbers, combination)
  numbers.combination(combination).each do |group|
    return group.inject(:*) if group.sum == TOTAL
  end
end

def main
  numbers = File.readlines("../input.txt").map(&:to_i).sort

  puts combo(numbers, 2)
  puts combo(numbers, 3)
end

main
