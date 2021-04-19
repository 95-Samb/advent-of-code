class AdapterConfigurator

  def initialize(adapters)
    @adapters = adapters.push(0).sort
  end

  def jolt_differences

    relevant_differences = {one: 0, three: 0}
    if @adapters[1]
      relevant_differences[:one] += 1 if @adapters[1] - @adapters[0] == 1
      relevant_differences[:three] += 1 if @adapters[1] - @adapters[0] == 3
    end
    if @adapters[2]
      relevant_differences[:one] += 1 if @adapters[2] - @adapters[1] == 1
      relevant_differences[:three] += 1 if @adapters[2] - @adapters[1] == 3
    end

    relevant_differences
    # return {one: 0, three: 0} if @adapters.empty?
    # return {one: 0, three: 0} if @adapters[0] == 2
    # return {one: 1,three: 1} if @adapters[1]
    # {one: 1}

  end

end
