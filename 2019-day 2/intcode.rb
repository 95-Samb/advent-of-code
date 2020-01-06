class Intcode
  def execute(input)
    i = 0
    if input[i] == 1
      input[input[i + 3]] = input[input[i + 1]] + input[input[i + 2]]
    else
      input[input[i + 3]] = input[input[i + 1]] * input[input[i + 2]]
    end
    if input[4] != 99
      i += 4
      if input[i] == 1
        input[input[i + 3]] = input[input[i + 1]] + input[input[i + 2]]
      else
        input[input[i + 3]] = input[input[i + 1]] * input[input[i + 2]]
      end
    end
    input
  end
end
