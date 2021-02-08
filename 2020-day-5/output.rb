require_relative "input_converter"
require_relative "boarding_pass_ids"

input = File.read("input.txt")

boarding_passes = InputConverter.new.execute(input)

boarding_ids = BoardingPassIds.new.execute(boarding_passes)

answer = boarding_ids.max

puts answer
