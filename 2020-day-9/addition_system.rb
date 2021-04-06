class AdditionSystem

  def initialize(numbers)
    @numbers = numbers
  end

  def no_sum(preamble)
    return [] if @numbers.empty?
    possible_sums = @numbers[0..-2].combination(2).to_a.map(&:sum)
    if possible_sums.any?(@numbers[-1])
      []
    else
      return [@numbers[2]]
    end

  end

end
