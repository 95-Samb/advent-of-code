require_relative "input_converter"
require_relative "customs_form"

input = File.read("input.txt")

group_forms = InputConverter.new.execute(input)

group_yes_answers = group_forms.map { |e| CustomsForm.new.any_yes_answers(e)  }

group_shared_yes_answers = group_forms.map { |e| CustomsForm.new.shared_yes_answers(e)  }

answer = group_yes_answers.sum

second_answer = group_shared_yes_answers.sum

puts answer

puts second_answer
