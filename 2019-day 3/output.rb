require_relative "input_converter"
require_relative "manhattan_distance"

input = File.read('input.txt')

wires = InputConverter.new.convert(input)

answer = ManhattanDistance.new.execute(wires)

second_answer = ManhattanDistance.new.quickest_intersection(wires)

puts answer

puts second_answer
