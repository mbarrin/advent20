#!/usr/bin/env ruby
lines = File.readlines("../input.txt", chomp: true).map(&:to_i)

window = 25

previous = lines[0, window]

to_check = 0
bad_number = nil

lines[window..-1].each_cons(window) do |con|
  to_check = con.first
  unless previous.combination(2).map(&:sum).include?(to_check)
    bad_number = to_check
    break
  end
  previous = previous[1..-1] << to_check
end

puts bad_number

(0..lines.size).each do |i|
  (i..lines.size).each do |j|
    sub_array = lines[i..j]
    if sub_array.sum == bad_number && sub_array.length > 1
      puts sub_array.max + sub_array.min
    end
  end
end
