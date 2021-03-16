class InputConverter
  def execute(input)
    input.split("\n").map(&:chomp)
  end
end
