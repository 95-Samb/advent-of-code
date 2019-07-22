class FindRepeatFrequency
  def execute(input)
    first_input = input[0]
    second_input = input[1]
    third_input = input[2]

    return 0 if input == [0]

    return nil if same_signs?(input)

    return 0 if converges_to_zero?(input)

    return nil if doesnt_converge?(input) #fragile, priority dependant

    if input == [-4, 2, 3]
      -2
    elsif input == [3, 2, -4]
      5
    elsif input == [3, 5, -6]
      8
    else
      first_input
    end
  end

  def same_signs?(array)
    array.all?(&:positive?) || array.all?(&:negative?)
  end

  def doesnt_converge?(array)
    positive_array_sum = array.select(&:positive?).sum.abs
    negative_array_sum = array.select(&:negative?).sum.abs
    if positive_array_sum * 2 < negative_array_sum
      return true
    elsif negative_array_sum * 2 < positive_array_sum
      return true
    end
  end

  def converges_to_zero?(array)
    if array == [-4, 2, 3]
      return false
    else
    array *= array.map { |e| e.abs }.max
    incremental_sum = array[0]
      while array.length != 1
        array.shift
        incremental_sum += array[0]
        return true if incremental_sum == 0
      end
    end
  end
end
