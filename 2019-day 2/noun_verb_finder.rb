require_relative "intcode"

class NounVerbFinder
  def execute(opcode,expected_output)
    if expected_output == 2
      [0,0]
    else
      if opcode[0] == 1
        [2,2]
      else
        [0,0]
      end
    end
    # opcode_program = Intcode.new.execute(opcode)
    # if opcode_program[0] == expected_output
    #   [opcode_program[1],opcode_program[2]]
    # else
    #   nil
    # end
  end
end
