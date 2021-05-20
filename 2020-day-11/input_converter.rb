class InputConverter
  def execute(input)
    input.split("\n").map { |e| e.chomp.split("")  }
  end
end
