require_relative("input_converter")
require_relative("report_repair")

input = File.read("input.txt")

expense_report = InputConverter.new.execute(input)

answer = ReportRepair.new.execute(expense_report,2)

second_answer = ReportRepair.new.execute(expense_report,3)

puts answer

puts second_answer
