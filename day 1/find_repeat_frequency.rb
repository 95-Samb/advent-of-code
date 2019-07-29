# frozen_string_literal: true

#answer = 71961
class FindRepeatFrequency
  def execute(input)
    @positive_array_sum = input.select(&:positive?).sum.abs
    @negative_array_sum = input.select(&:negative?).sum.abs
    return 0 if input == [0]

    return nil if same_signs?(input)

    return nil if doesnt_converge?(input)

    frequency_array(input)
  end

  def same_signs?(array)
    array.all?(&:positive?) || array.all?(&:negative?)
  end

  def doesnt_converge?(array)
    return true if @positive_array_sum * 2 < @negative_array_sum
    return true if @negative_array_sum * 2 < @positive_array_sum
  end

  def frequency_array(array)
    @sum = 0
    i = 0
    freq_array = [0]
    while freq_array.uniq == freq_array
      if i == array.length
        i = 0
        rejector(freq_array)
      end
      @sum += array[i]
      freq_array.push(@sum)
      i += 1
    end

    freq_array.last
  end
  def rejector(array)
    if @negative_array_sum > @positive_array_sum
      array.reject! {|n| n > array.sum + @positive_array_sum}
    elsif  @positive_array_sum > @negative_array_sum
      array.reject! { |n| n < array.sum + @negative_array_sum }
    else array
    end
  end

end
