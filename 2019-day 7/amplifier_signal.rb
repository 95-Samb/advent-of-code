require_relative "../2019-day 5/new_intcode"

class AmplifierSignal

  def looped_max_signal(phase_settings,integer_input,input)
    all_phase_combos = phase_settings.permutation.to_a
    signals = []
    all_phase_combos.each { |e| signals.push(phase_setting_output(e,integer_input,input))  }
    signals.max
  end

  def phase_setting_output(phase_setting,integer_input,input)
    i = 0
    while i < phase_setting.length
      output = NewIntcode.new.execute([phase_setting[i],integer_input],input.dup)[1][0]
      integer_input = output
      i += 1
    end
    output
  rescue
    0
  end


end
