class NewIntcode
  STOP_CODE = 99

  def initialize(integer_input,input)
    @integer_input = integer_input
    @input = input
    @output = []
  end
  def execute()
    i = 0
    integer_input_tracker = 0

    until @input[i] == STOP_CODE
      instruction = @input[i].digits[0]

      first_parameter_mode = parameter_mode(@input[i].digits[2])
      second_parameter_mode = parameter_mode(@input[i].digits[3])

      first_parameter = @input[i + 1] if first_parameter_mode == "immediate"
      first_parameter = @input[@input[i + 1]] if first_parameter_mode == "position"

      second_parameter = @input[i + 2] if second_parameter_mode == "immediate"
      second_parameter = @input[@input[i + 2]] if second_parameter_mode == "position"

      cycle = [1,2,7,8].include?(instruction) ? 4 : 2

      case instruction
      when 1
        @input[@input[i + 3]] = first_parameter + second_parameter
      when 2
        @input[@input[i + 3]] = first_parameter * second_parameter
      when 3
          @input[@input[i + 1]] = @integer_input[integer_input_tracker]
          integer_input_tracker += 1
      when 4
        @output.push(first_parameter)
      when 5
        if first_parameter != 0
          i = second_parameter
          cycle = 0
        else cycle = 3
        end
      when 6
        if first_parameter == 0
          i = second_parameter
          cycle = 0
        else cycle = 3
        end
      when 7
        first_parameter < second_parameter ?
          @input[@input[i + 3]] = 1 : @input[@input[i + 3]] = 0
      when 8
        first_parameter == second_parameter ?
          @input[@input[i + 3]] = 1 : @input[@input[i + 3]] = 0
      end
      i += cycle
    end
    [@input,@output]
  end
  def parameter_mode(input)
    return "position" if input == 0 || input == nil
    return "immediate" if input == 1
  end

end
