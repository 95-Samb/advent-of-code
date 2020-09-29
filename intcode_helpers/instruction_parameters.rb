class InstructionParameters
  def identify(instruction,i,intcode)
    first_parameter_mode = parameter_mode(instruction[2])
    second_parameter_mode = parameter_mode(instruction[3])

    first_parameter = intcode[i + 1] if first_parameter_mode == "immediate"
    first_parameter = intcode[intcode[i + 1]] if first_parameter_mode == "position"

    second_parameter = intcode[i + 2] if second_parameter_mode == "immediate"
    second_parameter = intcode[intcode[i + 2]] if second_parameter_mode == "position"
    [first_parameter,second_parameter]
  end
  def parameter_mode(input)
    return "position" if input == 0 || input == nil
    return "immediate" if input == 1
  end
end
