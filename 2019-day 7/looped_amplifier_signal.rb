require_relative "../intcode_helpers/intcode_instructions"
require_relative "../intcode_helpers/instruction_parameters"


class LoopedAmplifierSignal
  STOP_CODE = 99

  def initialize(intcode,phase_setting,initial_input)
    @intcode = intcode
    @phase_setting = phase_setting
    @signals = phase_setting + [initial_input]
  end

  def create_amplifiers()
    @amplifiers = []
    @phase_setting.length.times {
      @amplifiers.push({:intcode => @intcode.dup,:pointer => 0})
    }
  end

  # class Computer
  #   def init(orchestrator:)
  #     @orchestrator
  #   end

  #   def execute
  #     # does some stuff
  #     @orchestrator.send_message(2, "hello")
  #   end
  # end

  # def orchestrate
  #   @computers = [Computer.new(orchestrator: self), Computer.new(orchestrator: self)]
  # end

  # def send_message(id:, message)
  #   @computers[id].message_from_parent(message)
  # end

  def execute()
    create_amplifiers()
    i = 0
    j = 0

    until @intcode[@amplifiers[i][:pointer]] == STOP_CODE

      instruction = @amplifiers[i][:intcode][@amplifiers[i][:pointer]].digits

      parameters = InstructionParameters.new.identify(
        instruction,
        @amplifiers[i][:pointer],
        @amplifiers[i][:intcode]
      )

      results = IntcodeInstructions.new.execute(instruction[0],@amplifiers[i][:pointer],@amplifiers[i][:intcode],parameters)

      @amplifiers[i][:intcode] = results[:intcode]

      @amplifiers[i][:pointer] = results[:pointer]

      if instruction[0] == 3
        @amplifiers[i][:intcode][parameters[0]] = @signals[j]
      elsif instruction[0] == 4
        #@signals.push(@amplifiers[i][:intcode][parameters[0]])
        puts parameters[0]
        i += 1
        j += 1
      end

      i = 0 if i == @amplifiers.length

    end


    puts @signals
  end
end
