require_relative "fuel_sum"

class SumFuelSum
  def execute(input)
    input.map { |e| e = fuel_for_fuel(e)  }.sum
  end
  def fuel_for_fuel(input)
    extra_fuel = FuelSum.new.execute(input.split)
    sum = extra_fuel
    while extra_fuel != 0
      extra_fuel = FuelSum.new.execute(extra_fuel.to_s.split)
      sum += extra_fuel
    end
    sum
  end
end



