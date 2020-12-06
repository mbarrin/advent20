#!/usr/bin/env ruby
groups = File.open("../input.txt").read.chomp.split("\n\n")

first_count = 0
second_count = 0

groups.each do |group|
  party_size = group.split.count

  answers = group.gsub("\n", "").chars.tally

  first_count += answers.keys.count

  second_count += answers.values.map { |val| val >= party_size }.tally[true].to_i
end

puts first_count
puts second_count
