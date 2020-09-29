require_relative "../intcode_helpers/intcode_instructions"
require_relative "../intcode_helpers/instruction_parameters"


class IntcodeComputer
  STOP_CODE = 99

  def initialize(intcode)
    @intcode = intcode
  end

  def execute()
    i = 0

    until @intcode[i] == STOP_CODE
      instruction = @intcode[i].digits[0]

      parameters = InstructionParameters.new.identify(instruction, i, @intcode)

      results = IntcodeInstructions.new.execute(instruction,i,@intcode,parameters)

      @intcode = results[:intcode]

      i = results[:pointer]
    end

    @intcode
  end
end
