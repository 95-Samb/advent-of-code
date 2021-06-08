class ShuttleFinder

  def initialize(time,buses)
    @time = time
    @buses = buses
  end

  def earliest_bus
    return nil if @buses.empty?
    [@buses[0],@buses[0]]
  end

end
