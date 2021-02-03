class PassportValidator
  def execute(input)
    input.split(" ").length == 8 ? 1: 0
  end
end
