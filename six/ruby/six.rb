#!/usr/bin/env ruby
groups = File.open("../input.txt").read.chomp.split("\n\n")

first_count, second_count = 0, 0

groups.each do |group|
  party_size = group.split.count

  answers = group.gsub("\n", "").chars.tally

  first_count += answers.values.count

  second_count += answers.values.count { |val| val >= party_size }
end

puts first_count
puts second_count
