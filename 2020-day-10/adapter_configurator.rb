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

    return 0 if @adapters == [0]

    number_to_check = @adapters.select { |num| num < @adapters.max &&
        num >= @adapters.max - 3}

    number_hash = {}

    path_total = 0

    number_to_check.each { |e| number_hash[e] = 1}

    @adapters.length.times do
      new_numbers = []
      new_numbers_hash = {}
      number_to_check.each { |e|
        paths = @adapters.select { |num| num < e && num >= e - 3  }
        paths.each { |num|
          if new_numbers_hash[num]
            new_numbers_hash[num] += number_hash[e]
          else
            new_numbers_hash[num] = number_hash[e]
          end }
        new_numbers.push(paths)
      }

      number_to_check = new_numbers.dup.flatten.uniq
      path_total += new_numbers_hash[0] if new_numbers_hash[0]
      number_hash = new_numbers_hash.dup

    end

    path_total += 1 if @adapters.max <= 3

    return path_total

  end

end
