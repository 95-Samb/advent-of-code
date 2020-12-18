require_relative("input_converter")
require_relative("report_repair")

input = File.read("input.txt")

expense_report = InputConverter.new.execute(input)

answer = ReportRepair.new.execute(expense_report)

puts answer
