class FindRepeatFrequency
  def execute(input)
    first_input = input[0]
    second_input = input[1] || 0
    third_input = input[2] || 0
    if first_input + second_input == 0
      0
    elsif first_input.abs * 2 == second_input.abs
      0 
    elsif first_input.abs * 2 == third_input.abs
      first_input
    elsif first_input.abs * 1.5 == second_input.abs
      0
    elsif first_input.abs == second_input.abs * 2
      first_input
    else
      nil
    end
  end
end
