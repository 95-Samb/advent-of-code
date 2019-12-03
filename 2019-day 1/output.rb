# frozen_string_literal: true

require_relative 'input_converter'
require_relative 'fuel_sum'
# take in input
input = File.read('input.txt')
fuels = InputConverter.new.convert(input)

# get the answer from the other component
answer = FuelSum.new.execute(fuels)
# spit out the answer
puts answer
