#!/usr/bin/env ruby
require 'pry'

class Identification

  attr_reader :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid, :total

  def initialize(data)
    @byr = data["byr"].to_i
    @iyr = data["iyr"].to_i
    @eyr = data["eyr"].to_i
    @hgt = data["hgt"]
    @hcl = data["hcl"]
    @ecl = data["ecl"]
    @pid = data["pid"]
    @cid = data["cid"]
    @total = data.length
  end

  def valid_byr?
    (1920..2002).include?(byr)
  end

  def valid_iyr?
    (2010..2020).include?(iyr)
  end

  def valid_eyr?
    (2020..2030).include?(eyr)
  end

  def valid_hgt?
    height = hgt[0...-2].to_i
    unit = hgt[-2..-1]

    return (150..193).include?(height) if unit == "cm"
    return (59..76).include?(height) if unit == "in"

    false
  end

  def valid_hcl?
    hcl.match?(/#[0-9a-f]{6}/)
  end

  def valid_ecl?
    %w[amb blu brn gry grn hzl oth].include?(ecl)
  end

  def valid_pid?
    pid.match?(/^\d{9}$/)
  end

  def all_fields?
    total == 8
  end

  def just_missing_cid?
    total == 7 && cid.nil?
  end

  def old_valid?
    return true if all_fields? || just_missing_cid?

    false
  end

  def new_valid?
    if all_fields? || just_missing_cid?
      return false unless valid_byr?
      return false unless valid_iyr?
      return false unless valid_eyr?
      return false unless valid_hgt?
      return false unless valid_hcl?
      return false unless valid_ecl?
      return false unless valid_pid?

      return true
    end

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


old_valid = []
new_valid = []

ids.each do |id|
  data = {}
  id.split(" ").each do |i|
    k,v = i.split(":")
    data[k] = v
  end

  next if data.keys.length < 7

  identification = Identification.new(data)

  old_valid << identification if identification.old_valid?
  new_valid << identification if identification.new_valid?
end

puts old_valid.count
puts new_valid.count
