require_relative "input_converter"
require_relative "toboggan_trajectory"

input = File.read("input.txt")

slope = InputConverter.new.execute(input)

answer = TobogganTrajectory.new.trees_hit(slope,1,3)

slopes = [[1,1],[1,3],[1,5],[1,7],[2,1]]

second_answer = TobogganTrajectory.new.total_trees_hit(slope,slopes)

puts answer

puts second_answer
