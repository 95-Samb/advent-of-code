require_relative "adapter_configurator"
require_relative "input_converter"

input = File.read("input.txt")

adapters = InputConverter.new.execute(input)

jolt_differences = AdapterConfigurator.new(adapters).jolt_differences

jolt_differences[:three] += 1 #device joltage

puts jolt_differences[:one] * jolt_differences[:three]

