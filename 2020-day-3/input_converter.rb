class InputConverter
  def execute(input)
    input.split("\n").map(&:chop)
  end
end
