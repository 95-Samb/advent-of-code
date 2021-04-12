class InputConverter
  def execute(input)
    input.split("\n").map(&:to_i)
  end
end
