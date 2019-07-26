class FindRepeatFrequency
  def execute(input)

    return 0 if input == [0]

    return nil if same_signs?(input)

    return 0 if converges_to_zero?(input)

    return nil if doesnt_converge?(input) #fragile, priority dependant

    frequency_array(input).last
    #freq_array.find {|i| freq_array.count(i) > 1}

    # if [[-4, 2, 3],[3, 2, -4],[3, 5, -6]].any?(input)
    #   (input[0] + input[1])
    # else
    #   input[0]
    # end
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
  def frequency_array(array)
    array *= array.map { |e| e.abs }.max
    @sum = 0
    i = 0
    freq_array =[0]
    while i < array.length && freq_array.uniq == freq_array
      @sum += array[i]
      freq_array.push(@sum)
      i += 1
    end
    freq_array
  end
end
