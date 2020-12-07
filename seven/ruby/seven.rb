#!/usr/bin/env ruby

def can_hold(bags, type)
  @end_bags << type unless type == "shiny gold"

  bags.each do |k,v|
    if v.include?(type)
      can_hold(bags, k)
    end
  end
end

def main
  @end_bags = []

  lines = File.readlines("../input.txt", chomp: true)

  bag = "shiny gold"

  root = {}

  lines.each do |line|
    key, values = line.split(" bags contain ")

    root[key] = values.split(",").map { |i| i.gsub!(/(\d+\s|bag.*)/, "").strip }
  end

  can_hold(root, bag)

  puts @end_bags.uniq.count
end

main
