

class NewIntcode
  def initialize(integer_input,input)
    @integer_input = integer_input
    @input = input
    @output = []
  end
  def execute()
    i = 0
    integer_input_tracker = 0
    while @input[i] != 99

      instruction = @input[i].digits[0]
      first_parameter_state = @input[i].digits[2]
      second_parameter_state = @input[i].digits[3]
      if first_parameter_state == 1
        first_parameter = @input[i + 1]
      else first_parameter = @input[@input[i + 1]]
      end
      if second_parameter_state == 1
        second_parameter = @input[i + 2]
      else second_parameter = @input[@input[i + 2]]
      end

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
  def new_integer_input(input)
    @integer_input.push(input)
  end
end
