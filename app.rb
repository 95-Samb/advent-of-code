require_relative 'input_converter.rb'

# take in input
input = File.read('input.txt')

# do some magical maths
answer = InputConverter.new.convert(input).sum

# spit out the answer
puts answer
