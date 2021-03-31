require_relative "boot_code_formatter"
require_relative "boot_code_computer"

input = File.read("input.txt")

boot_code = BootCodeFormatter.new.execute(input)

accumulator = BootCodeComputer.new(boot_code,"").execute

array_of_accumulators = BootCodeComputer.new(boot_code,"last instruction").infinite_fix

array_of_accumulators.delete(nil)

puts accumulator

puts array_of_accumulators
