# frozen_string_literal: true

require_relative 'input_converter'
require_relative 'find_checksum'
require_relative 'find_letters'
# take in input
input = File.read('input.txt')
box_ids = InputConverter.new.convert(input)

# get the answer from the other component
answer = FindChecksum.new.send(box_ids)
second_answer = FindSimilarBoxIdLetters.new.send(box_ids)
# spit out the answer
puts answer
puts second_answer
