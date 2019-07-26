# frozen_string_literal: true

class FindRepeatFrequency
  def execute(input)
    return 0 if input == [0]

    return nil if same_signs?(input)

    return nil if doesnt_converge?(input)

    frequency_array(input).last
  end

  def same_signs?(array)
    array.all?(&:positive?) || array.all?(&:negative?)
  end

  def doesnt_converge?(array)
    positive_array_sum = array.select(&:positive?).sum.abs
    negative_array_sum = array.select(&:negative?).sum.abs
    return true if positive_array_sum * 2 < negative_array_sum
    return true if negative_array_sum * 2 < positive_array_sum
  end

  def frequency_array(array)
    array *= array.map(&:abs).max
    @sum = 0
    i = 0
    freq_array = [0]
    while i < array.length && freq_array.uniq == freq_array
      @sum += array[i]
      freq_array.push(@sum)
      i += 1
    end
    freq_array
  end
end
