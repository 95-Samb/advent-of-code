require_relative "../2019-day 5/new_intcode"

class AmplifierSignal
  def execute(integer_input,phase_settings,input)
    all_phase_combos = phase_settings.permutation.to_a
    NewIntcode.new.execute(integer_input,input)
  end
end
