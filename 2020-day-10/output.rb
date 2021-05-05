require_relative "adapter_configurator"
require_relative "input_converter"

input = File.read("input.txt")

adapters = InputConverter.new.execute(input)

subject = AdapterConfigurator.new(adapters)

jolt_differences = subject.jolt_differences

number_of_arrangements = subject.charging_arrangements

jolt_differences[:three] += 1 #device joltage

puts jolt_differences[:one] * jolt_differences[:three]

puts number_of_arrangements

