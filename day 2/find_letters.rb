class FindSimilarBoxIdLetters
  def send(input)
    return nil if input.empty?
    string_length = input[0].length
    common_letters = {}
    i = 0
    while i + 1 < input.length
      same_string = (same_letters(input[i],input[i + 1]))
      common_letters[same_string.length] = same_string
      i += 1
    end


    return (common_letters[string_length - 1] || nil)
  end
  def same_letters(first_input,second_input)
    i = 0
    letter_string = ""
    while i < first_input.length
      if first_input[i] == second_input[i]
        letter_string += first_input[i]
        i += 1
      else
        i += 1
      end
    end
    letter_string
  end
end
