class NewIntcode
  def execute(integer_input,input)
    output = []
    i = 0
    while input[i] != 99
      cycle = if input[i] == 1 || input[i] == 2
                4
              else 2
              end
      if input[i] == 1
        input[input[i + 3]] = input[input[i + 1]] + input[input[i + 2]]
      elsif input[i] == 2
        input[input[i + 3]] = input[input[i + 1]] * input[input[i + 2]]
      end
      input[input[i + 1]] = integer_input if input[i] == 3
      if input[i] == 4
        output.push(input[input[i + 1]])
      end
      i += cycle
    end
    [input,output]
  end
end
