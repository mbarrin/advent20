#!/usr/bin/env ruby

def one(contents)
  valid = 0

  contents.each do |line|
    rule, password = line.split(':')
    count, letter = rule.split(' ')
    min, max = count.split('-').map(&:to_i)

    char_count = password.strip.chars.tally

    valid += 1 if char_count.key?(letter) && char_count[letter] >= min && char_count[letter] <= max
  end

  valid
end

def two(contents)
  valid = 0

  contents.each do |line|
    rule, password = line.split(':')
    count, letter = rule.split(' ')
    first, second = count.split('-').map(&:to_i)

    password.strip!

    valid += 1 if (password[first-1] == letter) ^ (password[second-1] == letter)
  end

  valid
end

def main
  contents = File.readlines("../input.txt")

  puts one(contents)
  puts two(contents)
end

main
