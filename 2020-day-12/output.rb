require_relative "input_converter"
require_relative "ship_navigator"

input = File.read("input.txt")

instructions = InputConverter.new.execute(input)

starting_position = ShipNavigator.new

starting_position.take_instructions(instructions)

final_position = starting_position.instance_variable_get(:@data)

answer = final_position[0].abs + final_position[1].abs

puts answer
