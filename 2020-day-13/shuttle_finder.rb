class ShuttleFinder

  def initialize(time,buses)
    @time = time
    @buses = buses
  end

  def earliest_bus
    return nil if @buses.empty?
    earliest = @buses.select{ |bus| @time % bus == 0}.first
    [earliest,earliest]
  end

end
