#!/usr/bin/env ruby

TOTAL = 2020

def two(numbers)
  hash = {}

  numbers.each do |num|
    hash[num.to_i] = 1
  end

  hash.each do |k,v|
    next unless hash.key?(TOTAL - k)

    return k * (TOTAL - k)
  end
end

def three(numbers)
  numbers.combination(3).each do |group|
    return group.inject(1, :*) if group.sum == TOTAL
  end
end

def main
  numbers = File.readlines("../input.txt").map(&:to_i).sort

  puts two(numbers)
  puts three(numbers)
end

main
