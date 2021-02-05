require_relative "input_converter"
require_relative "passport_validator"

input = File.read("input.txt")

passports = InputConverter.new.execute(input)

answer = PassportValidator.new.amount_with_required_fields(passports)

puts answer

