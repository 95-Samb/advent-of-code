require_relative "seating_system"
require_relative "input_converter"

input = File.read("input.txt")

seating = InputConverter.new.execute(input)

answer = SeatingSystem.new(seating).solve_seating

second_answer = SeatingSystem.new(seating).new_solve_seating

puts answer.flatten.count("#")
puts second_answer.flatten.count("#")
