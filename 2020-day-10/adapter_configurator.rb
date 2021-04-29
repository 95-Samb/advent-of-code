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
    @adapters

    return 0 if @adapters.empty?

    number_to_check = @adapters.select { |num| num < @adapters.max &&
        num >= @adapters.max - 3}

    @adapters.length.times do
      number_to_check.map! { |e|
        if e == 0
          0
        else
          e = @adapters.select { |num| num < e && num >= e - 3  }
        end
        }
      number_to_check.flatten!
    end

    return number_to_check.length

  end

end
