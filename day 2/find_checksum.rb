class FindChecksum
  def send(input)

    array_of_values = []

    second_input = input[1] ? input[1] : ""

    return nil if input.empty?

    i = 0

    while i < input.length
      if input[i].chars.uniq != input[i].chars
        array_of_values.push(1)
        i += 1
      else
        array_of_values.push(0)
        i += 1
      end
    end

    array_of_values.inject(:*)

  end

  def double_inspector(array)
    element_array = array[0].chars
    if element_array.any? { |e| element_array.count(e) == 2  }
      1
    else
      0
    end
  end
end
