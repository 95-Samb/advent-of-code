class PasswordFinder

  def execute(lower_limit,upper_limit)
    i = lower_limit.dup
    password_array = []
    until i == upper_limit + 1
      if duplicate_adjacent_number(i) && increasing_digits?(i)
        password_array.push(i)
        i += 1
      else
        i += 1
      end
    end
    password_array.length
  end

  def duplicate_adjacent_number(input)
    input_array = input.to_s.split("")
    i = 0
    until i == input_array.length - 1
      if input_array[i] == input_array[i + 1]
        return true
      else
        i += 1
      end
    end
    false
  end

  def increasing_digits?(input)
    input_array = input.to_s.split("").map(&:to_i)
    i = 0
    until i == input_array.length - 1
      if input_array[i] <= input_array[i + 1]
        i += 1
      else
        return false
      end
    end
    true
  end
end
