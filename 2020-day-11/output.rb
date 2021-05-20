require_relative "seating_system"
require_relative "input_converter"

input = File.read("input.txt")

seating = InputConverter.new.execute(input)

answer = SeatingSystem.new(seating).solve_seating

puts answer.flatten.count("#")
