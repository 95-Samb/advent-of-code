require_relative "addition_system"
require_relative "input_converter"

input = File.read("input.txt")

numbers = InputConverter.new.execute(input)

answers = AdditionSystem.new(numbers).no_pair_sum(25)

consecutive_numbers = AdditionSystem.new(numbers).continuous_sum(answers[0])

puts answers[0]

puts consecutive_numbers.sort[0] + consecutive_numbers.sort[-1]
