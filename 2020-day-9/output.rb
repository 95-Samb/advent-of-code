require_relative "addition_system"
require_relative "input_converter"

input = File.read("input.txt")

numbers = InputConverter.new.execute(input)

answers = AdditionSystem.new(numbers).no_pair_sum(25)

puts answers[0]
