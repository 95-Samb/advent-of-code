class AdapterConfigurator

  def initialize(adapters)
    @adapters = adapters
  end

  def jolt_differences
    return nil if @adapters.empty?
    @adapters[0]
  end

end
