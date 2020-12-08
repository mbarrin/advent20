#!/usr/bin/env ruby
require 'pry'
def can_hold(bags, type, end_bags)
  end_bags << type unless type == "shiny gold"

  bags.each do |k,v|
    next if v.nil?
    can_hold(bags, k, end_bags) if v.keys.include?(type)
  end

  end_bags
end

def count_bags(bags, type)
  return 0 if bags[type].nil?

  total = bags[type].sum do |bag, count|
    count * (count_bags(bags, bag) + 1)
  end

  total
end

def main
  end_bags = []

  lines = File.readlines("../input.txt", chomp: true)

  bag = "shiny gold"

  root = {}

  lines.each do |line|
    key, values = line.split(" bags contain ")

    values.split(",").each do |val|
      root[key] = {} unless root.key?(key)
      match =  val.match(/(\d+)\s(\w+\s\w+)/)
      if match.nil?
        root[key] = nil
      else
        root[key][match[2]] = match[1].to_i
      end
    end
  end

  puts can_hold(root, bag, end_bags).uniq.size
  puts count_bags(root, bag)
end

main
