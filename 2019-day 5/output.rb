#output
require_relative 'input_converter'
require_relative "new_intcode"


input = File.read('input.txt')
opcodes = InputConverter.new.convert(input)

answer = NewIntcode.new.execute(1,opcodes.dup)

second_answer = NewIntcode.new.execute(5,opcodes.dup)

puts answer[1]
puts second_answer[1]
