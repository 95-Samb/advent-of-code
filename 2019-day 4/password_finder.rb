class PasswordFinder

  def execute(input)
  end

  def duplicate_adjacent_number(input)
    input_array = input.to_s.split("")
    i = 0
    until i == input_array.length
      if input_array[i] == input_array[i + 1]
        return true
      else
        i += 1
      end
    end
    false
  end

  def increasing_digits?(input)
    input_array = input.to_s.split("")
    if input_array[0] < input_array[1]
      true
    else
      false
    end
  end
end
