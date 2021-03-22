require_relative "boot_code_formatter"
require_relative "boot_code_computer"

input = File.read("input.txt")

boot_code = BootCodeFormatter.new.execute(input)

accumulator = BootCodeComputer.new(boot_code).execute

puts accumulator
