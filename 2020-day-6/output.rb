require_relative "input_converter"
require_relative "customs_form"

input = File.read("input.txt")

group_forms = InputConverter.new.execute(input)

group_yes_answers = group_forms.map { |e| CustomsForm.new.yes_answers(e)  }

answer = group_yes_answers.sum

puts answer
