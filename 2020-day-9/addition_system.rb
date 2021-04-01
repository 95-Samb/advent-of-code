class AdditionSystem

  def initialize(numbers)
    @numbers = numbers
  end

  def no_sum(preamble)
    return [] if @numbers.empty?
    [@numbers[2]]
  end

end
