# frozen_string_literal: true

class FindSimilarBoxIdLetters
  def send(input)
    return nil if input.empty?

    string_length = input[0].length
    common_letters = {}
    i = 0
    j = 1
    while i + 1 < input.length
      while i + j < input.length
        same_string = same_letters(input[i], input[i + j])
        common_letters[same_string.length] = same_string
        j += 1
      end
      if common_letters[string_length - 1]
        break
      else
        i += 1
        j = 1
      end
    end

    (common_letters[string_length - 1] || nil)
  end

  def same_letters(first_input, second_input)
    i = 0
    letter_string = ''
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
