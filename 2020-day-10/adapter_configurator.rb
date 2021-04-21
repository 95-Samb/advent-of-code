class AdapterConfigurator

  def initialize(adapters)
    @adapters = adapters.push(0).sort
  end

  def jolt_differences

    relevant_differences = {one: 0, three: 0}
    i = 1

    until i == @adapters.length

      if @adapters[i]
        relevant_differences[:one] += 1 if @adapters[i] - @adapters[i - 1] == 1
        relevant_differences[:three] += 1 if @adapters[i] - @adapters[i - 1] == 3
      end

      i += 1

    end

    relevant_differences

  end

  def charging_arrangements
    @adapters.shift

    return 0 if @adapters.empty?

    (1..@adapters.length).inject(:*)

  end

end
