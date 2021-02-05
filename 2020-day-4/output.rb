require_relative "input_converter"
require_relative "passport_validator"

input = File.read("input.txt")

passports = InputConverter.new.execute(input)

answer = PassportValidator.new.amount_with_required_fields(passports)

second_answer = PassportValidator.new.amount_with_valid_fields(passports)

puts answer

puts second_answer

