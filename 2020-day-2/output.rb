require_relative "input_converter"
require_relative "password_validater"

input = File.read("input.txt")

passwords = InputConverter.new.execute(input)

answer = PasswordValidater.new.execute(passwords)

puts answer
