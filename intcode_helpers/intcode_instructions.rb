class IntcodeInstructions
  def execute(instruction,i,intcode,parameters)
    @cycle = [1,2,7,8].include?(instruction) ? 4 : 2
    case instruction
      when 1
        intcode[intcode[i + 3]] = parameters[0] + parameters[1]
      when 2
        intcode[intcode[i + 3]] = parameters[0] * parameters[1]
      when 5
        if parameters[0] != 0
          i = parameters[1]
          @cycle = 0
        else @cycle = 3
        end
      when 6
        if parameters[0] == 0
          i = parameters[1]
          @cycle = 0
        else @cycle = 3
        end
      when 7
        parameters[0] < parameters[1] ?
          intcode[intcode[i + 3]] = 1 : intcode[intcode[i + 3]] = 0
      when 8
        parameters[0] == parameters[1] ?
        intcode[intcode[i + 3]] = 1 : intcode[intcode[i + 3]] = 0
    end
    i += @cycle
    {:intcode => intcode,:pointer => i}
  end
end
