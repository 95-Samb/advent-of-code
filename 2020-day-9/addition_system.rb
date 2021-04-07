class AdditionSystem

  def initialize(numbers)
    @numbers = numbers
  end

  def no_pair_sum(preamble)
    return [] if @numbers.empty?
    possible_sums = @numbers[(-1-preamble)..-2].combination(2).to_a.map(&:sum)
    if possible_sums.any?(@numbers[-1])
      []
    else
      return [@numbers[-1]]
    end

  end

end
