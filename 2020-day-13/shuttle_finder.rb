class ShuttleFinder

  def initialize(time,buses)
    @time = time
    @buses = buses
  end

  def earliest_bus
    return nil if @buses.empty?
    return "any bus numpty" if @time == 0

    loop do
      earliest = @buses.select{ |bus| @time % bus == 0}.first
      return [earliest,@time] if earliest
      @time += 1
    end
  end

end
