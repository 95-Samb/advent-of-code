class InputConverter
  def convert(input)
    input.split("\n").map(&:to_i)
  end
end
