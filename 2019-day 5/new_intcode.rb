class NewIntcode
  def execute(integer_input,input)
    output = []
    i = 0
    while input[i] != 99
      instruction = input[i].digits[0]
      cycle = if instruction == 1 || instruction == 2
                4
              else 2
              end
      if instruction == 1
        input[input[i + 3]] = input[input[i + 1]] + input[input[i + 2]]
      elsif instruction == 2
        input[input[i + 3]] = input[input[i + 1]] * input[input[i + 2]]
      end
      input[input[i + 1]] = integer_input if instruction == 3
      if instruction == 4
        output.push(input[input[i + 1]])
      end
      i += cycle
    end
    [input,output]
  end
end
