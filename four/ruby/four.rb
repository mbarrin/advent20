#!/usr/bin/env ruby
require 'pry'

class Identification

  attr_reader :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid, :total

  def initialize(data)
    @byr = data["byr"]
    @iyr = data["iyr"]
    @eyr = data["eyr"]
    @hgt = data["hgt"]
    @hcl = data["hcl"]
    @ecl = data["ecl"]
    @pid = data["pid"]
    @cid = data["cid"]
    @total = data.length
  end

  def valid?
    return true if total == 8

    return true if total == 7 && cid.nil?

    false
  end
end

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

  identification = Identification.new(data)

  valid += 1 if identification.valid?
end

puts valid
