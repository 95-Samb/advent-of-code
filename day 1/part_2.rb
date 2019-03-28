require_relative 'input_converter'
require_relative 'find_repeat_frequency'

# take in input
input = File.read('input.txt')
frequency_changes = InputConverter.new.convert(input)

# get the answer from the other component
answer = FindRepeatFrequency.new.execute(frequency_changes)

# spit out the answer
puts answer
