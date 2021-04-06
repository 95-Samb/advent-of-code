class AdditionSystem

  def initialize(numbers)
    @numbers = numbers
  end

  def no_sum(preamble)
    return [] if @numbers.empty?
    if @numbers[2] == @numbers[1] + @numbers[0]
      []
    else
      return [@numbers[2]]
    end

  end

end
