require_relative "../2019-day 5/new_intcode"

class AmplifierSignal
  def execute(integer_input,phase_settings,input)
    all_phase_combos = phase_settings.permutation.to_a
    outputs = []
    all_phase_combos.each { |e|
      i = 0
      amplifier_input = integer_input
      until i == e.length
        new_input = NewIntcode.new.execute([amplifier_input.dup,e[i]],input.dup)[1]
        amplifier_input = new_input
        i += 1
      end
      outputs.push(amplifier_input) }
    outputs.max
  end
end
