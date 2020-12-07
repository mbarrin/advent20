#!/usr/bin/env ruby
require 'pry'
def can_hold(bags, type, end_bags)
  end_bags << type unless type == "shiny gold"

  bags.each do |k,v|
    v.each do |x|
      next if x.nil?
      if x.key?(type)
        can_hold(bags, k, end_bags)
      end
    end
  end

  end_bags
end

def main
  end_bags = []

  lines = File.readlines("../input.txt", chomp: true)

  bag = "shiny gold"

  root = {}

  lines.each do |line|
    key, values = line.split(" bags contain ")

    root[key] = values.split(",").map do |val|
      match =  val.match(/(\d+)\s(\w+\s\w+)/)
      if match.nil?
        nil
      else
        { match[2] => match[1] }
      end
    end

  end

  puts root

  puts can_hold(root, bag, end_bags).uniq.size
end

main
