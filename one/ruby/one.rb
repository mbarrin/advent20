#!/usr/bin/env ruby

TOTAL = 2020

def two(hash)
  hash.each do |k,v|
    next unless hash.key?(TOTAL - k)

    return k * (TOTAL - k)
  end
end

def three(numbers)
  combo = numbers.combination(3).to_a
  combo.each do |group|
    return group.inject(1, :*) if group.sum == TOTAL
  end
end

def main
  numbers = File.readlines("../input.txt").map(&:to_i).sort

  hash = {}

  numbers.each do |num|
    hash[num.to_i] = 1
  end

  puts two(hash)
  puts three(numbers)
end

main
