#!/usr/bin/env ruby
require 'pry'
def can_hold(bags, type, end_bags)
  end_bags << type unless type == "shiny gold"

  bags.each do |k,v|
    v.each do |x|
      next if x.nil?

      puts "bag: #{k} count: #{v.map { |i| i.values }.inject(:+).inject(:+)}"

      can_hold(bags, k, end_bags) if x.key?(type)
    end
  end

  end_bags
end

def main
  @total = 0
  end_bags = []

  lines = File.readlines("../test.txt", chomp: true)

  bag = "shiny gold"

  root = {}

  lines.each do |line|
    key, values = line.split(" bags contain ")

    root[key] = values.split(",").map do |val|
      match =  val.match(/(\d+)\s(\w+\s\w+)/)
      if match.nil?
        nil
      else
        { match[2] => match[1].to_i }
      end
    end

  end

  puts can_hold(root, bag, end_bags).uniq.size
end

main
