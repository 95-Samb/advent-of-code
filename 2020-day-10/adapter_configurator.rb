class AdapterConfigurator

  def initialize(adapters)
    @adapters = adapters
  end

  def jolt_differences

    return nil if @adapters.empty?
    return {one: 0, three: 0} if @adapters[0] == 2
    return {one: 1,three: 1} if @adapters[1]
    {one: 1}

  end

end
