class NewIntcode
  def execute(integer_input,input)
    output = []
    i = 0
    while input[i] != 99
      instruction = input[i].digits[0]
      first_parameter_state = input[i].digits[2]
      second_parameter_state = input[i].digits[3]
      cycle = if instruction == 1 || instruction == 2 ||
              instruction == 7 || instruction == 8
                4
              elsif instruction == 3 || instruction == 4
                2
              end
      if first_parameter_state == 1
        first_parameter = input[i + 1]
      else first_parameter = input[input[i + 1]]
      end
      if second_parameter_state == 1
        second_parameter = input[i + 2]
      else second_parameter = input[input[i + 2]]
      end

      if instruction == 1
        input[input[i + 3]] = first_parameter + second_parameter
      elsif instruction == 2
        input[input[i + 3]] = first_parameter * second_parameter
      end
      input[input[i + 1]] = integer_input if instruction == 3
      output.push(input[input[i + 1]]) if instruction == 4
      if instruction == 5
        if first_parameter != 0
          i = second_parameter
          cycle = 0
        else cycle = 3
        end
      end
      if instruction == 6
        if first_parameter == 0
          i = second_parameter
          cycle = 0
        else cycle = 3
        end
      end
      if instruction == 7
        if first_parameter < second_parameter
          input[input[i + 3]] = 1
        else input[input[i + 3]] = 0
        end
      end
      if instruction == 8
        if first_parameter ==second_parameter
          input[input[i + 3]] = 1
        else input[input[i + 3]] = 0
        end
      end
      i += cycle
    end
    [input,output]
  end
end
