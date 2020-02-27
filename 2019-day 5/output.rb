#output
require_relative 'input_converter'
require_relative "new_intcode"


input = File.read('input.txt')
opcodes = InputConverter.new.convert(input)

answer = NewIntcode.new.execute(1,opcodes)

puts answer[1]
