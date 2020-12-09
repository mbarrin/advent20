#!/usr/bin/env ruby

lines = File.readlines("../test.txt", chomp: true).map(&:to_i)

window = 5

previous = lines[0, window]

to_check = 0
bad_number = nil

lines[window..-1].each_cons(window) do |con|
  to_check = con.first
  bad_number = to_check unless previous.combination(2).map(&:sum).include?(to_check)
  previous = previous[1..-1] << to_check
end

puts bad_number
