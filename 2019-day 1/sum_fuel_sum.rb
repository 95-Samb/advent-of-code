require_relative "fuel_sum"

class SumFuelSum
  def execute(input)
    FuelSum.new.execute(input) + 1
  end
end
