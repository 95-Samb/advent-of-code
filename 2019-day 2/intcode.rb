# frozen_string_literal: true

class Intcode
  def execute(input)
    i = 0
    while input[i] != 99
      input[input[i + 3]] = if input[i] == 1
                              input[input[i + 1]] + input[input[i + 2]]
                            else
                              input[input[i + 1]] * input[input[i + 2]]
                            end
      i += 4
    end
    input
  end
end
