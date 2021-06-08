class InputConverter
  def execute(input)
    input = input.split("\n").map(&:strip)
    input[0] = input[0].to_i
    input[1] = input[1].split(",").map(&:to_i)
    input
  end
end
