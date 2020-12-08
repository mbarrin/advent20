#!/usr/bin/env ruby

require 'pry'

def run_code(lines)
  accumulator = 0
  visited = []
  index = 0

  until visited.include?(index)
    cmd = lines[index][0]
    val = lines[index][1].to_i

    visited << index

    case cmd
    when "nop"
      index += 1
    when "acc"
      accumulator += val
      index += 1
    when "jmp"
      index += val
    end

    return { success: true, accumulator: accumulator } if index == lines.length
  end

  { success: false, accumulator: accumulator }
end

def switch(cmd)
  return "nop" if cmd == "jmp"

  return "jmp" if cmd == "nop"

  cmd
end

def main
  lines = File.readlines("../input.txt", chomp: true).map(&:split)

  results = run_code(lines)
  puts results[:accumulator]

  until results[:success]
    new_lines = lines.dup

    new_lines.each_with_index do |line, index|
      new_lines[index][0] = switch(new_lines[index][0]) if line.first == "nop" || line.first == "jmp"
      results = run_code(new_lines)
      break if results[:success]
      new_lines[index][0] = switch(new_lines[index][0]) unless results[:success]
    end
  end
  puts results[:accumulator]
end

main
