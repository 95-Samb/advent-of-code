require_relative "intcode.rb"
require_relative "input_converter"


input = File.read('input.txt')
opcodes= InputConverter.new.convert(input)

answer = Intcode.new.execute(opcodes)

puts answer
