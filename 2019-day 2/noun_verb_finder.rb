require_relative "intcode"

class NounVerbFinder
  def execute(opcode,expected_output)
    opcode[1] = 0
    opcode[2] = 0
    base_value = Intcode.new.execute(opcode.dup)[0]
    noun = if noun_differential(opcode).nil?
             0
           else
             (expected_output - base_value) / noun_differential(opcode)
           end
    verb = if noun_differential(opcode).nil?
             0
           else
            noun_value = noun * noun_differential(opcode)
            (expected_output - noun_value - base_value) / verb_differential(opcode)
           end
    [noun,verb]

  end
  def noun_differential(opcode)
    opcode[2] = 0
    opcode[1] = 0
    first_number = Intcode.new.execute(opcode.dup)[0]
    opcode[1] = 1
    second_number = Intcode.new.execute(opcode.dup)[0]
    difference = first_number - second_number
    difference * -1 if difference.negative?
  end
  def verb_differential(opcode)
    opcode[1] = 0
    opcode[2] = 0
    first_number = Intcode.new.execute(opcode.dup)[0]
    opcode[2] = 1
    second_number = Intcode.new.execute(opcode.dup)[0]
    difference = first_number - second_number
    difference * -1 if difference.negative?
  end
end
