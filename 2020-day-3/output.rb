require_relative "input_converter"
require_relative "toboggan_trajectory"

input = File.read("input.txt")

slope = InputConverter.new.execute(input)

answer = TobogganTrajectory.new.execute(slope)

puts answer
