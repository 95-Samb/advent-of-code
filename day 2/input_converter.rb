class InputConverter
  def convert(input)
    input.split("\n").map(&:to_s)
  end
end
