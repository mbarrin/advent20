#!/usr/bin/env ruby

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
    lines.each_with_index do |line, index|
      lines[index][0] = switch(lines[index][0])
      results = run_code(lines)
      break if results[:success]
      lines[index][0] = switch(lines[index][0])
    end
  end
  puts results[:accumulator]
end

main
