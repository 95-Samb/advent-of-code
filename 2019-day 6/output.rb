#output
require_relative 'input_converter'
require_relative "orbits"


input = File.read('input.txt')
input_array = InputConverter.convert(input)
answer = Orbits.new.execute(input_array)
second_answer = Orbits.new.orbit_transfers("YOU","SAN",input_array)

puts answer
puts second_answer
