#!/usr/bin/env ruby

lines = File.readlines("../input.txt", chomp: true).map(&:to_i)

window = 25

previous = lines[0, window]

to_check = 0

lines[window..-1].each_cons(window) do |con|
  to_check = con.first
  break to_check unless previous.combination(2).map(&:sum).include?(to_check)
  previous = previous[1..-1] << to_check
end

puts to_check
