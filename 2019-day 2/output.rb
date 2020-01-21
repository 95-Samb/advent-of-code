# frozen_string_literal: true

require_relative 'intcode.rb'
require_relative 'input_converter'
require_relative 'noun_verb_finder'

input = File.read('input.txt')
opcodes = InputConverter.new.convert(input)
opcodes[1] = 53
opcodes[2] = 35

answer = Intcode.new.execute(opcodes.dup)
second_answer = NounVerbFinder.new.execute(opcodes,19690720)

puts answer[0]
puts second_answer

