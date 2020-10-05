# frozen_string_literal: true

require_relative '../intcode_helpers/intcode_instructions'
require_relative '../intcode_helpers/instruction_parameters'

class NewIntcode
  STOP_CODE = 99

  def initialize(input, intcode)
    @intcode = intcode
    @input = input
  end

  def execute
    i = 0
    j = 0
    @output = []

    until @intcode[i] == STOP_CODE
      instruction = @intcode[i]

      parameters = InstructionParameters.new.identify(instruction.digits, i, @intcode)

      results = IntcodeInstructions.new.execute(instruction.digits[0], i, @intcode, parameters)

      @intcode = results[:intcode]

      if instruction == 3
        @intcode[@intcode[i + 1]] = @input[j]
        j += 1
        results[:pointer] = i + 2
      end

      if instruction.digits[0] == 4
        if instruction.digits[2] == 1
          @output.push(@intcode[i + 1])
        else
          @output.push(@intcode[@intcode[i + 1]])
        end
        results[:pointer] = i + 2
      end

      i = results[:pointer]
    end

    [@intcode, @output]
  end
end
