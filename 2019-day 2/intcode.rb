class Intcode
  def execute(input)
    i = 0
    while input[i] != 99
      if input[i] == 1
        input[input[i + 3]] = input[input[i + 1]] + input[input[i + 2]]
      else
        input[input[i + 3]] = input[input[i + 1]] * input[input[i + 2]]
      end
      i += 4
    end
    input
  end
end
