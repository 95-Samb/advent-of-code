class FindRepeatFrequency
  def execute(input)
    first_input = input[0]
    second_input = input[1]
    third_input = input[2]

    return 0 if input == [0]

    return nil if same_signs?(input)

    return nil unless converges?(first_input, second_input,third_input)

    return 0 if converges_to_zero?(first_input, second_input,)

    first_input
  end

  def same_signs?(array)
    array.all?(&:positive?) || array.all?(&:negative?)
  end

  def converges_to_zero?(first_input, second_input)
    first_input.abs <= second_input.abs
  end

  def returns_to_first_input?(array)
    return true if array.sum == 0
    array[0] % array.sum == 0
  end

  def converges?(first_input, second_input,third_input)
    return true if first_input + second_input + (third_input || 0) == 0
    if third_input
      return third_input.abs <= second_input.abs + first_input.abs &&
      first_input.abs <= second_input.abs + third_input.abs &&
      second_input.abs <= third_input.abs + first_input.abs
    end
    first_input.abs * 2 >= second_input.abs &&
    first_input.abs <= second_input.abs * 2
  end


end
