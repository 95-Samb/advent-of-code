require_relative "input_converter"
require_relative "manhattan_distance"

input = File.read('input.txt')

wires = InputConverter.new.convert(input)

answer = ManhattanDistance.new.execute(wires)

second_answer = ManhattanDistance.new.second_execute(wires)

puts answer

puts second_answer

#pre refactor time = 35.719
#post refactor time = 2.234
