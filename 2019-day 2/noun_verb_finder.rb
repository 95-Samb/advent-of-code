require_relative "intcode"

class NounVerbFinder
  def execute(opcode,expected_output)
    opcode[1] = 0
    opcode[2] = 0
    hash = {}

    until opcode[1] == opcode.length
      opcode_program = Intcode.new.execute(opcode.dup)
      hash["#{opcode[1]},#{opcode[2]}"] = opcode_program[0]
      opcode[2] += 1
      if opcode[2] == opcode.length
        opcode[2] = 0
        opcode[1] += 1
      end
    end
    hash.key(expected_output).split(",").map(&:to_i)
  end
end
