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
    (array.max.abs * array.length + 2).times do # more work on times to do loop
      #not as efficient as it could be
      if i == array.length
        i = 0
      end
      @sum += array[i]
      freq_array.push(@sum)
      i += 1
    end

    find_duplicate(freq_array)
  end

  def find_duplicate(array)
  map = {}
  dup = nil
  array.each do |v|
    map[v] = (map[v] || 0 ) + 1

    if map[v] > 1
      dup = v
      break
    end
  end

  return dup
end

end
