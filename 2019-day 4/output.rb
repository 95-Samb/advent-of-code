#puts answer
require_relative "password_finder"

first_passwords = PasswordFinder.new.possible_passwords(124075,580769)

answer = first_passwords.length

second_answer = PasswordFinder.new.second_execute(first_passwords).length

puts answer

puts second_answer
