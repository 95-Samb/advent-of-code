class FindRepeatFrequency
  def execute(input)
    first_input = input[0]
    second_input = input[1]

    return 0 if input == [0]

    return nil if same_signs?(input)
    return nil unless first_input.abs * 2 >= second_input.abs
    return nil unless first_input.abs <= second_input.abs * 2

    return 0 if converges_to_zero?(first_input, second_input)

    first_input
  end

  def same_signs?(array)
    array.all?(&:positive?) || array.all?(&:negative?)
  end

  def converges_to_zero?(first_input, second_input)
    first_input.abs <= second_input.abs
  end

  def converges_to_first_input?(first_input, second_input)
    first_input.abs > second_input.abs
  end
end
