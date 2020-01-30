require_relative "input_converter"

input = File.read('input.txt')

wires = InputConverter.new.convert(input)

puts wires
