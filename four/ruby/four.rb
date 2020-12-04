#!/usr/bin/env ruby
require 'pry'

#class Identification
#
#  attr_reader :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid
#
#  def initialize(data)
#    @byr = data["byr"]
#    @iyr = data["iyr"]
#    @eyr = data["eyr"]
#    @hgt = data["hgt"]
#    @hcl = data["hcl"]
#    @ecl = data["ecl"]
#    @pid = data["pid"]
#    @cid = data["cid"]
#  end
#
#  def valid?
#    binding.pry
#  end
#end

file = File.open("../input.txt")

ids = []
tmp = []

while (line = file.gets) do
  if file.eof?
    tmp << line.chomp!
    ids << tmp
    break
  end

  if line == "\n"
    ids << tmp
    tmp = []
    next
  end

  tmp << line.chomp!
end

ids = ids.map { |x| x.join(" ") }

valid = 0

ids.each do |id|
  data = {}
  id.split(" ").each do |i|
    k,v = i.split(":")
    data[k] = v
  end

  next if data.keys.length < 7

  if data.keys.length == 7
    valid += 1 unless data.key?("cid")
  end

  if data.keys.length == 8
    valid += 1
  end
end

puts valid
