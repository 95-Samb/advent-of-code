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

    number_to_check = @adapters.select { |num| num < @adapters.max &&
        num >= @adapters.max - 3}

    if @adapters.max >= 4
      next_next_numbers = @adapters.select { |num| num < number_to_check.max &&
        num >= number_to_check.max - 3}
      unless next_next_numbers.empty?
        next_next_next_numbers = @adapters.select { |num| num < next_next_numbers.max &&
          num >= next_next_numbers.max - 3}
      else next_next_next_numbers = []
      end
      return number_to_check.length + next_next_numbers.length + next_next_next_numbers.length
    end

    return 1 if @adapters.length == 1

    return 2 if @adapters.length == 2

    return 4 if @adapters.length == 3

  end

end
