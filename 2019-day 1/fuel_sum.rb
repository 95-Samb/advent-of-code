class FuelSum
  def execute(input)
    input.map{ |i| i = mass_calculator(i)}.sum
  end
  def mass_calculator(input)
    mass = (input.to_i / 3) - 2
    mass > 0 ? mass : 0
  end
end
